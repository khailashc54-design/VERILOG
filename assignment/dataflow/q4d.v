// Code your testbench here
// or browse Examples
module k_tb;
time  t;
initial begin
  $monitor("t=%0t",t);
#10 t= $time;
#20 ;
end
endmodule
