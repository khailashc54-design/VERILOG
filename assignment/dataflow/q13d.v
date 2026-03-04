module d;
reg [3:0]a;
  reg [6:0]b;
initial begin
a=4'd10;
  b={a,1'sd1};
  $monitor("a=%b |b=%b",a,b);
end 
endmodule 
