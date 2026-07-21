module alu(input [3:0]a,b,input[2:0]op,output reg [3:0]result);
  always@(*)begin 
    case(op)
      3'b000:result=a+b;
      3'b001:result=a-b;
      3'b010:result=a|b;
      3'b011:result=a&b;
      3'b100:result=a^b;
      3'b101:result=~(a&b);
      3'b110:result=~(a|b);
      3'b111:result=(a==b)?4'b0001:4'b0000;
      default:result=1'b0;
    endcase
  end
endmodule


module tb;
  reg [3:0]a,b;
  reg[2:0]op;
  wire [3:0]result;
  alu dult(.a(a),.b(b),.op(op),.result(result));
  initial begin
    $monitor("time=%0t|a=%0d b=%0d op=%0d result=%0d|",$time,a,b,op,result);
    a=0;b=0;op=0;
    #10 a=2;b=2;
    op=3'b000;
    #10 op=3'b001;
    #10 op=3'b010;
    #10 op=3'b011;
    #10 op=3'b100;
    #10 op=3'b101;
    #10 op=3'b110;
    #10 op=3'b111;
    #10 a=1;b=0;
    #10 op=3'b111;
     #10 op=3'b001;

  end
endmodule 
