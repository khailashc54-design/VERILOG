// Code your testbench here
// or browse Examples
module k_tb;
  reg [5:0] y;
initial begin
  $monitor("t=%0t|y=%b",$time,y);
y= 'Ox2;
end
endmodule 

  
