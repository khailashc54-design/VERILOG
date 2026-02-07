// Code your design here
module mux2to1(input a,b,s,output y);
  assign y=s?a:b;
endmodule
module mux4to1( input a,b,c,d,s0,s1, output y);
  wire y0,y1;
  mux2to1 m1(a,b,s0,y0);
  mux2to1 m2(c,d,s0,y1);
  mux2to1 m3 (y0,y1,s1,y);
endmodule
