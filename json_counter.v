module project0313 (clk,rst,q);

input clk,rst;
output reg[0:6] q;

reg[3:0] json;
reg[25:1] div;

always@(posedge clk) begin
		div = div + 1'b1;
end

always@(posedge div[25])begin
	if(rst == 0)
		json = 4'b0000;
	else begin
	json = {json[2:0],~json[3]};
		if	(json == 4'b1111)
		json = 4'b1110; 
end
end

always@(*)begin
	case(json)
		4'b0000: q <= 7'b0000001;
		4'b0001: q <= 7'b1001111;
		4'b0011: q <= 7'b0000110;
		4'b0111: q <= 7'b0001111;
		4'b1110: q <= 7'b0110000;
		4'b1100: q <= 7'b0110001;
		4'b1000: q <= 7'b0000000;
		default: q <= 7'b1111111;
	endcase
end

endmodule
