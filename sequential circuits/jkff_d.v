module jkff(input j,k,clk,output reg q,output qbar);
  always@(posedge clk)begin
    case({j,k})
      2'b00:q<=q;
      2'b01:q<=0;
      2'b10:q<=1;
      2'b11:q<=~q;
      default:q<=1'bx;
    endcase
  end
  assign qbar=~q;
endmodule

module jkff_tb;
  reg j,k,clk;
  wire  q;
  wire qbar;
  jkff dut(.*);
  initial begin
    $monitor("t=%0t|j=%b k=%b clk=%b|q=%b qbar=%b",$time,j,k,clk,q,qbar);
    
    
    j=0;k=1;
    #10 j=1;k=0;#10 j=0;k=0;
    #10 j=1;k=1;
    #50 $finish;
  end
  initial begin
    clk=1'b1;
    forever #5 clk=~clk;
  end 
  
  initial begin
    $dumpfile("jkff.vcd");
    $dumpvars(1,jkff_tb);
  end
endmodule
