 `timescale 1ns/1ps
module PRESENT_ENCRYPT (
        output	reg	[63:0]	odat,   
        input		[63:0]	idat,   
        input		[79:0]	key,    
        input				load,   
        input				clk,  
		input				chip_enable,
		output	reg			done
    );

//---------wires, registers----------
reg  [79:0] kreg;				// key registers             
reg  [63:0] dreg;               // data registers
reg  [4:0]  round;				// round counter
wire [63:0] dat1,dat2,dat3;     // intermediate data
wire [79:0] kdat1,kdat2;        // intermediate subkey data      

// key generation
assign kdat1        = {kreg[18:0], kreg[79:19]}; // rotate key 61 bits to the left
assign kdat2[14:0 ] = kdat1[14:0 ];
assign kdat2[19:15] = kdat1[19:15] ^ round;  // xor key[19:15] data and round counter
assign kdat2[75:20] = kdat1[75:20];
SBOX sBoxKey ( .odat(kdat2[79:76]), .idat(kdat1[79:76]) );

// add round key
assign dat1 = dreg ^ kreg[79:16]; 

// SboxLayer
genvar i;
generate
    for (i=0; i<64; i=i+4) begin: sbox_loop
       SBOX sBox( .odat(dat2[i+3:i]), .idat(dat1[i+3:i]) );
    end
endgenerate

// PboxLayer
PBOX pBox    ( .odat(dat3), .idat(dat2) );

always @(posedge clk & chip_enable )
begin
	if (chip_enable)
	begin
		if (load)
		begin
			dreg <= idat;
			kreg <= key;
			round <= 1;
			done <=1'b0;
			odat <=64'h0;
		end
		else
		begin
			dreg <= dat3;
			kreg <= kdat2;
			round <= round + 1;
		end
		if (round == 0)
		begin
			odat <= dat1;   
			done <=1'b1;
		end	
		else
			done <=1'b0;
	end
	else
	begin
		done <=1'b0;
		odat <=64'h0;
	end
end
endmodule
   
   
   