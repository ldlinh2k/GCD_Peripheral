
`timescale 1ns/1ps

//EX1: Plaintext (8bit-hex-Ltnguyen):4c746e67_7579656e;  KEY (FetelHcmus):46657465_6c48636d_7573; PLAIN: 0e1d00d4e46ba99c
`define PLAINTEXT1_1		32'h4c746e67
`define PLAINTEXT1_2		32'h7579656e 
`define KEY1_1   32'h46657465
`define KEY1_2	32'h6c48636d
`define	KEY1_3	32'h7573
//EX2: Plaintext (8bit-hex-Ltnguyen):0e1d00d4_e46ba99c;  KEY (FetelHcmus):00000000_00000000_0001; Hash: d52384e3dcee9ce7
`define PLAINTEXT2_1		32'h0e1d00d4
`define PLAINTEXT2_2		32'he46ba99c
`define KEY2_1   32'h46657465
`define KEY2_2	32'h6c48636d
`define	KEY2_3	32'h7573
//EX3: Plaintext (8bit-hex-Ltnguyen):46657465_6c5f5553;  KEY (FetelHcmus):46657465_6c5f5553_5553; Hash: 9346f086b0b1c9b4
`define PLAINTEXT3_1		32'h46657465
`define PLAINTEXT3_2		32'h6c5f5553
`define KEY3_1   32'h00000000
`define KEY3_2	32'h00000000
`define	KEY3_3	32'h0001
//EX4: Plaintext (8bit-hex-Ltnguyen):46657465_6c5f5553;  KEY (FetelHcmus):46657465_6c5f5553_5553; Hash: 9346f086b0b1c9b4
`define PLAINTEXT4_1		32'h9346f086
`define PLAINTEXT4_2		32'hb0b1c9b4
`define KEY4_1   32'h00000000
`define KEY4_2	32'h00000000
`define	KEY4_3	32'h0001
module PRESENT_WRAPPER_TB;

wire [31:0] odat;
reg [31:0] idat = 0;
reg reset_n       = 1'b0;
reg clk         = 1'b0;
reg enable_n	=1'b1;
reg write_n = 1'b1;
reg read_n =1'b1;
reg [3:0] address;

PRESENT_WRAPPER dut(odat,clk,reset_n,idat,enable_n,write_n,read_n,address);

// clock generator
always  #5 clk = ~clk;

initial
begin
//EX1:
	#10	reset_n=1'b0;
	#10 reset_n =1'b1; enable_n =1'b0;write_n=1'b0;read_n=1'b1;
	//control
	#10	address = 4'd8; idat=32'h0;
	//key
	#10	address = 4'd1; idat = `KEY1_1;
	#10	address = 4'd2; idat = `KEY1_2;
	#10	address = 4'd3; idat = `KEY1_3;
	//data
	#10	address = 4'd4; idat = `PLAINTEXT1_1;
	#10	address = 4'd5; idat = `PLAINTEXT1_2;
	//load
	#10	address = 4'd0; idat=32'h1;
	//
	#10 write_n=1'b1;
	
	#320
	#20 read_n=1'b0;
	//key
	#10	address = 4'd6; 
	#10	address = 4'd7; 

	#50
//EX2:
	#10 reset_n =1'b1; enable_n =1'b0;write_n=1'b0;read_n=1'b1;
	//control
	#10	address = 4'd8; idat=32'h1;
	//key
	#10	address = 4'd1; idat = `KEY2_1;
	#10	address = 4'd2; idat = `KEY2_2;
	#10	address = 4'd3; idat = `KEY2_3;
	//data
	#10	address = 4'd4; idat = `PLAINTEXT2_1;
	#10	address = 4'd5; idat = `PLAINTEXT2_2;
	//load
	#10	address = 4'd0; idat=32'h1;
	//
	#30 write_n=1'b1;
	
	#700
	#10 read_n=1'b0;
	//key
	#10	address = 4'd6; 
	#10	address = 4'd7; 
	  	
	#50 
//EX3:
	#10	reset_n=1'b0;
	#10 reset_n =1'b1; enable_n =1'b0;write_n=1'b0;read_n=1'b1;
	//control
	#10	address = 4'd8; idat=32'h0;
	//key
	#10	address = 4'd1; idat = `KEY3_1;
	#10	address = 4'd2; idat = `KEY3_2;
	#10	address = 4'd3; idat = `KEY3_3;
	//data
	#10	address = 4'd4; idat = `PLAINTEXT3_1;
	#10	address = 4'd5; idat = `PLAINTEXT3_2;
	//load
	#10	address = 4'd0; idat=32'h1;
	//
	#10 write_n=1'b1;
	
	#320
	#20 read_n=1'b0;
	//key
	#10	address = 4'd6; 
	#10	address = 4'd7; 

	#50
//EX4:
	#10 reset_n =1'b1; enable_n =1'b0;write_n=1'b0;read_n=1'b1;
	//control
	#10	address = 4'd8; idat=32'h1;
	//key
	#10	address = 4'd1; idat = `KEY4_1;
	#10	address = 4'd2; idat = `KEY4_2;
	#10	address = 4'd3; idat = `KEY4_3;
	//data
	#10	address = 4'd4; idat = `PLAINTEXT4_1;
	#10	address = 4'd5; idat = `PLAINTEXT4_2;
	//load
	#10	address = 4'd0; idat=32'h1;
	//
	#30 write_n=1'b1;
	
	#700
	#10 read_n=1'b0;
	//key
	#10	address = 4'd6; 
	#10	address = 4'd7; 
	  	
	#50
	
	$finish;
end
endmodule