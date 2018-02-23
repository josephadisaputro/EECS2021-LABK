module labK;
reg a, b, cin, flag;
wire upperRes, lowerRes, upperAnd, z, cout;

xor my_xorHigh(upperRes, a, b);
and my_andLow(lowerRes, a, b);
xor my_xorHigh2(z, upperRes, cin);
and my_andHigh(upperAnd, upperRes, cin);
or  my_orLow(cout, lowerRes, upperAnd);

initial
begin

	flag = $value$plusargs("a=%b", a);
	flag = $value$plusargs("b=%b", b);
	flag = $value$plusargs("cin=%b", cin);
	#1 $display("a=%b b=%b cin=%b z=%b cout=%b", a, b, cin, z, cout);
	$finish;
end 
endmodule

