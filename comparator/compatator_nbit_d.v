module comparator#(parameter n=4)(input [n-1:0]a,b, output reg i,j,k);
  always@(*)begin
    if (a<b)begin
      i=1;j=0;k=0;
    end else if(a>b)begin
      i=0;j=1;k=0;
    end else begin
    i=0;j=0;k=1;
  end
  end
endmodule


module comparator_tb;
  parameter n=4;
  reg [n-1:0]a,b;
  wire i,j,k;
  comparator#(n)dut(.*);
  initial begin 
    $monitor("t=%0t|a=%b b=%b |i=%b j=%b k=%b| ",$time,a,b,i,j,k);
    a=12;b=11;
    #10 a=19;b=20;
    #10 a=6;b=6;
    #20$finish;
    
  end
endmodule
  
