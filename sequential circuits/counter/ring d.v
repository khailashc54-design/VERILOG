// Code your design here
module ring#(parameter n=4)(input clk,rst,output reg [n-1:0]q);
  always @(posedge clk or posedge rst )begin
    if(rst)
      q<=4'b1000;
    else
      q<={q[n-2:0],q[n-1]};
  end 
endmodule
    // Code your testbench here
// or browse Examples
module ring_tb;
  parameter n=4;
  reg clk,rst;
  wire [n-1:0]q;
  ring #(n) dut(.*);
  initial begin 
    $monitor("t=%0t|clk=%b rst=%b|q=%b",$time,clk,rst,q);
    clk=0;rst=1;
    #10 rst=0;
    //forever #5 clk=~clk;
    #100 $finish;
  end 
  initial begin 
    forever #5 clk=~clk;
  end
endmodule
