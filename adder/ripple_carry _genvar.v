// Code your design here
module fa(input a,b, cin,output reg sum,carry);
  always@(*)begin
    sum=a^b^cin;
    carry=(a&b)|(b&cin)|(a&cin);
  end
endmodule
module ripple(input [3:0]a,input[3:0]b,input cin,output[3:0]sum,output cout);
  wire [4:0]c;
  assign c[0]=cin;
  
  genvar i;
generate
  for(i=0;i<4;i=i+1) begin 
    fa g1(.a(a[i]),.b(b[i]),.cin(c[i]),.sum(sum[i]),.carry(c[i+1]));
  end 
endgenerate
  assign cout=c[4];
endmodule

// Code your testbench here
// or browse Examples
module tb;
  reg [3:0]a,b;reg cin;
  wire [3:0]sum;reg cout;
  ripple dut(.*);
  initial begin
    $monitor("time=%0t|a=%04b b=%04b cin=%0b|sum=%0b cout=%0b",$time,a,b,cin,sum,cout);
 
    a = 4'b0000; b = 4'b0000; cin = 0;
    #10;

    a = 4'b0011; b = 4'b0101; cin = 0;
    #10;

    a = 4'b1111; b = 4'b0001; cin = 0;
    #10;

    a = 4'b1010; b = 4'b0101; cin = 1;
    #10;
   
 
    $finish;
    
  end
  
endmodule
