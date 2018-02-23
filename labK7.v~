module labK;
reg a, b, c;
wire upperRes, lowerRes, notC, z;

and my_andLow(lowerRes, c, b);
not my_notC(notC, c);
and my_andHigh(upperRes, a, notC);
or  my_or(z, upperRes, lowerRes);

initial
begin

	a = 1; b = 0; c = 0;
	#1 $display("a=%b b=%b c=%b z=%b", a, b, c, z);
	$finish;
end 
endmodule
	
