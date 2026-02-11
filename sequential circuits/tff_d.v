// Code your design here
module tff(input t,clk,rst,output reg q,output qbar);
  always@(posedge clk or rst)begin
    if(rst)
      q<=0;
    else
      q<=t^q;
  end
      assign qbar=~q;
endmodule

// Code your testbench here
// or browse Examples
module tff_tb;
  reg t,clk,rst;
  wire q, qbar;
  tff dut(.*);
  initial begin 
    $monitor("t=%0t|t=%b clk=%b rest=%b|q=%b qbar=%b",$time,t,clk,rst,q,qbar);
    t=0;rst=1;
    #10 t=1;rst=0;
   #20 $finish;
  end
  initial begin
    clk=1'b0;
    forever#100clk=~clk;
  end
  initial begin
    $dumpfile("tff.vcd");
    $dumpvars(1,tff_tb);
  end
endmodule
