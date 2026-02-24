module johnson_counter #(parameter n=7)(input clk,rst,output reg [n-1:0]q);
  always @(posedge clk or posedge rst)begin
    if(rst)
      q<=4'b0000;
    else
      q<={q[n-2:0],~q[n-1]};
  end 
endmodule

module john_counter_tb;
  parameter n=4;
  reg clk,rst;
  wire [n-1:0]q;
  johnson_counter #(n)dut(.*);
  initial begin 
   $monitor("t=%0t|clk=%b rst=%b |q=%b",$time,clk,rst,q);
     clk=1'b0;rst=1;
     #10 rst=0;
   #100 $finish;
  end
  initial begin
    forever #5 clk=~clk;
  end
endmodule
