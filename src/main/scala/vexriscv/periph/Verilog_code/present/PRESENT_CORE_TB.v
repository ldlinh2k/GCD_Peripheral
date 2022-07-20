
`timescale 1ns/1ps

//EX1: Plaintext (8bit-hex-Ltnguyen):4c746e67_7579656e;  KEY (FetelHcmus):46657465_6c48636d_7573; cipher: 0e1d00d4e46ba99c
`define PLAINTEXT1		64'h4c746e677579656e 
`define KEY1   80'h466574656c48636d7573
//EX2: Plaintext (8bit-hex-Ltnguyen):0e1d00d4e46ba99c;  KEY (FetelHcmus):46657465_6c48636d_7573; cipher: 4c746e67_7579656e
`define PLAINTEXT2		64'h0e1d00d4e46ba99c 
`define KEY2   80'h466574656c48636d7573
//EX3: Plaintext (8bit-hex-Ltnguyen):466574656c5f5553;  KEY (FetelHcmus):31383230303138335553; cipher: 9346f086b0b1c9b4
`define PLAINTEXT3		64'h466574656c5f5553
`define KEY3   80'h00000000000000000001
//EX4: Plaintext (8bit-hex-Ltnguyen):0e1d00d4e46ba99c;  KEY (FetelHcmus):31383230303138335553; cipher: 466574656c5f5553
`define PLAINTEXT4		64'h9346f086b0b1c9b4
`define KEY4   80'h00000000000000000001



module PRESENT_CORE_TB;

wire [63:0] odat;
wire 	done;
reg [63:0] idat = 0;
reg [79:0] key =0;
reg reset_n       = 1'b0;
reg clk         = 1'b0;
reg load	=1'b1;
reg control = 1'b0;


PRESENT_CORE dut(.odat(odat),.iReset_n(reset_n),.idat(idat),.key(key),.load(load),.clk(clk),.control(control),.done(done));


// clock generator
always  #5 clk = ~clk;

initial
begin
//1. EX1
		#10   reset_n=1'b1;load = 1'b1;control=1'b0; idat = `PLAINTEXT1; key = `KEY1;
		#10   load = 1'b0;
	    #320
		#80
//2. EX2
		#10   reset_n=1'b1;load = 1'b1;control=1'b1; idat = `PLAINTEXT2; key = `KEY2;
		#10   load = 1'b0;
	    #640
		#80
//3. EX3
		#10   reset_n=1'b1;load = 1'b1;control=1'b0; idat = `PLAINTEXT3; key = `KEY3;
		#10   load = 1'b0;
	    #330
		#80
//4. EX4
		#10   reset_n=1'b1;load = 1'b1;control=1'b1; idat = `PLAINTEXT4; key = `KEY4;
		#10   load = 1'b0;
	    #660
		#80
	  	
	#50 $finish;
end
endmodule