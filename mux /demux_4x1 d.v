module demux1x4(input a,s0,s1,output y0,y1,y2,y3);
assign y0 = a& ~s1 & ~s0;
assign y1 = a & ~s1 &  s0;
assign y2 = a &  s1 & ~s0;
assign y3 = a &  s1 &  s0;

endmodule
