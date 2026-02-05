module demux1x4_tb;
  reg a,s0,s1;
  wire y0,y1,y2,y3;
  demux1x4 dut(.*);
  initial begin
    $monitor("time=%0t|a=%b s0=%b s1=%b|y0=%b y1=%b y2=%b y3=%b",$time,a,s0,s1,y0,y1,y2,y3);
    s0=0;s1=0;a=0;
    #10 s0=0;s1=0;a=1;
    #10 s0=0;s1=1;a=0;
    #10 s0=0;s1=1;a=1;
    #10 s0=1;s1=0;a=0;
    #10 s0=1;s1=0;a=1; 
    #10 s0=1;s1=1;a=1;
    $finish;
  end
endmodule
