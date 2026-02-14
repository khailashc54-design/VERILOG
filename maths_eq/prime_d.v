module prime #(parameter n=3)(input [n-1:0]a ,output reg y);
  always@(*)begin
    integer i;
    if(a<2)begin
     y=0;
      end else
        y=1;
 
    for (i=2;i<a;i=i+1) begin
    if(a%i==0)
      y=0;
  end
  end
endmodule

module prime_tb;
  parameter n=10;
  reg [15:0]a;
  wire y;
  prime #(n)dut (.*);
  initial begin
    $monitor("t=%0t|a=%d|y=%d",$time,a,y);
    a=220;
    #10 a=526;
    #10 a=564;
   #10 $finish;
  end
    endmodule
    
