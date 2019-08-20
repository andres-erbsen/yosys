/*
 *  yosys -- Yosys Open SYnthesis Suite
 *
 *  Copyright (C) 2012  Clifford Wolf <clifford@clifford.at>
 *                2019  Eddie Hung    <eddie@fpgeh.com>
 *
 *  Permission to use, copy, modify, and/or distribute this software for any
 *  purpose with or without fee is hereby granted, provided that the above
 *  copyright notice and this permission notice appear in all copies.
 *
 *  THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 *  WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 *  MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 *  ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 *  WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 *  ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 *  OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 *
 */

// ============================================================================

(* abc_box_id = 3, lib_whitebox *)
module \$__XILINX_MUXF78 (output O, input I0, I1, I2, I3, S0, S1);
  assign O = S1 ? (S0 ? I3 : I2)
                : (S0 ? I1 : I0);
endmodule

module \$__ABC_FF_ (input C, D, output Q);
endmodule

(* abc_box_id = 1000 *)
module \$__ABC_ASYNC (input A, S, output Y);
endmodule

(* abc_box_id=1001, lib_whitebox, abc_flop *)
module \$__ABC_FDRE ((* abc_flop_q, abc_arrival=303 *) output Q,
                     (* abc_flop_clk *) input C,
                     (* abc_flop_en *)  input CE,
                     (* abc_flop_d *)   input D,
                     input R, \$pastQ );
  parameter [0:0] INIT = 1'b0;
  parameter [0:0] IS_C_INVERTED = 1'b0;
  parameter [0:0] IS_D_INVERTED = 1'b0;
  parameter [0:0] IS_R_INVERTED = 1'b0;
  parameter CLK_POLARITY = !IS_C_INVERTED;
  parameter EN_POLARITY = 1'b1;
  assign Q = (R ^ IS_R_INVERTED) ? 1'b0 : (CE ? (D ^ IS_D_INVERTED) : \$pastQ );
endmodule

(* abc_box_id=1002, lib_whitebox, abc_flop *)
module \$__ABC_FDRE_1 ((* abc_flop_q, abc_arrival=303 *) output Q,
                       (* abc_flop_clk *) input C,
                       (* abc_flop_en *)  input CE,
                       (* abc_flop_d *)   input D,
                       input R, \$pastQ );
  parameter [0:0] INIT = 1'b0;
  parameter CLK_POLARITY = 1'b0;
  parameter EN_POLARITY = 1'b1;
  assign Q = R ? 1'b0 : (CE ? D : \$pastQ );
endmodule

(* abc_box_id=1003, lib_whitebox, abc_flop *)
module \$__ABC_FDCE ((* abc_flop_q, abc_arrival=303 *) output Q,
                     (* abc_flop_clk *) input C,
                     (* abc_flop_en *)  input CE,
                     (* abc_flop_d *)   input D,
                     input CLR, \$pastQ );
  parameter [0:0] INIT = 1'b0;
  parameter [0:0] IS_C_INVERTED = 1'b0;
  parameter [0:0] IS_D_INVERTED = 1'b0;
  parameter [0:0] IS_CLR_INVERTED = 1'b0;
  parameter CLK_POLARITY = !IS_C_INVERTED;
  parameter EN_POLARITY = 1'b1;
  assign Q = (CE && !(CLR ^ IS_CLR_INVERTED)) ? (D ^ IS_D_INVERTED) : \$pastQ ;
endmodule

(* abc_box_id=1004, lib_whitebox, abc_flop *)
module \$__ABC_FDCE_1 ((* abc_flop_q, abc_arrival=303 *) output Q,
                       (* abc_flop_clk *) input C,
                       (* abc_flop_en *)  input CE,
                       (* abc_flop_d *)   input D,
                       input CLR, \$pastQ );
  parameter [0:0] INIT = 1'b0;
  parameter CLK_POLARITY = 1'b0;
  parameter EN_POLARITY = 1'b1;
  assign Q = (CE && !CLR) ? D : \$pastQ ;
endmodule

(* abc_box_id=1005, lib_whitebox, abc_flop *)
module \$__ABC_FDPE ((* abc_flop_q, abc_arrival=303 *) output Q,
                     (* abc_flop_clk *) input C,
                     (* abc_flop_en *)  input CE,
                     (* abc_flop_d *)   input D,
                     input PRE, \$pastQ );
  parameter [0:0] INIT = 1'b0;
  parameter [0:0] IS_C_INVERTED = 1'b0;
  parameter [0:0] IS_D_INVERTED = 1'b0;
  parameter [0:0] IS_PRE_INVERTED = 1'b0;
  parameter CLK_POLARITY = !IS_C_INVERTED;
  parameter EN_POLARITY = 1'b1;
  assign Q = (CE && !(PRE ^ IS_PRE_INVERTED)) ? (D ^ IS_D_INVERTED) : \$pastQ ;
endmodule

(* abc_box_id=1006, lib_whitebox, abc_flop *)
module \$__ABC_FDPE_1 ((* abc_flop_q, abc_arrival=303 *) output Q,
                       (* abc_flop_clk *) input C,
                       (* abc_flop_en *)  input CE,
                       (* abc_flop_d *)   input D,
                       input PRE, \$pastQ );
  parameter [0:0] INIT = 1'b0; 
  parameter CLK_POLARITY = 1'b0;
  parameter EN_POLARITY = 1'b1;
  assign Q = (CE && !PRE) ? D : \$pastQ ;
endmodule

(* abc_box_id=2000 *)
module \$__ABC_LUTMUX6 (input A, input [5:0] S, output Y);
endmodule
(* abc_box_id=2001 *)
module \$__ABC_LUTMUX7 (input A, input [6:0] S, output Y);
endmodule


module \$__ABC_RAM32X1D (
  // Max delay from: https://github.com/SymbiFlow/prjxray-db/blob/34ea6eb08a63d21ec16264ad37a0a7b142ff6031/artix7/timings/CLBLM_R.sdf#L957
  (* abc_arrival=1153 *) output DPO, SPO,
  input  D,
  input  WCLK,
  input  WE,
  input  A0, A1, A2, A3, A4,
  input  DPRA0, DPRA1, DPRA2, DPRA3, DPRA4
);
endmodule

module \$__ABC_RAM64X1D (
  // Max delay from: https://github.com/SymbiFlow/prjxray-db/blob/34ea6eb08a63d21ec16264ad37a0a7b142ff6031/artix7/timings/CLBLM_R.sdf#L957
  (* abc_arrival=1153 *) output DPO, SPO,
  input  D,
  input  WCLK,
  input  WE,
  input  A0, A1, A2, A3, A4, A5,
  input  DPRA0, DPRA1, DPRA2, DPRA3, DPRA4, DPRA5
);
  parameter INIT = 64'h0;
  parameter IS_WCLK_INVERTED = 1'b0;
endmodule

module \$__ABC_RAM128X1D (
  // Max delay from: https://github.com/SymbiFlow/prjxray-db/blob/34ea6eb08a63d21ec16264ad37a0a7b142ff6031/artix7/timings/CLBLM_R.sdf#L957
  (* abc_arrival=1153 *) output DPO, SPO,
  input        D,
  input        WCLK,
  input        WE,
  input  [6:0] A, DPRA
);
  parameter INIT = 128'h0;
  parameter IS_WCLK_INVERTED = 1'b0;
endmodule

module SRL16E (
  // Max delay from: https://github.com/SymbiFlow/prjxray-db/blob/34ea6eb08a63d21ec16264ad37a0a7b142ff6031/artix7/timings/CLBLM_R.sdf#L904-L905
  (* abc_arrival=1472 *) output Q,
  input A0, A1, A2, A3, CE, CLK, D
);
  parameter [15:0] INIT = 16'h0000;
  parameter [0:0] IS_CLK_INVERTED = 1'b0;
endmodule

module SRLC32E (
  // Max delay from: https://github.com/SymbiFlow/prjxray-db/blob/34ea6eb08a63d21ec16264ad37a0a7b142ff6031/artix7/timings/CLBLM_R.sdf#L904-L905
  (* abc_arrival=1472 *) output Q,
  (* abc_arrival=1114 *) output Q31,
  input [4:0] A,
  input CE, CLK, D
);
  parameter [31:0] INIT = 32'h00000000;
  parameter [0:0] IS_CLK_INVERTED = 1'b0;
endmodule