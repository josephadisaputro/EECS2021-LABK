module labK;
reg a, b, c, flag;
wire upperRes, lowerRes, notC, z;

and my_andLow(lowerRes, c, b);
not my_notC(notC, c);
and my_andHigh(upperRes, a, notC);
or  my_or(z, upperRes, lowerRes);

initial
begin

	flag = $value$plusargs("a=%b", a);
	flag = $value$plusargs("b=%b", b);
	flag = $value$plusargs("c=%b", c);
	#1 $display("a=%b b=%b c=%b z=%b", a, b, c, z);
	$finish;
end 
endmodule
	
