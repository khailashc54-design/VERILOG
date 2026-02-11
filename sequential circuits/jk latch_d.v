// Code your design here
module jklatch(input j,k,en,output q,qbar);
 wire a;
  assign a=en?(j&~q|~k&qbar):q;
    assign qbar=~q;
  assign q=a;
endmodule

// Code your testbench here
// or browse Examples
module jklatch_tb;
  reg j,k,en;
  wire q,qbar;
  jklatch dut(.*);
  initial begin
    $monitor("t=%0t|j=%b k=%b en=%b |q=%b qbar=%b",$time,j,k,en,q,qbar);
    en=1;
    j=0;k=0;
    #10 j=1;k=0;
    #10 j=0;k=1;
    #10 j=1;k=1;
    $finish;
  end
endmodule
