module case_x(input [3:0]a,output reg [1:0]y,output reg v);
    always@(*)begin
	   v = 1'b1;
	  casex(a)
	      4'b1xxx : y <= 2'b00;
		  4'b01xx : y <= 2'b11;
		  4'b001x : y <= 2'b01;
		  4'b0001 : y <= 2'b10;
		  default begin
		         y <= 2'bxx;
				 v = 1'b0;
		  end
	  endcase
	end
endmodule

module tb;
  reg [3:0]a;
  wire [1:0]y;
  wire v;
    case_x uut(a,y,v);
	   initial begin
	      $monitor("a=%0b,y=%0b | v=%0b,time=%0t",a,y,v,$time);
		  repeat(10)begin
		  //$monitor("a=%0b,y=%0b | v=%0b,time=%0t",a,y,v,$time);
		      #10;
		      a = $random;
		  end
		  #10 $finish;
		  //$monitor("a=%0b,y=%0b | v=%0b,time=%0t",a,y,v,$time);
	   end
endmodule
