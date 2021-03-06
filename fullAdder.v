module fullAdder(z, cout, a, b, cin);
//reg a, b, cin;
input a, b, cin;
output z, cout;
wire upperRes, lowerRes, upperAnd;//, z, cout;

xor my_xorHigh(upperRes, a, b);
and my_andLow(lowerRes, a, b);
xor my_xorHigh2(z, upperRes, cin);
and my_andHigh(upperAnd, upperRes, cin);
or  my_orLow(cout, lowerRes, upperAnd);

//initial
//begin

	
	//#1 $display("a=%b b=%b cin=%b z=%b cout=%b", a, b, cin, z, cout);
	//$finish;
//end 
endmodule

module Adder4(z, cout, a, b, cin);
input [3:0] a, b;
input cin; 
wire c1, c2, c3;
output [3:0] z;
output cout;

fullAdder myadder1(z[0], c1, a[0], b[0], cin);
fullAdder myadder2(z[1], c2, a[1], b[1], c1);
fullAdder myadder3(z[2], c3, a[2], b[2], c2);
fullAdder myadder4(z[3], cout, a[3], b[3], c3);
endmodule

module t_adder;
reg [3:0] a, b;
reg cin; 
wire [3:0] s;
wire cout;

integer i;

Adder4 my_add4(s, c1, a, b, cin);

initial
begin

	a = 0;
	b = 0;
	cin = 0;
	//#1 $display("a=%b b=%b cin=%b z=%b cout=%b", a, b, cin, z, cout);
	//$finish;

	for (i = 0; i < 7; i = i + 1)
        begin
                #5 $display("%2d: a=%b b=%b s=%b cout=%b", $time, a, b, s, cout);
		a = a + 1; b = b + 2;
	end
	$finish;
		
end 
endmodule

