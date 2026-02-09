module b2g_tb;
   parameter n=20;
  reg [n-1:0]b;
  wire [n-1:0]g;
  b2g  #(n)dut(.*);
  initial begin
    b=4'b1111;
    $finish;
  end
  initial begin
    $monitor("g=%b b=%b",g,b);
  end
endmodule
  
