// Code your design here
module pipo#(parameter n=4)(input [n-1:0]a,clk,rst,output reg [n-1:0]b);
  always@(posedge clk or posedge rst)begin
    if(rst)
      b<=0;
      else
        b<=a;
  end 
endmodule

module pipo_tb;
  parameter n=5;
  reg [n-1:0]a;reg clk,rst;
  wire[n-1:0]b;
  pipo #(n)dut(.*);
  initial begin
    $dumpfile ("pipo.vcd");
    $dumpvars(1,pipo_tb);
    
    $monitor("t=%0t|a=%bclk=%b rst=%b|b=%b",$time,a,clk,rst,b);
    a=5'b01010;rst=1;
    #10 a=5'b00111;rst=0;
    #10 a=5'b10101;rst=0;
    #10rst=0;
    #50$finish;
  end
    initial begin
      clk=0;
      #5forever clk=~clk;
    end
endmodule
