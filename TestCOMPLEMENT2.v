module TestComplement2;
    // Memory
    reg [7:0] memory [0:15];
    // Ports
    reg clk = 0;
    reg reset = 0;
    wire read;
    wire write;
    wire[7:0] memoryIn, memoryOut;
    wire[3:0] address;

    always @(posedge clk) begin
        if (write) memory[address] <= memoryIn;
    end

    assign memoryOut = memory[address];

    CPU2
        forTest (
            .clk (clk),
            .reset(reset),
            .read(read),
            .write(write),
            .memoryOut(memoryOut),
            .memoryIn(memoryIn),
            .address(address)
        );

    initial
    begin
        
         memory[0] = 8'b01100110; //complement (M[6])
         memory[1] = 8'b01010110; // -> M[6] = 11111101 = fd
         memory[2] = 8'b01010100;
         memory[3] = 8'b00000000;
         memory[4] = 8'b00000000;
         memory[5] = 8'b00000000;
         memory[6] = 8'b00000011; //M[6]
      
       
        
        reset = 1;
        #10;  
        reset = 0;
        #500 ;
        $finish;
    end

    always
        #5 clk = ~clk;
endmodule
