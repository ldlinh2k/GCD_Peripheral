
build/briey.elf:     file format elf32-littleriscv


Disassembly of section .vector:

80000000 <crtStart>:
.global crtStart
.global main
.global irqCallback

crtStart:
  j crtInit
80000000:	0b40006f          	j	800000b4 <crtInit>
  nop
80000004:	00000013          	nop
  nop
80000008:	00000013          	nop
  nop
8000000c:	00000013          	nop
  nop
80000010:	00000013          	nop
  nop
80000014:	00000013          	nop
  nop
80000018:	00000013          	nop
  nop
8000001c:	00000013          	nop

80000020 <trap_entry>:

.global  trap_entry
trap_entry:
  sw x1,  - 1*4(sp)
80000020:	fe112e23          	sw	ra,-4(sp)
  sw x5,  - 2*4(sp)
80000024:	fe512c23          	sw	t0,-8(sp)
  sw x6,  - 3*4(sp)
80000028:	fe612a23          	sw	t1,-12(sp)
  sw x7,  - 4*4(sp)
8000002c:	fe712823          	sw	t2,-16(sp)
  sw x10, - 5*4(sp)
80000030:	fea12623          	sw	a0,-20(sp)
  sw x11, - 6*4(sp)
80000034:	feb12423          	sw	a1,-24(sp)
  sw x12, - 7*4(sp)
80000038:	fec12223          	sw	a2,-28(sp)
  sw x13, - 8*4(sp)
8000003c:	fed12023          	sw	a3,-32(sp)
  sw x14, - 9*4(sp)
80000040:	fce12e23          	sw	a4,-36(sp)
  sw x15, -10*4(sp)
80000044:	fcf12c23          	sw	a5,-40(sp)
  sw x16, -11*4(sp)
80000048:	fd012a23          	sw	a6,-44(sp)
  sw x17, -12*4(sp)
8000004c:	fd112823          	sw	a7,-48(sp)
  sw x28, -13*4(sp)
80000050:	fdc12623          	sw	t3,-52(sp)
  sw x29, -14*4(sp)
80000054:	fdd12423          	sw	t4,-56(sp)
  sw x30, -15*4(sp)
80000058:	fde12223          	sw	t5,-60(sp)
  sw x31, -16*4(sp)
8000005c:	fdf12023          	sw	t6,-64(sp)
  addi sp,sp,-16*4
80000060:	fc010113          	addi	sp,sp,-64
  call irqCallback
80000064:	c0001097          	auipc	ra,0xc0001
80000068:	c94080e7          	jalr	-876(ra) # 40000cf8 <irqCallback>
  lw x1 , 15*4(sp)
8000006c:	03c12083          	lw	ra,60(sp)
  lw x5,  14*4(sp)
80000070:	03812283          	lw	t0,56(sp)
  lw x6,  13*4(sp)
80000074:	03412303          	lw	t1,52(sp)
  lw x7,  12*4(sp)
80000078:	03012383          	lw	t2,48(sp)
  lw x10, 11*4(sp)
8000007c:	02c12503          	lw	a0,44(sp)
  lw x11, 10*4(sp)
80000080:	02812583          	lw	a1,40(sp)
  lw x12,  9*4(sp)
80000084:	02412603          	lw	a2,36(sp)
  lw x13,  8*4(sp)
80000088:	02012683          	lw	a3,32(sp)
  lw x14,  7*4(sp)
8000008c:	01c12703          	lw	a4,28(sp)
  lw x15,  6*4(sp)
80000090:	01812783          	lw	a5,24(sp)
  lw x16,  5*4(sp)
80000094:	01412803          	lw	a6,20(sp)
  lw x17,  4*4(sp)
80000098:	01012883          	lw	a7,16(sp)
  lw x28,  3*4(sp)
8000009c:	00c12e03          	lw	t3,12(sp)
  lw x29,  2*4(sp)
800000a0:	00812e83          	lw	t4,8(sp)
  lw x30,  1*4(sp)
800000a4:	00412f03          	lw	t5,4(sp)
  lw x31,  0*4(sp)
800000a8:	00012f83          	lw	t6,0(sp)
  addi sp,sp,16*4
800000ac:	04010113          	addi	sp,sp,64
  mret
800000b0:	30200073          	mret

800000b4 <crtInit>:


crtInit:
  .option push
  .option norelax
  la gp, __global_pointer$
800000b4:	c0003197          	auipc	gp,0xc0003
800000b8:	3a418193          	addi	gp,gp,932 # 40003458 <__global_pointer$>
  .option pop
  la sp, _stack_start
800000bc:	00001117          	auipc	sp,0x1
800000c0:	88410113          	addi	sp,sp,-1916 # 80000940 <_stack_start>

800000c4 <bss_init>:

bss_init:
  la a0, _bss_start
800000c4:	c0003517          	auipc	a0,0xc0003
800000c8:	b9450513          	addi	a0,a0,-1132 # 40002c58 <_bss_end>
  la a1, _bss_end
800000cc:	c0003597          	auipc	a1,0xc0003
800000d0:	b8c58593          	addi	a1,a1,-1140 # 40002c58 <_bss_end>

800000d4 <bss_loop>:
bss_loop:
  beq a0,a1,bss_done
800000d4:	00b50863          	beq	a0,a1,800000e4 <bss_done>
  sw zero,0(a0)
800000d8:	00052023          	sw	zero,0(a0)
  add a0,a0,4
800000dc:	00450513          	addi	a0,a0,4
  j bss_loop
800000e0:	ff5ff06f          	j	800000d4 <bss_loop>

800000e4 <bss_done>:
bss_done:

ctors_init:
  la a0, _ctors_start
800000e4:	c0003517          	auipc	a0,0xc0003
800000e8:	b7450513          	addi	a0,a0,-1164 # 40002c58 <_bss_end>
  addi sp,sp,-4
800000ec:	ffc10113          	addi	sp,sp,-4

800000f0 <ctors_loop>:
ctors_loop:
  la a1, _ctors_end
800000f0:	c0003597          	auipc	a1,0xc0003
800000f4:	b6858593          	addi	a1,a1,-1176 # 40002c58 <_bss_end>
  beq a0,a1,ctors_done
800000f8:	00b50e63          	beq	a0,a1,80000114 <ctors_done>
  lw a3,0(a0)
800000fc:	00052683          	lw	a3,0(a0)
  add a0,a0,4
80000100:	00450513          	addi	a0,a0,4
  sw a0,0(sp)
80000104:	00a12023          	sw	a0,0(sp)
  jalr  a3
80000108:	000680e7          	jalr	a3
  lw a0,0(sp)
8000010c:	00012503          	lw	a0,0(sp)
  j ctors_loop
80000110:	fe1ff06f          	j	800000f0 <ctors_loop>

80000114 <ctors_done>:
ctors_done:
  addi sp,sp,4
80000114:	00410113          	addi	sp,sp,4


  li a0, 0x880     //880 enable timer + external interrupts
80000118:	00001537          	lui	a0,0x1
8000011c:	88050513          	addi	a0,a0,-1920 # 880 <_stack_size+0x80>
  csrw mie,a0
80000120:	30451073          	csrw	mie,a0
  li a0, 0x1808     //1808 enable interrupts
80000124:	00002537          	lui	a0,0x2
80000128:	80850513          	addi	a0,a0,-2040 # 1808 <_stack_size+0x1008>
  csrw mstatus,a0
8000012c:	30051073          	csrw	mstatus,a0

  call main
80000130:	c0000097          	auipc	ra,0xc0000
80000134:	588080e7          	jalr	1416(ra) # 400006b8 <main>

80000138 <infinitLoop>:
infinitLoop:
  j infinitLoop
80000138:	0000006f          	j	80000138 <infinitLoop>

Disassembly of section .memory:

40000000 <timer_init>:
  volatile uint32_t CLEARS_TICKS;
  volatile uint32_t LIMIT;
  volatile uint32_t VALUE;
} Timer_Reg;

static void timer_init(Timer_Reg *reg){
40000000:	fe010113          	addi	sp,sp,-32
40000004:	00812e23          	sw	s0,28(sp)
40000008:	02010413          	addi	s0,sp,32
4000000c:	fea42623          	sw	a0,-20(s0)
	reg->CLEARS_TICKS  = 0;
40000010:	fec42783          	lw	a5,-20(s0)
40000014:	0007a023          	sw	zero,0(a5)
	reg->VALUE = 0;
40000018:	fec42783          	lw	a5,-20(s0)
4000001c:	0007a423          	sw	zero,8(a5)
}
40000020:	00000013          	nop
40000024:	01c12403          	lw	s0,28(sp)
40000028:	02010113          	addi	sp,sp,32
4000002c:	00008067          	ret

40000030 <prescaler_init>:
typedef struct
{
  volatile uint32_t LIMIT;
} Prescaler_Reg;

static void prescaler_init(Prescaler_Reg* reg){
40000030:	fe010113          	addi	sp,sp,-32
40000034:	00812e23          	sw	s0,28(sp)
40000038:	02010413          	addi	s0,sp,32
4000003c:	fea42623          	sw	a0,-20(s0)

}
40000040:	00000013          	nop
40000044:	01c12403          	lw	s0,28(sp)
40000048:	02010113          	addi	sp,sp,32
4000004c:	00008067          	ret

40000050 <interruptCtrl_init>:
{
  volatile uint32_t PENDINGS;
  volatile uint32_t MASKS;
} InterruptCtrl_Reg;

static void interruptCtrl_init(InterruptCtrl_Reg* reg){
40000050:	fe010113          	addi	sp,sp,-32
40000054:	00812e23          	sw	s0,28(sp)
40000058:	02010413          	addi	s0,sp,32
4000005c:	fea42623          	sw	a0,-20(s0)
	reg->MASKS = 0;
40000060:	fec42783          	lw	a5,-20(s0)
40000064:	0007a223          	sw	zero,4(a5)
	reg->PENDINGS = 0xFFFFFFFF;
40000068:	fec42783          	lw	a5,-20(s0)
4000006c:	fff00713          	li	a4,-1
40000070:	00e7a023          	sw	a4,0(a5)
}
40000074:	00000013          	nop
40000078:	01c12403          	lw	s0,28(sp)
4000007c:	02010113          	addi	sp,sp,32
40000080:	00008067          	ret

40000084 <uart_writeAvailability>:
	enum UartParity parity;
	enum UartStop stop;
	uint32_t clockDivider;
} Uart_Config;

static uint32_t uart_writeAvailability(Uart_Reg *reg){
40000084:	fe010113          	addi	sp,sp,-32
40000088:	00812e23          	sw	s0,28(sp)
4000008c:	02010413          	addi	s0,sp,32
40000090:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS >> 16) & 0xFF;
40000094:	fec42783          	lw	a5,-20(s0)
40000098:	0047a783          	lw	a5,4(a5)
4000009c:	0107d793          	srli	a5,a5,0x10
400000a0:	0ff7f793          	zext.b	a5,a5
}
400000a4:	00078513          	mv	a0,a5
400000a8:	01c12403          	lw	s0,28(sp)
400000ac:	02010113          	addi	sp,sp,32
400000b0:	00008067          	ret

400000b4 <uart_readOccupancy>:
static uint32_t uart_readOccupancy(Uart_Reg *reg){
400000b4:	fe010113          	addi	sp,sp,-32
400000b8:	00812e23          	sw	s0,28(sp)
400000bc:	02010413          	addi	s0,sp,32
400000c0:	fea42623          	sw	a0,-20(s0)
	return reg->STATUS >> 24;
400000c4:	fec42783          	lw	a5,-20(s0)
400000c8:	0047a783          	lw	a5,4(a5)
400000cc:	0187d793          	srli	a5,a5,0x18
}
400000d0:	00078513          	mv	a0,a5
400000d4:	01c12403          	lw	s0,28(sp)
400000d8:	02010113          	addi	sp,sp,32
400000dc:	00008067          	ret

400000e0 <uart_write>:

static void uart_write(Uart_Reg *reg, uint32_t data){
400000e0:	fe010113          	addi	sp,sp,-32
400000e4:	00112e23          	sw	ra,28(sp)
400000e8:	00812c23          	sw	s0,24(sp)
400000ec:	02010413          	addi	s0,sp,32
400000f0:	fea42623          	sw	a0,-20(s0)
400000f4:	feb42423          	sw	a1,-24(s0)
	while(uart_writeAvailability(reg) == 0);
400000f8:	00000013          	nop
400000fc:	fec42503          	lw	a0,-20(s0)
40000100:	f85ff0ef          	jal	ra,40000084 <uart_writeAvailability>
40000104:	00050793          	mv	a5,a0
40000108:	fe078ae3          	beqz	a5,400000fc <uart_write+0x1c>
	reg->DATA = data;
4000010c:	fec42783          	lw	a5,-20(s0)
40000110:	fe842703          	lw	a4,-24(s0)
40000114:	00e7a023          	sw	a4,0(a5)
}
40000118:	00000013          	nop
4000011c:	01c12083          	lw	ra,28(sp)
40000120:	01812403          	lw	s0,24(sp)
40000124:	02010113          	addi	sp,sp,32
40000128:	00008067          	ret

4000012c <uart_applyConfig>:

static void uart_applyConfig(Uart_Reg *reg, Uart_Config *config){
4000012c:	fe010113          	addi	sp,sp,-32
40000130:	00812e23          	sw	s0,28(sp)
40000134:	02010413          	addi	s0,sp,32
40000138:	fea42623          	sw	a0,-20(s0)
4000013c:	feb42423          	sw	a1,-24(s0)
	reg->CLOCK_DIVIDER = config->clockDivider;
40000140:	fe842783          	lw	a5,-24(s0)
40000144:	00c7a703          	lw	a4,12(a5)
40000148:	fec42783          	lw	a5,-20(s0)
4000014c:	00e7a423          	sw	a4,8(a5)
	reg->FRAME_CONFIG = ((config->dataLength-1) << 0) | (config->parity << 8) | (config->stop << 16);
40000150:	fe842783          	lw	a5,-24(s0)
40000154:	0007a783          	lw	a5,0(a5)
40000158:	fff78713          	addi	a4,a5,-1
4000015c:	fe842783          	lw	a5,-24(s0)
40000160:	0047a783          	lw	a5,4(a5)
40000164:	00879793          	slli	a5,a5,0x8
40000168:	00f76733          	or	a4,a4,a5
4000016c:	fe842783          	lw	a5,-24(s0)
40000170:	0087a783          	lw	a5,8(a5)
40000174:	01079793          	slli	a5,a5,0x10
40000178:	00f76733          	or	a4,a4,a5
4000017c:	fec42783          	lw	a5,-20(s0)
40000180:	00e7a623          	sw	a4,12(a5)
}
40000184:	00000013          	nop
40000188:	01c12403          	lw	s0,28(sp)
4000018c:	02010113          	addi	sp,sp,32
40000190:	00008067          	ret

40000194 <vga_isBusy>:
  volatile uint32_t  FRAME_BASE;
  volatile uint32_t  DUMMY0[13];
  volatile Vga_Timing TIMING;
} Vga_Reg;

static uint32_t vga_isBusy(Vga_Reg *reg){
40000194:	fe010113          	addi	sp,sp,-32
40000198:	00812e23          	sw	s0,28(sp)
4000019c:	02010413          	addi	s0,sp,32
400001a0:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS & 2) != 0;
400001a4:	fec42783          	lw	a5,-20(s0)
400001a8:	0007a783          	lw	a5,0(a5)
400001ac:	0027f793          	andi	a5,a5,2
400001b0:	00f037b3          	snez	a5,a5
400001b4:	0ff7f793          	zext.b	a5,a5
}
400001b8:	00078513          	mv	a0,a5
400001bc:	01c12403          	lw	s0,28(sp)
400001c0:	02010113          	addi	sp,sp,32
400001c4:	00008067          	ret

400001c8 <vga_run>:

static void vga_run(Vga_Reg *reg){
400001c8:	fe010113          	addi	sp,sp,-32
400001cc:	00812e23          	sw	s0,28(sp)
400001d0:	02010413          	addi	s0,sp,32
400001d4:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 1;
400001d8:	fec42783          	lw	a5,-20(s0)
400001dc:	00100713          	li	a4,1
400001e0:	00e7a023          	sw	a4,0(a5)
}
400001e4:	00000013          	nop
400001e8:	01c12403          	lw	s0,28(sp)
400001ec:	02010113          	addi	sp,sp,32
400001f0:	00008067          	ret

400001f4 <vga_stop>:

static void vga_stop(Vga_Reg *reg){
400001f4:	fe010113          	addi	sp,sp,-32
400001f8:	00112e23          	sw	ra,28(sp)
400001fc:	00812c23          	sw	s0,24(sp)
40000200:	02010413          	addi	s0,sp,32
40000204:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 0;
40000208:	fec42783          	lw	a5,-20(s0)
4000020c:	0007a023          	sw	zero,0(a5)
	while(vga_isBusy(reg));
40000210:	00000013          	nop
40000214:	fec42503          	lw	a0,-20(s0)
40000218:	f7dff0ef          	jal	ra,40000194 <vga_isBusy>
4000021c:	00050793          	mv	a5,a0
40000220:	fe079ae3          	bnez	a5,40000214 <vga_stop+0x20>
}
40000224:	00000013          	nop
40000228:	00000013          	nop
4000022c:	01c12083          	lw	ra,28(sp)
40000230:	01812403          	lw	s0,24(sp)
40000234:	02010113          	addi	sp,sp,32
40000238:	00008067          	ret

4000023c <prince_write>:
#include "briey.h"
void prince_write(uint32_t iData, uint32_t iAddress)
{
4000023c:	fe010113          	addi	sp,sp,-32
40000240:	00812e23          	sw	s0,28(sp)
40000244:	02010413          	addi	s0,sp,32
40000248:	fea42623          	sw	a0,-20(s0)
4000024c:	feb42423          	sw	a1,-24(s0)
	PRINCE_BASE->ADDRESS		= iAddress;
40000250:	f00027b7          	lui	a5,0xf0002
40000254:	fe842703          	lw	a4,-24(s0)
40000258:	00e7a423          	sw	a4,8(a5) # f0002008 <_stack_start+0x700016c8>
	PRINCE_BASE->WRITE_ENABLE 	= 1;
4000025c:	f00027b7          	lui	a5,0xf0002
40000260:	00100713          	li	a4,1
40000264:	00e7a223          	sw	a4,4(a5) # f0002004 <_stack_start+0x700016c4>
	PRINCE_BASE->IDATA			= iData;
40000268:	f00027b7          	lui	a5,0xf0002
4000026c:	fec42703          	lw	a4,-20(s0)
40000270:	00e7a623          	sw	a4,12(a5) # f000200c <_stack_start+0x700016cc>
	PRINCE_BASE->CHIP_SELECT	= 1;
40000274:	f00027b7          	lui	a5,0xf0002
40000278:	00100713          	li	a4,1
4000027c:	00e7a023          	sw	a4,0(a5) # f0002000 <_stack_start+0x700016c0>
	PRINCE_BASE->CHIP_SELECT	= 0;
40000280:	f00027b7          	lui	a5,0xf0002
40000284:	0007a023          	sw	zero,0(a5) # f0002000 <_stack_start+0x700016c0>
}
40000288:	00000013          	nop
4000028c:	01c12403          	lw	s0,28(sp)
40000290:	02010113          	addi	sp,sp,32
40000294:	00008067          	ret

40000298 <prince_read>:
uint32_t prince_read(uint32_t iAddress)
{
40000298:	fd010113          	addi	sp,sp,-48
4000029c:	02812623          	sw	s0,44(sp)
400002a0:	03010413          	addi	s0,sp,48
400002a4:	fca42e23          	sw	a0,-36(s0)
	PRINCE_BASE->ADDRESS		= iAddress;
400002a8:	f00027b7          	lui	a5,0xf0002
400002ac:	fdc42703          	lw	a4,-36(s0)
400002b0:	00e7a423          	sw	a4,8(a5) # f0002008 <_stack_start+0x700016c8>
	PRINCE_BASE->WRITE_ENABLE	= 0;
400002b4:	f00027b7          	lui	a5,0xf0002
400002b8:	0007a223          	sw	zero,4(a5) # f0002004 <_stack_start+0x700016c4>
	PRINCE_BASE->CHIP_SELECT	= 1;
400002bc:	f00027b7          	lui	a5,0xf0002
400002c0:	00100713          	li	a4,1
400002c4:	00e7a023          	sw	a4,0(a5) # f0002000 <_stack_start+0x700016c0>
	uint32_t res 				= PRINCE_BASE->ODATA;
400002c8:	f00027b7          	lui	a5,0xf0002
400002cc:	0107a783          	lw	a5,16(a5) # f0002010 <_stack_start+0x700016d0>
400002d0:	fef42623          	sw	a5,-20(s0)
	PRINCE_BASE->CHIP_SELECT	= 0;
400002d4:	f00027b7          	lui	a5,0xf0002
400002d8:	0007a023          	sw	zero,0(a5) # f0002000 <_stack_start+0x700016c0>
	return res;
400002dc:	fec42783          	lw	a5,-20(s0)
}
400002e0:	00078513          	mv	a0,a5
400002e4:	02c12403          	lw	s0,44(sp)
400002e8:	03010113          	addi	sp,sp,48
400002ec:	00008067          	ret

400002f0 <prince_cipher>:

void prince_cipher(uint32_t mode, uint32_t *key, uint32_t *block, uint32_t *res)
{
400002f0:	fe010113          	addi	sp,sp,-32
400002f4:	00112e23          	sw	ra,28(sp)
400002f8:	00812c23          	sw	s0,24(sp)
400002fc:	00912a23          	sw	s1,20(sp)
40000300:	02010413          	addi	s0,sp,32
40000304:	fea42623          	sw	a0,-20(s0)
40000308:	feb42423          	sw	a1,-24(s0)
4000030c:	fec42223          	sw	a2,-28(s0)
40000310:	fed42023          	sw	a3,-32(s0)
		//EN-OR-DE---
		prince_write(mode,PRINCE_ADDR_CONFIG);
40000314:	00a00593          	li	a1,10
40000318:	fec42503          	lw	a0,-20(s0)
4000031c:	f21ff0ef          	jal	ra,4000023c <prince_write>

		//BLOCK----
		prince_write(block[1],PRINCE_ADDR_BLOCK1);
40000320:	fe442783          	lw	a5,-28(s0)
40000324:	00478793          	addi	a5,a5,4
40000328:	0007a783          	lw	a5,0(a5)
4000032c:	02100593          	li	a1,33
40000330:	00078513          	mv	a0,a5
40000334:	f09ff0ef          	jal	ra,4000023c <prince_write>
		prince_write(block[0],PRINCE_ADDR_BLOCK0);
40000338:	fe442783          	lw	a5,-28(s0)
4000033c:	0007a783          	lw	a5,0(a5)
40000340:	02000593          	li	a1,32
40000344:	00078513          	mv	a0,a5
40000348:	ef5ff0ef          	jal	ra,4000023c <prince_write>

		//KEY----

		prince_write(key[3],PRINCE_ADDR_KEY3);
4000034c:	fe842783          	lw	a5,-24(s0)
40000350:	00c78793          	addi	a5,a5,12
40000354:	0007a783          	lw	a5,0(a5)
40000358:	01300593          	li	a1,19
4000035c:	00078513          	mv	a0,a5
40000360:	eddff0ef          	jal	ra,4000023c <prince_write>
		prince_write(key[2],PRINCE_ADDR_KEY2);
40000364:	fe842783          	lw	a5,-24(s0)
40000368:	00878793          	addi	a5,a5,8
4000036c:	0007a783          	lw	a5,0(a5)
40000370:	01200593          	li	a1,18
40000374:	00078513          	mv	a0,a5
40000378:	ec5ff0ef          	jal	ra,4000023c <prince_write>
		prince_write(key[1],PRINCE_ADDR_KEY1);
4000037c:	fe842783          	lw	a5,-24(s0)
40000380:	00478793          	addi	a5,a5,4
40000384:	0007a783          	lw	a5,0(a5)
40000388:	01100593          	li	a1,17
4000038c:	00078513          	mv	a0,a5
40000390:	eadff0ef          	jal	ra,4000023c <prince_write>
		prince_write(key[0],PRINCE_ADDR_KEY0);
40000394:	fe842783          	lw	a5,-24(s0)
40000398:	0007a783          	lw	a5,0(a5)
4000039c:	01000593          	li	a1,16
400003a0:	00078513          	mv	a0,a5
400003a4:	e99ff0ef          	jal	ra,4000023c <prince_write>

		//START----
		prince_write(0x1,PRINCE_ADDR_CTRL);
400003a8:	00800593          	li	a1,8
400003ac:	00100513          	li	a0,1
400003b0:	e8dff0ef          	jal	ra,4000023c <prince_write>

		//wait result----
		while(prince_read(PRINCE_ADDR_STATUS)==0);
400003b4:	00000013          	nop
400003b8:	00900513          	li	a0,9
400003bc:	eddff0ef          	jal	ra,40000298 <prince_read>
400003c0:	00050793          	mv	a5,a0
400003c4:	fe078ae3          	beqz	a5,400003b8 <prince_cipher+0xc8>
		res[1] = prince_read(PRINCE_ADDR_RESULT1);
400003c8:	fe042783          	lw	a5,-32(s0)
400003cc:	00478493          	addi	s1,a5,4
400003d0:	03100513          	li	a0,49
400003d4:	ec5ff0ef          	jal	ra,40000298 <prince_read>
400003d8:	00050793          	mv	a5,a0
400003dc:	00f4a023          	sw	a5,0(s1)
		res[0] = prince_read(PRINCE_ADDR_RESULT0);
400003e0:	03000513          	li	a0,48
400003e4:	eb5ff0ef          	jal	ra,40000298 <prince_read>
400003e8:	00050713          	mv	a4,a0
400003ec:	fe042783          	lw	a5,-32(s0)
400003f0:	00e7a023          	sw	a4,0(a5)

		//print result to terminal
		if(mode == PRINCE_OP_EN)
400003f4:	fec42703          	lw	a4,-20(s0)
400003f8:	00100793          	li	a5,1
400003fc:	00f71a63          	bne	a4,a5,40000410 <prince_cipher+0x120>
			print("=============================PRINCE ENCRYPTTION=============================\r\n");
40000400:	400027b7          	lui	a5,0x40002
40000404:	12478513          	addi	a0,a5,292 # 40002124 <vga_simRes_h160_v120+0x20>
40000408:	011010ef          	jal	ra,40001c18 <print>
4000040c:	0100006f          	j	4000041c <prince_cipher+0x12c>
		else
			print("=============================PRINCE DECRYPTTION=============================\r\n");
40000410:	400027b7          	lui	a5,0x40002
40000414:	17478513          	addi	a0,a5,372 # 40002174 <vga_simRes_h160_v120+0x70>
40000418:	001010ef          	jal	ra,40001c18 <print>
		print("\r\n");
4000041c:	400027b7          	lui	a5,0x40002
40000420:	1c478513          	addi	a0,a5,452 # 400021c4 <vga_simRes_h160_v120+0xc0>
40000424:	7f4010ef          	jal	ra,40001c18 <print>
		print64bit("PLAIN_TEXT (64-bit) : ", block);
40000428:	fe442583          	lw	a1,-28(s0)
4000042c:	400027b7          	lui	a5,0x40002
40000430:	1c878513          	addi	a0,a5,456 # 400021c8 <vga_simRes_h160_v120+0xc4>
40000434:	24d010ef          	jal	ra,40001e80 <print64bit>
		print128bit("KEY (128-bit) : ", key);
40000438:	fe842583          	lw	a1,-24(s0)
4000043c:	400027b7          	lui	a5,0x40002
40000440:	1e078513          	addi	a0,a5,480 # 400021e0 <vga_simRes_h160_v120+0xdc>
40000444:	2a1010ef          	jal	ra,40001ee4 <print128bit>
		print64bit("RESULT (64-bit) : ", res);
40000448:	fe042583          	lw	a1,-32(s0)
4000044c:	400027b7          	lui	a5,0x40002
40000450:	1f478513          	addi	a0,a5,500 # 400021f4 <vga_simRes_h160_v120+0xf0>
40000454:	22d010ef          	jal	ra,40001e80 <print64bit>
		print("\r\n============================================================================\r\n");
40000458:	400027b7          	lui	a5,0x40002
4000045c:	20878513          	addi	a0,a5,520 # 40002208 <vga_simRes_h160_v120+0x104>
40000460:	7b8010ef          	jal	ra,40001c18 <print>

}
40000464:	00000013          	nop
40000468:	01c12083          	lw	ra,28(sp)
4000046c:	01812403          	lw	s0,24(sp)
40000470:	01412483          	lw	s1,20(sp)
40000474:	02010113          	addi	sp,sp,32
40000478:	00008067          	ret

4000047c <timer_init>:
static void timer_init(Timer_Reg *reg){
4000047c:	fe010113          	addi	sp,sp,-32
40000480:	00812e23          	sw	s0,28(sp)
40000484:	02010413          	addi	s0,sp,32
40000488:	fea42623          	sw	a0,-20(s0)
	reg->CLEARS_TICKS  = 0;
4000048c:	fec42783          	lw	a5,-20(s0)
40000490:	0007a023          	sw	zero,0(a5)
	reg->VALUE = 0;
40000494:	fec42783          	lw	a5,-20(s0)
40000498:	0007a423          	sw	zero,8(a5)
}
4000049c:	00000013          	nop
400004a0:	01c12403          	lw	s0,28(sp)
400004a4:	02010113          	addi	sp,sp,32
400004a8:	00008067          	ret

400004ac <prescaler_init>:
static void prescaler_init(Prescaler_Reg* reg){
400004ac:	fe010113          	addi	sp,sp,-32
400004b0:	00812e23          	sw	s0,28(sp)
400004b4:	02010413          	addi	s0,sp,32
400004b8:	fea42623          	sw	a0,-20(s0)
}
400004bc:	00000013          	nop
400004c0:	01c12403          	lw	s0,28(sp)
400004c4:	02010113          	addi	sp,sp,32
400004c8:	00008067          	ret

400004cc <interruptCtrl_init>:
static void interruptCtrl_init(InterruptCtrl_Reg* reg){
400004cc:	fe010113          	addi	sp,sp,-32
400004d0:	00812e23          	sw	s0,28(sp)
400004d4:	02010413          	addi	s0,sp,32
400004d8:	fea42623          	sw	a0,-20(s0)
	reg->MASKS = 0;
400004dc:	fec42783          	lw	a5,-20(s0)
400004e0:	0007a223          	sw	zero,4(a5)
	reg->PENDINGS = 0xFFFFFFFF;
400004e4:	fec42783          	lw	a5,-20(s0)
400004e8:	fff00713          	li	a4,-1
400004ec:	00e7a023          	sw	a4,0(a5)
}
400004f0:	00000013          	nop
400004f4:	01c12403          	lw	s0,28(sp)
400004f8:	02010113          	addi	sp,sp,32
400004fc:	00008067          	ret

40000500 <uart_writeAvailability>:
static uint32_t uart_writeAvailability(Uart_Reg *reg){
40000500:	fe010113          	addi	sp,sp,-32
40000504:	00812e23          	sw	s0,28(sp)
40000508:	02010413          	addi	s0,sp,32
4000050c:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS >> 16) & 0xFF;
40000510:	fec42783          	lw	a5,-20(s0)
40000514:	0047a783          	lw	a5,4(a5)
40000518:	0107d793          	srli	a5,a5,0x10
4000051c:	0ff7f793          	zext.b	a5,a5
}
40000520:	00078513          	mv	a0,a5
40000524:	01c12403          	lw	s0,28(sp)
40000528:	02010113          	addi	sp,sp,32
4000052c:	00008067          	ret

40000530 <uart_readOccupancy>:
static uint32_t uart_readOccupancy(Uart_Reg *reg){
40000530:	fe010113          	addi	sp,sp,-32
40000534:	00812e23          	sw	s0,28(sp)
40000538:	02010413          	addi	s0,sp,32
4000053c:	fea42623          	sw	a0,-20(s0)
	return reg->STATUS >> 24;
40000540:	fec42783          	lw	a5,-20(s0)
40000544:	0047a783          	lw	a5,4(a5)
40000548:	0187d793          	srli	a5,a5,0x18
}
4000054c:	00078513          	mv	a0,a5
40000550:	01c12403          	lw	s0,28(sp)
40000554:	02010113          	addi	sp,sp,32
40000558:	00008067          	ret

4000055c <uart_write>:
static void uart_write(Uart_Reg *reg, uint32_t data){
4000055c:	fe010113          	addi	sp,sp,-32
40000560:	00112e23          	sw	ra,28(sp)
40000564:	00812c23          	sw	s0,24(sp)
40000568:	02010413          	addi	s0,sp,32
4000056c:	fea42623          	sw	a0,-20(s0)
40000570:	feb42423          	sw	a1,-24(s0)
	while(uart_writeAvailability(reg) == 0);
40000574:	00000013          	nop
40000578:	fec42503          	lw	a0,-20(s0)
4000057c:	f85ff0ef          	jal	ra,40000500 <uart_writeAvailability>
40000580:	00050793          	mv	a5,a0
40000584:	fe078ae3          	beqz	a5,40000578 <uart_write+0x1c>
	reg->DATA = data;
40000588:	fec42783          	lw	a5,-20(s0)
4000058c:	fe842703          	lw	a4,-24(s0)
40000590:	00e7a023          	sw	a4,0(a5)
}
40000594:	00000013          	nop
40000598:	01c12083          	lw	ra,28(sp)
4000059c:	01812403          	lw	s0,24(sp)
400005a0:	02010113          	addi	sp,sp,32
400005a4:	00008067          	ret

400005a8 <uart_applyConfig>:
static void uart_applyConfig(Uart_Reg *reg, Uart_Config *config){
400005a8:	fe010113          	addi	sp,sp,-32
400005ac:	00812e23          	sw	s0,28(sp)
400005b0:	02010413          	addi	s0,sp,32
400005b4:	fea42623          	sw	a0,-20(s0)
400005b8:	feb42423          	sw	a1,-24(s0)
	reg->CLOCK_DIVIDER = config->clockDivider;
400005bc:	fe842783          	lw	a5,-24(s0)
400005c0:	00c7a703          	lw	a4,12(a5)
400005c4:	fec42783          	lw	a5,-20(s0)
400005c8:	00e7a423          	sw	a4,8(a5)
	reg->FRAME_CONFIG = ((config->dataLength-1) << 0) | (config->parity << 8) | (config->stop << 16);
400005cc:	fe842783          	lw	a5,-24(s0)
400005d0:	0007a783          	lw	a5,0(a5)
400005d4:	fff78713          	addi	a4,a5,-1
400005d8:	fe842783          	lw	a5,-24(s0)
400005dc:	0047a783          	lw	a5,4(a5)
400005e0:	00879793          	slli	a5,a5,0x8
400005e4:	00f76733          	or	a4,a4,a5
400005e8:	fe842783          	lw	a5,-24(s0)
400005ec:	0087a783          	lw	a5,8(a5)
400005f0:	01079793          	slli	a5,a5,0x10
400005f4:	00f76733          	or	a4,a4,a5
400005f8:	fec42783          	lw	a5,-20(s0)
400005fc:	00e7a623          	sw	a4,12(a5)
}
40000600:	00000013          	nop
40000604:	01c12403          	lw	s0,28(sp)
40000608:	02010113          	addi	sp,sp,32
4000060c:	00008067          	ret

40000610 <vga_isBusy>:
static uint32_t vga_isBusy(Vga_Reg *reg){
40000610:	fe010113          	addi	sp,sp,-32
40000614:	00812e23          	sw	s0,28(sp)
40000618:	02010413          	addi	s0,sp,32
4000061c:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS & 2) != 0;
40000620:	fec42783          	lw	a5,-20(s0)
40000624:	0007a783          	lw	a5,0(a5)
40000628:	0027f793          	andi	a5,a5,2
4000062c:	00f037b3          	snez	a5,a5
40000630:	0ff7f793          	zext.b	a5,a5
}
40000634:	00078513          	mv	a0,a5
40000638:	01c12403          	lw	s0,28(sp)
4000063c:	02010113          	addi	sp,sp,32
40000640:	00008067          	ret

40000644 <vga_run>:
static void vga_run(Vga_Reg *reg){
40000644:	fe010113          	addi	sp,sp,-32
40000648:	00812e23          	sw	s0,28(sp)
4000064c:	02010413          	addi	s0,sp,32
40000650:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 1;
40000654:	fec42783          	lw	a5,-20(s0)
40000658:	00100713          	li	a4,1
4000065c:	00e7a023          	sw	a4,0(a5)
}
40000660:	00000013          	nop
40000664:	01c12403          	lw	s0,28(sp)
40000668:	02010113          	addi	sp,sp,32
4000066c:	00008067          	ret

40000670 <vga_stop>:
static void vga_stop(Vga_Reg *reg){
40000670:	fe010113          	addi	sp,sp,-32
40000674:	00112e23          	sw	ra,28(sp)
40000678:	00812c23          	sw	s0,24(sp)
4000067c:	02010413          	addi	s0,sp,32
40000680:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 0;
40000684:	fec42783          	lw	a5,-20(s0)
40000688:	0007a023          	sw	zero,0(a5)
	while(vga_isBusy(reg));
4000068c:	00000013          	nop
40000690:	fec42503          	lw	a0,-20(s0)
40000694:	f7dff0ef          	jal	ra,40000610 <vga_isBusy>
40000698:	00050793          	mv	a5,a0
4000069c:	fe079ae3          	bnez	a5,40000690 <vga_stop+0x20>
}
400006a0:	00000013          	nop
400006a4:	00000013          	nop
400006a8:	01c12083          	lw	ra,28(sp)
400006ac:	01812403          	lw	s0,24(sp)
400006b0:	02010113          	addi	sp,sp,32
400006b4:	00008067          	ret

400006b8 <main>:
#include <stdint.h>
#include <stdlib.h>
#include <briey.h>


int main() {
400006b8:	f7010113          	addi	sp,sp,-144
400006bc:	08112623          	sw	ra,140(sp)
400006c0:	08812423          	sw	s0,136(sp)
400006c4:	09010413          	addi	s0,sp,144
	Uart_Config uartConfig;
	uartConfig.dataLength = 8;
400006c8:	00800793          	li	a5,8
400006cc:	fef42023          	sw	a5,-32(s0)
	uartConfig.parity = NONE;
400006d0:	fe042223          	sw	zero,-28(s0)
	uartConfig.stop = ONE;
400006d4:	fe042423          	sw	zero,-24(s0)
	uartConfig.clockDivider = (CORE_HZ / 8 / 115200) - 1;
400006d8:	03500793          	li	a5,53
400006dc:	fef42623          	sw	a5,-20(s0)
	uart_applyConfig(UART,&uartConfig);
400006e0:	fe040793          	addi	a5,s0,-32
400006e4:	00078593          	mv	a1,a5
400006e8:	f0010537          	lui	a0,0xf0010
400006ec:	ebdff0ef          	jal	ra,400005a8 <uart_applyConfig>

	print("============================================================================\r\n");
400006f0:	400027b7          	lui	a5,0x40002
400006f4:	2bc78513          	addi	a0,a5,700 # 400022bc <vga_simRes_h160_v120+0x20>
400006f8:	520010ef          	jal	ra,40001c18 <print>
	print("===============================PRINCE TEST==================================\r\n");
400006fc:	400027b7          	lui	a5,0x40002
40000700:	30c78513          	addi	a0,a5,780 # 4000230c <vga_simRes_h160_v120+0x70>
40000704:	514010ef          	jal	ra,40001c18 <print>
	print("=========================LE DUY LINH - 18200157-============================\r\n");
40000708:	400027b7          	lui	a5,0x40002
4000070c:	35c78513          	addi	a0,a5,860 # 4000235c <vga_simRes_h160_v120+0xc0>
40000710:	508010ef          	jal	ra,40001c18 <print>
	print("============================================================================\r\n");
40000714:	400027b7          	lui	a5,0x40002
40000718:	2bc78513          	addi	a0,a5,700 # 400022bc <vga_simRes_h160_v120+0x20>
4000071c:	4fc010ef          	jal	ra,40001c18 <print>
	uint32_t prince_key[4] 		= {0x0, 0x0, 0x0, 0x0};
40000720:	fc042823          	sw	zero,-48(s0)
40000724:	fc042a23          	sw	zero,-44(s0)
40000728:	fc042c23          	sw	zero,-40(s0)
4000072c:	fc042e23          	sw	zero,-36(s0)
	uint32_t prince_block[2] 		= {0x0, 0x0};
40000730:	fc042423          	sw	zero,-56(s0)
40000734:	fc042623          	sw	zero,-52(s0)
	uint32_t prince_res[2] 	= {0x0,0x0};
40000738:	fc042023          	sw	zero,-64(s0)
4000073c:	fc042223          	sw	zero,-60(s0)
	print("\r\n===================================TEST 1===================================\r\n");
40000740:	400027b7          	lui	a5,0x40002
40000744:	3ac78513          	addi	a0,a5,940 # 400023ac <vga_simRes_h160_v120+0x110>
40000748:	4d0010ef          	jal	ra,40001c18 <print>

	prince_block[1] 	= 0x01234567;
4000074c:	012347b7          	lui	a5,0x1234
40000750:	56778793          	addi	a5,a5,1383 # 1234567 <_stack_size+0x1233d67>
40000754:	fcf42623          	sw	a5,-52(s0)
	prince_block[0] 	= 0x89abcdef;
40000758:	89abd7b7          	lui	a5,0x89abd
4000075c:	def78793          	addi	a5,a5,-529 # 89abcdef <_stack_start+0x9abc4af>
40000760:	fcf42423          	sw	a5,-56(s0)

	prince_key[3]		= 0x00112233;
40000764:	001127b7          	lui	a5,0x112
40000768:	23378793          	addi	a5,a5,563 # 112233 <_stack_size+0x111a33>
4000076c:	fcf42e23          	sw	a5,-36(s0)
	prince_key[2]		= 0x44556677;
40000770:	445567b7          	lui	a5,0x44556
40000774:	67778793          	addi	a5,a5,1655 # 44556677 <__global_pointer$+0x455321f>
40000778:	fcf42c23          	sw	a5,-40(s0)
	prince_key[1]		= 0x8899aabb;
4000077c:	8899b7b7          	lui	a5,0x8899b
40000780:	abb78793          	addi	a5,a5,-1349 # 8899aabb <_stack_start+0x899a17b>
40000784:	fcf42a23          	sw	a5,-44(s0)
	prince_key[0]		= 0xccddeeff;
40000788:	ccddf7b7          	lui	a5,0xccddf
4000078c:	eff78793          	addi	a5,a5,-257 # ccddeeff <_stack_start+0x4cdde5bf>
40000790:	fcf42823          	sw	a5,-48(s0)

	prince_cipher(PRINCE_OP_EN,prince_key,prince_block,prince_res);
40000794:	fc040693          	addi	a3,s0,-64
40000798:	fc840713          	addi	a4,s0,-56
4000079c:	fd040793          	addi	a5,s0,-48
400007a0:	00070613          	mv	a2,a4
400007a4:	00078593          	mv	a1,a5
400007a8:	00100513          	li	a0,1
400007ac:	b45ff0ef          	jal	ra,400002f0 <prince_cipher>

	print("\r\n===================================TEST 2===================================\r\n");
400007b0:	400027b7          	lui	a5,0x40002
400007b4:	40078513          	addi	a0,a5,1024 # 40002400 <vga_simRes_h160_v120+0x164>
400007b8:	460010ef          	jal	ra,40001c18 <print>

	prince_block[1] 	= 0x00000000;
400007bc:	fc042623          	sw	zero,-52(s0)
	prince_block[0] 	= 0x00000000;
400007c0:	fc042423          	sw	zero,-56(s0)

	prince_key[3]		= 0x00000000;
400007c4:	fc042e23          	sw	zero,-36(s0)
	prince_key[2]		= 0x00000000;
400007c8:	fc042c23          	sw	zero,-40(s0)
	prince_key[1]		= 0x00000000;
400007cc:	fc042a23          	sw	zero,-44(s0)
	prince_key[0]		= 0x00000000;
400007d0:	fc042823          	sw	zero,-48(s0)

	prince_cipher(PRINCE_OP_EN,prince_key,prince_block,prince_res);
400007d4:	fc040693          	addi	a3,s0,-64
400007d8:	fc840713          	addi	a4,s0,-56
400007dc:	fd040793          	addi	a5,s0,-48
400007e0:	00070613          	mv	a2,a4
400007e4:	00078593          	mv	a1,a5
400007e8:	00100513          	li	a0,1
400007ec:	b05ff0ef          	jal	ra,400002f0 <prince_cipher>
	print("\r\n===================================TEST 3===================================\r\n");
400007f0:	400027b7          	lui	a5,0x40002
400007f4:	45478513          	addi	a0,a5,1108 # 40002454 <vga_simRes_h160_v120+0x1b8>
400007f8:	420010ef          	jal	ra,40001c18 <print>

	prince_block[1] 	= 0x69c4e0d8;
400007fc:	69c4e7b7          	lui	a5,0x69c4e
40000800:	0d878793          	addi	a5,a5,216 # 69c4e0d8 <__global_pointer$+0x29c4ac80>
40000804:	fcf42623          	sw	a5,-52(s0)
	prince_block[0] 	= 0x6a7b0430;
40000808:	6a7b07b7          	lui	a5,0x6a7b0
4000080c:	43078793          	addi	a5,a5,1072 # 6a7b0430 <__global_pointer$+0x2a7acfd8>
40000810:	fcf42423          	sw	a5,-56(s0)

	prince_key[3]		= 0xd8cdb780;
40000814:	d8cdb7b7          	lui	a5,0xd8cdb
40000818:	78078793          	addi	a5,a5,1920 # d8cdb780 <_stack_start+0x58cdae40>
4000081c:	fcf42e23          	sw	a5,-36(s0)
	prince_key[2]		= 0x70b4c55a;
40000820:	70b4c7b7          	lui	a5,0x70b4c
40000824:	55a78793          	addi	a5,a5,1370 # 70b4c55a <__global_pointer$+0x30b49102>
40000828:	fcf42c23          	sw	a5,-40(s0)
	prince_key[1]		= 0x818665aa;
4000082c:	818667b7          	lui	a5,0x81866
40000830:	5aa78793          	addi	a5,a5,1450 # 818665aa <_stack_start+0x1865c6a>
40000834:	fcf42a23          	sw	a5,-44(s0)
	prince_key[0]		= 0x0d02dfda;
40000838:	0d02e7b7          	lui	a5,0xd02e
4000083c:	fda78793          	addi	a5,a5,-38 # d02dfda <_stack_size+0xd02d7da>
40000840:	fcf42823          	sw	a5,-48(s0)

	prince_cipher(PRINCE_OP_EN,prince_key,prince_block,prince_res);
40000844:	fc040693          	addi	a3,s0,-64
40000848:	fc840713          	addi	a4,s0,-56
4000084c:	fd040793          	addi	a5,s0,-48
40000850:	00070613          	mv	a2,a4
40000854:	00078593          	mv	a1,a5
40000858:	00100513          	li	a0,1
4000085c:	a95ff0ef          	jal	ra,400002f0 <prince_cipher>
	print("\r\n===================================TEST 4===================================\r\n");
40000860:	400027b7          	lui	a5,0x40002
40000864:	4a878513          	addi	a0,a5,1192 # 400024a8 <vga_simRes_h160_v120+0x20c>
40000868:	3b0010ef          	jal	ra,40001c18 <print>

	prince_block[1] 	= 0x43c6b256;
4000086c:	43c6b7b7          	lui	a5,0x43c6b
40000870:	25678793          	addi	a5,a5,598 # 43c6b256 <__global_pointer$+0x3c67dfe>
40000874:	fcf42623          	sw	a5,-52(s0)
	prince_block[0] 	= 0xd79de7e8;
40000878:	d79de7b7          	lui	a5,0xd79de
4000087c:	7e878793          	addi	a5,a5,2024 # d79de7e8 <_stack_start+0x579ddea8>
40000880:	fcf42423          	sw	a5,-56(s0)

	prince_key[3]		= 0xd8cdb780;
40000884:	d8cdb7b7          	lui	a5,0xd8cdb
40000888:	78078793          	addi	a5,a5,1920 # d8cdb780 <_stack_start+0x58cdae40>
4000088c:	fcf42e23          	sw	a5,-36(s0)
	prince_key[2]		= 0x70b4c55a;
40000890:	70b4c7b7          	lui	a5,0x70b4c
40000894:	55a78793          	addi	a5,a5,1370 # 70b4c55a <__global_pointer$+0x30b49102>
40000898:	fcf42c23          	sw	a5,-40(s0)
	prince_key[1]		= 0x818665aa;
4000089c:	818667b7          	lui	a5,0x81866
400008a0:	5aa78793          	addi	a5,a5,1450 # 818665aa <_stack_start+0x1865c6a>
400008a4:	fcf42a23          	sw	a5,-44(s0)
	prince_key[0]		= 0x0d02dfda;
400008a8:	0d02e7b7          	lui	a5,0xd02e
400008ac:	fda78793          	addi	a5,a5,-38 # d02dfda <_stack_size+0xd02d7da>
400008b0:	fcf42823          	sw	a5,-48(s0)

	prince_cipher(PRINCE_OP_DE,prince_key,prince_block,prince_res);
400008b4:	fc040693          	addi	a3,s0,-64
400008b8:	fc840713          	addi	a4,s0,-56
400008bc:	fd040793          	addi	a5,s0,-48
400008c0:	00070613          	mv	a2,a4
400008c4:	00078593          	mv	a1,a5
400008c8:	00000513          	li	a0,0
400008cc:	a25ff0ef          	jal	ra,400002f0 <prince_cipher>

	print("============================================================================\r\n");
400008d0:	400027b7          	lui	a5,0x40002
400008d4:	2bc78513          	addi	a0,a5,700 # 400022bc <vga_simRes_h160_v120+0x20>
400008d8:	340010ef          	jal	ra,40001c18 <print>
	print("===============================AES TEST=====================================\r\n");
400008dc:	400027b7          	lui	a5,0x40002
400008e0:	4fc78513          	addi	a0,a5,1276 # 400024fc <vga_simRes_h160_v120+0x260>
400008e4:	334010ef          	jal	ra,40001c18 <print>
	print("=========================LE DUY LINH - 18200157-============================\r\n");
400008e8:	400027b7          	lui	a5,0x40002
400008ec:	35c78513          	addi	a0,a5,860 # 4000235c <vga_simRes_h160_v120+0xc0>
400008f0:	328010ef          	jal	ra,40001c18 <print>
	print("============================================================================\r\n");
400008f4:	400027b7          	lui	a5,0x40002
400008f8:	2bc78513          	addi	a0,a5,700 # 400022bc <vga_simRes_h160_v120+0x20>
400008fc:	31c010ef          	jal	ra,40001c18 <print>
    unsigned int aes_key_128[4] = {0x0, 0x0, 0x0, 0x0};
40000900:	fa042823          	sw	zero,-80(s0)
40000904:	fa042a23          	sw	zero,-76(s0)
40000908:	fa042c23          	sw	zero,-72(s0)
4000090c:	fa042e23          	sw	zero,-68(s0)
    unsigned int aes_block[4] 	= {0x0, 0x0, 0x0, 0x0};
40000910:	fa042023          	sw	zero,-96(s0)
40000914:	fa042223          	sw	zero,-92(s0)
40000918:	fa042423          	sw	zero,-88(s0)
4000091c:	fa042623          	sw	zero,-84(s0)

    unsigned int aes_res[4] 	= {0x0, 0x0, 0x0, 0x0};
40000920:	f8042823          	sw	zero,-112(s0)
40000924:	f8042a23          	sw	zero,-108(s0)
40000928:	f8042c23          	sw	zero,-104(s0)
4000092c:	f8042e23          	sw	zero,-100(s0)

	print("\r\n=================================TEST 1=====================================\r\n");
40000930:	400027b7          	lui	a5,0x40002
40000934:	54c78513          	addi	a0,a5,1356 # 4000254c <vga_simRes_h160_v120+0x2b0>
40000938:	2e0010ef          	jal	ra,40001c18 <print>

    aes_block[3] 	= 0x33343536;
4000093c:	333437b7          	lui	a5,0x33343
40000940:	53678793          	addi	a5,a5,1334 # 33343536 <_stack_size+0x33342d36>
40000944:	faf42623          	sw	a5,-84(s0)
    aes_block[2] 	= 0x39303132;
40000948:	393037b7          	lui	a5,0x39303
4000094c:	13278793          	addi	a5,a5,306 # 39303132 <_stack_size+0x39302932>
40000950:	faf42423          	sw	a5,-88(s0)
    aes_block[1] 	= 0x35363738;
40000954:	353637b7          	lui	a5,0x35363
40000958:	73878793          	addi	a5,a5,1848 # 35363738 <_stack_size+0x35362f38>
4000095c:	faf42223          	sw	a5,-92(s0)
    aes_block[0] 	= 0x31323334;
40000960:	313237b7          	lui	a5,0x31323
40000964:	33478793          	addi	a5,a5,820 # 31323334 <_stack_size+0x31322b34>
40000968:	faf42023          	sw	a5,-96(s0)

	aes_key_128[3] 	= 0x37363534;
4000096c:	373637b7          	lui	a5,0x37363
40000970:	53478793          	addi	a5,a5,1332 # 37363534 <_stack_size+0x37362d34>
40000974:	faf42e23          	sw	a5,-68(s0)
    aes_key_128[2] 	= 0x31303938;
40000978:	313047b7          	lui	a5,0x31304
4000097c:	93878793          	addi	a5,a5,-1736 # 31303938 <_stack_size+0x31303138>
40000980:	faf42c23          	sw	a5,-72(s0)
    aes_key_128[1] 	= 0x35343332;
40000984:	353437b7          	lui	a5,0x35343
40000988:	33278793          	addi	a5,a5,818 # 35343332 <_stack_size+0x35342b32>
4000098c:	faf42a23          	sw	a5,-76(s0)
    aes_key_128[0]	= 0x39383736;
40000990:	393837b7          	lui	a5,0x39383
40000994:	73678793          	addi	a5,a5,1846 # 39383736 <_stack_size+0x39382f36>
40000998:	faf42823          	sw	a5,-80(s0)

   	aes_128_cipher(AES_OP_EN, aes_key_128, aes_block, aes_res);
4000099c:	f9040693          	addi	a3,s0,-112
400009a0:	fa040713          	addi	a4,s0,-96
400009a4:	fb040793          	addi	a5,s0,-80
400009a8:	00070613          	mv	a2,a4
400009ac:	00078593          	mv	a1,a5
400009b0:	00100513          	li	a0,1
400009b4:	32d000ef          	jal	ra,400014e0 <aes_128_cipher>
	print("\r\n=================================TEST 2=====================================\r\n");
400009b8:	400027b7          	lui	a5,0x40002
400009bc:	5a078513          	addi	a0,a5,1440 # 400025a0 <vga_simRes_h160_v120+0x304>
400009c0:	258010ef          	jal	ra,40001c18 <print>

    aes_block[3] 	= 0xfd1ee6b4;
400009c4:	fd1ee7b7          	lui	a5,0xfd1ee
400009c8:	6b478793          	addi	a5,a5,1716 # fd1ee6b4 <_stack_start+0x7d1edd74>
400009cc:	faf42623          	sw	a5,-84(s0)
    aes_block[2] 	= 0xbd2fb855;
400009d0:	bd2fc7b7          	lui	a5,0xbd2fc
400009d4:	85578793          	addi	a5,a5,-1963 # bd2fb855 <_stack_start+0x3d2faf15>
400009d8:	faf42423          	sw	a5,-88(s0)
    aes_block[1] 	= 0x6428318a;
400009dc:	642837b7          	lui	a5,0x64283
400009e0:	18a78793          	addi	a5,a5,394 # 6428318a <__global_pointer$+0x2427fd32>
400009e4:	faf42223          	sw	a5,-92(s0)
    aes_block[0] 	= 0x6e6f9733;
400009e8:	6e6f97b7          	lui	a5,0x6e6f9
400009ec:	73378793          	addi	a5,a5,1843 # 6e6f9733 <__global_pointer$+0x2e6f62db>
400009f0:	faf42023          	sw	a5,-96(s0)

	aes_key_128[3] 	= 0x33343536;
400009f4:	333437b7          	lui	a5,0x33343
400009f8:	53678793          	addi	a5,a5,1334 # 33343536 <_stack_size+0x33342d36>
400009fc:	faf42e23          	sw	a5,-68(s0)
    aes_key_128[2] 	= 0x39303132;
40000a00:	393037b7          	lui	a5,0x39303
40000a04:	13278793          	addi	a5,a5,306 # 39303132 <_stack_size+0x39302932>
40000a08:	faf42c23          	sw	a5,-72(s0)
    aes_key_128[1] 	= 0x35363738;
40000a0c:	353637b7          	lui	a5,0x35363
40000a10:	73878793          	addi	a5,a5,1848 # 35363738 <_stack_size+0x35362f38>
40000a14:	faf42a23          	sw	a5,-76(s0)
    aes_key_128[0]	= 0x31323334;
40000a18:	313237b7          	lui	a5,0x31323
40000a1c:	33478793          	addi	a5,a5,820 # 31323334 <_stack_size+0x31322b34>
40000a20:	faf42823          	sw	a5,-80(s0)

   	aes_128_cipher(AES_OP_DE, aes_key_128, aes_block, aes_res);
40000a24:	f9040693          	addi	a3,s0,-112
40000a28:	fa040713          	addi	a4,s0,-96
40000a2c:	fb040793          	addi	a5,s0,-80
40000a30:	00070613          	mv	a2,a4
40000a34:	00078593          	mv	a1,a5
40000a38:	00000513          	li	a0,0
40000a3c:	2a5000ef          	jal	ra,400014e0 <aes_128_cipher>
	print("\r\n=================================TEST 3=====================================\r\n");
40000a40:	400027b7          	lui	a5,0x40002
40000a44:	5f478513          	addi	a0,a5,1524 # 400025f4 <vga_simRes_h160_v120+0x358>
40000a48:	1d0010ef          	jal	ra,40001c18 <print>

    aes_block[3] 	= 0x7393172a;
40000a4c:	739317b7          	lui	a5,0x73931
40000a50:	72a78793          	addi	a5,a5,1834 # 7393172a <__global_pointer$+0x3392e2d2>
40000a54:	faf42623          	sw	a5,-84(s0)
    aes_block[2] 	= 0xe93d7e11;
40000a58:	e93d87b7          	lui	a5,0xe93d8
40000a5c:	e1178793          	addi	a5,a5,-495 # e93d7e11 <_stack_start+0x693d74d1>
40000a60:	faf42423          	sw	a5,-88(s0)
    aes_block[1] 	= 0x2e409f96;
40000a64:	2e40a7b7          	lui	a5,0x2e40a
40000a68:	f9678793          	addi	a5,a5,-106 # 2e409f96 <_stack_size+0x2e409796>
40000a6c:	faf42223          	sw	a5,-92(s0)
    aes_block[0] 	= 0x6bc1bee2;
40000a70:	6bc1c7b7          	lui	a5,0x6bc1c
40000a74:	ee278793          	addi	a5,a5,-286 # 6bc1bee2 <__global_pointer$+0x2bc18a8a>
40000a78:	faf42023          	sw	a5,-96(s0)

	aes_key_128[3] 	= 0x09cf4f3c;
40000a7c:	09cf57b7          	lui	a5,0x9cf5
40000a80:	f3c78793          	addi	a5,a5,-196 # 9cf4f3c <_stack_size+0x9cf473c>
40000a84:	faf42e23          	sw	a5,-68(s0)
    aes_key_128[2] 	= 0xabf71588;
40000a88:	abf717b7          	lui	a5,0xabf71
40000a8c:	58878793          	addi	a5,a5,1416 # abf71588 <_stack_start+0x2bf70c48>
40000a90:	faf42c23          	sw	a5,-72(s0)
    aes_key_128[1] 	= 0x28aed2a6;
40000a94:	28aed7b7          	lui	a5,0x28aed
40000a98:	2a678793          	addi	a5,a5,678 # 28aed2a6 <_stack_size+0x28aecaa6>
40000a9c:	faf42a23          	sw	a5,-76(s0)
    aes_key_128[0]	= 0x2b7e1516;
40000aa0:	2b7e17b7          	lui	a5,0x2b7e1
40000aa4:	51678793          	addi	a5,a5,1302 # 2b7e1516 <_stack_size+0x2b7e0d16>
40000aa8:	faf42823          	sw	a5,-80(s0)
   	aes_128_cipher(AES_OP_EN, aes_key_128, aes_block, aes_res);
40000aac:	f9040693          	addi	a3,s0,-112
40000ab0:	fa040713          	addi	a4,s0,-96
40000ab4:	fb040793          	addi	a5,s0,-80
40000ab8:	00070613          	mv	a2,a4
40000abc:	00078593          	mv	a1,a5
40000ac0:	00100513          	li	a0,1
40000ac4:	21d000ef          	jal	ra,400014e0 <aes_128_cipher>
	print("\r\n=================================TEST 4=====================================\r\n");
40000ac8:	400027b7          	lui	a5,0x40002
40000acc:	64878513          	addi	a0,a5,1608 # 40002648 <vga_simRes_h160_v120+0x3ac>
40000ad0:	148010ef          	jal	ra,40001c18 <print>

    aes_block[3] 	= 0x2466ef97;
40000ad4:	2466f7b7          	lui	a5,0x2466f
40000ad8:	f9778793          	addi	a5,a5,-105 # 2466ef97 <_stack_size+0x2466e797>
40000adc:	faf42623          	sw	a5,-84(s0)
    aes_block[2] 	= 0xa89ecaf3;
40000ae0:	a89ed7b7          	lui	a5,0xa89ed
40000ae4:	af378793          	addi	a5,a5,-1293 # a89ecaf3 <_stack_start+0x289ec1b3>
40000ae8:	faf42423          	sw	a5,-88(s0)
    aes_block[1] 	= 0x0d7a3660;
40000aec:	0d7a37b7          	lui	a5,0xd7a3
40000af0:	66078793          	addi	a5,a5,1632 # d7a3660 <_stack_size+0xd7a2e60>
40000af4:	faf42223          	sw	a5,-92(s0)
    aes_block[0] 	= 0x3ad77bb4;
40000af8:	3ad787b7          	lui	a5,0x3ad78
40000afc:	bb478793          	addi	a5,a5,-1100 # 3ad77bb4 <_stack_size+0x3ad773b4>
40000b00:	faf42023          	sw	a5,-96(s0)

	aes_key_128[3] 	= 0x09cf4f3c;
40000b04:	09cf57b7          	lui	a5,0x9cf5
40000b08:	f3c78793          	addi	a5,a5,-196 # 9cf4f3c <_stack_size+0x9cf473c>
40000b0c:	faf42e23          	sw	a5,-68(s0)
    aes_key_128[2] 	= 0xabf71588;
40000b10:	abf717b7          	lui	a5,0xabf71
40000b14:	58878793          	addi	a5,a5,1416 # abf71588 <_stack_start+0x2bf70c48>
40000b18:	faf42c23          	sw	a5,-72(s0)
    aes_key_128[1] 	= 0x28aed2a6;
40000b1c:	28aed7b7          	lui	a5,0x28aed
40000b20:	2a678793          	addi	a5,a5,678 # 28aed2a6 <_stack_size+0x28aecaa6>
40000b24:	faf42a23          	sw	a5,-76(s0)
    aes_key_128[0]	= 0x2b7e1516;
40000b28:	2b7e17b7          	lui	a5,0x2b7e1
40000b2c:	51678793          	addi	a5,a5,1302 # 2b7e1516 <_stack_size+0x2b7e0d16>
40000b30:	faf42823          	sw	a5,-80(s0)

   	aes_128_cipher(AES_OP_DE, aes_key_128, aes_block, aes_res);
40000b34:	f9040693          	addi	a3,s0,-112
40000b38:	fa040713          	addi	a4,s0,-96
40000b3c:	fb040793          	addi	a5,s0,-80
40000b40:	00070613          	mv	a2,a4
40000b44:	00078593          	mv	a1,a5
40000b48:	00000513          	li	a0,0
40000b4c:	195000ef          	jal	ra,400014e0 <aes_128_cipher>

   	print("\r\n==========================================TEST 5(AES256)========================================\r\n");
40000b50:	400027b7          	lui	a5,0x40002
40000b54:	69c78513          	addi	a0,a5,1692 # 4000269c <vga_simRes_h160_v120+0x400>
40000b58:	0c0010ef          	jal	ra,40001c18 <print>
    unsigned int aes_key_256[8] = {0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0};
40000b5c:	f6042823          	sw	zero,-144(s0)
40000b60:	f6042a23          	sw	zero,-140(s0)
40000b64:	f6042c23          	sw	zero,-136(s0)
40000b68:	f6042e23          	sw	zero,-132(s0)
40000b6c:	f8042023          	sw	zero,-128(s0)
40000b70:	f8042223          	sw	zero,-124(s0)
40000b74:	f8042423          	sw	zero,-120(s0)
40000b78:	f8042623          	sw	zero,-116(s0)

    aes_block[3] 	= 0x7393172a;
40000b7c:	739317b7          	lui	a5,0x73931
40000b80:	72a78793          	addi	a5,a5,1834 # 7393172a <__global_pointer$+0x3392e2d2>
40000b84:	faf42623          	sw	a5,-84(s0)
    aes_block[2] 	= 0xe93d7e11;
40000b88:	e93d87b7          	lui	a5,0xe93d8
40000b8c:	e1178793          	addi	a5,a5,-495 # e93d7e11 <_stack_start+0x693d74d1>
40000b90:	faf42423          	sw	a5,-88(s0)
    aes_block[1] 	= 0x2e409f96;
40000b94:	2e40a7b7          	lui	a5,0x2e40a
40000b98:	f9678793          	addi	a5,a5,-106 # 2e409f96 <_stack_size+0x2e409796>
40000b9c:	faf42223          	sw	a5,-92(s0)
    aes_block[0] 	= 0x6bc1bee2;
40000ba0:	6bc1c7b7          	lui	a5,0x6bc1c
40000ba4:	ee278793          	addi	a5,a5,-286 # 6bc1bee2 <__global_pointer$+0x2bc18a8a>
40000ba8:	faf42023          	sw	a5,-96(s0)

    aes_key_256[7] 	= 0x0914dff4;
40000bac:	0914e7b7          	lui	a5,0x914e
40000bb0:	ff478793          	addi	a5,a5,-12 # 914dff4 <_stack_size+0x914d7f4>
40000bb4:	f8f42623          	sw	a5,-116(s0)
    aes_key_256[6] 	= 0x2d9810a3;
40000bb8:	2d9817b7          	lui	a5,0x2d981
40000bbc:	0a378793          	addi	a5,a5,163 # 2d9810a3 <_stack_size+0x2d9808a3>
40000bc0:	f8f42423          	sw	a5,-120(s0)
    aes_key_256[5] 	= 0x3b6108d7;
40000bc4:	3b6117b7          	lui	a5,0x3b611
40000bc8:	8d778793          	addi	a5,a5,-1833 # 3b6108d7 <_stack_size+0x3b6100d7>
40000bcc:	f8f42223          	sw	a5,-124(s0)
    aes_key_256[4]	= 0x1f352c07;
40000bd0:	1f3537b7          	lui	a5,0x1f353
40000bd4:	c0778793          	addi	a5,a5,-1017 # 1f352c07 <_stack_size+0x1f352407>
40000bd8:	f8f42023          	sw	a5,-128(s0)
    aes_key_256[3] 	= 0x857d7781;
40000bdc:	857d77b7          	lui	a5,0x857d7
40000be0:	78178793          	addi	a5,a5,1921 # 857d7781 <_stack_start+0x57d6e41>
40000be4:	f6f42e23          	sw	a5,-132(s0)
    aes_key_256[2] 	= 0x2b73aef0;
40000be8:	2b73b7b7          	lui	a5,0x2b73b
40000bec:	ef078793          	addi	a5,a5,-272 # 2b73aef0 <_stack_size+0x2b73a6f0>
40000bf0:	f6f42c23          	sw	a5,-136(s0)
    aes_key_256[1] 	= 0x15ca71be;
40000bf4:	15ca77b7          	lui	a5,0x15ca7
40000bf8:	1be78793          	addi	a5,a5,446 # 15ca71be <_stack_size+0x15ca69be>
40000bfc:	f6f42a23          	sw	a5,-140(s0)
    aes_key_256[0]	= 0x603deb10;
40000c00:	603df7b7          	lui	a5,0x603df
40000c04:	b1078793          	addi	a5,a5,-1264 # 603deb10 <__global_pointer$+0x203db6b8>
40000c08:	f6f42823          	sw	a5,-144(s0)

    aes_256_cipher(AES_OP_EN, aes_key_256, aes_block, aes_res);
40000c0c:	f9040693          	addi	a3,s0,-112
40000c10:	fa040713          	addi	a4,s0,-96
40000c14:	f7040793          	addi	a5,s0,-144
40000c18:	00070613          	mv	a2,a4
40000c1c:	00078593          	mv	a1,a5
40000c20:	00100513          	li	a0,1
40000c24:	321000ef          	jal	ra,40001744 <aes_256_cipher>

   	print("\r\n==========================================TEST 6(AES256)========================================\r\n");
40000c28:	400027b7          	lui	a5,0x40002
40000c2c:	70478513          	addi	a0,a5,1796 # 40002704 <vga_simRes_h160_v120+0x468>
40000c30:	7e9000ef          	jal	ra,40001c18 <print>

    aes_block[3] 	= 0x3db181f8 ;
40000c34:	3db187b7          	lui	a5,0x3db18
40000c38:	1f878793          	addi	a5,a5,504 # 3db181f8 <_stack_size+0x3db179f8>
40000c3c:	faf42623          	sw	a5,-84(s0)
    aes_block[2] 	= 0x064b5a7e ;
40000c40:	064b67b7          	lui	a5,0x64b6
40000c44:	a7e78793          	addi	a5,a5,-1410 # 64b5a7e <_stack_size+0x64b527e>
40000c48:	faf42423          	sw	a5,-88(s0)
    aes_block[1] 	= 0xb5d2a03c;
40000c4c:	b5d2a7b7          	lui	a5,0xb5d2a
40000c50:	03c78793          	addi	a5,a5,60 # b5d2a03c <_stack_start+0x35d296fc>
40000c54:	faf42223          	sw	a5,-92(s0)
    aes_block[0] 	= 0xf3eed1bd;
40000c58:	f3eed7b7          	lui	a5,0xf3eed
40000c5c:	1bd78793          	addi	a5,a5,445 # f3eed1bd <_stack_start+0x73eec87d>
40000c60:	faf42023          	sw	a5,-96(s0)

    aes_key_256[7] 	= 0x0914dff4;
40000c64:	0914e7b7          	lui	a5,0x914e
40000c68:	ff478793          	addi	a5,a5,-12 # 914dff4 <_stack_size+0x914d7f4>
40000c6c:	f8f42623          	sw	a5,-116(s0)
    aes_key_256[6] 	= 0x2d9810a3;
40000c70:	2d9817b7          	lui	a5,0x2d981
40000c74:	0a378793          	addi	a5,a5,163 # 2d9810a3 <_stack_size+0x2d9808a3>
40000c78:	f8f42423          	sw	a5,-120(s0)
    aes_key_256[5] 	= 0x3b6108d7;
40000c7c:	3b6117b7          	lui	a5,0x3b611
40000c80:	8d778793          	addi	a5,a5,-1833 # 3b6108d7 <_stack_size+0x3b6100d7>
40000c84:	f8f42223          	sw	a5,-124(s0)
    aes_key_256[4]	= 0x1f352c07;
40000c88:	1f3537b7          	lui	a5,0x1f353
40000c8c:	c0778793          	addi	a5,a5,-1017 # 1f352c07 <_stack_size+0x1f352407>
40000c90:	f8f42023          	sw	a5,-128(s0)
    aes_key_256[3] 	= 0x857d7781;
40000c94:	857d77b7          	lui	a5,0x857d7
40000c98:	78178793          	addi	a5,a5,1921 # 857d7781 <_stack_start+0x57d6e41>
40000c9c:	f6f42e23          	sw	a5,-132(s0)
    aes_key_256[2] 	= 0x2b73aef0;
40000ca0:	2b73b7b7          	lui	a5,0x2b73b
40000ca4:	ef078793          	addi	a5,a5,-272 # 2b73aef0 <_stack_size+0x2b73a6f0>
40000ca8:	f6f42c23          	sw	a5,-136(s0)
    aes_key_256[1] 	= 0x15ca71be;
40000cac:	15ca77b7          	lui	a5,0x15ca7
40000cb0:	1be78793          	addi	a5,a5,446 # 15ca71be <_stack_size+0x15ca69be>
40000cb4:	f6f42a23          	sw	a5,-140(s0)
    aes_key_256[0]	= 0x603deb10;
40000cb8:	603df7b7          	lui	a5,0x603df
40000cbc:	b1078793          	addi	a5,a5,-1264 # 603deb10 <__global_pointer$+0x203db6b8>
40000cc0:	f6f42823          	sw	a5,-144(s0)

    aes_256_cipher(AES_OP_DE, aes_key_256, aes_block, aes_res);
40000cc4:	f9040693          	addi	a3,s0,-112
40000cc8:	fa040713          	addi	a4,s0,-96
40000ccc:	f7040793          	addi	a5,s0,-144
40000cd0:	00070613          	mv	a2,a4
40000cd4:	00078593          	mv	a1,a5
40000cd8:	00000513          	li	a0,0
40000cdc:	269000ef          	jal	ra,40001744 <aes_256_cipher>
	return 0;	
40000ce0:	00000793          	li	a5,0
}
40000ce4:	00078513          	mv	a0,a5
40000ce8:	08c12083          	lw	ra,140(sp)
40000cec:	08812403          	lw	s0,136(sp)
40000cf0:	09010113          	addi	sp,sp,144
40000cf4:	00008067          	ret

40000cf8 <irqCallback>:
void irqCallback(){
40000cf8:	ff010113          	addi	sp,sp,-16
40000cfc:	00812623          	sw	s0,12(sp)
40000d00:	01010413          	addi	s0,sp,16

}
40000d04:	00000013          	nop
40000d08:	00c12403          	lw	s0,12(sp)
40000d0c:	01010113          	addi	sp,sp,16
40000d10:	00008067          	ret

40000d14 <timer_init>:
static void timer_init(Timer_Reg *reg){
40000d14:	fe010113          	addi	sp,sp,-32
40000d18:	00812e23          	sw	s0,28(sp)
40000d1c:	02010413          	addi	s0,sp,32
40000d20:	fea42623          	sw	a0,-20(s0)
	reg->CLEARS_TICKS  = 0;
40000d24:	fec42783          	lw	a5,-20(s0)
40000d28:	0007a023          	sw	zero,0(a5)
	reg->VALUE = 0;
40000d2c:	fec42783          	lw	a5,-20(s0)
40000d30:	0007a423          	sw	zero,8(a5)
}
40000d34:	00000013          	nop
40000d38:	01c12403          	lw	s0,28(sp)
40000d3c:	02010113          	addi	sp,sp,32
40000d40:	00008067          	ret

40000d44 <prescaler_init>:
static void prescaler_init(Prescaler_Reg* reg){
40000d44:	fe010113          	addi	sp,sp,-32
40000d48:	00812e23          	sw	s0,28(sp)
40000d4c:	02010413          	addi	s0,sp,32
40000d50:	fea42623          	sw	a0,-20(s0)
}
40000d54:	00000013          	nop
40000d58:	01c12403          	lw	s0,28(sp)
40000d5c:	02010113          	addi	sp,sp,32
40000d60:	00008067          	ret

40000d64 <interruptCtrl_init>:
static void interruptCtrl_init(InterruptCtrl_Reg* reg){
40000d64:	fe010113          	addi	sp,sp,-32
40000d68:	00812e23          	sw	s0,28(sp)
40000d6c:	02010413          	addi	s0,sp,32
40000d70:	fea42623          	sw	a0,-20(s0)
	reg->MASKS = 0;
40000d74:	fec42783          	lw	a5,-20(s0)
40000d78:	0007a223          	sw	zero,4(a5)
	reg->PENDINGS = 0xFFFFFFFF;
40000d7c:	fec42783          	lw	a5,-20(s0)
40000d80:	fff00713          	li	a4,-1
40000d84:	00e7a023          	sw	a4,0(a5)
}
40000d88:	00000013          	nop
40000d8c:	01c12403          	lw	s0,28(sp)
40000d90:	02010113          	addi	sp,sp,32
40000d94:	00008067          	ret

40000d98 <uart_writeAvailability>:
static uint32_t uart_writeAvailability(Uart_Reg *reg){
40000d98:	fe010113          	addi	sp,sp,-32
40000d9c:	00812e23          	sw	s0,28(sp)
40000da0:	02010413          	addi	s0,sp,32
40000da4:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS >> 16) & 0xFF;
40000da8:	fec42783          	lw	a5,-20(s0)
40000dac:	0047a783          	lw	a5,4(a5)
40000db0:	0107d793          	srli	a5,a5,0x10
40000db4:	0ff7f793          	zext.b	a5,a5
}
40000db8:	00078513          	mv	a0,a5
40000dbc:	01c12403          	lw	s0,28(sp)
40000dc0:	02010113          	addi	sp,sp,32
40000dc4:	00008067          	ret

40000dc8 <uart_readOccupancy>:
static uint32_t uart_readOccupancy(Uart_Reg *reg){
40000dc8:	fe010113          	addi	sp,sp,-32
40000dcc:	00812e23          	sw	s0,28(sp)
40000dd0:	02010413          	addi	s0,sp,32
40000dd4:	fea42623          	sw	a0,-20(s0)
	return reg->STATUS >> 24;
40000dd8:	fec42783          	lw	a5,-20(s0)
40000ddc:	0047a783          	lw	a5,4(a5)
40000de0:	0187d793          	srli	a5,a5,0x18
}
40000de4:	00078513          	mv	a0,a5
40000de8:	01c12403          	lw	s0,28(sp)
40000dec:	02010113          	addi	sp,sp,32
40000df0:	00008067          	ret

40000df4 <uart_write>:
static void uart_write(Uart_Reg *reg, uint32_t data){
40000df4:	fe010113          	addi	sp,sp,-32
40000df8:	00112e23          	sw	ra,28(sp)
40000dfc:	00812c23          	sw	s0,24(sp)
40000e00:	02010413          	addi	s0,sp,32
40000e04:	fea42623          	sw	a0,-20(s0)
40000e08:	feb42423          	sw	a1,-24(s0)
	while(uart_writeAvailability(reg) == 0);
40000e0c:	00000013          	nop
40000e10:	fec42503          	lw	a0,-20(s0)
40000e14:	f85ff0ef          	jal	ra,40000d98 <uart_writeAvailability>
40000e18:	00050793          	mv	a5,a0
40000e1c:	fe078ae3          	beqz	a5,40000e10 <uart_write+0x1c>
	reg->DATA = data;
40000e20:	fec42783          	lw	a5,-20(s0)
40000e24:	fe842703          	lw	a4,-24(s0)
40000e28:	00e7a023          	sw	a4,0(a5)
}
40000e2c:	00000013          	nop
40000e30:	01c12083          	lw	ra,28(sp)
40000e34:	01812403          	lw	s0,24(sp)
40000e38:	02010113          	addi	sp,sp,32
40000e3c:	00008067          	ret

40000e40 <uart_applyConfig>:
static void uart_applyConfig(Uart_Reg *reg, Uart_Config *config){
40000e40:	fe010113          	addi	sp,sp,-32
40000e44:	00812e23          	sw	s0,28(sp)
40000e48:	02010413          	addi	s0,sp,32
40000e4c:	fea42623          	sw	a0,-20(s0)
40000e50:	feb42423          	sw	a1,-24(s0)
	reg->CLOCK_DIVIDER = config->clockDivider;
40000e54:	fe842783          	lw	a5,-24(s0)
40000e58:	00c7a703          	lw	a4,12(a5)
40000e5c:	fec42783          	lw	a5,-20(s0)
40000e60:	00e7a423          	sw	a4,8(a5)
	reg->FRAME_CONFIG = ((config->dataLength-1) << 0) | (config->parity << 8) | (config->stop << 16);
40000e64:	fe842783          	lw	a5,-24(s0)
40000e68:	0007a783          	lw	a5,0(a5)
40000e6c:	fff78713          	addi	a4,a5,-1
40000e70:	fe842783          	lw	a5,-24(s0)
40000e74:	0047a783          	lw	a5,4(a5)
40000e78:	00879793          	slli	a5,a5,0x8
40000e7c:	00f76733          	or	a4,a4,a5
40000e80:	fe842783          	lw	a5,-24(s0)
40000e84:	0087a783          	lw	a5,8(a5)
40000e88:	01079793          	slli	a5,a5,0x10
40000e8c:	00f76733          	or	a4,a4,a5
40000e90:	fec42783          	lw	a5,-20(s0)
40000e94:	00e7a623          	sw	a4,12(a5)
}
40000e98:	00000013          	nop
40000e9c:	01c12403          	lw	s0,28(sp)
40000ea0:	02010113          	addi	sp,sp,32
40000ea4:	00008067          	ret

40000ea8 <vga_isBusy>:
static uint32_t vga_isBusy(Vga_Reg *reg){
40000ea8:	fe010113          	addi	sp,sp,-32
40000eac:	00812e23          	sw	s0,28(sp)
40000eb0:	02010413          	addi	s0,sp,32
40000eb4:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS & 2) != 0;
40000eb8:	fec42783          	lw	a5,-20(s0)
40000ebc:	0007a783          	lw	a5,0(a5)
40000ec0:	0027f793          	andi	a5,a5,2
40000ec4:	00f037b3          	snez	a5,a5
40000ec8:	0ff7f793          	zext.b	a5,a5
}
40000ecc:	00078513          	mv	a0,a5
40000ed0:	01c12403          	lw	s0,28(sp)
40000ed4:	02010113          	addi	sp,sp,32
40000ed8:	00008067          	ret

40000edc <vga_run>:
static void vga_run(Vga_Reg *reg){
40000edc:	fe010113          	addi	sp,sp,-32
40000ee0:	00812e23          	sw	s0,28(sp)
40000ee4:	02010413          	addi	s0,sp,32
40000ee8:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 1;
40000eec:	fec42783          	lw	a5,-20(s0)
40000ef0:	00100713          	li	a4,1
40000ef4:	00e7a023          	sw	a4,0(a5)
}
40000ef8:	00000013          	nop
40000efc:	01c12403          	lw	s0,28(sp)
40000f00:	02010113          	addi	sp,sp,32
40000f04:	00008067          	ret

40000f08 <vga_stop>:
static void vga_stop(Vga_Reg *reg){
40000f08:	fe010113          	addi	sp,sp,-32
40000f0c:	00112e23          	sw	ra,28(sp)
40000f10:	00812c23          	sw	s0,24(sp)
40000f14:	02010413          	addi	s0,sp,32
40000f18:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 0;
40000f1c:	fec42783          	lw	a5,-20(s0)
40000f20:	0007a023          	sw	zero,0(a5)
	while(vga_isBusy(reg));
40000f24:	00000013          	nop
40000f28:	fec42503          	lw	a0,-20(s0)
40000f2c:	f7dff0ef          	jal	ra,40000ea8 <vga_isBusy>
40000f30:	00050793          	mv	a5,a0
40000f34:	fe079ae3          	bnez	a5,40000f28 <vga_stop+0x20>
}
40000f38:	00000013          	nop
40000f3c:	00000013          	nop
40000f40:	01c12083          	lw	ra,28(sp)
40000f44:	01812403          	lw	s0,24(sp)
40000f48:	02010113          	addi	sp,sp,32
40000f4c:	00008067          	ret

40000f50 <present_write>:
#include "briey.h"
void present_write(uint32_t iData, uint32_t iAddress)
{
40000f50:	fe010113          	addi	sp,sp,-32
40000f54:	00812e23          	sw	s0,28(sp)
40000f58:	02010413          	addi	s0,sp,32
40000f5c:	fea42623          	sw	a0,-20(s0)
40000f60:	feb42423          	sw	a1,-24(s0)
	PRESENT_BASE->ADDRESS		= iAddress;
40000f64:	f00037b7          	lui	a5,0xf0003
40000f68:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40000f6c:	fe842703          	lw	a4,-24(s0)
40000f70:	00e7a623          	sw	a4,12(a5)
	PRESENT_BASE->WRITE_N 		= 0;
40000f74:	f00037b7          	lui	a5,0xf0003
40000f78:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40000f7c:	0007a223          	sw	zero,4(a5)
	PRESENT_BASE->READ_N 		= 1;
40000f80:	f00037b7          	lui	a5,0xf0003
40000f84:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40000f88:	00100713          	li	a4,1
40000f8c:	00e7a423          	sw	a4,8(a5)
	PRESENT_BASE->IDATA			= iData;
40000f90:	f00037b7          	lui	a5,0xf0003
40000f94:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40000f98:	fec42703          	lw	a4,-20(s0)
40000f9c:	00e7a823          	sw	a4,16(a5)
	PRESENT_BASE->CHIP_SELECT_N	= 0;
40000fa0:	f00037b7          	lui	a5,0xf0003
40000fa4:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40000fa8:	0007a023          	sw	zero,0(a5)
	PRESENT_BASE->CHIP_SELECT_N	= 1;
40000fac:	f00037b7          	lui	a5,0xf0003
40000fb0:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40000fb4:	00100713          	li	a4,1
40000fb8:	00e7a023          	sw	a4,0(a5)
}
40000fbc:	00000013          	nop
40000fc0:	01c12403          	lw	s0,28(sp)
40000fc4:	02010113          	addi	sp,sp,32
40000fc8:	00008067          	ret

40000fcc <present_read>:
uint32_t present_read(uint32_t iAddress)
{
40000fcc:	fd010113          	addi	sp,sp,-48
40000fd0:	02812623          	sw	s0,44(sp)
40000fd4:	03010413          	addi	s0,sp,48
40000fd8:	fca42e23          	sw	a0,-36(s0)
	PRESENT_BASE->ADDRESS		= iAddress;
40000fdc:	f00037b7          	lui	a5,0xf0003
40000fe0:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40000fe4:	fdc42703          	lw	a4,-36(s0)
40000fe8:	00e7a623          	sw	a4,12(a5)
	PRESENT_BASE->READ_N		= 0;
40000fec:	f00037b7          	lui	a5,0xf0003
40000ff0:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40000ff4:	0007a423          	sw	zero,8(a5)
	PRESENT_BASE->WRITE_N		= 1;
40000ff8:	f00037b7          	lui	a5,0xf0003
40000ffc:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40001000:	00100713          	li	a4,1
40001004:	00e7a223          	sw	a4,4(a5)
	PRESENT_BASE->CHIP_SELECT_N	= 0;
40001008:	f00037b7          	lui	a5,0xf0003
4000100c:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40001010:	0007a023          	sw	zero,0(a5)
	uint32_t res 				= PRESENT_BASE->ODATA;
40001014:	f00037b7          	lui	a5,0xf0003
40001018:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
4000101c:	0147a783          	lw	a5,20(a5)
40001020:	fef42623          	sw	a5,-20(s0)
	PRESENT_BASE->CHIP_SELECT_N	= 1;
40001024:	f00037b7          	lui	a5,0xf0003
40001028:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
4000102c:	00100713          	li	a4,1
40001030:	00e7a023          	sw	a4,0(a5)
	return res;
40001034:	fec42783          	lw	a5,-20(s0)
}
40001038:	00078513          	mv	a0,a5
4000103c:	02c12403          	lw	s0,44(sp)
40001040:	03010113          	addi	sp,sp,48
40001044:	00008067          	ret

40001048 <present_cipher>:
void present_cipher(unsigned char operation, uint32_t *key, uint32_t *block, uint32_t *res) {
40001048:	fe010113          	addi	sp,sp,-32
4000104c:	00112e23          	sw	ra,28(sp)
40001050:	00812c23          	sw	s0,24(sp)
40001054:	00912a23          	sw	s1,20(sp)
40001058:	02010413          	addi	s0,sp,32
4000105c:	00050793          	mv	a5,a0
40001060:	feb42423          	sw	a1,-24(s0)
40001064:	fec42223          	sw	a2,-28(s0)
40001068:	fed42023          	sw	a3,-32(s0)
4000106c:	fef407a3          	sb	a5,-17(s0)

	//EN_OR_DE
	if(operation == PRESENT_OP_EN) present_write(PRESENT_OP_EN,PRESENT_ADDR_EN_OR_DE);
40001070:	fef44783          	lbu	a5,-17(s0)
40001074:	00079a63          	bnez	a5,40001088 <present_cipher+0x40>
40001078:	00800593          	li	a1,8
4000107c:	00000513          	li	a0,0
40001080:	ed1ff0ef          	jal	ra,40000f50 <present_write>
40001084:	0100006f          	j	40001094 <present_cipher+0x4c>
	else present_write(PRESENT_OP_EN,PRESENT_ADDR_EN_OR_DE);
40001088:	00800593          	li	a1,8
4000108c:	00000513          	li	a0,0
40001090:	ec1ff0ef          	jal	ra,40000f50 <present_write>

	//PLAIN_TEXT
	present_write(block[1],PRESENT_ADDR_BLOCK_BASE +1);
40001094:	fe442783          	lw	a5,-28(s0)
40001098:	00478793          	addi	a5,a5,4
4000109c:	0007a783          	lw	a5,0(a5)
400010a0:	00500593          	li	a1,5
400010a4:	00078513          	mv	a0,a5
400010a8:	ea9ff0ef          	jal	ra,40000f50 <present_write>
	present_write(block[0],PRESENT_ADDR_BLOCK_BASE);
400010ac:	fe442783          	lw	a5,-28(s0)
400010b0:	0007a783          	lw	a5,0(a5)
400010b4:	00400593          	li	a1,4
400010b8:	00078513          	mv	a0,a5
400010bc:	e95ff0ef          	jal	ra,40000f50 <present_write>

	//KEY
	present_write(key[2],PRESENT_ADDR_BLOCK_BASE +2);
400010c0:	fe842783          	lw	a5,-24(s0)
400010c4:	00878793          	addi	a5,a5,8
400010c8:	0007a783          	lw	a5,0(a5)
400010cc:	00600593          	li	a1,6
400010d0:	00078513          	mv	a0,a5
400010d4:	e7dff0ef          	jal	ra,40000f50 <present_write>
	present_write(key[1],PRESENT_ADDR_BLOCK_BASE +1);
400010d8:	fe842783          	lw	a5,-24(s0)
400010dc:	00478793          	addi	a5,a5,4
400010e0:	0007a783          	lw	a5,0(a5)
400010e4:	00500593          	li	a1,5
400010e8:	00078513          	mv	a0,a5
400010ec:	e65ff0ef          	jal	ra,40000f50 <present_write>
	present_write(key[0],PRESENT_ADDR_BLOCK_BASE);
400010f0:	fe842783          	lw	a5,-24(s0)
400010f4:	0007a783          	lw	a5,0(a5)
400010f8:	00400593          	li	a1,4
400010fc:	00078513          	mv	a0,a5
40001100:	e51ff0ef          	jal	ra,40000f50 <present_write>

	//START
	present_write(0x1,PRESENT_ADDR_START);
40001104:	00000593          	li	a1,0
40001108:	00100513          	li	a0,1
4000110c:	e45ff0ef          	jal	ra,40000f50 <present_write>
    while(present_read(PRESENT_ADDR_RESULT_BASE) == 0);
40001110:	00000013          	nop
40001114:	00600513          	li	a0,6
40001118:	eb5ff0ef          	jal	ra,40000fcc <present_read>
4000111c:	00050793          	mv	a5,a0
40001120:	fe078ae3          	beqz	a5,40001114 <present_cipher+0xcc>

    res[1] = present_read(PRESENT_ADDR_RESULT_BASE +1);
40001124:	fe042783          	lw	a5,-32(s0)
40001128:	00478493          	addi	s1,a5,4
4000112c:	00700513          	li	a0,7
40001130:	e9dff0ef          	jal	ra,40000fcc <present_read>
40001134:	00050793          	mv	a5,a0
40001138:	00f4a023          	sw	a5,0(s1)
    res[0] =present_read(PRESENT_ADDR_RESULT_BASE);
4000113c:	00600513          	li	a0,6
40001140:	e8dff0ef          	jal	ra,40000fcc <present_read>
40001144:	00050713          	mv	a4,a0
40001148:	fe042783          	lw	a5,-32(s0)
4000114c:	00e7a023          	sw	a4,0(a5)


    //print result to terminal
	if(operation == PRESENT_OP_EN)
40001150:	fef44783          	lbu	a5,-17(s0)
40001154:	00079a63          	bnez	a5,40001168 <present_cipher+0x120>
		print("============================PRESENT ENCRYPTTION==============================\r\n");
40001158:	400027b7          	lui	a5,0x40002
4000115c:	7cc78513          	addi	a0,a5,1996 # 400027cc <vga_simRes_h160_v120+0x20>
40001160:	2b9000ef          	jal	ra,40001c18 <print>
40001164:	0100006f          	j	40001174 <present_cipher+0x12c>
	else
		print("============================PRESENT DECRYPTTION==============================\r\n");
40001168:	400037b7          	lui	a5,0x40003
4000116c:	81c78513          	addi	a0,a5,-2020 # 4000281c <vga_simRes_h160_v120+0x70>
40001170:	2a9000ef          	jal	ra,40001c18 <print>
	print64bit("\r\nPLAIN_TEXT (64-bit) : ", block);
40001174:	fe442583          	lw	a1,-28(s0)
40001178:	400037b7          	lui	a5,0x40003
4000117c:	86c78513          	addi	a0,a5,-1940 # 4000286c <vga_simRes_h160_v120+0xc0>
40001180:	501000ef          	jal	ra,40001e80 <print64bit>
	print80bit("KEY (80-bit) : ", key);
40001184:	fe842583          	lw	a1,-24(s0)
40001188:	400037b7          	lui	a5,0x40003
4000118c:	88878513          	addi	a0,a5,-1912 # 40002888 <vga_simRes_h160_v120+0xdc>
40001190:	5e1000ef          	jal	ra,40001f70 <print80bit>
	print64bit("RESULT (64-bit) : ", res);
40001194:	fe042583          	lw	a1,-32(s0)
40001198:	400037b7          	lui	a5,0x40003
4000119c:	89878513          	addi	a0,a5,-1896 # 40002898 <vga_simRes_h160_v120+0xec>
400011a0:	4e1000ef          	jal	ra,40001e80 <print64bit>
	print("\r\n============================================================================\r\n");
400011a4:	400037b7          	lui	a5,0x40003
400011a8:	8ac78513          	addi	a0,a5,-1876 # 400028ac <vga_simRes_h160_v120+0x100>
400011ac:	26d000ef          	jal	ra,40001c18 <print>
}
400011b0:	00000013          	nop
400011b4:	01c12083          	lw	ra,28(sp)
400011b8:	01812403          	lw	s0,24(sp)
400011bc:	01412483          	lw	s1,20(sp)
400011c0:	02010113          	addi	sp,sp,32
400011c4:	00008067          	ret

400011c8 <timer_init>:
static void timer_init(Timer_Reg *reg){
400011c8:	fe010113          	addi	sp,sp,-32
400011cc:	00812e23          	sw	s0,28(sp)
400011d0:	02010413          	addi	s0,sp,32
400011d4:	fea42623          	sw	a0,-20(s0)
	reg->CLEARS_TICKS  = 0;
400011d8:	fec42783          	lw	a5,-20(s0)
400011dc:	0007a023          	sw	zero,0(a5)
	reg->VALUE = 0;
400011e0:	fec42783          	lw	a5,-20(s0)
400011e4:	0007a423          	sw	zero,8(a5)
}
400011e8:	00000013          	nop
400011ec:	01c12403          	lw	s0,28(sp)
400011f0:	02010113          	addi	sp,sp,32
400011f4:	00008067          	ret

400011f8 <prescaler_init>:
static void prescaler_init(Prescaler_Reg* reg){
400011f8:	fe010113          	addi	sp,sp,-32
400011fc:	00812e23          	sw	s0,28(sp)
40001200:	02010413          	addi	s0,sp,32
40001204:	fea42623          	sw	a0,-20(s0)
}
40001208:	00000013          	nop
4000120c:	01c12403          	lw	s0,28(sp)
40001210:	02010113          	addi	sp,sp,32
40001214:	00008067          	ret

40001218 <interruptCtrl_init>:
static void interruptCtrl_init(InterruptCtrl_Reg* reg){
40001218:	fe010113          	addi	sp,sp,-32
4000121c:	00812e23          	sw	s0,28(sp)
40001220:	02010413          	addi	s0,sp,32
40001224:	fea42623          	sw	a0,-20(s0)
	reg->MASKS = 0;
40001228:	fec42783          	lw	a5,-20(s0)
4000122c:	0007a223          	sw	zero,4(a5)
	reg->PENDINGS = 0xFFFFFFFF;
40001230:	fec42783          	lw	a5,-20(s0)
40001234:	fff00713          	li	a4,-1
40001238:	00e7a023          	sw	a4,0(a5)
}
4000123c:	00000013          	nop
40001240:	01c12403          	lw	s0,28(sp)
40001244:	02010113          	addi	sp,sp,32
40001248:	00008067          	ret

4000124c <uart_writeAvailability>:
static uint32_t uart_writeAvailability(Uart_Reg *reg){
4000124c:	fe010113          	addi	sp,sp,-32
40001250:	00812e23          	sw	s0,28(sp)
40001254:	02010413          	addi	s0,sp,32
40001258:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS >> 16) & 0xFF;
4000125c:	fec42783          	lw	a5,-20(s0)
40001260:	0047a783          	lw	a5,4(a5)
40001264:	0107d793          	srli	a5,a5,0x10
40001268:	0ff7f793          	zext.b	a5,a5
}
4000126c:	00078513          	mv	a0,a5
40001270:	01c12403          	lw	s0,28(sp)
40001274:	02010113          	addi	sp,sp,32
40001278:	00008067          	ret

4000127c <uart_readOccupancy>:
static uint32_t uart_readOccupancy(Uart_Reg *reg){
4000127c:	fe010113          	addi	sp,sp,-32
40001280:	00812e23          	sw	s0,28(sp)
40001284:	02010413          	addi	s0,sp,32
40001288:	fea42623          	sw	a0,-20(s0)
	return reg->STATUS >> 24;
4000128c:	fec42783          	lw	a5,-20(s0)
40001290:	0047a783          	lw	a5,4(a5)
40001294:	0187d793          	srli	a5,a5,0x18
}
40001298:	00078513          	mv	a0,a5
4000129c:	01c12403          	lw	s0,28(sp)
400012a0:	02010113          	addi	sp,sp,32
400012a4:	00008067          	ret

400012a8 <uart_write>:
static void uart_write(Uart_Reg *reg, uint32_t data){
400012a8:	fe010113          	addi	sp,sp,-32
400012ac:	00112e23          	sw	ra,28(sp)
400012b0:	00812c23          	sw	s0,24(sp)
400012b4:	02010413          	addi	s0,sp,32
400012b8:	fea42623          	sw	a0,-20(s0)
400012bc:	feb42423          	sw	a1,-24(s0)
	while(uart_writeAvailability(reg) == 0);
400012c0:	00000013          	nop
400012c4:	fec42503          	lw	a0,-20(s0)
400012c8:	f85ff0ef          	jal	ra,4000124c <uart_writeAvailability>
400012cc:	00050793          	mv	a5,a0
400012d0:	fe078ae3          	beqz	a5,400012c4 <uart_write+0x1c>
	reg->DATA = data;
400012d4:	fec42783          	lw	a5,-20(s0)
400012d8:	fe842703          	lw	a4,-24(s0)
400012dc:	00e7a023          	sw	a4,0(a5)
}
400012e0:	00000013          	nop
400012e4:	01c12083          	lw	ra,28(sp)
400012e8:	01812403          	lw	s0,24(sp)
400012ec:	02010113          	addi	sp,sp,32
400012f0:	00008067          	ret

400012f4 <uart_applyConfig>:
static void uart_applyConfig(Uart_Reg *reg, Uart_Config *config){
400012f4:	fe010113          	addi	sp,sp,-32
400012f8:	00812e23          	sw	s0,28(sp)
400012fc:	02010413          	addi	s0,sp,32
40001300:	fea42623          	sw	a0,-20(s0)
40001304:	feb42423          	sw	a1,-24(s0)
	reg->CLOCK_DIVIDER = config->clockDivider;
40001308:	fe842783          	lw	a5,-24(s0)
4000130c:	00c7a703          	lw	a4,12(a5)
40001310:	fec42783          	lw	a5,-20(s0)
40001314:	00e7a423          	sw	a4,8(a5)
	reg->FRAME_CONFIG = ((config->dataLength-1) << 0) | (config->parity << 8) | (config->stop << 16);
40001318:	fe842783          	lw	a5,-24(s0)
4000131c:	0007a783          	lw	a5,0(a5)
40001320:	fff78713          	addi	a4,a5,-1
40001324:	fe842783          	lw	a5,-24(s0)
40001328:	0047a783          	lw	a5,4(a5)
4000132c:	00879793          	slli	a5,a5,0x8
40001330:	00f76733          	or	a4,a4,a5
40001334:	fe842783          	lw	a5,-24(s0)
40001338:	0087a783          	lw	a5,8(a5)
4000133c:	01079793          	slli	a5,a5,0x10
40001340:	00f76733          	or	a4,a4,a5
40001344:	fec42783          	lw	a5,-20(s0)
40001348:	00e7a623          	sw	a4,12(a5)
}
4000134c:	00000013          	nop
40001350:	01c12403          	lw	s0,28(sp)
40001354:	02010113          	addi	sp,sp,32
40001358:	00008067          	ret

4000135c <vga_isBusy>:
static uint32_t vga_isBusy(Vga_Reg *reg){
4000135c:	fe010113          	addi	sp,sp,-32
40001360:	00812e23          	sw	s0,28(sp)
40001364:	02010413          	addi	s0,sp,32
40001368:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS & 2) != 0;
4000136c:	fec42783          	lw	a5,-20(s0)
40001370:	0007a783          	lw	a5,0(a5)
40001374:	0027f793          	andi	a5,a5,2
40001378:	00f037b3          	snez	a5,a5
4000137c:	0ff7f793          	zext.b	a5,a5
}
40001380:	00078513          	mv	a0,a5
40001384:	01c12403          	lw	s0,28(sp)
40001388:	02010113          	addi	sp,sp,32
4000138c:	00008067          	ret

40001390 <vga_run>:
static void vga_run(Vga_Reg *reg){
40001390:	fe010113          	addi	sp,sp,-32
40001394:	00812e23          	sw	s0,28(sp)
40001398:	02010413          	addi	s0,sp,32
4000139c:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 1;
400013a0:	fec42783          	lw	a5,-20(s0)
400013a4:	00100713          	li	a4,1
400013a8:	00e7a023          	sw	a4,0(a5)
}
400013ac:	00000013          	nop
400013b0:	01c12403          	lw	s0,28(sp)
400013b4:	02010113          	addi	sp,sp,32
400013b8:	00008067          	ret

400013bc <vga_stop>:
static void vga_stop(Vga_Reg *reg){
400013bc:	fe010113          	addi	sp,sp,-32
400013c0:	00112e23          	sw	ra,28(sp)
400013c4:	00812c23          	sw	s0,24(sp)
400013c8:	02010413          	addi	s0,sp,32
400013cc:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 0;
400013d0:	fec42783          	lw	a5,-20(s0)
400013d4:	0007a023          	sw	zero,0(a5)
	while(vga_isBusy(reg));
400013d8:	00000013          	nop
400013dc:	fec42503          	lw	a0,-20(s0)
400013e0:	f7dff0ef          	jal	ra,4000135c <vga_isBusy>
400013e4:	00050793          	mv	a5,a0
400013e8:	fe079ae3          	bnez	a5,400013dc <vga_stop+0x20>
}
400013ec:	00000013          	nop
400013f0:	00000013          	nop
400013f4:	01c12083          	lw	ra,28(sp)
400013f8:	01812403          	lw	s0,24(sp)
400013fc:	02010113          	addi	sp,sp,32
40001400:	00008067          	ret

40001404 <aes_write>:
#include "briey.h"
void aes_write(uint32_t iData, uint32_t iAddress)
{
40001404:	fe010113          	addi	sp,sp,-32
40001408:	00812e23          	sw	s0,28(sp)
4000140c:	02010413          	addi	s0,sp,32
40001410:	fea42623          	sw	a0,-20(s0)
40001414:	feb42423          	sw	a1,-24(s0)
	AES_BASE->ADDRESS		= iAddress;
40001418:	f00027b7          	lui	a5,0xf0002
4000141c:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40001420:	fe842703          	lw	a4,-24(s0)
40001424:	00e7a423          	sw	a4,8(a5)
	AES_BASE->WRITE_ENABLE 	= 1;
40001428:	f00027b7          	lui	a5,0xf0002
4000142c:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40001430:	00100713          	li	a4,1
40001434:	00e7a223          	sw	a4,4(a5)
	AES_BASE->IDATA			= iData;
40001438:	f00027b7          	lui	a5,0xf0002
4000143c:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40001440:	fec42703          	lw	a4,-20(s0)
40001444:	00e7a623          	sw	a4,12(a5)
	AES_BASE->CHIP_SELECT	= 1;
40001448:	f00027b7          	lui	a5,0xf0002
4000144c:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40001450:	00100713          	li	a4,1
40001454:	00e7a023          	sw	a4,0(a5)
	AES_BASE->CHIP_SELECT	= 0;
40001458:	f00027b7          	lui	a5,0xf0002
4000145c:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40001460:	0007a023          	sw	zero,0(a5)
}
40001464:	00000013          	nop
40001468:	01c12403          	lw	s0,28(sp)
4000146c:	02010113          	addi	sp,sp,32
40001470:	00008067          	ret

40001474 <aes_read>:
uint32_t aes_read(uint32_t iAddress)
{
40001474:	fd010113          	addi	sp,sp,-48
40001478:	02812623          	sw	s0,44(sp)
4000147c:	03010413          	addi	s0,sp,48
40001480:	fca42e23          	sw	a0,-36(s0)
	AES_BASE->ADDRESS		= iAddress;
40001484:	f00027b7          	lui	a5,0xf0002
40001488:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
4000148c:	fdc42703          	lw	a4,-36(s0)
40001490:	00e7a423          	sw	a4,8(a5)
	AES_BASE->WRITE_ENABLE	= 0;
40001494:	f00027b7          	lui	a5,0xf0002
40001498:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
4000149c:	0007a223          	sw	zero,4(a5)
	AES_BASE->CHIP_SELECT	= 1;
400014a0:	f00027b7          	lui	a5,0xf0002
400014a4:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
400014a8:	00100713          	li	a4,1
400014ac:	00e7a023          	sw	a4,0(a5)
	uint32_t res 				= AES_BASE->ODATA;
400014b0:	f00027b7          	lui	a5,0xf0002
400014b4:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
400014b8:	0107a783          	lw	a5,16(a5)
400014bc:	fef42623          	sw	a5,-20(s0)
	AES_BASE->CHIP_SELECT	= 0;
400014c0:	f00027b7          	lui	a5,0xf0002
400014c4:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
400014c8:	0007a023          	sw	zero,0(a5)
	return res;
400014cc:	fec42783          	lw	a5,-20(s0)
}
400014d0:	00078513          	mv	a0,a5
400014d4:	02c12403          	lw	s0,44(sp)
400014d8:	03010113          	addi	sp,sp,48
400014dc:	00008067          	ret

400014e0 <aes_128_cipher>:
void aes_128_cipher(unsigned char operation, uint32_t *key, uint32_t *block, uint32_t *res) {
400014e0:	fd010113          	addi	sp,sp,-48
400014e4:	02112623          	sw	ra,44(sp)
400014e8:	02812423          	sw	s0,40(sp)
400014ec:	02912223          	sw	s1,36(sp)
400014f0:	03010413          	addi	s0,sp,48
400014f4:	00050793          	mv	a5,a0
400014f8:	fcb42c23          	sw	a1,-40(s0)
400014fc:	fcc42a23          	sw	a2,-44(s0)
40001500:	fcd42823          	sw	a3,-48(s0)
40001504:	fcf40fa3          	sb	a5,-33(s0)
	aes_write(0x0,AES_ADDR_KEY_BASE +7);
40001508:	01700593          	li	a1,23
4000150c:	00000513          	li	a0,0
40001510:	ef5ff0ef          	jal	ra,40001404 <aes_write>
	aes_write(0x0,AES_ADDR_KEY_BASE +6);
40001514:	01600593          	li	a1,22
40001518:	00000513          	li	a0,0
4000151c:	ee9ff0ef          	jal	ra,40001404 <aes_write>
	aes_write(0x0,AES_ADDR_KEY_BASE +5);
40001520:	01500593          	li	a1,21
40001524:	00000513          	li	a0,0
40001528:	eddff0ef          	jal	ra,40001404 <aes_write>
	aes_write(0x0,AES_ADDR_KEY_BASE +4);
4000152c:	01400593          	li	a1,20
40001530:	00000513          	li	a0,0
40001534:	ed1ff0ef          	jal	ra,40001404 <aes_write>
	aes_write(key[3],AES_ADDR_KEY_BASE +3);
40001538:	fd842783          	lw	a5,-40(s0)
4000153c:	00c78793          	addi	a5,a5,12
40001540:	0007a783          	lw	a5,0(a5)
40001544:	01300593          	li	a1,19
40001548:	00078513          	mv	a0,a5
4000154c:	eb9ff0ef          	jal	ra,40001404 <aes_write>
	aes_write(key[2],AES_ADDR_KEY_BASE +2);
40001550:	fd842783          	lw	a5,-40(s0)
40001554:	00878793          	addi	a5,a5,8
40001558:	0007a783          	lw	a5,0(a5)
4000155c:	01200593          	li	a1,18
40001560:	00078513          	mv	a0,a5
40001564:	ea1ff0ef          	jal	ra,40001404 <aes_write>
	aes_write(key[1],AES_ADDR_KEY_BASE +1);
40001568:	fd842783          	lw	a5,-40(s0)
4000156c:	00478793          	addi	a5,a5,4
40001570:	0007a783          	lw	a5,0(a5)
40001574:	01100593          	li	a1,17
40001578:	00078513          	mv	a0,a5
4000157c:	e89ff0ef          	jal	ra,40001404 <aes_write>
	aes_write(key[0],AES_ADDR_KEY_BASE);
40001580:	fd842783          	lw	a5,-40(s0)
40001584:	0007a783          	lw	a5,0(a5)
40001588:	01000593          	li	a1,16
4000158c:	00078513          	mv	a0,a5
40001590:	e75ff0ef          	jal	ra,40001404 <aes_write>

	aes_write(AES_CONFIG_128_KEY,AES_ADDR_CONFIG);
40001594:	00a00593          	li	a1,10
40001598:	00000513          	li	a0,0
4000159c:	e69ff0ef          	jal	ra,40001404 <aes_write>
	aes_write(AES_CTRL_INIT_KEY,AES_ADDR_CTRL);
400015a0:	00800593          	li	a1,8
400015a4:	00100513          	li	a0,1
400015a8:	e5dff0ef          	jal	ra,40001404 <aes_write>

    while(aes_read(AES_ADDR_STATUS) == 0);
400015ac:	00000013          	nop
400015b0:	00900513          	li	a0,9
400015b4:	ec1ff0ef          	jal	ra,40001474 <aes_read>
400015b8:	00050793          	mv	a5,a0
400015bc:	fe078ae3          	beqz	a5,400015b0 <aes_128_cipher+0xd0>

    aes_write(block[3],AES_ADDR_BLOCK_BASE + 3);
400015c0:	fd442783          	lw	a5,-44(s0)
400015c4:	00c78793          	addi	a5,a5,12
400015c8:	0007a783          	lw	a5,0(a5)
400015cc:	02300593          	li	a1,35
400015d0:	00078513          	mv	a0,a5
400015d4:	e31ff0ef          	jal	ra,40001404 <aes_write>
    aes_write(block[2],AES_ADDR_BLOCK_BASE + 2);
400015d8:	fd442783          	lw	a5,-44(s0)
400015dc:	00878793          	addi	a5,a5,8
400015e0:	0007a783          	lw	a5,0(a5)
400015e4:	02200593          	li	a1,34
400015e8:	00078513          	mv	a0,a5
400015ec:	e19ff0ef          	jal	ra,40001404 <aes_write>
    aes_write(block[1],AES_ADDR_BLOCK_BASE + 1);
400015f0:	fd442783          	lw	a5,-44(s0)
400015f4:	00478793          	addi	a5,a5,4
400015f8:	0007a783          	lw	a5,0(a5)
400015fc:	02100593          	li	a1,33
40001600:	00078513          	mv	a0,a5
40001604:	e01ff0ef          	jal	ra,40001404 <aes_write>
    aes_write(block[0],AES_ADDR_BLOCK_BASE + 0);
40001608:	fd442783          	lw	a5,-44(s0)
4000160c:	0007a783          	lw	a5,0(a5)
40001610:	02000593          	li	a1,32
40001614:	00078513          	mv	a0,a5
40001618:	dedff0ef          	jal	ra,40001404 <aes_write>


    unsigned char AES_CONFIG = 0x00;
4000161c:	fe0407a3          	sb	zero,-17(s0)
	if (operation == 0x01)
40001620:	fdf44703          	lbu	a4,-33(s0)
40001624:	00100793          	li	a5,1
40001628:	00f71863          	bne	a4,a5,40001638 <aes_128_cipher+0x158>
		AES_CONFIG = AES_CONFIG_128_EN;
4000162c:	00100793          	li	a5,1
40001630:	fef407a3          	sb	a5,-17(s0)
40001634:	0080006f          	j	4000163c <aes_128_cipher+0x15c>
	else
		AES_CONFIG = AES_CONFIG_128_DE;
40001638:	fe0407a3          	sb	zero,-17(s0)

	aes_write(AES_CONFIG,AES_ADDR_CONFIG);
4000163c:	fef44783          	lbu	a5,-17(s0)
40001640:	00a00593          	li	a1,10
40001644:	00078513          	mv	a0,a5
40001648:	dbdff0ef          	jal	ra,40001404 <aes_write>
    aes_write(AES_CTRL_START, AES_ADDR_CTRL);
4000164c:	00800593          	li	a1,8
40001650:	00200513          	li	a0,2
40001654:	db1ff0ef          	jal	ra,40001404 <aes_write>

    while(aes_read(AES_ADDR_STATUS) == 0);
40001658:	00000013          	nop
4000165c:	00900513          	li	a0,9
40001660:	e15ff0ef          	jal	ra,40001474 <aes_read>
40001664:	00050793          	mv	a5,a0
40001668:	fe078ae3          	beqz	a5,4000165c <aes_128_cipher+0x17c>

    res[3] = aes_read(AES_ADDR_RESULT_BASE + 3);
4000166c:	fd042783          	lw	a5,-48(s0)
40001670:	00c78493          	addi	s1,a5,12
40001674:	03300513          	li	a0,51
40001678:	dfdff0ef          	jal	ra,40001474 <aes_read>
4000167c:	00050793          	mv	a5,a0
40001680:	00f4a023          	sw	a5,0(s1)
    res[2] = aes_read(AES_ADDR_RESULT_BASE + 2);
40001684:	fd042783          	lw	a5,-48(s0)
40001688:	00878493          	addi	s1,a5,8
4000168c:	03200513          	li	a0,50
40001690:	de5ff0ef          	jal	ra,40001474 <aes_read>
40001694:	00050793          	mv	a5,a0
40001698:	00f4a023          	sw	a5,0(s1)
    res[1] = aes_read(AES_ADDR_RESULT_BASE + 1);
4000169c:	fd042783          	lw	a5,-48(s0)
400016a0:	00478493          	addi	s1,a5,4
400016a4:	03100513          	li	a0,49
400016a8:	dcdff0ef          	jal	ra,40001474 <aes_read>
400016ac:	00050793          	mv	a5,a0
400016b0:	00f4a023          	sw	a5,0(s1)
    res[0] = aes_read(AES_ADDR_RESULT_BASE + 0);
400016b4:	03000513          	li	a0,48
400016b8:	dbdff0ef          	jal	ra,40001474 <aes_read>
400016bc:	00050713          	mv	a4,a0
400016c0:	fd042783          	lw	a5,-48(s0)
400016c4:	00e7a023          	sw	a4,0(a5)

    //print result to terminal
	if(operation == 0x1)
400016c8:	fdf44703          	lbu	a4,-33(s0)
400016cc:	00100793          	li	a5,1
400016d0:	00f71a63          	bne	a4,a5,400016e4 <aes_128_cipher+0x204>
		print("============================AES128 ENCRYPTTION==============================\r\n");
400016d4:	400037b7          	lui	a5,0x40003
400016d8:	96078513          	addi	a0,a5,-1696 # 40002960 <vga_simRes_h160_v120+0x20>
400016dc:	53c000ef          	jal	ra,40001c18 <print>
400016e0:	0100006f          	j	400016f0 <aes_128_cipher+0x210>
	else
		print("============================AES128 DECRYPTTION==============================\r\n");
400016e4:	400037b7          	lui	a5,0x40003
400016e8:	9b078513          	addi	a0,a5,-1616 # 400029b0 <vga_simRes_h160_v120+0x70>
400016ec:	52c000ef          	jal	ra,40001c18 <print>
	print128bit("\r\nPLAIN_TEXT (128-bit) : ", block);
400016f0:	fd442583          	lw	a1,-44(s0)
400016f4:	400037b7          	lui	a5,0x40003
400016f8:	a0078513          	addi	a0,a5,-1536 # 40002a00 <vga_simRes_h160_v120+0xc0>
400016fc:	7e8000ef          	jal	ra,40001ee4 <print128bit>
	print128bit("KEY (128-bit) : ", key);
40001700:	fd842583          	lw	a1,-40(s0)
40001704:	400037b7          	lui	a5,0x40003
40001708:	a1c78513          	addi	a0,a5,-1508 # 40002a1c <vga_simRes_h160_v120+0xdc>
4000170c:	7d8000ef          	jal	ra,40001ee4 <print128bit>
	print128bit("RESULT (128-bit) : ", res);
40001710:	fd042583          	lw	a1,-48(s0)
40001714:	400037b7          	lui	a5,0x40003
40001718:	a3078513          	addi	a0,a5,-1488 # 40002a30 <vga_simRes_h160_v120+0xf0>
4000171c:	7c8000ef          	jal	ra,40001ee4 <print128bit>
	print("\r\n============================================================================\r\n");
40001720:	400037b7          	lui	a5,0x40003
40001724:	a4478513          	addi	a0,a5,-1468 # 40002a44 <vga_simRes_h160_v120+0x104>
40001728:	4f0000ef          	jal	ra,40001c18 <print>
}
4000172c:	00000013          	nop
40001730:	02c12083          	lw	ra,44(sp)
40001734:	02812403          	lw	s0,40(sp)
40001738:	02412483          	lw	s1,36(sp)
4000173c:	03010113          	addi	sp,sp,48
40001740:	00008067          	ret

40001744 <aes_256_cipher>:

void aes_256_cipher(unsigned char operation, uint32_t *key, uint32_t *block, uint32_t *res) {
40001744:	fd010113          	addi	sp,sp,-48
40001748:	02112623          	sw	ra,44(sp)
4000174c:	02812423          	sw	s0,40(sp)
40001750:	02912223          	sw	s1,36(sp)
40001754:	03010413          	addi	s0,sp,48
40001758:	00050793          	mv	a5,a0
4000175c:	fcb42c23          	sw	a1,-40(s0)
40001760:	fcc42a23          	sw	a2,-44(s0)
40001764:	fcd42823          	sw	a3,-48(s0)
40001768:	fcf40fa3          	sb	a5,-33(s0)
	aes_write(key[7],AES_ADDR_KEY_BASE +7);
4000176c:	fd842783          	lw	a5,-40(s0)
40001770:	01c78793          	addi	a5,a5,28
40001774:	0007a783          	lw	a5,0(a5)
40001778:	01700593          	li	a1,23
4000177c:	00078513          	mv	a0,a5
40001780:	c85ff0ef          	jal	ra,40001404 <aes_write>
	aes_write(key[6],AES_ADDR_KEY_BASE +6);
40001784:	fd842783          	lw	a5,-40(s0)
40001788:	01878793          	addi	a5,a5,24
4000178c:	0007a783          	lw	a5,0(a5)
40001790:	01600593          	li	a1,22
40001794:	00078513          	mv	a0,a5
40001798:	c6dff0ef          	jal	ra,40001404 <aes_write>
	aes_write(key[5],AES_ADDR_KEY_BASE +5);
4000179c:	fd842783          	lw	a5,-40(s0)
400017a0:	01478793          	addi	a5,a5,20
400017a4:	0007a783          	lw	a5,0(a5)
400017a8:	01500593          	li	a1,21
400017ac:	00078513          	mv	a0,a5
400017b0:	c55ff0ef          	jal	ra,40001404 <aes_write>
	aes_write(key[4],AES_ADDR_KEY_BASE +4);
400017b4:	fd842783          	lw	a5,-40(s0)
400017b8:	01078793          	addi	a5,a5,16
400017bc:	0007a783          	lw	a5,0(a5)
400017c0:	01400593          	li	a1,20
400017c4:	00078513          	mv	a0,a5
400017c8:	c3dff0ef          	jal	ra,40001404 <aes_write>
	aes_write(key[3],AES_ADDR_KEY_BASE +3);
400017cc:	fd842783          	lw	a5,-40(s0)
400017d0:	00c78793          	addi	a5,a5,12
400017d4:	0007a783          	lw	a5,0(a5)
400017d8:	01300593          	li	a1,19
400017dc:	00078513          	mv	a0,a5
400017e0:	c25ff0ef          	jal	ra,40001404 <aes_write>
	aes_write(key[2],AES_ADDR_KEY_BASE +2);
400017e4:	fd842783          	lw	a5,-40(s0)
400017e8:	00878793          	addi	a5,a5,8
400017ec:	0007a783          	lw	a5,0(a5)
400017f0:	01200593          	li	a1,18
400017f4:	00078513          	mv	a0,a5
400017f8:	c0dff0ef          	jal	ra,40001404 <aes_write>
	aes_write(key[1],AES_ADDR_KEY_BASE +1);
400017fc:	fd842783          	lw	a5,-40(s0)
40001800:	00478793          	addi	a5,a5,4
40001804:	0007a783          	lw	a5,0(a5)
40001808:	01100593          	li	a1,17
4000180c:	00078513          	mv	a0,a5
40001810:	bf5ff0ef          	jal	ra,40001404 <aes_write>
	aes_write(key[0],AES_ADDR_KEY_BASE);
40001814:	fd842783          	lw	a5,-40(s0)
40001818:	0007a783          	lw	a5,0(a5)
4000181c:	01000593          	li	a1,16
40001820:	00078513          	mv	a0,a5
40001824:	be1ff0ef          	jal	ra,40001404 <aes_write>

	aes_write(AES_CONFIG_256_KEY,AES_ADDR_CONFIG);
40001828:	00a00593          	li	a1,10
4000182c:	00200513          	li	a0,2
40001830:	bd5ff0ef          	jal	ra,40001404 <aes_write>
	aes_write(AES_CTRL_INIT_KEY,AES_ADDR_CTRL);
40001834:	00800593          	li	a1,8
40001838:	00100513          	li	a0,1
4000183c:	bc9ff0ef          	jal	ra,40001404 <aes_write>

    while(aes_read(AES_ADDR_STATUS) == 0);
40001840:	00000013          	nop
40001844:	00900513          	li	a0,9
40001848:	c2dff0ef          	jal	ra,40001474 <aes_read>
4000184c:	00050793          	mv	a5,a0
40001850:	fe078ae3          	beqz	a5,40001844 <aes_256_cipher+0x100>

    aes_write(block[3],AES_ADDR_BLOCK_BASE + 3);
40001854:	fd442783          	lw	a5,-44(s0)
40001858:	00c78793          	addi	a5,a5,12
4000185c:	0007a783          	lw	a5,0(a5)
40001860:	02300593          	li	a1,35
40001864:	00078513          	mv	a0,a5
40001868:	b9dff0ef          	jal	ra,40001404 <aes_write>
    aes_write(block[2],AES_ADDR_BLOCK_BASE + 2);
4000186c:	fd442783          	lw	a5,-44(s0)
40001870:	00878793          	addi	a5,a5,8
40001874:	0007a783          	lw	a5,0(a5)
40001878:	02200593          	li	a1,34
4000187c:	00078513          	mv	a0,a5
40001880:	b85ff0ef          	jal	ra,40001404 <aes_write>
    aes_write(block[1],AES_ADDR_BLOCK_BASE + 1);
40001884:	fd442783          	lw	a5,-44(s0)
40001888:	00478793          	addi	a5,a5,4
4000188c:	0007a783          	lw	a5,0(a5)
40001890:	02100593          	li	a1,33
40001894:	00078513          	mv	a0,a5
40001898:	b6dff0ef          	jal	ra,40001404 <aes_write>
    aes_write(block[0],AES_ADDR_BLOCK_BASE + 0);
4000189c:	fd442783          	lw	a5,-44(s0)
400018a0:	0007a783          	lw	a5,0(a5)
400018a4:	02000593          	li	a1,32
400018a8:	00078513          	mv	a0,a5
400018ac:	b59ff0ef          	jal	ra,40001404 <aes_write>


    unsigned char AES_CONFIG = 0x00;
400018b0:	fe0407a3          	sb	zero,-17(s0)
	if (operation == 0x01)
400018b4:	fdf44703          	lbu	a4,-33(s0)
400018b8:	00100793          	li	a5,1
400018bc:	00f71863          	bne	a4,a5,400018cc <aes_256_cipher+0x188>
		AES_CONFIG = AES_CONFIG_256_EN;
400018c0:	00300793          	li	a5,3
400018c4:	fef407a3          	sb	a5,-17(s0)
400018c8:	00c0006f          	j	400018d4 <aes_256_cipher+0x190>
	else
		AES_CONFIG = AES_CONFIG_256_DE;
400018cc:	00200793          	li	a5,2
400018d0:	fef407a3          	sb	a5,-17(s0)

	aes_write(AES_CONFIG, AES_ADDR_CONFIG);
400018d4:	fef44783          	lbu	a5,-17(s0)
400018d8:	00a00593          	li	a1,10
400018dc:	00078513          	mv	a0,a5
400018e0:	b25ff0ef          	jal	ra,40001404 <aes_write>
    aes_write(AES_CTRL_START, AES_ADDR_CTRL);
400018e4:	00800593          	li	a1,8
400018e8:	00200513          	li	a0,2
400018ec:	b19ff0ef          	jal	ra,40001404 <aes_write>

    while(aes_read(AES_ADDR_STATUS) == 0);
400018f0:	00000013          	nop
400018f4:	00900513          	li	a0,9
400018f8:	b7dff0ef          	jal	ra,40001474 <aes_read>
400018fc:	00050793          	mv	a5,a0
40001900:	fe078ae3          	beqz	a5,400018f4 <aes_256_cipher+0x1b0>

    res[3] = aes_read(AES_ADDR_RESULT_BASE + 3);
40001904:	fd042783          	lw	a5,-48(s0)
40001908:	00c78493          	addi	s1,a5,12
4000190c:	03300513          	li	a0,51
40001910:	b65ff0ef          	jal	ra,40001474 <aes_read>
40001914:	00050793          	mv	a5,a0
40001918:	00f4a023          	sw	a5,0(s1)
    res[2] = aes_read(AES_ADDR_RESULT_BASE + 2);
4000191c:	fd042783          	lw	a5,-48(s0)
40001920:	00878493          	addi	s1,a5,8
40001924:	03200513          	li	a0,50
40001928:	b4dff0ef          	jal	ra,40001474 <aes_read>
4000192c:	00050793          	mv	a5,a0
40001930:	00f4a023          	sw	a5,0(s1)
    res[1] = aes_read(AES_ADDR_RESULT_BASE + 1);
40001934:	fd042783          	lw	a5,-48(s0)
40001938:	00478493          	addi	s1,a5,4
4000193c:	03100513          	li	a0,49
40001940:	b35ff0ef          	jal	ra,40001474 <aes_read>
40001944:	00050793          	mv	a5,a0
40001948:	00f4a023          	sw	a5,0(s1)
    res[0] = aes_read(AES_ADDR_RESULT_BASE + 0);
4000194c:	03000513          	li	a0,48
40001950:	b25ff0ef          	jal	ra,40001474 <aes_read>
40001954:	00050713          	mv	a4,a0
40001958:	fd042783          	lw	a5,-48(s0)
4000195c:	00e7a023          	sw	a4,0(a5)

    //print result to terminal
	if(operation == 0x1)
40001960:	fdf44703          	lbu	a4,-33(s0)
40001964:	00100793          	li	a5,1
40001968:	00f71a63          	bne	a4,a5,4000197c <aes_256_cipher+0x238>
		print("======================================AES256 ENCRYPTTION========================================\r\n");
4000196c:	400037b7          	lui	a5,0x40003
40001970:	a9878513          	addi	a0,a5,-1384 # 40002a98 <vga_simRes_h160_v120+0x158>
40001974:	2a4000ef          	jal	ra,40001c18 <print>
40001978:	0100006f          	j	40001988 <aes_256_cipher+0x244>
	else
		print("======================================AES256 DECRYPTTION========================================\r\n");
4000197c:	400037b7          	lui	a5,0x40003
40001980:	afc78513          	addi	a0,a5,-1284 # 40002afc <vga_simRes_h160_v120+0x1bc>
40001984:	294000ef          	jal	ra,40001c18 <print>
	print128bit("\r\nPLAIN_TEXT (128-bit) : ", block);
40001988:	fd442583          	lw	a1,-44(s0)
4000198c:	400037b7          	lui	a5,0x40003
40001990:	a0078513          	addi	a0,a5,-1536 # 40002a00 <vga_simRes_h160_v120+0xc0>
40001994:	550000ef          	jal	ra,40001ee4 <print128bit>
	print256bit("KEY (256-bit) : ", key);
40001998:	fd842583          	lw	a1,-40(s0)
4000199c:	400037b7          	lui	a5,0x40003
400019a0:	b6078513          	addi	a0,a5,-1184 # 40002b60 <vga_simRes_h160_v120+0x220>
400019a4:	644000ef          	jal	ra,40001fe8 <print256bit>
	print128bit("RESULT (128-bit) : ", res);
400019a8:	fd042583          	lw	a1,-48(s0)
400019ac:	400037b7          	lui	a5,0x40003
400019b0:	a3078513          	addi	a0,a5,-1488 # 40002a30 <vga_simRes_h160_v120+0xf0>
400019b4:	530000ef          	jal	ra,40001ee4 <print128bit>
	print("\r\n================================================================================================\r\n");
400019b8:	400037b7          	lui	a5,0x40003
400019bc:	b7478513          	addi	a0,a5,-1164 # 40002b74 <vga_simRes_h160_v120+0x234>
400019c0:	258000ef          	jal	ra,40001c18 <print>

}
400019c4:	00000013          	nop
400019c8:	02c12083          	lw	ra,44(sp)
400019cc:	02812403          	lw	s0,40(sp)
400019d0:	02412483          	lw	s1,36(sp)
400019d4:	03010113          	addi	sp,sp,48
400019d8:	00008067          	ret

400019dc <timer_init>:
static void timer_init(Timer_Reg *reg){
400019dc:	fe010113          	addi	sp,sp,-32
400019e0:	00812e23          	sw	s0,28(sp)
400019e4:	02010413          	addi	s0,sp,32
400019e8:	fea42623          	sw	a0,-20(s0)
	reg->CLEARS_TICKS  = 0;
400019ec:	fec42783          	lw	a5,-20(s0)
400019f0:	0007a023          	sw	zero,0(a5)
	reg->VALUE = 0;
400019f4:	fec42783          	lw	a5,-20(s0)
400019f8:	0007a423          	sw	zero,8(a5)
}
400019fc:	00000013          	nop
40001a00:	01c12403          	lw	s0,28(sp)
40001a04:	02010113          	addi	sp,sp,32
40001a08:	00008067          	ret

40001a0c <prescaler_init>:
static void prescaler_init(Prescaler_Reg* reg){
40001a0c:	fe010113          	addi	sp,sp,-32
40001a10:	00812e23          	sw	s0,28(sp)
40001a14:	02010413          	addi	s0,sp,32
40001a18:	fea42623          	sw	a0,-20(s0)
}
40001a1c:	00000013          	nop
40001a20:	01c12403          	lw	s0,28(sp)
40001a24:	02010113          	addi	sp,sp,32
40001a28:	00008067          	ret

40001a2c <interruptCtrl_init>:
static void interruptCtrl_init(InterruptCtrl_Reg* reg){
40001a2c:	fe010113          	addi	sp,sp,-32
40001a30:	00812e23          	sw	s0,28(sp)
40001a34:	02010413          	addi	s0,sp,32
40001a38:	fea42623          	sw	a0,-20(s0)
	reg->MASKS = 0;
40001a3c:	fec42783          	lw	a5,-20(s0)
40001a40:	0007a223          	sw	zero,4(a5)
	reg->PENDINGS = 0xFFFFFFFF;
40001a44:	fec42783          	lw	a5,-20(s0)
40001a48:	fff00713          	li	a4,-1
40001a4c:	00e7a023          	sw	a4,0(a5)
}
40001a50:	00000013          	nop
40001a54:	01c12403          	lw	s0,28(sp)
40001a58:	02010113          	addi	sp,sp,32
40001a5c:	00008067          	ret

40001a60 <uart_writeAvailability>:
static uint32_t uart_writeAvailability(Uart_Reg *reg){
40001a60:	fe010113          	addi	sp,sp,-32
40001a64:	00812e23          	sw	s0,28(sp)
40001a68:	02010413          	addi	s0,sp,32
40001a6c:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS >> 16) & 0xFF;
40001a70:	fec42783          	lw	a5,-20(s0)
40001a74:	0047a783          	lw	a5,4(a5)
40001a78:	0107d793          	srli	a5,a5,0x10
40001a7c:	0ff7f793          	zext.b	a5,a5
}
40001a80:	00078513          	mv	a0,a5
40001a84:	01c12403          	lw	s0,28(sp)
40001a88:	02010113          	addi	sp,sp,32
40001a8c:	00008067          	ret

40001a90 <uart_readOccupancy>:
static uint32_t uart_readOccupancy(Uart_Reg *reg){
40001a90:	fe010113          	addi	sp,sp,-32
40001a94:	00812e23          	sw	s0,28(sp)
40001a98:	02010413          	addi	s0,sp,32
40001a9c:	fea42623          	sw	a0,-20(s0)
	return reg->STATUS >> 24;
40001aa0:	fec42783          	lw	a5,-20(s0)
40001aa4:	0047a783          	lw	a5,4(a5)
40001aa8:	0187d793          	srli	a5,a5,0x18
}
40001aac:	00078513          	mv	a0,a5
40001ab0:	01c12403          	lw	s0,28(sp)
40001ab4:	02010113          	addi	sp,sp,32
40001ab8:	00008067          	ret

40001abc <uart_write>:
static void uart_write(Uart_Reg *reg, uint32_t data){
40001abc:	fe010113          	addi	sp,sp,-32
40001ac0:	00112e23          	sw	ra,28(sp)
40001ac4:	00812c23          	sw	s0,24(sp)
40001ac8:	02010413          	addi	s0,sp,32
40001acc:	fea42623          	sw	a0,-20(s0)
40001ad0:	feb42423          	sw	a1,-24(s0)
	while(uart_writeAvailability(reg) == 0);
40001ad4:	00000013          	nop
40001ad8:	fec42503          	lw	a0,-20(s0)
40001adc:	f85ff0ef          	jal	ra,40001a60 <uart_writeAvailability>
40001ae0:	00050793          	mv	a5,a0
40001ae4:	fe078ae3          	beqz	a5,40001ad8 <uart_write+0x1c>
	reg->DATA = data;
40001ae8:	fec42783          	lw	a5,-20(s0)
40001aec:	fe842703          	lw	a4,-24(s0)
40001af0:	00e7a023          	sw	a4,0(a5)
}
40001af4:	00000013          	nop
40001af8:	01c12083          	lw	ra,28(sp)
40001afc:	01812403          	lw	s0,24(sp)
40001b00:	02010113          	addi	sp,sp,32
40001b04:	00008067          	ret

40001b08 <uart_applyConfig>:
static void uart_applyConfig(Uart_Reg *reg, Uart_Config *config){
40001b08:	fe010113          	addi	sp,sp,-32
40001b0c:	00812e23          	sw	s0,28(sp)
40001b10:	02010413          	addi	s0,sp,32
40001b14:	fea42623          	sw	a0,-20(s0)
40001b18:	feb42423          	sw	a1,-24(s0)
	reg->CLOCK_DIVIDER = config->clockDivider;
40001b1c:	fe842783          	lw	a5,-24(s0)
40001b20:	00c7a703          	lw	a4,12(a5)
40001b24:	fec42783          	lw	a5,-20(s0)
40001b28:	00e7a423          	sw	a4,8(a5)
	reg->FRAME_CONFIG = ((config->dataLength-1) << 0) | (config->parity << 8) | (config->stop << 16);
40001b2c:	fe842783          	lw	a5,-24(s0)
40001b30:	0007a783          	lw	a5,0(a5)
40001b34:	fff78713          	addi	a4,a5,-1
40001b38:	fe842783          	lw	a5,-24(s0)
40001b3c:	0047a783          	lw	a5,4(a5)
40001b40:	00879793          	slli	a5,a5,0x8
40001b44:	00f76733          	or	a4,a4,a5
40001b48:	fe842783          	lw	a5,-24(s0)
40001b4c:	0087a783          	lw	a5,8(a5)
40001b50:	01079793          	slli	a5,a5,0x10
40001b54:	00f76733          	or	a4,a4,a5
40001b58:	fec42783          	lw	a5,-20(s0)
40001b5c:	00e7a623          	sw	a4,12(a5)
}
40001b60:	00000013          	nop
40001b64:	01c12403          	lw	s0,28(sp)
40001b68:	02010113          	addi	sp,sp,32
40001b6c:	00008067          	ret

40001b70 <vga_isBusy>:
static uint32_t vga_isBusy(Vga_Reg *reg){
40001b70:	fe010113          	addi	sp,sp,-32
40001b74:	00812e23          	sw	s0,28(sp)
40001b78:	02010413          	addi	s0,sp,32
40001b7c:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS & 2) != 0;
40001b80:	fec42783          	lw	a5,-20(s0)
40001b84:	0007a783          	lw	a5,0(a5)
40001b88:	0027f793          	andi	a5,a5,2
40001b8c:	00f037b3          	snez	a5,a5
40001b90:	0ff7f793          	zext.b	a5,a5
}
40001b94:	00078513          	mv	a0,a5
40001b98:	01c12403          	lw	s0,28(sp)
40001b9c:	02010113          	addi	sp,sp,32
40001ba0:	00008067          	ret

40001ba4 <vga_run>:
static void vga_run(Vga_Reg *reg){
40001ba4:	fe010113          	addi	sp,sp,-32
40001ba8:	00812e23          	sw	s0,28(sp)
40001bac:	02010413          	addi	s0,sp,32
40001bb0:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 1;
40001bb4:	fec42783          	lw	a5,-20(s0)
40001bb8:	00100713          	li	a4,1
40001bbc:	00e7a023          	sw	a4,0(a5)
}
40001bc0:	00000013          	nop
40001bc4:	01c12403          	lw	s0,28(sp)
40001bc8:	02010113          	addi	sp,sp,32
40001bcc:	00008067          	ret

40001bd0 <vga_stop>:
static void vga_stop(Vga_Reg *reg){
40001bd0:	fe010113          	addi	sp,sp,-32
40001bd4:	00112e23          	sw	ra,28(sp)
40001bd8:	00812c23          	sw	s0,24(sp)
40001bdc:	02010413          	addi	s0,sp,32
40001be0:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 0;
40001be4:	fec42783          	lw	a5,-20(s0)
40001be8:	0007a023          	sw	zero,0(a5)
	while(vga_isBusy(reg));
40001bec:	00000013          	nop
40001bf0:	fec42503          	lw	a0,-20(s0)
40001bf4:	f7dff0ef          	jal	ra,40001b70 <vga_isBusy>
40001bf8:	00050793          	mv	a5,a0
40001bfc:	fe079ae3          	bnez	a5,40001bf0 <vga_stop+0x20>
}
40001c00:	00000013          	nop
40001c04:	00000013          	nop
40001c08:	01c12083          	lw	ra,28(sp)
40001c0c:	01812403          	lw	s0,24(sp)
40001c10:	02010113          	addi	sp,sp,32
40001c14:	00008067          	ret

40001c18 <print>:
#include <briey.h>

void print(char *str){
40001c18:	fe010113          	addi	sp,sp,-32
40001c1c:	00112e23          	sw	ra,28(sp)
40001c20:	00812c23          	sw	s0,24(sp)
40001c24:	02010413          	addi	s0,sp,32
40001c28:	fea42623          	sw	a0,-20(s0)
	while(*str){
40001c2c:	0200006f          	j	40001c4c <print+0x34>
		uart_write(UART,*(str++));
40001c30:	fec42783          	lw	a5,-20(s0)
40001c34:	00178713          	addi	a4,a5,1
40001c38:	fee42623          	sw	a4,-20(s0)
40001c3c:	0007c783          	lbu	a5,0(a5)
40001c40:	00078593          	mv	a1,a5
40001c44:	f0010537          	lui	a0,0xf0010
40001c48:	e75ff0ef          	jal	ra,40001abc <uart_write>
	while(*str){
40001c4c:	fec42783          	lw	a5,-20(s0)
40001c50:	0007c783          	lbu	a5,0(a5)
40001c54:	fc079ee3          	bnez	a5,40001c30 <print+0x18>
	}
}
40001c58:	00000013          	nop
40001c5c:	00000013          	nop
40001c60:	01c12083          	lw	ra,28(sp)
40001c64:	01812403          	lw	s0,24(sp)
40001c68:	02010113          	addi	sp,sp,32
40001c6c:	00008067          	ret

40001c70 <print16bit>:

void print16bit(uint32_t n)
{
40001c70:	fc010113          	addi	sp,sp,-64
40001c74:	02112e23          	sw	ra,60(sp)
40001c78:	02812c23          	sw	s0,56(sp)
40001c7c:	04010413          	addi	s0,sp,64
40001c80:	fca42623          	sw	a0,-52(s0)

    int i = 0;
40001c84:	fe042623          	sw	zero,-20(s0)
    char outbuf_inv[8]="";
40001c88:	fc042e23          	sw	zero,-36(s0)
40001c8c:	fe042023          	sw	zero,-32(s0)
    do{
    	outbuf_inv[i] = "0123456789abcdef"[n % 16];
40001c90:	fcc42783          	lw	a5,-52(s0)
40001c94:	00f7f793          	andi	a5,a5,15
40001c98:	40003737          	lui	a4,0x40003
40001c9c:	c4070713          	addi	a4,a4,-960 # 40002c40 <vga_simRes_h160_v120+0x24>
40001ca0:	00f707b3          	add	a5,a4,a5
40001ca4:	0007c703          	lbu	a4,0(a5)
40001ca8:	fec42783          	lw	a5,-20(s0)
40001cac:	ff040693          	addi	a3,s0,-16
40001cb0:	00f687b3          	add	a5,a3,a5
40001cb4:	fee78623          	sb	a4,-20(a5)
        i++;
40001cb8:	fec42783          	lw	a5,-20(s0)
40001cbc:	00178793          	addi	a5,a5,1
40001cc0:	fef42623          	sw	a5,-20(s0)
        n = n/16;
40001cc4:	fcc42783          	lw	a5,-52(s0)
40001cc8:	0047d793          	srli	a5,a5,0x4
40001ccc:	fcf42623          	sw	a5,-52(s0)
    }while( n > 0);
40001cd0:	fcc42783          	lw	a5,-52(s0)
40001cd4:	fa079ee3          	bnez	a5,40001c90 <print16bit+0x20>
    if(i<8) {
40001cd8:	fec42703          	lw	a4,-20(s0)
40001cdc:	00700793          	li	a5,7
40001ce0:	02e7ce63          	blt	a5,a4,40001d1c <print16bit+0xac>
    	for(int j=7;j>=i;j--){
40001ce4:	00700793          	li	a5,7
40001ce8:	fef42423          	sw	a5,-24(s0)
40001cec:	0240006f          	j	40001d10 <print16bit+0xa0>
    		outbuf_inv[j]="0"[0];
40001cf0:	03000713          	li	a4,48
40001cf4:	fe842783          	lw	a5,-24(s0)
40001cf8:	ff040693          	addi	a3,s0,-16
40001cfc:	00f687b3          	add	a5,a3,a5
40001d00:	fee78623          	sb	a4,-20(a5)
    	for(int j=7;j>=i;j--){
40001d04:	fe842783          	lw	a5,-24(s0)
40001d08:	fff78793          	addi	a5,a5,-1
40001d0c:	fef42423          	sw	a5,-24(s0)
40001d10:	fe842703          	lw	a4,-24(s0)
40001d14:	fec42783          	lw	a5,-20(s0)
40001d18:	fcf75ce3          	bge	a4,a5,40001cf0 <print16bit+0x80>
    	}
    }
    for(int j=3;j>=0;j--)
40001d1c:	00300793          	li	a5,3
40001d20:	fef42223          	sw	a5,-28(s0)
40001d24:	02c0006f          	j	40001d50 <print16bit+0xe0>
    {
    	uart_write(UART,outbuf_inv[j]);
40001d28:	fe442783          	lw	a5,-28(s0)
40001d2c:	ff040713          	addi	a4,s0,-16
40001d30:	00f707b3          	add	a5,a4,a5
40001d34:	fec7c783          	lbu	a5,-20(a5)
40001d38:	00078593          	mv	a1,a5
40001d3c:	f0010537          	lui	a0,0xf0010
40001d40:	d7dff0ef          	jal	ra,40001abc <uart_write>
    for(int j=3;j>=0;j--)
40001d44:	fe442783          	lw	a5,-28(s0)
40001d48:	fff78793          	addi	a5,a5,-1
40001d4c:	fef42223          	sw	a5,-28(s0)
40001d50:	fe442783          	lw	a5,-28(s0)
40001d54:	fc07dae3          	bgez	a5,40001d28 <print16bit+0xb8>
    }
    print(" ");
40001d58:	400037b7          	lui	a5,0x40003
40001d5c:	c3c78513          	addi	a0,a5,-964 # 40002c3c <vga_simRes_h160_v120+0x20>
40001d60:	eb9ff0ef          	jal	ra,40001c18 <print>
}
40001d64:	00000013          	nop
40001d68:	03c12083          	lw	ra,60(sp)
40001d6c:	03812403          	lw	s0,56(sp)
40001d70:	04010113          	addi	sp,sp,64
40001d74:	00008067          	ret

40001d78 <print32bit>:
void print32bit(uint32_t n)
{
40001d78:	fc010113          	addi	sp,sp,-64
40001d7c:	02112e23          	sw	ra,60(sp)
40001d80:	02812c23          	sw	s0,56(sp)
40001d84:	04010413          	addi	s0,sp,64
40001d88:	fca42623          	sw	a0,-52(s0)

    int i = 0;
40001d8c:	fe042623          	sw	zero,-20(s0)
    char outbuf_inv[8]="";
40001d90:	fc042e23          	sw	zero,-36(s0)
40001d94:	fe042023          	sw	zero,-32(s0)
    do{
    	outbuf_inv[i] = "0123456789abcdef"[n % 16];
40001d98:	fcc42783          	lw	a5,-52(s0)
40001d9c:	00f7f793          	andi	a5,a5,15
40001da0:	40003737          	lui	a4,0x40003
40001da4:	c4070713          	addi	a4,a4,-960 # 40002c40 <vga_simRes_h160_v120+0x24>
40001da8:	00f707b3          	add	a5,a4,a5
40001dac:	0007c703          	lbu	a4,0(a5)
40001db0:	fec42783          	lw	a5,-20(s0)
40001db4:	ff040693          	addi	a3,s0,-16
40001db8:	00f687b3          	add	a5,a3,a5
40001dbc:	fee78623          	sb	a4,-20(a5)
        i++;
40001dc0:	fec42783          	lw	a5,-20(s0)
40001dc4:	00178793          	addi	a5,a5,1
40001dc8:	fef42623          	sw	a5,-20(s0)
        n = n/16;
40001dcc:	fcc42783          	lw	a5,-52(s0)
40001dd0:	0047d793          	srli	a5,a5,0x4
40001dd4:	fcf42623          	sw	a5,-52(s0)
    }while( n > 0);
40001dd8:	fcc42783          	lw	a5,-52(s0)
40001ddc:	fa079ee3          	bnez	a5,40001d98 <print32bit+0x20>
    if(i<8) {
40001de0:	fec42703          	lw	a4,-20(s0)
40001de4:	00700793          	li	a5,7
40001de8:	02e7ce63          	blt	a5,a4,40001e24 <print32bit+0xac>
    	for(int j=7;j>=i;j--){
40001dec:	00700793          	li	a5,7
40001df0:	fef42423          	sw	a5,-24(s0)
40001df4:	0240006f          	j	40001e18 <print32bit+0xa0>
    		outbuf_inv[j]="0"[0];
40001df8:	03000713          	li	a4,48
40001dfc:	fe842783          	lw	a5,-24(s0)
40001e00:	ff040693          	addi	a3,s0,-16
40001e04:	00f687b3          	add	a5,a3,a5
40001e08:	fee78623          	sb	a4,-20(a5)
    	for(int j=7;j>=i;j--){
40001e0c:	fe842783          	lw	a5,-24(s0)
40001e10:	fff78793          	addi	a5,a5,-1
40001e14:	fef42423          	sw	a5,-24(s0)
40001e18:	fe842703          	lw	a4,-24(s0)
40001e1c:	fec42783          	lw	a5,-20(s0)
40001e20:	fcf75ce3          	bge	a4,a5,40001df8 <print32bit+0x80>
    	}
    }
    for(int j=7;j>=0;j--)
40001e24:	00700793          	li	a5,7
40001e28:	fef42223          	sw	a5,-28(s0)
40001e2c:	02c0006f          	j	40001e58 <print32bit+0xe0>
    {
    	uart_write(UART,outbuf_inv[j]);
40001e30:	fe442783          	lw	a5,-28(s0)
40001e34:	ff040713          	addi	a4,s0,-16
40001e38:	00f707b3          	add	a5,a4,a5
40001e3c:	fec7c783          	lbu	a5,-20(a5)
40001e40:	00078593          	mv	a1,a5
40001e44:	f0010537          	lui	a0,0xf0010
40001e48:	c75ff0ef          	jal	ra,40001abc <uart_write>
    for(int j=7;j>=0;j--)
40001e4c:	fe442783          	lw	a5,-28(s0)
40001e50:	fff78793          	addi	a5,a5,-1
40001e54:	fef42223          	sw	a5,-28(s0)
40001e58:	fe442783          	lw	a5,-28(s0)
40001e5c:	fc07dae3          	bgez	a5,40001e30 <print32bit+0xb8>
    }
    print(" ");
40001e60:	400037b7          	lui	a5,0x40003
40001e64:	c3c78513          	addi	a0,a5,-964 # 40002c3c <vga_simRes_h160_v120+0x20>
40001e68:	db1ff0ef          	jal	ra,40001c18 <print>
}
40001e6c:	00000013          	nop
40001e70:	03c12083          	lw	ra,60(sp)
40001e74:	03812403          	lw	s0,56(sp)
40001e78:	04010113          	addi	sp,sp,64
40001e7c:	00008067          	ret

40001e80 <print64bit>:

void print64bit(char *message,uint32_t *num)
{
40001e80:	fe010113          	addi	sp,sp,-32
40001e84:	00112e23          	sw	ra,28(sp)
40001e88:	00812c23          	sw	s0,24(sp)
40001e8c:	02010413          	addi	s0,sp,32
40001e90:	fea42623          	sw	a0,-20(s0)
40001e94:	feb42423          	sw	a1,-24(s0)
	print(message);
40001e98:	fec42503          	lw	a0,-20(s0)
40001e9c:	d7dff0ef          	jal	ra,40001c18 <print>
	print32bit(num[1]);
40001ea0:	fe842783          	lw	a5,-24(s0)
40001ea4:	00478793          	addi	a5,a5,4
40001ea8:	0007a783          	lw	a5,0(a5)
40001eac:	00078513          	mv	a0,a5
40001eb0:	ec9ff0ef          	jal	ra,40001d78 <print32bit>
	print32bit(num[0]);
40001eb4:	fe842783          	lw	a5,-24(s0)
40001eb8:	0007a783          	lw	a5,0(a5)
40001ebc:	00078513          	mv	a0,a5
40001ec0:	eb9ff0ef          	jal	ra,40001d78 <print32bit>
	print("\r\n");
40001ec4:	400037b7          	lui	a5,0x40003
40001ec8:	c5478513          	addi	a0,a5,-940 # 40002c54 <vga_simRes_h160_v120+0x38>
40001ecc:	d4dff0ef          	jal	ra,40001c18 <print>
}
40001ed0:	00000013          	nop
40001ed4:	01c12083          	lw	ra,28(sp)
40001ed8:	01812403          	lw	s0,24(sp)
40001edc:	02010113          	addi	sp,sp,32
40001ee0:	00008067          	ret

40001ee4 <print128bit>:
void print128bit(char *message, uint32_t *num)
{
40001ee4:	fe010113          	addi	sp,sp,-32
40001ee8:	00112e23          	sw	ra,28(sp)
40001eec:	00812c23          	sw	s0,24(sp)
40001ef0:	02010413          	addi	s0,sp,32
40001ef4:	fea42623          	sw	a0,-20(s0)
40001ef8:	feb42423          	sw	a1,-24(s0)
	print(message);
40001efc:	fec42503          	lw	a0,-20(s0)
40001f00:	d19ff0ef          	jal	ra,40001c18 <print>
	print32bit(num[3]);
40001f04:	fe842783          	lw	a5,-24(s0)
40001f08:	00c78793          	addi	a5,a5,12
40001f0c:	0007a783          	lw	a5,0(a5)
40001f10:	00078513          	mv	a0,a5
40001f14:	e65ff0ef          	jal	ra,40001d78 <print32bit>
	print32bit(num[2]);
40001f18:	fe842783          	lw	a5,-24(s0)
40001f1c:	00878793          	addi	a5,a5,8
40001f20:	0007a783          	lw	a5,0(a5)
40001f24:	00078513          	mv	a0,a5
40001f28:	e51ff0ef          	jal	ra,40001d78 <print32bit>
	print32bit(num[1]);
40001f2c:	fe842783          	lw	a5,-24(s0)
40001f30:	00478793          	addi	a5,a5,4
40001f34:	0007a783          	lw	a5,0(a5)
40001f38:	00078513          	mv	a0,a5
40001f3c:	e3dff0ef          	jal	ra,40001d78 <print32bit>
	print32bit(num[0]);
40001f40:	fe842783          	lw	a5,-24(s0)
40001f44:	0007a783          	lw	a5,0(a5)
40001f48:	00078513          	mv	a0,a5
40001f4c:	e2dff0ef          	jal	ra,40001d78 <print32bit>
	print("\r\n");
40001f50:	400037b7          	lui	a5,0x40003
40001f54:	c5478513          	addi	a0,a5,-940 # 40002c54 <vga_simRes_h160_v120+0x38>
40001f58:	cc1ff0ef          	jal	ra,40001c18 <print>
}
40001f5c:	00000013          	nop
40001f60:	01c12083          	lw	ra,28(sp)
40001f64:	01812403          	lw	s0,24(sp)
40001f68:	02010113          	addi	sp,sp,32
40001f6c:	00008067          	ret

40001f70 <print80bit>:
void print80bit(char *message,uint32_t *num)
{
40001f70:	fe010113          	addi	sp,sp,-32
40001f74:	00112e23          	sw	ra,28(sp)
40001f78:	00812c23          	sw	s0,24(sp)
40001f7c:	02010413          	addi	s0,sp,32
40001f80:	fea42623          	sw	a0,-20(s0)
40001f84:	feb42423          	sw	a1,-24(s0)
	print(message);
40001f88:	fec42503          	lw	a0,-20(s0)
40001f8c:	c8dff0ef          	jal	ra,40001c18 <print>
	print32bit(num[2]);
40001f90:	fe842783          	lw	a5,-24(s0)
40001f94:	00878793          	addi	a5,a5,8
40001f98:	0007a783          	lw	a5,0(a5)
40001f9c:	00078513          	mv	a0,a5
40001fa0:	dd9ff0ef          	jal	ra,40001d78 <print32bit>
	print32bit(num[1]);
40001fa4:	fe842783          	lw	a5,-24(s0)
40001fa8:	00478793          	addi	a5,a5,4
40001fac:	0007a783          	lw	a5,0(a5)
40001fb0:	00078513          	mv	a0,a5
40001fb4:	dc5ff0ef          	jal	ra,40001d78 <print32bit>
	print16bit(num[0]);
40001fb8:	fe842783          	lw	a5,-24(s0)
40001fbc:	0007a783          	lw	a5,0(a5)
40001fc0:	00078513          	mv	a0,a5
40001fc4:	cadff0ef          	jal	ra,40001c70 <print16bit>
	print("\r\n");
40001fc8:	400037b7          	lui	a5,0x40003
40001fcc:	c5478513          	addi	a0,a5,-940 # 40002c54 <vga_simRes_h160_v120+0x38>
40001fd0:	c49ff0ef          	jal	ra,40001c18 <print>
}
40001fd4:	00000013          	nop
40001fd8:	01c12083          	lw	ra,28(sp)
40001fdc:	01812403          	lw	s0,24(sp)
40001fe0:	02010113          	addi	sp,sp,32
40001fe4:	00008067          	ret

40001fe8 <print256bit>:
void print256bit(char *message, uint32_t *num)
{
40001fe8:	fe010113          	addi	sp,sp,-32
40001fec:	00112e23          	sw	ra,28(sp)
40001ff0:	00812c23          	sw	s0,24(sp)
40001ff4:	02010413          	addi	s0,sp,32
40001ff8:	fea42623          	sw	a0,-20(s0)
40001ffc:	feb42423          	sw	a1,-24(s0)
	print(message);
40002000:	fec42503          	lw	a0,-20(s0)
40002004:	c15ff0ef          	jal	ra,40001c18 <print>
	print32bit(num[7]);
40002008:	fe842783          	lw	a5,-24(s0)
4000200c:	01c78793          	addi	a5,a5,28
40002010:	0007a783          	lw	a5,0(a5)
40002014:	00078513          	mv	a0,a5
40002018:	d61ff0ef          	jal	ra,40001d78 <print32bit>
	print32bit(num[6]);
4000201c:	fe842783          	lw	a5,-24(s0)
40002020:	01878793          	addi	a5,a5,24
40002024:	0007a783          	lw	a5,0(a5)
40002028:	00078513          	mv	a0,a5
4000202c:	d4dff0ef          	jal	ra,40001d78 <print32bit>
	print32bit(num[5]);
40002030:	fe842783          	lw	a5,-24(s0)
40002034:	01478793          	addi	a5,a5,20
40002038:	0007a783          	lw	a5,0(a5)
4000203c:	00078513          	mv	a0,a5
40002040:	d39ff0ef          	jal	ra,40001d78 <print32bit>
	print32bit(num[4]);
40002044:	fe842783          	lw	a5,-24(s0)
40002048:	01078793          	addi	a5,a5,16
4000204c:	0007a783          	lw	a5,0(a5)
40002050:	00078513          	mv	a0,a5
40002054:	d25ff0ef          	jal	ra,40001d78 <print32bit>
	print32bit(num[3]);
40002058:	fe842783          	lw	a5,-24(s0)
4000205c:	00c78793          	addi	a5,a5,12
40002060:	0007a783          	lw	a5,0(a5)
40002064:	00078513          	mv	a0,a5
40002068:	d11ff0ef          	jal	ra,40001d78 <print32bit>
	print32bit(num[2]);
4000206c:	fe842783          	lw	a5,-24(s0)
40002070:	00878793          	addi	a5,a5,8
40002074:	0007a783          	lw	a5,0(a5)
40002078:	00078513          	mv	a0,a5
4000207c:	cfdff0ef          	jal	ra,40001d78 <print32bit>
	print32bit(num[1]);
40002080:	fe842783          	lw	a5,-24(s0)
40002084:	00478793          	addi	a5,a5,4
40002088:	0007a783          	lw	a5,0(a5)
4000208c:	00078513          	mv	a0,a5
40002090:	ce9ff0ef          	jal	ra,40001d78 <print32bit>
	print32bit(num[0]);
40002094:	fe842783          	lw	a5,-24(s0)
40002098:	0007a783          	lw	a5,0(a5)
4000209c:	00078513          	mv	a0,a5
400020a0:	cd9ff0ef          	jal	ra,40001d78 <print32bit>
	print("\r\n");
400020a4:	400037b7          	lui	a5,0x40003
400020a8:	c5478513          	addi	a0,a5,-940 # 40002c54 <vga_simRes_h160_v120+0x38>
400020ac:	b6dff0ef          	jal	ra,40001c18 <print>
}
400020b0:	00000013          	nop
400020b4:	01c12083          	lw	ra,28(sp)
400020b8:	01812403          	lw	s0,24(sp)
400020bc:	02010113          	addi	sp,sp,32
400020c0:	00008067          	ret
