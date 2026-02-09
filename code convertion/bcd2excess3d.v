module bcd2excess3 #(parameter n=1)(input [4*n-1:0]bcd,output reg[4*n-1:0]excess);
  integer i ;
  always@(*)begin
    for (i=0;i<n;i=i+1)begin
      if (bcd[4*i +: 4] <= 4'd9)
      	excess[4*i+:4]=bcd[4*i+:4]+4'b0011;
      else
      excess[4*i +: 4] = 4'b0000;
    end
  end
endmodule


// Code your testbench here
// or browse Examples
module bcd2excess3_tb;
  parameter n=3;
  reg  [4*n-1:0]bcd;
  wire [4*n-1:0]excess;
  bcd2excess3 #(n) dut(.*);
  initial begin
    $monitor("bcd=%b excess=%b",bcd,excess);
    bcd = 12'b111110011010;
    $finish;
  end 
endmodule
