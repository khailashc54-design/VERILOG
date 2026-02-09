// Code your design here
module parity#(parameter n=2)(input [n-1:0]d,output odd,even);
  assign even=~(^d);
  assign odd=^d;
endmodule 

// Code your testbench here
// or browse Examples
module parity_tb;
  parameter n=5;
  reg [n-1:0]d;
  wire odd,even;
  
  parity#(n)dut(.*);
  initial begin
    $monitor("d=%b |even=%b odd=%b",d,even, odd );
    d=5'b00011;
    #10d=5'b00111;
    $finish;
  end
endmodule
