// Code your design here
module jkff(input j,k,clk,rst, output reg q,output qbar);
  always @(posedge clk or posedge rst)begin
    if(rst)
      q=1'b0;
       else case({j,k})
         2'b00:q<=q;
         2'b01:q<=0;
         2'b10:q<=1;
         2'b11:q<=~q;
    endcase
  end
  assign qbar=~q;
  
endmodule

module counter_2bit(input clk,rst,output [1:0]q);
 wire q0,q1;
  wire qb1,qb2;
  jkff f1(1'b1,1'b1,clk,rst,q0,qb1);
  jkff f2(1'b1,1'b1,qb1,rst,q1,qb2);
  assign q={q1,q0};
endmodule 
        
        
// Code your testbench here
// or browse Examples
module counter_2bit_tb;
  reg clk,rst;
  wire [1:0]q;
  counter_2bit dut(.*);
  always #5 clk=~clk;
  initial begin
    $monitor("t=%0t|clk=%b rst=%b|q=%b",$time,clk,rst,q);
   clk=0;rst=1;
    # 10 rst=0;
    
  #100 $finish;
  end
  initial begin 
   $dumpfile("counter_2bit.vcd");
    $dumpvars (0,counter_2bit_tb);
  end
endmodule
