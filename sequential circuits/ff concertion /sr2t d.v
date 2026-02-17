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

module tff( input t,clk, output q);
  wire s,r;
  assign s=t&~q;
  assign r=t&q;
  srff a(.*);
endmodule

module tff_tb;
  reg t,clk;
  wire q;
  tff dut(.*);
  initial begin
    $monitor("t=%0t|t=%b clk=%b|q=%b",$time,t,clk,q);
    t=0;#5 t=1;
    #8 t=0;#4 t=0;
  end 
   
  initial begin
     clk=1'b0;
   forever #2 clk=~clk;
  end
  initial begin
    $dumpfile("tvk.vcd");
    $dumpvars(1,tff_tb);
    #20 $finish;
  end
endmodule
   
