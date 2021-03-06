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
wire [3:0] in, out;
output [3:0] z;
output cout;

fullAdder mine[3:0](z, out, a, b, in); 

assign in[0] = cin; 
assign in[3:1] = out[2:0];
assign cout = out[3]; 

endmodule

module t_adder;
reg [3:0] a, b;
reg cin; 
wire [3:0] s;
wire cout;

integer i;

Adder4 my_add4(s, cout, a, b, cin);

initial
begin

	a = 0;
	b = 0;
	cin = 0;
	//#1 $display("a=%b b=%b cin=%b z=%b cout=%b", a, b, cin, z, cout);
	//$finish;
	repeat(7)
	begin
        #5$display("%2d: a=%b b=%b s=%b cout=%b", $time, a, b, s, cout);
	a = a + 1; b = b + 2;
	end
	$finish;
		
end 


endmodule
