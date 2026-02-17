module srff(input s,r,clk,output reg q);
  initial q=0;
  always@(posedge clk)begin
    case({s,r})
      2'b00:q<=q;
      2'b01:q<=0;
      2'b10:q<=1;
      2'b11:q<=1'bx;
      default:q<=1'bx;
    endcase
  end
 endmodule

module dff( input d,clk,output q);
  wire s,r;
  assign s=d;
    assign r=~d;
  srff a(.*);
endmodule

module dff_tb;
  reg d,clk;
  wire q;
  dff dut(.*);
  initial begin
    $monitor("t=%0t|d=%b clk=%b|q=%b",$time,d,clk,q);
    d=0;#5 d=1;
    #8d=0;#4 d=1;
  end 
   
  initial begin
     clk=1'b0;
   forever #5 clk=~clk;
  end
  initial begin
    $dumpfile("tvk.vcd");
    $dumpvars(1,dff_tb);
    #20 $finish;
  end
endmodule
   
