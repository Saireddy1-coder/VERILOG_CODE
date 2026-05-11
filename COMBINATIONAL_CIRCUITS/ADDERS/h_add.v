module h_add(input a,b,output s,cout);
assign s=a^b;
assign cout=a&b;
endmodule


module h_add_tb;
reg a,b;
wire s,cout;
h_add uut(a,b,s,cout);
initial begin
a=0;b=0;#10;
a=0;b=1;#10;
a=1;b=0;#10;
a=1;b=1;#10;
$monitor("a=%0b,b=%0b,s=%0b,cout=%0b",a,b,s,cout);
end
endmodule
