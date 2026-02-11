module jklatch(input j,k,rest_n,output reg q,output qbar);
  always@(rest_n)begin
    if (~rest_n)
      q <= 0;
    else begin
    case({j,k})
      2'b00:q<=q;
      2'b01:q<=0;
      2'b10:q<=1;
      2'b11:q<=~q;
      default:q<=1'bx;
    endcase
    end
  end
  assign qbar=~q;
endmodule


module jklatch_tb;
  reg j,k,rest_n;
  wire  q;
  wire qbar;
  jklatch dut(.*);
  initial begin
    $monitor("t=%0t|j=%b k=%b rest_n=%b|q=%b qbar=%b",$time,j,k,rest_n,q,qbar);
    
    
    j=0;k=1;
    #10 j=1;k=0;#10 j=0;k=0;
    #10 j=1;k=1;
    #50 $finish;
  end
  initial begin
    rest_n=1;
    forever #5 rest_n=~rest_n;
  end 
  
  initial begin
    $dumpfile("jklatch.vcd");
    $dumpvars(1,jklatch_tb);
  end
endmodule
