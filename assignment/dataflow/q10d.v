module d;
reg [2:0] a,b;
reg [2:0]x;
initial begin
a=3'd5;
b=3'b111;
x= a|b;
  $monitor("t=%0t|a=%b b=%b|x=%b",$time,a,b,x);
end
endmodule
