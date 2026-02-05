module ha_fa(input a,b,cin ,output sum,carry);
  wire s1,c1,c2;
  assign s1=a^b;
  assign c1=a&b;
  assign sum =s1^cin;
  assign c2=cin&s1;
  assign carry=c1|c2;
endmodule
