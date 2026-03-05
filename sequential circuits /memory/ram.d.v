// Code your design here
module ram (input [7:0]data,input [9:0]address,input clk,enable,output [7:0] dataout);
  reg[7:0]location [0:1023];
  reg[9:0]add;
  always @(posedge clk )begin 
    if(enable)
      location[address]<=data;
    else 
      add<=address;
  end
  assign 
    dataout=location[add];
endmodule 
