// Code your design here
module fa(input a, b,input cin,output sum,cout);
  assign sum=a^b^cin;
  assign cout = (a & b) | (b & cin) | (a & cin);
endmodule
module ripple(input[3:0]a,b,input cin, output [3:0]sum,output cout);
  wire c1,c2,c3;
  fa  fa1(a[0],b[0],cin,sum[0],c1);
  fa fa2(a[1],b[1],c1,sum[1],c2);
  fa fa3(a[2],b[2],c2,sum[2],c3);
  fa fa4(a[3],b[3],c3,sum[3],cout);
endmodule

module ripple_tb;
  reg [3:0]a,b;
  reg cin;
  wire [3:0]sum;
  wire cout;
   ripple dut(.*);
  initial begin 
    $monitor("t=%0t|a=%b b=%b cin=%b|sum=%b cout=%b|",$time ,a,b,cin,sum,cout);
    a = 4'b0011; b = 4'b0101; cin = 0; #10;
    a = 4'b1111; b = 4'b0001; cin = 0; #10;
    a = 4'b1010; b = 4'b0101; cin = 1; #10;

$finish;
  end
endmodule
