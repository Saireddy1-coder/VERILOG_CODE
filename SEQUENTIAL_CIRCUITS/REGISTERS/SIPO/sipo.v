module dff(input d,clk,rst,output reg q);
      always@(posedge clk)begin
	        if(rst)
			  q<=1'b0;
			else
			  q<=d;
	  end
endmodule

module sipo(input si,clk,rst,output [2:0]po);
      wire w1,w2,w3;
	     dff s1(.d(si),.clk(clk),.rst(rst),.q(w1));
	     dff s2(.d(w1),.clk(clk),.rst(rst),.q(w2));
	     dff s3(.d(w2),.clk(clk),.rst(rst),.q(w3));
      assign po = {w3,w2,w1};
endmodule


/*module tb;
    reg si, clk, rst;
    wire [2:0] po;
    sipo uut (si,clk,rst,po);
    always #5 clk = ~clk;
    initial begin
        $monitor("Time=%0t | si=%b | po=%b", $time, si, po);
    end
    initial begin
        clk = 0;
        rst = 1;
        si = 0;
        #3; rst = 0;
        #5;  si = 1;  // Load first '1'
        #10; si = 1;  // Load second '1'
        #30; si = 0;  // Load final '0'
        
        #10;          // Wait one more cycle to let the '0' shift in completely
        #50; $finish; // End simulation
    end
endmodule*/

module tb;
     reg clk,rst,si;
	 wire [2:0]po;
	    sipo uut(si,clk,rst,po);
		   always #5 clk = ~clk;
		     initial begin
			     clk = 0;
				 rst = 1;
				 #3 rst = 0;
			 end
		   initial begin
		        $monitor("si=%0b,po=%0b,t=%0t",si,po,$time);
		                 #5;si=1;
		                 #5;si=0;
		                 #5;si=1;
		   #100; $finish;
		   end
endmodule
