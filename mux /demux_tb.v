// Code your testbench here
// or browse Examples
module demux_tb;
  reg a,s;
  wire y0,y1;
  demux_2x1 dut (.*);
  initial begin
    $monitor("time=%0t|a=%b s=%b y0=%b y1=%b|",$time, a,s,y0,y1);
    s=0;a=0;
    #10 s=0;a=1;
    #10 s=1;a=0;
    #10 s=1;a=1;
    $finish;
  end
endmodule
    
