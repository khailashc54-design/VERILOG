// Code your design here
module jkff(input j,k,clk, output reg q);
  always @(posedge clk)begin
    case({j,k})
      2'b00:q<=q;
      2'b01:q<=0;
      2'b10:q<=1;
      2'b11:q<=~q;
    endcase
  end
  
endmodule

module counter_2bit(input clk,output [1:0]q);
 wire q0,q1;
  jkff f1(1'b1,1'b1,clk,q0);
  jkff f2(q0,q0,clk,q1);
  assign q={q1,q0};
endmodule 
        
        
// Code your testbench here
// or browse Examples
module counter_2bit_tb;
  reg clk;
  wire [1:0]q;
  counter_2bit dut(.*);
  always #5 clk=~clk;
  initial begin
  $monitor("t=%0t|clk=%b|q=%b",$time,clk,q);
   clk=0;
  #50 $finish;
  end
  initial begin 
   $dumpfile("counter_2bit.vcd");
    $dumpvars (1,counter_2bit_tb);
  end
endmodule
