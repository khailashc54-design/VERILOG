module srff(input s,r,clk,output reg q,output qbar);
  always@(posedge clk)begin
    case({s,r})
      2'b00:q<=q;
      2'b01:q<=0;
      2'b10:q<=1;
      2'b11:q<=1'bx;
      default:q<=1'bx;
    endcase
  end
  assign qbar=~q;
endmodule

module srff_tb;
  reg s,r,clk;
  wire  q;
  wire qbar;
  srff dut(.*);
  initial begin
    $monitor("t=%0t|s=%b r=%b clk=%b|q=%b qbar=%b",$time,s,r,clk,q,qbar);
    
    
     s=0;r=1;
    #10 s=1;r=0;#10 s=0;r=0;
    #10 s=1;r=1;
    #50 $finish;
  end
  initial begin
    clk=1'b1;
    forever #5 clk=~clk;
  end 
  
  initial begin
    $dumpfile("srff.vcd");
    $dumpvars(1,srff_tb);
  end
endmodule
