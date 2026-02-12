module tff(input t,clk,rst,output reg q,output qbar);
  always@(posedge clk or negedge rst)begin
    if(!rst)
      q<=0;
    else 
      begin 
        case(t)
          0:q<=q;
          1:q<=~q;
          default :q<=1'b0;
        endcase
      end 
      end
      assign qbar=~q;
endmodule

module tff_tb;
  reg t,clk,rst;
  wire q, qbar;
  tff dut(.*);
  initial begin 
    $monitor("t=%0t|t=%b clk=%b rest=%b|q=%b qbar=%b",$time,t,clk,rst,q,qbar);
    t=0;rst=0;
    #4 t=1;rst=1;
    #5  t=0;rst=1;
    #7 t=1;rst=1;
     #4 t=1;rst=0;
    #5 t=0;rst=1;
    #7 t=1;rst=0;
   #20 $finish;
  end
  initial begin
    clk=1'b0;
    forever #5 clk=~clk;
  end
  initial begin
    $dumpfile("tff.vcd");
    $dumpvars(1,tff_tb);
  end
endmodule
