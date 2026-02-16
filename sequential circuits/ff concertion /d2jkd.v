module d(input d,clk,rst, output  reg q);
  always @(posedge clk or posedge rst )begin 
    if(rst)begin
      q<=0;
    end else
        q<=d;
    end

endmodule

module jk(input j,k,clk,rst, output  q);
  wire d;
  assign d=(~k&q)|(j& ~q);
  d a (.clk(clk), .d(d),.q(q),.rst(rst));
  
endmodule


module d_tb;
  reg j,k,clk,rst;
  wire q;
  jk dut(.*);
  initial begin
    $monitor ("t=%0t|j=%b k=%b clk=%b rst=%b|q=%b",$time,j,k,clk,rst,q);
    j=1;k=0;rst=1;
    #5 j=1;k=1;rst=0;
   #10 $finish;
  end
  initial begin
    clk=1'b0;
   forever#4 clk=~clk;
  end
  
 initial begin 
   $dumpfile("d.vcd");
   $dumpvars(1,d_tb);
 end 
endmodule
