module f_add(input a,b,ci, output s,co);
wire w1,w2,w3;
xor gate1(w1,a,b);
xor gate2(s,w1,ci);
and gate3(w2,a,b);
and gate4(w3,w1,ci);
or gate5(co,w2,w3);
endmodule

module tb;
reg a,b,ci;
wire s,co;
f_add uut(a,b,ci,s,co);
initial begin
repeat(12)begin
$monitor("a=%0b,b=%0b,ci=%0b,s=%0b,co=%0b,time=%0t",a,b,ci,s,co,$time);
#10; {a,b,ci}=$random;

end
end
endmodule
