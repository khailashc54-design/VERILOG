module dff(input d,clk,rst,output reg q,qbar);
  always@(posedge clk or posedge rst) begin
    if(rst)
      q<=0;
    else
      q=d;
  end
  assign qbar=~q;
endmodule

module dff_tb;
  reg d,clk,rst;
  wire q,qbar;
  dff dut (.*);
  initial begin 
    $dumpfile("dff.vcd");
    $dumpvars(1,dff_tb);
    $monitor("t=%0t|d=%b clk=%b rst=%b|q=%b qbar=%b",$time,d,clk,rst,q,qbar);
    d=0;rst=1;
    #10d=1;rst=0;
     #10d=1;rst=1;
    #10d=0;rst=0;
    #100$finish;
  end
  initial begin
    clk=1'b0;
    forever #5clk=~clk;
  end
endmodule
  
