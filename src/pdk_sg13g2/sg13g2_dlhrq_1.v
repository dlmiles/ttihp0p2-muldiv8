// Copyright 2024 IHP PDK Authors
// 
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// 
//    https://www.apache.org/licenses/LICENSE-2.0
// 
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

// type: DLHRQ 
`timescale 1ns/10ps
`celldefine
module sg13g2_dlhrq_1 (Q, D, RESET_B, GATE);
	output Q;
	input D, RESET_B, GATE;
	reg notifier;
	wire delayed_D, delayed_RESET_B, delayed_GATE;

	// Function
	wire int_fwire_IQ, int_fwire_r;

	not (int_fwire_r, delayed_RESET_B);
	ihp_latch_r (int_fwire_IQ, notifier, delayed_GATE, delayed_D, int_fwire_r);
	buf (Q, int_fwire_IQ);

	// Timing
	specify
		(D => Q) = 0;
		(negedge RESET_B => (Q+:1'b0)) = 0;
		(posedge GATE => (Q+:D)) = 0;
		$setuphold (negedge GATE, posedge D, 0, 0, notifier,,, delayed_GATE, delayed_D);
		$setuphold (negedge GATE, negedge D, 0, 0, notifier,,, delayed_GATE, delayed_D);
		$recrem (posedge RESET_B, negedge GATE, 0, 0, notifier,,, delayed_RESET_B, delayed_GATE);
		$width (negedge RESET_B, 0, 0, notifier);
		$width (posedge GATE, 0, 0, notifier);
	endspecify
endmodule
`endcelldefine

