module d;
  reg [3:0]a= 4'b110x;
initial begin
  $monitor("a=%b",a);
  if ( a !== 4'b1100)
begin: B1
end
else
begin: B2 end
 
end
endmodule 
