// Code your design here
module d2jk (input j,k,qn ,clk , output reg d);
  always @(posedge clk)begin 
    d=~k&qn|~qn&j;
  end
endmodule


module d2jk_tb;
  reg j,k,qn,clk;
  wire d;
  d2jk dut(.*);
  initial begin
    $monitor ("t=%0t|j=%b k=%b clk=%b qn=%b|d=%b",$time,j,k,clk,qn,d);
    j=1;k=1;qn=0;
    #5 j=0;k=1;qn=1;
   #10 $finish;
  end
  initial begin
    clk=1'b0;
   forever#5 clk=~clk;
  end
  
 initial begin 
   $dumpfile("d2kj.vcd");
   $dumpvars(1,d2jk_tb);
 end 
endmodule
