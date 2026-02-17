module siso( input sr,sl,clk,rst ,dir, output reg [3:0]q);
  always@(posedge clk or  posedge rst)begin
    if(rst)
      q<=4'b0000;
    else
      case (dir)
        1'b0:q<={q[2:0],sl};
        1'b1:q<={sr,q[3:1]};
        endcase
  end
endmodule
        
        
          
    module siso_tb;
 reg sr,sl,clk,rst,dir;
  wire [3:0]q;
  siso dut(.*);
  initial begin
    $monitor("t=%0t|sr=%b sl=%b clk=%b rst=%b dir=%b|q=%b",$time,sr,sl,clk,rst,dir,q);
    
    dir=0;
   #10 sl=0 ;rst=0;
    #10 sl=1 ;rst=0;
    #10 sl=1 ;rst=0;
    
    dir=1;
   #10 sr=0;rst=0;
    #10 sr=1;rst=0;
    #10 sr=1;rst=0;
    $finish;
  end
  initial begin
    clk=1'b0;rst=1;sl=1;sr=1;
    forever #5 clk=~clk;
  end
  initial begin
    $dumpfile("siso.vcd");
    $dumpvars(1,siso_tb);
  end
endmodule
    
