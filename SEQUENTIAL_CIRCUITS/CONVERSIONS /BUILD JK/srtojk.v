module sr(input s,r,clk,rst,output reg q,output q1);
       always@(posedge clk)begin
	         if(rst)
			   q<=1'b0;
			 else begin
			      case({s,r})
				       2'b00 : q<=q;
					   2'b01 : q<=1'b0;
					   2'b10 : q<=1'b1;
					   2'b11 : q<=1'bx;
					   default : q<=1'b0;
				  endcase
			 end
	   end
	   assign q1 = ~q;
endmodule

module jk(input j,k,clk,rst,output q,q1);
    wire w1,w2;
	     assign w1 = j&q1;
		 assign w2 = k&q;
		     sr jk1(.s(w1),.r(w2),.clk(clk),.rst(rst),.q(q),.q1(q1));
endmodule

module tb;
   reg j,k,clk,rst;
   wire q,q1;
        jk uut(j,k,clk,rst,q,q1);
		   always #5 clk = ~clk;
		         initial begin
				     clk = 0;
					 rst = 1;
					 #12 rst =0;
				 end
		   initial begin
		         $monitor("j=%0b,k=%0b,q=%0b,time=%0t",j,k,q,$time);
				         #10;j=1;k=1;
				         #10;j=1;k=1;
				         #10;j=0;k=1;
				         #10;j=1;k=0;
				         #10;j=0;k=0;
				         #10;j=1;k=1;
				         #10;j=0;k=1;
				 $finish;
		   end
endmodule
