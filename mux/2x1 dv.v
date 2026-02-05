// Code your design here
module mux(input i0,i1,s,output a);
  assign a=(~s&i0)|(s&i1);
endmodule
