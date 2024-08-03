module Add(result , Cout , AC , Memory);
	output [7 : 0] result ;
	output Cout;
	input [7 : 0] AC , Memory;
	
	assign {Cout , result} = AC + Memory;
endmodule


module AddTB;
	wire [7 : 0] result ;
	wire Cout ;
	reg [7 : 0] AC , Memory;

	Add sample(result ,Cout , AC , Memory);

	initial
		begin
			AC = 8'b 10010101 ; Memory = 8'b 10001010;
			#100
			AC = 8'b 01001001 ; Memory = 8'b 00011010;
			#100
			AC = 8'b 10101010 ; Memory = 8'b 10110101;
		end
endmodule

