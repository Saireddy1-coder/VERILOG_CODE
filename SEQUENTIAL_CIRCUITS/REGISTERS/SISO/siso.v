module dff(input d,clk,rst,output reg q);
      always@(posedge clk)begin
	        if(rst)
			  q<=1'b0;
			else
			  q<=d;
	  end
endmodule

module siso(input si,clk,rst,output so);
      wire w1,w2,w3;
	     dff s1(.d(si),.clk(clk),.rst(clk),.q(w1));
	     dff s2(.d(w1),.clk(clk),.rst(clk),.q(w2));
	     dff s3(.d(w2),.clk(clk),.rst(clk),.q(w3));
	     dff s4(.d(w3),.clk(clk),.rst(clk),.q(so));
endmodule

module tb;
     reg clk,rst,si;
	 wire so;
	    siso uut(si,clk,rst,so);
		   always #5 clk = ~clk;
		     initial begin
			     clk = 0;
				 rst = 1;
				 #12 rst = 0;
			 end
		   initial begin
		        $monitor("si=%0b,so=%0b,t=%0t",si,so,$time);
				        #5;si=1;
				        #5;si=1;
				        #5;si=0;
				        #5;si=1;
				        #5;si=0;
				        #5;si=1;
				        #5;si=1;
				        #5;si=0;
				        #5;si=1;
			  #300	$finish;
		   end
endmodule
