module h_sub(input a,b,output d,bo);
xor g1(d,a,b);
and g2(bo,~a,b);
endmodule


module tb;
reg a,b;
wire d,bo;
h_sub uut(a,b,d,bo);
initial begin
repeat(6)begin
$monitor("a=%0b,b=%0b,d=%0b,bo=%0b,time=%0t",a,b,d,bo,$time);
{a,b}=$random;
#10;
end
end
endmodule
