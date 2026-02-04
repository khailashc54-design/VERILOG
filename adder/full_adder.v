module full_adder_tb;
  reg a,b,cin;
  wire sum,carry;
  full_adder dut (
    .a(a),
    .b(b),
    .cin(cin),
    .sum(sum),
    .carry(carry)
  );
  initial begin
    $dumpfile("full_adder.vcd");
    $dumpvars(1,full_adder_tb);
    $monitor("time=%0t|a=%b b=%b cin=%b|sum=%b carry=%b",  $time,a,b,cin,sum,carry);
    a=0;b=0;cin=0;
    #10 a=0;b=0;cin=1;
    #10 a=0;b=1;cin=0;
    #10 a=0;b=1;cin=1;
    #10 a=1;b=0;cin=0;
    #10 a=1;b=0;cin=1;
    #10 a=1;b=1;cin=0;
    #10 a=1;b=1;cin=1;
    $finish;
 
  end
endmodule
