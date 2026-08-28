module count(input clk,rst,
             output reg [7:0]count);
always@(posedge clk)
begin 
if(rst)
begin
count<=1'b0;
end
else
begin 
count<=count+1'b1;
end
end
endmodule 
