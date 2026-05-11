module demux1x4(input y,s0,s1,output a,b,c,d);
assign a=~s0&~s1&a;
assign b=~s0&s1&a;
assign c=s0&~s1&a;
assign d=s0&s1&a;
endmodule

module tb;
reg y,s0,s1;
wire a,b,c,d;
demux1x4 uut(y,s0,s1,a,b,c,d);
initial begin
repeat(8) begin
$monitor("y=%0b,s0=%0b,s1=%0b,a=%0b,b=%0b,c=%0b,d=%0b",y,s0,s1,a,b,c,d);
{y,s0,s1}=$random;#10;
end
end
endmodule
