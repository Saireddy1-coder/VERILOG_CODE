module mux2x1(input a,b,sel,output y);
assign y = sel?b:a;
endmodule


module mux2x1_tb;
reg a,b,sel;
wire y;
mux2x1 uut(a,b,sel,y);
initial begin
a=0;b=0;sel=0;#20
a=0;b=1;sel=0;#20
a=0;b=1;sel=1;#20
a=0;b=0;sel=1;#20
a=1;b=1;sel=1;#20
$monitor("a=%0b,b=%0b,sel=%0b,y=%0b",a,b,sel,y);
end
endmodule
