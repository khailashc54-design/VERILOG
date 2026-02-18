// Code your design here
module sipo (input si,clk,rst, output reg [3:0]q);
  always@(posedge clk or posedge rst)begin
    if (rst)begin
      q<=4'b0000;
      end
  else
    q<={si,q[3:1]};
  end
endmodule

// Code your testbench here
// or browset Examples
module sipo_tb;
  reg si,clk,rst;
  wire [3:0]q;
  sipo dut(.*);
  initial begin
    $monitor("t=%0t |clk=%b rst=%b si=%b|q=%b",$time,clk,rst,si,q);
    #5 rst=0;
    si=0;
   #10 si=0;
    #10 si=1;
    #10 si=0;
     #50 $finish;
  end
    initial begin
      clk=1'b0;rst=1;#5 rst=0;
      forever #5 clk=~clk ;
    end
  initial begin 
    $dumpfile("sipo.vcd");
    $dumpvars(1,sipo_tb);
  end
endmodule


  
