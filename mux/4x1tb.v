module mux_tb;
  reg a,b,c,d;
  reg s0,s1;
  wire y;
  mux dut(.*);
  initial begin
    s0=0;s1=0;a=1;b=0;c=0;d=0;
    #10 s0=0;s1=1;a=0;b=1;c=0;d=0;
    #10 s0=1;s1=0;a=0;b=0;c=1;d=0;
    #10 s0=1;s1=1;a=0;b=0;c=0;d=1;
  $finish;
  end
  initial begin
    $monitor("time=%0t|a=%b b=%b c=%b d=%b s0=%b s1=%b|y=%b",$time,a,b,c,d,s0,s1,y);
  end
endmodule
