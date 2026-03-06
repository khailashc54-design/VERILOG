// Code your design here
module fifo#(parameter depth=5,width=3)(input clk,rst,read_e,write_e,input [width-1:0]din,output reg [width-1:0]dout,output full,empty);
  reg[$clog2(depth)-1:0] wprt;
  reg[$clog2(depth)-1:0]rprt;
  reg[(width)-1:0] fipo[0:depth-1];
  always @(posedge clk or posedge rst)begin
    if (rst)begin
      wprt=0;
      rprt=0;
      dout=0;
    end else  if(write_e&&!full)begin
      fipo[wprt]<=din;
    wprt<=wprt+1;
    end 
    if (read_e&& !empty)begin 
      dout<=fipo[rprt];
      rprt<=rprt+1;
    end
  end
  assign empty=(wprt==rprt);
  assign full=((wprt+1)==rprt);
endmodule 
        
    // Code your testbench here
// or browse Examples
module fifo_tb;
  parameter depth=5,width=3;
  reg clk,rst,read_e,write_e;
  reg [width-1:0]din;
  wire full, empty;
  wire [width-1:0]dout;
  fifo #(.depth(depth),.width(width)) dut (.*);
  always #5 clk=~clk ;
  initial begin 
    $monitor ("t=%0t|clk=%b rst=%b read_e=%b write_e=%b din=%b|full=%b empty=%b dout=%b",$time,clk,rst,read_e,write_e,din,full,empty,dout);
    clk=0;rst=1;din=3'b101;
    write_e=0;read_e=0;
    #10 rst=0;
    #10 write_e=1;din =3'b101;
    #10 write_e=0;
    #10 read_e=1;
    #100 $finish;
  end 
endmodule 
    
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
