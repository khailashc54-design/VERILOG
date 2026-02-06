// Code your testbench here
// or browse Examples
module mux_tb;
  reg a,b;
  reg s;
  wire y;
  mux dut(.*);
  initial begin
    s=0;a=1;b=0;
    #10 s=1;a=0;b=1;
  $finish;
  end
  initial begin
    $monitor("time=%0t|a=%b b=%b s=%b|y=%b",$time,a,b,s,y);
  end
endmodule
