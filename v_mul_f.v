// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
module v_mul_f (

	input   clock,
	input   resetn,
	input   ivalid, 
	input   iready,
	output  ovalid, 
	output  oready,
	input   [127:0]  datainA,
	input   [127:0]  datainB,
	output  [127:0]  dataout);

  assign ovalid = 1'b1;
  assign oready = 1'b1;
  // ivalid, iready, resetn are ignored

  fp_mul_128_112_15_6 inst(
			    .x(datainA),
			    .y(datainB),
			    .z(dataout),
			    .clk(clock)
	);
endmodule

module v_swap_128 (
	     input  [127:0] datain,
	     output [127:0] dataout
	     );

   assign dataout = {datain[63:0],datain[127:64]};
endmodule
