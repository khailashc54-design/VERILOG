// Code your testbench here
// or browse Examples
module k_tb;
integer b;
initial begin
  $monitor("t=%0t|b=%b",$time,b);
b= -'d12/3;
end
endmodule
