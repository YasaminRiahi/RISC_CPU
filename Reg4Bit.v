module Reg4Bit (clk, load, inc, clear, regInput, regOutput);
	output [3 : 0] regOutput;
	reg[3 : 0] regOutput;	
    	input clk, load, inc, clear;
    	input [3 : 0] regInput;

	always @(posedge clk) 
		begin
        	if (load == 1) regOutput <= regInput; 
        	else if (inc == 1) regOutput <= regOutput + 4'b 1;
        	else if (clear == 1) regOutput <= 4'b0000;
    		end
endmodule

module Reg4BitTB;
	wire [3 : 0] regOutput;
	reg clk, load, inc, clear;
    	reg [3 : 0] regInput;

	Reg4Bit sample(clk, load, inc, clear, regInput, regOutput);
	initial 
		begin
        	clk = 0;
        	forever 
		#10 clk = ~clk;
    		end

    	initial 
		begin
		load = 1;
        	regInput = 4'b0111;
        	#100;
        	load = 0;
		inc = 1;
       		#100;
        	inc = 0;
		clear = 1;
		#100;
		clear = 0;
		end
endmodule
