module ripple_carry_adder(input [2:0]a,b,input ci, output [2:0]s,output co);
wire w1,w2;
f_add f1(a[0],b[0],ci,s[0],w1);
f_add f2(a[1],b[1],w1,s[1],w2);
f_add f3(a[2],b[2],w2,s[2],co);
endmodule

module f_add(input a,b,ci,output s,co);
assign{co,s}=a+b+ci;
endmodule

module tb;
reg [2:0]a,b;
reg ci;
wire [2:0]s;
wire co;
ripple_carry_adder uut(a,b,ci,s,co);
initial begin
repeat(10)begin
$monitor("a=%0b,b=%0b,ci=%0b,s=%0b,co=%0b,time=%0t",a,b,ci,s,co,$time);
{a,b,ci}=$random;
#10;
end
end
endmodule
