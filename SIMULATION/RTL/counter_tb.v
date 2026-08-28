module tb;
reg clk,rst;
wire [7:0]count;
count dut(clk,rst,count);
always #5 clk<=~clk;
initial 
begin 
clk<=0;
rst<=1;
#10; rst<=0;

#100; rst<=1;
@(posedge clk);
rst<=0;
#2200; $finish;
end
endmodule 
