
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
80000068:	e3c080e7          	jalr	-452(ra) # 40000ea0 <irqCallback>
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
800000b8:	5a418193          	addi	gp,gp,1444 # 40003658 <__global_pointer$>
  .option pop
  la sp, _stack_start
800000bc:	00001117          	auipc	sp,0x1
800000c0:	88410113          	addi	sp,sp,-1916 # 80000940 <_stack_start>

800000c4 <bss_init>:

bss_init:
  la a0, _bss_start
800000c4:	c0003517          	auipc	a0,0xc0003
800000c8:	d9450513          	addi	a0,a0,-620 # 40002e58 <_bss_end>
  la a1, _bss_end
800000cc:	c0003597          	auipc	a1,0xc0003
800000d0:	d8c58593          	addi	a1,a1,-628 # 40002e58 <_bss_end>

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
800000e8:	d7050513          	addi	a0,a0,-656 # 40002e54 <_ctors_end>
  addi sp,sp,-4
800000ec:	ffc10113          	addi	sp,sp,-4

800000f0 <ctors_loop>:
ctors_loop:
  la a1, _ctors_end
800000f0:	c0003597          	auipc	a1,0xc0003
800000f4:	d6458593          	addi	a1,a1,-668 # 40002e54 <_ctors_end>
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
40000404:	2cc78513          	addi	a0,a5,716 # 400022cc <vga_simRes_h160_v120+0x20>
40000408:	1b9010ef          	jal	ra,40001dc0 <print>
4000040c:	0100006f          	j	4000041c <prince_cipher+0x12c>
		else
			print("=============================PRINCE DECRYPTTION=============================\r\n");
40000410:	400027b7          	lui	a5,0x40002
40000414:	31c78513          	addi	a0,a5,796 # 4000231c <vga_simRes_h160_v120+0x70>
40000418:	1a9010ef          	jal	ra,40001dc0 <print>
		print("\r\n");
4000041c:	400027b7          	lui	a5,0x40002
40000420:	36c78513          	addi	a0,a5,876 # 4000236c <vga_simRes_h160_v120+0xc0>
40000424:	19d010ef          	jal	ra,40001dc0 <print>
		print64bit("PLAIN_TEXT (64-bit) : ", block);
40000428:	fe442583          	lw	a1,-28(s0)
4000042c:	400027b7          	lui	a5,0x40002
40000430:	37078513          	addi	a0,a5,880 # 40002370 <vga_simRes_h160_v120+0xc4>
40000434:	3f5010ef          	jal	ra,40002028 <print64bit>
		print128bit("KEY (128-bit) : ", key);
40000438:	fe842583          	lw	a1,-24(s0)
4000043c:	400027b7          	lui	a5,0x40002
40000440:	38878513          	addi	a0,a5,904 # 40002388 <vga_simRes_h160_v120+0xdc>
40000444:	449010ef          	jal	ra,4000208c <print128bit>
		print64bit("RESULT (64-bit) : ", res);
40000448:	fe042583          	lw	a1,-32(s0)
4000044c:	400027b7          	lui	a5,0x40002
40000450:	39c78513          	addi	a0,a5,924 # 4000239c <vga_simRes_h160_v120+0xf0>
40000454:	3d5010ef          	jal	ra,40002028 <print64bit>
		print("\r\n============================================================================\r\n");
40000458:	400027b7          	lui	a5,0x40002
4000045c:	3b078513          	addi	a0,a5,944 # 400023b0 <vga_simRes_h160_v120+0x104>
40000460:	161010ef          	jal	ra,40001dc0 <print>

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
400006b8:	f5010113          	addi	sp,sp,-176
400006bc:	0a112623          	sw	ra,172(sp)
400006c0:	0a812423          	sw	s0,168(sp)
400006c4:	0b010413          	addi	s0,sp,176
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
400006f4:	46478513          	addi	a0,a5,1124 # 40002464 <vga_simRes_h160_v120+0x20>
400006f8:	6c8010ef          	jal	ra,40001dc0 <print>
	print("===============================PRINCE TEST==================================\r\n");
400006fc:	400027b7          	lui	a5,0x40002
40000700:	4b478513          	addi	a0,a5,1204 # 400024b4 <vga_simRes_h160_v120+0x70>
40000704:	6bc010ef          	jal	ra,40001dc0 <print>
	print("=========================LE DUY LINH - 18200157-============================\r\n");
40000708:	400027b7          	lui	a5,0x40002
4000070c:	50478513          	addi	a0,a5,1284 # 40002504 <vga_simRes_h160_v120+0xc0>
40000710:	6b0010ef          	jal	ra,40001dc0 <print>
	print("============================================================================\r\n");
40000714:	400027b7          	lui	a5,0x40002
40000718:	46478513          	addi	a0,a5,1124 # 40002464 <vga_simRes_h160_v120+0x20>
4000071c:	6a4010ef          	jal	ra,40001dc0 <print>
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
40000744:	55478513          	addi	a0,a5,1364 # 40002554 <vga_simRes_h160_v120+0x110>
40000748:	678010ef          	jal	ra,40001dc0 <print>

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
40000774:	67778793          	addi	a5,a5,1655 # 44556677 <__global_pointer$+0x455301f>
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
400007b4:	5a878513          	addi	a0,a5,1448 # 400025a8 <vga_simRes_h160_v120+0x164>
400007b8:	608010ef          	jal	ra,40001dc0 <print>

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
400007f4:	5fc78513          	addi	a0,a5,1532 # 400025fc <vga_simRes_h160_v120+0x1b8>
400007f8:	5c8010ef          	jal	ra,40001dc0 <print>

	prince_block[1] 	= 0x69c4e0d8;
400007fc:	69c4e7b7          	lui	a5,0x69c4e
40000800:	0d878793          	addi	a5,a5,216 # 69c4e0d8 <__global_pointer$+0x29c4aa80>
40000804:	fcf42623          	sw	a5,-52(s0)
	prince_block[0] 	= 0x6a7b0430;
40000808:	6a7b07b7          	lui	a5,0x6a7b0
4000080c:	43078793          	addi	a5,a5,1072 # 6a7b0430 <__global_pointer$+0x2a7acdd8>
40000810:	fcf42423          	sw	a5,-56(s0)

	prince_key[3]		= 0xd8cdb780;
40000814:	d8cdb7b7          	lui	a5,0xd8cdb
40000818:	78078793          	addi	a5,a5,1920 # d8cdb780 <_stack_start+0x58cdae40>
4000081c:	fcf42e23          	sw	a5,-36(s0)
	prince_key[2]		= 0x70b4c55a;
40000820:	70b4c7b7          	lui	a5,0x70b4c
40000824:	55a78793          	addi	a5,a5,1370 # 70b4c55a <__global_pointer$+0x30b48f02>
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
40000864:	65078513          	addi	a0,a5,1616 # 40002650 <vga_simRes_h160_v120+0x20c>
40000868:	558010ef          	jal	ra,40001dc0 <print>

	prince_block[1] 	= 0x43c6b256;
4000086c:	43c6b7b7          	lui	a5,0x43c6b
40000870:	25678793          	addi	a5,a5,598 # 43c6b256 <__global_pointer$+0x3c67bfe>
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
40000894:	55a78793          	addi	a5,a5,1370 # 70b4c55a <__global_pointer$+0x30b48f02>
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
400008d4:	46478513          	addi	a0,a5,1124 # 40002464 <vga_simRes_h160_v120+0x20>
400008d8:	4e8010ef          	jal	ra,40001dc0 <print>
	print("===============================AES TEST=====================================\r\n");
400008dc:	400027b7          	lui	a5,0x40002
400008e0:	6a478513          	addi	a0,a5,1700 # 400026a4 <vga_simRes_h160_v120+0x260>
400008e4:	4dc010ef          	jal	ra,40001dc0 <print>
	print("=========================LE DUY LINH - 18200157-============================\r\n");
400008e8:	400027b7          	lui	a5,0x40002
400008ec:	50478513          	addi	a0,a5,1284 # 40002504 <vga_simRes_h160_v120+0xc0>
400008f0:	4d0010ef          	jal	ra,40001dc0 <print>
	print("============================================================================\r\n");
400008f4:	400027b7          	lui	a5,0x40002
400008f8:	46478513          	addi	a0,a5,1124 # 40002464 <vga_simRes_h160_v120+0x20>
400008fc:	4c4010ef          	jal	ra,40001dc0 <print>
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
40000934:	6f478513          	addi	a0,a5,1780 # 400026f4 <vga_simRes_h160_v120+0x2b0>
40000938:	488010ef          	jal	ra,40001dc0 <print>

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
400009b4:	4d5000ef          	jal	ra,40001688 <aes_128_cipher>
	print("\r\n=================================TEST 2=====================================\r\n");
400009b8:	400027b7          	lui	a5,0x40002
400009bc:	74878513          	addi	a0,a5,1864 # 40002748 <vga_simRes_h160_v120+0x304>
400009c0:	400010ef          	jal	ra,40001dc0 <print>

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
400009e0:	18a78793          	addi	a5,a5,394 # 6428318a <__global_pointer$+0x2427fb32>
400009e4:	faf42223          	sw	a5,-92(s0)
    aes_block[0] 	= 0x6e6f9733;
400009e8:	6e6f97b7          	lui	a5,0x6e6f9
400009ec:	73378793          	addi	a5,a5,1843 # 6e6f9733 <__global_pointer$+0x2e6f60db>
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
40000a3c:	44d000ef          	jal	ra,40001688 <aes_128_cipher>
	print("\r\n=================================TEST 3=====================================\r\n");
40000a40:	400027b7          	lui	a5,0x40002
40000a44:	79c78513          	addi	a0,a5,1948 # 4000279c <vga_simRes_h160_v120+0x358>
40000a48:	378010ef          	jal	ra,40001dc0 <print>

    aes_block[3] 	= 0x7393172a;
40000a4c:	739317b7          	lui	a5,0x73931
40000a50:	72a78793          	addi	a5,a5,1834 # 7393172a <__global_pointer$+0x3392e0d2>
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
40000a74:	ee278793          	addi	a5,a5,-286 # 6bc1bee2 <__global_pointer$+0x2bc1888a>
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
40000ac4:	3c5000ef          	jal	ra,40001688 <aes_128_cipher>
	print("\r\n=================================TEST 4=====================================\r\n");
40000ac8:	400027b7          	lui	a5,0x40002
40000acc:	7f078513          	addi	a0,a5,2032 # 400027f0 <vga_simRes_h160_v120+0x3ac>
40000ad0:	2f0010ef          	jal	ra,40001dc0 <print>

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
40000b4c:	33d000ef          	jal	ra,40001688 <aes_128_cipher>

   	print("\r\n==========================================TEST 5(AES256)========================================\r\n");
40000b50:	400037b7          	lui	a5,0x40003
40000b54:	84478513          	addi	a0,a5,-1980 # 40002844 <vga_simRes_h160_v120+0x400>
40000b58:	268010ef          	jal	ra,40001dc0 <print>
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
40000b80:	72a78793          	addi	a5,a5,1834 # 7393172a <__global_pointer$+0x3392e0d2>
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
40000ba4:	ee278793          	addi	a5,a5,-286 # 6bc1bee2 <__global_pointer$+0x2bc1888a>
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
40000c04:	b1078793          	addi	a5,a5,-1264 # 603deb10 <__global_pointer$+0x203db4b8>
40000c08:	f6f42823          	sw	a5,-144(s0)

    aes_256_cipher(AES_OP_EN, aes_key_256, aes_block, aes_res);
40000c0c:	f9040693          	addi	a3,s0,-112
40000c10:	fa040713          	addi	a4,s0,-96
40000c14:	f7040793          	addi	a5,s0,-144
40000c18:	00070613          	mv	a2,a4
40000c1c:	00078593          	mv	a1,a5
40000c20:	00100513          	li	a0,1
40000c24:	4c9000ef          	jal	ra,400018ec <aes_256_cipher>

   	print("\r\n==========================================TEST 6(AES256)========================================\r\n");
40000c28:	400037b7          	lui	a5,0x40003
40000c2c:	8ac78513          	addi	a0,a5,-1876 # 400028ac <vga_simRes_h160_v120+0x468>
40000c30:	190010ef          	jal	ra,40001dc0 <print>

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
40000cbc:	b1078793          	addi	a5,a5,-1264 # 603deb10 <__global_pointer$+0x203db4b8>
40000cc0:	f6f42823          	sw	a5,-144(s0)

    aes_256_cipher(AES_OP_DE, aes_key_256, aes_block, aes_res);
40000cc4:	f9040693          	addi	a3,s0,-112
40000cc8:	fa040713          	addi	a4,s0,-96
40000ccc:	f7040793          	addi	a5,s0,-144
40000cd0:	00070613          	mv	a2,a4
40000cd4:	00078593          	mv	a1,a5
40000cd8:	00000513          	li	a0,0
40000cdc:	411000ef          	jal	ra,400018ec <aes_256_cipher>
	print("===============================PRESENT TEST=====================================\r\n");
40000ce0:	400037b7          	lui	a5,0x40003
40000ce4:	91478513          	addi	a0,a5,-1772 # 40002914 <vga_simRes_h160_v120+0x4d0>
40000ce8:	0d8010ef          	jal	ra,40001dc0 <print>
	print("=========================LE DUY LINH - 18200157-============================\r\n");
40000cec:	400027b7          	lui	a5,0x40002
40000cf0:	50478513          	addi	a0,a5,1284 # 40002504 <vga_simRes_h160_v120+0xc0>
40000cf4:	0cc010ef          	jal	ra,40001dc0 <print>
	print("============================================================================\r\n");
40000cf8:	400027b7          	lui	a5,0x40002
40000cfc:	46478513          	addi	a0,a5,1124 # 40002464 <vga_simRes_h160_v120+0x20>
40000d00:	0c0010ef          	jal	ra,40001dc0 <print>
	unsigned int present_key[3] = {0x0, 0x0, 0x0};
40000d04:	f6042223          	sw	zero,-156(s0)
40000d08:	f6042423          	sw	zero,-152(s0)
40000d0c:	f6042623          	sw	zero,-148(s0)
	unsigned int present_block[2] 	= {0x0, 0x0};
40000d10:	f4042e23          	sw	zero,-164(s0)
40000d14:	f6042023          	sw	zero,-160(s0)
	unsigned int present_res[2] 	= {0x0, 0x0};
40000d18:	f4042a23          	sw	zero,-172(s0)
40000d1c:	f4042c23          	sw	zero,-168(s0)

	print("\r\n=================================TEST 1=====================================\r\n");
40000d20:	400027b7          	lui	a5,0x40002
40000d24:	6f478513          	addi	a0,a5,1780 # 400026f4 <vga_simRes_h160_v120+0x2b0>
40000d28:	098010ef          	jal	ra,40001dc0 <print>

	present_block[1]=0x4c746e67;
40000d2c:	4c7477b7          	lui	a5,0x4c747
40000d30:	e6778793          	addi	a5,a5,-409 # 4c746e67 <__global_pointer$+0xc74380f>
40000d34:	f6f42023          	sw	a5,-160(s0)
	present_block[0]=0x7579656e;
40000d38:	757967b7          	lui	a5,0x75796
40000d3c:	56e78793          	addi	a5,a5,1390 # 7579656e <__global_pointer$+0x35792f16>
40000d40:	f4f42e23          	sw	a5,-164(s0)

	present_key[2] = 0x46657465;
40000d44:	466577b7          	lui	a5,0x46657
40000d48:	46578793          	addi	a5,a5,1125 # 46657465 <__global_pointer$+0x6653e0d>
40000d4c:	f6f42623          	sw	a5,-148(s0)
	present_key[1] = 0x6c48636d;
40000d50:	6c4867b7          	lui	a5,0x6c486
40000d54:	36d78793          	addi	a5,a5,877 # 6c48636d <__global_pointer$+0x2c482d15>
40000d58:	f6f42423          	sw	a5,-152(s0)
	present_key[0] = 0x7573;
40000d5c:	000077b7          	lui	a5,0x7
40000d60:	57378793          	addi	a5,a5,1395 # 7573 <_stack_size+0x6d73>
40000d64:	f6f42223          	sw	a5,-156(s0)

	present_cipher(PRESENT_OP_EN,present_key,present_block,present_res);
40000d68:	f5440693          	addi	a3,s0,-172
40000d6c:	f5c40713          	addi	a4,s0,-164
40000d70:	f6440793          	addi	a5,s0,-156
40000d74:	00070613          	mv	a2,a4
40000d78:	00078593          	mv	a1,a5
40000d7c:	00000513          	li	a0,0
40000d80:	470000ef          	jal	ra,400011f0 <present_cipher>

	print("\r\n=================================TEST 2=====================================\r\n");
40000d84:	400027b7          	lui	a5,0x40002
40000d88:	74878513          	addi	a0,a5,1864 # 40002748 <vga_simRes_h160_v120+0x304>
40000d8c:	034010ef          	jal	ra,40001dc0 <print>

	present_block[1]=0x0e1d00d4;
40000d90:	0e1d07b7          	lui	a5,0xe1d0
40000d94:	0d478793          	addi	a5,a5,212 # e1d00d4 <_stack_size+0xe1cf8d4>
40000d98:	f6f42023          	sw	a5,-160(s0)
	present_block[0]=0xe46ba99c;
40000d9c:	e46bb7b7          	lui	a5,0xe46bb
40000da0:	99c78793          	addi	a5,a5,-1636 # e46ba99c <_stack_start+0x646ba05c>
40000da4:	f4f42e23          	sw	a5,-164(s0)

	present_key[2] = 0x46657465;
40000da8:	466577b7          	lui	a5,0x46657
40000dac:	46578793          	addi	a5,a5,1125 # 46657465 <__global_pointer$+0x6653e0d>
40000db0:	f6f42623          	sw	a5,-148(s0)
	present_key[1] = 0x6c48636d;
40000db4:	6c4867b7          	lui	a5,0x6c486
40000db8:	36d78793          	addi	a5,a5,877 # 6c48636d <__global_pointer$+0x2c482d15>
40000dbc:	f6f42423          	sw	a5,-152(s0)
	present_key[0] = 0x7573;
40000dc0:	000077b7          	lui	a5,0x7
40000dc4:	57378793          	addi	a5,a5,1395 # 7573 <_stack_size+0x6d73>
40000dc8:	f6f42223          	sw	a5,-156(s0)

	present_cipher(PRESENT_OP_DE,present_key,present_block,present_res);
40000dcc:	f5440693          	addi	a3,s0,-172
40000dd0:	f5c40713          	addi	a4,s0,-164
40000dd4:	f6440793          	addi	a5,s0,-156
40000dd8:	00070613          	mv	a2,a4
40000ddc:	00078593          	mv	a1,a5
40000de0:	00100513          	li	a0,1
40000de4:	40c000ef          	jal	ra,400011f0 <present_cipher>

	print("\r\n=================================TEST 3=====================================\r\n");
40000de8:	400027b7          	lui	a5,0x40002
40000dec:	79c78513          	addi	a0,a5,1948 # 4000279c <vga_simRes_h160_v120+0x358>
40000df0:	7d1000ef          	jal	ra,40001dc0 <print>

	present_block[1]=0x46657465;
40000df4:	466577b7          	lui	a5,0x46657
40000df8:	46578793          	addi	a5,a5,1125 # 46657465 <__global_pointer$+0x6653e0d>
40000dfc:	f6f42023          	sw	a5,-160(s0)
	present_block[0]=0x6c5f5553;
40000e00:	6c5f57b7          	lui	a5,0x6c5f5
40000e04:	55378793          	addi	a5,a5,1363 # 6c5f5553 <__global_pointer$+0x2c5f1efb>
40000e08:	f4f42e23          	sw	a5,-164(s0)

	present_key[2] = 0x00000000;
40000e0c:	f6042623          	sw	zero,-148(s0)
	present_key[1] = 0x00000000;
40000e10:	f6042423          	sw	zero,-152(s0)
	present_key[0] = 0x0001;
40000e14:	00100793          	li	a5,1
40000e18:	f6f42223          	sw	a5,-156(s0)
	present_cipher(PRESENT_OP_EN,present_key,present_block,present_res);
40000e1c:	f5440693          	addi	a3,s0,-172
40000e20:	f5c40713          	addi	a4,s0,-164
40000e24:	f6440793          	addi	a5,s0,-156
40000e28:	00070613          	mv	a2,a4
40000e2c:	00078593          	mv	a1,a5
40000e30:	00000513          	li	a0,0
40000e34:	3bc000ef          	jal	ra,400011f0 <present_cipher>

	print("\r\n=================================TEST 4=====================================\r\n");
40000e38:	400027b7          	lui	a5,0x40002
40000e3c:	7f078513          	addi	a0,a5,2032 # 400027f0 <vga_simRes_h160_v120+0x3ac>
40000e40:	781000ef          	jal	ra,40001dc0 <print>

	present_block[1]=0x9346f086;
40000e44:	9346f7b7          	lui	a5,0x9346f
40000e48:	08678793          	addi	a5,a5,134 # 9346f086 <_stack_start+0x1346e746>
40000e4c:	f6f42023          	sw	a5,-160(s0)
	present_block[0]=0xb0b1c9b4;
40000e50:	b0b1d7b7          	lui	a5,0xb0b1d
40000e54:	9b478793          	addi	a5,a5,-1612 # b0b1c9b4 <_stack_start+0x30b1c074>
40000e58:	f4f42e23          	sw	a5,-164(s0)

	present_key[2] = 0x00000000;
40000e5c:	f6042623          	sw	zero,-148(s0)
	present_key[1] = 0x00000000;
40000e60:	f6042423          	sw	zero,-152(s0)
	present_key[0] = 0x0001;
40000e64:	00100793          	li	a5,1
40000e68:	f6f42223          	sw	a5,-156(s0)

	present_cipher(PRESENT_OP_DE,present_key,present_block,present_res);
40000e6c:	f5440693          	addi	a3,s0,-172
40000e70:	f5c40713          	addi	a4,s0,-164
40000e74:	f6440793          	addi	a5,s0,-156
40000e78:	00070613          	mv	a2,a4
40000e7c:	00078593          	mv	a1,a5
40000e80:	00100513          	li	a0,1
40000e84:	36c000ef          	jal	ra,400011f0 <present_cipher>

	return 0;	
40000e88:	00000793          	li	a5,0
}
40000e8c:	00078513          	mv	a0,a5
40000e90:	0ac12083          	lw	ra,172(sp)
40000e94:	0a812403          	lw	s0,168(sp)
40000e98:	0b010113          	addi	sp,sp,176
40000e9c:	00008067          	ret

40000ea0 <irqCallback>:
void irqCallback(){
40000ea0:	ff010113          	addi	sp,sp,-16
40000ea4:	00812623          	sw	s0,12(sp)
40000ea8:	01010413          	addi	s0,sp,16

}
40000eac:	00000013          	nop
40000eb0:	00c12403          	lw	s0,12(sp)
40000eb4:	01010113          	addi	sp,sp,16
40000eb8:	00008067          	ret

40000ebc <timer_init>:
static void timer_init(Timer_Reg *reg){
40000ebc:	fe010113          	addi	sp,sp,-32
40000ec0:	00812e23          	sw	s0,28(sp)
40000ec4:	02010413          	addi	s0,sp,32
40000ec8:	fea42623          	sw	a0,-20(s0)
	reg->CLEARS_TICKS  = 0;
40000ecc:	fec42783          	lw	a5,-20(s0)
40000ed0:	0007a023          	sw	zero,0(a5)
	reg->VALUE = 0;
40000ed4:	fec42783          	lw	a5,-20(s0)
40000ed8:	0007a423          	sw	zero,8(a5)
}
40000edc:	00000013          	nop
40000ee0:	01c12403          	lw	s0,28(sp)
40000ee4:	02010113          	addi	sp,sp,32
40000ee8:	00008067          	ret

40000eec <prescaler_init>:
static void prescaler_init(Prescaler_Reg* reg){
40000eec:	fe010113          	addi	sp,sp,-32
40000ef0:	00812e23          	sw	s0,28(sp)
40000ef4:	02010413          	addi	s0,sp,32
40000ef8:	fea42623          	sw	a0,-20(s0)
}
40000efc:	00000013          	nop
40000f00:	01c12403          	lw	s0,28(sp)
40000f04:	02010113          	addi	sp,sp,32
40000f08:	00008067          	ret

40000f0c <interruptCtrl_init>:
static void interruptCtrl_init(InterruptCtrl_Reg* reg){
40000f0c:	fe010113          	addi	sp,sp,-32
40000f10:	00812e23          	sw	s0,28(sp)
40000f14:	02010413          	addi	s0,sp,32
40000f18:	fea42623          	sw	a0,-20(s0)
	reg->MASKS = 0;
40000f1c:	fec42783          	lw	a5,-20(s0)
40000f20:	0007a223          	sw	zero,4(a5)
	reg->PENDINGS = 0xFFFFFFFF;
40000f24:	fec42783          	lw	a5,-20(s0)
40000f28:	fff00713          	li	a4,-1
40000f2c:	00e7a023          	sw	a4,0(a5)
}
40000f30:	00000013          	nop
40000f34:	01c12403          	lw	s0,28(sp)
40000f38:	02010113          	addi	sp,sp,32
40000f3c:	00008067          	ret

40000f40 <uart_writeAvailability>:
static uint32_t uart_writeAvailability(Uart_Reg *reg){
40000f40:	fe010113          	addi	sp,sp,-32
40000f44:	00812e23          	sw	s0,28(sp)
40000f48:	02010413          	addi	s0,sp,32
40000f4c:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS >> 16) & 0xFF;
40000f50:	fec42783          	lw	a5,-20(s0)
40000f54:	0047a783          	lw	a5,4(a5)
40000f58:	0107d793          	srli	a5,a5,0x10
40000f5c:	0ff7f793          	zext.b	a5,a5
}
40000f60:	00078513          	mv	a0,a5
40000f64:	01c12403          	lw	s0,28(sp)
40000f68:	02010113          	addi	sp,sp,32
40000f6c:	00008067          	ret

40000f70 <uart_readOccupancy>:
static uint32_t uart_readOccupancy(Uart_Reg *reg){
40000f70:	fe010113          	addi	sp,sp,-32
40000f74:	00812e23          	sw	s0,28(sp)
40000f78:	02010413          	addi	s0,sp,32
40000f7c:	fea42623          	sw	a0,-20(s0)
	return reg->STATUS >> 24;
40000f80:	fec42783          	lw	a5,-20(s0)
40000f84:	0047a783          	lw	a5,4(a5)
40000f88:	0187d793          	srli	a5,a5,0x18
}
40000f8c:	00078513          	mv	a0,a5
40000f90:	01c12403          	lw	s0,28(sp)
40000f94:	02010113          	addi	sp,sp,32
40000f98:	00008067          	ret

40000f9c <uart_write>:
static void uart_write(Uart_Reg *reg, uint32_t data){
40000f9c:	fe010113          	addi	sp,sp,-32
40000fa0:	00112e23          	sw	ra,28(sp)
40000fa4:	00812c23          	sw	s0,24(sp)
40000fa8:	02010413          	addi	s0,sp,32
40000fac:	fea42623          	sw	a0,-20(s0)
40000fb0:	feb42423          	sw	a1,-24(s0)
	while(uart_writeAvailability(reg) == 0);
40000fb4:	00000013          	nop
40000fb8:	fec42503          	lw	a0,-20(s0)
40000fbc:	f85ff0ef          	jal	ra,40000f40 <uart_writeAvailability>
40000fc0:	00050793          	mv	a5,a0
40000fc4:	fe078ae3          	beqz	a5,40000fb8 <uart_write+0x1c>
	reg->DATA = data;
40000fc8:	fec42783          	lw	a5,-20(s0)
40000fcc:	fe842703          	lw	a4,-24(s0)
40000fd0:	00e7a023          	sw	a4,0(a5)
}
40000fd4:	00000013          	nop
40000fd8:	01c12083          	lw	ra,28(sp)
40000fdc:	01812403          	lw	s0,24(sp)
40000fe0:	02010113          	addi	sp,sp,32
40000fe4:	00008067          	ret

40000fe8 <uart_applyConfig>:
static void uart_applyConfig(Uart_Reg *reg, Uart_Config *config){
40000fe8:	fe010113          	addi	sp,sp,-32
40000fec:	00812e23          	sw	s0,28(sp)
40000ff0:	02010413          	addi	s0,sp,32
40000ff4:	fea42623          	sw	a0,-20(s0)
40000ff8:	feb42423          	sw	a1,-24(s0)
	reg->CLOCK_DIVIDER = config->clockDivider;
40000ffc:	fe842783          	lw	a5,-24(s0)
40001000:	00c7a703          	lw	a4,12(a5)
40001004:	fec42783          	lw	a5,-20(s0)
40001008:	00e7a423          	sw	a4,8(a5)
	reg->FRAME_CONFIG = ((config->dataLength-1) << 0) | (config->parity << 8) | (config->stop << 16);
4000100c:	fe842783          	lw	a5,-24(s0)
40001010:	0007a783          	lw	a5,0(a5)
40001014:	fff78713          	addi	a4,a5,-1
40001018:	fe842783          	lw	a5,-24(s0)
4000101c:	0047a783          	lw	a5,4(a5)
40001020:	00879793          	slli	a5,a5,0x8
40001024:	00f76733          	or	a4,a4,a5
40001028:	fe842783          	lw	a5,-24(s0)
4000102c:	0087a783          	lw	a5,8(a5)
40001030:	01079793          	slli	a5,a5,0x10
40001034:	00f76733          	or	a4,a4,a5
40001038:	fec42783          	lw	a5,-20(s0)
4000103c:	00e7a623          	sw	a4,12(a5)
}
40001040:	00000013          	nop
40001044:	01c12403          	lw	s0,28(sp)
40001048:	02010113          	addi	sp,sp,32
4000104c:	00008067          	ret

40001050 <vga_isBusy>:
static uint32_t vga_isBusy(Vga_Reg *reg){
40001050:	fe010113          	addi	sp,sp,-32
40001054:	00812e23          	sw	s0,28(sp)
40001058:	02010413          	addi	s0,sp,32
4000105c:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS & 2) != 0;
40001060:	fec42783          	lw	a5,-20(s0)
40001064:	0007a783          	lw	a5,0(a5)
40001068:	0027f793          	andi	a5,a5,2
4000106c:	00f037b3          	snez	a5,a5
40001070:	0ff7f793          	zext.b	a5,a5
}
40001074:	00078513          	mv	a0,a5
40001078:	01c12403          	lw	s0,28(sp)
4000107c:	02010113          	addi	sp,sp,32
40001080:	00008067          	ret

40001084 <vga_run>:
static void vga_run(Vga_Reg *reg){
40001084:	fe010113          	addi	sp,sp,-32
40001088:	00812e23          	sw	s0,28(sp)
4000108c:	02010413          	addi	s0,sp,32
40001090:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 1;
40001094:	fec42783          	lw	a5,-20(s0)
40001098:	00100713          	li	a4,1
4000109c:	00e7a023          	sw	a4,0(a5)
}
400010a0:	00000013          	nop
400010a4:	01c12403          	lw	s0,28(sp)
400010a8:	02010113          	addi	sp,sp,32
400010ac:	00008067          	ret

400010b0 <vga_stop>:
static void vga_stop(Vga_Reg *reg){
400010b0:	fe010113          	addi	sp,sp,-32
400010b4:	00112e23          	sw	ra,28(sp)
400010b8:	00812c23          	sw	s0,24(sp)
400010bc:	02010413          	addi	s0,sp,32
400010c0:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 0;
400010c4:	fec42783          	lw	a5,-20(s0)
400010c8:	0007a023          	sw	zero,0(a5)
	while(vga_isBusy(reg));
400010cc:	00000013          	nop
400010d0:	fec42503          	lw	a0,-20(s0)
400010d4:	f7dff0ef          	jal	ra,40001050 <vga_isBusy>
400010d8:	00050793          	mv	a5,a0
400010dc:	fe079ae3          	bnez	a5,400010d0 <vga_stop+0x20>
}
400010e0:	00000013          	nop
400010e4:	00000013          	nop
400010e8:	01c12083          	lw	ra,28(sp)
400010ec:	01812403          	lw	s0,24(sp)
400010f0:	02010113          	addi	sp,sp,32
400010f4:	00008067          	ret

400010f8 <present_write>:
#include "briey.h"
void present_write(uint32_t iData, uint32_t iAddress)
{
400010f8:	fe010113          	addi	sp,sp,-32
400010fc:	00812e23          	sw	s0,28(sp)
40001100:	02010413          	addi	s0,sp,32
40001104:	fea42623          	sw	a0,-20(s0)
40001108:	feb42423          	sw	a1,-24(s0)
	PRESENT_BASE->ADDRESS		= iAddress;
4000110c:	f00037b7          	lui	a5,0xf0003
40001110:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40001114:	fe842703          	lw	a4,-24(s0)
40001118:	00e7a623          	sw	a4,12(a5)
	PRESENT_BASE->WRITE_N 		= 0;
4000111c:	f00037b7          	lui	a5,0xf0003
40001120:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40001124:	0007a223          	sw	zero,4(a5)
	PRESENT_BASE->READ_N 		= 1;
40001128:	f00037b7          	lui	a5,0xf0003
4000112c:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40001130:	00100713          	li	a4,1
40001134:	00e7a423          	sw	a4,8(a5)
	PRESENT_BASE->IDATA			= iData;
40001138:	f00037b7          	lui	a5,0xf0003
4000113c:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40001140:	fec42703          	lw	a4,-20(s0)
40001144:	00e7a823          	sw	a4,16(a5)
	PRESENT_BASE->CHIP_SELECT_N	= 0;
40001148:	f00037b7          	lui	a5,0xf0003
4000114c:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40001150:	0007a023          	sw	zero,0(a5)
	PRESENT_BASE->CHIP_SELECT_N	= 1;
40001154:	f00037b7          	lui	a5,0xf0003
40001158:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
4000115c:	00100713          	li	a4,1
40001160:	00e7a023          	sw	a4,0(a5)
}
40001164:	00000013          	nop
40001168:	01c12403          	lw	s0,28(sp)
4000116c:	02010113          	addi	sp,sp,32
40001170:	00008067          	ret

40001174 <present_read>:
uint32_t present_read(uint32_t iAddress)
{
40001174:	fd010113          	addi	sp,sp,-48
40001178:	02812623          	sw	s0,44(sp)
4000117c:	03010413          	addi	s0,sp,48
40001180:	fca42e23          	sw	a0,-36(s0)
	PRESENT_BASE->ADDRESS		= iAddress;
40001184:	f00037b7          	lui	a5,0xf0003
40001188:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
4000118c:	fdc42703          	lw	a4,-36(s0)
40001190:	00e7a623          	sw	a4,12(a5)
	PRESENT_BASE->READ_N		= 0;
40001194:	f00037b7          	lui	a5,0xf0003
40001198:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
4000119c:	0007a423          	sw	zero,8(a5)
	PRESENT_BASE->WRITE_N		= 1;
400011a0:	f00037b7          	lui	a5,0xf0003
400011a4:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
400011a8:	00100713          	li	a4,1
400011ac:	00e7a223          	sw	a4,4(a5)
	PRESENT_BASE->CHIP_SELECT_N	= 0;
400011b0:	f00037b7          	lui	a5,0xf0003
400011b4:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
400011b8:	0007a023          	sw	zero,0(a5)
	uint32_t res 				= PRESENT_BASE->ODATA;
400011bc:	f00037b7          	lui	a5,0xf0003
400011c0:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
400011c4:	0147a783          	lw	a5,20(a5)
400011c8:	fef42623          	sw	a5,-20(s0)
	PRESENT_BASE->CHIP_SELECT_N	= 1;
400011cc:	f00037b7          	lui	a5,0xf0003
400011d0:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
400011d4:	00100713          	li	a4,1
400011d8:	00e7a023          	sw	a4,0(a5)
	return res;
400011dc:	fec42783          	lw	a5,-20(s0)
}
400011e0:	00078513          	mv	a0,a5
400011e4:	02c12403          	lw	s0,44(sp)
400011e8:	03010113          	addi	sp,sp,48
400011ec:	00008067          	ret

400011f0 <present_cipher>:
void present_cipher(unsigned char operation, uint32_t *key, uint32_t *block, uint32_t *res) {
400011f0:	fe010113          	addi	sp,sp,-32
400011f4:	00112e23          	sw	ra,28(sp)
400011f8:	00812c23          	sw	s0,24(sp)
400011fc:	00912a23          	sw	s1,20(sp)
40001200:	02010413          	addi	s0,sp,32
40001204:	00050793          	mv	a5,a0
40001208:	feb42423          	sw	a1,-24(s0)
4000120c:	fec42223          	sw	a2,-28(s0)
40001210:	fed42023          	sw	a3,-32(s0)
40001214:	fef407a3          	sb	a5,-17(s0)

	//EN_OR_DE
	if(operation == PRESENT_OP_EN) present_write(PRESENT_OP_EN,PRESENT_ADDR_EN_OR_DE);
40001218:	fef44783          	lbu	a5,-17(s0)
4000121c:	00079a63          	bnez	a5,40001230 <present_cipher+0x40>
40001220:	00800593          	li	a1,8
40001224:	00000513          	li	a0,0
40001228:	ed1ff0ef          	jal	ra,400010f8 <present_write>
4000122c:	0100006f          	j	4000123c <present_cipher+0x4c>
	else present_write(PRESENT_OP_DE,PRESENT_ADDR_EN_OR_DE);
40001230:	00800593          	li	a1,8
40001234:	00100513          	li	a0,1
40001238:	ec1ff0ef          	jal	ra,400010f8 <present_write>

	//PLAIN_TEXT
	present_write(block[1],PRESENT_ADDR_BLOCK_BASE +1);
4000123c:	fe442783          	lw	a5,-28(s0)
40001240:	00478793          	addi	a5,a5,4
40001244:	0007a783          	lw	a5,0(a5)
40001248:	00500593          	li	a1,5
4000124c:	00078513          	mv	a0,a5
40001250:	ea9ff0ef          	jal	ra,400010f8 <present_write>
	present_write(block[0],PRESENT_ADDR_BLOCK_BASE);
40001254:	fe442783          	lw	a5,-28(s0)
40001258:	0007a783          	lw	a5,0(a5)
4000125c:	00400593          	li	a1,4
40001260:	00078513          	mv	a0,a5
40001264:	e95ff0ef          	jal	ra,400010f8 <present_write>

	//KEY
	present_write(key[2],PRESENT_ADDR_KEY_BASE +2);
40001268:	fe842783          	lw	a5,-24(s0)
4000126c:	00878793          	addi	a5,a5,8
40001270:	0007a783          	lw	a5,0(a5)
40001274:	00300593          	li	a1,3
40001278:	00078513          	mv	a0,a5
4000127c:	e7dff0ef          	jal	ra,400010f8 <present_write>
	present_write(key[1],PRESENT_ADDR_KEY_BASE +1);
40001280:	fe842783          	lw	a5,-24(s0)
40001284:	00478793          	addi	a5,a5,4
40001288:	0007a783          	lw	a5,0(a5)
4000128c:	00200593          	li	a1,2
40001290:	00078513          	mv	a0,a5
40001294:	e65ff0ef          	jal	ra,400010f8 <present_write>
	present_write(key[0],PRESENT_ADDR_KEY_BASE);
40001298:	fe842783          	lw	a5,-24(s0)
4000129c:	0007a783          	lw	a5,0(a5)
400012a0:	00100593          	li	a1,1
400012a4:	00078513          	mv	a0,a5
400012a8:	e51ff0ef          	jal	ra,400010f8 <present_write>

	//START
	present_write(0x1,PRESENT_ADDR_START);
400012ac:	00000593          	li	a1,0
400012b0:	00100513          	li	a0,1
400012b4:	e45ff0ef          	jal	ra,400010f8 <present_write>
    while(present_read(PRESENT_ADDR_RESULT_BASE) == 0);
400012b8:	00000013          	nop
400012bc:	00600513          	li	a0,6
400012c0:	eb5ff0ef          	jal	ra,40001174 <present_read>
400012c4:	00050793          	mv	a5,a0
400012c8:	fe078ae3          	beqz	a5,400012bc <present_cipher+0xcc>

    res[1] = present_read(PRESENT_ADDR_RESULT_BASE +1);
400012cc:	fe042783          	lw	a5,-32(s0)
400012d0:	00478493          	addi	s1,a5,4
400012d4:	00700513          	li	a0,7
400012d8:	e9dff0ef          	jal	ra,40001174 <present_read>
400012dc:	00050793          	mv	a5,a0
400012e0:	00f4a023          	sw	a5,0(s1)
    res[0] =present_read(PRESENT_ADDR_RESULT_BASE);
400012e4:	00600513          	li	a0,6
400012e8:	e8dff0ef          	jal	ra,40001174 <present_read>
400012ec:	00050713          	mv	a4,a0
400012f0:	fe042783          	lw	a5,-32(s0)
400012f4:	00e7a023          	sw	a4,0(a5)


    //print result to terminal
	if(operation == PRESENT_OP_EN)
400012f8:	fef44783          	lbu	a5,-17(s0)
400012fc:	00079a63          	bnez	a5,40001310 <present_cipher+0x120>
		print("============================PRESENT ENCRYPTTION==============================\r\n");
40001300:	400037b7          	lui	a5,0x40003
40001304:	9c878513          	addi	a0,a5,-1592 # 400029c8 <vga_simRes_h160_v120+0x20>
40001308:	2b9000ef          	jal	ra,40001dc0 <print>
4000130c:	0100006f          	j	4000131c <present_cipher+0x12c>
	else
		print("============================PRESENT DECRYPTTION==============================\r\n");
40001310:	400037b7          	lui	a5,0x40003
40001314:	a1878513          	addi	a0,a5,-1512 # 40002a18 <vga_simRes_h160_v120+0x70>
40001318:	2a9000ef          	jal	ra,40001dc0 <print>
	print64bit("\r\nPLAIN_TEXT (64-bit) : ", block);
4000131c:	fe442583          	lw	a1,-28(s0)
40001320:	400037b7          	lui	a5,0x40003
40001324:	a6878513          	addi	a0,a5,-1432 # 40002a68 <vga_simRes_h160_v120+0xc0>
40001328:	501000ef          	jal	ra,40002028 <print64bit>
	print80bit("KEY (80-bit) : ", key);
4000132c:	fe842583          	lw	a1,-24(s0)
40001330:	400037b7          	lui	a5,0x40003
40001334:	a8478513          	addi	a0,a5,-1404 # 40002a84 <vga_simRes_h160_v120+0xdc>
40001338:	5e1000ef          	jal	ra,40002118 <print80bit>
	print64bit("RESULT (64-bit) : ", res);
4000133c:	fe042583          	lw	a1,-32(s0)
40001340:	400037b7          	lui	a5,0x40003
40001344:	a9478513          	addi	a0,a5,-1388 # 40002a94 <vga_simRes_h160_v120+0xec>
40001348:	4e1000ef          	jal	ra,40002028 <print64bit>
	print("\r\n============================================================================\r\n");
4000134c:	400037b7          	lui	a5,0x40003
40001350:	aa878513          	addi	a0,a5,-1368 # 40002aa8 <vga_simRes_h160_v120+0x100>
40001354:	26d000ef          	jal	ra,40001dc0 <print>
}
40001358:	00000013          	nop
4000135c:	01c12083          	lw	ra,28(sp)
40001360:	01812403          	lw	s0,24(sp)
40001364:	01412483          	lw	s1,20(sp)
40001368:	02010113          	addi	sp,sp,32
4000136c:	00008067          	ret

40001370 <timer_init>:
static void timer_init(Timer_Reg *reg){
40001370:	fe010113          	addi	sp,sp,-32
40001374:	00812e23          	sw	s0,28(sp)
40001378:	02010413          	addi	s0,sp,32
4000137c:	fea42623          	sw	a0,-20(s0)
	reg->CLEARS_TICKS  = 0;
40001380:	fec42783          	lw	a5,-20(s0)
40001384:	0007a023          	sw	zero,0(a5)
	reg->VALUE = 0;
40001388:	fec42783          	lw	a5,-20(s0)
4000138c:	0007a423          	sw	zero,8(a5)
}
40001390:	00000013          	nop
40001394:	01c12403          	lw	s0,28(sp)
40001398:	02010113          	addi	sp,sp,32
4000139c:	00008067          	ret

400013a0 <prescaler_init>:
static void prescaler_init(Prescaler_Reg* reg){
400013a0:	fe010113          	addi	sp,sp,-32
400013a4:	00812e23          	sw	s0,28(sp)
400013a8:	02010413          	addi	s0,sp,32
400013ac:	fea42623          	sw	a0,-20(s0)
}
400013b0:	00000013          	nop
400013b4:	01c12403          	lw	s0,28(sp)
400013b8:	02010113          	addi	sp,sp,32
400013bc:	00008067          	ret

400013c0 <interruptCtrl_init>:
static void interruptCtrl_init(InterruptCtrl_Reg* reg){
400013c0:	fe010113          	addi	sp,sp,-32
400013c4:	00812e23          	sw	s0,28(sp)
400013c8:	02010413          	addi	s0,sp,32
400013cc:	fea42623          	sw	a0,-20(s0)
	reg->MASKS = 0;
400013d0:	fec42783          	lw	a5,-20(s0)
400013d4:	0007a223          	sw	zero,4(a5)
	reg->PENDINGS = 0xFFFFFFFF;
400013d8:	fec42783          	lw	a5,-20(s0)
400013dc:	fff00713          	li	a4,-1
400013e0:	00e7a023          	sw	a4,0(a5)
}
400013e4:	00000013          	nop
400013e8:	01c12403          	lw	s0,28(sp)
400013ec:	02010113          	addi	sp,sp,32
400013f0:	00008067          	ret

400013f4 <uart_writeAvailability>:
static uint32_t uart_writeAvailability(Uart_Reg *reg){
400013f4:	fe010113          	addi	sp,sp,-32
400013f8:	00812e23          	sw	s0,28(sp)
400013fc:	02010413          	addi	s0,sp,32
40001400:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS >> 16) & 0xFF;
40001404:	fec42783          	lw	a5,-20(s0)
40001408:	0047a783          	lw	a5,4(a5)
4000140c:	0107d793          	srli	a5,a5,0x10
40001410:	0ff7f793          	zext.b	a5,a5
}
40001414:	00078513          	mv	a0,a5
40001418:	01c12403          	lw	s0,28(sp)
4000141c:	02010113          	addi	sp,sp,32
40001420:	00008067          	ret

40001424 <uart_readOccupancy>:
static uint32_t uart_readOccupancy(Uart_Reg *reg){
40001424:	fe010113          	addi	sp,sp,-32
40001428:	00812e23          	sw	s0,28(sp)
4000142c:	02010413          	addi	s0,sp,32
40001430:	fea42623          	sw	a0,-20(s0)
	return reg->STATUS >> 24;
40001434:	fec42783          	lw	a5,-20(s0)
40001438:	0047a783          	lw	a5,4(a5)
4000143c:	0187d793          	srli	a5,a5,0x18
}
40001440:	00078513          	mv	a0,a5
40001444:	01c12403          	lw	s0,28(sp)
40001448:	02010113          	addi	sp,sp,32
4000144c:	00008067          	ret

40001450 <uart_write>:
static void uart_write(Uart_Reg *reg, uint32_t data){
40001450:	fe010113          	addi	sp,sp,-32
40001454:	00112e23          	sw	ra,28(sp)
40001458:	00812c23          	sw	s0,24(sp)
4000145c:	02010413          	addi	s0,sp,32
40001460:	fea42623          	sw	a0,-20(s0)
40001464:	feb42423          	sw	a1,-24(s0)
	while(uart_writeAvailability(reg) == 0);
40001468:	00000013          	nop
4000146c:	fec42503          	lw	a0,-20(s0)
40001470:	f85ff0ef          	jal	ra,400013f4 <uart_writeAvailability>
40001474:	00050793          	mv	a5,a0
40001478:	fe078ae3          	beqz	a5,4000146c <uart_write+0x1c>
	reg->DATA = data;
4000147c:	fec42783          	lw	a5,-20(s0)
40001480:	fe842703          	lw	a4,-24(s0)
40001484:	00e7a023          	sw	a4,0(a5)
}
40001488:	00000013          	nop
4000148c:	01c12083          	lw	ra,28(sp)
40001490:	01812403          	lw	s0,24(sp)
40001494:	02010113          	addi	sp,sp,32
40001498:	00008067          	ret

4000149c <uart_applyConfig>:
static void uart_applyConfig(Uart_Reg *reg, Uart_Config *config){
4000149c:	fe010113          	addi	sp,sp,-32
400014a0:	00812e23          	sw	s0,28(sp)
400014a4:	02010413          	addi	s0,sp,32
400014a8:	fea42623          	sw	a0,-20(s0)
400014ac:	feb42423          	sw	a1,-24(s0)
	reg->CLOCK_DIVIDER = config->clockDivider;
400014b0:	fe842783          	lw	a5,-24(s0)
400014b4:	00c7a703          	lw	a4,12(a5)
400014b8:	fec42783          	lw	a5,-20(s0)
400014bc:	00e7a423          	sw	a4,8(a5)
	reg->FRAME_CONFIG = ((config->dataLength-1) << 0) | (config->parity << 8) | (config->stop << 16);
400014c0:	fe842783          	lw	a5,-24(s0)
400014c4:	0007a783          	lw	a5,0(a5)
400014c8:	fff78713          	addi	a4,a5,-1
400014cc:	fe842783          	lw	a5,-24(s0)
400014d0:	0047a783          	lw	a5,4(a5)
400014d4:	00879793          	slli	a5,a5,0x8
400014d8:	00f76733          	or	a4,a4,a5
400014dc:	fe842783          	lw	a5,-24(s0)
400014e0:	0087a783          	lw	a5,8(a5)
400014e4:	01079793          	slli	a5,a5,0x10
400014e8:	00f76733          	or	a4,a4,a5
400014ec:	fec42783          	lw	a5,-20(s0)
400014f0:	00e7a623          	sw	a4,12(a5)
}
400014f4:	00000013          	nop
400014f8:	01c12403          	lw	s0,28(sp)
400014fc:	02010113          	addi	sp,sp,32
40001500:	00008067          	ret

40001504 <vga_isBusy>:
static uint32_t vga_isBusy(Vga_Reg *reg){
40001504:	fe010113          	addi	sp,sp,-32
40001508:	00812e23          	sw	s0,28(sp)
4000150c:	02010413          	addi	s0,sp,32
40001510:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS & 2) != 0;
40001514:	fec42783          	lw	a5,-20(s0)
40001518:	0007a783          	lw	a5,0(a5)
4000151c:	0027f793          	andi	a5,a5,2
40001520:	00f037b3          	snez	a5,a5
40001524:	0ff7f793          	zext.b	a5,a5
}
40001528:	00078513          	mv	a0,a5
4000152c:	01c12403          	lw	s0,28(sp)
40001530:	02010113          	addi	sp,sp,32
40001534:	00008067          	ret

40001538 <vga_run>:
static void vga_run(Vga_Reg *reg){
40001538:	fe010113          	addi	sp,sp,-32
4000153c:	00812e23          	sw	s0,28(sp)
40001540:	02010413          	addi	s0,sp,32
40001544:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 1;
40001548:	fec42783          	lw	a5,-20(s0)
4000154c:	00100713          	li	a4,1
40001550:	00e7a023          	sw	a4,0(a5)
}
40001554:	00000013          	nop
40001558:	01c12403          	lw	s0,28(sp)
4000155c:	02010113          	addi	sp,sp,32
40001560:	00008067          	ret

40001564 <vga_stop>:
static void vga_stop(Vga_Reg *reg){
40001564:	fe010113          	addi	sp,sp,-32
40001568:	00112e23          	sw	ra,28(sp)
4000156c:	00812c23          	sw	s0,24(sp)
40001570:	02010413          	addi	s0,sp,32
40001574:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 0;
40001578:	fec42783          	lw	a5,-20(s0)
4000157c:	0007a023          	sw	zero,0(a5)
	while(vga_isBusy(reg));
40001580:	00000013          	nop
40001584:	fec42503          	lw	a0,-20(s0)
40001588:	f7dff0ef          	jal	ra,40001504 <vga_isBusy>
4000158c:	00050793          	mv	a5,a0
40001590:	fe079ae3          	bnez	a5,40001584 <vga_stop+0x20>
}
40001594:	00000013          	nop
40001598:	00000013          	nop
4000159c:	01c12083          	lw	ra,28(sp)
400015a0:	01812403          	lw	s0,24(sp)
400015a4:	02010113          	addi	sp,sp,32
400015a8:	00008067          	ret

400015ac <aes_write>:
#include "briey.h"
void aes_write(uint32_t iData, uint32_t iAddress)
{
400015ac:	fe010113          	addi	sp,sp,-32
400015b0:	00812e23          	sw	s0,28(sp)
400015b4:	02010413          	addi	s0,sp,32
400015b8:	fea42623          	sw	a0,-20(s0)
400015bc:	feb42423          	sw	a1,-24(s0)
	AES_BASE->ADDRESS		= iAddress;
400015c0:	f00027b7          	lui	a5,0xf0002
400015c4:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
400015c8:	fe842703          	lw	a4,-24(s0)
400015cc:	00e7a423          	sw	a4,8(a5)
	AES_BASE->WRITE_ENABLE 	= 1;
400015d0:	f00027b7          	lui	a5,0xf0002
400015d4:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
400015d8:	00100713          	li	a4,1
400015dc:	00e7a223          	sw	a4,4(a5)
	AES_BASE->IDATA			= iData;
400015e0:	f00027b7          	lui	a5,0xf0002
400015e4:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
400015e8:	fec42703          	lw	a4,-20(s0)
400015ec:	00e7a623          	sw	a4,12(a5)
	AES_BASE->CHIP_SELECT	= 1;
400015f0:	f00027b7          	lui	a5,0xf0002
400015f4:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
400015f8:	00100713          	li	a4,1
400015fc:	00e7a023          	sw	a4,0(a5)
	AES_BASE->CHIP_SELECT	= 0;
40001600:	f00027b7          	lui	a5,0xf0002
40001604:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40001608:	0007a023          	sw	zero,0(a5)
}
4000160c:	00000013          	nop
40001610:	01c12403          	lw	s0,28(sp)
40001614:	02010113          	addi	sp,sp,32
40001618:	00008067          	ret

4000161c <aes_read>:
uint32_t aes_read(uint32_t iAddress)
{
4000161c:	fd010113          	addi	sp,sp,-48
40001620:	02812623          	sw	s0,44(sp)
40001624:	03010413          	addi	s0,sp,48
40001628:	fca42e23          	sw	a0,-36(s0)
	AES_BASE->ADDRESS		= iAddress;
4000162c:	f00027b7          	lui	a5,0xf0002
40001630:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40001634:	fdc42703          	lw	a4,-36(s0)
40001638:	00e7a423          	sw	a4,8(a5)
	AES_BASE->WRITE_ENABLE	= 0;
4000163c:	f00027b7          	lui	a5,0xf0002
40001640:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40001644:	0007a223          	sw	zero,4(a5)
	AES_BASE->CHIP_SELECT	= 1;
40001648:	f00027b7          	lui	a5,0xf0002
4000164c:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40001650:	00100713          	li	a4,1
40001654:	00e7a023          	sw	a4,0(a5)
	uint32_t res 				= AES_BASE->ODATA;
40001658:	f00027b7          	lui	a5,0xf0002
4000165c:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40001660:	0107a783          	lw	a5,16(a5)
40001664:	fef42623          	sw	a5,-20(s0)
	AES_BASE->CHIP_SELECT	= 0;
40001668:	f00027b7          	lui	a5,0xf0002
4000166c:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40001670:	0007a023          	sw	zero,0(a5)
	return res;
40001674:	fec42783          	lw	a5,-20(s0)
}
40001678:	00078513          	mv	a0,a5
4000167c:	02c12403          	lw	s0,44(sp)
40001680:	03010113          	addi	sp,sp,48
40001684:	00008067          	ret

40001688 <aes_128_cipher>:
void aes_128_cipher(unsigned char operation, uint32_t *key, uint32_t *block, uint32_t *res) {
40001688:	fd010113          	addi	sp,sp,-48
4000168c:	02112623          	sw	ra,44(sp)
40001690:	02812423          	sw	s0,40(sp)
40001694:	02912223          	sw	s1,36(sp)
40001698:	03010413          	addi	s0,sp,48
4000169c:	00050793          	mv	a5,a0
400016a0:	fcb42c23          	sw	a1,-40(s0)
400016a4:	fcc42a23          	sw	a2,-44(s0)
400016a8:	fcd42823          	sw	a3,-48(s0)
400016ac:	fcf40fa3          	sb	a5,-33(s0)
	aes_write(0x0,AES_ADDR_KEY_BASE +7);
400016b0:	01700593          	li	a1,23
400016b4:	00000513          	li	a0,0
400016b8:	ef5ff0ef          	jal	ra,400015ac <aes_write>
	aes_write(0x0,AES_ADDR_KEY_BASE +6);
400016bc:	01600593          	li	a1,22
400016c0:	00000513          	li	a0,0
400016c4:	ee9ff0ef          	jal	ra,400015ac <aes_write>
	aes_write(0x0,AES_ADDR_KEY_BASE +5);
400016c8:	01500593          	li	a1,21
400016cc:	00000513          	li	a0,0
400016d0:	eddff0ef          	jal	ra,400015ac <aes_write>
	aes_write(0x0,AES_ADDR_KEY_BASE +4);
400016d4:	01400593          	li	a1,20
400016d8:	00000513          	li	a0,0
400016dc:	ed1ff0ef          	jal	ra,400015ac <aes_write>
	aes_write(key[3],AES_ADDR_KEY_BASE +3);
400016e0:	fd842783          	lw	a5,-40(s0)
400016e4:	00c78793          	addi	a5,a5,12
400016e8:	0007a783          	lw	a5,0(a5)
400016ec:	01300593          	li	a1,19
400016f0:	00078513          	mv	a0,a5
400016f4:	eb9ff0ef          	jal	ra,400015ac <aes_write>
	aes_write(key[2],AES_ADDR_KEY_BASE +2);
400016f8:	fd842783          	lw	a5,-40(s0)
400016fc:	00878793          	addi	a5,a5,8
40001700:	0007a783          	lw	a5,0(a5)
40001704:	01200593          	li	a1,18
40001708:	00078513          	mv	a0,a5
4000170c:	ea1ff0ef          	jal	ra,400015ac <aes_write>
	aes_write(key[1],AES_ADDR_KEY_BASE +1);
40001710:	fd842783          	lw	a5,-40(s0)
40001714:	00478793          	addi	a5,a5,4
40001718:	0007a783          	lw	a5,0(a5)
4000171c:	01100593          	li	a1,17
40001720:	00078513          	mv	a0,a5
40001724:	e89ff0ef          	jal	ra,400015ac <aes_write>
	aes_write(key[0],AES_ADDR_KEY_BASE);
40001728:	fd842783          	lw	a5,-40(s0)
4000172c:	0007a783          	lw	a5,0(a5)
40001730:	01000593          	li	a1,16
40001734:	00078513          	mv	a0,a5
40001738:	e75ff0ef          	jal	ra,400015ac <aes_write>

	aes_write(AES_CONFIG_128_KEY,AES_ADDR_CONFIG);
4000173c:	00a00593          	li	a1,10
40001740:	00000513          	li	a0,0
40001744:	e69ff0ef          	jal	ra,400015ac <aes_write>
	aes_write(AES_CTRL_INIT_KEY,AES_ADDR_CTRL);
40001748:	00800593          	li	a1,8
4000174c:	00100513          	li	a0,1
40001750:	e5dff0ef          	jal	ra,400015ac <aes_write>

    while(aes_read(AES_ADDR_STATUS) == 0);
40001754:	00000013          	nop
40001758:	00900513          	li	a0,9
4000175c:	ec1ff0ef          	jal	ra,4000161c <aes_read>
40001760:	00050793          	mv	a5,a0
40001764:	fe078ae3          	beqz	a5,40001758 <aes_128_cipher+0xd0>

    aes_write(block[3],AES_ADDR_BLOCK_BASE + 3);
40001768:	fd442783          	lw	a5,-44(s0)
4000176c:	00c78793          	addi	a5,a5,12
40001770:	0007a783          	lw	a5,0(a5)
40001774:	02300593          	li	a1,35
40001778:	00078513          	mv	a0,a5
4000177c:	e31ff0ef          	jal	ra,400015ac <aes_write>
    aes_write(block[2],AES_ADDR_BLOCK_BASE + 2);
40001780:	fd442783          	lw	a5,-44(s0)
40001784:	00878793          	addi	a5,a5,8
40001788:	0007a783          	lw	a5,0(a5)
4000178c:	02200593          	li	a1,34
40001790:	00078513          	mv	a0,a5
40001794:	e19ff0ef          	jal	ra,400015ac <aes_write>
    aes_write(block[1],AES_ADDR_BLOCK_BASE + 1);
40001798:	fd442783          	lw	a5,-44(s0)
4000179c:	00478793          	addi	a5,a5,4
400017a0:	0007a783          	lw	a5,0(a5)
400017a4:	02100593          	li	a1,33
400017a8:	00078513          	mv	a0,a5
400017ac:	e01ff0ef          	jal	ra,400015ac <aes_write>
    aes_write(block[0],AES_ADDR_BLOCK_BASE + 0);
400017b0:	fd442783          	lw	a5,-44(s0)
400017b4:	0007a783          	lw	a5,0(a5)
400017b8:	02000593          	li	a1,32
400017bc:	00078513          	mv	a0,a5
400017c0:	dedff0ef          	jal	ra,400015ac <aes_write>


    unsigned char AES_CONFIG = 0x00;
400017c4:	fe0407a3          	sb	zero,-17(s0)
	if (operation == 0x01)
400017c8:	fdf44703          	lbu	a4,-33(s0)
400017cc:	00100793          	li	a5,1
400017d0:	00f71863          	bne	a4,a5,400017e0 <aes_128_cipher+0x158>
		AES_CONFIG = AES_CONFIG_128_EN;
400017d4:	00100793          	li	a5,1
400017d8:	fef407a3          	sb	a5,-17(s0)
400017dc:	0080006f          	j	400017e4 <aes_128_cipher+0x15c>
	else
		AES_CONFIG = AES_CONFIG_128_DE;
400017e0:	fe0407a3          	sb	zero,-17(s0)

	aes_write(AES_CONFIG,AES_ADDR_CONFIG);
400017e4:	fef44783          	lbu	a5,-17(s0)
400017e8:	00a00593          	li	a1,10
400017ec:	00078513          	mv	a0,a5
400017f0:	dbdff0ef          	jal	ra,400015ac <aes_write>
    aes_write(AES_CTRL_START, AES_ADDR_CTRL);
400017f4:	00800593          	li	a1,8
400017f8:	00200513          	li	a0,2
400017fc:	db1ff0ef          	jal	ra,400015ac <aes_write>

    while(aes_read(AES_ADDR_STATUS) == 0);
40001800:	00000013          	nop
40001804:	00900513          	li	a0,9
40001808:	e15ff0ef          	jal	ra,4000161c <aes_read>
4000180c:	00050793          	mv	a5,a0
40001810:	fe078ae3          	beqz	a5,40001804 <aes_128_cipher+0x17c>

    res[3] = aes_read(AES_ADDR_RESULT_BASE + 3);
40001814:	fd042783          	lw	a5,-48(s0)
40001818:	00c78493          	addi	s1,a5,12
4000181c:	03300513          	li	a0,51
40001820:	dfdff0ef          	jal	ra,4000161c <aes_read>
40001824:	00050793          	mv	a5,a0
40001828:	00f4a023          	sw	a5,0(s1)
    res[2] = aes_read(AES_ADDR_RESULT_BASE + 2);
4000182c:	fd042783          	lw	a5,-48(s0)
40001830:	00878493          	addi	s1,a5,8
40001834:	03200513          	li	a0,50
40001838:	de5ff0ef          	jal	ra,4000161c <aes_read>
4000183c:	00050793          	mv	a5,a0
40001840:	00f4a023          	sw	a5,0(s1)
    res[1] = aes_read(AES_ADDR_RESULT_BASE + 1);
40001844:	fd042783          	lw	a5,-48(s0)
40001848:	00478493          	addi	s1,a5,4
4000184c:	03100513          	li	a0,49
40001850:	dcdff0ef          	jal	ra,4000161c <aes_read>
40001854:	00050793          	mv	a5,a0
40001858:	00f4a023          	sw	a5,0(s1)
    res[0] = aes_read(AES_ADDR_RESULT_BASE + 0);
4000185c:	03000513          	li	a0,48
40001860:	dbdff0ef          	jal	ra,4000161c <aes_read>
40001864:	00050713          	mv	a4,a0
40001868:	fd042783          	lw	a5,-48(s0)
4000186c:	00e7a023          	sw	a4,0(a5)

    //print result to terminal
	if(operation == 0x1)
40001870:	fdf44703          	lbu	a4,-33(s0)
40001874:	00100793          	li	a5,1
40001878:	00f71a63          	bne	a4,a5,4000188c <aes_128_cipher+0x204>
		print("============================AES128 ENCRYPTTION==============================\r\n");
4000187c:	400037b7          	lui	a5,0x40003
40001880:	b5c78513          	addi	a0,a5,-1188 # 40002b5c <vga_simRes_h160_v120+0x20>
40001884:	53c000ef          	jal	ra,40001dc0 <print>
40001888:	0100006f          	j	40001898 <aes_128_cipher+0x210>
	else
		print("============================AES128 DECRYPTTION==============================\r\n");
4000188c:	400037b7          	lui	a5,0x40003
40001890:	bac78513          	addi	a0,a5,-1108 # 40002bac <vga_simRes_h160_v120+0x70>
40001894:	52c000ef          	jal	ra,40001dc0 <print>
	print128bit("\r\nPLAIN_TEXT (128-bit) : ", block);
40001898:	fd442583          	lw	a1,-44(s0)
4000189c:	400037b7          	lui	a5,0x40003
400018a0:	bfc78513          	addi	a0,a5,-1028 # 40002bfc <vga_simRes_h160_v120+0xc0>
400018a4:	7e8000ef          	jal	ra,4000208c <print128bit>
	print128bit("KEY (128-bit) : ", key);
400018a8:	fd842583          	lw	a1,-40(s0)
400018ac:	400037b7          	lui	a5,0x40003
400018b0:	c1878513          	addi	a0,a5,-1000 # 40002c18 <vga_simRes_h160_v120+0xdc>
400018b4:	7d8000ef          	jal	ra,4000208c <print128bit>
	print128bit("RESULT (128-bit) : ", res);
400018b8:	fd042583          	lw	a1,-48(s0)
400018bc:	400037b7          	lui	a5,0x40003
400018c0:	c2c78513          	addi	a0,a5,-980 # 40002c2c <vga_simRes_h160_v120+0xf0>
400018c4:	7c8000ef          	jal	ra,4000208c <print128bit>
	print("\r\n============================================================================\r\n");
400018c8:	400037b7          	lui	a5,0x40003
400018cc:	c4078513          	addi	a0,a5,-960 # 40002c40 <vga_simRes_h160_v120+0x104>
400018d0:	4f0000ef          	jal	ra,40001dc0 <print>
}
400018d4:	00000013          	nop
400018d8:	02c12083          	lw	ra,44(sp)
400018dc:	02812403          	lw	s0,40(sp)
400018e0:	02412483          	lw	s1,36(sp)
400018e4:	03010113          	addi	sp,sp,48
400018e8:	00008067          	ret

400018ec <aes_256_cipher>:

void aes_256_cipher(unsigned char operation, uint32_t *key, uint32_t *block, uint32_t *res) {
400018ec:	fd010113          	addi	sp,sp,-48
400018f0:	02112623          	sw	ra,44(sp)
400018f4:	02812423          	sw	s0,40(sp)
400018f8:	02912223          	sw	s1,36(sp)
400018fc:	03010413          	addi	s0,sp,48
40001900:	00050793          	mv	a5,a0
40001904:	fcb42c23          	sw	a1,-40(s0)
40001908:	fcc42a23          	sw	a2,-44(s0)
4000190c:	fcd42823          	sw	a3,-48(s0)
40001910:	fcf40fa3          	sb	a5,-33(s0)
	aes_write(key[7],AES_ADDR_KEY_BASE +7);
40001914:	fd842783          	lw	a5,-40(s0)
40001918:	01c78793          	addi	a5,a5,28
4000191c:	0007a783          	lw	a5,0(a5)
40001920:	01700593          	li	a1,23
40001924:	00078513          	mv	a0,a5
40001928:	c85ff0ef          	jal	ra,400015ac <aes_write>
	aes_write(key[6],AES_ADDR_KEY_BASE +6);
4000192c:	fd842783          	lw	a5,-40(s0)
40001930:	01878793          	addi	a5,a5,24
40001934:	0007a783          	lw	a5,0(a5)
40001938:	01600593          	li	a1,22
4000193c:	00078513          	mv	a0,a5
40001940:	c6dff0ef          	jal	ra,400015ac <aes_write>
	aes_write(key[5],AES_ADDR_KEY_BASE +5);
40001944:	fd842783          	lw	a5,-40(s0)
40001948:	01478793          	addi	a5,a5,20
4000194c:	0007a783          	lw	a5,0(a5)
40001950:	01500593          	li	a1,21
40001954:	00078513          	mv	a0,a5
40001958:	c55ff0ef          	jal	ra,400015ac <aes_write>
	aes_write(key[4],AES_ADDR_KEY_BASE +4);
4000195c:	fd842783          	lw	a5,-40(s0)
40001960:	01078793          	addi	a5,a5,16
40001964:	0007a783          	lw	a5,0(a5)
40001968:	01400593          	li	a1,20
4000196c:	00078513          	mv	a0,a5
40001970:	c3dff0ef          	jal	ra,400015ac <aes_write>
	aes_write(key[3],AES_ADDR_KEY_BASE +3);
40001974:	fd842783          	lw	a5,-40(s0)
40001978:	00c78793          	addi	a5,a5,12
4000197c:	0007a783          	lw	a5,0(a5)
40001980:	01300593          	li	a1,19
40001984:	00078513          	mv	a0,a5
40001988:	c25ff0ef          	jal	ra,400015ac <aes_write>
	aes_write(key[2],AES_ADDR_KEY_BASE +2);
4000198c:	fd842783          	lw	a5,-40(s0)
40001990:	00878793          	addi	a5,a5,8
40001994:	0007a783          	lw	a5,0(a5)
40001998:	01200593          	li	a1,18
4000199c:	00078513          	mv	a0,a5
400019a0:	c0dff0ef          	jal	ra,400015ac <aes_write>
	aes_write(key[1],AES_ADDR_KEY_BASE +1);
400019a4:	fd842783          	lw	a5,-40(s0)
400019a8:	00478793          	addi	a5,a5,4
400019ac:	0007a783          	lw	a5,0(a5)
400019b0:	01100593          	li	a1,17
400019b4:	00078513          	mv	a0,a5
400019b8:	bf5ff0ef          	jal	ra,400015ac <aes_write>
	aes_write(key[0],AES_ADDR_KEY_BASE);
400019bc:	fd842783          	lw	a5,-40(s0)
400019c0:	0007a783          	lw	a5,0(a5)
400019c4:	01000593          	li	a1,16
400019c8:	00078513          	mv	a0,a5
400019cc:	be1ff0ef          	jal	ra,400015ac <aes_write>

	aes_write(AES_CONFIG_256_KEY,AES_ADDR_CONFIG);
400019d0:	00a00593          	li	a1,10
400019d4:	00200513          	li	a0,2
400019d8:	bd5ff0ef          	jal	ra,400015ac <aes_write>
	aes_write(AES_CTRL_INIT_KEY,AES_ADDR_CTRL);
400019dc:	00800593          	li	a1,8
400019e0:	00100513          	li	a0,1
400019e4:	bc9ff0ef          	jal	ra,400015ac <aes_write>

    while(aes_read(AES_ADDR_STATUS) == 0);
400019e8:	00000013          	nop
400019ec:	00900513          	li	a0,9
400019f0:	c2dff0ef          	jal	ra,4000161c <aes_read>
400019f4:	00050793          	mv	a5,a0
400019f8:	fe078ae3          	beqz	a5,400019ec <aes_256_cipher+0x100>

    aes_write(block[3],AES_ADDR_BLOCK_BASE + 3);
400019fc:	fd442783          	lw	a5,-44(s0)
40001a00:	00c78793          	addi	a5,a5,12
40001a04:	0007a783          	lw	a5,0(a5)
40001a08:	02300593          	li	a1,35
40001a0c:	00078513          	mv	a0,a5
40001a10:	b9dff0ef          	jal	ra,400015ac <aes_write>
    aes_write(block[2],AES_ADDR_BLOCK_BASE + 2);
40001a14:	fd442783          	lw	a5,-44(s0)
40001a18:	00878793          	addi	a5,a5,8
40001a1c:	0007a783          	lw	a5,0(a5)
40001a20:	02200593          	li	a1,34
40001a24:	00078513          	mv	a0,a5
40001a28:	b85ff0ef          	jal	ra,400015ac <aes_write>
    aes_write(block[1],AES_ADDR_BLOCK_BASE + 1);
40001a2c:	fd442783          	lw	a5,-44(s0)
40001a30:	00478793          	addi	a5,a5,4
40001a34:	0007a783          	lw	a5,0(a5)
40001a38:	02100593          	li	a1,33
40001a3c:	00078513          	mv	a0,a5
40001a40:	b6dff0ef          	jal	ra,400015ac <aes_write>
    aes_write(block[0],AES_ADDR_BLOCK_BASE + 0);
40001a44:	fd442783          	lw	a5,-44(s0)
40001a48:	0007a783          	lw	a5,0(a5)
40001a4c:	02000593          	li	a1,32
40001a50:	00078513          	mv	a0,a5
40001a54:	b59ff0ef          	jal	ra,400015ac <aes_write>


    unsigned char AES_CONFIG = 0x00;
40001a58:	fe0407a3          	sb	zero,-17(s0)
	if (operation == 0x01)
40001a5c:	fdf44703          	lbu	a4,-33(s0)
40001a60:	00100793          	li	a5,1
40001a64:	00f71863          	bne	a4,a5,40001a74 <aes_256_cipher+0x188>
		AES_CONFIG = AES_CONFIG_256_EN;
40001a68:	00300793          	li	a5,3
40001a6c:	fef407a3          	sb	a5,-17(s0)
40001a70:	00c0006f          	j	40001a7c <aes_256_cipher+0x190>
	else
		AES_CONFIG = AES_CONFIG_256_DE;
40001a74:	00200793          	li	a5,2
40001a78:	fef407a3          	sb	a5,-17(s0)

	aes_write(AES_CONFIG, AES_ADDR_CONFIG);
40001a7c:	fef44783          	lbu	a5,-17(s0)
40001a80:	00a00593          	li	a1,10
40001a84:	00078513          	mv	a0,a5
40001a88:	b25ff0ef          	jal	ra,400015ac <aes_write>
    aes_write(AES_CTRL_START, AES_ADDR_CTRL);
40001a8c:	00800593          	li	a1,8
40001a90:	00200513          	li	a0,2
40001a94:	b19ff0ef          	jal	ra,400015ac <aes_write>

    while(aes_read(AES_ADDR_STATUS) == 0);
40001a98:	00000013          	nop
40001a9c:	00900513          	li	a0,9
40001aa0:	b7dff0ef          	jal	ra,4000161c <aes_read>
40001aa4:	00050793          	mv	a5,a0
40001aa8:	fe078ae3          	beqz	a5,40001a9c <aes_256_cipher+0x1b0>

    res[3] = aes_read(AES_ADDR_RESULT_BASE + 3);
40001aac:	fd042783          	lw	a5,-48(s0)
40001ab0:	00c78493          	addi	s1,a5,12
40001ab4:	03300513          	li	a0,51
40001ab8:	b65ff0ef          	jal	ra,4000161c <aes_read>
40001abc:	00050793          	mv	a5,a0
40001ac0:	00f4a023          	sw	a5,0(s1)
    res[2] = aes_read(AES_ADDR_RESULT_BASE + 2);
40001ac4:	fd042783          	lw	a5,-48(s0)
40001ac8:	00878493          	addi	s1,a5,8
40001acc:	03200513          	li	a0,50
40001ad0:	b4dff0ef          	jal	ra,4000161c <aes_read>
40001ad4:	00050793          	mv	a5,a0
40001ad8:	00f4a023          	sw	a5,0(s1)
    res[1] = aes_read(AES_ADDR_RESULT_BASE + 1);
40001adc:	fd042783          	lw	a5,-48(s0)
40001ae0:	00478493          	addi	s1,a5,4
40001ae4:	03100513          	li	a0,49
40001ae8:	b35ff0ef          	jal	ra,4000161c <aes_read>
40001aec:	00050793          	mv	a5,a0
40001af0:	00f4a023          	sw	a5,0(s1)
    res[0] = aes_read(AES_ADDR_RESULT_BASE + 0);
40001af4:	03000513          	li	a0,48
40001af8:	b25ff0ef          	jal	ra,4000161c <aes_read>
40001afc:	00050713          	mv	a4,a0
40001b00:	fd042783          	lw	a5,-48(s0)
40001b04:	00e7a023          	sw	a4,0(a5)

    //print result to terminal
	if(operation == 0x1)
40001b08:	fdf44703          	lbu	a4,-33(s0)
40001b0c:	00100793          	li	a5,1
40001b10:	00f71a63          	bne	a4,a5,40001b24 <aes_256_cipher+0x238>
		print("======================================AES256 ENCRYPTTION========================================\r\n");
40001b14:	400037b7          	lui	a5,0x40003
40001b18:	c9478513          	addi	a0,a5,-876 # 40002c94 <vga_simRes_h160_v120+0x158>
40001b1c:	2a4000ef          	jal	ra,40001dc0 <print>
40001b20:	0100006f          	j	40001b30 <aes_256_cipher+0x244>
	else
		print("======================================AES256 DECRYPTTION========================================\r\n");
40001b24:	400037b7          	lui	a5,0x40003
40001b28:	cf878513          	addi	a0,a5,-776 # 40002cf8 <vga_simRes_h160_v120+0x1bc>
40001b2c:	294000ef          	jal	ra,40001dc0 <print>
	print128bit("\r\nPLAIN_TEXT (128-bit) : ", block);
40001b30:	fd442583          	lw	a1,-44(s0)
40001b34:	400037b7          	lui	a5,0x40003
40001b38:	bfc78513          	addi	a0,a5,-1028 # 40002bfc <vga_simRes_h160_v120+0xc0>
40001b3c:	550000ef          	jal	ra,4000208c <print128bit>
	print256bit("KEY (256-bit) : ", key);
40001b40:	fd842583          	lw	a1,-40(s0)
40001b44:	400037b7          	lui	a5,0x40003
40001b48:	d5c78513          	addi	a0,a5,-676 # 40002d5c <vga_simRes_h160_v120+0x220>
40001b4c:	644000ef          	jal	ra,40002190 <print256bit>
	print128bit("RESULT (128-bit) : ", res);
40001b50:	fd042583          	lw	a1,-48(s0)
40001b54:	400037b7          	lui	a5,0x40003
40001b58:	c2c78513          	addi	a0,a5,-980 # 40002c2c <vga_simRes_h160_v120+0xf0>
40001b5c:	530000ef          	jal	ra,4000208c <print128bit>
	print("\r\n================================================================================================\r\n");
40001b60:	400037b7          	lui	a5,0x40003
40001b64:	d7078513          	addi	a0,a5,-656 # 40002d70 <vga_simRes_h160_v120+0x234>
40001b68:	258000ef          	jal	ra,40001dc0 <print>

}
40001b6c:	00000013          	nop
40001b70:	02c12083          	lw	ra,44(sp)
40001b74:	02812403          	lw	s0,40(sp)
40001b78:	02412483          	lw	s1,36(sp)
40001b7c:	03010113          	addi	sp,sp,48
40001b80:	00008067          	ret

40001b84 <timer_init>:
static void timer_init(Timer_Reg *reg){
40001b84:	fe010113          	addi	sp,sp,-32
40001b88:	00812e23          	sw	s0,28(sp)
40001b8c:	02010413          	addi	s0,sp,32
40001b90:	fea42623          	sw	a0,-20(s0)
	reg->CLEARS_TICKS  = 0;
40001b94:	fec42783          	lw	a5,-20(s0)
40001b98:	0007a023          	sw	zero,0(a5)
	reg->VALUE = 0;
40001b9c:	fec42783          	lw	a5,-20(s0)
40001ba0:	0007a423          	sw	zero,8(a5)
}
40001ba4:	00000013          	nop
40001ba8:	01c12403          	lw	s0,28(sp)
40001bac:	02010113          	addi	sp,sp,32
40001bb0:	00008067          	ret

40001bb4 <prescaler_init>:
static void prescaler_init(Prescaler_Reg* reg){
40001bb4:	fe010113          	addi	sp,sp,-32
40001bb8:	00812e23          	sw	s0,28(sp)
40001bbc:	02010413          	addi	s0,sp,32
40001bc0:	fea42623          	sw	a0,-20(s0)
}
40001bc4:	00000013          	nop
40001bc8:	01c12403          	lw	s0,28(sp)
40001bcc:	02010113          	addi	sp,sp,32
40001bd0:	00008067          	ret

40001bd4 <interruptCtrl_init>:
static void interruptCtrl_init(InterruptCtrl_Reg* reg){
40001bd4:	fe010113          	addi	sp,sp,-32
40001bd8:	00812e23          	sw	s0,28(sp)
40001bdc:	02010413          	addi	s0,sp,32
40001be0:	fea42623          	sw	a0,-20(s0)
	reg->MASKS = 0;
40001be4:	fec42783          	lw	a5,-20(s0)
40001be8:	0007a223          	sw	zero,4(a5)
	reg->PENDINGS = 0xFFFFFFFF;
40001bec:	fec42783          	lw	a5,-20(s0)
40001bf0:	fff00713          	li	a4,-1
40001bf4:	00e7a023          	sw	a4,0(a5)
}
40001bf8:	00000013          	nop
40001bfc:	01c12403          	lw	s0,28(sp)
40001c00:	02010113          	addi	sp,sp,32
40001c04:	00008067          	ret

40001c08 <uart_writeAvailability>:
static uint32_t uart_writeAvailability(Uart_Reg *reg){
40001c08:	fe010113          	addi	sp,sp,-32
40001c0c:	00812e23          	sw	s0,28(sp)
40001c10:	02010413          	addi	s0,sp,32
40001c14:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS >> 16) & 0xFF;
40001c18:	fec42783          	lw	a5,-20(s0)
40001c1c:	0047a783          	lw	a5,4(a5)
40001c20:	0107d793          	srli	a5,a5,0x10
40001c24:	0ff7f793          	zext.b	a5,a5
}
40001c28:	00078513          	mv	a0,a5
40001c2c:	01c12403          	lw	s0,28(sp)
40001c30:	02010113          	addi	sp,sp,32
40001c34:	00008067          	ret

40001c38 <uart_readOccupancy>:
static uint32_t uart_readOccupancy(Uart_Reg *reg){
40001c38:	fe010113          	addi	sp,sp,-32
40001c3c:	00812e23          	sw	s0,28(sp)
40001c40:	02010413          	addi	s0,sp,32
40001c44:	fea42623          	sw	a0,-20(s0)
	return reg->STATUS >> 24;
40001c48:	fec42783          	lw	a5,-20(s0)
40001c4c:	0047a783          	lw	a5,4(a5)
40001c50:	0187d793          	srli	a5,a5,0x18
}
40001c54:	00078513          	mv	a0,a5
40001c58:	01c12403          	lw	s0,28(sp)
40001c5c:	02010113          	addi	sp,sp,32
40001c60:	00008067          	ret

40001c64 <uart_write>:
static void uart_write(Uart_Reg *reg, uint32_t data){
40001c64:	fe010113          	addi	sp,sp,-32
40001c68:	00112e23          	sw	ra,28(sp)
40001c6c:	00812c23          	sw	s0,24(sp)
40001c70:	02010413          	addi	s0,sp,32
40001c74:	fea42623          	sw	a0,-20(s0)
40001c78:	feb42423          	sw	a1,-24(s0)
	while(uart_writeAvailability(reg) == 0);
40001c7c:	00000013          	nop
40001c80:	fec42503          	lw	a0,-20(s0)
40001c84:	f85ff0ef          	jal	ra,40001c08 <uart_writeAvailability>
40001c88:	00050793          	mv	a5,a0
40001c8c:	fe078ae3          	beqz	a5,40001c80 <uart_write+0x1c>
	reg->DATA = data;
40001c90:	fec42783          	lw	a5,-20(s0)
40001c94:	fe842703          	lw	a4,-24(s0)
40001c98:	00e7a023          	sw	a4,0(a5)
}
40001c9c:	00000013          	nop
40001ca0:	01c12083          	lw	ra,28(sp)
40001ca4:	01812403          	lw	s0,24(sp)
40001ca8:	02010113          	addi	sp,sp,32
40001cac:	00008067          	ret

40001cb0 <uart_applyConfig>:
static void uart_applyConfig(Uart_Reg *reg, Uart_Config *config){
40001cb0:	fe010113          	addi	sp,sp,-32
40001cb4:	00812e23          	sw	s0,28(sp)
40001cb8:	02010413          	addi	s0,sp,32
40001cbc:	fea42623          	sw	a0,-20(s0)
40001cc0:	feb42423          	sw	a1,-24(s0)
	reg->CLOCK_DIVIDER = config->clockDivider;
40001cc4:	fe842783          	lw	a5,-24(s0)
40001cc8:	00c7a703          	lw	a4,12(a5)
40001ccc:	fec42783          	lw	a5,-20(s0)
40001cd0:	00e7a423          	sw	a4,8(a5)
	reg->FRAME_CONFIG = ((config->dataLength-1) << 0) | (config->parity << 8) | (config->stop << 16);
40001cd4:	fe842783          	lw	a5,-24(s0)
40001cd8:	0007a783          	lw	a5,0(a5)
40001cdc:	fff78713          	addi	a4,a5,-1
40001ce0:	fe842783          	lw	a5,-24(s0)
40001ce4:	0047a783          	lw	a5,4(a5)
40001ce8:	00879793          	slli	a5,a5,0x8
40001cec:	00f76733          	or	a4,a4,a5
40001cf0:	fe842783          	lw	a5,-24(s0)
40001cf4:	0087a783          	lw	a5,8(a5)
40001cf8:	01079793          	slli	a5,a5,0x10
40001cfc:	00f76733          	or	a4,a4,a5
40001d00:	fec42783          	lw	a5,-20(s0)
40001d04:	00e7a623          	sw	a4,12(a5)
}
40001d08:	00000013          	nop
40001d0c:	01c12403          	lw	s0,28(sp)
40001d10:	02010113          	addi	sp,sp,32
40001d14:	00008067          	ret

40001d18 <vga_isBusy>:
static uint32_t vga_isBusy(Vga_Reg *reg){
40001d18:	fe010113          	addi	sp,sp,-32
40001d1c:	00812e23          	sw	s0,28(sp)
40001d20:	02010413          	addi	s0,sp,32
40001d24:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS & 2) != 0;
40001d28:	fec42783          	lw	a5,-20(s0)
40001d2c:	0007a783          	lw	a5,0(a5)
40001d30:	0027f793          	andi	a5,a5,2
40001d34:	00f037b3          	snez	a5,a5
40001d38:	0ff7f793          	zext.b	a5,a5
}
40001d3c:	00078513          	mv	a0,a5
40001d40:	01c12403          	lw	s0,28(sp)
40001d44:	02010113          	addi	sp,sp,32
40001d48:	00008067          	ret

40001d4c <vga_run>:
static void vga_run(Vga_Reg *reg){
40001d4c:	fe010113          	addi	sp,sp,-32
40001d50:	00812e23          	sw	s0,28(sp)
40001d54:	02010413          	addi	s0,sp,32
40001d58:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 1;
40001d5c:	fec42783          	lw	a5,-20(s0)
40001d60:	00100713          	li	a4,1
40001d64:	00e7a023          	sw	a4,0(a5)
}
40001d68:	00000013          	nop
40001d6c:	01c12403          	lw	s0,28(sp)
40001d70:	02010113          	addi	sp,sp,32
40001d74:	00008067          	ret

40001d78 <vga_stop>:
static void vga_stop(Vga_Reg *reg){
40001d78:	fe010113          	addi	sp,sp,-32
40001d7c:	00112e23          	sw	ra,28(sp)
40001d80:	00812c23          	sw	s0,24(sp)
40001d84:	02010413          	addi	s0,sp,32
40001d88:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 0;
40001d8c:	fec42783          	lw	a5,-20(s0)
40001d90:	0007a023          	sw	zero,0(a5)
	while(vga_isBusy(reg));
40001d94:	00000013          	nop
40001d98:	fec42503          	lw	a0,-20(s0)
40001d9c:	f7dff0ef          	jal	ra,40001d18 <vga_isBusy>
40001da0:	00050793          	mv	a5,a0
40001da4:	fe079ae3          	bnez	a5,40001d98 <vga_stop+0x20>
}
40001da8:	00000013          	nop
40001dac:	00000013          	nop
40001db0:	01c12083          	lw	ra,28(sp)
40001db4:	01812403          	lw	s0,24(sp)
40001db8:	02010113          	addi	sp,sp,32
40001dbc:	00008067          	ret

40001dc0 <print>:
#include <briey.h>

void print(char *str){
40001dc0:	fe010113          	addi	sp,sp,-32
40001dc4:	00112e23          	sw	ra,28(sp)
40001dc8:	00812c23          	sw	s0,24(sp)
40001dcc:	02010413          	addi	s0,sp,32
40001dd0:	fea42623          	sw	a0,-20(s0)
	while(*str){
40001dd4:	0200006f          	j	40001df4 <print+0x34>
		uart_write(UART,*(str++));
40001dd8:	fec42783          	lw	a5,-20(s0)
40001ddc:	00178713          	addi	a4,a5,1
40001de0:	fee42623          	sw	a4,-20(s0)
40001de4:	0007c783          	lbu	a5,0(a5)
40001de8:	00078593          	mv	a1,a5
40001dec:	f0010537          	lui	a0,0xf0010
40001df0:	e75ff0ef          	jal	ra,40001c64 <uart_write>
	while(*str){
40001df4:	fec42783          	lw	a5,-20(s0)
40001df8:	0007c783          	lbu	a5,0(a5)
40001dfc:	fc079ee3          	bnez	a5,40001dd8 <print+0x18>
	}
}
40001e00:	00000013          	nop
40001e04:	00000013          	nop
40001e08:	01c12083          	lw	ra,28(sp)
40001e0c:	01812403          	lw	s0,24(sp)
40001e10:	02010113          	addi	sp,sp,32
40001e14:	00008067          	ret

40001e18 <print16bit>:

void print16bit(uint32_t n)
{
40001e18:	fc010113          	addi	sp,sp,-64
40001e1c:	02112e23          	sw	ra,60(sp)
40001e20:	02812c23          	sw	s0,56(sp)
40001e24:	04010413          	addi	s0,sp,64
40001e28:	fca42623          	sw	a0,-52(s0)

    int i = 0;
40001e2c:	fe042623          	sw	zero,-20(s0)
    char outbuf_inv[8]="";
40001e30:	fc042e23          	sw	zero,-36(s0)
40001e34:	fe042023          	sw	zero,-32(s0)
    do{
    	outbuf_inv[i] = "0123456789abcdef"[n % 16];
40001e38:	fcc42783          	lw	a5,-52(s0)
40001e3c:	00f7f793          	andi	a5,a5,15
40001e40:	40003737          	lui	a4,0x40003
40001e44:	e3c70713          	addi	a4,a4,-452 # 40002e3c <vga_simRes_h160_v120+0x24>
40001e48:	00f707b3          	add	a5,a4,a5
40001e4c:	0007c703          	lbu	a4,0(a5)
40001e50:	fec42783          	lw	a5,-20(s0)
40001e54:	ff040693          	addi	a3,s0,-16
40001e58:	00f687b3          	add	a5,a3,a5
40001e5c:	fee78623          	sb	a4,-20(a5)
        i++;
40001e60:	fec42783          	lw	a5,-20(s0)
40001e64:	00178793          	addi	a5,a5,1
40001e68:	fef42623          	sw	a5,-20(s0)
        n = n/16;
40001e6c:	fcc42783          	lw	a5,-52(s0)
40001e70:	0047d793          	srli	a5,a5,0x4
40001e74:	fcf42623          	sw	a5,-52(s0)
    }while( n > 0);
40001e78:	fcc42783          	lw	a5,-52(s0)
40001e7c:	fa079ee3          	bnez	a5,40001e38 <print16bit+0x20>
    if(i<8) {
40001e80:	fec42703          	lw	a4,-20(s0)
40001e84:	00700793          	li	a5,7
40001e88:	02e7ce63          	blt	a5,a4,40001ec4 <print16bit+0xac>
    	for(int j=7;j>=i;j--){
40001e8c:	00700793          	li	a5,7
40001e90:	fef42423          	sw	a5,-24(s0)
40001e94:	0240006f          	j	40001eb8 <print16bit+0xa0>
    		outbuf_inv[j]="0"[0];
40001e98:	03000713          	li	a4,48
40001e9c:	fe842783          	lw	a5,-24(s0)
40001ea0:	ff040693          	addi	a3,s0,-16
40001ea4:	00f687b3          	add	a5,a3,a5
40001ea8:	fee78623          	sb	a4,-20(a5)
    	for(int j=7;j>=i;j--){
40001eac:	fe842783          	lw	a5,-24(s0)
40001eb0:	fff78793          	addi	a5,a5,-1
40001eb4:	fef42423          	sw	a5,-24(s0)
40001eb8:	fe842703          	lw	a4,-24(s0)
40001ebc:	fec42783          	lw	a5,-20(s0)
40001ec0:	fcf75ce3          	bge	a4,a5,40001e98 <print16bit+0x80>
    	}
    }
    for(int j=3;j>=0;j--)
40001ec4:	00300793          	li	a5,3
40001ec8:	fef42223          	sw	a5,-28(s0)
40001ecc:	02c0006f          	j	40001ef8 <print16bit+0xe0>
    {
    	uart_write(UART,outbuf_inv[j]);
40001ed0:	fe442783          	lw	a5,-28(s0)
40001ed4:	ff040713          	addi	a4,s0,-16
40001ed8:	00f707b3          	add	a5,a4,a5
40001edc:	fec7c783          	lbu	a5,-20(a5)
40001ee0:	00078593          	mv	a1,a5
40001ee4:	f0010537          	lui	a0,0xf0010
40001ee8:	d7dff0ef          	jal	ra,40001c64 <uart_write>
    for(int j=3;j>=0;j--)
40001eec:	fe442783          	lw	a5,-28(s0)
40001ef0:	fff78793          	addi	a5,a5,-1
40001ef4:	fef42223          	sw	a5,-28(s0)
40001ef8:	fe442783          	lw	a5,-28(s0)
40001efc:	fc07dae3          	bgez	a5,40001ed0 <print16bit+0xb8>
    }
    print(" ");
40001f00:	400037b7          	lui	a5,0x40003
40001f04:	e3878513          	addi	a0,a5,-456 # 40002e38 <vga_simRes_h160_v120+0x20>
40001f08:	eb9ff0ef          	jal	ra,40001dc0 <print>
}
40001f0c:	00000013          	nop
40001f10:	03c12083          	lw	ra,60(sp)
40001f14:	03812403          	lw	s0,56(sp)
40001f18:	04010113          	addi	sp,sp,64
40001f1c:	00008067          	ret

40001f20 <print32bit>:
void print32bit(uint32_t n)
{
40001f20:	fc010113          	addi	sp,sp,-64
40001f24:	02112e23          	sw	ra,60(sp)
40001f28:	02812c23          	sw	s0,56(sp)
40001f2c:	04010413          	addi	s0,sp,64
40001f30:	fca42623          	sw	a0,-52(s0)

    int i = 0;
40001f34:	fe042623          	sw	zero,-20(s0)
    char outbuf_inv[8]="";
40001f38:	fc042e23          	sw	zero,-36(s0)
40001f3c:	fe042023          	sw	zero,-32(s0)
    do{
    	outbuf_inv[i] = "0123456789abcdef"[n % 16];
40001f40:	fcc42783          	lw	a5,-52(s0)
40001f44:	00f7f793          	andi	a5,a5,15
40001f48:	40003737          	lui	a4,0x40003
40001f4c:	e3c70713          	addi	a4,a4,-452 # 40002e3c <vga_simRes_h160_v120+0x24>
40001f50:	00f707b3          	add	a5,a4,a5
40001f54:	0007c703          	lbu	a4,0(a5)
40001f58:	fec42783          	lw	a5,-20(s0)
40001f5c:	ff040693          	addi	a3,s0,-16
40001f60:	00f687b3          	add	a5,a3,a5
40001f64:	fee78623          	sb	a4,-20(a5)
        i++;
40001f68:	fec42783          	lw	a5,-20(s0)
40001f6c:	00178793          	addi	a5,a5,1
40001f70:	fef42623          	sw	a5,-20(s0)
        n = n/16;
40001f74:	fcc42783          	lw	a5,-52(s0)
40001f78:	0047d793          	srli	a5,a5,0x4
40001f7c:	fcf42623          	sw	a5,-52(s0)
    }while( n > 0);
40001f80:	fcc42783          	lw	a5,-52(s0)
40001f84:	fa079ee3          	bnez	a5,40001f40 <print32bit+0x20>
    if(i<8) {
40001f88:	fec42703          	lw	a4,-20(s0)
40001f8c:	00700793          	li	a5,7
40001f90:	02e7ce63          	blt	a5,a4,40001fcc <print32bit+0xac>
    	for(int j=7;j>=i;j--){
40001f94:	00700793          	li	a5,7
40001f98:	fef42423          	sw	a5,-24(s0)
40001f9c:	0240006f          	j	40001fc0 <print32bit+0xa0>
    		outbuf_inv[j]="0"[0];
40001fa0:	03000713          	li	a4,48
40001fa4:	fe842783          	lw	a5,-24(s0)
40001fa8:	ff040693          	addi	a3,s0,-16
40001fac:	00f687b3          	add	a5,a3,a5
40001fb0:	fee78623          	sb	a4,-20(a5)
    	for(int j=7;j>=i;j--){
40001fb4:	fe842783          	lw	a5,-24(s0)
40001fb8:	fff78793          	addi	a5,a5,-1
40001fbc:	fef42423          	sw	a5,-24(s0)
40001fc0:	fe842703          	lw	a4,-24(s0)
40001fc4:	fec42783          	lw	a5,-20(s0)
40001fc8:	fcf75ce3          	bge	a4,a5,40001fa0 <print32bit+0x80>
    	}
    }
    for(int j=7;j>=0;j--)
40001fcc:	00700793          	li	a5,7
40001fd0:	fef42223          	sw	a5,-28(s0)
40001fd4:	02c0006f          	j	40002000 <print32bit+0xe0>
    {
    	uart_write(UART,outbuf_inv[j]);
40001fd8:	fe442783          	lw	a5,-28(s0)
40001fdc:	ff040713          	addi	a4,s0,-16
40001fe0:	00f707b3          	add	a5,a4,a5
40001fe4:	fec7c783          	lbu	a5,-20(a5)
40001fe8:	00078593          	mv	a1,a5
40001fec:	f0010537          	lui	a0,0xf0010
40001ff0:	c75ff0ef          	jal	ra,40001c64 <uart_write>
    for(int j=7;j>=0;j--)
40001ff4:	fe442783          	lw	a5,-28(s0)
40001ff8:	fff78793          	addi	a5,a5,-1
40001ffc:	fef42223          	sw	a5,-28(s0)
40002000:	fe442783          	lw	a5,-28(s0)
40002004:	fc07dae3          	bgez	a5,40001fd8 <print32bit+0xb8>
    }
    print(" ");
40002008:	400037b7          	lui	a5,0x40003
4000200c:	e3878513          	addi	a0,a5,-456 # 40002e38 <vga_simRes_h160_v120+0x20>
40002010:	db1ff0ef          	jal	ra,40001dc0 <print>
}
40002014:	00000013          	nop
40002018:	03c12083          	lw	ra,60(sp)
4000201c:	03812403          	lw	s0,56(sp)
40002020:	04010113          	addi	sp,sp,64
40002024:	00008067          	ret

40002028 <print64bit>:

void print64bit(char *message,uint32_t *num)
{
40002028:	fe010113          	addi	sp,sp,-32
4000202c:	00112e23          	sw	ra,28(sp)
40002030:	00812c23          	sw	s0,24(sp)
40002034:	02010413          	addi	s0,sp,32
40002038:	fea42623          	sw	a0,-20(s0)
4000203c:	feb42423          	sw	a1,-24(s0)
	print(message);
40002040:	fec42503          	lw	a0,-20(s0)
40002044:	d7dff0ef          	jal	ra,40001dc0 <print>
	print32bit(num[1]);
40002048:	fe842783          	lw	a5,-24(s0)
4000204c:	00478793          	addi	a5,a5,4
40002050:	0007a783          	lw	a5,0(a5)
40002054:	00078513          	mv	a0,a5
40002058:	ec9ff0ef          	jal	ra,40001f20 <print32bit>
	print32bit(num[0]);
4000205c:	fe842783          	lw	a5,-24(s0)
40002060:	0007a783          	lw	a5,0(a5)
40002064:	00078513          	mv	a0,a5
40002068:	eb9ff0ef          	jal	ra,40001f20 <print32bit>
	print("\r\n");
4000206c:	400037b7          	lui	a5,0x40003
40002070:	e5078513          	addi	a0,a5,-432 # 40002e50 <vga_simRes_h160_v120+0x38>
40002074:	d4dff0ef          	jal	ra,40001dc0 <print>
}
40002078:	00000013          	nop
4000207c:	01c12083          	lw	ra,28(sp)
40002080:	01812403          	lw	s0,24(sp)
40002084:	02010113          	addi	sp,sp,32
40002088:	00008067          	ret

4000208c <print128bit>:
void print128bit(char *message, uint32_t *num)
{
4000208c:	fe010113          	addi	sp,sp,-32
40002090:	00112e23          	sw	ra,28(sp)
40002094:	00812c23          	sw	s0,24(sp)
40002098:	02010413          	addi	s0,sp,32
4000209c:	fea42623          	sw	a0,-20(s0)
400020a0:	feb42423          	sw	a1,-24(s0)
	print(message);
400020a4:	fec42503          	lw	a0,-20(s0)
400020a8:	d19ff0ef          	jal	ra,40001dc0 <print>
	print32bit(num[3]);
400020ac:	fe842783          	lw	a5,-24(s0)
400020b0:	00c78793          	addi	a5,a5,12
400020b4:	0007a783          	lw	a5,0(a5)
400020b8:	00078513          	mv	a0,a5
400020bc:	e65ff0ef          	jal	ra,40001f20 <print32bit>
	print32bit(num[2]);
400020c0:	fe842783          	lw	a5,-24(s0)
400020c4:	00878793          	addi	a5,a5,8
400020c8:	0007a783          	lw	a5,0(a5)
400020cc:	00078513          	mv	a0,a5
400020d0:	e51ff0ef          	jal	ra,40001f20 <print32bit>
	print32bit(num[1]);
400020d4:	fe842783          	lw	a5,-24(s0)
400020d8:	00478793          	addi	a5,a5,4
400020dc:	0007a783          	lw	a5,0(a5)
400020e0:	00078513          	mv	a0,a5
400020e4:	e3dff0ef          	jal	ra,40001f20 <print32bit>
	print32bit(num[0]);
400020e8:	fe842783          	lw	a5,-24(s0)
400020ec:	0007a783          	lw	a5,0(a5)
400020f0:	00078513          	mv	a0,a5
400020f4:	e2dff0ef          	jal	ra,40001f20 <print32bit>
	print("\r\n");
400020f8:	400037b7          	lui	a5,0x40003
400020fc:	e5078513          	addi	a0,a5,-432 # 40002e50 <vga_simRes_h160_v120+0x38>
40002100:	cc1ff0ef          	jal	ra,40001dc0 <print>
}
40002104:	00000013          	nop
40002108:	01c12083          	lw	ra,28(sp)
4000210c:	01812403          	lw	s0,24(sp)
40002110:	02010113          	addi	sp,sp,32
40002114:	00008067          	ret

40002118 <print80bit>:
void print80bit(char *message,uint32_t *num)
{
40002118:	fe010113          	addi	sp,sp,-32
4000211c:	00112e23          	sw	ra,28(sp)
40002120:	00812c23          	sw	s0,24(sp)
40002124:	02010413          	addi	s0,sp,32
40002128:	fea42623          	sw	a0,-20(s0)
4000212c:	feb42423          	sw	a1,-24(s0)
	print(message);
40002130:	fec42503          	lw	a0,-20(s0)
40002134:	c8dff0ef          	jal	ra,40001dc0 <print>
	print32bit(num[2]);
40002138:	fe842783          	lw	a5,-24(s0)
4000213c:	00878793          	addi	a5,a5,8
40002140:	0007a783          	lw	a5,0(a5)
40002144:	00078513          	mv	a0,a5
40002148:	dd9ff0ef          	jal	ra,40001f20 <print32bit>
	print32bit(num[1]);
4000214c:	fe842783          	lw	a5,-24(s0)
40002150:	00478793          	addi	a5,a5,4
40002154:	0007a783          	lw	a5,0(a5)
40002158:	00078513          	mv	a0,a5
4000215c:	dc5ff0ef          	jal	ra,40001f20 <print32bit>
	print16bit(num[0]);
40002160:	fe842783          	lw	a5,-24(s0)
40002164:	0007a783          	lw	a5,0(a5)
40002168:	00078513          	mv	a0,a5
4000216c:	cadff0ef          	jal	ra,40001e18 <print16bit>
	print("\r\n");
40002170:	400037b7          	lui	a5,0x40003
40002174:	e5078513          	addi	a0,a5,-432 # 40002e50 <vga_simRes_h160_v120+0x38>
40002178:	c49ff0ef          	jal	ra,40001dc0 <print>
}
4000217c:	00000013          	nop
40002180:	01c12083          	lw	ra,28(sp)
40002184:	01812403          	lw	s0,24(sp)
40002188:	02010113          	addi	sp,sp,32
4000218c:	00008067          	ret

40002190 <print256bit>:
void print256bit(char *message, uint32_t *num)
{
40002190:	fe010113          	addi	sp,sp,-32
40002194:	00112e23          	sw	ra,28(sp)
40002198:	00812c23          	sw	s0,24(sp)
4000219c:	02010413          	addi	s0,sp,32
400021a0:	fea42623          	sw	a0,-20(s0)
400021a4:	feb42423          	sw	a1,-24(s0)
	print(message);
400021a8:	fec42503          	lw	a0,-20(s0)
400021ac:	c15ff0ef          	jal	ra,40001dc0 <print>
	print32bit(num[7]);
400021b0:	fe842783          	lw	a5,-24(s0)
400021b4:	01c78793          	addi	a5,a5,28
400021b8:	0007a783          	lw	a5,0(a5)
400021bc:	00078513          	mv	a0,a5
400021c0:	d61ff0ef          	jal	ra,40001f20 <print32bit>
	print32bit(num[6]);
400021c4:	fe842783          	lw	a5,-24(s0)
400021c8:	01878793          	addi	a5,a5,24
400021cc:	0007a783          	lw	a5,0(a5)
400021d0:	00078513          	mv	a0,a5
400021d4:	d4dff0ef          	jal	ra,40001f20 <print32bit>
	print32bit(num[5]);
400021d8:	fe842783          	lw	a5,-24(s0)
400021dc:	01478793          	addi	a5,a5,20
400021e0:	0007a783          	lw	a5,0(a5)
400021e4:	00078513          	mv	a0,a5
400021e8:	d39ff0ef          	jal	ra,40001f20 <print32bit>
	print32bit(num[4]);
400021ec:	fe842783          	lw	a5,-24(s0)
400021f0:	01078793          	addi	a5,a5,16
400021f4:	0007a783          	lw	a5,0(a5)
400021f8:	00078513          	mv	a0,a5
400021fc:	d25ff0ef          	jal	ra,40001f20 <print32bit>
	print32bit(num[3]);
40002200:	fe842783          	lw	a5,-24(s0)
40002204:	00c78793          	addi	a5,a5,12
40002208:	0007a783          	lw	a5,0(a5)
4000220c:	00078513          	mv	a0,a5
40002210:	d11ff0ef          	jal	ra,40001f20 <print32bit>
	print32bit(num[2]);
40002214:	fe842783          	lw	a5,-24(s0)
40002218:	00878793          	addi	a5,a5,8
4000221c:	0007a783          	lw	a5,0(a5)
40002220:	00078513          	mv	a0,a5
40002224:	cfdff0ef          	jal	ra,40001f20 <print32bit>
	print32bit(num[1]);
40002228:	fe842783          	lw	a5,-24(s0)
4000222c:	00478793          	addi	a5,a5,4
40002230:	0007a783          	lw	a5,0(a5)
40002234:	00078513          	mv	a0,a5
40002238:	ce9ff0ef          	jal	ra,40001f20 <print32bit>
	print32bit(num[0]);
4000223c:	fe842783          	lw	a5,-24(s0)
40002240:	0007a783          	lw	a5,0(a5)
40002244:	00078513          	mv	a0,a5
40002248:	cd9ff0ef          	jal	ra,40001f20 <print32bit>
	print("\r\n");
4000224c:	400037b7          	lui	a5,0x40003
40002250:	e5078513          	addi	a0,a5,-432 # 40002e50 <vga_simRes_h160_v120+0x38>
40002254:	b6dff0ef          	jal	ra,40001dc0 <print>
}
40002258:	00000013          	nop
4000225c:	01c12083          	lw	ra,28(sp)
40002260:	01812403          	lw	s0,24(sp)
40002264:	02010113          	addi	sp,sp,32
40002268:	00008067          	ret
