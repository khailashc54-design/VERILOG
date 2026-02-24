// Code your design here
module ring (input clk ,rst,output reg[3:0]q);
  reg [1:0]c;
  always @(posedge clk or posedge rst )begin 
    if (rst)
      c<=4'b0000;
    else 
      c=c+1;
  end
  assign q=(c==2'b00)?(4'b1000):
    (c==2'b01)?(4'b0100):
    (c==2'b10)?(4'b0010):4'b0001;
endmodule
module ring_tb;
  reg clk,rst ;
  wire [3:0]q;
  ring dut(.*);
  always #5 clk=~clk;
  initial begin
    $monitor("t=%0t|clk=%b rst=%b|q=%b",$time,clk,rst,q);
   clk=0;rst=1;
    #10 rst=0;
  #100 $finish;
  end
  initial begin 
    $dumpfile("ring.vcd");
    $dumpvars (1,ring_tb);
  end
endmodule
