// Code your design here
module melay_fsm_1001( input x,clk,rst,output reg y);
  reg [1:0]s;
  parameter s0=2'b00,s1=2'b01,s2=2'b10,s3=2'b11;
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
      s<=(x)?s1:s0;
  end
  always @(*)begin
    y=(s==s3 && x==1);
  end
endmodule 

// Code your testbench here
// or browse Examples
module melay_fsm_1001_tb;
  reg x,clk,rst;
  wire y;
  melay_fsm_1001 dut(.*);
  initial begin 
    $monitor ("t=%0t|x=%b clk=%b rst=%b|y=%b",$time,x,clk,rst,y);
    clk=0;rst=1;
    x=0;
    #10 rst=0;
   #3 x=1;
    #7 x=0;
    #10 x=0;
    #14 x=1;
    #50$finish;
  end 
  initial begin 
   forever#5 clk = ~clk;
  end
    initial begin 
      $dumpfile("melay_fsm_1001.vcd");
      $dumpvars (0,melay_fsm_1001_tb);
    end 
  
endmodule
