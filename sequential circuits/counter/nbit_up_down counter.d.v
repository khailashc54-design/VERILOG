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
