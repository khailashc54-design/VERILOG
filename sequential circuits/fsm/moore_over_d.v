// Code your design here
module moore_fsm_1001( input x,clk,rst,output reg y);
  reg [2:0]s;
  parameter s0=3'b000,s1=3'b001,s2=3'b010,s3=3'b011,s4=3'b100;
  always @(posedge clk or posedge rst)begin
    if (rst)
      s<=s0;
    else if (s==s0)
      s<=(x)?s1:s0;
    else if(s==s1)
      s<=(x)?s1:s2;
    else if (s==s2)
      s<=(x)?s1:s3;
    else if (s==s3)
      s<=(x)?s4:s0;
    else if (s==s4)
      s<=(x)?s1:s2;
  end
  always @(*)begin
    y=(s==s4);
  end
endmodule 

// Code your testbench here
// or browse Examples
module moore_fsm_1001_tb;
  reg x,clk,rst;
  wire y;
  moore_fsm_1001 dut(.*);
  initial begin 
    $monitor ("t=%0t|x=%b clk=%b rst=%b|y=%b",$time,x,clk,rst,y);
    clk=0;rst=1;
    x=0;
    #10 rst=0;
   #3 x=1;
    #7 x=0;
    #10 x=0;
    #14 x=1;
    #100$finish;
  end 
  initial begin 
   forever#5 clk = ~clk;
  end 
endmodule
