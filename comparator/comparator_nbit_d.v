module comparator#(parameter n=4)(input [n-1:0]a,b, output reg i,j,k);
  always@(*)begin
    i=a<b;
    j=a>b;
    k=a==b;
  end
endmodule

module comparator_tb;
  parameter n=4;
  reg [n-1:0]a,b;
  reg i,j,k;
  comparator#(n)dut(.*);
  initial begin 
    $monitor("t=%0t|a=%b b=%b |i=%b j=%b k=%b| ",$time,a,b,i,j,k);
    a=12;b=11;
    #10 a=19;b=20;
    #10 a=6;b=6;
    #20$finish;
    
  end
endmodule
  
