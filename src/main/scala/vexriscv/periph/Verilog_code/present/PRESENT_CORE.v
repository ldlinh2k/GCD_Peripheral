 `timescale 1ns/1ps
 //`define PRINT
module PRESENT_CORE (
        output	reg	[63:0]	odat,   
		input				iReset_n,
        input		[63:0]	idat,  
        input		[79:0]	key,    
        input				load,   
        input				clk,    
		input				control, //=0=>encrypt; =1=>decrypt
		output	reg			done
);

wire [63:0]		odreg_en,odreg_de;
reg [63:0]		idreg;
reg [79:0]		kdreg;
reg		chip_enable_en,chip_enable_de;
reg				load_reg;
wire		already_en,already_de;


always @(posedge clk or negedge iReset_n)	
begin
	if(~iReset_n)
	begin
		chip_enable_en <=1'b0;
		chip_enable_de <=1'b0;
		idreg <= 64'h0;
		kdreg <= 80'h0;
		load_reg <= 1'b0;
		odat <= 64'h0;
	end
	else
	begin
		if (load)
		begin 
			idreg <= idat;
			kdreg <= key;
			load_reg <= load;
			odat <= odat;
			if(~control)
			begin
				chip_enable_en <= 1'b1;
				chip_enable_de <=1'b0;
			end
			else
			begin
				chip_enable_en <= 1'b0;
				chip_enable_de <=1'b1;
			end
		end
		else
		begin
			load_reg <= 1'b0;
			idreg <= idreg;
			kdreg <= kdreg;
			chip_enable_en <= chip_enable_en;
			chip_enable_de <= chip_enable_de;
		end
		if(chip_enable_en)
			odat <= odreg_en;
		else if (chip_enable_de )
				odat <= odreg_de;
		else
			odat <=odat;
		if (already_de)
			chip_enable_de <=1'b0;
		if (already_en)
			chip_enable_en <=1'b0;
	end	
	done <= already_de | already_en;
end
	PRESENT_ENCRYPT en(odreg_en, idreg, kdreg, load_reg, clk, chip_enable_en,already_en);	
	PRESENT_DECRYPT de(odreg_de, idreg, kdreg, load_reg, clk, chip_enable_de,already_de);
// To print test vectors at simulation time
`ifdef PRINT
always @(posedge clk)
begin
	if (load)
	begin
		$display("1. INPUT:");
		$display("KEY(Hex):  %x",key);
		$display("Plaintext(Hex):  %x\n",idat);
    end
	if (done)
	begin
		$display("2. OUTPUT:");
		$display("Ciphertesx(Hex):  %x",odat);
		$display("----------------------------------------------------------------");
	end
	
end
`endif	
endmodule 