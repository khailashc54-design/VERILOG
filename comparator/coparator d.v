module comparator(input[3:0] a,b, output i,j,k);
  assign i=(a>b);
  assign j=(a<b);
  assign k=(a==b);
endmodule

module comparator_tb;
  reg [3:0]a,b;
  wire i,j,k;
  comparator dut(.*);
  initial begin
    $monitor("t=%0t|a=%b b=%b|i=%b j=%b k=%b",$time,a,b,i,j,k);
    a=5;b=2;
    #10a=1;b=4;
    #20 $finish;
  end
  
endmodule
