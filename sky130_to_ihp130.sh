#!/bin/bash
#
# 
#

VERILOG_FILE="TT06MULDIV8Top.v"

cp -f "$VERILOG_FILE" "${VERILOG_FILE}.orig"
# D-Latch Gate-active-high Reset-active-low Single-output
sed -e 's/sky130_fd_sc_hd__dlrtp/sg13g2_dlhrq/' -i $VERILOG_FILE
diff -u "${VERILOG_FILE}.orig" "${VERILOG_FILE}"
