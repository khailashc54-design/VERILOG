module b2g #(parameter n=2)(input[n-1:0]b,output reg [n-1:0]g);
  integer i;
  always@(*)begin
    for(i=n-2;i>=0;i=i-1)begin
      g[n-1]=b[n-1];
      g[i]=b[i+1]^b[i];
    end
  end
endmodule
      
  
