module d;
reg [2:0]a;
reg [2:0]x;
initial
begin
a = 3'd4;
x = ^a;
  $monitor("t=%0t|a=%b|x=%b",$time,a,x);
end
endmodule
