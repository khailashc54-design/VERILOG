module d;
reg [3:0]a;
  reg [3:0]x;
initial
begin
a = 4'd10;
x= (a>>1);
  $monitor("t=%0t|a=%b|x=%b",$time,a,x);
end
endmodule 
