module gray_counter (
    input clk,
    input reset,       
    output reg [2:0] gray
);

    reg [2:0] binary;  

    always @(posedge clk) begin
        if (reset) begin
            binary <= 3'b000;
            gray   <= 3'b000;
        end else begin
            binary <= binary + 1;              
            gray   <= binary ^ (binary >> 1);
        end
    end

endmodule


module tb_gray_counter;

    reg clk;
    reg reset;
    wire [2:0] gray;
  gray_counter uut (.*);

    initial begin
        clk = 0;
        forever #2 clk = ~clk;   
    end
    initial begin
     $monitor("Time=%0t | reset=%b | gray=%b", $time, reset, gray);
        reset = 1;
        #10;
        reset = 0;
        #50;

        $finish;
    end

endmodule
