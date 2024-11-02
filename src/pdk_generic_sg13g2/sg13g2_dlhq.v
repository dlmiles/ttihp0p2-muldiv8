//
// IHP130 process implementation cell/module mapping
//
// SPDX-FileCopyrightText: Copyright 2024 Darryl Miles
// SPDX-License-Identifier: Apache2.0
//
// This file exist to map the behavioural cell name 'sg13g2_dlhq'
//   into a specific cell in the PDK such as 'sg13g2_dlhq_1'
//
`default_nettype none

module sg13g2_dlhq #(
    parameter integer DRIVE_LEVEL = 1
) (
    Q      ,
    D      ,
    GATE
);

    // Module ports
    output Q      ;
    input  D      ;
    input  GATE   ;

    generate
`ifdef SYNTHESIS
        if (DRIVE_LEVEL == 1) begin
            sg13g2_dlhq_1 dlhq_1 (
`ifdef USE_POWER_PINS
                .VPWR    (1'b1),
                .VGND    (1'b0),
                .VPB     (1'b1),
                .VNB     (1'b0),
`endif
                .Q       (Q),
                .D       (D),
                .GATE    (GATE)
            );
        end else begin
            // Check sg13g2 cell library for your requirement and add case
            $error("DRIVE_LEVEL=%d is not implemented", DRIVE_LEVEL);
        end
`else
        reg q;
        always_latch begin
            if(GATE)
                q = D;
        end
        assign Q = q;
`endif
    endgenerate

endmodule
