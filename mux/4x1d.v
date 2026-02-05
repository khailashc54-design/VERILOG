// Code your design here
module mux(input a,b,c,d,s0,s1,output y);
  assign y=(s1?(s0?c:d):(s0?a:b));
endmodule
