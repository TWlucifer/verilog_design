module project0313_2(clk,s,rsg,q);

input clk,s,rsg;
output reg [17:0] q;

reg[25:1] div;

always@(posedge clk) begin
	div = div + 1'b1;
end



always@(posedge div[20]) begin
	if	(rsg == 0)
		q = 18'b000000000000000001; 
	else begin
		if	(s == 1)
			q = {q[16:0],q[17]};
		else
			q = {q[0],q[17:1]};
	end
end

endmodule
