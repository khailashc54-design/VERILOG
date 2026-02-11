module dff(input d,clk,rst, output reg q, qbar);
  always@(posedge clk)begin
    if(rst)
      q<=0;
      else
        q<=d;
 end 
 assign qbar=~q;     
endmodule

module dff_tb;
  reg d, clk,rst;
  wire q,qbar;
  dff dut(.*);
  initial begin 
    $monitor("t=%0t|d=%d clk=%b rst=%b|q=%b gbar=%b",$time,d,clk,rst,q,qbar);
    d=1;rst=1;
    #10 d=0;rst=0;
    $finish;
  end
    initial begin
         clk=1'b1;
    forever #5 clk=~clk;
    end
    initial begin
      $dumpfile("dff.vcd");
      $dumpvars(1,dff_tb);
    end
    endmodule
