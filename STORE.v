module Store(Memory , AC);
	output [7 : 0] Memory ;
	input [7 : 0] AC;
	
	assign Memory = AC;
endmodule


module StoreTB;
	wire [7 : 0] Memory ;
	reg [7 : 0] AC;

	Store sample(Memory , AC);

	initial
		begin
			AC = 8'b 10001010;
			#100
			AC = 8'b 00011010;
			#100
			AC = 8'b 10110101;
		end
endmodule