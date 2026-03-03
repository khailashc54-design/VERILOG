module test(output [32:0]b);
real a=14.5;
assign b = a;
  initial begin 
  $monitor("t=%0t|a=%b|b=%b",$time,a,b);
end
endmodule
