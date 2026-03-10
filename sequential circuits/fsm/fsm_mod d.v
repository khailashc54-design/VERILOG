// Code your design here

module fsm_mod#(parameter n=4)(input clk,rst,output 
                               [n-1:0]y);
  reg[n-1:0]s;
  always @(posedge clk or posedge rst)begin
    if (rst)
      s<=0;
    else if(s==n-1)
        s<=0;
    else 
      s<=s+1;
  end
  assign y=s;
endmodule 
    module fsm_mod_tb;

parameter n=5;

reg clk,rst;
wire [n-1:0] y;

fsm_mod #(n) dut(.*);

always #5 clk = ~clk;   // clock generator

initial begin
  clk = 0;
  rst = 1;

  $monitor("t=%0t | clk=%b rst=%b | y=%b",$time,clk,rst,y);

  #10 rst = 0;
  #50 $finish;
end

endmodule
