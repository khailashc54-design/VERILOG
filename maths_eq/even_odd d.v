module even_odd(input [7:0]a ,output reg y);
  always@(*)begin
    if(a%2==0)begin
     y=0;
      end else
        y=1;
  end
endmodule


module even_odd_tb;
  reg [7:0]a;
  wire y;
  even_odd dut (.*);
  initial begin
    $monitor("t=%0t|a=%d|y=%d",$time,a,y);
    a=2;
    #10 a=5;
    #10 a=4;
   #10 $finish;
  end
    endmodule
    
