module d;
reg [2:0] a, b;
reg y;
initial begin
a= 3'd5;
b= 3'b111;
y = a&&b;
  $monitor("t=%0t|a=%d b=%b|y=%b",$time,a,b,y);
end
endmodule
