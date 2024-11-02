// Generator : SpinalHDL dev    git head : efcba5fcd17d0cfe48fa0981e8dec6e70234b294
// Component : TT06MULDIV8Top

`ifdef TIMESCALE
`timescale 1ns/1ps
`endif

module TT06MULDIV8Top (
  input               ena /* verilator public */ ,
  output reg [7:0]    uo_out /* verilator public */ ,
  input      [7:0]    ui_in /* verilator public */ ,
  output reg [7:0]    uio_out /* verilator public */ ,
  input      [7:0]    uio_in /* verilator public */ ,
  output reg [7:0]    uio_oe /* verilator public */ ,
  input               simulation_z /* verilator public */ ,
  input               rst_n,
  input               clk
);

  wire                a0_0_D;
  wire                a0_0_RESET_B;
  wire                a0_1_D;
  wire                a0_1_RESET_B;
  wire                a0_2_D;
  wire                a0_2_RESET_B;
  wire                a0_3_D;
  wire                a0_3_RESET_B;
  wire                a0_4_D;
  wire                a0_4_RESET_B;
  wire                a0_5_D;
  wire                a0_5_RESET_B;
  wire                a0_6_D;
  wire                a0_6_RESET_B;
  wire                a0_7_D;
  wire                a0_7_RESET_B;
  wire                a1_0_D;
  wire                a1_0_RESET_B;
  wire                a1_1_D;
  wire                a1_1_RESET_B;
  wire                a1_2_D;
  wire                a1_2_RESET_B;
  wire                a1_3_D;
  wire                a1_3_RESET_B;
  wire                a1_4_D;
  wire                a1_4_RESET_B;
  wire                a1_5_D;
  wire                a1_5_RESET_B;
  wire                a1_6_D;
  wire                a1_6_RESET_B;
  wire                a1_7_D;
  wire                a1_7_RESET_B;
  wire                mul8_io_en;
  wire       [7:0]    mul8_io_a;
  wire       [7:0]    mul8_io_b;
  wire       [7:0]    div8_io_dend;
  wire       [7:0]    div8_io_dsor;
  wire                negedgeReg_1_area_io_q;
  wire                a0_0_Q;
  wire                a0_1_Q;
  wire                a0_2_Q;
  wire                a0_3_Q;
  wire                a0_4_Q;
  wire                a0_5_Q;
  wire                a0_6_Q;
  wire                a0_7_Q;
  wire                a1_0_Q;
  wire                a1_1_Q;
  wire                a1_2_Q;
  wire                a1_3_Q;
  wire                a1_4_Q;
  wire                a1_5_Q;
  wire                a1_6_Q;
  wire                a1_7_Q;
  wire       [15:0]   mul8_io_p;
  wire       [7:0]    div8_io_q;
  wire       [7:0]    div8_io_r;
  wire                div8_io_edivoverflow;
  wire                div8_io_edivzero;
  wire       [0:0]    addr;
  wire                opsigned;
  wire                muldivMode;
  reg                 div2reg;
  wire                a0open;
  wire                a1open;
  reg        [15:0]   regR;
  wire       [1:0]    switch_Misc_l226;
  reg        [7:0]    imm8;
  wire       [15:0]   res;
  wire                when_MULDIV8Top_l756;
  reg        [7:0]    regRbyte;
  reg        [3:0]    _zz_uio_oe;
  reg        [1:0]    _zz_uio_oe_1;
  function [3:0] zz__zz_uio_oe(input dummy);
    begin
      zz__zz_uio_oe[0] = 1'b0;
      zz__zz_uio_oe[1] = 1'b0;
      zz__zz_uio_oe[2] = 1'b0;
      zz__zz_uio_oe[3] = 1'b0;
    end
  endfunction
  wire [3:0] _zz_1;
  function [1:0] zz__zz_uio_oe_1(input dummy);
    begin
      zz__zz_uio_oe_1[0] = 1'b0;
      zz__zz_uio_oe_1[1] = 1'b0;
    end
  endfunction
  wire [1:0] _zz_2;

  NegedgeReg negedgeReg_1 (
    .area_io_en (1'b1                  ), //i
    .area_io_d  (div2reg               ), //i
    .area_io_q  (negedgeReg_1_area_io_q), //o
    .rst_n      (rst_n                 ), //i
    .clk        (clk                   )  //i
  );
  (* keep , syn_keep *) sky130_fd_sc_hd__dlrtp a0_0 (
    .D       (a0_0_D      ), //i
    .GATE    (a0open      ), //i
    .RESET_B (a0_0_RESET_B), //i
    .Q       (a0_0_Q      )  //o
  );
  (* keep , syn_keep *) sky130_fd_sc_hd__dlrtp a0_1 (
    .D       (a0_1_D      ), //i
    .GATE    (a0open      ), //i
    .RESET_B (a0_1_RESET_B), //i
    .Q       (a0_1_Q      )  //o
  );
  (* keep , syn_keep *) sky130_fd_sc_hd__dlrtp a0_2 (
    .D       (a0_2_D      ), //i
    .GATE    (a0open      ), //i
    .RESET_B (a0_2_RESET_B), //i
    .Q       (a0_2_Q      )  //o
  );
  (* keep , syn_keep *) sky130_fd_sc_hd__dlrtp a0_3 (
    .D       (a0_3_D      ), //i
    .GATE    (a0open      ), //i
    .RESET_B (a0_3_RESET_B), //i
    .Q       (a0_3_Q      )  //o
  );
  (* keep , syn_keep *) sky130_fd_sc_hd__dlrtp a0_4 (
    .D       (a0_4_D      ), //i
    .GATE    (a0open      ), //i
    .RESET_B (a0_4_RESET_B), //i
    .Q       (a0_4_Q      )  //o
  );
  (* keep , syn_keep *) sky130_fd_sc_hd__dlrtp a0_5 (
    .D       (a0_5_D      ), //i
    .GATE    (a0open      ), //i
    .RESET_B (a0_5_RESET_B), //i
    .Q       (a0_5_Q      )  //o
  );
  (* keep , syn_keep *) sky130_fd_sc_hd__dlrtp a0_6 (
    .D       (a0_6_D      ), //i
    .GATE    (a0open      ), //i
    .RESET_B (a0_6_RESET_B), //i
    .Q       (a0_6_Q      )  //o
  );
  (* keep , syn_keep *) sky130_fd_sc_hd__dlrtp a0_7 (
    .D       (a0_7_D      ), //i
    .GATE    (a0open      ), //i
    .RESET_B (a0_7_RESET_B), //i
    .Q       (a0_7_Q      )  //o
  );
  (* keep , syn_keep *) sky130_fd_sc_hd__dlrtp a1_0 (
    .D       (a1_0_D      ), //i
    .GATE    (a1open      ), //i
    .RESET_B (a1_0_RESET_B), //i
    .Q       (a1_0_Q      )  //o
  );
  (* keep , syn_keep *) sky130_fd_sc_hd__dlrtp a1_1 (
    .D       (a1_1_D      ), //i
    .GATE    (a1open      ), //i
    .RESET_B (a1_1_RESET_B), //i
    .Q       (a1_1_Q      )  //o
  );
  (* keep , syn_keep *) sky130_fd_sc_hd__dlrtp a1_2 (
    .D       (a1_2_D      ), //i
    .GATE    (a1open      ), //i
    .RESET_B (a1_2_RESET_B), //i
    .Q       (a1_2_Q      )  //o
  );
  (* keep , syn_keep *) sky130_fd_sc_hd__dlrtp a1_3 (
    .D       (a1_3_D      ), //i
    .GATE    (a1open      ), //i
    .RESET_B (a1_3_RESET_B), //i
    .Q       (a1_3_Q      )  //o
  );
  (* keep , syn_keep *) sky130_fd_sc_hd__dlrtp a1_4 (
    .D       (a1_4_D      ), //i
    .GATE    (a1open      ), //i
    .RESET_B (a1_4_RESET_B), //i
    .Q       (a1_4_Q      )  //o
  );
  (* keep , syn_keep *) sky130_fd_sc_hd__dlrtp a1_5 (
    .D       (a1_5_D      ), //i
    .GATE    (a1open      ), //i
    .RESET_B (a1_5_RESET_B), //i
    .Q       (a1_5_Q      )  //o
  );
  (* keep , syn_keep *) sky130_fd_sc_hd__dlrtp a1_6 (
    .D       (a1_6_D      ), //i
    .GATE    (a1open      ), //i
    .RESET_B (a1_6_RESET_B), //i
    .Q       (a1_6_Q      )  //o
  );
  (* keep , syn_keep *) sky130_fd_sc_hd__dlrtp a1_7 (
    .D       (a1_7_D      ), //i
    .GATE    (a1open      ), //i
    .RESET_B (a1_7_RESET_B), //i
    .Q       (a1_7_Q      )  //o
  );
  Mul mul8 (
    .io_en       (mul8_io_en     ), //i
    .io_opsigned (opsigned       ), //i
    .io_a        (mul8_io_a[7:0] ), //i
    .io_b        (mul8_io_b[7:0] ), //i
    .io_p        (mul8_io_p[15:0])  //o
  );
  Div div8 (
    .io_en           (muldivMode          ), //i
    .io_opsigned     (opsigned            ), //i
    .io_dend         (div8_io_dend[7:0]   ), //i
    .io_dsor         (div8_io_dsor[7:0]   ), //i
    .io_q            (div8_io_q[7:0]      ), //o
    .io_r            (div8_io_r[7:0]      ), //o
    .io_edivoverflow (div8_io_edivoverflow), //o
    .io_edivzero     (div8_io_edivzero    )  //o
  );
  always @(*) begin
    uo_out = 8'bxxxxxxxx;
    uo_out = (uio_in[3] ? regRbyte : imm8);
  end

  always @(*) begin
    uio_out = 8'bxxxxxxxx;
    uio_out[3 : 0] = 4'b0000;
    uio_out[4] = div8_io_edivoverflow;
    uio_out[5] = div8_io_edivzero;
    uio_out[7 : 6] = 2'b00;
  end

  always @(*) begin
    uio_oe = 8'h0a;
    uio_oe[3 : 0] = _zz_uio_oe;
    uio_oe[4] = 1'b1;
    uio_oe[5] = 1'b1;
    uio_oe[7 : 6] = _zz_uio_oe_1;
  end

  assign addr = uio_in[0 : 0];
  assign opsigned = uio_in[6];
  assign muldivMode = uio_in[7];
  assign a0open = ((! div2reg) && negedgeReg_1_area_io_q);
  assign a1open = (div2reg && (! negedgeReg_1_area_io_q));
  assign a0_0_RESET_B = (! (! rst_n));
  assign a0_0_D = ui_in[0];
  assign a0_1_RESET_B = (! (! rst_n));
  assign a0_1_D = ui_in[1];
  assign a0_2_RESET_B = (! (! rst_n));
  assign a0_2_D = ui_in[2];
  assign a0_3_RESET_B = (! (! rst_n));
  assign a0_3_D = ui_in[3];
  assign a0_4_RESET_B = (! (! rst_n));
  assign a0_4_D = ui_in[4];
  assign a0_5_RESET_B = (! (! rst_n));
  assign a0_5_D = ui_in[5];
  assign a0_6_RESET_B = (! (! rst_n));
  assign a0_6_D = ui_in[6];
  assign a0_7_RESET_B = (! (! rst_n));
  assign a0_7_D = ui_in[7];
  assign a1_0_RESET_B = (! (! rst_n));
  assign a1_0_D = ui_in[0];
  assign a1_1_RESET_B = (! (! rst_n));
  assign a1_1_D = ui_in[1];
  assign a1_2_RESET_B = (! (! rst_n));
  assign a1_2_D = ui_in[2];
  assign a1_3_RESET_B = (! (! rst_n));
  assign a1_3_D = ui_in[3];
  assign a1_4_RESET_B = (! (! rst_n));
  assign a1_4_D = ui_in[4];
  assign a1_5_RESET_B = (! (! rst_n));
  assign a1_5_D = ui_in[5];
  assign a1_6_RESET_B = (! (! rst_n));
  assign a1_6_D = ui_in[6];
  assign a1_7_RESET_B = (! (! rst_n));
  assign a1_7_D = ui_in[7];
  assign mul8_io_en = (! muldivMode);
  assign mul8_io_a = {a0_7_Q,{a0_6_Q,{a0_5_Q,{a0_4_Q,{a0_3_Q,{a0_2_Q,{a0_1_Q,a0_0_Q}}}}}}};
  assign mul8_io_b = {a1_7_Q,{a1_6_Q,{a1_5_Q,{a1_4_Q,{a1_3_Q,{a1_2_Q,{a1_1_Q,a1_0_Q}}}}}}};
  assign div8_io_dsor = {a0_7_Q,{a0_6_Q,{a0_5_Q,{a0_4_Q,{a0_3_Q,{a0_2_Q,{a0_1_Q,a0_0_Q}}}}}}};
  assign div8_io_dend = {a1_7_Q,{a1_6_Q,{a1_5_Q,{a1_4_Q,{a1_3_Q,{a1_2_Q,{a1_1_Q,a1_0_Q}}}}}}};
  assign switch_Misc_l226 = {muldivMode,addr};
  always @(*) begin
    case(switch_Misc_l226)
      2'b00 : begin
        imm8 = mul8_io_p[7 : 0];
      end
      2'b01 : begin
        imm8 = mul8_io_p[15 : 8];
      end
      2'b10 : begin
        imm8 = div8_io_r[7 : 0];
      end
      default : begin
        imm8 = div8_io_q[7 : 0];
      end
    endcase
  end

  assign res = (muldivMode ? {div8_io_q,div8_io_r} : mul8_io_p);
  assign when_MULDIV8Top_l756 = (addr == 1'b1);
  always @(*) begin
    case(addr)
      1'b1 : begin
        regRbyte = regR[15 : 8];
      end
      default : begin
        regRbyte = regR[7 : 0];
      end
    endcase
  end

  assign _zz_1 = zz__zz_uio_oe(1'b0);
  always @(*) _zz_uio_oe = _zz_1;
  assign _zz_2 = zz__zz_uio_oe_1(1'b0);
  always @(*) _zz_uio_oe_1 = _zz_2;
  always @(posedge clk) begin
    if(!rst_n) begin
      div2reg <= 1'b0;
    end else begin
      div2reg <= (! div2reg);
    end
  end

  always @(posedge clk) begin
    if(when_MULDIV8Top_l756) begin
      regR <= res;
    end
  end


endmodule

module Div (
  input               io_en,
  input               io_opsigned,
  input      [7:0]    io_dend,
  input      [7:0]    io_dsor,
  output reg [7:0]    io_q,
  output reg [7:0]    io_r,
  output              io_edivoverflow,
  output              io_edivzero
);

  wire                HAD_DVD_TWOS_0_io_a;
  wire                HAD_DVD_TWOS_0_io_b;
  wire                HAD_DVD_TWOS_1_io_a;
  wire                HAD_DVD_TWOS_2_io_a;
  wire                HAD_DVD_TWOS_3_io_a;
  wire                HAD_DVD_TWOS_4_io_a;
  wire                HAD_DVD_TWOS_5_io_a;
  wire                HAD_DVD_TWOS_6_io_a;
  wire                HAD_DVD_TWOS_7_io_a;
  wire                HAR0_SIGN_io_a;
  wire                HAR1_SIGN_io_a;
  wire                HAR2_SIGN_io_a;
  wire                HAR3_SIGN_io_a;
  wire                HAR4_SIGN_io_a;
  wire                HAR5_SIGN_io_a;
  wire                HAR6_SIGN_io_a;
  wire                HAR7_SIGN_io_a;
  wire                HAQ0_SIGN_io_a;
  wire                HAQ1_SIGN_io_a;
  wire                HAQ2_SIGN_io_a;
  wire                HAQ3_SIGN_io_a;
  wire                HAQ4_SIGN_io_a;
  wire                HAQ5_SIGN_io_a;
  wire                HAQ6_SIGN_io_a;
  wire                HAQ7_SIGN_io_a;
  wire                HAD_DVD_TWOS_0_io_s;
  wire                HAD_DVD_TWOS_0_io_c;
  wire                HAD_DVD_TWOS_1_io_s;
  wire                HAD_DVD_TWOS_1_io_c;
  wire                HAD_DVD_TWOS_2_io_s;
  wire                HAD_DVD_TWOS_2_io_c;
  wire                HAD_DVD_TWOS_3_io_s;
  wire                HAD_DVD_TWOS_3_io_c;
  wire                HAD_DVD_TWOS_4_io_s;
  wire                HAD_DVD_TWOS_4_io_c;
  wire                HAD_DVD_TWOS_5_io_s;
  wire                HAD_DVD_TWOS_5_io_c;
  wire                HAD_DVD_TWOS_6_io_s;
  wire                HAD_DVD_TWOS_6_io_c;
  wire                HAD_DVD_TWOS_7_io_s;
  wire                HAD_DVD_TWOS_7_io_c;
  wire                DU_Q0D0d8_EXT_io_s;
  wire                DU_Q0D0d8_EXT_io_c;
  wire                DU_Q0D0d9_EXT_io_s;
  wire                DU_Q0D0d9_EXT_io_c;
  wire                DU_Q0D0d10_EXT_io_s;
  wire                DU_Q0D0d10_EXT_io_c;
  wire                DU_Q0D0d11_EXT_io_s;
  wire                DU_Q0D0d11_EXT_io_c;
  wire                DU_Q0D0d12_EXT_io_s;
  wire                DU_Q0D0d12_EXT_io_c;
  wire                DU_Q0D0d0_io_s;
  wire                DU_Q0D0d0_io_c;
  wire                DU_Q0D0d1_io_s;
  wire                DU_Q0D0d1_io_c;
  wire                DU_Q0D0d2_io_s;
  wire                DU_Q0D0d2_io_c;
  wire                DU_Q0D0d3_io_s;
  wire                DU_Q0D0d3_io_c;
  wire                DU_Q0D0d4_io_s;
  wire                DU_Q0D0d4_io_c;
  wire                DU_Q0D0d5_io_s;
  wire                DU_Q0D0d5_io_c;
  wire                DU_Q0D0d6_io_s;
  wire                DU_Q0D0d6_io_c;
  wire                DU_Q0D0d7_io_s;
  wire                DU_Q0D0d7_io_c;
  wire                DU_Q1D1d8_EXT_io_s;
  wire                DU_Q1D1d8_EXT_io_c;
  wire                DU_Q1D1d9_EXT_io_s;
  wire                DU_Q1D1d9_EXT_io_c;
  wire                DU_Q1D1d10_EXT_io_s;
  wire                DU_Q1D1d10_EXT_io_c;
  wire                DU_Q1D1d11_EXT_io_s;
  wire                DU_Q1D1d11_EXT_io_c;
  wire                DU_Q1D1d12_EXT_io_s;
  wire                DU_Q1D1d12_EXT_io_c;
  wire                DU_Q1D1d0_io_s;
  wire                DU_Q1D1d0_io_c;
  wire                DU_Q1D1d1_io_s;
  wire                DU_Q1D1d1_io_c;
  wire                DU_Q1D1d2_io_s;
  wire                DU_Q1D1d2_io_c;
  wire                DU_Q1D1d3_io_s;
  wire                DU_Q1D1d3_io_c;
  wire                DU_Q1D1d4_io_s;
  wire                DU_Q1D1d4_io_c;
  wire                DU_Q1D1d5_io_s;
  wire                DU_Q1D1d5_io_c;
  wire                DU_Q1D1d6_io_s;
  wire                DU_Q1D1d6_io_c;
  wire                DU_Q1D1d7_io_s;
  wire                DU_Q1D1d7_io_c;
  wire                DU_Q2D2d8_EXT_io_s;
  wire                DU_Q2D2d8_EXT_io_c;
  wire                DU_Q2D2d9_EXT_io_s;
  wire                DU_Q2D2d9_EXT_io_c;
  wire                DU_Q2D2d10_EXT_io_s;
  wire                DU_Q2D2d10_EXT_io_c;
  wire                DU_Q2D2d11_EXT_io_s;
  wire                DU_Q2D2d11_EXT_io_c;
  wire                DU_Q2D2d0_io_s;
  wire                DU_Q2D2d0_io_c;
  wire                DU_Q2D2d1_io_s;
  wire                DU_Q2D2d1_io_c;
  wire                DU_Q2D2d2_io_s;
  wire                DU_Q2D2d2_io_c;
  wire                DU_Q2D2d3_io_s;
  wire                DU_Q2D2d3_io_c;
  wire                DU_Q2D2d4_io_s;
  wire                DU_Q2D2d4_io_c;
  wire                DU_Q2D2d5_io_s;
  wire                DU_Q2D2d5_io_c;
  wire                DU_Q2D2d6_io_s;
  wire                DU_Q2D2d6_io_c;
  wire                DU_Q2D2d7_io_s;
  wire                DU_Q2D2d7_io_c;
  wire                DU_Q3D3d8_EXT_io_s;
  wire                DU_Q3D3d8_EXT_io_c;
  wire                DU_Q3D3d9_EXT_io_s;
  wire                DU_Q3D3d9_EXT_io_c;
  wire                DU_Q3D3d10_EXT_io_s;
  wire                DU_Q3D3d10_EXT_io_c;
  wire                DU_Q3D3d0_io_s;
  wire                DU_Q3D3d0_io_c;
  wire                DU_Q3D3d1_io_s;
  wire                DU_Q3D3d1_io_c;
  wire                DU_Q3D3d2_io_s;
  wire                DU_Q3D3d2_io_c;
  wire                DU_Q3D3d3_io_s;
  wire                DU_Q3D3d3_io_c;
  wire                DU_Q3D3d4_io_s;
  wire                DU_Q3D3d4_io_c;
  wire                DU_Q3D3d5_io_s;
  wire                DU_Q3D3d5_io_c;
  wire                DU_Q3D3d6_io_s;
  wire                DU_Q3D3d6_io_c;
  wire                DU_Q3D3d7_io_s;
  wire                DU_Q3D3d7_io_c;
  wire                DU_Q4D4d8_EXT_io_s;
  wire                DU_Q4D4d8_EXT_io_c;
  wire                DU_Q4D4d9_EXT_io_s;
  wire                DU_Q4D4d9_EXT_io_c;
  wire                DU_Q4D4d0_io_s;
  wire                DU_Q4D4d0_io_c;
  wire                DU_Q4D4d1_io_s;
  wire                DU_Q4D4d1_io_c;
  wire                DU_Q4D4d2_io_s;
  wire                DU_Q4D4d2_io_c;
  wire                DU_Q4D4d3_io_s;
  wire                DU_Q4D4d3_io_c;
  wire                DU_Q4D4d4_io_s;
  wire                DU_Q4D4d4_io_c;
  wire                DU_Q4D4d5_io_s;
  wire                DU_Q4D4d5_io_c;
  wire                DU_Q4D4d6_io_s;
  wire                DU_Q4D4d6_io_c;
  wire                DU_Q4D4d7_io_s;
  wire                DU_Q4D4d7_io_c;
  wire                DU_Q5D5d8_EXT_io_s;
  wire                DU_Q5D5d8_EXT_io_c;
  wire                DU_Q5D5d0_io_s;
  wire                DU_Q5D5d0_io_c;
  wire                DU_Q5D5d1_io_s;
  wire                DU_Q5D5d1_io_c;
  wire                DU_Q5D5d2_io_s;
  wire                DU_Q5D5d2_io_c;
  wire                DU_Q5D5d3_io_s;
  wire                DU_Q5D5d3_io_c;
  wire                DU_Q5D5d4_io_s;
  wire                DU_Q5D5d4_io_c;
  wire                DU_Q5D5d5_io_s;
  wire                DU_Q5D5d5_io_c;
  wire                DU_Q5D5d6_io_s;
  wire                DU_Q5D5d6_io_c;
  wire                DU_Q5D5d7_io_s;
  wire                DU_Q5D5d7_io_c;
  wire                DU_Q6D6d0_io_s;
  wire                DU_Q6D6d0_io_c;
  wire                DU_Q6D6d1_io_s;
  wire                DU_Q6D6d1_io_c;
  wire                DU_Q6D6d2_io_s;
  wire                DU_Q6D6d2_io_c;
  wire                DU_Q6D6d3_io_s;
  wire                DU_Q6D6d3_io_c;
  wire                DU_Q6D6d4_io_s;
  wire                DU_Q6D6d4_io_c;
  wire                DU_Q6D6d5_io_s;
  wire                DU_Q6D6d5_io_c;
  wire                DU_Q6D6d6_io_s;
  wire                DU_Q6D6d6_io_c;
  wire                DU_Q6D6d7_io_s;
  wire                DU_Q6D6d7_io_c;
  wire                DU_Q7D7d0_io_s;
  wire                DU_Q7D7d0_io_c;
  wire                DU_Q7D7d1_io_s;
  wire                DU_Q7D7d1_io_c;
  wire                DU_Q7D7d2_io_s;
  wire                DU_Q7D7d2_io_c;
  wire                DU_Q7D7d3_io_s;
  wire                DU_Q7D7d3_io_c;
  wire                DU_Q7D7d4_io_s;
  wire                DU_Q7D7d4_io_c;
  wire                DU_Q7D7d5_io_s;
  wire                DU_Q7D7d5_io_c;
  wire                DU_Q7D7d6_io_s;
  wire                DU_Q7D7d6_io_c;
  wire                DU_Q7D7d7_io_s;
  wire                DU_Q7D7d7_io_c;
  wire                HAR0_SIGN_io_s;
  wire                HAR0_SIGN_io_c;
  wire                HAR1_SIGN_io_s;
  wire                HAR1_SIGN_io_c;
  wire                HAR2_SIGN_io_s;
  wire                HAR2_SIGN_io_c;
  wire                HAR3_SIGN_io_s;
  wire                HAR3_SIGN_io_c;
  wire                HAR4_SIGN_io_s;
  wire                HAR4_SIGN_io_c;
  wire                HAR5_SIGN_io_s;
  wire                HAR5_SIGN_io_c;
  wire                HAR6_SIGN_io_s;
  wire                HAR6_SIGN_io_c;
  wire                HAR7_SIGN_io_s;
  wire                HAR7_SIGN_io_c;
  wire                HAQ0_SIGN_io_s;
  wire                HAQ0_SIGN_io_c;
  wire                HAQ1_SIGN_io_s;
  wire                HAQ1_SIGN_io_c;
  wire                HAQ2_SIGN_io_s;
  wire                HAQ2_SIGN_io_c;
  wire                HAQ3_SIGN_io_s;
  wire                HAQ3_SIGN_io_c;
  wire                HAQ4_SIGN_io_s;
  wire                HAQ4_SIGN_io_c;
  wire                HAQ5_SIGN_io_s;
  wire                HAQ5_SIGN_io_c;
  wire                HAQ6_SIGN_io_s;
  wire                HAQ6_SIGN_io_c;
  wire                HAQ7_SIGN_io_s;
  wire                HAQ7_SIGN_io_c;
  wire       [0:0]    _zz_io_b;
  wire                isZero;
  wire                dvdTwosEn;
  wire                dvrTwosEn;
  wire                dvrTwosEnInverted;
  wire                qSign;
  wire                hadDvdTwosS_0;
  wire                hadDvdTwosS_1;
  wire                hadDvdTwosS_2;
  wire                hadDvdTwosS_3;
  wire                hadDvdTwosS_4;
  wire                hadDvdTwosS_5;
  wire                hadDvdTwosS_6;
  wire                hadDvdTwosS_7;
  wire                xorDvr_0;
  wire                xorDvr_1;
  wire                xorDvr_2;
  wire                xorDvr_3;
  wire                xorDvr_4;
  wire                xorDvr_5;
  wire                xorDvr_6;
  wire                xorDvr_7;

  assign _zz_io_b = dvdTwosEn;
  HA_24 HAD_DVD_TWOS_0 (
    .io_a (HAD_DVD_TWOS_0_io_a), //i
    .io_b (HAD_DVD_TWOS_0_io_b), //i
    .io_s (HAD_DVD_TWOS_0_io_s), //o
    .io_c (HAD_DVD_TWOS_0_io_c)  //o
  );
  HA_24 HAD_DVD_TWOS_1 (
    .io_a (HAD_DVD_TWOS_1_io_a), //i
    .io_b (HAD_DVD_TWOS_0_io_c), //i
    .io_s (HAD_DVD_TWOS_1_io_s), //o
    .io_c (HAD_DVD_TWOS_1_io_c)  //o
  );
  HA_24 HAD_DVD_TWOS_2 (
    .io_a (HAD_DVD_TWOS_2_io_a), //i
    .io_b (HAD_DVD_TWOS_1_io_c), //i
    .io_s (HAD_DVD_TWOS_2_io_s), //o
    .io_c (HAD_DVD_TWOS_2_io_c)  //o
  );
  HA_24 HAD_DVD_TWOS_3 (
    .io_a (HAD_DVD_TWOS_3_io_a), //i
    .io_b (HAD_DVD_TWOS_2_io_c), //i
    .io_s (HAD_DVD_TWOS_3_io_s), //o
    .io_c (HAD_DVD_TWOS_3_io_c)  //o
  );
  HA_24 HAD_DVD_TWOS_4 (
    .io_a (HAD_DVD_TWOS_4_io_a), //i
    .io_b (HAD_DVD_TWOS_3_io_c), //i
    .io_s (HAD_DVD_TWOS_4_io_s), //o
    .io_c (HAD_DVD_TWOS_4_io_c)  //o
  );
  HA_24 HAD_DVD_TWOS_5 (
    .io_a (HAD_DVD_TWOS_5_io_a), //i
    .io_b (HAD_DVD_TWOS_4_io_c), //i
    .io_s (HAD_DVD_TWOS_5_io_s), //o
    .io_c (HAD_DVD_TWOS_5_io_c)  //o
  );
  HA_24 HAD_DVD_TWOS_6 (
    .io_a (HAD_DVD_TWOS_6_io_a), //i
    .io_b (HAD_DVD_TWOS_5_io_c), //i
    .io_s (HAD_DVD_TWOS_6_io_s), //o
    .io_c (HAD_DVD_TWOS_6_io_c)  //o
  );
  HA_24 HAD_DVD_TWOS_7 (
    .io_a (HAD_DVD_TWOS_7_io_a), //i
    .io_b (HAD_DVD_TWOS_6_io_c), //i
    .io_s (HAD_DVD_TWOS_7_io_s), //o
    .io_c (HAD_DVD_TWOS_7_io_c)  //o
  );
  DIVUNIT DU_Q0D0d8_EXT (
    .io_a   (DU_Q1D1d7_io_s     ), //i
    .io_b   (1'b1               ), //i
    .io_y   (DU_Q0D0d7_io_c     ), //i
    .io_sel (DU_Q0D0d12_EXT_io_c), //i
    .io_s   (DU_Q0D0d8_EXT_io_s ), //o
    .io_c   (DU_Q0D0d8_EXT_io_c )  //o
  );
  DIVUNIT DU_Q0D0d9_EXT (
    .io_a   (DU_Q1D1d8_EXT_io_s ), //i
    .io_b   (1'b1               ), //i
    .io_y   (DU_Q0D0d8_EXT_io_c ), //i
    .io_sel (DU_Q0D0d12_EXT_io_c), //i
    .io_s   (DU_Q0D0d9_EXT_io_s ), //o
    .io_c   (DU_Q0D0d9_EXT_io_c )  //o
  );
  DIVUNIT DU_Q0D0d10_EXT (
    .io_a   (DU_Q1D1d9_EXT_io_s ), //i
    .io_b   (1'b1               ), //i
    .io_y   (DU_Q0D0d9_EXT_io_c ), //i
    .io_sel (DU_Q0D0d12_EXT_io_c), //i
    .io_s   (DU_Q0D0d10_EXT_io_s), //o
    .io_c   (DU_Q0D0d10_EXT_io_c)  //o
  );
  DIVUNIT DU_Q0D0d11_EXT (
    .io_a   (DU_Q1D1d10_EXT_io_s), //i
    .io_b   (1'b1               ), //i
    .io_y   (DU_Q0D0d10_EXT_io_c), //i
    .io_sel (DU_Q0D0d12_EXT_io_c), //i
    .io_s   (DU_Q0D0d11_EXT_io_s), //o
    .io_c   (DU_Q0D0d11_EXT_io_c)  //o
  );
  DIVUNIT DU_Q0D0d12_EXT (
    .io_a   (DU_Q1D1d11_EXT_io_s), //i
    .io_b   (1'b1               ), //i
    .io_y   (DU_Q0D0d11_EXT_io_c), //i
    .io_sel (DU_Q0D0d12_EXT_io_c), //i
    .io_s   (DU_Q0D0d12_EXT_io_s), //o
    .io_c   (DU_Q0D0d12_EXT_io_c)  //o
  );
  DIVUNIT DU_Q0D0d0 (
    .io_a   (hadDvdTwosS_0      ), //i
    .io_b   (xorDvr_0           ), //i
    .io_y   (dvrTwosEnInverted  ), //i
    .io_sel (DU_Q0D0d12_EXT_io_c), //i
    .io_s   (DU_Q0D0d0_io_s     ), //o
    .io_c   (DU_Q0D0d0_io_c     )  //o
  );
  DIVUNIT DU_Q0D0d1 (
    .io_a   (DU_Q1D1d0_io_s     ), //i
    .io_b   (xorDvr_1           ), //i
    .io_y   (DU_Q0D0d0_io_c     ), //i
    .io_sel (DU_Q0D0d12_EXT_io_c), //i
    .io_s   (DU_Q0D0d1_io_s     ), //o
    .io_c   (DU_Q0D0d1_io_c     )  //o
  );
  DIVUNIT DU_Q0D0d2 (
    .io_a   (DU_Q1D1d1_io_s     ), //i
    .io_b   (xorDvr_2           ), //i
    .io_y   (DU_Q0D0d1_io_c     ), //i
    .io_sel (DU_Q0D0d12_EXT_io_c), //i
    .io_s   (DU_Q0D0d2_io_s     ), //o
    .io_c   (DU_Q0D0d2_io_c     )  //o
  );
  DIVUNIT DU_Q0D0d3 (
    .io_a   (DU_Q1D1d2_io_s     ), //i
    .io_b   (xorDvr_3           ), //i
    .io_y   (DU_Q0D0d2_io_c     ), //i
    .io_sel (DU_Q0D0d12_EXT_io_c), //i
    .io_s   (DU_Q0D0d3_io_s     ), //o
    .io_c   (DU_Q0D0d3_io_c     )  //o
  );
  DIVUNIT DU_Q0D0d4 (
    .io_a   (DU_Q1D1d3_io_s     ), //i
    .io_b   (xorDvr_4           ), //i
    .io_y   (DU_Q0D0d3_io_c     ), //i
    .io_sel (DU_Q0D0d12_EXT_io_c), //i
    .io_s   (DU_Q0D0d4_io_s     ), //o
    .io_c   (DU_Q0D0d4_io_c     )  //o
  );
  DIVUNIT DU_Q0D0d5 (
    .io_a   (DU_Q1D1d4_io_s     ), //i
    .io_b   (xorDvr_5           ), //i
    .io_y   (DU_Q0D0d4_io_c     ), //i
    .io_sel (DU_Q0D0d12_EXT_io_c), //i
    .io_s   (DU_Q0D0d5_io_s     ), //o
    .io_c   (DU_Q0D0d5_io_c     )  //o
  );
  DIVUNIT DU_Q0D0d6 (
    .io_a   (DU_Q1D1d5_io_s     ), //i
    .io_b   (xorDvr_6           ), //i
    .io_y   (DU_Q0D0d5_io_c     ), //i
    .io_sel (DU_Q0D0d12_EXT_io_c), //i
    .io_s   (DU_Q0D0d6_io_s     ), //o
    .io_c   (DU_Q0D0d6_io_c     )  //o
  );
  DIVUNIT DU_Q0D0d7 (
    .io_a   (DU_Q1D1d6_io_s     ), //i
    .io_b   (xorDvr_7           ), //i
    .io_y   (DU_Q0D0d6_io_c     ), //i
    .io_sel (DU_Q0D0d12_EXT_io_c), //i
    .io_s   (DU_Q0D0d7_io_s     ), //o
    .io_c   (DU_Q0D0d7_io_c     )  //o
  );
  DIVUNIT DU_Q1D1d8_EXT (
    .io_a   (DU_Q2D2d7_io_s     ), //i
    .io_b   (1'b1               ), //i
    .io_y   (DU_Q1D1d7_io_c     ), //i
    .io_sel (DU_Q1D1d12_EXT_io_c), //i
    .io_s   (DU_Q1D1d8_EXT_io_s ), //o
    .io_c   (DU_Q1D1d8_EXT_io_c )  //o
  );
  DIVUNIT DU_Q1D1d9_EXT (
    .io_a   (DU_Q2D2d8_EXT_io_s ), //i
    .io_b   (1'b1               ), //i
    .io_y   (DU_Q1D1d8_EXT_io_c ), //i
    .io_sel (DU_Q1D1d12_EXT_io_c), //i
    .io_s   (DU_Q1D1d9_EXT_io_s ), //o
    .io_c   (DU_Q1D1d9_EXT_io_c )  //o
  );
  DIVUNIT DU_Q1D1d10_EXT (
    .io_a   (DU_Q2D2d9_EXT_io_s ), //i
    .io_b   (1'b1               ), //i
    .io_y   (DU_Q1D1d9_EXT_io_c ), //i
    .io_sel (DU_Q1D1d12_EXT_io_c), //i
    .io_s   (DU_Q1D1d10_EXT_io_s), //o
    .io_c   (DU_Q1D1d10_EXT_io_c)  //o
  );
  DIVUNIT DU_Q1D1d11_EXT (
    .io_a   (DU_Q2D2d10_EXT_io_s), //i
    .io_b   (1'b1               ), //i
    .io_y   (DU_Q1D1d10_EXT_io_c), //i
    .io_sel (DU_Q1D1d12_EXT_io_c), //i
    .io_s   (DU_Q1D1d11_EXT_io_s), //o
    .io_c   (DU_Q1D1d11_EXT_io_c)  //o
  );
  DIVUNIT DU_Q1D1d12_EXT (
    .io_a   (DU_Q2D2d11_EXT_io_s), //i
    .io_b   (1'b1               ), //i
    .io_y   (DU_Q1D1d11_EXT_io_c), //i
    .io_sel (DU_Q1D1d12_EXT_io_c), //i
    .io_s   (DU_Q1D1d12_EXT_io_s), //o
    .io_c   (DU_Q1D1d12_EXT_io_c)  //o
  );
  DIVUNIT DU_Q1D1d0 (
    .io_a   (hadDvdTwosS_1      ), //i
    .io_b   (xorDvr_0           ), //i
    .io_y   (dvrTwosEnInverted  ), //i
    .io_sel (DU_Q1D1d12_EXT_io_c), //i
    .io_s   (DU_Q1D1d0_io_s     ), //o
    .io_c   (DU_Q1D1d0_io_c     )  //o
  );
  DIVUNIT DU_Q1D1d1 (
    .io_a   (DU_Q2D2d0_io_s     ), //i
    .io_b   (xorDvr_1           ), //i
    .io_y   (DU_Q1D1d0_io_c     ), //i
    .io_sel (DU_Q1D1d12_EXT_io_c), //i
    .io_s   (DU_Q1D1d1_io_s     ), //o
    .io_c   (DU_Q1D1d1_io_c     )  //o
  );
  DIVUNIT DU_Q1D1d2 (
    .io_a   (DU_Q2D2d1_io_s     ), //i
    .io_b   (xorDvr_2           ), //i
    .io_y   (DU_Q1D1d1_io_c     ), //i
    .io_sel (DU_Q1D1d12_EXT_io_c), //i
    .io_s   (DU_Q1D1d2_io_s     ), //o
    .io_c   (DU_Q1D1d2_io_c     )  //o
  );
  DIVUNIT DU_Q1D1d3 (
    .io_a   (DU_Q2D2d2_io_s     ), //i
    .io_b   (xorDvr_3           ), //i
    .io_y   (DU_Q1D1d2_io_c     ), //i
    .io_sel (DU_Q1D1d12_EXT_io_c), //i
    .io_s   (DU_Q1D1d3_io_s     ), //o
    .io_c   (DU_Q1D1d3_io_c     )  //o
  );
  DIVUNIT DU_Q1D1d4 (
    .io_a   (DU_Q2D2d3_io_s     ), //i
    .io_b   (xorDvr_4           ), //i
    .io_y   (DU_Q1D1d3_io_c     ), //i
    .io_sel (DU_Q1D1d12_EXT_io_c), //i
    .io_s   (DU_Q1D1d4_io_s     ), //o
    .io_c   (DU_Q1D1d4_io_c     )  //o
  );
  DIVUNIT DU_Q1D1d5 (
    .io_a   (DU_Q2D2d4_io_s     ), //i
    .io_b   (xorDvr_5           ), //i
    .io_y   (DU_Q1D1d4_io_c     ), //i
    .io_sel (DU_Q1D1d12_EXT_io_c), //i
    .io_s   (DU_Q1D1d5_io_s     ), //o
    .io_c   (DU_Q1D1d5_io_c     )  //o
  );
  DIVUNIT DU_Q1D1d6 (
    .io_a   (DU_Q2D2d5_io_s     ), //i
    .io_b   (xorDvr_6           ), //i
    .io_y   (DU_Q1D1d5_io_c     ), //i
    .io_sel (DU_Q1D1d12_EXT_io_c), //i
    .io_s   (DU_Q1D1d6_io_s     ), //o
    .io_c   (DU_Q1D1d6_io_c     )  //o
  );
  DIVUNIT DU_Q1D1d7 (
    .io_a   (DU_Q2D2d6_io_s     ), //i
    .io_b   (xorDvr_7           ), //i
    .io_y   (DU_Q1D1d6_io_c     ), //i
    .io_sel (DU_Q1D1d12_EXT_io_c), //i
    .io_s   (DU_Q1D1d7_io_s     ), //o
    .io_c   (DU_Q1D1d7_io_c     )  //o
  );
  DIVUNIT DU_Q2D2d8_EXT (
    .io_a   (DU_Q3D3d7_io_s     ), //i
    .io_b   (1'b1               ), //i
    .io_y   (DU_Q2D2d7_io_c     ), //i
    .io_sel (DU_Q2D2d11_EXT_io_c), //i
    .io_s   (DU_Q2D2d8_EXT_io_s ), //o
    .io_c   (DU_Q2D2d8_EXT_io_c )  //o
  );
  DIVUNIT DU_Q2D2d9_EXT (
    .io_a   (DU_Q3D3d8_EXT_io_s ), //i
    .io_b   (1'b1               ), //i
    .io_y   (DU_Q2D2d8_EXT_io_c ), //i
    .io_sel (DU_Q2D2d11_EXT_io_c), //i
    .io_s   (DU_Q2D2d9_EXT_io_s ), //o
    .io_c   (DU_Q2D2d9_EXT_io_c )  //o
  );
  DIVUNIT DU_Q2D2d10_EXT (
    .io_a   (DU_Q3D3d9_EXT_io_s ), //i
    .io_b   (1'b1               ), //i
    .io_y   (DU_Q2D2d9_EXT_io_c ), //i
    .io_sel (DU_Q2D2d11_EXT_io_c), //i
    .io_s   (DU_Q2D2d10_EXT_io_s), //o
    .io_c   (DU_Q2D2d10_EXT_io_c)  //o
  );
  DIVUNIT DU_Q2D2d11_EXT (
    .io_a   (DU_Q3D3d10_EXT_io_s), //i
    .io_b   (1'b1               ), //i
    .io_y   (DU_Q2D2d10_EXT_io_c), //i
    .io_sel (DU_Q2D2d11_EXT_io_c), //i
    .io_s   (DU_Q2D2d11_EXT_io_s), //o
    .io_c   (DU_Q2D2d11_EXT_io_c)  //o
  );
  DIVUNIT DU_Q2D2d0 (
    .io_a   (hadDvdTwosS_2      ), //i
    .io_b   (xorDvr_0           ), //i
    .io_y   (dvrTwosEnInverted  ), //i
    .io_sel (DU_Q2D2d11_EXT_io_c), //i
    .io_s   (DU_Q2D2d0_io_s     ), //o
    .io_c   (DU_Q2D2d0_io_c     )  //o
  );
  DIVUNIT DU_Q2D2d1 (
    .io_a   (DU_Q3D3d0_io_s     ), //i
    .io_b   (xorDvr_1           ), //i
    .io_y   (DU_Q2D2d0_io_c     ), //i
    .io_sel (DU_Q2D2d11_EXT_io_c), //i
    .io_s   (DU_Q2D2d1_io_s     ), //o
    .io_c   (DU_Q2D2d1_io_c     )  //o
  );
  DIVUNIT DU_Q2D2d2 (
    .io_a   (DU_Q3D3d1_io_s     ), //i
    .io_b   (xorDvr_2           ), //i
    .io_y   (DU_Q2D2d1_io_c     ), //i
    .io_sel (DU_Q2D2d11_EXT_io_c), //i
    .io_s   (DU_Q2D2d2_io_s     ), //o
    .io_c   (DU_Q2D2d2_io_c     )  //o
  );
  DIVUNIT DU_Q2D2d3 (
    .io_a   (DU_Q3D3d2_io_s     ), //i
    .io_b   (xorDvr_3           ), //i
    .io_y   (DU_Q2D2d2_io_c     ), //i
    .io_sel (DU_Q2D2d11_EXT_io_c), //i
    .io_s   (DU_Q2D2d3_io_s     ), //o
    .io_c   (DU_Q2D2d3_io_c     )  //o
  );
  DIVUNIT DU_Q2D2d4 (
    .io_a   (DU_Q3D3d3_io_s     ), //i
    .io_b   (xorDvr_4           ), //i
    .io_y   (DU_Q2D2d3_io_c     ), //i
    .io_sel (DU_Q2D2d11_EXT_io_c), //i
    .io_s   (DU_Q2D2d4_io_s     ), //o
    .io_c   (DU_Q2D2d4_io_c     )  //o
  );
  DIVUNIT DU_Q2D2d5 (
    .io_a   (DU_Q3D3d4_io_s     ), //i
    .io_b   (xorDvr_5           ), //i
    .io_y   (DU_Q2D2d4_io_c     ), //i
    .io_sel (DU_Q2D2d11_EXT_io_c), //i
    .io_s   (DU_Q2D2d5_io_s     ), //o
    .io_c   (DU_Q2D2d5_io_c     )  //o
  );
  DIVUNIT DU_Q2D2d6 (
    .io_a   (DU_Q3D3d5_io_s     ), //i
    .io_b   (xorDvr_6           ), //i
    .io_y   (DU_Q2D2d5_io_c     ), //i
    .io_sel (DU_Q2D2d11_EXT_io_c), //i
    .io_s   (DU_Q2D2d6_io_s     ), //o
    .io_c   (DU_Q2D2d6_io_c     )  //o
  );
  DIVUNIT DU_Q2D2d7 (
    .io_a   (DU_Q3D3d6_io_s     ), //i
    .io_b   (xorDvr_7           ), //i
    .io_y   (DU_Q2D2d6_io_c     ), //i
    .io_sel (DU_Q2D2d11_EXT_io_c), //i
    .io_s   (DU_Q2D2d7_io_s     ), //o
    .io_c   (DU_Q2D2d7_io_c     )  //o
  );
  DIVUNIT DU_Q3D3d8_EXT (
    .io_a   (DU_Q4D4d7_io_s     ), //i
    .io_b   (1'b1               ), //i
    .io_y   (DU_Q3D3d7_io_c     ), //i
    .io_sel (DU_Q3D3d10_EXT_io_c), //i
    .io_s   (DU_Q3D3d8_EXT_io_s ), //o
    .io_c   (DU_Q3D3d8_EXT_io_c )  //o
  );
  DIVUNIT DU_Q3D3d9_EXT (
    .io_a   (DU_Q4D4d8_EXT_io_s ), //i
    .io_b   (1'b1               ), //i
    .io_y   (DU_Q3D3d8_EXT_io_c ), //i
    .io_sel (DU_Q3D3d10_EXT_io_c), //i
    .io_s   (DU_Q3D3d9_EXT_io_s ), //o
    .io_c   (DU_Q3D3d9_EXT_io_c )  //o
  );
  DIVUNIT DU_Q3D3d10_EXT (
    .io_a   (DU_Q4D4d9_EXT_io_s ), //i
    .io_b   (1'b1               ), //i
    .io_y   (DU_Q3D3d9_EXT_io_c ), //i
    .io_sel (DU_Q3D3d10_EXT_io_c), //i
    .io_s   (DU_Q3D3d10_EXT_io_s), //o
    .io_c   (DU_Q3D3d10_EXT_io_c)  //o
  );
  DIVUNIT DU_Q3D3d0 (
    .io_a   (hadDvdTwosS_3      ), //i
    .io_b   (xorDvr_0           ), //i
    .io_y   (dvrTwosEnInverted  ), //i
    .io_sel (DU_Q3D3d10_EXT_io_c), //i
    .io_s   (DU_Q3D3d0_io_s     ), //o
    .io_c   (DU_Q3D3d0_io_c     )  //o
  );
  DIVUNIT DU_Q3D3d1 (
    .io_a   (DU_Q4D4d0_io_s     ), //i
    .io_b   (xorDvr_1           ), //i
    .io_y   (DU_Q3D3d0_io_c     ), //i
    .io_sel (DU_Q3D3d10_EXT_io_c), //i
    .io_s   (DU_Q3D3d1_io_s     ), //o
    .io_c   (DU_Q3D3d1_io_c     )  //o
  );
  DIVUNIT DU_Q3D3d2 (
    .io_a   (DU_Q4D4d1_io_s     ), //i
    .io_b   (xorDvr_2           ), //i
    .io_y   (DU_Q3D3d1_io_c     ), //i
    .io_sel (DU_Q3D3d10_EXT_io_c), //i
    .io_s   (DU_Q3D3d2_io_s     ), //o
    .io_c   (DU_Q3D3d2_io_c     )  //o
  );
  DIVUNIT DU_Q3D3d3 (
    .io_a   (DU_Q4D4d2_io_s     ), //i
    .io_b   (xorDvr_3           ), //i
    .io_y   (DU_Q3D3d2_io_c     ), //i
    .io_sel (DU_Q3D3d10_EXT_io_c), //i
    .io_s   (DU_Q3D3d3_io_s     ), //o
    .io_c   (DU_Q3D3d3_io_c     )  //o
  );
  DIVUNIT DU_Q3D3d4 (
    .io_a   (DU_Q4D4d3_io_s     ), //i
    .io_b   (xorDvr_4           ), //i
    .io_y   (DU_Q3D3d3_io_c     ), //i
    .io_sel (DU_Q3D3d10_EXT_io_c), //i
    .io_s   (DU_Q3D3d4_io_s     ), //o
    .io_c   (DU_Q3D3d4_io_c     )  //o
  );
  DIVUNIT DU_Q3D3d5 (
    .io_a   (DU_Q4D4d4_io_s     ), //i
    .io_b   (xorDvr_5           ), //i
    .io_y   (DU_Q3D3d4_io_c     ), //i
    .io_sel (DU_Q3D3d10_EXT_io_c), //i
    .io_s   (DU_Q3D3d5_io_s     ), //o
    .io_c   (DU_Q3D3d5_io_c     )  //o
  );
  DIVUNIT DU_Q3D3d6 (
    .io_a   (DU_Q4D4d5_io_s     ), //i
    .io_b   (xorDvr_6           ), //i
    .io_y   (DU_Q3D3d5_io_c     ), //i
    .io_sel (DU_Q3D3d10_EXT_io_c), //i
    .io_s   (DU_Q3D3d6_io_s     ), //o
    .io_c   (DU_Q3D3d6_io_c     )  //o
  );
  DIVUNIT DU_Q3D3d7 (
    .io_a   (DU_Q4D4d6_io_s     ), //i
    .io_b   (xorDvr_7           ), //i
    .io_y   (DU_Q3D3d6_io_c     ), //i
    .io_sel (DU_Q3D3d10_EXT_io_c), //i
    .io_s   (DU_Q3D3d7_io_s     ), //o
    .io_c   (DU_Q3D3d7_io_c     )  //o
  );
  DIVUNIT DU_Q4D4d8_EXT (
    .io_a   (DU_Q5D5d7_io_s    ), //i
    .io_b   (1'b1              ), //i
    .io_y   (DU_Q4D4d7_io_c    ), //i
    .io_sel (DU_Q4D4d9_EXT_io_c), //i
    .io_s   (DU_Q4D4d8_EXT_io_s), //o
    .io_c   (DU_Q4D4d8_EXT_io_c)  //o
  );
  DIVUNIT DU_Q4D4d9_EXT (
    .io_a   (DU_Q5D5d8_EXT_io_s), //i
    .io_b   (1'b1              ), //i
    .io_y   (DU_Q4D4d8_EXT_io_c), //i
    .io_sel (DU_Q4D4d9_EXT_io_c), //i
    .io_s   (DU_Q4D4d9_EXT_io_s), //o
    .io_c   (DU_Q4D4d9_EXT_io_c)  //o
  );
  DIVUNIT DU_Q4D4d0 (
    .io_a   (hadDvdTwosS_4     ), //i
    .io_b   (xorDvr_0          ), //i
    .io_y   (dvrTwosEnInverted ), //i
    .io_sel (DU_Q4D4d9_EXT_io_c), //i
    .io_s   (DU_Q4D4d0_io_s    ), //o
    .io_c   (DU_Q4D4d0_io_c    )  //o
  );
  DIVUNIT DU_Q4D4d1 (
    .io_a   (DU_Q5D5d0_io_s    ), //i
    .io_b   (xorDvr_1          ), //i
    .io_y   (DU_Q4D4d0_io_c    ), //i
    .io_sel (DU_Q4D4d9_EXT_io_c), //i
    .io_s   (DU_Q4D4d1_io_s    ), //o
    .io_c   (DU_Q4D4d1_io_c    )  //o
  );
  DIVUNIT DU_Q4D4d2 (
    .io_a   (DU_Q5D5d1_io_s    ), //i
    .io_b   (xorDvr_2          ), //i
    .io_y   (DU_Q4D4d1_io_c    ), //i
    .io_sel (DU_Q4D4d9_EXT_io_c), //i
    .io_s   (DU_Q4D4d2_io_s    ), //o
    .io_c   (DU_Q4D4d2_io_c    )  //o
  );
  DIVUNIT DU_Q4D4d3 (
    .io_a   (DU_Q5D5d2_io_s    ), //i
    .io_b   (xorDvr_3          ), //i
    .io_y   (DU_Q4D4d2_io_c    ), //i
    .io_sel (DU_Q4D4d9_EXT_io_c), //i
    .io_s   (DU_Q4D4d3_io_s    ), //o
    .io_c   (DU_Q4D4d3_io_c    )  //o
  );
  DIVUNIT DU_Q4D4d4 (
    .io_a   (DU_Q5D5d3_io_s    ), //i
    .io_b   (xorDvr_4          ), //i
    .io_y   (DU_Q4D4d3_io_c    ), //i
    .io_sel (DU_Q4D4d9_EXT_io_c), //i
    .io_s   (DU_Q4D4d4_io_s    ), //o
    .io_c   (DU_Q4D4d4_io_c    )  //o
  );
  DIVUNIT DU_Q4D4d5 (
    .io_a   (DU_Q5D5d4_io_s    ), //i
    .io_b   (xorDvr_5          ), //i
    .io_y   (DU_Q4D4d4_io_c    ), //i
    .io_sel (DU_Q4D4d9_EXT_io_c), //i
    .io_s   (DU_Q4D4d5_io_s    ), //o
    .io_c   (DU_Q4D4d5_io_c    )  //o
  );
  DIVUNIT DU_Q4D4d6 (
    .io_a   (DU_Q5D5d5_io_s    ), //i
    .io_b   (xorDvr_6          ), //i
    .io_y   (DU_Q4D4d5_io_c    ), //i
    .io_sel (DU_Q4D4d9_EXT_io_c), //i
    .io_s   (DU_Q4D4d6_io_s    ), //o
    .io_c   (DU_Q4D4d6_io_c    )  //o
  );
  DIVUNIT DU_Q4D4d7 (
    .io_a   (DU_Q5D5d6_io_s    ), //i
    .io_b   (xorDvr_7          ), //i
    .io_y   (DU_Q4D4d6_io_c    ), //i
    .io_sel (DU_Q4D4d9_EXT_io_c), //i
    .io_s   (DU_Q4D4d7_io_s    ), //o
    .io_c   (DU_Q4D4d7_io_c    )  //o
  );
  DIVUNIT DU_Q5D5d8_EXT (
    .io_a   (DU_Q6D6d7_io_s    ), //i
    .io_b   (1'b1              ), //i
    .io_y   (DU_Q5D5d7_io_c    ), //i
    .io_sel (DU_Q5D5d8_EXT_io_c), //i
    .io_s   (DU_Q5D5d8_EXT_io_s), //o
    .io_c   (DU_Q5D5d8_EXT_io_c)  //o
  );
  DIVUNIT DU_Q5D5d0 (
    .io_a   (hadDvdTwosS_5     ), //i
    .io_b   (xorDvr_0          ), //i
    .io_y   (dvrTwosEnInverted ), //i
    .io_sel (DU_Q5D5d8_EXT_io_c), //i
    .io_s   (DU_Q5D5d0_io_s    ), //o
    .io_c   (DU_Q5D5d0_io_c    )  //o
  );
  DIVUNIT DU_Q5D5d1 (
    .io_a   (DU_Q6D6d0_io_s    ), //i
    .io_b   (xorDvr_1          ), //i
    .io_y   (DU_Q5D5d0_io_c    ), //i
    .io_sel (DU_Q5D5d8_EXT_io_c), //i
    .io_s   (DU_Q5D5d1_io_s    ), //o
    .io_c   (DU_Q5D5d1_io_c    )  //o
  );
  DIVUNIT DU_Q5D5d2 (
    .io_a   (DU_Q6D6d1_io_s    ), //i
    .io_b   (xorDvr_2          ), //i
    .io_y   (DU_Q5D5d1_io_c    ), //i
    .io_sel (DU_Q5D5d8_EXT_io_c), //i
    .io_s   (DU_Q5D5d2_io_s    ), //o
    .io_c   (DU_Q5D5d2_io_c    )  //o
  );
  DIVUNIT DU_Q5D5d3 (
    .io_a   (DU_Q6D6d2_io_s    ), //i
    .io_b   (xorDvr_3          ), //i
    .io_y   (DU_Q5D5d2_io_c    ), //i
    .io_sel (DU_Q5D5d8_EXT_io_c), //i
    .io_s   (DU_Q5D5d3_io_s    ), //o
    .io_c   (DU_Q5D5d3_io_c    )  //o
  );
  DIVUNIT DU_Q5D5d4 (
    .io_a   (DU_Q6D6d3_io_s    ), //i
    .io_b   (xorDvr_4          ), //i
    .io_y   (DU_Q5D5d3_io_c    ), //i
    .io_sel (DU_Q5D5d8_EXT_io_c), //i
    .io_s   (DU_Q5D5d4_io_s    ), //o
    .io_c   (DU_Q5D5d4_io_c    )  //o
  );
  DIVUNIT DU_Q5D5d5 (
    .io_a   (DU_Q6D6d4_io_s    ), //i
    .io_b   (xorDvr_5          ), //i
    .io_y   (DU_Q5D5d4_io_c    ), //i
    .io_sel (DU_Q5D5d8_EXT_io_c), //i
    .io_s   (DU_Q5D5d5_io_s    ), //o
    .io_c   (DU_Q5D5d5_io_c    )  //o
  );
  DIVUNIT DU_Q5D5d6 (
    .io_a   (DU_Q6D6d5_io_s    ), //i
    .io_b   (xorDvr_6          ), //i
    .io_y   (DU_Q5D5d5_io_c    ), //i
    .io_sel (DU_Q5D5d8_EXT_io_c), //i
    .io_s   (DU_Q5D5d6_io_s    ), //o
    .io_c   (DU_Q5D5d6_io_c    )  //o
  );
  DIVUNIT DU_Q5D5d7 (
    .io_a   (DU_Q6D6d6_io_s    ), //i
    .io_b   (xorDvr_7          ), //i
    .io_y   (DU_Q5D5d6_io_c    ), //i
    .io_sel (DU_Q5D5d8_EXT_io_c), //i
    .io_s   (DU_Q5D5d7_io_s    ), //o
    .io_c   (DU_Q5D5d7_io_c    )  //o
  );
  DIVUNIT DU_Q6D6d0 (
    .io_a   (hadDvdTwosS_6    ), //i
    .io_b   (xorDvr_0         ), //i
    .io_y   (dvrTwosEnInverted), //i
    .io_sel (DU_Q6D6d7_io_c   ), //i
    .io_s   (DU_Q6D6d0_io_s   ), //o
    .io_c   (DU_Q6D6d0_io_c   )  //o
  );
  DIVUNIT DU_Q6D6d1 (
    .io_a   (DU_Q7D7d0_io_s), //i
    .io_b   (xorDvr_1      ), //i
    .io_y   (DU_Q6D6d0_io_c), //i
    .io_sel (DU_Q6D6d7_io_c), //i
    .io_s   (DU_Q6D6d1_io_s), //o
    .io_c   (DU_Q6D6d1_io_c)  //o
  );
  DIVUNIT DU_Q6D6d2 (
    .io_a   (DU_Q7D7d1_io_s), //i
    .io_b   (xorDvr_2      ), //i
    .io_y   (DU_Q6D6d1_io_c), //i
    .io_sel (DU_Q6D6d7_io_c), //i
    .io_s   (DU_Q6D6d2_io_s), //o
    .io_c   (DU_Q6D6d2_io_c)  //o
  );
  DIVUNIT DU_Q6D6d3 (
    .io_a   (DU_Q7D7d2_io_s), //i
    .io_b   (xorDvr_3      ), //i
    .io_y   (DU_Q6D6d2_io_c), //i
    .io_sel (DU_Q6D6d7_io_c), //i
    .io_s   (DU_Q6D6d3_io_s), //o
    .io_c   (DU_Q6D6d3_io_c)  //o
  );
  DIVUNIT DU_Q6D6d4 (
    .io_a   (DU_Q7D7d3_io_s), //i
    .io_b   (xorDvr_4      ), //i
    .io_y   (DU_Q6D6d3_io_c), //i
    .io_sel (DU_Q6D6d7_io_c), //i
    .io_s   (DU_Q6D6d4_io_s), //o
    .io_c   (DU_Q6D6d4_io_c)  //o
  );
  DIVUNIT DU_Q6D6d5 (
    .io_a   (DU_Q7D7d4_io_s), //i
    .io_b   (xorDvr_5      ), //i
    .io_y   (DU_Q6D6d4_io_c), //i
    .io_sel (DU_Q6D6d7_io_c), //i
    .io_s   (DU_Q6D6d5_io_s), //o
    .io_c   (DU_Q6D6d5_io_c)  //o
  );
  DIVUNIT DU_Q6D6d6 (
    .io_a   (DU_Q7D7d5_io_s), //i
    .io_b   (xorDvr_6      ), //i
    .io_y   (DU_Q6D6d5_io_c), //i
    .io_sel (DU_Q6D6d7_io_c), //i
    .io_s   (DU_Q6D6d6_io_s), //o
    .io_c   (DU_Q6D6d6_io_c)  //o
  );
  DIVUNIT DU_Q6D6d7 (
    .io_a   (DU_Q7D7d6_io_s), //i
    .io_b   (xorDvr_7      ), //i
    .io_y   (DU_Q6D6d6_io_c), //i
    .io_sel (DU_Q6D6d7_io_c), //i
    .io_s   (DU_Q6D6d7_io_s), //o
    .io_c   (DU_Q6D6d7_io_c)  //o
  );
  DIVUNIT DU_Q7D7d0 (
    .io_a   (hadDvdTwosS_7    ), //i
    .io_b   (xorDvr_0         ), //i
    .io_y   (dvrTwosEnInverted), //i
    .io_sel (DU_Q7D7d7_io_c   ), //i
    .io_s   (DU_Q7D7d0_io_s   ), //o
    .io_c   (DU_Q7D7d0_io_c   )  //o
  );
  DIVUNIT DU_Q7D7d1 (
    .io_a   (1'b0          ), //i
    .io_b   (xorDvr_1      ), //i
    .io_y   (DU_Q7D7d0_io_c), //i
    .io_sel (DU_Q7D7d7_io_c), //i
    .io_s   (DU_Q7D7d1_io_s), //o
    .io_c   (DU_Q7D7d1_io_c)  //o
  );
  DIVUNIT DU_Q7D7d2 (
    .io_a   (1'b0          ), //i
    .io_b   (xorDvr_2      ), //i
    .io_y   (DU_Q7D7d1_io_c), //i
    .io_sel (DU_Q7D7d7_io_c), //i
    .io_s   (DU_Q7D7d2_io_s), //o
    .io_c   (DU_Q7D7d2_io_c)  //o
  );
  DIVUNIT DU_Q7D7d3 (
    .io_a   (1'b0          ), //i
    .io_b   (xorDvr_3      ), //i
    .io_y   (DU_Q7D7d2_io_c), //i
    .io_sel (DU_Q7D7d7_io_c), //i
    .io_s   (DU_Q7D7d3_io_s), //o
    .io_c   (DU_Q7D7d3_io_c)  //o
  );
  DIVUNIT DU_Q7D7d4 (
    .io_a   (1'b0          ), //i
    .io_b   (xorDvr_4      ), //i
    .io_y   (DU_Q7D7d3_io_c), //i
    .io_sel (DU_Q7D7d7_io_c), //i
    .io_s   (DU_Q7D7d4_io_s), //o
    .io_c   (DU_Q7D7d4_io_c)  //o
  );
  DIVUNIT DU_Q7D7d5 (
    .io_a   (1'b0          ), //i
    .io_b   (xorDvr_5      ), //i
    .io_y   (DU_Q7D7d4_io_c), //i
    .io_sel (DU_Q7D7d7_io_c), //i
    .io_s   (DU_Q7D7d5_io_s), //o
    .io_c   (DU_Q7D7d5_io_c)  //o
  );
  DIVUNIT DU_Q7D7d6 (
    .io_a   (1'b0          ), //i
    .io_b   (xorDvr_6      ), //i
    .io_y   (DU_Q7D7d5_io_c), //i
    .io_sel (DU_Q7D7d7_io_c), //i
    .io_s   (DU_Q7D7d6_io_s), //o
    .io_c   (DU_Q7D7d6_io_c)  //o
  );
  DIVUNIT DU_Q7D7d7 (
    .io_a   (1'b0          ), //i
    .io_b   (xorDvr_7      ), //i
    .io_y   (DU_Q7D7d6_io_c), //i
    .io_sel (DU_Q7D7d7_io_c), //i
    .io_s   (DU_Q7D7d7_io_s), //o
    .io_c   (DU_Q7D7d7_io_c)  //o
  );
  HA_24 HAR0_SIGN (
    .io_a (HAR0_SIGN_io_a), //i
    .io_b (dvdTwosEn     ), //i
    .io_s (HAR0_SIGN_io_s), //o
    .io_c (HAR0_SIGN_io_c)  //o
  );
  HA_24 HAR1_SIGN (
    .io_a (HAR1_SIGN_io_a), //i
    .io_b (HAR0_SIGN_io_c), //i
    .io_s (HAR1_SIGN_io_s), //o
    .io_c (HAR1_SIGN_io_c)  //o
  );
  HA_24 HAR2_SIGN (
    .io_a (HAR2_SIGN_io_a), //i
    .io_b (HAR1_SIGN_io_c), //i
    .io_s (HAR2_SIGN_io_s), //o
    .io_c (HAR2_SIGN_io_c)  //o
  );
  HA_24 HAR3_SIGN (
    .io_a (HAR3_SIGN_io_a), //i
    .io_b (HAR2_SIGN_io_c), //i
    .io_s (HAR3_SIGN_io_s), //o
    .io_c (HAR3_SIGN_io_c)  //o
  );
  HA_24 HAR4_SIGN (
    .io_a (HAR4_SIGN_io_a), //i
    .io_b (HAR3_SIGN_io_c), //i
    .io_s (HAR4_SIGN_io_s), //o
    .io_c (HAR4_SIGN_io_c)  //o
  );
  HA_24 HAR5_SIGN (
    .io_a (HAR5_SIGN_io_a), //i
    .io_b (HAR4_SIGN_io_c), //i
    .io_s (HAR5_SIGN_io_s), //o
    .io_c (HAR5_SIGN_io_c)  //o
  );
  HA_24 HAR6_SIGN (
    .io_a (HAR6_SIGN_io_a), //i
    .io_b (HAR5_SIGN_io_c), //i
    .io_s (HAR6_SIGN_io_s), //o
    .io_c (HAR6_SIGN_io_c)  //o
  );
  HA_24 HAR7_SIGN (
    .io_a (HAR7_SIGN_io_a), //i
    .io_b (HAR6_SIGN_io_c), //i
    .io_s (HAR7_SIGN_io_s), //o
    .io_c (HAR7_SIGN_io_c)  //o
  );
  HA_24 HAQ0_SIGN (
    .io_a (HAQ0_SIGN_io_a), //i
    .io_b (qSign         ), //i
    .io_s (HAQ0_SIGN_io_s), //o
    .io_c (HAQ0_SIGN_io_c)  //o
  );
  HA_24 HAQ1_SIGN (
    .io_a (HAQ1_SIGN_io_a), //i
    .io_b (HAQ0_SIGN_io_c), //i
    .io_s (HAQ1_SIGN_io_s), //o
    .io_c (HAQ1_SIGN_io_c)  //o
  );
  HA_24 HAQ2_SIGN (
    .io_a (HAQ2_SIGN_io_a), //i
    .io_b (HAQ1_SIGN_io_c), //i
    .io_s (HAQ2_SIGN_io_s), //o
    .io_c (HAQ2_SIGN_io_c)  //o
  );
  HA_24 HAQ3_SIGN (
    .io_a (HAQ3_SIGN_io_a), //i
    .io_b (HAQ2_SIGN_io_c), //i
    .io_s (HAQ3_SIGN_io_s), //o
    .io_c (HAQ3_SIGN_io_c)  //o
  );
  HA_24 HAQ4_SIGN (
    .io_a (HAQ4_SIGN_io_a), //i
    .io_b (HAQ3_SIGN_io_c), //i
    .io_s (HAQ4_SIGN_io_s), //o
    .io_c (HAQ4_SIGN_io_c)  //o
  );
  HA_24 HAQ5_SIGN (
    .io_a (HAQ5_SIGN_io_a), //i
    .io_b (HAQ4_SIGN_io_c), //i
    .io_s (HAQ5_SIGN_io_s), //o
    .io_c (HAQ5_SIGN_io_c)  //o
  );
  HA_24 HAQ6_SIGN (
    .io_a (HAQ6_SIGN_io_a), //i
    .io_b (HAQ5_SIGN_io_c), //i
    .io_s (HAQ6_SIGN_io_s), //o
    .io_c (HAQ6_SIGN_io_c)  //o
  );
  HA_24 HAQ7_SIGN (
    .io_a (HAQ7_SIGN_io_a), //i
    .io_b (HAQ6_SIGN_io_c), //i
    .io_s (HAQ7_SIGN_io_s), //o
    .io_c (HAQ7_SIGN_io_c)  //o
  );
  assign isZero = (! (|io_dsor));
  assign dvdTwosEn = (io_opsigned && io_dend[7]);
  assign dvrTwosEn = (io_opsigned && io_dsor[7]);
  assign dvrTwosEnInverted = (! dvrTwosEn);
  assign qSign = (dvdTwosEn ^ dvrTwosEn);
  assign HAD_DVD_TWOS_0_io_a = (io_dend[0] ^ dvdTwosEn);
  assign HAD_DVD_TWOS_0_io_b = _zz_io_b[0];
  assign hadDvdTwosS_0 = HAD_DVD_TWOS_0_io_s;
  assign HAD_DVD_TWOS_1_io_a = (io_dend[1] ^ dvdTwosEn);
  assign hadDvdTwosS_1 = HAD_DVD_TWOS_1_io_s;
  assign HAD_DVD_TWOS_2_io_a = (io_dend[2] ^ dvdTwosEn);
  assign hadDvdTwosS_2 = HAD_DVD_TWOS_2_io_s;
  assign HAD_DVD_TWOS_3_io_a = (io_dend[3] ^ dvdTwosEn);
  assign hadDvdTwosS_3 = HAD_DVD_TWOS_3_io_s;
  assign HAD_DVD_TWOS_4_io_a = (io_dend[4] ^ dvdTwosEn);
  assign hadDvdTwosS_4 = HAD_DVD_TWOS_4_io_s;
  assign HAD_DVD_TWOS_5_io_a = (io_dend[5] ^ dvdTwosEn);
  assign hadDvdTwosS_5 = HAD_DVD_TWOS_5_io_s;
  assign HAD_DVD_TWOS_6_io_a = (io_dend[6] ^ dvdTwosEn);
  assign hadDvdTwosS_6 = HAD_DVD_TWOS_6_io_s;
  assign HAD_DVD_TWOS_7_io_a = (io_dend[7] ^ dvdTwosEn);
  assign hadDvdTwosS_7 = HAD_DVD_TWOS_7_io_s;
  assign xorDvr_0 = (io_dsor[0] ^ dvrTwosEnInverted);
  assign xorDvr_1 = (io_dsor[1] ^ dvrTwosEnInverted);
  assign xorDvr_2 = (io_dsor[2] ^ dvrTwosEnInverted);
  assign xorDvr_3 = (io_dsor[3] ^ dvrTwosEnInverted);
  assign xorDvr_4 = (io_dsor[4] ^ dvrTwosEnInverted);
  assign xorDvr_5 = (io_dsor[5] ^ dvrTwosEnInverted);
  assign xorDvr_6 = (io_dsor[6] ^ dvrTwosEnInverted);
  assign xorDvr_7 = (io_dsor[7] ^ dvrTwosEnInverted);
  assign HAR0_SIGN_io_a = (dvdTwosEn ^ DU_Q0D0d0_io_s);
  assign HAR1_SIGN_io_a = (dvdTwosEn ^ DU_Q0D0d1_io_s);
  assign HAR2_SIGN_io_a = (dvdTwosEn ^ DU_Q0D0d2_io_s);
  assign HAR3_SIGN_io_a = (dvdTwosEn ^ DU_Q0D0d3_io_s);
  assign HAR4_SIGN_io_a = (dvdTwosEn ^ DU_Q0D0d4_io_s);
  assign HAR5_SIGN_io_a = (dvdTwosEn ^ DU_Q0D0d5_io_s);
  assign HAR6_SIGN_io_a = (dvdTwosEn ^ DU_Q0D0d6_io_s);
  assign HAR7_SIGN_io_a = (dvdTwosEn ^ DU_Q0D0d7_io_s);
  assign HAQ0_SIGN_io_a = (qSign ^ DU_Q0D0d12_EXT_io_c);
  assign HAQ1_SIGN_io_a = (qSign ^ DU_Q1D1d12_EXT_io_c);
  assign HAQ2_SIGN_io_a = (qSign ^ DU_Q2D2d11_EXT_io_c);
  assign HAQ3_SIGN_io_a = (qSign ^ DU_Q3D3d10_EXT_io_c);
  assign HAQ4_SIGN_io_a = (qSign ^ DU_Q4D4d9_EXT_io_c);
  assign HAQ5_SIGN_io_a = (qSign ^ DU_Q5D5d8_EXT_io_c);
  assign HAQ6_SIGN_io_a = (qSign ^ DU_Q6D6d7_io_c);
  assign HAQ7_SIGN_io_a = (qSign ^ DU_Q7D7d7_io_c);
  always @(*) begin
    io_q[0] = HAQ0_SIGN_io_s;
    io_q[1] = HAQ1_SIGN_io_s;
    io_q[2] = HAQ2_SIGN_io_s;
    io_q[3] = HAQ3_SIGN_io_s;
    io_q[4] = HAQ4_SIGN_io_s;
    io_q[5] = HAQ5_SIGN_io_s;
    io_q[6] = HAQ6_SIGN_io_s;
    io_q[7] = HAQ7_SIGN_io_s;
  end

  always @(*) begin
    io_r[0] = HAR0_SIGN_io_s;
    io_r[1] = HAR1_SIGN_io_s;
    io_r[2] = HAR2_SIGN_io_s;
    io_r[3] = HAR3_SIGN_io_s;
    io_r[4] = HAR4_SIGN_io_s;
    io_r[5] = HAR5_SIGN_io_s;
    io_r[6] = HAR6_SIGN_io_s;
    io_r[7] = HAR7_SIGN_io_s;
  end

  assign io_edivzero = (io_en ? isZero : 1'b0);
  assign io_edivoverflow = (io_en ? DU_Q7D7d7_io_s : 1'b0);

endmodule

module Mul (
  input               io_en,
  input               io_opsigned,
  input      [7:0]    io_a,
  input      [7:0]    io_b,
  output reg [15:0]   io_p
);

  wire                HA_P1A0B1_io_s;
  wire                HA_P1A0B1_io_c;
  wire                FA_P2A1B1_io_s;
  wire                FA_P2A1B1_io_c;
  wire                HA_P2A0B2_io_s;
  wire                HA_P2A0B2_io_c;
  wire                FA_P3A2B1_io_s;
  wire                FA_P3A2B1_io_c;
  wire                FA_P3A1B2_io_s;
  wire                FA_P3A1B2_io_c;
  wire                HA_P3A0B3_io_s;
  wire                HA_P3A0B3_io_c;
  wire                FA_P4A3B1_io_s;
  wire                FA_P4A3B1_io_c;
  wire                FA_P4A2B2_io_s;
  wire                FA_P4A2B2_io_c;
  wire                FA_P4A1B3_io_s;
  wire                FA_P4A1B3_io_c;
  wire                HA_P4A0B4_io_s;
  wire                HA_P4A0B4_io_c;
  wire                FA_P5A4B1_io_s;
  wire                FA_P5A4B1_io_c;
  wire                FA_P5A3B2_io_s;
  wire                FA_P5A3B2_io_c;
  wire                FA_P5A2B3_io_s;
  wire                FA_P5A2B3_io_c;
  wire                FA_P5A1B4_io_s;
  wire                FA_P5A1B4_io_c;
  wire                HA_P5A0B5_io_s;
  wire                HA_P5A0B5_io_c;
  wire                FA_P6A5B1_io_s;
  wire                FA_P6A5B1_io_c;
  wire                FA_P6A4B2_io_s;
  wire                FA_P6A4B2_io_c;
  wire                FA_P6A3B3_io_s;
  wire                FA_P6A3B3_io_c;
  wire                FA_P6A2B4_io_s;
  wire                FA_P6A2B4_io_c;
  wire                FA_P6A1B5_io_s;
  wire                FA_P6A1B5_io_c;
  wire                HA_P6A0B6_io_s;
  wire                HA_P6A0B6_io_c;
  wire                FA_P7A6B1_io_s;
  wire                FA_P7A6B1_io_c;
  wire                FA_P7A5B2_io_s;
  wire                FA_P7A5B2_io_c;
  wire                FA_P7A4B3_io_s;
  wire                FA_P7A4B3_io_c;
  wire                FA_P7A3B4_io_s;
  wire                FA_P7A3B4_io_c;
  wire                FA_P7A2B5_io_s;
  wire                FA_P7A2B5_io_c;
  wire                FA_P7A1B6_io_s;
  wire                FA_P7A1B6_io_c;
  wire                FA_P7A0B7_io_s;
  wire                FA_P7A0B7_io_c;
  wire                FA_P8A7B1_io_s;
  wire                FA_P8A7B1_io_c;
  wire                FA_P8A6B2_io_s;
  wire                FA_P8A6B2_io_c;
  wire                FA_P8A5B3_io_s;
  wire                FA_P8A5B3_io_c;
  wire                FA_P8A4B4_io_s;
  wire                FA_P8A4B4_io_c;
  wire                FA_P8A3B5_io_s;
  wire                FA_P8A3B5_io_c;
  wire                FA_P8A2B6_io_s;
  wire                FA_P8A2B6_io_c;
  wire                FA_P8A1B7_io_s;
  wire                FA_P8A1B7_io_c;
  wire                FA_P9A7B1_io_s;
  wire                FA_P9A7B1_io_c;
  wire                FA_P9A7B2_io_s;
  wire                FA_P9A7B2_io_c;
  wire                FA_P9A6B3_io_s;
  wire                FA_P9A6B3_io_c;
  wire                FA_P9A5B4_io_s;
  wire                FA_P9A5B4_io_c;
  wire                FA_P9A4B5_io_s;
  wire                FA_P9A4B5_io_c;
  wire                FA_P9A3B6_io_s;
  wire                FA_P9A3B6_io_c;
  wire                FA_P9A2B7_io_s;
  wire                FA_P9A2B7_io_c;
  wire                FA_P10A7B1_io_s;
  wire                FA_P10A7B1_io_c;
  wire                FA_P10A7B2_io_s;
  wire                FA_P10A7B2_io_c;
  wire                FA_P10A7B3_io_s;
  wire                FA_P10A7B3_io_c;
  wire                FA_P10A6B4_io_s;
  wire                FA_P10A6B4_io_c;
  wire                FA_P10A5B5_io_s;
  wire                FA_P10A5B5_io_c;
  wire                FA_P10A4B6_io_s;
  wire                FA_P10A4B6_io_c;
  wire                FA_P10A3B7_io_s;
  wire                FA_P10A3B7_io_c;
  wire                FA_P11A7B1_io_s;
  wire                FA_P11A7B1_io_c;
  wire                FA_P11A7B2_io_s;
  wire                FA_P11A7B2_io_c;
  wire                FA_P11A7B3_io_s;
  wire                FA_P11A7B3_io_c;
  wire                FA_P11A7B4_io_s;
  wire                FA_P11A7B4_io_c;
  wire                FA_P11A6B5_io_s;
  wire                FA_P11A6B5_io_c;
  wire                FA_P11A5B6_io_s;
  wire                FA_P11A5B6_io_c;
  wire                FA_P11A4B7_io_s;
  wire                FA_P11A4B7_io_c;
  wire                FA_P12A7B1_io_s;
  wire                FA_P12A7B1_io_c;
  wire                FA_P12A7B2_io_s;
  wire                FA_P12A7B2_io_c;
  wire                FA_P12A7B3_io_s;
  wire                FA_P12A7B3_io_c;
  wire                FA_P12A7B4_io_s;
  wire                FA_P12A7B4_io_c;
  wire                FA_P12A7B5_io_s;
  wire                FA_P12A7B5_io_c;
  wire                FA_P12A6B6_io_s;
  wire                FA_P12A6B6_io_c;
  wire                FA_P12A5B7_io_s;
  wire                FA_P12A5B7_io_c;
  wire                FA_P13A7B1_io_s;
  wire                FA_P13A7B1_io_c;
  wire                FA_P13A7B2_io_s;
  wire                FA_P13A7B2_io_c;
  wire                FA_P13A7B3_io_s;
  wire                FA_P13A7B3_io_c;
  wire                FA_P13A7B4_io_s;
  wire                FA_P13A7B4_io_c;
  wire                FA_P13A7B5_io_s;
  wire                FA_P13A7B5_io_c;
  wire                FA_P13A7B6_io_s;
  wire                FA_P13A7B6_io_c;
  wire                FA_P13A6B7_io_s;
  wire                FA_P13A6B7_io_c;
  wire                FA_P14A7B1_io_s;
  wire                FA_P14A7B1_io_c;
  wire                FA_P14A7B2_io_s;
  wire                FA_P14A7B2_io_c;
  wire                FA_P14A7B3_io_s;
  wire                FA_P14A7B3_io_c;
  wire                FA_P14A7B4_io_s;
  wire                FA_P14A7B4_io_c;
  wire                FA_P14A7B5_io_s;
  wire                FA_P14A7B5_io_c;
  wire                FA_P14A7B6_io_s;
  wire                FA_P14A7B6_io_c;
  wire                FA_P14A7B7_io_s;
  wire                FA_P14A7B7_io_c;
  wire                FA_P15A7B1_io_s;
  wire                FA_P15A7B1_io_c;
  wire                FA_P15A7B2_io_s;
  wire                FA_P15A7B2_io_c;
  wire                FA_P15A7B3_io_s;
  wire                FA_P15A7B3_io_c;
  wire                FA_P15A7B4_io_s;
  wire                FA_P15A7B4_io_c;
  wire                FA_P15A7B5_io_s;
  wire                FA_P15A7B5_io_c;
  wire                FA_P15A7B6_io_s;
  wire                FA_P15A7B6_io_c;
  wire                FA_P15A7B7_io_s;
  wire                FA_P15A7B7_io_c;
  wire                A0xB0_0;
  wire                A1xB0_1;
  wire                A2xB0_2;
  wire                A3xB0_3;
  wire                A4xB0_4;
  wire                A5xB0_5;
  wire                A6xB0_6;
  wire                A7xB0_7;
  wire                A0xB1_8;
  wire                A1xB1_9;
  wire                A2xB1_10;
  wire                A3xB1_11;
  wire                A4xB1_12;
  wire                A5xB1_13;
  wire                A6xB1_14;
  wire                A7xB1_15;
  wire                A0xB2_16;
  wire                A1xB2_17;
  wire                A2xB2_18;
  wire                A3xB2_19;
  wire                A4xB2_20;
  wire                A5xB2_21;
  wire                A6xB2_22;
  wire                A7xB2_23;
  wire                A0xB3_24;
  wire                A1xB3_25;
  wire                A2xB3_26;
  wire                A3xB3_27;
  wire                A4xB3_28;
  wire                A5xB3_29;
  wire                A6xB3_30;
  wire                A7xB3_31;
  wire                A0xB4_32;
  wire                A1xB4_33;
  wire                A2xB4_34;
  wire                A3xB4_35;
  wire                A4xB4_36;
  wire                A5xB4_37;
  wire                A6xB4_38;
  wire                A7xB4_39;
  wire                A0xB5_40;
  wire                A1xB5_41;
  wire                A2xB5_42;
  wire                A3xB5_43;
  wire                A4xB5_44;
  wire                A5xB5_45;
  wire                A6xB5_46;
  wire                A7xB5_47;
  wire                A0xB6_48;
  wire                A1xB6_49;
  wire                A2xB6_50;
  wire                A3xB6_51;
  wire                A4xB6_52;
  wire                A5xB6_53;
  wire                A6xB6_54;
  wire                A7xB6_55;
  wire                A0xB7_56;
  wire                A1xB7_57;
  wire                A2xB7_58;
  wire                A3xB7_59;
  wire                A4xB7_60;
  wire                A5xB7_61;
  wire                A6xB7_62;
  wire                A7xB7_63;
  wire                twosEn;
  wire                P7_INV;
  wire                P8_INV;
  wire                P9_INV;
  wire                P10_INV;
  wire                P11_INV;
  wire                P12_INV;
  wire                P13_INV;
  wire                P14_INV;
  wire                P7_EXTEN_EN;
  wire                P8_EXTEN_EN;
  wire                P9_EXTEN_EN;
  wire                P10_EXTEN_EN;
  wire                P11_EXTEN_EN;
  wire                P12_EXTEN_EN;
  wire                P13_EXTEN_EN;
  wire                P14_EXTEN_EN;

  HA_24 HA_P1A0B1 (
    .io_a (A1xB0_1       ), //i
    .io_b (A0xB1_8       ), //i
    .io_s (HA_P1A0B1_io_s), //o
    .io_c (HA_P1A0B1_io_c)  //o
  );
  FA FA_P2A1B1 (
    .io_a (A2xB0_2       ), //i
    .io_b (A1xB1_9       ), //i
    .io_y (HA_P1A0B1_io_c), //i
    .io_s (FA_P2A1B1_io_s), //o
    .io_c (FA_P2A1B1_io_c)  //o
  );
  HA_24 HA_P2A0B2 (
    .io_a (FA_P2A1B1_io_s), //i
    .io_b (A0xB2_16      ), //i
    .io_s (HA_P2A0B2_io_s), //o
    .io_c (HA_P2A0B2_io_c)  //o
  );
  FA FA_P3A2B1 (
    .io_a (A3xB0_3       ), //i
    .io_b (A2xB1_10      ), //i
    .io_y (FA_P2A1B1_io_c), //i
    .io_s (FA_P3A2B1_io_s), //o
    .io_c (FA_P3A2B1_io_c)  //o
  );
  FA FA_P3A1B2 (
    .io_a (FA_P3A2B1_io_s), //i
    .io_b (A1xB2_17      ), //i
    .io_y (HA_P2A0B2_io_c), //i
    .io_s (FA_P3A1B2_io_s), //o
    .io_c (FA_P3A1B2_io_c)  //o
  );
  HA_24 HA_P3A0B3 (
    .io_a (FA_P3A1B2_io_s), //i
    .io_b (A0xB3_24      ), //i
    .io_s (HA_P3A0B3_io_s), //o
    .io_c (HA_P3A0B3_io_c)  //o
  );
  FA FA_P4A3B1 (
    .io_a (A4xB0_4       ), //i
    .io_b (A3xB1_11      ), //i
    .io_y (FA_P3A2B1_io_c), //i
    .io_s (FA_P4A3B1_io_s), //o
    .io_c (FA_P4A3B1_io_c)  //o
  );
  FA FA_P4A2B2 (
    .io_a (FA_P4A3B1_io_s), //i
    .io_b (A2xB2_18      ), //i
    .io_y (FA_P3A1B2_io_c), //i
    .io_s (FA_P4A2B2_io_s), //o
    .io_c (FA_P4A2B2_io_c)  //o
  );
  FA FA_P4A1B3 (
    .io_a (FA_P4A2B2_io_s), //i
    .io_b (A1xB3_25      ), //i
    .io_y (HA_P3A0B3_io_c), //i
    .io_s (FA_P4A1B3_io_s), //o
    .io_c (FA_P4A1B3_io_c)  //o
  );
  HA_24 HA_P4A0B4 (
    .io_a (FA_P4A1B3_io_s), //i
    .io_b (A0xB4_32      ), //i
    .io_s (HA_P4A0B4_io_s), //o
    .io_c (HA_P4A0B4_io_c)  //o
  );
  FA FA_P5A4B1 (
    .io_a (A5xB0_5       ), //i
    .io_b (A4xB1_12      ), //i
    .io_y (FA_P4A3B1_io_c), //i
    .io_s (FA_P5A4B1_io_s), //o
    .io_c (FA_P5A4B1_io_c)  //o
  );
  FA FA_P5A3B2 (
    .io_a (FA_P5A4B1_io_s), //i
    .io_b (A3xB2_19      ), //i
    .io_y (FA_P4A2B2_io_c), //i
    .io_s (FA_P5A3B2_io_s), //o
    .io_c (FA_P5A3B2_io_c)  //o
  );
  FA FA_P5A2B3 (
    .io_a (FA_P5A3B2_io_s), //i
    .io_b (A2xB3_26      ), //i
    .io_y (FA_P4A1B3_io_c), //i
    .io_s (FA_P5A2B3_io_s), //o
    .io_c (FA_P5A2B3_io_c)  //o
  );
  FA FA_P5A1B4 (
    .io_a (FA_P5A2B3_io_s), //i
    .io_b (A1xB4_33      ), //i
    .io_y (HA_P4A0B4_io_c), //i
    .io_s (FA_P5A1B4_io_s), //o
    .io_c (FA_P5A1B4_io_c)  //o
  );
  HA_24 HA_P5A0B5 (
    .io_a (FA_P5A1B4_io_s), //i
    .io_b (A0xB5_40      ), //i
    .io_s (HA_P5A0B5_io_s), //o
    .io_c (HA_P5A0B5_io_c)  //o
  );
  FA FA_P6A5B1 (
    .io_a (A6xB0_6       ), //i
    .io_b (A5xB1_13      ), //i
    .io_y (FA_P5A4B1_io_c), //i
    .io_s (FA_P6A5B1_io_s), //o
    .io_c (FA_P6A5B1_io_c)  //o
  );
  FA FA_P6A4B2 (
    .io_a (FA_P6A5B1_io_s), //i
    .io_b (A4xB2_20      ), //i
    .io_y (FA_P5A3B2_io_c), //i
    .io_s (FA_P6A4B2_io_s), //o
    .io_c (FA_P6A4B2_io_c)  //o
  );
  FA FA_P6A3B3 (
    .io_a (FA_P6A4B2_io_s), //i
    .io_b (A3xB3_27      ), //i
    .io_y (FA_P5A2B3_io_c), //i
    .io_s (FA_P6A3B3_io_s), //o
    .io_c (FA_P6A3B3_io_c)  //o
  );
  FA FA_P6A2B4 (
    .io_a (FA_P6A3B3_io_s), //i
    .io_b (A2xB4_34      ), //i
    .io_y (FA_P5A1B4_io_c), //i
    .io_s (FA_P6A2B4_io_s), //o
    .io_c (FA_P6A2B4_io_c)  //o
  );
  FA FA_P6A1B5 (
    .io_a (FA_P6A2B4_io_s), //i
    .io_b (A1xB5_41      ), //i
    .io_y (HA_P5A0B5_io_c), //i
    .io_s (FA_P6A1B5_io_s), //o
    .io_c (FA_P6A1B5_io_c)  //o
  );
  HA_24 HA_P6A0B6 (
    .io_a (FA_P6A1B5_io_s), //i
    .io_b (A0xB6_48      ), //i
    .io_s (HA_P6A0B6_io_s), //o
    .io_c (HA_P6A0B6_io_c)  //o
  );
  FA FA_P7A6B1 (
    .io_a (A7xB0_7       ), //i
    .io_b (A6xB1_14      ), //i
    .io_y (FA_P6A5B1_io_c), //i
    .io_s (FA_P7A6B1_io_s), //o
    .io_c (FA_P7A6B1_io_c)  //o
  );
  FA FA_P7A5B2 (
    .io_a (FA_P7A6B1_io_s), //i
    .io_b (A5xB2_21      ), //i
    .io_y (FA_P6A4B2_io_c), //i
    .io_s (FA_P7A5B2_io_s), //o
    .io_c (FA_P7A5B2_io_c)  //o
  );
  FA FA_P7A4B3 (
    .io_a (FA_P7A5B2_io_s), //i
    .io_b (A4xB3_28      ), //i
    .io_y (FA_P6A3B3_io_c), //i
    .io_s (FA_P7A4B3_io_s), //o
    .io_c (FA_P7A4B3_io_c)  //o
  );
  FA FA_P7A3B4 (
    .io_a (FA_P7A4B3_io_s), //i
    .io_b (A3xB4_35      ), //i
    .io_y (FA_P6A2B4_io_c), //i
    .io_s (FA_P7A3B4_io_s), //o
    .io_c (FA_P7A3B4_io_c)  //o
  );
  FA FA_P7A2B5 (
    .io_a (FA_P7A3B4_io_s), //i
    .io_b (A2xB5_42      ), //i
    .io_y (FA_P6A1B5_io_c), //i
    .io_s (FA_P7A2B5_io_s), //o
    .io_c (FA_P7A2B5_io_c)  //o
  );
  FA FA_P7A1B6 (
    .io_a (FA_P7A2B5_io_s), //i
    .io_b (A1xB6_49      ), //i
    .io_y (HA_P6A0B6_io_c), //i
    .io_s (FA_P7A1B6_io_s), //o
    .io_c (FA_P7A1B6_io_c)  //o
  );
  FA FA_P7A0B7 (
    .io_a (FA_P7A1B6_io_s), //i
    .io_b (P7_INV        ), //i
    .io_y (twosEn        ), //i
    .io_s (FA_P7A0B7_io_s), //o
    .io_c (FA_P7A0B7_io_c)  //o
  );
  FA FA_P8A7B1 (
    .io_a (P7_EXTEN_EN   ), //i
    .io_b (A7xB1_15      ), //i
    .io_y (FA_P7A6B1_io_c), //i
    .io_s (FA_P8A7B1_io_s), //o
    .io_c (FA_P8A7B1_io_c)  //o
  );
  FA FA_P8A6B2 (
    .io_a (FA_P8A7B1_io_s), //i
    .io_b (A6xB2_22      ), //i
    .io_y (FA_P7A5B2_io_c), //i
    .io_s (FA_P8A6B2_io_s), //o
    .io_c (FA_P8A6B2_io_c)  //o
  );
  FA FA_P8A5B3 (
    .io_a (FA_P8A6B2_io_s), //i
    .io_b (A5xB3_29      ), //i
    .io_y (FA_P7A4B3_io_c), //i
    .io_s (FA_P8A5B3_io_s), //o
    .io_c (FA_P8A5B3_io_c)  //o
  );
  FA FA_P8A4B4 (
    .io_a (FA_P8A5B3_io_s), //i
    .io_b (A4xB4_36      ), //i
    .io_y (FA_P7A3B4_io_c), //i
    .io_s (FA_P8A4B4_io_s), //o
    .io_c (FA_P8A4B4_io_c)  //o
  );
  FA FA_P8A3B5 (
    .io_a (FA_P8A4B4_io_s), //i
    .io_b (A3xB5_43      ), //i
    .io_y (FA_P7A2B5_io_c), //i
    .io_s (FA_P8A3B5_io_s), //o
    .io_c (FA_P8A3B5_io_c)  //o
  );
  FA FA_P8A2B6 (
    .io_a (FA_P8A3B5_io_s), //i
    .io_b (A2xB6_50      ), //i
    .io_y (FA_P7A1B6_io_c), //i
    .io_s (FA_P8A2B6_io_s), //o
    .io_c (FA_P8A2B6_io_c)  //o
  );
  FA FA_P8A1B7 (
    .io_a (FA_P8A2B6_io_s), //i
    .io_b (P8_INV        ), //i
    .io_y (FA_P7A0B7_io_c), //i
    .io_s (FA_P8A1B7_io_s), //o
    .io_c (FA_P8A1B7_io_c)  //o
  );
  FA FA_P9A7B1 (
    .io_a (P7_EXTEN_EN   ), //i
    .io_b (P8_EXTEN_EN   ), //i
    .io_y (FA_P8A7B1_io_c), //i
    .io_s (FA_P9A7B1_io_s), //o
    .io_c (FA_P9A7B1_io_c)  //o
  );
  FA FA_P9A7B2 (
    .io_a (FA_P9A7B1_io_s), //i
    .io_b (A7xB2_23      ), //i
    .io_y (FA_P8A6B2_io_c), //i
    .io_s (FA_P9A7B2_io_s), //o
    .io_c (FA_P9A7B2_io_c)  //o
  );
  FA FA_P9A6B3 (
    .io_a (FA_P9A7B2_io_s), //i
    .io_b (A6xB3_30      ), //i
    .io_y (FA_P8A5B3_io_c), //i
    .io_s (FA_P9A6B3_io_s), //o
    .io_c (FA_P9A6B3_io_c)  //o
  );
  FA FA_P9A5B4 (
    .io_a (FA_P9A6B3_io_s), //i
    .io_b (A5xB4_37      ), //i
    .io_y (FA_P8A4B4_io_c), //i
    .io_s (FA_P9A5B4_io_s), //o
    .io_c (FA_P9A5B4_io_c)  //o
  );
  FA FA_P9A4B5 (
    .io_a (FA_P9A5B4_io_s), //i
    .io_b (A4xB5_44      ), //i
    .io_y (FA_P8A3B5_io_c), //i
    .io_s (FA_P9A4B5_io_s), //o
    .io_c (FA_P9A4B5_io_c)  //o
  );
  FA FA_P9A3B6 (
    .io_a (FA_P9A4B5_io_s), //i
    .io_b (A3xB6_51      ), //i
    .io_y (FA_P8A2B6_io_c), //i
    .io_s (FA_P9A3B6_io_s), //o
    .io_c (FA_P9A3B6_io_c)  //o
  );
  FA FA_P9A2B7 (
    .io_a (FA_P9A3B6_io_s), //i
    .io_b (P9_INV        ), //i
    .io_y (FA_P8A1B7_io_c), //i
    .io_s (FA_P9A2B7_io_s), //o
    .io_c (FA_P9A2B7_io_c)  //o
  );
  FA FA_P10A7B1 (
    .io_a (P7_EXTEN_EN    ), //i
    .io_b (P8_EXTEN_EN    ), //i
    .io_y (FA_P9A7B1_io_c ), //i
    .io_s (FA_P10A7B1_io_s), //o
    .io_c (FA_P10A7B1_io_c)  //o
  );
  FA FA_P10A7B2 (
    .io_a (FA_P10A7B1_io_s), //i
    .io_b (P9_EXTEN_EN    ), //i
    .io_y (FA_P9A7B2_io_c ), //i
    .io_s (FA_P10A7B2_io_s), //o
    .io_c (FA_P10A7B2_io_c)  //o
  );
  FA FA_P10A7B3 (
    .io_a (FA_P10A7B2_io_s), //i
    .io_b (A7xB3_31       ), //i
    .io_y (FA_P9A6B3_io_c ), //i
    .io_s (FA_P10A7B3_io_s), //o
    .io_c (FA_P10A7B3_io_c)  //o
  );
  FA FA_P10A6B4 (
    .io_a (FA_P10A7B3_io_s), //i
    .io_b (A6xB4_38       ), //i
    .io_y (FA_P9A5B4_io_c ), //i
    .io_s (FA_P10A6B4_io_s), //o
    .io_c (FA_P10A6B4_io_c)  //o
  );
  FA FA_P10A5B5 (
    .io_a (FA_P10A6B4_io_s), //i
    .io_b (A5xB5_45       ), //i
    .io_y (FA_P9A4B5_io_c ), //i
    .io_s (FA_P10A5B5_io_s), //o
    .io_c (FA_P10A5B5_io_c)  //o
  );
  FA FA_P10A4B6 (
    .io_a (FA_P10A5B5_io_s), //i
    .io_b (A4xB6_52       ), //i
    .io_y (FA_P9A3B6_io_c ), //i
    .io_s (FA_P10A4B6_io_s), //o
    .io_c (FA_P10A4B6_io_c)  //o
  );
  FA FA_P10A3B7 (
    .io_a (FA_P10A4B6_io_s), //i
    .io_b (P10_INV        ), //i
    .io_y (FA_P9A2B7_io_c ), //i
    .io_s (FA_P10A3B7_io_s), //o
    .io_c (FA_P10A3B7_io_c)  //o
  );
  FA FA_P11A7B1 (
    .io_a (P7_EXTEN_EN    ), //i
    .io_b (P8_EXTEN_EN    ), //i
    .io_y (FA_P10A7B1_io_c), //i
    .io_s (FA_P11A7B1_io_s), //o
    .io_c (FA_P11A7B1_io_c)  //o
  );
  FA FA_P11A7B2 (
    .io_a (FA_P11A7B1_io_s), //i
    .io_b (P9_EXTEN_EN    ), //i
    .io_y (FA_P10A7B2_io_c), //i
    .io_s (FA_P11A7B2_io_s), //o
    .io_c (FA_P11A7B2_io_c)  //o
  );
  FA FA_P11A7B3 (
    .io_a (FA_P11A7B2_io_s), //i
    .io_b (P10_EXTEN_EN   ), //i
    .io_y (FA_P10A7B3_io_c), //i
    .io_s (FA_P11A7B3_io_s), //o
    .io_c (FA_P11A7B3_io_c)  //o
  );
  FA FA_P11A7B4 (
    .io_a (FA_P11A7B3_io_s), //i
    .io_b (A7xB4_39       ), //i
    .io_y (FA_P10A6B4_io_c), //i
    .io_s (FA_P11A7B4_io_s), //o
    .io_c (FA_P11A7B4_io_c)  //o
  );
  FA FA_P11A6B5 (
    .io_a (FA_P11A7B4_io_s), //i
    .io_b (A6xB5_46       ), //i
    .io_y (FA_P10A5B5_io_c), //i
    .io_s (FA_P11A6B5_io_s), //o
    .io_c (FA_P11A6B5_io_c)  //o
  );
  FA FA_P11A5B6 (
    .io_a (FA_P11A6B5_io_s), //i
    .io_b (A5xB6_53       ), //i
    .io_y (FA_P10A4B6_io_c), //i
    .io_s (FA_P11A5B6_io_s), //o
    .io_c (FA_P11A5B6_io_c)  //o
  );
  FA FA_P11A4B7 (
    .io_a (FA_P11A5B6_io_s), //i
    .io_b (P11_INV        ), //i
    .io_y (FA_P10A3B7_io_c), //i
    .io_s (FA_P11A4B7_io_s), //o
    .io_c (FA_P11A4B7_io_c)  //o
  );
  FA FA_P12A7B1 (
    .io_a (P7_EXTEN_EN    ), //i
    .io_b (P8_EXTEN_EN    ), //i
    .io_y (FA_P11A7B1_io_c), //i
    .io_s (FA_P12A7B1_io_s), //o
    .io_c (FA_P12A7B1_io_c)  //o
  );
  FA FA_P12A7B2 (
    .io_a (FA_P12A7B1_io_s), //i
    .io_b (P9_EXTEN_EN    ), //i
    .io_y (FA_P11A7B2_io_c), //i
    .io_s (FA_P12A7B2_io_s), //o
    .io_c (FA_P12A7B2_io_c)  //o
  );
  FA FA_P12A7B3 (
    .io_a (FA_P12A7B2_io_s), //i
    .io_b (P10_EXTEN_EN   ), //i
    .io_y (FA_P11A7B3_io_c), //i
    .io_s (FA_P12A7B3_io_s), //o
    .io_c (FA_P12A7B3_io_c)  //o
  );
  FA FA_P12A7B4 (
    .io_a (FA_P12A7B3_io_s), //i
    .io_b (P11_EXTEN_EN   ), //i
    .io_y (FA_P11A7B4_io_c), //i
    .io_s (FA_P12A7B4_io_s), //o
    .io_c (FA_P12A7B4_io_c)  //o
  );
  FA FA_P12A7B5 (
    .io_a (FA_P12A7B4_io_s), //i
    .io_b (A7xB5_47       ), //i
    .io_y (FA_P11A6B5_io_c), //i
    .io_s (FA_P12A7B5_io_s), //o
    .io_c (FA_P12A7B5_io_c)  //o
  );
  FA FA_P12A6B6 (
    .io_a (FA_P12A7B5_io_s), //i
    .io_b (A6xB6_54       ), //i
    .io_y (FA_P11A5B6_io_c), //i
    .io_s (FA_P12A6B6_io_s), //o
    .io_c (FA_P12A6B6_io_c)  //o
  );
  FA FA_P12A5B7 (
    .io_a (FA_P12A6B6_io_s), //i
    .io_b (P12_INV        ), //i
    .io_y (FA_P11A4B7_io_c), //i
    .io_s (FA_P12A5B7_io_s), //o
    .io_c (FA_P12A5B7_io_c)  //o
  );
  FA FA_P13A7B1 (
    .io_a (P7_EXTEN_EN    ), //i
    .io_b (P8_EXTEN_EN    ), //i
    .io_y (FA_P12A7B1_io_c), //i
    .io_s (FA_P13A7B1_io_s), //o
    .io_c (FA_P13A7B1_io_c)  //o
  );
  FA FA_P13A7B2 (
    .io_a (FA_P13A7B1_io_s), //i
    .io_b (P9_EXTEN_EN    ), //i
    .io_y (FA_P12A7B2_io_c), //i
    .io_s (FA_P13A7B2_io_s), //o
    .io_c (FA_P13A7B2_io_c)  //o
  );
  FA FA_P13A7B3 (
    .io_a (FA_P13A7B2_io_s), //i
    .io_b (P10_EXTEN_EN   ), //i
    .io_y (FA_P12A7B3_io_c), //i
    .io_s (FA_P13A7B3_io_s), //o
    .io_c (FA_P13A7B3_io_c)  //o
  );
  FA FA_P13A7B4 (
    .io_a (FA_P13A7B3_io_s), //i
    .io_b (P11_EXTEN_EN   ), //i
    .io_y (FA_P12A7B4_io_c), //i
    .io_s (FA_P13A7B4_io_s), //o
    .io_c (FA_P13A7B4_io_c)  //o
  );
  FA FA_P13A7B5 (
    .io_a (FA_P13A7B4_io_s), //i
    .io_b (P12_EXTEN_EN   ), //i
    .io_y (FA_P12A7B5_io_c), //i
    .io_s (FA_P13A7B5_io_s), //o
    .io_c (FA_P13A7B5_io_c)  //o
  );
  FA FA_P13A7B6 (
    .io_a (FA_P13A7B5_io_s), //i
    .io_b (A7xB6_55       ), //i
    .io_y (FA_P12A6B6_io_c), //i
    .io_s (FA_P13A7B6_io_s), //o
    .io_c (FA_P13A7B6_io_c)  //o
  );
  FA FA_P13A6B7 (
    .io_a (FA_P13A7B6_io_s), //i
    .io_b (P13_INV        ), //i
    .io_y (FA_P12A5B7_io_c), //i
    .io_s (FA_P13A6B7_io_s), //o
    .io_c (FA_P13A6B7_io_c)  //o
  );
  FA FA_P14A7B1 (
    .io_a (P7_EXTEN_EN    ), //i
    .io_b (P8_EXTEN_EN    ), //i
    .io_y (FA_P13A7B1_io_c), //i
    .io_s (FA_P14A7B1_io_s), //o
    .io_c (FA_P14A7B1_io_c)  //o
  );
  FA FA_P14A7B2 (
    .io_a (FA_P14A7B1_io_s), //i
    .io_b (P9_EXTEN_EN    ), //i
    .io_y (FA_P13A7B2_io_c), //i
    .io_s (FA_P14A7B2_io_s), //o
    .io_c (FA_P14A7B2_io_c)  //o
  );
  FA FA_P14A7B3 (
    .io_a (FA_P14A7B2_io_s), //i
    .io_b (P10_EXTEN_EN   ), //i
    .io_y (FA_P13A7B3_io_c), //i
    .io_s (FA_P14A7B3_io_s), //o
    .io_c (FA_P14A7B3_io_c)  //o
  );
  FA FA_P14A7B4 (
    .io_a (FA_P14A7B3_io_s), //i
    .io_b (P11_EXTEN_EN   ), //i
    .io_y (FA_P13A7B4_io_c), //i
    .io_s (FA_P14A7B4_io_s), //o
    .io_c (FA_P14A7B4_io_c)  //o
  );
  FA FA_P14A7B5 (
    .io_a (FA_P14A7B4_io_s), //i
    .io_b (P12_EXTEN_EN   ), //i
    .io_y (FA_P13A7B5_io_c), //i
    .io_s (FA_P14A7B5_io_s), //o
    .io_c (FA_P14A7B5_io_c)  //o
  );
  FA FA_P14A7B6 (
    .io_a (FA_P14A7B5_io_s), //i
    .io_b (P13_EXTEN_EN   ), //i
    .io_y (FA_P13A7B6_io_c), //i
    .io_s (FA_P14A7B6_io_s), //o
    .io_c (FA_P14A7B6_io_c)  //o
  );
  FA FA_P14A7B7 (
    .io_a (FA_P14A7B6_io_s), //i
    .io_b (P14_INV        ), //i
    .io_y (FA_P13A6B7_io_c), //i
    .io_s (FA_P14A7B7_io_s), //o
    .io_c (FA_P14A7B7_io_c)  //o
  );
  FA FA_P15A7B1 (
    .io_a (P7_EXTEN_EN    ), //i
    .io_b (P8_EXTEN_EN    ), //i
    .io_y (FA_P14A7B1_io_c), //i
    .io_s (FA_P15A7B1_io_s), //o
    .io_c (FA_P15A7B1_io_c)  //o
  );
  FA FA_P15A7B2 (
    .io_a (FA_P15A7B1_io_s), //i
    .io_b (P9_EXTEN_EN    ), //i
    .io_y (FA_P14A7B2_io_c), //i
    .io_s (FA_P15A7B2_io_s), //o
    .io_c (FA_P15A7B2_io_c)  //o
  );
  FA FA_P15A7B3 (
    .io_a (FA_P15A7B2_io_s), //i
    .io_b (P10_EXTEN_EN   ), //i
    .io_y (FA_P14A7B3_io_c), //i
    .io_s (FA_P15A7B3_io_s), //o
    .io_c (FA_P15A7B3_io_c)  //o
  );
  FA FA_P15A7B4 (
    .io_a (FA_P15A7B3_io_s), //i
    .io_b (P11_EXTEN_EN   ), //i
    .io_y (FA_P14A7B4_io_c), //i
    .io_s (FA_P15A7B4_io_s), //o
    .io_c (FA_P15A7B4_io_c)  //o
  );
  FA FA_P15A7B5 (
    .io_a (FA_P15A7B4_io_s), //i
    .io_b (P12_EXTEN_EN   ), //i
    .io_y (FA_P14A7B5_io_c), //i
    .io_s (FA_P15A7B5_io_s), //o
    .io_c (FA_P15A7B5_io_c)  //o
  );
  FA FA_P15A7B6 (
    .io_a (FA_P15A7B5_io_s), //i
    .io_b (P13_EXTEN_EN   ), //i
    .io_y (FA_P14A7B6_io_c), //i
    .io_s (FA_P15A7B6_io_s), //o
    .io_c (FA_P15A7B6_io_c)  //o
  );
  FA FA_P15A7B7 (
    .io_a (FA_P15A7B6_io_s), //i
    .io_b (P14_EXTEN_EN   ), //i
    .io_y (FA_P14A7B7_io_c), //i
    .io_s (FA_P15A7B7_io_s), //o
    .io_c (FA_P15A7B7_io_c)  //o
  );
  assign A0xB0_0 = (io_a[0] && io_b[0]);
  assign A0xB1_8 = (io_a[0] && io_b[1]);
  assign A0xB2_16 = (io_a[0] && io_b[2]);
  assign A0xB3_24 = (io_a[0] && io_b[3]);
  assign A0xB4_32 = (io_a[0] && io_b[4]);
  assign A0xB5_40 = (io_a[0] && io_b[5]);
  assign A0xB6_48 = (io_a[0] && io_b[6]);
  assign A0xB7_56 = (io_a[0] && io_b[7]);
  assign A1xB0_1 = (io_a[1] && io_b[0]);
  assign A1xB1_9 = (io_a[1] && io_b[1]);
  assign A1xB2_17 = (io_a[1] && io_b[2]);
  assign A1xB3_25 = (io_a[1] && io_b[3]);
  assign A1xB4_33 = (io_a[1] && io_b[4]);
  assign A1xB5_41 = (io_a[1] && io_b[5]);
  assign A1xB6_49 = (io_a[1] && io_b[6]);
  assign A1xB7_57 = (io_a[1] && io_b[7]);
  assign A2xB0_2 = (io_a[2] && io_b[0]);
  assign A2xB1_10 = (io_a[2] && io_b[1]);
  assign A2xB2_18 = (io_a[2] && io_b[2]);
  assign A2xB3_26 = (io_a[2] && io_b[3]);
  assign A2xB4_34 = (io_a[2] && io_b[4]);
  assign A2xB5_42 = (io_a[2] && io_b[5]);
  assign A2xB6_50 = (io_a[2] && io_b[6]);
  assign A2xB7_58 = (io_a[2] && io_b[7]);
  assign A3xB0_3 = (io_a[3] && io_b[0]);
  assign A3xB1_11 = (io_a[3] && io_b[1]);
  assign A3xB2_19 = (io_a[3] && io_b[2]);
  assign A3xB3_27 = (io_a[3] && io_b[3]);
  assign A3xB4_35 = (io_a[3] && io_b[4]);
  assign A3xB5_43 = (io_a[3] && io_b[5]);
  assign A3xB6_51 = (io_a[3] && io_b[6]);
  assign A3xB7_59 = (io_a[3] && io_b[7]);
  assign A4xB0_4 = (io_a[4] && io_b[0]);
  assign A4xB1_12 = (io_a[4] && io_b[1]);
  assign A4xB2_20 = (io_a[4] && io_b[2]);
  assign A4xB3_28 = (io_a[4] && io_b[3]);
  assign A4xB4_36 = (io_a[4] && io_b[4]);
  assign A4xB5_44 = (io_a[4] && io_b[5]);
  assign A4xB6_52 = (io_a[4] && io_b[6]);
  assign A4xB7_60 = (io_a[4] && io_b[7]);
  assign A5xB0_5 = (io_a[5] && io_b[0]);
  assign A5xB1_13 = (io_a[5] && io_b[1]);
  assign A5xB2_21 = (io_a[5] && io_b[2]);
  assign A5xB3_29 = (io_a[5] && io_b[3]);
  assign A5xB4_37 = (io_a[5] && io_b[4]);
  assign A5xB5_45 = (io_a[5] && io_b[5]);
  assign A5xB6_53 = (io_a[5] && io_b[6]);
  assign A5xB7_61 = (io_a[5] && io_b[7]);
  assign A6xB0_6 = (io_a[6] && io_b[0]);
  assign A6xB1_14 = (io_a[6] && io_b[1]);
  assign A6xB2_22 = (io_a[6] && io_b[2]);
  assign A6xB3_30 = (io_a[6] && io_b[3]);
  assign A6xB4_38 = (io_a[6] && io_b[4]);
  assign A6xB5_46 = (io_a[6] && io_b[5]);
  assign A6xB6_54 = (io_a[6] && io_b[6]);
  assign A6xB7_62 = (io_a[6] && io_b[7]);
  assign A7xB0_7 = (io_a[7] && io_b[0]);
  assign A7xB1_15 = (io_a[7] && io_b[1]);
  assign A7xB2_23 = (io_a[7] && io_b[2]);
  assign A7xB3_31 = (io_a[7] && io_b[3]);
  assign A7xB4_39 = (io_a[7] && io_b[4]);
  assign A7xB5_47 = (io_a[7] && io_b[5]);
  assign A7xB6_55 = (io_a[7] && io_b[6]);
  assign A7xB7_63 = (io_a[7] && io_b[7]);
  assign twosEn = (io_b[7] && io_opsigned);
  assign P7_INV = (twosEn ^ A0xB7_56);
  assign P8_INV = (twosEn ^ A1xB7_57);
  assign P9_INV = (twosEn ^ A2xB7_58);
  assign P10_INV = (twosEn ^ A3xB7_59);
  assign P11_INV = (twosEn ^ A4xB7_60);
  assign P12_INV = (twosEn ^ A5xB7_61);
  assign P13_INV = (twosEn ^ A6xB7_62);
  assign P14_INV = (twosEn ^ A7xB7_63);
  assign P7_EXTEN_EN = (A7xB0_7 && io_opsigned);
  assign P8_EXTEN_EN = (A7xB1_15 && io_opsigned);
  assign P9_EXTEN_EN = (A7xB2_23 && io_opsigned);
  assign P10_EXTEN_EN = (A7xB3_31 && io_opsigned);
  assign P11_EXTEN_EN = (A7xB4_39 && io_opsigned);
  assign P12_EXTEN_EN = (A7xB5_47 && io_opsigned);
  assign P13_EXTEN_EN = (A7xB6_55 && io_opsigned);
  assign P14_EXTEN_EN = (P14_INV && io_opsigned);
  always @(*) begin
    io_p[0] = A0xB0_0;
    io_p[1] = HA_P1A0B1_io_s;
    io_p[2] = HA_P2A0B2_io_s;
    io_p[3] = HA_P3A0B3_io_s;
    io_p[4] = HA_P4A0B4_io_s;
    io_p[5] = HA_P5A0B5_io_s;
    io_p[6] = HA_P6A0B6_io_s;
    io_p[7] = FA_P7A0B7_io_s;
    io_p[8] = FA_P8A1B7_io_s;
    io_p[9] = FA_P9A2B7_io_s;
    io_p[10] = FA_P10A3B7_io_s;
    io_p[11] = FA_P11A4B7_io_s;
    io_p[12] = FA_P12A5B7_io_s;
    io_p[13] = FA_P13A6B7_io_s;
    io_p[14] = FA_P14A7B7_io_s;
    io_p[15] = FA_P15A7B7_io_s;
  end


endmodule

module NegedgeReg (
  input               area_io_en,
  input               area_io_d,
  output reg          area_io_q,
  input               rst_n,
  input               clk
);

  wire                initState;
  wire                when_NegedgeReg_l39;

  assign initState = 1'b1;
  assign when_NegedgeReg_l39 = (! rst_n);
  always @(negedge clk) begin
    if(!rst_n) begin
      area_io_q <= initState;
    end else begin
      if(when_NegedgeReg_l39) begin
        area_io_q <= initState;
      end else begin
        if(area_io_en) begin
          area_io_q <= area_io_d;
        end
      end
    end
  end


endmodule

//HA_23 replaced by HA_24

//HA_22 replaced by HA_24

//HA_21 replaced by HA_24

//HA_20 replaced by HA_24

//HA_19 replaced by HA_24

//HA_18 replaced by HA_24

//HA_17 replaced by HA_24

//HA_16 replaced by HA_24

//HA_15 replaced by HA_24

//HA_14 replaced by HA_24

//HA_13 replaced by HA_24

//HA_12 replaced by HA_24

//HA_11 replaced by HA_24

//HA_10 replaced by HA_24

//HA_9 replaced by HA_24

//HA_8 replaced by HA_24

//DIVUNIT_83 replaced by DIVUNIT

//DIVUNIT_82 replaced by DIVUNIT

//DIVUNIT_81 replaced by DIVUNIT

//DIVUNIT_80 replaced by DIVUNIT

//DIVUNIT_79 replaced by DIVUNIT

//DIVUNIT_78 replaced by DIVUNIT

//DIVUNIT_77 replaced by DIVUNIT

//DIVUNIT_76 replaced by DIVUNIT

//DIVUNIT_75 replaced by DIVUNIT

//DIVUNIT_74 replaced by DIVUNIT

//DIVUNIT_73 replaced by DIVUNIT

//DIVUNIT_72 replaced by DIVUNIT

//DIVUNIT_71 replaced by DIVUNIT

//DIVUNIT_70 replaced by DIVUNIT

//DIVUNIT_69 replaced by DIVUNIT

//DIVUNIT_68 replaced by DIVUNIT

//DIVUNIT_67 replaced by DIVUNIT

//DIVUNIT_66 replaced by DIVUNIT

//DIVUNIT_65 replaced by DIVUNIT

//DIVUNIT_64 replaced by DIVUNIT

//DIVUNIT_63 replaced by DIVUNIT

//DIVUNIT_62 replaced by DIVUNIT

//DIVUNIT_61 replaced by DIVUNIT

//DIVUNIT_60 replaced by DIVUNIT

//DIVUNIT_59 replaced by DIVUNIT

//DIVUNIT_58 replaced by DIVUNIT

//DIVUNIT_57 replaced by DIVUNIT

//DIVUNIT_56 replaced by DIVUNIT

//DIVUNIT_55 replaced by DIVUNIT

//DIVUNIT_54 replaced by DIVUNIT

//DIVUNIT_53 replaced by DIVUNIT

//DIVUNIT_52 replaced by DIVUNIT

//DIVUNIT_51 replaced by DIVUNIT

//DIVUNIT_50 replaced by DIVUNIT

//DIVUNIT_49 replaced by DIVUNIT

//DIVUNIT_48 replaced by DIVUNIT

//DIVUNIT_47 replaced by DIVUNIT

//DIVUNIT_46 replaced by DIVUNIT

//DIVUNIT_45 replaced by DIVUNIT

//DIVUNIT_44 replaced by DIVUNIT

//DIVUNIT_43 replaced by DIVUNIT

//DIVUNIT_42 replaced by DIVUNIT

//DIVUNIT_41 replaced by DIVUNIT

//DIVUNIT_40 replaced by DIVUNIT

//DIVUNIT_39 replaced by DIVUNIT

//DIVUNIT_38 replaced by DIVUNIT

//DIVUNIT_37 replaced by DIVUNIT

//DIVUNIT_36 replaced by DIVUNIT

//DIVUNIT_35 replaced by DIVUNIT

//DIVUNIT_34 replaced by DIVUNIT

//DIVUNIT_33 replaced by DIVUNIT

//DIVUNIT_32 replaced by DIVUNIT

//DIVUNIT_31 replaced by DIVUNIT

//DIVUNIT_30 replaced by DIVUNIT

//DIVUNIT_29 replaced by DIVUNIT

//DIVUNIT_28 replaced by DIVUNIT

//DIVUNIT_27 replaced by DIVUNIT

//DIVUNIT_26 replaced by DIVUNIT

//DIVUNIT_25 replaced by DIVUNIT

//DIVUNIT_24 replaced by DIVUNIT

//DIVUNIT_23 replaced by DIVUNIT

//DIVUNIT_22 replaced by DIVUNIT

//DIVUNIT_21 replaced by DIVUNIT

//DIVUNIT_20 replaced by DIVUNIT

//DIVUNIT_19 replaced by DIVUNIT

//DIVUNIT_18 replaced by DIVUNIT

//DIVUNIT_17 replaced by DIVUNIT

//DIVUNIT_16 replaced by DIVUNIT

//DIVUNIT_15 replaced by DIVUNIT

//DIVUNIT_14 replaced by DIVUNIT

//DIVUNIT_13 replaced by DIVUNIT

//DIVUNIT_12 replaced by DIVUNIT

//DIVUNIT_11 replaced by DIVUNIT

//DIVUNIT_10 replaced by DIVUNIT

//DIVUNIT_9 replaced by DIVUNIT

//DIVUNIT_8 replaced by DIVUNIT

//DIVUNIT_7 replaced by DIVUNIT

//DIVUNIT_6 replaced by DIVUNIT

//DIVUNIT_5 replaced by DIVUNIT

//DIVUNIT_4 replaced by DIVUNIT

//DIVUNIT_3 replaced by DIVUNIT

//DIVUNIT_2 replaced by DIVUNIT

//DIVUNIT_1 replaced by DIVUNIT

module DIVUNIT (
  input               io_a,
  input               io_b,
  input               io_y,
  input               io_sel,
  output              io_s,
  output              io_c
);

  wire                a_and_b;
  wire                b_and_y;
  wire                a_and_y;
  wire                carry;
  wire                sum;

  assign a_and_b = (io_a && io_b);
  assign b_and_y = (io_b && io_y);
  assign a_and_y = (io_a && io_y);
  assign carry = ((a_and_b || b_and_y) || a_and_y);
  assign sum = ((io_a ^ io_b) ^ io_y);
  assign io_s = (io_sel ? sum : io_a);
  assign io_c = carry;

endmodule

//HA_7 replaced by HA_24

//HA_6 replaced by HA_24

//HA_5 replaced by HA_24

//HA_4 replaced by HA_24

//HA_3 replaced by HA_24

//HA_2 replaced by HA_24

//HA_1 replaced by HA_24

//HA replaced by HA_24

//FA_77 replaced by FA

//FA_76 replaced by FA

//FA_75 replaced by FA

//FA_74 replaced by FA

//FA_73 replaced by FA

//FA_72 replaced by FA

//FA_71 replaced by FA

//FA_70 replaced by FA

//FA_69 replaced by FA

//FA_68 replaced by FA

//FA_67 replaced by FA

//FA_66 replaced by FA

//FA_65 replaced by FA

//FA_64 replaced by FA

//FA_63 replaced by FA

//FA_62 replaced by FA

//FA_61 replaced by FA

//FA_60 replaced by FA

//FA_59 replaced by FA

//FA_58 replaced by FA

//FA_57 replaced by FA

//FA_56 replaced by FA

//FA_55 replaced by FA

//FA_54 replaced by FA

//FA_53 replaced by FA

//FA_52 replaced by FA

//FA_51 replaced by FA

//FA_50 replaced by FA

//FA_49 replaced by FA

//FA_48 replaced by FA

//FA_47 replaced by FA

//FA_46 replaced by FA

//FA_45 replaced by FA

//FA_44 replaced by FA

//FA_43 replaced by FA

//FA_42 replaced by FA

//FA_41 replaced by FA

//FA_40 replaced by FA

//FA_39 replaced by FA

//FA_38 replaced by FA

//FA_37 replaced by FA

//FA_36 replaced by FA

//FA_35 replaced by FA

//FA_34 replaced by FA

//FA_33 replaced by FA

//FA_32 replaced by FA

//FA_31 replaced by FA

//FA_30 replaced by FA

//FA_29 replaced by FA

//FA_28 replaced by FA

//FA_27 replaced by FA

//FA_26 replaced by FA

//FA_25 replaced by FA

//FA_24 replaced by FA

//FA_23 replaced by FA

//FA_22 replaced by FA

//FA_21 replaced by FA

//FA_20 replaced by FA

//FA_19 replaced by FA

//FA_18 replaced by FA

//FA_17 replaced by FA

//FA_16 replaced by FA

//FA_15 replaced by FA

//HA_29 replaced by HA_24

//FA_14 replaced by FA

//FA_13 replaced by FA

//FA_12 replaced by FA

//FA_11 replaced by FA

//FA_10 replaced by FA

//HA_28 replaced by HA_24

//FA_9 replaced by FA

//FA_8 replaced by FA

//FA_7 replaced by FA

//FA_6 replaced by FA

//HA_27 replaced by HA_24

//FA_5 replaced by FA

//FA_4 replaced by FA

//FA_3 replaced by FA

//HA_26 replaced by HA_24

//FA_2 replaced by FA

//FA_1 replaced by FA

//HA_25 replaced by HA_24

module FA (
  input               io_a,
  input               io_b,
  input               io_y,
  output              io_s,
  output              io_c
);

  wire                a_and_b;
  wire                b_and_y;
  wire                a_and_y;

  assign a_and_b = (io_a && io_b);
  assign b_and_y = (io_b && io_y);
  assign a_and_y = (io_a && io_y);
  assign io_c = ((a_and_b || b_and_y) || a_and_y);
  assign io_s = ((io_a ^ io_b) ^ io_y);

endmodule

module HA_24 (
  input               io_a,
  input               io_b,
  output              io_s,
  output              io_c
);


  assign io_c = (io_a && io_b);
  assign io_s = (io_a ^ io_b);

endmodule
