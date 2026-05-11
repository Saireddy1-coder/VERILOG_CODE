module fa(input a,b,ci, output s,p,g,co);
assign p=a^b;
assign g=a&b;
assign s=p^ci;
assign co=g | p&ci;
endmodule 

module cla(input [3:0]a,b,input cin, output [3:0]s,p,g,output cout);
wire [4:0]y;
assign y[0]=cin;

fa e1(a[0],b[0],y[0],s[0],p[0],g[0],y[1]);
fa e2(a[1],b[1],y[1],s[1],p[1],g[1],y[2]);
fa e32(a[2],b[2],y[2],s[2],p[2],g[1],y[3]);
fa e4(a[3],b[3],y[3],s[3],p[3],g[2],y[4]);

assign y[1] = g[0] | (p[0] & y[0]);
assign y[2] = g[1] | (p[1] & y[1]);
assign y[3] = g[2] | (p[2] & y[2]);
assign y[4] = g[3] | (p[3] & y[3]);

assign cout = y[4];

endmodule

module tb;
reg [3:0]a,b;
reg cin;
wire [3:0]s,p,g;
wire cout;

cla uut(a,b,cin,s,p,g,cout);
initial begin
repeat(9)begin
$monitor("a=%0b,b=%0b,cin=%0b,s=%0b,p=%0b,g=%0b,cout=%0b,time=%0t",a,b,cin,s,p,g,cout,$time);
{a,b,cin}=$random;
#10;
end
end
endmodule
