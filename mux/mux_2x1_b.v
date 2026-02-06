// Code your design here
module mux(input a,b,s,output reg y);
  always@(*)begin;
    y=~s&a|s&b;
  end
endmodule 
