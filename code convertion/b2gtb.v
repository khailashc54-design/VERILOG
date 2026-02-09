// Code your testbench here
// or browse Examples
module binary2gray_tb;
  reg [3:0]b;
  wire [3:0]g;
  binary2gray dut(.*);
  initial begin
    b=4'b1111;
    $finish;
  end
  initial begin
    $monitor("g=%b b=%b",g,b);
  end
endmodule
  
