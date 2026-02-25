// Code your design here
module divi3 (
    input clk_in,
    input reset,
    output clk_out
);
    reg [1:0] pos_count, neg_count;
    always @(posedge clk_in or posedge reset) begin
        if (reset) pos_count <= 2'b00;
        else pos_count <= (pos_count == 2) ? 0 : pos_count + 1;
    end
    always @(negedge clk_in or posedge reset) begin
        if (reset) neg_count <= 2'b00;
        else neg_count <= (neg_count == 2) ? 0 : neg_count + 1;
    end
    assign clk_out = ((pos_count < 2) || (neg_count < 2));
endmodule


// Code your testbench here
// or browse Examples
module divi3_tb;
  reg clk_in,reset;
  wire clk_out;
  divi3 dut(.*);
  initial begin
    $monitor("t=%0t|clk_in=%b reset=%b|clk_out=%b",$time,clk_in,reset,clk_out);
    clk_in=0;reset=1;
    #10 reset=0;
   #100 $finish;
  end
  initial begin
     forever #5 clk_in=~clk_in;
  end
endmodule 
    
