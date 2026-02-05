module mux_tb;
  reg i0,i1;
  reg s;
  wire a;
  mux dut(.*);
  initial begin
    s=0;i0=1;i1=0;
    #10 s=1;i0=0;i1=1;
  $finish;
  end
  initial begin
    $monitor("time=%0t|i0=%b i1=%b s=%b|a=%b",$time,i0,i1,s,a);
  end
endmodule
