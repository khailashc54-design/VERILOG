module mux4x1(input a,b,c,d,s0,s1,output reg y);
  always@(a,b,c,d)begin
    y=(s1?(s0?c:d):(s0?a:b));
  end 
  endmodule
