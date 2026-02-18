// Code your design here
module piso(input [3:0]pi,
            input clk,rst,load,output reg so);
  reg [3:0]q;
  always @(posedge clk or posedge rst)begin
    if(rst)
      q<=4'b0000;
    else if(load)
      q<=pi;
    else
      q<={pi,q[3:1]};
  end
  always @(*) so<=q[0];
endmodule

// Code your testbench here
// or browse Examples
module piso_tb;
  reg clk,load,rst;
  reg [3:0]pi;
  wire so; 
  piso dut(.*);
  initial begin 
    $monitor("t=%0t|pi=%b clk=%b load=%b rst=%b|so=%b",$time,pi,clk,load,rst,so);
  rst=1; load=0;
#10 rst=0;
#10  load=1;#10; pi=4'b1010;
#10 load=0;
  #80 $finish;
  end
  initial begin
    clk=1'b0;
    forever #5 clk=~clk;
  end
  initial begin 
    $dumpfile("piso");
    $dumpvars(1,piso_tb);
  end
endmodule
