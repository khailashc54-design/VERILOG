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

module jk(input j,k,clk,output q);
  wire s,r;
  srff a1(.s(s),.r(r),.clk(clk),.q(q));
  assign s=j&~q;
  assign r=k&q;
endmodule

module srff_tb;
  reg j,k,clk;
  wire q;
  jk dut(.*);
  initial begin
    $monitor ("t=%0t|j=%b k=%b clk=%b |q=%b",$time,j,k,clk,q);
    j=0;k=0;
    #10 j=0;k=1;
    #10 j=1;k=0;
    #10 j=1;k=1;
   #100 $finish;
  end
  initial begin
    clk=1'b0;
   forever#10 clk=~clk;
  end
  
 initial begin 
   $dumpfile("srff.vcd");
   $dumpvars(1,srff_tb);
 end 
endmodule
