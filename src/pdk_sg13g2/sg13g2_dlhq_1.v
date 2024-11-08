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

// type: DLHQ 
`timescale 1ns/10ps
`celldefine
module sg13g2_dlhq_1 (Q, D, GATE);
	output Q;
	input D, GATE;
	reg notifier;
	wire delayed_D, delayed_GATE;

	// Function
	wire int_fwire_IQ;

	ihp_latch (int_fwire_IQ, notifier, delayed_GATE, delayed_D);
	buf (Q, int_fwire_IQ);

	// Timing
	specify
		(D => Q) = 0;
		(posedge GATE => (Q+:D)) = 0;
		$setuphold (negedge GATE, posedge D, 0, 0, notifier,,, delayed_GATE, delayed_D);
		$setuphold (negedge GATE, negedge D, 0, 0, notifier,,, delayed_GATE, delayed_D);
		$width (posedge GATE, 0, 0, notifier);
	endspecify
endmodule
`endcelldefine

