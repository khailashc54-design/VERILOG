module counter #(parameter n=4)(input clk,rst,mode,output reg[n-1:0]q);
  always @(posedge clk or posedge rst)begin 
    if(rst)
      q<=0;
    else if(mode==0)
    q<=q+1;
  else
    q<=q-1;
  end
endmodule
// Code your testbench here
// or browse Examples
module counter_tb;
  parameter n=2;
  reg clk,rst,mode;
  wire [n-1:0]q;
  counter #(n) dut(.*);
  initial begin
    $monitor("t=%0t|clk=%b rst=%b mode=%b|q=%b",$time,clk,rst,mode,q);
     clk=1'b0;rst=1;
     #10 rst=0;
    mode=0;
    #40
    mode=1;
   #100 $finish;
  end
  initial begin
    forever #5 clk=~clk;
  end
endmodule
