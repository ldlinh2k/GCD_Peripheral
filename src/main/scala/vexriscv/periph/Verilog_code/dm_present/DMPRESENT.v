`timescale 1ns/1ps
//`define PRINT
module DMPRESENT (
        output	reg	[63:0]	odat, 
		input				iReset_n,
        input		[63:0]	idat,   
        input		[79:0]	key,   
        input				load,  
        input				clk,     
		output	reg			done
);

//---------wires, registers----------
reg	[79:0] kreg;               // key register
reg  [63:0] dreg;               // data register
reg  [4:0]  round;              // round counter
wire [63:0] dat1,dat2,dat3;     // intermediate data
wire [79:0] kdat1,kdat2;        // intermediate subkey data 
reg			active; 
wire [63:0] odreg;
reg	 [63:0]		idreg;
assign odreg = dat1 ^ idreg;
// key generation
assign kdat1        = {kreg[18:0], kreg[79:19]}; // rotate key 61 bits to the left
assign kdat2[14:0 ] = kdat1[14:0 ];
assign kdat2[19:15] = kdat1[19:15] ^ round;  // xor key[19:15] data and round counter
assign kdat2[75:20] = kdat1[75:20];
SBOX sBoxKey ( .odat(kdat2[79:76]), .idat(kdat1[79:76]) );

// add round key
assign dat1 = dreg ^ kreg[79:16]; 

// sBoxLayer
genvar i;
generate
    for (i=0; i<64; i=i+4) begin: sbox_loop
       SBOX sBox( .odat(dat2[i+3:i]), .idat(dat1[i+3:i]) );
    end
endgenerate

// pBoxLayer
PBOX pBox    ( .odat(dat3), .idat(dat2) );

always @(posedge clk)
begin
	if (iReset_n)
	begin
		if (load)
		begin
			idreg <= idat;
			dreg <= idat;
			kreg <= key;
			round <= 1;
			odat <= 64'h0;
			active <=1'b1;
		end
		else if (active)
		begin	
			dreg <= dat3;
			kreg <= kdat2;
			round <= round + 1;
		end
		if (round == 0)
		begin
			odat <= odreg; // or input data  
			done <=1'b1;
			active <= 1'b0;
		end	
		else
		begin
			done <=1'b0;
		end
	end
	else
	begin
		odat <=64'h0;
		done <=1'b0;
	end
end
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
