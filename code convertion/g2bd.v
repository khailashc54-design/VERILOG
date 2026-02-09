// Code your design here
module g2b #(parameter n=2)(input[n-1:0]g,output reg [n-1:0]b);
  integer i;
  always@(*)begin
    b[n-1]=g[n-1];
    for(i=n-2;i>=0;i=i-1)begin
      b[i]=g[i]^b[i+1];
    end
  end
endmodule


module g2b_tb;
  parameter n=4;
  reg[n-1:0]g;
  wire[n-1:0]b;
  g2b#(n)dut(.*);
  initial begin
    $monitor("g=%b b=%b",g,b);
    g=4'b1100;
    $finish;
  end 
endmodule
