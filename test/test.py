
# SPDX-FileCopyrightText: Copyright 2024 Darryl L. Miles
# SPDX-License-Identifier: Apache-2.0

import sys
import random

import cocotb
from cocotb.clock import Clock
from cocotb.binary import BinaryValue
from cocotb.triggers import ClockCycles

from cocotb_stuff.cocotbutil import *

DEBUG_LEVEL = 1

IMM_OR_REG_MASK = 0x18
IMM = 0x00
REG = 0x18

OP_DIV    = 0x00
OP_MUL    = 0x80
OP_SIGNED = 0x40

MODE_MASK = 0xc0
MULU = 0x00
MULS = 0x40
DIVU = 0x80
DIVS = 0xc0

ZERO_FILL_BETWEEN = True
ZERO_VALUE        = 0x00

# The module's design full width
X_WIDTH_FULL  = 8
X_SHIFT       = 0
X_WIDTH_MASK  = (1 << X_WIDTH_FULL) - 1	# 0x00ff

Y_WIDTH_FULL  = 8
Y_SHIFT       = 8
Y_WIDTH_MASK  = (1 << Y_WIDTH_FULL) - 1	# 0x00ff

P_FULL_WIDTH  = X_WIDTH_FULL + Y_WIDTH_FULL
P_FULL_MASK   = (1 <<  P_FULL_WIDTH   ) - 1	# 0xffff
P_FULL_MSB    = (1 << (P_FULL_WIDTH-1))
P_FULL_EXTEND = (P_FULL_MASK & ~P_FULL_WIDTH)


# The testing width
# This helps with testing (instead of checking all the space) we limit the width to get a quick result
#X_WIDTH   = 4
X_WIDTH   = 8
X_MASK    = (1 << X_WIDTH) - 1		# 0x00ff
X_MSB     = (1 << (X_WIDTH-1))		# 0x0008
X_EXTEND  = (X_WIDTH_MASK & ~X_MASK)
X_MASK_SKIP  = X_EXTEND			# 0x00f0
# shifted version
Xs_MASK   = X_MASK << X_SHIFT		# 0x00ff
Xs_MSB    = X_MSB << X_SHIFT		# 0x0008
Xs_EXTEND = X_EXTEND << X_SHIFT		# 0x00f0
Xs_MASK_SKIP = X_MASK_SKIP << X_SHIFT

#Y_WIDTH   = 4
Y_WIDTH   = 8
Y_MASK    = (1 <<  Y_WIDTH   ) - 1	# 0x00ff
Y_MSB     = (1 << (Y_WIDTH-1))		# 0x0008
Y_EXTEND  = (Y_WIDTH_MASK & ~Y_MASK)	# 0x00f0
Y_MASK_SKIP  = Y_EXTEND
# shifted version
Ys_MASK   = Y_MASK << Y_SHIFT		# 0xff00
Ys_MSB    = Y_MSB << Y_SHIFT		# 0x0800
Ys_EXTEND = Y_EXTEND << Y_SHIFT		# 0xf000
Ys_MASK_SKIP = Y_MASK_SKIP << Y_SHIFT

P_WIDTH   = X_WIDTH + Y_WIDTH
P_MASK    = (1 <<  P_WIDTH   ) - 1
P_MSB     = (1 << (P_WIDTH-1))
P_EXTEND  = (P_MASK & ~P_WIDTH)

ADDR_RANGE   = 2
ADDR_SECOND  = 1    # the index into RANGE of 2nd argument
ADDR_MASK    = 0x07 # 0x0f using bit3 for imm_or_reg
ADDR_FIRST   = 0
ADDR_LAST    = ADDR_FIRST + (ADDR_RANGE - 1)

assert X_WIDTH_FULL >= X_WIDTH
assert Y_WIDTH_FULL >= Y_WIDTH

# This exists to convert testing range to<>from hardware DUT range
# FIXME compute this (this is for 4-bit signed)
#if X_WIDTH == 4:
#    SIGNED_TEST_MAX = 7
#    SIGNED_TEST_MIN = -8
#    SIGNED_TEST_SUBTRACT = 16
#    SIGNED_TEST_MULTIPLY_PSUBTRACT = 256
#    SIGNED_TEST_MULTIPLY_PMAX = 127
#    SIGNED_TEST_MULTIPLY_PMIN = -128

if X_WIDTH == 8:
    SIGNED_TEST_MAX = 127
    SIGNED_TEST_MIN = -128
    SIGNED_TEST_SUBTRACT = 256 # from +128 to -128
    SIGNED_TEST_MULTIPLY_PSUBTRACT = 65536
    SIGNED_TEST_MULTIPLY_PMAX = 32767
    SIGNED_TEST_MULTIPLY_PMIN = -32768


uo_out_hi8 = 0
uo_out_lo8 = 0
ui_in_lo8 = 0
ui_in_hi8 = 0

pfail_count = 0
qfail_count = 0
rfail_count = 0
ediv0fail_count = 0
eoverfail_count = 0


def debug_info(dut, level: int = 1, *args) -> None:
    if DEBUG_LEVEL >= level:
        dut._log.info(*args)


def report_summary(dut) -> None:
    success = True
    if pfail_count > 0:
        dut._log.error(f"    PFAIL count = {pfail_count} (Multipy Product)")
        success = False
    else:
        dut._log.info(f"    PFAIL count = {pfail_count} (Multipy Product)")

    if qfail_count > 0:
        dut._log.error(f"    QFAIL count = {qfail_count} (Divider Quotient)")
        success = False
    else:
        dut._log.info(f"    QFAIL count = {qfail_count} (Divider Quotient)")
    if rfail_count > 0:
        dut._log.error(f"    RFAIL count = {rfail_count} (Divider Remainder)")
        success = False
    else:
        dut._log.info(f"    RFAIL count = {rfail_count} (Divider Remainder)")
    if ediv0fail_count > 0:
        dut._log.error(f"EDIV0FAIL count = {ediv0fail_count}")
        success = False
    else:
        dut._log.info(f"EDIV0FAIL count = {ediv0fail_count}")
    if eoverfail_count > 0:
        dut._log.error(f"EOVERFAIL count = {eoverfail_count}")
        success = False
    else:
        dut._log.info(f"EOVERFAIL count = {eoverfail_count}")

    assert success, f"The failure counts above are not all zero"


# Consumers should assume system 32/64 bit limits
def int_value_trunc(v: int, width: int) -> int:
    assert width > 0
    UMAX = (1 << width) - 1
    return v & UMAX


# Consumers should assume system 32/64 bit limits
def int_value_strunc(v: int, width: int) -> int:
    assert width > 0
    MSB = 1 << (width-1)
    SMAX = MSB - 1
    assert sys.maxsize == 0x7fffffff or sys.maxsize == 0x7fffffffffffffff
    ALLSET = ~0
    # no AssertionError: assert (-1 == 4294967295 or -1 == 18446744073709551615)
    #assert ALLSET == 0xffffffff or ALLSET == 0xffffffffffffffff
    sext = 0 if((v & MSB) == 0) else -1
    return ((sext & ~SMAX) | (v & SMAX)) & ALLSET


def int_value_su(v: int, width: int, can_truncate: bool = True) -> int:
    assert width > 0
    UMAX = (1 << width) - 1
    trunc = v & UMAX
    if trunc != v:
        assert can_truncate, f"int_value_us(v={v}, width={width}, can_truncate={can_truncate}, need to truncate to {trunc} [0x{trunc:x}]"        
    if trunc < 0:
        return trunc - UMAX - 1
    return trunc


# Does not wrap unsigned range that exceed signed MAX
def int_value_su_strict(v: int, width: int, can_truncate: bool = True) -> int:
    assert width > 0
    UMAX = (1 <<  width   ) - 1
    SMAX = (1 << (width-1)) - 1
    trunc = v & SMAX
    if trunc != v:
        assert can_truncate, f"int_value_us(v={v}, width={width}, can_truncate={can_truncate}, need to truncate to {trunc} [0x{trunc:x}]"        
    if trunc < 0:
        return trunc - UMAX - 1
    return trunc


def int_value_us(v: int, width: int, can_truncate: bool = True) -> int:
    assert width > 0
    UMAX = (1 << width) - 1
    trunc = v & UMAX
    if trunc != v:
        assert can_truncate, f"int_value_us(v={v}, width={width}, can_truncate={can_truncate}, need to truncate to {trunc} [0x{trunc:x}]"        
    MSB = 1 << (width-1)
    if trunc >= MSB:
        return trunc - UMAX - 1
    return trunc


def int_value_us_strict(v: int, width: int, can_truncate: bool = True) -> int:
    assert width > 0
    SMAX = (1 << (width-1)) - 1
    trunc = v & SMAX
    if trunc != v:
        assert can_truncate, f"int_value_us(v={v}, width={width}, can_truncate={can_truncate}, need to truncate to {trunc} [0x{trunc:x}]"        
    MSB = 1 << (width-1)
    if trunc >= MSB:
        return trunc - SMAX - 1
    return trunc


ss = int_value_trunc(16, 4)
print(f"ut[ 16]={ss:5d}  0x{ss:x}")
ss = int_value_trunc(15, 4)
print(f"ut[ 15]={ss:5d}  0x{ss:x}")
ss = int_value_trunc(8, 4)
print(f"ut[  8]={ss:5d}  0x{ss:x}")
ss = int_value_trunc(7, 4)
print(f"ut[  7]={ss:5d}  0x{ss:x}")
ss = int_value_trunc(1, 4)
print(f"ut[  1]={ss:5d}  0x{ss:x}")
ss = int_value_trunc(0, 4)
print(f"ut[  0]={ss:5d}  0x{ss:x}")
ss = int_value_trunc(-1, 4)
print(f"ut[ -1]={ss:5d}  0x{ss:x}")
ss = int_value_trunc(-7, 4)
print(f"ut[ -7]={ss:5d}  0x{ss:x}")
ss = int_value_trunc(-8, 4)
print(f"ut[ -8]={ss:5d}  0x{ss:x}")
ss = int_value_trunc(-9, 4)
print(f"ut[ -9]={ss:5d}  0x{ss:x}")
ss = int_value_trunc(-15, 4)
print(f"ut[-15]={ss:5d}  0x{ss:x}")
ss = int_value_trunc(-16, 4)
print(f"ut[-16]={ss:5d}  0x{ss:x}")
print("")

ss = int_value_strunc(16, 4)
print("st[ 16]={:#5d}  0x{:#x}".format(ss, ss))
ss = int_value_strunc(15, 4)
print("st[ 15]={:#5d}  0x{:#x}".format(ss, ss))
ss = int_value_strunc(8, 4)
print("st[  8]={:#5d}  0x{:#08x}".format(ss, ss))
ss = int_value_strunc(7, 4)
print(f"st[  7]={ss:5d}  0x{ss:x}")
ss = int_value_strunc(1, 4)
print(f"st[  1]={ss:5d}  0x{ss:x}")
ss = int_value_strunc(0, 4)
print(f"st[  0]={ss:5d}  0x{ss:x}")
ss = int_value_strunc(-1, 4)
print(f"st[ -1]={ss:5d}  0x{ss:x}")
ss = int_value_strunc(-7, 4)
print(f"st[ -7]={ss:5d}  0x{ss:x}")
ss = int_value_strunc(-8, 4)
print(f"st[ -8]={ss:5d}  0x{ss:x}")
ss = int_value_strunc(-9, 4)
print(f"st[ -9]={ss:5d}  0x{ss:x}")
ss = int_value_strunc(-15, 4)
print(f"st[-15]={ss:5d}  0x{ss:x}")
ss = int_value_strunc(-16, 4)
print(f"st[-16]={ss:5d}  0x{ss:x}")
print("")


ss = int_value_su(16, 4)
print(f"su[ 16]={ss:5d}  0x{ss:x}")
ss = int_value_su(15, 4)
print(f"su[ 15]={ss:5d}  0x{ss:x}")
ss = int_value_su(8, 4)
print(f"su[  8]={ss:5d}  0x{ss:x}")
ss = int_value_su(7, 4)
print(f"su[  7]={ss:5d}  0x{ss:x}")
ss = int_value_su(1, 4)
print(f"su[  1]={ss:5d}  0x{ss:x}")
ss = int_value_su(0, 4)
print(f"su[  0]={ss:5d}  0x{ss:x}")
ss = int_value_su(-1, 4)
print(f"su[ -1]={ss:5d}  0x{ss:x}")
ss = int_value_su(-7, 4)
print(f"su[ -7]={ss:5d}  0x{ss:x}")
ss = int_value_su(-8, 4)
print(f"su[ -8]={ss:5d}  0x{ss:x}")
ss = int_value_su(-9, 4)
print(f"su[ -9]={ss:5d}  0x{ss:x}")
ss = int_value_su(-15, 4)
print(f"su[-15]={ss:5d}  0x{ss:x}")
ss = int_value_su(-16, 4)
print(f"su[-16]={ss:5d}  0x{ss:x}")
print("")

ss = int_value_su_strict(16, 4)
print(f"SU[ 16]={ss:5d}  0x{ss:x}")
ss = int_value_su_strict(15, 4)
print(f"SU[ 15]={ss:5d}  0x{ss:x}")
ss = int_value_su_strict(8, 4)
print(f"SU[  8]={ss:5d}  0x{ss:x}")
ss = int_value_su_strict(7, 4)
print(f"SU[  7]={ss:5d}  0x{ss:x}")
ss = int_value_su_strict(1, 4)
print(f"SU[  1]={ss:5d}  0x{ss:x}")
ss = int_value_su_strict(0, 4)
print(f"SU[  0]={ss:5d}  0x{ss:x}")
ss = int_value_su_strict(-1, 4)
print(f"SU[ -1]={ss:5d}  0x{ss:x}")
ss = int_value_su_strict(-7, 4)
print(f"SU[ -7]={ss:5d}  0x{ss:x}")
ss = int_value_su_strict(-8, 4)
print(f"SU[ -8]={ss:5d}  0x{ss:x}")
ss = int_value_su_strict(-9, 4)
print(f"SU[ -9]={ss:5d}  0x{ss:x}")
ss = int_value_su_strict(-15, 4)
print(f"SU[-15]={ss:5d}  0x{ss:x}")
ss = int_value_su_strict(-16, 4)
print(f"SU[-16]={ss:5d}  0x{ss:x}")
print("")

ss = int_value_us(16, 4)
print(f"us[ 16]={ss:5d}  0x{ss:x}")
ss = int_value_us(15, 4)
print(f"us[ 15]={ss:5d}  0x{ss:x}")
ss = int_value_us(8, 4)
print(f"us[  8]={ss:5d}  0x{ss:x}")
ss = int_value_us(7, 4)
print(f"us[  7]={ss:5d}  0x{ss:x}")
ss = int_value_us(1, 4)
print(f"us[  1]={ss:5d}  0x{ss:x}")
ss = int_value_us(0, 4)
print(f"us[  0]={ss:5d}  0x{ss:x}")
ss = int_value_us(-1, 4)
print(f"us[ -1]={ss:5d}  0x{ss:x}")
ss = int_value_us(-7, 4)
print(f"us[ -7]={ss:5d}  0x{ss:x}")
ss = int_value_us(-8, 4)
print(f"us[ -8]={ss:5d}  0x{ss:x}")
ss = int_value_us(-9, 4)
print(f"us[ -9]={ss:5d}  0x{ss:x}")
ss = int_value_us(-15, 4)
print(f"us[-15]={ss:5d}  0x{ss:x}")
ss = int_value_us(-16, 4)
print(f"us[-16]={ss:5d}  0x{ss:x}")
print("")

ss = int_value_us_strict(16, 4)
print(f"US[ 16]={ss:5d}  0x{ss:x}")
ss = int_value_us_strict(15, 4)
print(f"US[ 15]={ss:5d}  0x{ss:x}")
ss = int_value_us_strict(8, 4)
print(f"US[  8]={ss:5d}  0x{ss:x}")
ss = int_value_us_strict(7, 4)
print(f"US[  7]={ss:5d}  0x{ss:x}")
ss = int_value_us_strict(1, 4)
print(f"US[  1]={ss:5d}  0x{ss:x}")
ss = int_value_us_strict(0, 4)
print(f"US[  0]={ss:5d}  0x{ss:x}")
ss = int_value_us_strict(-1, 4)
print(f"US[ -1]={ss:5d}  0x{ss:x}")
ss = int_value_us_strict(-7, 4)
print(f"US[ -7]={ss:5d}  0x{ss:x}")
ss = int_value_us_strict(-8, 4)
print(f"US[ -8]={ss:5d}  0x{ss:x}")
ss = int_value_us_strict(-9, 4)
print(f"US[ -9]={ss:5d}  0x{ss:x}")
ss = int_value_us_strict(-15, 4)
print(f"US[-15]={ss:5d}  0x{ss:x}")
ss = int_value_us_strict(-16, 4)
print(f"US[-16]={ss:5d}  0x{ss:x}")
print("")


# validate = False, when the non-result side of the HI/LO loading state does not produce a valid result
def report(dut, ui_in, uio_in, addr: int, expect_yx6: int = None, validate: bool = True) -> None:
    global uo_out_hi8
    global uo_out_lo8
    global ui_in_lo8
    global ui_in_hi8
    
    global pfail_count
    global qfail_count
    global rfail_count
    global ediv0fail_count
    global eoverfail_count

    uio_out = dut.uio_out.value
    uo_out = dut.uo_out.value

    if addr > 0:
        uo_out_hi8 = uo_out.integer
        ui_in_hi8 = ui_in.integer
    else:
        uo_out_lo8 = uo_out.integer
        ui_in_lo8 = ui_in.integer

    # FIXME move these to a helper class to manage configuration and conversion
    SIGNED_MAX = 127
    SIGNED_MIN = -128
    SIGNED_SUBTRACT = 256 # from +128 to -128
    SIGNED_MULTIPLY_PSUBTRACT = 65536
    SIGNED_MULTIPLY_PMAX = 32767
    SIGNED_MULTIPLY_PMIN = -32768

    #SIGNED_MAX = 7
    #SIGNED_MIN = -8
    #SIGNED_SUBTRACT = 16 # from +128 to -128
    #SIGNED_MULTIPLY_PSUBTRACT = 256
    #SIGNED_MULTIPLY_PMAX = 127
    #SIGNED_MULTIPLY_PMIN = -128

    s_eover = 'EOVER' if(uio_out.is_resolvable and uio_out & 0x10) else '     '
    s_ediv0 = 'EDIV0' if(uio_out.is_resolvable and uio_out & 0x20) else '     '

    if uio_in & 0x02:
        s_imgreg = 'R'
    else:
        s_imgreg = 'I'

    if uio_in & 0x40:
        opsigned = True
        s_ounsign = 'SIGNED'
    else:
        opsigned = False
        s_ounsign = 'UNSIGN'

    # FIXME parameterisze all the 0xff, 128, 256, 32768 values
    if uio_in & 0x80:
        s_omuldiv = 'DIV'
        dend = ui_in_hi8 & 0xff
        dsor = ui_in_lo8 & 0xff
        #if addr > 0:	# FIXME maybe we can just use q=lo8, r=hi8 here
        #    r = uo_out_lo8
        #    q = int(uo_out & 0xff)
        #else:
        #    r = int(uo_out & 0xff)
        #    q = uo_out_hi8
        r = uo_out_lo8
        q = uo_out_hi8
        if opsigned:
            dend = dend if(dend <= SIGNED_MAX) else dend - SIGNED_SUBTRACT
            dsor = dsor if(dsor <= SIGNED_MAX) else dsor - SIGNED_SUBTRACT
            q = q if(q <= SIGNED_MAX) else q - SIGNED_SUBTRACT
            r = r if(r <= SIGNED_MAX) else r - SIGNED_SUBTRACT
            # FIXME only is partial WIDTH testing
            #dsor &= X_MASK
            #dend &= Y_MASK
            #r &= X_MASK
            #q &= Y_MASK
            q = q if(q <= SIGNED_TEST_MAX) else q - SIGNED_TEST_SUBTRACT
            r = r if(r <= SIGNED_TEST_MAX) else r - SIGNED_TEST_SUBTRACT

        if dsor == 0:
            exp_ediv0 = 'EDIV0'
            exp_q = None # quash indicator
            exp_r = None # quash indicator
        else:
            exp_ediv0 = '     '
            #exp_q = dend // dsor # integer division operator # did not work
            exp_q = int(dend / dsor) # floor by truncation
            exp_r = abs(dend) % abs(dsor)
            if opsigned:
                exp_q = exp_q if(exp_q <= SIGNED_TEST_MAX) else exp_q - SIGNED_TEST_SUBTRACT
                exp_r = exp_r if(exp_r <= SIGNED_TEST_MAX) else exp_r - SIGNED_TEST_SUBTRACT

                # remainder SIGN correction
                if dend < 0 and exp_r >= 0:
                    exp_r = -exp_r
                elif dend >= 0 and exp_r < 0:
                    exp_r = -exp_r

        exp_eover = None # Module does not support at this time


        expect_hex_str = f"{exp_ediv0}       " if(exp_ediv0 == 'EDIV0') else f" {exp_q:#04x} r  {exp_r:#04x}"
        expect_uns_str = f"{exp_ediv0}       " if(exp_ediv0 == 'EDIV0') else f" {exp_q:#04d} r  {exp_r:#04d}"
        expect_sig_str = f"{exp_ediv0}       " if(exp_ediv0 == 'EDIV0') else f"{exp_q:#05d} r {exp_r:#05d}"
        actual_hex_str = f"{s_ediv0}       "   if(s_ediv0   == 'EDIV0') else f" {q:#04x} r  {r:#04x}"
        actual_uns_str = f"{s_ediv0}       "   if(s_ediv0   == 'EDIV0') else f" {q:#04d} r  {r:#04d}"
        actual_sig_str = f"{s_ediv0}       "   if(s_ediv0   == 'EDIV0') else f"{q:#05d} r {r:#05d}"
        # FIXME UHEX and SHEX
        debug_info(dut, 3, f"EXPECT      HEX  {dend:04x} /  {dsor:04x} = {expect_hex_str}  ACTUAL {actual_hex_str}")
        debug_info(dut, 3, f"EXPECT UNSIGNED  {int_value_su(dend, 4):04d} /  {int_value_su(dsor, 4):04d} = {expect_uns_str}  ACTUAL {actual_uns_str}")
        debug_info(dut, 3, f"EXPECT   SIGNED {int_value_trunc(dend, 4):05d} / {int_value_trunc(dsor, 4):05d} = {expect_sig_str}  ACTUAL {actual_sig_str}")

        s_quot  = '     '
        s_remr  = '     '
        # s_ediv0 is setup above
        # s_eover is setup above
        passfail = '     '
        bf_passfail = None

        if validate:
            passfail = ' PASS'
            bf_passfail = False

            if exp_q is not None and exp_q != q:
                s_quot = 'QFAIL'
                qfail_count += 1
                passfail = ' FAIL'
                bf_passfail = True

            if exp_r is not None and exp_r != r:
                s_remr = 'RFAIL'
                rfail_count += 1
                passfail = ' FAIL'
                bf_passfail = True

            if exp_ediv0 is not None and exp_ediv0 != s_ediv0:
                s_ediv0 = 'EDIV0FAIL'
                ediv0fail_count += 1
                passfail = ' FAIL'
                bf_passfail = True

            if exp_eover is not None and exp_eover != s_eover:
                s_eover = 'EOVERFAIL'
                eoverfail_count += 1
                passfail = ' FAIL'
                bf_passfail = True

        dut._log.info(f"in={str(ui_in)} {str(uio_in)}  out={str(uo_out)} {str(uio_out)}   {s_omuldiv} {s_ounsign} {s_imgreg} {dend:5d} / {dsor:5d} = {q:4d} r {r:4d}{passfail} {s_ediv0} {s_eover} {s_quot} {s_remr}")

        debug_wire(dut, bf_passfail)	# indicator asserts and looks back at previous computation at decision point
    else:
        s_omuldiv = 'MUL'
        #if addr > 0:	# FIXME maybe we can just use q=lo8, r=hi8 here
        #    a = ui_in_lo8
        #    b = ui_in.integer & 0xff
        #else:
        #    a = ui_in.integer & 0xff
        #    b = ui_in_hi8
        a = ui_in_lo8
        b = ui_in_hi8
        p = int(((uo_out_hi8 & 0xff) << Y_SHIFT) | (uo_out_lo8 & 0xff))
        if opsigned:
            a = a if(a <= SIGNED_MAX) else a - SIGNED_SUBTRACT
            b = b if(b <= SIGNED_MAX) else b - SIGNED_SUBTRACT
            p = p if(p <= SIGNED_MULTIPLY_PMAX) else p - SIGNED_MULTIPLY_PSUBTRACT
            # FIXME only for partial WIDTH testing?
            #a &= X_MASK
            #b &= Y_MASK
            exp_p = a * b
            # FIXME only for partial WIDTH testing (sign-extend expectation)
            #if (exp_p & P_MSB) == 0
            #    exp_p |= P_EXTEND
            #exp_p = exp_p if(exp_p <= SIGNED_MULTIPLY_PMAX) else exp_p - SIGNED_MULTIPLY_PSUBTRACT
            p = p if(p <= SIGNED_TEST_MULTIPLY_PMAX) else p - SIGNED_TEST_MULTIPLY_PSUBTRACT
            # FIXME only for partial WIDTH testing?
            #a &= X_MASK
            #b &= Y_MASK
            #p &= 0xf # P_TEST_MASK
            debug_info(dut, 3, f"DEBUG SIGNED {a} x {b} = {p} [{exp_p}] SIGNED_MAX={SIGNED_MAX} SIGNED_SUBTRACT={SIGNED_SUBTRACT}")
        else:
            exp_p = a * b

        s_prod = '     '
        passfail = '     '
        bf_passfail = None

        if validate:
            passfail = ' PASS'
            bf_passfail = False

            if exp_p != p:
                s_prod = 'PFAIL'
                pfail_count += 1
                passfail = ' FAIL'
                bf_passfail = True

        #dut._log.info(f"in={str(ui_in)} {str(uio_in)}  out={str(uo_out)} {str(uio_out)}   {s_omuldiv} {s_ounsign} {a:5d} x {b:5d} = {p:6d}")
        dut._log.info(f"in={str(ui_in)} {str(uio_in)}  out={str(uo_out)} {str(uio_out)}    {s_omuldiv} {s_ounsign} {s_imgreg} {a:5d} x {b:5d} = {p:6d}{passfail} {s_prod}")

        debug_wire(dut, bf_passfail)	# indicator asserts and looks back at previous computation at decision point


def op_mode_name_from_uio_in(uio_in: int) -> str:
    if (uio_in & IMM_OR_REG_MASK) == IMM:
        s = 'IMM'
    elif (uio_in & IMM_OR_REG_MASK) == REG:
        s = ''
    else:
        assert False, "uio_in & IMM_OR_REG_MASK[{#x}] = {}".format(IMM_OR_REG_MASK, uio_in & IMM_OR_REG_MASK)
    return s


def op_mode_name_from_uio_in(uio_in: int) -> str:
    if (uio_in & MODE_MASK) == 0x00:
        s = 'MULU'
    elif (uio_in & MODE_MASK) == 0x40:
        s = 'MULS'
    elif (uio_in & MODE_MASK) == 0x80:
        s = 'DIVU'
    elif (uio_in & MODE_MASK) == 0xc0:
        s = 'DIVS'
    else:
        assert False, "uio_in & MODE_MASK[{#x}] = {}".format(MODE_MASK, uio_in & MODE_MASK)
    return s


def compute_yx16(y: int, x: int) -> int:
    assert x & X_MASK, f"x out of range {x:#x}"
    assert y & Y_MASK, f"y out of range {y:#x}"
    return ((y & Y_WIDTH_MASK) << Y_SHIFT) | ((x & X_WIDTH_MASK) << X_SHIFT)


# This will fill in the address bits
def compute_addr(uio_in: int, addr: int) -> int:
    assert type(uio_in) is int, f"Invalid type {type(uio_in)}" # not the signal want the integer
    assert type(addr) is int

    uio_in &= ~ADDR_MASK		# address index bits
    assert (addr & ~ADDR_MASK) == 0, f"address error for {addr:x}"
    uio_in |= addr

    return uio_in


# This will fill in the data bits
def compute_data(ui_in: int, value: int, addr: int) -> int:
    assert type(ui_in) is int, f"Invalid type {type(ui_in)}" # not the signal want the integer
    assert type(addr) is int

    # This allows for bit shifting and endian to be computed
    if addr >= ADDR_SECOND:	# hi
        ui_in = value >> Y_SHIFT
    else:
        ui_in = value >> X_SHIFT

    return ui_in & 0xff



async def test_sync(dut):
    debug(dut, 'SYNC')
    # We perform a synchronization process so the TB can match the internal project state
    # sync check

    dut._log.info(f"rb0={str(dut.uo_out.value)}")

    dut.ui_in.value = 0x00 # zero input
    dut.uio_in.value = 0x80 # DIVU mode, LO
    await ClockCycles(dut.clk, 1) # one half
    dut._log.info(f"rb1={str(dut.uo_out.value)}")

    dut.uio_in.value = 0x81 # DIVU mode, HI
    await ClockCycles(dut.clk, 1) # other half
    dut._log.info(f"rb2={str(dut.uo_out.value)}")

    dut.ui_in.value = 0x01 # one input

    dut.uio_in.value = 0x80 # DIVU mode, LO
    await ClockCycles(dut.clk, 1) # one half
    dut._log.info(f"rb3={str(dut.uo_out.value)}")
    readback0 = dut.uo_out.value

    dut.uio_in.value = 0x81 # DIVU mode, HI
    await ClockCycles(dut.clk, 1) # send 0x01
    dut._log.info(f"rb4={str(dut.uo_out.value)}")
    readback1 = dut.uo_out.value

    dut.uio_in.value = 0x80 # DIVU mode, LO
    await ClockCycles(dut.clk, 1) # send 0x01
    dut._log.info(f"rb5={str(dut.uo_out.value)}")
    readback2 = dut.uo_out.value

    dut.uio_in.value = 0x81 # DIVU mode, HI
    await ClockCycles(dut.clk, 1) # send 0x01
    dut._log.info(f"rb6={str(dut.uo_out.value)}")

    dut.ui_in.value = 0x00 # one input
    dut.uio_in.value = 0x00 # DIVU mode, LO

    dut._log.info(f"readback0={readback0} readback1={readback1} readback2={readback2}")

    if readback0 == 0x00 and readback1 == 0x01 and readback2 == 0x00:
        dut._log.info("resync send 0 cycles (already synchronized)")
        pass # on cycle
    elif readback0 == 0x01 and readback1 == 0x01 and readback2 == 0x00:
        debug(dut, '+1')
        dut._log.info("resync send 1 cycle")
        await ClockCycles(dut.clk, 1) # send 0x01
    else:
        assert False, f"DUT is broken, unable to SYNC state, comment this assert out but you need to manually very sync state in VCD"
    # SYNC complete


# bool to mode
def op_mode_signed(value: bool) -> int:
    return OP_SIGNED if value else 0


# mode to bool
def is_mode_signed(mode: int) -> bool:
    return (mode & OP_SIGNED) == OP_SIGNED


async def do_query(dut, ir_mode: int, op_mode: int, y: int, x: int, need_sync: bool = False) -> None:
    assert type(y) is int, f"y is invalid type {type(y)}" # msb
    assert type(x) is int, f"x is invalid type {type(x)}" # lsb

    if need_sync:
        await test_sync(dut)

    yx16 = compute_yx16(y, x)

    for addr in range(ADDR_FIRST, ADDR_LAST+1):
        uio_in = compute_addr(ir_mode | op_mode, addr)
        ui_in = compute_data(0, yx16, addr)

        dut.uio_in.value = uio_in
        dut.ui_in.value = ui_in

        await ClockCycles(dut.clk, 1) # pipeline
        report(dut, BinaryValue(ui_in, bigEndian=False, n_bits=8), BinaryValue(uio_in, bigEndian=False, n_bits=8), addr, None, False)


    for drain_addr in range(ADDR_FIRST, ADDR_LAST+1):
        uio_in = compute_addr(ir_mode | op_mode, drain_addr)
        ui_in = compute_data(0, yx16, drain_addr)

        dut.uio_in.value = uio_in
        dut.ui_in.value = ui_in

        await ClockCycles(dut.clk, 1) # pipeline

        is_last = drain_addr == ADDR_LAST
        report(dut, BinaryValue(ui_in, bigEndian=False, n_bits=8), BinaryValue(uio_in, bigEndian=False, n_bits=8), drain_addr, yx16, is_last)


@cocotb.test()
async def test_muldiv8(dut):
    dut._log.info("Start")
    clock = Clock(dut.clk, 10, units="us")
    cocotb.start_soon(clock.start())

    await ClockCycles(dut.clk, 2)       # show X

    debug(dut, 'RESET')

    # ena=0 state
    dut.ena.value = 0
    dut.rst_n.value = 0
    dut.clk.value = 0
    dut.ui_in.value = 0
    dut.uio_in.value = 0
    await ClockCycles(dut.clk, 2)       # show muted inputs ena=0

    dut._log.info("ena (active)")
    dut.ena.value = 1                   # ena=1
    await ClockCycles(dut.clk, 2)

    dut._log.info("reset (inactive)")
    dut.rst_n.value = 1                 # leave reset
    await ClockCycles(dut.clk, 2)


    # inject a random number of cycles (for sync check)
    # there is only an ODD and EVEN kind of sync
    n = random.randint(0, 41)
    debug(dut, f"{n} CLKS")
    await ClockCycles(dut.clk, n)
    dut._log.info(f"inserting {n} random clock cycles")


    debug(dut, 'START')

    dut._log.info(f"X_WIDTH_FULL={X_WIDTH_FULL} X_SHIFT={X_SHIFT} X_WIDTH_MASK={X_WIDTH_MASK:04x}")
    dut._log.info(f"Y_WIDTH_FULL={Y_WIDTH_FULL} Y_SHIFT={Y_SHIFT} Y_WIDTH_MASK={Y_WIDTH_MASK:04x}")

    dut._log.info(f"X_WIDTH={X_WIDTH} X__MASK={X_MASK:04x} X__MSB={X_MSB:04x} X__EXTEND={X_EXTEND:04x}")
    dut._log.info(f"X_WIDTH={X_WIDTH} Xs_MASK={Xs_MASK:04x} Xs_MSB={Xs_MSB:04x} Xs_EXTEND={Xs_EXTEND:04x}")

    dut._log.info(f"Y_WIDTH={Y_WIDTH} Y__MASK={Y_MASK:04x} Y__MSB={Y_MSB:04x} Y__EXTEND={Y_EXTEND:04x}")
    dut._log.info(f"Y_WIDTH={Y_WIDTH} Ys_MASK={Ys_MASK:04x} Ys_MSB={Ys_MSB:04x} Ys_EXTEND={Ys_EXTEND:04x}")

    dut._log.info(f"ADDR_RANGE={ADDR_RANGE} ADDR_SECOND={ADDR_SECOND} ADDR_MASK={ADDR_MASK:x} ADDR_FIRST={ADDR_FIRST} ADDR_LAST={ADDR_LAST}")

    await do_query(dut, IMM, DIVS, -128,   -1, True)

    await do_query(dut, IMM, DIVS,   -9,  -16, True)

    # Testing do_query
    #return

    ui_in = 0
    uio_in = 0

    # This is a mode concerning registering the result output
    for imm_or_reg in [0x00, 0x18]:	# bit3 for REG mode # FIXME maybe move bit4?
        # MULU MULS DIVU DIVS
        for uio_in_mode in [0x00, 0x40, 0x80, 0xc0]:
            await test_sync(dut)	# we sync every time, it can end up out of sync, need to fix that

            op_mode_name = op_mode_name_from_uio_in(uio_in_mode)
            bf_signed = uio_in_mode & 0x40 != 0
            bf_multiply = uio_in_mode & 0x80 == 0

            last_yx16 = None
            # This represents the 2 input values X(lo) and Y(hi) as a single integer
            for yx16 in range(0xffff+1):	# FIXME VALUE_FIRST, VALUE_LAST
                if X_WIDTH < X_WIDTH_FULL:
                    if (yx16 & Xs_MASK_SKIP) != 0:
                        continue			# skip
                    if bf_signed and (yx16 & Xs_MSB) != 0:
                        yx16 |= Xs_EXTEND 		# sign extend

                if Y_WIDTH < Y_WIDTH_FULL:
                    if (yx16 & Ys_MASK_SKIP) != 0:
                        continue			# skip
                    if bf_signed and (yx16 & Ys_MSB) != 0:
                        yx16 |= Ys_EXTEND 		# sign extend

                y = (yx16 >> Y_SHIFT) & Y_MASK
                y_signed = y if(y <= SIGNED_TEST_MAX) else y - SIGNED_TEST_SUBTRACT
                debug(dut, f"{op_mode_name} u={y} s={y_signed}")

                if ZERO_FILL_BETWEEN:
                    for addr in range(ADDR_FIRST, ADDR_LAST+1):
                        uio_in = uio_in_mode | imm_or_reg
                        uio_in = compute_addr(uio_in, addr)
                        ui_in = compute_data(ui_in, ZERO_VALUE, addr)
                        dut.uio_in.value = uio_in
                        dut.ui_in.value = ui_in

                for addr in range(ADDR_FIRST, ADDR_LAST+1):		# True/False 1bit atm
                    uio_in = uio_in_mode | imm_or_reg
                    uio_in = compute_addr(uio_in, addr)

                    ui_in = compute_data(ui_in, yx16, addr)

                    if addr >= ADDR_SECOND:	# hi
                        label = 'Y' if bf_multiply else 'D'
                    else:
                        label = 'X' if bf_multiply else 'd'

                    uio_in &= 0xff	# sanitize to 8bit
                    ui_in &= 0xff

                    ui_in_signed = ui_in if(ui_in <= 127) else ui_in - 256 # help with debugging
                    debug_info(dut, 2, f"{label} = {ui_in} {ui_in_signed}")

                    dut.uio_in.value = uio_in
                    dut.ui_in.value = ui_in

                    await ClockCycles(dut.clk, 1) # pipeline
                    # FIXME we want to ignore result when last_yx16 is None (no pipeline open)
                    # FIXME maybe we collect incorrect result
                    report(dut, BinaryValue(ui_in, bigEndian=False, n_bits=8), BinaryValue(uio_in, bigEndian=False, n_bits=8), addr, last_yx16, False)

                    if addr == ADDR_LAST:	# msb
                        # FIXME maybe we reuse the last cycle to take (part of) correct result
                        for drain_addr in range(ADDR_FIRST, ADDR_LAST+1):
                            uio_in = compute_addr(uio_in, drain_addr)
                            ui_in = compute_data(ui_in, yx16, drain_addr)

                            dut.ui_in.value = ui_in
                            dut.uio_in.value = uio_in
                            await ClockCycles(dut.clk, 1) # pipeline drain

                            # FIXME we want to assemble rest of correct result
                            is_last = drain_addr == ADDR_LAST
                            report(dut, BinaryValue(ui_in, bigEndian=False, n_bits=8), BinaryValue(uio_in, bigEndian=False, n_bits=8), drain_addr, last_yx16, is_last)
                        # FIXME then we report on the assembled correct result

                    last_yx16 = yx16 # pipeline result for next time

            if last_yx16 is not None:	# drain pipeline
                debug_info(dut, 3, f"PIPELINE DRAIN = {last_yx16:04x}")
                for drain_addr in range(ADDR_FIRST, ADDR_LAST+1):
                    uio_in = compute_addr(uio_in, drain_addr) # toggle (needed to expose result)
                    # use last_yx16 here as we may have looped above to skip to end
                    ui_in = compute_data(ui_in, last_yx16, drain_addr)

                    dut.ui_in.value = ui_in
                    dut.uio_in.value = uio_in
                    await ClockCycles(dut.clk, 1) # pipeline draining cycle

                    is_last = drain_addr == ADDR_LAST
                    report(dut, BinaryValue(ui_in, bigEndian=False, n_bits=8), BinaryValue(uio_in, bigEndian=False, n_bits=8), drain_addr, last_yx16, is_last)

                last_yx16 = None
                uio_in = compute_addr(uio_in, drain_addr) # toggle (needed to expose result)
                ui_in = compute_data(ui_in, yx16, drain_addr)

                dut.ui_in.value = ui_in
                dut.uio_in.value = uio_in
                await ClockCycles(dut.clk, 2) # keep sync clock (not needed)

            debug(dut, 'IDLE')
            await ClockCycles(dut.clk, 16)

    debug(dut, 'DONE')
    await ClockCycles(dut.clk, 10)

    report_summary(dut)
