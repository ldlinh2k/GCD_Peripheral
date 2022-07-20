
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
80000068:	d38080e7          	jalr	-712(ra) # 40000d9c <irqCallback>
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
800000b8:	49c18193          	addi	gp,gp,1180 # 40003550 <__global_pointer$>
  .option pop
  la sp, _stack_start
800000bc:	00001117          	auipc	sp,0x1
800000c0:	88410113          	addi	sp,sp,-1916 # 80000940 <_stack_start>

800000c4 <bss_init>:

bss_init:
  la a0, _bss_start
800000c4:	c0003517          	auipc	a0,0xc0003
800000c8:	c8c50513          	addi	a0,a0,-884 # 40002d50 <_bss_end>
  la a1, _bss_end
800000cc:	c0003597          	auipc	a1,0xc0003
800000d0:	c8458593          	addi	a1,a1,-892 # 40002d50 <_bss_end>

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
800000e8:	c6c50513          	addi	a0,a0,-916 # 40002d50 <_bss_end>
  addi sp,sp,-4
800000ec:	ffc10113          	addi	sp,sp,-4

800000f0 <ctors_loop>:
ctors_loop:
  la a1, _ctors_end
800000f0:	c0003597          	auipc	a1,0xc0003
800000f4:	c6058593          	addi	a1,a1,-928 # 40002d50 <_bss_end>
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
40000404:	1c878513          	addi	a0,a5,456 # 400021c8 <vga_simRes_h160_v120+0x20>
40000408:	0b5010ef          	jal	ra,40001cbc <print>
4000040c:	0100006f          	j	4000041c <prince_cipher+0x12c>
		else
			print("=============================PRINCE DECRYPTTION=============================\r\n");
40000410:	400027b7          	lui	a5,0x40002
40000414:	21878513          	addi	a0,a5,536 # 40002218 <vga_simRes_h160_v120+0x70>
40000418:	0a5010ef          	jal	ra,40001cbc <print>
		print("\r\n");
4000041c:	400027b7          	lui	a5,0x40002
40000420:	26878513          	addi	a0,a5,616 # 40002268 <vga_simRes_h160_v120+0xc0>
40000424:	099010ef          	jal	ra,40001cbc <print>
		print64bit("PLAIN_TEXT (64-bit) : ", block);
40000428:	fe442583          	lw	a1,-28(s0)
4000042c:	400027b7          	lui	a5,0x40002
40000430:	26c78513          	addi	a0,a5,620 # 4000226c <vga_simRes_h160_v120+0xc4>
40000434:	2f1010ef          	jal	ra,40001f24 <print64bit>
		print128bit("KEY (128-bit) : ", key);
40000438:	fe842583          	lw	a1,-24(s0)
4000043c:	400027b7          	lui	a5,0x40002
40000440:	28478513          	addi	a0,a5,644 # 40002284 <vga_simRes_h160_v120+0xdc>
40000444:	345010ef          	jal	ra,40001f88 <print128bit>
		print64bit("RESULT (64-bit) : ", res);
40000448:	fe042583          	lw	a1,-32(s0)
4000044c:	400027b7          	lui	a5,0x40002
40000450:	29878513          	addi	a0,a5,664 # 40002298 <vga_simRes_h160_v120+0xf0>
40000454:	2d1010ef          	jal	ra,40001f24 <print64bit>
		print("\r\n============================================================================\r\n");
40000458:	400027b7          	lui	a5,0x40002
4000045c:	2ac78513          	addi	a0,a5,684 # 400022ac <vga_simRes_h160_v120+0x104>
40000460:	05d010ef          	jal	ra,40001cbc <print>

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
	print("===============================PRESENT TEST=====================================\r\n");
400006f0:	400027b7          	lui	a5,0x40002
400006f4:	36078513          	addi	a0,a5,864 # 40002360 <vga_simRes_h160_v120+0x20>
400006f8:	5c4010ef          	jal	ra,40001cbc <print>
		print("=========================LE DUY LINH - 18200157-============================\r\n");
400006fc:	400027b7          	lui	a5,0x40002
40000700:	3b478513          	addi	a0,a5,948 # 400023b4 <vga_simRes_h160_v120+0x74>
40000704:	5b8010ef          	jal	ra,40001cbc <print>
		print("============================================================================\r\n");
40000708:	400027b7          	lui	a5,0x40002
4000070c:	40478513          	addi	a0,a5,1028 # 40002404 <vga_simRes_h160_v120+0xc4>
40000710:	5ac010ef          	jal	ra,40001cbc <print>
	    unsigned int present_key[3] = {0x0, 0x0, 0x0};
40000714:	fc042a23          	sw	zero,-44(s0)
40000718:	fc042c23          	sw	zero,-40(s0)
4000071c:	fc042e23          	sw	zero,-36(s0)
	    unsigned int present_block[2] 	= {0x0, 0x0};
40000720:	fc042623          	sw	zero,-52(s0)
40000724:	fc042823          	sw	zero,-48(s0)
	    unsigned int present_res[2] 	= {0x0, 0x0};
40000728:	fc042223          	sw	zero,-60(s0)
4000072c:	fc042423          	sw	zero,-56(s0)

	    print("\r\n=================================TEST 1=====================================\r\n");
40000730:	400027b7          	lui	a5,0x40002
40000734:	45478513          	addi	a0,a5,1108 # 40002454 <vga_simRes_h160_v120+0x114>
40000738:	584010ef          	jal	ra,40001cbc <print>

	    present_block[1]=0x4c746e67;
4000073c:	4c7477b7          	lui	a5,0x4c747
40000740:	e6778793          	addi	a5,a5,-409 # 4c746e67 <__global_pointer$+0xc743917>
40000744:	fcf42823          	sw	a5,-48(s0)
	    present_block[0]=0x7579656e;
40000748:	757967b7          	lui	a5,0x75796
4000074c:	56e78793          	addi	a5,a5,1390 # 7579656e <__global_pointer$+0x3579301e>
40000750:	fcf42623          	sw	a5,-52(s0)

	    present_key[2] = 0x46657465;
40000754:	466577b7          	lui	a5,0x46657
40000758:	46578793          	addi	a5,a5,1125 # 46657465 <__global_pointer$+0x6653f15>
4000075c:	fcf42e23          	sw	a5,-36(s0)
	    present_key[1] = 0x6c48636d;
40000760:	6c4867b7          	lui	a5,0x6c486
40000764:	36d78793          	addi	a5,a5,877 # 6c48636d <__global_pointer$+0x2c482e1d>
40000768:	fcf42c23          	sw	a5,-40(s0)
	    present_key[0] = 0x7573;
4000076c:	000077b7          	lui	a5,0x7
40000770:	57378793          	addi	a5,a5,1395 # 7573 <_stack_size+0x6d73>
40000774:	fcf42a23          	sw	a5,-44(s0)

	    present_cipher(PRESENT_OP_EN,present_key,present_block,present_res);
40000778:	fc440693          	addi	a3,s0,-60
4000077c:	fcc40713          	addi	a4,s0,-52
40000780:	fd440793          	addi	a5,s0,-44
40000784:	00070613          	mv	a2,a4
40000788:	00078593          	mv	a1,a5
4000078c:	00000513          	li	a0,0
40000790:	15d000ef          	jal	ra,400010ec <present_cipher>

	print("============================================================================\r\n");
40000794:	400027b7          	lui	a5,0x40002
40000798:	40478513          	addi	a0,a5,1028 # 40002404 <vga_simRes_h160_v120+0xc4>
4000079c:	520010ef          	jal	ra,40001cbc <print>
	print("===============================PRINCE TEST==================================\r\n");
400007a0:	400027b7          	lui	a5,0x40002
400007a4:	4a878513          	addi	a0,a5,1192 # 400024a8 <vga_simRes_h160_v120+0x168>
400007a8:	514010ef          	jal	ra,40001cbc <print>
	print("=========================LE DUY LINH - 18200157-============================\r\n");
400007ac:	400027b7          	lui	a5,0x40002
400007b0:	3b478513          	addi	a0,a5,948 # 400023b4 <vga_simRes_h160_v120+0x74>
400007b4:	508010ef          	jal	ra,40001cbc <print>
	print("============================================================================\r\n");
400007b8:	400027b7          	lui	a5,0x40002
400007bc:	40478513          	addi	a0,a5,1028 # 40002404 <vga_simRes_h160_v120+0xc4>
400007c0:	4fc010ef          	jal	ra,40001cbc <print>
	uint32_t prince_key[4] 		= {0x0, 0x0, 0x0, 0x0};
400007c4:	fa042a23          	sw	zero,-76(s0)
400007c8:	fa042c23          	sw	zero,-72(s0)
400007cc:	fa042e23          	sw	zero,-68(s0)
400007d0:	fc042023          	sw	zero,-64(s0)
	uint32_t prince_block[2] 		= {0x0, 0x0};
400007d4:	fa042623          	sw	zero,-84(s0)
400007d8:	fa042823          	sw	zero,-80(s0)
	uint32_t prince_res[2] 	= {0x0,0x0};
400007dc:	fa042223          	sw	zero,-92(s0)
400007e0:	fa042423          	sw	zero,-88(s0)
	print("\r\n===================================TEST 1===================================\r\n");
400007e4:	400027b7          	lui	a5,0x40002
400007e8:	4f878513          	addi	a0,a5,1272 # 400024f8 <vga_simRes_h160_v120+0x1b8>
400007ec:	4d0010ef          	jal	ra,40001cbc <print>

	prince_block[1] 	= 0x01234567;
400007f0:	012347b7          	lui	a5,0x1234
400007f4:	56778793          	addi	a5,a5,1383 # 1234567 <_stack_size+0x1233d67>
400007f8:	faf42823          	sw	a5,-80(s0)
	prince_block[0] 	= 0x89abcdef;
400007fc:	89abd7b7          	lui	a5,0x89abd
40000800:	def78793          	addi	a5,a5,-529 # 89abcdef <_stack_start+0x9abc4af>
40000804:	faf42623          	sw	a5,-84(s0)

	prince_key[3]		= 0x00112233;
40000808:	001127b7          	lui	a5,0x112
4000080c:	23378793          	addi	a5,a5,563 # 112233 <_stack_size+0x111a33>
40000810:	fcf42023          	sw	a5,-64(s0)
	prince_key[2]		= 0x44556677;
40000814:	445567b7          	lui	a5,0x44556
40000818:	67778793          	addi	a5,a5,1655 # 44556677 <__global_pointer$+0x4553127>
4000081c:	faf42e23          	sw	a5,-68(s0)
	prince_key[1]		= 0x8899aabb;
40000820:	8899b7b7          	lui	a5,0x8899b
40000824:	abb78793          	addi	a5,a5,-1349 # 8899aabb <_stack_start+0x899a17b>
40000828:	faf42c23          	sw	a5,-72(s0)
	prince_key[0]		= 0xccddeeff;
4000082c:	ccddf7b7          	lui	a5,0xccddf
40000830:	eff78793          	addi	a5,a5,-257 # ccddeeff <_stack_start+0x4cdde5bf>
40000834:	faf42a23          	sw	a5,-76(s0)

	prince_cipher(PRINCE_OP_EN,prince_key,prince_block,prince_res);
40000838:	fa440693          	addi	a3,s0,-92
4000083c:	fac40713          	addi	a4,s0,-84
40000840:	fb440793          	addi	a5,s0,-76
40000844:	00070613          	mv	a2,a4
40000848:	00078593          	mv	a1,a5
4000084c:	00100513          	li	a0,1
40000850:	aa1ff0ef          	jal	ra,400002f0 <prince_cipher>

	print("\r\n===================================TEST 2===================================\r\n");
40000854:	400027b7          	lui	a5,0x40002
40000858:	54c78513          	addi	a0,a5,1356 # 4000254c <vga_simRes_h160_v120+0x20c>
4000085c:	460010ef          	jal	ra,40001cbc <print>

	prince_block[1] 	= 0x00000000;
40000860:	fa042823          	sw	zero,-80(s0)
	prince_block[0] 	= 0x00000000;
40000864:	fa042623          	sw	zero,-84(s0)

	prince_key[3]		= 0x00000000;
40000868:	fc042023          	sw	zero,-64(s0)
	prince_key[2]		= 0x00000000;
4000086c:	fa042e23          	sw	zero,-68(s0)
	prince_key[1]		= 0x00000000;
40000870:	fa042c23          	sw	zero,-72(s0)
	prince_key[0]		= 0x00000000;
40000874:	fa042a23          	sw	zero,-76(s0)

	prince_cipher(PRINCE_OP_EN,prince_key,prince_block,prince_res);
40000878:	fa440693          	addi	a3,s0,-92
4000087c:	fac40713          	addi	a4,s0,-84
40000880:	fb440793          	addi	a5,s0,-76
40000884:	00070613          	mv	a2,a4
40000888:	00078593          	mv	a1,a5
4000088c:	00100513          	li	a0,1
40000890:	a61ff0ef          	jal	ra,400002f0 <prince_cipher>
	print("\r\n===================================TEST 3===================================\r\n");
40000894:	400027b7          	lui	a5,0x40002
40000898:	5a078513          	addi	a0,a5,1440 # 400025a0 <vga_simRes_h160_v120+0x260>
4000089c:	420010ef          	jal	ra,40001cbc <print>

	prince_block[1] 	= 0x69c4e0d8;
400008a0:	69c4e7b7          	lui	a5,0x69c4e
400008a4:	0d878793          	addi	a5,a5,216 # 69c4e0d8 <__global_pointer$+0x29c4ab88>
400008a8:	faf42823          	sw	a5,-80(s0)
	prince_block[0] 	= 0x6a7b0430;
400008ac:	6a7b07b7          	lui	a5,0x6a7b0
400008b0:	43078793          	addi	a5,a5,1072 # 6a7b0430 <__global_pointer$+0x2a7acee0>
400008b4:	faf42623          	sw	a5,-84(s0)

	prince_key[3]		= 0xd8cdb780;
400008b8:	d8cdb7b7          	lui	a5,0xd8cdb
400008bc:	78078793          	addi	a5,a5,1920 # d8cdb780 <_stack_start+0x58cdae40>
400008c0:	fcf42023          	sw	a5,-64(s0)
	prince_key[2]		= 0x70b4c55a;
400008c4:	70b4c7b7          	lui	a5,0x70b4c
400008c8:	55a78793          	addi	a5,a5,1370 # 70b4c55a <__global_pointer$+0x30b4900a>
400008cc:	faf42e23          	sw	a5,-68(s0)
	prince_key[1]		= 0x818665aa;
400008d0:	818667b7          	lui	a5,0x81866
400008d4:	5aa78793          	addi	a5,a5,1450 # 818665aa <_stack_start+0x1865c6a>
400008d8:	faf42c23          	sw	a5,-72(s0)
	prince_key[0]		= 0x0d02dfda;
400008dc:	0d02e7b7          	lui	a5,0xd02e
400008e0:	fda78793          	addi	a5,a5,-38 # d02dfda <_stack_size+0xd02d7da>
400008e4:	faf42a23          	sw	a5,-76(s0)

	prince_cipher(PRINCE_OP_EN,prince_key,prince_block,prince_res);
400008e8:	fa440693          	addi	a3,s0,-92
400008ec:	fac40713          	addi	a4,s0,-84
400008f0:	fb440793          	addi	a5,s0,-76
400008f4:	00070613          	mv	a2,a4
400008f8:	00078593          	mv	a1,a5
400008fc:	00100513          	li	a0,1
40000900:	9f1ff0ef          	jal	ra,400002f0 <prince_cipher>
	print("\r\n===================================TEST 4===================================\r\n");
40000904:	400027b7          	lui	a5,0x40002
40000908:	5f478513          	addi	a0,a5,1524 # 400025f4 <vga_simRes_h160_v120+0x2b4>
4000090c:	3b0010ef          	jal	ra,40001cbc <print>

	prince_block[1] 	= 0x43c6b256;
40000910:	43c6b7b7          	lui	a5,0x43c6b
40000914:	25678793          	addi	a5,a5,598 # 43c6b256 <__global_pointer$+0x3c67d06>
40000918:	faf42823          	sw	a5,-80(s0)
	prince_block[0] 	= 0xd79de7e8;
4000091c:	d79de7b7          	lui	a5,0xd79de
40000920:	7e878793          	addi	a5,a5,2024 # d79de7e8 <_stack_start+0x579ddea8>
40000924:	faf42623          	sw	a5,-84(s0)

	prince_key[3]		= 0xd8cdb780;
40000928:	d8cdb7b7          	lui	a5,0xd8cdb
4000092c:	78078793          	addi	a5,a5,1920 # d8cdb780 <_stack_start+0x58cdae40>
40000930:	fcf42023          	sw	a5,-64(s0)
	prince_key[2]		= 0x70b4c55a;
40000934:	70b4c7b7          	lui	a5,0x70b4c
40000938:	55a78793          	addi	a5,a5,1370 # 70b4c55a <__global_pointer$+0x30b4900a>
4000093c:	faf42e23          	sw	a5,-68(s0)
	prince_key[1]		= 0x818665aa;
40000940:	818667b7          	lui	a5,0x81866
40000944:	5aa78793          	addi	a5,a5,1450 # 818665aa <_stack_start+0x1865c6a>
40000948:	faf42c23          	sw	a5,-72(s0)
	prince_key[0]		= 0x0d02dfda;
4000094c:	0d02e7b7          	lui	a5,0xd02e
40000950:	fda78793          	addi	a5,a5,-38 # d02dfda <_stack_size+0xd02d7da>
40000954:	faf42a23          	sw	a5,-76(s0)

	prince_cipher(PRINCE_OP_DE,prince_key,prince_block,prince_res);
40000958:	fa440693          	addi	a3,s0,-92
4000095c:	fac40713          	addi	a4,s0,-84
40000960:	fb440793          	addi	a5,s0,-76
40000964:	00070613          	mv	a2,a4
40000968:	00078593          	mv	a1,a5
4000096c:	00000513          	li	a0,0
40000970:	981ff0ef          	jal	ra,400002f0 <prince_cipher>

	print("============================================================================\r\n");
40000974:	400027b7          	lui	a5,0x40002
40000978:	40478513          	addi	a0,a5,1028 # 40002404 <vga_simRes_h160_v120+0xc4>
4000097c:	340010ef          	jal	ra,40001cbc <print>
	print("===============================AES TEST=====================================\r\n");
40000980:	400027b7          	lui	a5,0x40002
40000984:	64878513          	addi	a0,a5,1608 # 40002648 <vga_simRes_h160_v120+0x308>
40000988:	334010ef          	jal	ra,40001cbc <print>
	print("=========================LE DUY LINH - 18200157-============================\r\n");
4000098c:	400027b7          	lui	a5,0x40002
40000990:	3b478513          	addi	a0,a5,948 # 400023b4 <vga_simRes_h160_v120+0x74>
40000994:	328010ef          	jal	ra,40001cbc <print>
	print("============================================================================\r\n");
40000998:	400027b7          	lui	a5,0x40002
4000099c:	40478513          	addi	a0,a5,1028 # 40002404 <vga_simRes_h160_v120+0xc4>
400009a0:	31c010ef          	jal	ra,40001cbc <print>
    unsigned int aes_key_128[4] = {0x0, 0x0, 0x0, 0x0};
400009a4:	f8042a23          	sw	zero,-108(s0)
400009a8:	f8042c23          	sw	zero,-104(s0)
400009ac:	f8042e23          	sw	zero,-100(s0)
400009b0:	fa042023          	sw	zero,-96(s0)
    unsigned int aes_block[4] 	= {0x0, 0x0, 0x0, 0x0};
400009b4:	f8042223          	sw	zero,-124(s0)
400009b8:	f8042423          	sw	zero,-120(s0)
400009bc:	f8042623          	sw	zero,-116(s0)
400009c0:	f8042823          	sw	zero,-112(s0)

    unsigned int aes_res[4] 	= {0x0, 0x0, 0x0, 0x0};
400009c4:	f6042a23          	sw	zero,-140(s0)
400009c8:	f6042c23          	sw	zero,-136(s0)
400009cc:	f6042e23          	sw	zero,-132(s0)
400009d0:	f8042023          	sw	zero,-128(s0)

	print("\r\n=================================TEST 1=====================================\r\n");
400009d4:	400027b7          	lui	a5,0x40002
400009d8:	45478513          	addi	a0,a5,1108 # 40002454 <vga_simRes_h160_v120+0x114>
400009dc:	2e0010ef          	jal	ra,40001cbc <print>

    aes_block[3] 	= 0x33343536;
400009e0:	333437b7          	lui	a5,0x33343
400009e4:	53678793          	addi	a5,a5,1334 # 33343536 <_stack_size+0x33342d36>
400009e8:	f8f42823          	sw	a5,-112(s0)
    aes_block[2] 	= 0x39303132;
400009ec:	393037b7          	lui	a5,0x39303
400009f0:	13278793          	addi	a5,a5,306 # 39303132 <_stack_size+0x39302932>
400009f4:	f8f42623          	sw	a5,-116(s0)
    aes_block[1] 	= 0x35363738;
400009f8:	353637b7          	lui	a5,0x35363
400009fc:	73878793          	addi	a5,a5,1848 # 35363738 <_stack_size+0x35362f38>
40000a00:	f8f42423          	sw	a5,-120(s0)
    aes_block[0] 	= 0x31323334;
40000a04:	313237b7          	lui	a5,0x31323
40000a08:	33478793          	addi	a5,a5,820 # 31323334 <_stack_size+0x31322b34>
40000a0c:	f8f42223          	sw	a5,-124(s0)

	aes_key_128[3] 	= 0x37363534;
40000a10:	373637b7          	lui	a5,0x37363
40000a14:	53478793          	addi	a5,a5,1332 # 37363534 <_stack_size+0x37362d34>
40000a18:	faf42023          	sw	a5,-96(s0)
    aes_key_128[2] 	= 0x31303938;
40000a1c:	313047b7          	lui	a5,0x31304
40000a20:	93878793          	addi	a5,a5,-1736 # 31303938 <_stack_size+0x31303138>
40000a24:	f8f42e23          	sw	a5,-100(s0)
    aes_key_128[1] 	= 0x35343332;
40000a28:	353437b7          	lui	a5,0x35343
40000a2c:	33278793          	addi	a5,a5,818 # 35343332 <_stack_size+0x35342b32>
40000a30:	f8f42c23          	sw	a5,-104(s0)
    aes_key_128[0]	= 0x39383736;
40000a34:	393837b7          	lui	a5,0x39383
40000a38:	73678793          	addi	a5,a5,1846 # 39383736 <_stack_size+0x39382f36>
40000a3c:	f8f42a23          	sw	a5,-108(s0)

   	aes_128_cipher(AES_OP_EN, aes_key_128, aes_block, aes_res);
40000a40:	f7440693          	addi	a3,s0,-140
40000a44:	f8440713          	addi	a4,s0,-124
40000a48:	f9440793          	addi	a5,s0,-108
40000a4c:	00070613          	mv	a2,a4
40000a50:	00078593          	mv	a1,a5
40000a54:	00100513          	li	a0,1
40000a58:	32d000ef          	jal	ra,40001584 <aes_128_cipher>
	print("\r\n=================================TEST 2=====================================\r\n");
40000a5c:	400027b7          	lui	a5,0x40002
40000a60:	69878513          	addi	a0,a5,1688 # 40002698 <vga_simRes_h160_v120+0x358>
40000a64:	258010ef          	jal	ra,40001cbc <print>

    aes_block[3] 	= 0xfd1ee6b4;
40000a68:	fd1ee7b7          	lui	a5,0xfd1ee
40000a6c:	6b478793          	addi	a5,a5,1716 # fd1ee6b4 <_stack_start+0x7d1edd74>
40000a70:	f8f42823          	sw	a5,-112(s0)
    aes_block[2] 	= 0xbd2fb855;
40000a74:	bd2fc7b7          	lui	a5,0xbd2fc
40000a78:	85578793          	addi	a5,a5,-1963 # bd2fb855 <_stack_start+0x3d2faf15>
40000a7c:	f8f42623          	sw	a5,-116(s0)
    aes_block[1] 	= 0x6428318a;
40000a80:	642837b7          	lui	a5,0x64283
40000a84:	18a78793          	addi	a5,a5,394 # 6428318a <__global_pointer$+0x2427fc3a>
40000a88:	f8f42423          	sw	a5,-120(s0)
    aes_block[0] 	= 0x6e6f9733;
40000a8c:	6e6f97b7          	lui	a5,0x6e6f9
40000a90:	73378793          	addi	a5,a5,1843 # 6e6f9733 <__global_pointer$+0x2e6f61e3>
40000a94:	f8f42223          	sw	a5,-124(s0)

	aes_key_128[3] 	= 0x33343536;
40000a98:	333437b7          	lui	a5,0x33343
40000a9c:	53678793          	addi	a5,a5,1334 # 33343536 <_stack_size+0x33342d36>
40000aa0:	faf42023          	sw	a5,-96(s0)
    aes_key_128[2] 	= 0x39303132;
40000aa4:	393037b7          	lui	a5,0x39303
40000aa8:	13278793          	addi	a5,a5,306 # 39303132 <_stack_size+0x39302932>
40000aac:	f8f42e23          	sw	a5,-100(s0)
    aes_key_128[1] 	= 0x35363738;
40000ab0:	353637b7          	lui	a5,0x35363
40000ab4:	73878793          	addi	a5,a5,1848 # 35363738 <_stack_size+0x35362f38>
40000ab8:	f8f42c23          	sw	a5,-104(s0)
    aes_key_128[0]	= 0x31323334;
40000abc:	313237b7          	lui	a5,0x31323
40000ac0:	33478793          	addi	a5,a5,820 # 31323334 <_stack_size+0x31322b34>
40000ac4:	f8f42a23          	sw	a5,-108(s0)

   	aes_128_cipher(AES_OP_DE, aes_key_128, aes_block, aes_res);
40000ac8:	f7440693          	addi	a3,s0,-140
40000acc:	f8440713          	addi	a4,s0,-124
40000ad0:	f9440793          	addi	a5,s0,-108
40000ad4:	00070613          	mv	a2,a4
40000ad8:	00078593          	mv	a1,a5
40000adc:	00000513          	li	a0,0
40000ae0:	2a5000ef          	jal	ra,40001584 <aes_128_cipher>
	print("\r\n=================================TEST 3=====================================\r\n");
40000ae4:	400027b7          	lui	a5,0x40002
40000ae8:	6ec78513          	addi	a0,a5,1772 # 400026ec <vga_simRes_h160_v120+0x3ac>
40000aec:	1d0010ef          	jal	ra,40001cbc <print>

    aes_block[3] 	= 0x7393172a;
40000af0:	739317b7          	lui	a5,0x73931
40000af4:	72a78793          	addi	a5,a5,1834 # 7393172a <__global_pointer$+0x3392e1da>
40000af8:	f8f42823          	sw	a5,-112(s0)
    aes_block[2] 	= 0xe93d7e11;
40000afc:	e93d87b7          	lui	a5,0xe93d8
40000b00:	e1178793          	addi	a5,a5,-495 # e93d7e11 <_stack_start+0x693d74d1>
40000b04:	f8f42623          	sw	a5,-116(s0)
    aes_block[1] 	= 0x2e409f96;
40000b08:	2e40a7b7          	lui	a5,0x2e40a
40000b0c:	f9678793          	addi	a5,a5,-106 # 2e409f96 <_stack_size+0x2e409796>
40000b10:	f8f42423          	sw	a5,-120(s0)
    aes_block[0] 	= 0x6bc1bee2;
40000b14:	6bc1c7b7          	lui	a5,0x6bc1c
40000b18:	ee278793          	addi	a5,a5,-286 # 6bc1bee2 <__global_pointer$+0x2bc18992>
40000b1c:	f8f42223          	sw	a5,-124(s0)

	aes_key_128[3] 	= 0x09cf4f3c;
40000b20:	09cf57b7          	lui	a5,0x9cf5
40000b24:	f3c78793          	addi	a5,a5,-196 # 9cf4f3c <_stack_size+0x9cf473c>
40000b28:	faf42023          	sw	a5,-96(s0)
    aes_key_128[2] 	= 0xabf71588;
40000b2c:	abf717b7          	lui	a5,0xabf71
40000b30:	58878793          	addi	a5,a5,1416 # abf71588 <_stack_start+0x2bf70c48>
40000b34:	f8f42e23          	sw	a5,-100(s0)
    aes_key_128[1] 	= 0x28aed2a6;
40000b38:	28aed7b7          	lui	a5,0x28aed
40000b3c:	2a678793          	addi	a5,a5,678 # 28aed2a6 <_stack_size+0x28aecaa6>
40000b40:	f8f42c23          	sw	a5,-104(s0)
    aes_key_128[0]	= 0x2b7e1516;
40000b44:	2b7e17b7          	lui	a5,0x2b7e1
40000b48:	51678793          	addi	a5,a5,1302 # 2b7e1516 <_stack_size+0x2b7e0d16>
40000b4c:	f8f42a23          	sw	a5,-108(s0)
   	aes_128_cipher(AES_OP_EN, aes_key_128, aes_block, aes_res);
40000b50:	f7440693          	addi	a3,s0,-140
40000b54:	f8440713          	addi	a4,s0,-124
40000b58:	f9440793          	addi	a5,s0,-108
40000b5c:	00070613          	mv	a2,a4
40000b60:	00078593          	mv	a1,a5
40000b64:	00100513          	li	a0,1
40000b68:	21d000ef          	jal	ra,40001584 <aes_128_cipher>
	print("\r\n=================================TEST 4=====================================\r\n");
40000b6c:	400027b7          	lui	a5,0x40002
40000b70:	74078513          	addi	a0,a5,1856 # 40002740 <vga_simRes_h160_v120+0x400>
40000b74:	148010ef          	jal	ra,40001cbc <print>

    aes_block[3] 	= 0x2466ef97;
40000b78:	2466f7b7          	lui	a5,0x2466f
40000b7c:	f9778793          	addi	a5,a5,-105 # 2466ef97 <_stack_size+0x2466e797>
40000b80:	f8f42823          	sw	a5,-112(s0)
    aes_block[2] 	= 0xa89ecaf3;
40000b84:	a89ed7b7          	lui	a5,0xa89ed
40000b88:	af378793          	addi	a5,a5,-1293 # a89ecaf3 <_stack_start+0x289ec1b3>
40000b8c:	f8f42623          	sw	a5,-116(s0)
    aes_block[1] 	= 0x0d7a3660;
40000b90:	0d7a37b7          	lui	a5,0xd7a3
40000b94:	66078793          	addi	a5,a5,1632 # d7a3660 <_stack_size+0xd7a2e60>
40000b98:	f8f42423          	sw	a5,-120(s0)
    aes_block[0] 	= 0x3ad77bb4;
40000b9c:	3ad787b7          	lui	a5,0x3ad78
40000ba0:	bb478793          	addi	a5,a5,-1100 # 3ad77bb4 <_stack_size+0x3ad773b4>
40000ba4:	f8f42223          	sw	a5,-124(s0)

	aes_key_128[3] 	= 0x09cf4f3c;
40000ba8:	09cf57b7          	lui	a5,0x9cf5
40000bac:	f3c78793          	addi	a5,a5,-196 # 9cf4f3c <_stack_size+0x9cf473c>
40000bb0:	faf42023          	sw	a5,-96(s0)
    aes_key_128[2] 	= 0xabf71588;
40000bb4:	abf717b7          	lui	a5,0xabf71
40000bb8:	58878793          	addi	a5,a5,1416 # abf71588 <_stack_start+0x2bf70c48>
40000bbc:	f8f42e23          	sw	a5,-100(s0)
    aes_key_128[1] 	= 0x28aed2a6;
40000bc0:	28aed7b7          	lui	a5,0x28aed
40000bc4:	2a678793          	addi	a5,a5,678 # 28aed2a6 <_stack_size+0x28aecaa6>
40000bc8:	f8f42c23          	sw	a5,-104(s0)
    aes_key_128[0]	= 0x2b7e1516;
40000bcc:	2b7e17b7          	lui	a5,0x2b7e1
40000bd0:	51678793          	addi	a5,a5,1302 # 2b7e1516 <_stack_size+0x2b7e0d16>
40000bd4:	f8f42a23          	sw	a5,-108(s0)

   	aes_128_cipher(AES_OP_DE, aes_key_128, aes_block, aes_res);
40000bd8:	f7440693          	addi	a3,s0,-140
40000bdc:	f8440713          	addi	a4,s0,-124
40000be0:	f9440793          	addi	a5,s0,-108
40000be4:	00070613          	mv	a2,a4
40000be8:	00078593          	mv	a1,a5
40000bec:	00000513          	li	a0,0
40000bf0:	195000ef          	jal	ra,40001584 <aes_128_cipher>

   	print("\r\n==========================================TEST 5(AES256)========================================\r\n");
40000bf4:	400027b7          	lui	a5,0x40002
40000bf8:	79478513          	addi	a0,a5,1940 # 40002794 <vga_simRes_h160_v120+0x454>
40000bfc:	0c0010ef          	jal	ra,40001cbc <print>
    unsigned int aes_key_256[8] = {0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0};
40000c00:	f4042a23          	sw	zero,-172(s0)
40000c04:	f4042c23          	sw	zero,-168(s0)
40000c08:	f4042e23          	sw	zero,-164(s0)
40000c0c:	f6042023          	sw	zero,-160(s0)
40000c10:	f6042223          	sw	zero,-156(s0)
40000c14:	f6042423          	sw	zero,-152(s0)
40000c18:	f6042623          	sw	zero,-148(s0)
40000c1c:	f6042823          	sw	zero,-144(s0)

    aes_block[3] 	= 0x7393172a;
40000c20:	739317b7          	lui	a5,0x73931
40000c24:	72a78793          	addi	a5,a5,1834 # 7393172a <__global_pointer$+0x3392e1da>
40000c28:	f8f42823          	sw	a5,-112(s0)
    aes_block[2] 	= 0xe93d7e11;
40000c2c:	e93d87b7          	lui	a5,0xe93d8
40000c30:	e1178793          	addi	a5,a5,-495 # e93d7e11 <_stack_start+0x693d74d1>
40000c34:	f8f42623          	sw	a5,-116(s0)
    aes_block[1] 	= 0x2e409f96;
40000c38:	2e40a7b7          	lui	a5,0x2e40a
40000c3c:	f9678793          	addi	a5,a5,-106 # 2e409f96 <_stack_size+0x2e409796>
40000c40:	f8f42423          	sw	a5,-120(s0)
    aes_block[0] 	= 0x6bc1bee2;
40000c44:	6bc1c7b7          	lui	a5,0x6bc1c
40000c48:	ee278793          	addi	a5,a5,-286 # 6bc1bee2 <__global_pointer$+0x2bc18992>
40000c4c:	f8f42223          	sw	a5,-124(s0)

    aes_key_256[7] 	= 0x0914dff4;
40000c50:	0914e7b7          	lui	a5,0x914e
40000c54:	ff478793          	addi	a5,a5,-12 # 914dff4 <_stack_size+0x914d7f4>
40000c58:	f6f42823          	sw	a5,-144(s0)
    aes_key_256[6] 	= 0x2d9810a3;
40000c5c:	2d9817b7          	lui	a5,0x2d981
40000c60:	0a378793          	addi	a5,a5,163 # 2d9810a3 <_stack_size+0x2d9808a3>
40000c64:	f6f42623          	sw	a5,-148(s0)
    aes_key_256[5] 	= 0x3b6108d7;
40000c68:	3b6117b7          	lui	a5,0x3b611
40000c6c:	8d778793          	addi	a5,a5,-1833 # 3b6108d7 <_stack_size+0x3b6100d7>
40000c70:	f6f42423          	sw	a5,-152(s0)
    aes_key_256[4]	= 0x1f352c07;
40000c74:	1f3537b7          	lui	a5,0x1f353
40000c78:	c0778793          	addi	a5,a5,-1017 # 1f352c07 <_stack_size+0x1f352407>
40000c7c:	f6f42223          	sw	a5,-156(s0)
    aes_key_256[3] 	= 0x857d7781;
40000c80:	857d77b7          	lui	a5,0x857d7
40000c84:	78178793          	addi	a5,a5,1921 # 857d7781 <_stack_start+0x57d6e41>
40000c88:	f6f42023          	sw	a5,-160(s0)
    aes_key_256[2] 	= 0x2b73aef0;
40000c8c:	2b73b7b7          	lui	a5,0x2b73b
40000c90:	ef078793          	addi	a5,a5,-272 # 2b73aef0 <_stack_size+0x2b73a6f0>
40000c94:	f4f42e23          	sw	a5,-164(s0)
    aes_key_256[1] 	= 0x15ca71be;
40000c98:	15ca77b7          	lui	a5,0x15ca7
40000c9c:	1be78793          	addi	a5,a5,446 # 15ca71be <_stack_size+0x15ca69be>
40000ca0:	f4f42c23          	sw	a5,-168(s0)
    aes_key_256[0]	= 0x603deb10;
40000ca4:	603df7b7          	lui	a5,0x603df
40000ca8:	b1078793          	addi	a5,a5,-1264 # 603deb10 <__global_pointer$+0x203db5c0>
40000cac:	f4f42a23          	sw	a5,-172(s0)

    aes_256_cipher(AES_OP_EN, aes_key_256, aes_block, aes_res);
40000cb0:	f7440693          	addi	a3,s0,-140
40000cb4:	f8440713          	addi	a4,s0,-124
40000cb8:	f5440793          	addi	a5,s0,-172
40000cbc:	00070613          	mv	a2,a4
40000cc0:	00078593          	mv	a1,a5
40000cc4:	00100513          	li	a0,1
40000cc8:	321000ef          	jal	ra,400017e8 <aes_256_cipher>

   	print("\r\n==========================================TEST 6(AES256)========================================\r\n");
40000ccc:	400027b7          	lui	a5,0x40002
40000cd0:	7fc78513          	addi	a0,a5,2044 # 400027fc <vga_simRes_h160_v120+0x4bc>
40000cd4:	7e9000ef          	jal	ra,40001cbc <print>

    aes_block[3] 	= 0x3db181f8 ;
40000cd8:	3db187b7          	lui	a5,0x3db18
40000cdc:	1f878793          	addi	a5,a5,504 # 3db181f8 <_stack_size+0x3db179f8>
40000ce0:	f8f42823          	sw	a5,-112(s0)
    aes_block[2] 	= 0x064b5a7e ;
40000ce4:	064b67b7          	lui	a5,0x64b6
40000ce8:	a7e78793          	addi	a5,a5,-1410 # 64b5a7e <_stack_size+0x64b527e>
40000cec:	f8f42623          	sw	a5,-116(s0)
    aes_block[1] 	= 0xb5d2a03c;
40000cf0:	b5d2a7b7          	lui	a5,0xb5d2a
40000cf4:	03c78793          	addi	a5,a5,60 # b5d2a03c <_stack_start+0x35d296fc>
40000cf8:	f8f42423          	sw	a5,-120(s0)
    aes_block[0] 	= 0xf3eed1bd;
40000cfc:	f3eed7b7          	lui	a5,0xf3eed
40000d00:	1bd78793          	addi	a5,a5,445 # f3eed1bd <_stack_start+0x73eec87d>
40000d04:	f8f42223          	sw	a5,-124(s0)

    aes_key_256[7] 	= 0x0914dff4;
40000d08:	0914e7b7          	lui	a5,0x914e
40000d0c:	ff478793          	addi	a5,a5,-12 # 914dff4 <_stack_size+0x914d7f4>
40000d10:	f6f42823          	sw	a5,-144(s0)
    aes_key_256[6] 	= 0x2d9810a3;
40000d14:	2d9817b7          	lui	a5,0x2d981
40000d18:	0a378793          	addi	a5,a5,163 # 2d9810a3 <_stack_size+0x2d9808a3>
40000d1c:	f6f42623          	sw	a5,-148(s0)
    aes_key_256[5] 	= 0x3b6108d7;
40000d20:	3b6117b7          	lui	a5,0x3b611
40000d24:	8d778793          	addi	a5,a5,-1833 # 3b6108d7 <_stack_size+0x3b6100d7>
40000d28:	f6f42423          	sw	a5,-152(s0)
    aes_key_256[4]	= 0x1f352c07;
40000d2c:	1f3537b7          	lui	a5,0x1f353
40000d30:	c0778793          	addi	a5,a5,-1017 # 1f352c07 <_stack_size+0x1f352407>
40000d34:	f6f42223          	sw	a5,-156(s0)
    aes_key_256[3] 	= 0x857d7781;
40000d38:	857d77b7          	lui	a5,0x857d7
40000d3c:	78178793          	addi	a5,a5,1921 # 857d7781 <_stack_start+0x57d6e41>
40000d40:	f6f42023          	sw	a5,-160(s0)
    aes_key_256[2] 	= 0x2b73aef0;
40000d44:	2b73b7b7          	lui	a5,0x2b73b
40000d48:	ef078793          	addi	a5,a5,-272 # 2b73aef0 <_stack_size+0x2b73a6f0>
40000d4c:	f4f42e23          	sw	a5,-164(s0)
    aes_key_256[1] 	= 0x15ca71be;
40000d50:	15ca77b7          	lui	a5,0x15ca7
40000d54:	1be78793          	addi	a5,a5,446 # 15ca71be <_stack_size+0x15ca69be>
40000d58:	f4f42c23          	sw	a5,-168(s0)
    aes_key_256[0]	= 0x603deb10;
40000d5c:	603df7b7          	lui	a5,0x603df
40000d60:	b1078793          	addi	a5,a5,-1264 # 603deb10 <__global_pointer$+0x203db5c0>
40000d64:	f4f42a23          	sw	a5,-172(s0)

    aes_256_cipher(AES_OP_DE, aes_key_256, aes_block, aes_res);
40000d68:	f7440693          	addi	a3,s0,-140
40000d6c:	f8440713          	addi	a4,s0,-124
40000d70:	f5440793          	addi	a5,s0,-172
40000d74:	00070613          	mv	a2,a4
40000d78:	00078593          	mv	a1,a5
40000d7c:	00000513          	li	a0,0
40000d80:	269000ef          	jal	ra,400017e8 <aes_256_cipher>

	return 0;	
40000d84:	00000793          	li	a5,0
}
40000d88:	00078513          	mv	a0,a5
40000d8c:	0ac12083          	lw	ra,172(sp)
40000d90:	0a812403          	lw	s0,168(sp)
40000d94:	0b010113          	addi	sp,sp,176
40000d98:	00008067          	ret

40000d9c <irqCallback>:
void irqCallback(){
40000d9c:	ff010113          	addi	sp,sp,-16
40000da0:	00812623          	sw	s0,12(sp)
40000da4:	01010413          	addi	s0,sp,16

}
40000da8:	00000013          	nop
40000dac:	00c12403          	lw	s0,12(sp)
40000db0:	01010113          	addi	sp,sp,16
40000db4:	00008067          	ret

40000db8 <timer_init>:
static void timer_init(Timer_Reg *reg){
40000db8:	fe010113          	addi	sp,sp,-32
40000dbc:	00812e23          	sw	s0,28(sp)
40000dc0:	02010413          	addi	s0,sp,32
40000dc4:	fea42623          	sw	a0,-20(s0)
	reg->CLEARS_TICKS  = 0;
40000dc8:	fec42783          	lw	a5,-20(s0)
40000dcc:	0007a023          	sw	zero,0(a5)
	reg->VALUE = 0;
40000dd0:	fec42783          	lw	a5,-20(s0)
40000dd4:	0007a423          	sw	zero,8(a5)
}
40000dd8:	00000013          	nop
40000ddc:	01c12403          	lw	s0,28(sp)
40000de0:	02010113          	addi	sp,sp,32
40000de4:	00008067          	ret

40000de8 <prescaler_init>:
static void prescaler_init(Prescaler_Reg* reg){
40000de8:	fe010113          	addi	sp,sp,-32
40000dec:	00812e23          	sw	s0,28(sp)
40000df0:	02010413          	addi	s0,sp,32
40000df4:	fea42623          	sw	a0,-20(s0)
}
40000df8:	00000013          	nop
40000dfc:	01c12403          	lw	s0,28(sp)
40000e00:	02010113          	addi	sp,sp,32
40000e04:	00008067          	ret

40000e08 <interruptCtrl_init>:
static void interruptCtrl_init(InterruptCtrl_Reg* reg){
40000e08:	fe010113          	addi	sp,sp,-32
40000e0c:	00812e23          	sw	s0,28(sp)
40000e10:	02010413          	addi	s0,sp,32
40000e14:	fea42623          	sw	a0,-20(s0)
	reg->MASKS = 0;
40000e18:	fec42783          	lw	a5,-20(s0)
40000e1c:	0007a223          	sw	zero,4(a5)
	reg->PENDINGS = 0xFFFFFFFF;
40000e20:	fec42783          	lw	a5,-20(s0)
40000e24:	fff00713          	li	a4,-1
40000e28:	00e7a023          	sw	a4,0(a5)
}
40000e2c:	00000013          	nop
40000e30:	01c12403          	lw	s0,28(sp)
40000e34:	02010113          	addi	sp,sp,32
40000e38:	00008067          	ret

40000e3c <uart_writeAvailability>:
static uint32_t uart_writeAvailability(Uart_Reg *reg){
40000e3c:	fe010113          	addi	sp,sp,-32
40000e40:	00812e23          	sw	s0,28(sp)
40000e44:	02010413          	addi	s0,sp,32
40000e48:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS >> 16) & 0xFF;
40000e4c:	fec42783          	lw	a5,-20(s0)
40000e50:	0047a783          	lw	a5,4(a5)
40000e54:	0107d793          	srli	a5,a5,0x10
40000e58:	0ff7f793          	zext.b	a5,a5
}
40000e5c:	00078513          	mv	a0,a5
40000e60:	01c12403          	lw	s0,28(sp)
40000e64:	02010113          	addi	sp,sp,32
40000e68:	00008067          	ret

40000e6c <uart_readOccupancy>:
static uint32_t uart_readOccupancy(Uart_Reg *reg){
40000e6c:	fe010113          	addi	sp,sp,-32
40000e70:	00812e23          	sw	s0,28(sp)
40000e74:	02010413          	addi	s0,sp,32
40000e78:	fea42623          	sw	a0,-20(s0)
	return reg->STATUS >> 24;
40000e7c:	fec42783          	lw	a5,-20(s0)
40000e80:	0047a783          	lw	a5,4(a5)
40000e84:	0187d793          	srli	a5,a5,0x18
}
40000e88:	00078513          	mv	a0,a5
40000e8c:	01c12403          	lw	s0,28(sp)
40000e90:	02010113          	addi	sp,sp,32
40000e94:	00008067          	ret

40000e98 <uart_write>:
static void uart_write(Uart_Reg *reg, uint32_t data){
40000e98:	fe010113          	addi	sp,sp,-32
40000e9c:	00112e23          	sw	ra,28(sp)
40000ea0:	00812c23          	sw	s0,24(sp)
40000ea4:	02010413          	addi	s0,sp,32
40000ea8:	fea42623          	sw	a0,-20(s0)
40000eac:	feb42423          	sw	a1,-24(s0)
	while(uart_writeAvailability(reg) == 0);
40000eb0:	00000013          	nop
40000eb4:	fec42503          	lw	a0,-20(s0)
40000eb8:	f85ff0ef          	jal	ra,40000e3c <uart_writeAvailability>
40000ebc:	00050793          	mv	a5,a0
40000ec0:	fe078ae3          	beqz	a5,40000eb4 <uart_write+0x1c>
	reg->DATA = data;
40000ec4:	fec42783          	lw	a5,-20(s0)
40000ec8:	fe842703          	lw	a4,-24(s0)
40000ecc:	00e7a023          	sw	a4,0(a5)
}
40000ed0:	00000013          	nop
40000ed4:	01c12083          	lw	ra,28(sp)
40000ed8:	01812403          	lw	s0,24(sp)
40000edc:	02010113          	addi	sp,sp,32
40000ee0:	00008067          	ret

40000ee4 <uart_applyConfig>:
static void uart_applyConfig(Uart_Reg *reg, Uart_Config *config){
40000ee4:	fe010113          	addi	sp,sp,-32
40000ee8:	00812e23          	sw	s0,28(sp)
40000eec:	02010413          	addi	s0,sp,32
40000ef0:	fea42623          	sw	a0,-20(s0)
40000ef4:	feb42423          	sw	a1,-24(s0)
	reg->CLOCK_DIVIDER = config->clockDivider;
40000ef8:	fe842783          	lw	a5,-24(s0)
40000efc:	00c7a703          	lw	a4,12(a5)
40000f00:	fec42783          	lw	a5,-20(s0)
40000f04:	00e7a423          	sw	a4,8(a5)
	reg->FRAME_CONFIG = ((config->dataLength-1) << 0) | (config->parity << 8) | (config->stop << 16);
40000f08:	fe842783          	lw	a5,-24(s0)
40000f0c:	0007a783          	lw	a5,0(a5)
40000f10:	fff78713          	addi	a4,a5,-1
40000f14:	fe842783          	lw	a5,-24(s0)
40000f18:	0047a783          	lw	a5,4(a5)
40000f1c:	00879793          	slli	a5,a5,0x8
40000f20:	00f76733          	or	a4,a4,a5
40000f24:	fe842783          	lw	a5,-24(s0)
40000f28:	0087a783          	lw	a5,8(a5)
40000f2c:	01079793          	slli	a5,a5,0x10
40000f30:	00f76733          	or	a4,a4,a5
40000f34:	fec42783          	lw	a5,-20(s0)
40000f38:	00e7a623          	sw	a4,12(a5)
}
40000f3c:	00000013          	nop
40000f40:	01c12403          	lw	s0,28(sp)
40000f44:	02010113          	addi	sp,sp,32
40000f48:	00008067          	ret

40000f4c <vga_isBusy>:
static uint32_t vga_isBusy(Vga_Reg *reg){
40000f4c:	fe010113          	addi	sp,sp,-32
40000f50:	00812e23          	sw	s0,28(sp)
40000f54:	02010413          	addi	s0,sp,32
40000f58:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS & 2) != 0;
40000f5c:	fec42783          	lw	a5,-20(s0)
40000f60:	0007a783          	lw	a5,0(a5)
40000f64:	0027f793          	andi	a5,a5,2
40000f68:	00f037b3          	snez	a5,a5
40000f6c:	0ff7f793          	zext.b	a5,a5
}
40000f70:	00078513          	mv	a0,a5
40000f74:	01c12403          	lw	s0,28(sp)
40000f78:	02010113          	addi	sp,sp,32
40000f7c:	00008067          	ret

40000f80 <vga_run>:
static void vga_run(Vga_Reg *reg){
40000f80:	fe010113          	addi	sp,sp,-32
40000f84:	00812e23          	sw	s0,28(sp)
40000f88:	02010413          	addi	s0,sp,32
40000f8c:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 1;
40000f90:	fec42783          	lw	a5,-20(s0)
40000f94:	00100713          	li	a4,1
40000f98:	00e7a023          	sw	a4,0(a5)
}
40000f9c:	00000013          	nop
40000fa0:	01c12403          	lw	s0,28(sp)
40000fa4:	02010113          	addi	sp,sp,32
40000fa8:	00008067          	ret

40000fac <vga_stop>:
static void vga_stop(Vga_Reg *reg){
40000fac:	fe010113          	addi	sp,sp,-32
40000fb0:	00112e23          	sw	ra,28(sp)
40000fb4:	00812c23          	sw	s0,24(sp)
40000fb8:	02010413          	addi	s0,sp,32
40000fbc:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 0;
40000fc0:	fec42783          	lw	a5,-20(s0)
40000fc4:	0007a023          	sw	zero,0(a5)
	while(vga_isBusy(reg));
40000fc8:	00000013          	nop
40000fcc:	fec42503          	lw	a0,-20(s0)
40000fd0:	f7dff0ef          	jal	ra,40000f4c <vga_isBusy>
40000fd4:	00050793          	mv	a5,a0
40000fd8:	fe079ae3          	bnez	a5,40000fcc <vga_stop+0x20>
}
40000fdc:	00000013          	nop
40000fe0:	00000013          	nop
40000fe4:	01c12083          	lw	ra,28(sp)
40000fe8:	01812403          	lw	s0,24(sp)
40000fec:	02010113          	addi	sp,sp,32
40000ff0:	00008067          	ret

40000ff4 <present_write>:
#include "briey.h"
void present_write(uint32_t iData, uint32_t iAddress)
{
40000ff4:	fe010113          	addi	sp,sp,-32
40000ff8:	00812e23          	sw	s0,28(sp)
40000ffc:	02010413          	addi	s0,sp,32
40001000:	fea42623          	sw	a0,-20(s0)
40001004:	feb42423          	sw	a1,-24(s0)
	PRESENT_BASE->ADDRESS		= iAddress;
40001008:	f00037b7          	lui	a5,0xf0003
4000100c:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40001010:	fe842703          	lw	a4,-24(s0)
40001014:	00e7a623          	sw	a4,12(a5)
	PRESENT_BASE->WRITE_N 		= 0;
40001018:	f00037b7          	lui	a5,0xf0003
4000101c:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40001020:	0007a223          	sw	zero,4(a5)
	PRESENT_BASE->READ_N 		= 1;
40001024:	f00037b7          	lui	a5,0xf0003
40001028:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
4000102c:	00100713          	li	a4,1
40001030:	00e7a423          	sw	a4,8(a5)
	PRESENT_BASE->IDATA			= iData;
40001034:	f00037b7          	lui	a5,0xf0003
40001038:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
4000103c:	fec42703          	lw	a4,-20(s0)
40001040:	00e7a823          	sw	a4,16(a5)
	PRESENT_BASE->CHIP_SELECT_N	= 0;
40001044:	f00037b7          	lui	a5,0xf0003
40001048:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
4000104c:	0007a023          	sw	zero,0(a5)
	PRESENT_BASE->CHIP_SELECT_N	= 1;
40001050:	f00037b7          	lui	a5,0xf0003
40001054:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40001058:	00100713          	li	a4,1
4000105c:	00e7a023          	sw	a4,0(a5)
}
40001060:	00000013          	nop
40001064:	01c12403          	lw	s0,28(sp)
40001068:	02010113          	addi	sp,sp,32
4000106c:	00008067          	ret

40001070 <present_read>:
uint32_t present_read(uint32_t iAddress)
{
40001070:	fd010113          	addi	sp,sp,-48
40001074:	02812623          	sw	s0,44(sp)
40001078:	03010413          	addi	s0,sp,48
4000107c:	fca42e23          	sw	a0,-36(s0)
	PRESENT_BASE->ADDRESS		= iAddress;
40001080:	f00037b7          	lui	a5,0xf0003
40001084:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40001088:	fdc42703          	lw	a4,-36(s0)
4000108c:	00e7a623          	sw	a4,12(a5)
	PRESENT_BASE->READ_N		= 0;
40001090:	f00037b7          	lui	a5,0xf0003
40001094:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40001098:	0007a423          	sw	zero,8(a5)
	PRESENT_BASE->WRITE_N		= 1;
4000109c:	f00037b7          	lui	a5,0xf0003
400010a0:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
400010a4:	00100713          	li	a4,1
400010a8:	00e7a223          	sw	a4,4(a5)
	PRESENT_BASE->CHIP_SELECT_N	= 0;
400010ac:	f00037b7          	lui	a5,0xf0003
400010b0:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
400010b4:	0007a023          	sw	zero,0(a5)
	uint32_t res 				= PRESENT_BASE->ODATA;
400010b8:	f00037b7          	lui	a5,0xf0003
400010bc:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
400010c0:	0147a783          	lw	a5,20(a5)
400010c4:	fef42623          	sw	a5,-20(s0)
	PRESENT_BASE->CHIP_SELECT_N	= 1;
400010c8:	f00037b7          	lui	a5,0xf0003
400010cc:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
400010d0:	00100713          	li	a4,1
400010d4:	00e7a023          	sw	a4,0(a5)
	return res;
400010d8:	fec42783          	lw	a5,-20(s0)
}
400010dc:	00078513          	mv	a0,a5
400010e0:	02c12403          	lw	s0,44(sp)
400010e4:	03010113          	addi	sp,sp,48
400010e8:	00008067          	ret

400010ec <present_cipher>:
void present_cipher(unsigned char operation, uint32_t *key, uint32_t *block, uint32_t *res) {
400010ec:	fe010113          	addi	sp,sp,-32
400010f0:	00112e23          	sw	ra,28(sp)
400010f4:	00812c23          	sw	s0,24(sp)
400010f8:	00912a23          	sw	s1,20(sp)
400010fc:	02010413          	addi	s0,sp,32
40001100:	00050793          	mv	a5,a0
40001104:	feb42423          	sw	a1,-24(s0)
40001108:	fec42223          	sw	a2,-28(s0)
4000110c:	fed42023          	sw	a3,-32(s0)
40001110:	fef407a3          	sb	a5,-17(s0)

	//EN_OR_DE
	if(operation == PRESENT_OP_EN) present_write(PRESENT_OP_EN,PRESENT_ADDR_EN_OR_DE);
40001114:	fef44783          	lbu	a5,-17(s0)
40001118:	00079a63          	bnez	a5,4000112c <present_cipher+0x40>
4000111c:	00800593          	li	a1,8
40001120:	00000513          	li	a0,0
40001124:	ed1ff0ef          	jal	ra,40000ff4 <present_write>
40001128:	0100006f          	j	40001138 <present_cipher+0x4c>
	else present_write(PRESENT_OP_EN,PRESENT_ADDR_EN_OR_DE);
4000112c:	00800593          	li	a1,8
40001130:	00000513          	li	a0,0
40001134:	ec1ff0ef          	jal	ra,40000ff4 <present_write>

	//PLAIN_TEXT
	present_write(block[1],PRESENT_ADDR_BLOCK_BASE +1);
40001138:	fe442783          	lw	a5,-28(s0)
4000113c:	00478793          	addi	a5,a5,4
40001140:	0007a783          	lw	a5,0(a5)
40001144:	00500593          	li	a1,5
40001148:	00078513          	mv	a0,a5
4000114c:	ea9ff0ef          	jal	ra,40000ff4 <present_write>
	present_write(block[0],PRESENT_ADDR_BLOCK_BASE);
40001150:	fe442783          	lw	a5,-28(s0)
40001154:	0007a783          	lw	a5,0(a5)
40001158:	00400593          	li	a1,4
4000115c:	00078513          	mv	a0,a5
40001160:	e95ff0ef          	jal	ra,40000ff4 <present_write>

	//KEY
	present_write(key[2],PRESENT_ADDR_KEY_BASE +2);
40001164:	fe842783          	lw	a5,-24(s0)
40001168:	00878793          	addi	a5,a5,8
4000116c:	0007a783          	lw	a5,0(a5)
40001170:	00300593          	li	a1,3
40001174:	00078513          	mv	a0,a5
40001178:	e7dff0ef          	jal	ra,40000ff4 <present_write>
	present_write(key[1],PRESENT_ADDR_KEY_BASE +1);
4000117c:	fe842783          	lw	a5,-24(s0)
40001180:	00478793          	addi	a5,a5,4
40001184:	0007a783          	lw	a5,0(a5)
40001188:	00200593          	li	a1,2
4000118c:	00078513          	mv	a0,a5
40001190:	e65ff0ef          	jal	ra,40000ff4 <present_write>
	present_write(key[0],PRESENT_ADDR_KEY_BASE);
40001194:	fe842783          	lw	a5,-24(s0)
40001198:	0007a783          	lw	a5,0(a5)
4000119c:	00100593          	li	a1,1
400011a0:	00078513          	mv	a0,a5
400011a4:	e51ff0ef          	jal	ra,40000ff4 <present_write>

	//START
	present_write(0x1,PRESENT_ADDR_START);
400011a8:	00000593          	li	a1,0
400011ac:	00100513          	li	a0,1
400011b0:	e45ff0ef          	jal	ra,40000ff4 <present_write>
    while(present_read(PRESENT_ADDR_RESULT_BASE) == 0);
400011b4:	00000013          	nop
400011b8:	00600513          	li	a0,6
400011bc:	eb5ff0ef          	jal	ra,40001070 <present_read>
400011c0:	00050793          	mv	a5,a0
400011c4:	fe078ae3          	beqz	a5,400011b8 <present_cipher+0xcc>

    res[1] = present_read(PRESENT_ADDR_RESULT_BASE +1);
400011c8:	fe042783          	lw	a5,-32(s0)
400011cc:	00478493          	addi	s1,a5,4
400011d0:	00700513          	li	a0,7
400011d4:	e9dff0ef          	jal	ra,40001070 <present_read>
400011d8:	00050793          	mv	a5,a0
400011dc:	00f4a023          	sw	a5,0(s1)
    res[0] =present_read(PRESENT_ADDR_RESULT_BASE);
400011e0:	00600513          	li	a0,6
400011e4:	e8dff0ef          	jal	ra,40001070 <present_read>
400011e8:	00050713          	mv	a4,a0
400011ec:	fe042783          	lw	a5,-32(s0)
400011f0:	00e7a023          	sw	a4,0(a5)


    //print result to terminal
	if(operation == PRESENT_OP_EN)
400011f4:	fef44783          	lbu	a5,-17(s0)
400011f8:	00079a63          	bnez	a5,4000120c <present_cipher+0x120>
		print("============================PRESENT ENCRYPTTION==============================\r\n");
400011fc:	400037b7          	lui	a5,0x40003
40001200:	8c478513          	addi	a0,a5,-1852 # 400028c4 <vga_simRes_h160_v120+0x20>
40001204:	2b9000ef          	jal	ra,40001cbc <print>
40001208:	0100006f          	j	40001218 <present_cipher+0x12c>
	else
		print("============================PRESENT DECRYPTTION==============================\r\n");
4000120c:	400037b7          	lui	a5,0x40003
40001210:	91478513          	addi	a0,a5,-1772 # 40002914 <vga_simRes_h160_v120+0x70>
40001214:	2a9000ef          	jal	ra,40001cbc <print>
	print64bit("\r\nPLAIN_TEXT (64-bit) : ", block);
40001218:	fe442583          	lw	a1,-28(s0)
4000121c:	400037b7          	lui	a5,0x40003
40001220:	96478513          	addi	a0,a5,-1692 # 40002964 <vga_simRes_h160_v120+0xc0>
40001224:	501000ef          	jal	ra,40001f24 <print64bit>
	print80bit("KEY (80-bit) : ", key);
40001228:	fe842583          	lw	a1,-24(s0)
4000122c:	400037b7          	lui	a5,0x40003
40001230:	98078513          	addi	a0,a5,-1664 # 40002980 <vga_simRes_h160_v120+0xdc>
40001234:	5e1000ef          	jal	ra,40002014 <print80bit>
	print64bit("RESULT (64-bit) : ", res);
40001238:	fe042583          	lw	a1,-32(s0)
4000123c:	400037b7          	lui	a5,0x40003
40001240:	99078513          	addi	a0,a5,-1648 # 40002990 <vga_simRes_h160_v120+0xec>
40001244:	4e1000ef          	jal	ra,40001f24 <print64bit>
	print("\r\n============================================================================\r\n");
40001248:	400037b7          	lui	a5,0x40003
4000124c:	9a478513          	addi	a0,a5,-1628 # 400029a4 <vga_simRes_h160_v120+0x100>
40001250:	26d000ef          	jal	ra,40001cbc <print>
}
40001254:	00000013          	nop
40001258:	01c12083          	lw	ra,28(sp)
4000125c:	01812403          	lw	s0,24(sp)
40001260:	01412483          	lw	s1,20(sp)
40001264:	02010113          	addi	sp,sp,32
40001268:	00008067          	ret

4000126c <timer_init>:
static void timer_init(Timer_Reg *reg){
4000126c:	fe010113          	addi	sp,sp,-32
40001270:	00812e23          	sw	s0,28(sp)
40001274:	02010413          	addi	s0,sp,32
40001278:	fea42623          	sw	a0,-20(s0)
	reg->CLEARS_TICKS  = 0;
4000127c:	fec42783          	lw	a5,-20(s0)
40001280:	0007a023          	sw	zero,0(a5)
	reg->VALUE = 0;
40001284:	fec42783          	lw	a5,-20(s0)
40001288:	0007a423          	sw	zero,8(a5)
}
4000128c:	00000013          	nop
40001290:	01c12403          	lw	s0,28(sp)
40001294:	02010113          	addi	sp,sp,32
40001298:	00008067          	ret

4000129c <prescaler_init>:
static void prescaler_init(Prescaler_Reg* reg){
4000129c:	fe010113          	addi	sp,sp,-32
400012a0:	00812e23          	sw	s0,28(sp)
400012a4:	02010413          	addi	s0,sp,32
400012a8:	fea42623          	sw	a0,-20(s0)
}
400012ac:	00000013          	nop
400012b0:	01c12403          	lw	s0,28(sp)
400012b4:	02010113          	addi	sp,sp,32
400012b8:	00008067          	ret

400012bc <interruptCtrl_init>:
static void interruptCtrl_init(InterruptCtrl_Reg* reg){
400012bc:	fe010113          	addi	sp,sp,-32
400012c0:	00812e23          	sw	s0,28(sp)
400012c4:	02010413          	addi	s0,sp,32
400012c8:	fea42623          	sw	a0,-20(s0)
	reg->MASKS = 0;
400012cc:	fec42783          	lw	a5,-20(s0)
400012d0:	0007a223          	sw	zero,4(a5)
	reg->PENDINGS = 0xFFFFFFFF;
400012d4:	fec42783          	lw	a5,-20(s0)
400012d8:	fff00713          	li	a4,-1
400012dc:	00e7a023          	sw	a4,0(a5)
}
400012e0:	00000013          	nop
400012e4:	01c12403          	lw	s0,28(sp)
400012e8:	02010113          	addi	sp,sp,32
400012ec:	00008067          	ret

400012f0 <uart_writeAvailability>:
static uint32_t uart_writeAvailability(Uart_Reg *reg){
400012f0:	fe010113          	addi	sp,sp,-32
400012f4:	00812e23          	sw	s0,28(sp)
400012f8:	02010413          	addi	s0,sp,32
400012fc:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS >> 16) & 0xFF;
40001300:	fec42783          	lw	a5,-20(s0)
40001304:	0047a783          	lw	a5,4(a5)
40001308:	0107d793          	srli	a5,a5,0x10
4000130c:	0ff7f793          	zext.b	a5,a5
}
40001310:	00078513          	mv	a0,a5
40001314:	01c12403          	lw	s0,28(sp)
40001318:	02010113          	addi	sp,sp,32
4000131c:	00008067          	ret

40001320 <uart_readOccupancy>:
static uint32_t uart_readOccupancy(Uart_Reg *reg){
40001320:	fe010113          	addi	sp,sp,-32
40001324:	00812e23          	sw	s0,28(sp)
40001328:	02010413          	addi	s0,sp,32
4000132c:	fea42623          	sw	a0,-20(s0)
	return reg->STATUS >> 24;
40001330:	fec42783          	lw	a5,-20(s0)
40001334:	0047a783          	lw	a5,4(a5)
40001338:	0187d793          	srli	a5,a5,0x18
}
4000133c:	00078513          	mv	a0,a5
40001340:	01c12403          	lw	s0,28(sp)
40001344:	02010113          	addi	sp,sp,32
40001348:	00008067          	ret

4000134c <uart_write>:
static void uart_write(Uart_Reg *reg, uint32_t data){
4000134c:	fe010113          	addi	sp,sp,-32
40001350:	00112e23          	sw	ra,28(sp)
40001354:	00812c23          	sw	s0,24(sp)
40001358:	02010413          	addi	s0,sp,32
4000135c:	fea42623          	sw	a0,-20(s0)
40001360:	feb42423          	sw	a1,-24(s0)
	while(uart_writeAvailability(reg) == 0);
40001364:	00000013          	nop
40001368:	fec42503          	lw	a0,-20(s0)
4000136c:	f85ff0ef          	jal	ra,400012f0 <uart_writeAvailability>
40001370:	00050793          	mv	a5,a0
40001374:	fe078ae3          	beqz	a5,40001368 <uart_write+0x1c>
	reg->DATA = data;
40001378:	fec42783          	lw	a5,-20(s0)
4000137c:	fe842703          	lw	a4,-24(s0)
40001380:	00e7a023          	sw	a4,0(a5)
}
40001384:	00000013          	nop
40001388:	01c12083          	lw	ra,28(sp)
4000138c:	01812403          	lw	s0,24(sp)
40001390:	02010113          	addi	sp,sp,32
40001394:	00008067          	ret

40001398 <uart_applyConfig>:
static void uart_applyConfig(Uart_Reg *reg, Uart_Config *config){
40001398:	fe010113          	addi	sp,sp,-32
4000139c:	00812e23          	sw	s0,28(sp)
400013a0:	02010413          	addi	s0,sp,32
400013a4:	fea42623          	sw	a0,-20(s0)
400013a8:	feb42423          	sw	a1,-24(s0)
	reg->CLOCK_DIVIDER = config->clockDivider;
400013ac:	fe842783          	lw	a5,-24(s0)
400013b0:	00c7a703          	lw	a4,12(a5)
400013b4:	fec42783          	lw	a5,-20(s0)
400013b8:	00e7a423          	sw	a4,8(a5)
	reg->FRAME_CONFIG = ((config->dataLength-1) << 0) | (config->parity << 8) | (config->stop << 16);
400013bc:	fe842783          	lw	a5,-24(s0)
400013c0:	0007a783          	lw	a5,0(a5)
400013c4:	fff78713          	addi	a4,a5,-1
400013c8:	fe842783          	lw	a5,-24(s0)
400013cc:	0047a783          	lw	a5,4(a5)
400013d0:	00879793          	slli	a5,a5,0x8
400013d4:	00f76733          	or	a4,a4,a5
400013d8:	fe842783          	lw	a5,-24(s0)
400013dc:	0087a783          	lw	a5,8(a5)
400013e0:	01079793          	slli	a5,a5,0x10
400013e4:	00f76733          	or	a4,a4,a5
400013e8:	fec42783          	lw	a5,-20(s0)
400013ec:	00e7a623          	sw	a4,12(a5)
}
400013f0:	00000013          	nop
400013f4:	01c12403          	lw	s0,28(sp)
400013f8:	02010113          	addi	sp,sp,32
400013fc:	00008067          	ret

40001400 <vga_isBusy>:
static uint32_t vga_isBusy(Vga_Reg *reg){
40001400:	fe010113          	addi	sp,sp,-32
40001404:	00812e23          	sw	s0,28(sp)
40001408:	02010413          	addi	s0,sp,32
4000140c:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS & 2) != 0;
40001410:	fec42783          	lw	a5,-20(s0)
40001414:	0007a783          	lw	a5,0(a5)
40001418:	0027f793          	andi	a5,a5,2
4000141c:	00f037b3          	snez	a5,a5
40001420:	0ff7f793          	zext.b	a5,a5
}
40001424:	00078513          	mv	a0,a5
40001428:	01c12403          	lw	s0,28(sp)
4000142c:	02010113          	addi	sp,sp,32
40001430:	00008067          	ret

40001434 <vga_run>:
static void vga_run(Vga_Reg *reg){
40001434:	fe010113          	addi	sp,sp,-32
40001438:	00812e23          	sw	s0,28(sp)
4000143c:	02010413          	addi	s0,sp,32
40001440:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 1;
40001444:	fec42783          	lw	a5,-20(s0)
40001448:	00100713          	li	a4,1
4000144c:	00e7a023          	sw	a4,0(a5)
}
40001450:	00000013          	nop
40001454:	01c12403          	lw	s0,28(sp)
40001458:	02010113          	addi	sp,sp,32
4000145c:	00008067          	ret

40001460 <vga_stop>:
static void vga_stop(Vga_Reg *reg){
40001460:	fe010113          	addi	sp,sp,-32
40001464:	00112e23          	sw	ra,28(sp)
40001468:	00812c23          	sw	s0,24(sp)
4000146c:	02010413          	addi	s0,sp,32
40001470:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 0;
40001474:	fec42783          	lw	a5,-20(s0)
40001478:	0007a023          	sw	zero,0(a5)
	while(vga_isBusy(reg));
4000147c:	00000013          	nop
40001480:	fec42503          	lw	a0,-20(s0)
40001484:	f7dff0ef          	jal	ra,40001400 <vga_isBusy>
40001488:	00050793          	mv	a5,a0
4000148c:	fe079ae3          	bnez	a5,40001480 <vga_stop+0x20>
}
40001490:	00000013          	nop
40001494:	00000013          	nop
40001498:	01c12083          	lw	ra,28(sp)
4000149c:	01812403          	lw	s0,24(sp)
400014a0:	02010113          	addi	sp,sp,32
400014a4:	00008067          	ret

400014a8 <aes_write>:
#include "briey.h"
void aes_write(uint32_t iData, uint32_t iAddress)
{
400014a8:	fe010113          	addi	sp,sp,-32
400014ac:	00812e23          	sw	s0,28(sp)
400014b0:	02010413          	addi	s0,sp,32
400014b4:	fea42623          	sw	a0,-20(s0)
400014b8:	feb42423          	sw	a1,-24(s0)
	AES_BASE->ADDRESS		= iAddress;
400014bc:	f00027b7          	lui	a5,0xf0002
400014c0:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
400014c4:	fe842703          	lw	a4,-24(s0)
400014c8:	00e7a423          	sw	a4,8(a5)
	AES_BASE->WRITE_ENABLE 	= 1;
400014cc:	f00027b7          	lui	a5,0xf0002
400014d0:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
400014d4:	00100713          	li	a4,1
400014d8:	00e7a223          	sw	a4,4(a5)
	AES_BASE->IDATA			= iData;
400014dc:	f00027b7          	lui	a5,0xf0002
400014e0:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
400014e4:	fec42703          	lw	a4,-20(s0)
400014e8:	00e7a623          	sw	a4,12(a5)
	AES_BASE->CHIP_SELECT	= 1;
400014ec:	f00027b7          	lui	a5,0xf0002
400014f0:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
400014f4:	00100713          	li	a4,1
400014f8:	00e7a023          	sw	a4,0(a5)
	AES_BASE->CHIP_SELECT	= 0;
400014fc:	f00027b7          	lui	a5,0xf0002
40001500:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40001504:	0007a023          	sw	zero,0(a5)
}
40001508:	00000013          	nop
4000150c:	01c12403          	lw	s0,28(sp)
40001510:	02010113          	addi	sp,sp,32
40001514:	00008067          	ret

40001518 <aes_read>:
uint32_t aes_read(uint32_t iAddress)
{
40001518:	fd010113          	addi	sp,sp,-48
4000151c:	02812623          	sw	s0,44(sp)
40001520:	03010413          	addi	s0,sp,48
40001524:	fca42e23          	sw	a0,-36(s0)
	AES_BASE->ADDRESS		= iAddress;
40001528:	f00027b7          	lui	a5,0xf0002
4000152c:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40001530:	fdc42703          	lw	a4,-36(s0)
40001534:	00e7a423          	sw	a4,8(a5)
	AES_BASE->WRITE_ENABLE	= 0;
40001538:	f00027b7          	lui	a5,0xf0002
4000153c:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40001540:	0007a223          	sw	zero,4(a5)
	AES_BASE->CHIP_SELECT	= 1;
40001544:	f00027b7          	lui	a5,0xf0002
40001548:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
4000154c:	00100713          	li	a4,1
40001550:	00e7a023          	sw	a4,0(a5)
	uint32_t res 				= AES_BASE->ODATA;
40001554:	f00027b7          	lui	a5,0xf0002
40001558:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
4000155c:	0107a783          	lw	a5,16(a5)
40001560:	fef42623          	sw	a5,-20(s0)
	AES_BASE->CHIP_SELECT	= 0;
40001564:	f00027b7          	lui	a5,0xf0002
40001568:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
4000156c:	0007a023          	sw	zero,0(a5)
	return res;
40001570:	fec42783          	lw	a5,-20(s0)
}
40001574:	00078513          	mv	a0,a5
40001578:	02c12403          	lw	s0,44(sp)
4000157c:	03010113          	addi	sp,sp,48
40001580:	00008067          	ret

40001584 <aes_128_cipher>:
void aes_128_cipher(unsigned char operation, uint32_t *key, uint32_t *block, uint32_t *res) {
40001584:	fd010113          	addi	sp,sp,-48
40001588:	02112623          	sw	ra,44(sp)
4000158c:	02812423          	sw	s0,40(sp)
40001590:	02912223          	sw	s1,36(sp)
40001594:	03010413          	addi	s0,sp,48
40001598:	00050793          	mv	a5,a0
4000159c:	fcb42c23          	sw	a1,-40(s0)
400015a0:	fcc42a23          	sw	a2,-44(s0)
400015a4:	fcd42823          	sw	a3,-48(s0)
400015a8:	fcf40fa3          	sb	a5,-33(s0)
	aes_write(0x0,AES_ADDR_KEY_BASE +7);
400015ac:	01700593          	li	a1,23
400015b0:	00000513          	li	a0,0
400015b4:	ef5ff0ef          	jal	ra,400014a8 <aes_write>
	aes_write(0x0,AES_ADDR_KEY_BASE +6);
400015b8:	01600593          	li	a1,22
400015bc:	00000513          	li	a0,0
400015c0:	ee9ff0ef          	jal	ra,400014a8 <aes_write>
	aes_write(0x0,AES_ADDR_KEY_BASE +5);
400015c4:	01500593          	li	a1,21
400015c8:	00000513          	li	a0,0
400015cc:	eddff0ef          	jal	ra,400014a8 <aes_write>
	aes_write(0x0,AES_ADDR_KEY_BASE +4);
400015d0:	01400593          	li	a1,20
400015d4:	00000513          	li	a0,0
400015d8:	ed1ff0ef          	jal	ra,400014a8 <aes_write>
	aes_write(key[3],AES_ADDR_KEY_BASE +3);
400015dc:	fd842783          	lw	a5,-40(s0)
400015e0:	00c78793          	addi	a5,a5,12
400015e4:	0007a783          	lw	a5,0(a5)
400015e8:	01300593          	li	a1,19
400015ec:	00078513          	mv	a0,a5
400015f0:	eb9ff0ef          	jal	ra,400014a8 <aes_write>
	aes_write(key[2],AES_ADDR_KEY_BASE +2);
400015f4:	fd842783          	lw	a5,-40(s0)
400015f8:	00878793          	addi	a5,a5,8
400015fc:	0007a783          	lw	a5,0(a5)
40001600:	01200593          	li	a1,18
40001604:	00078513          	mv	a0,a5
40001608:	ea1ff0ef          	jal	ra,400014a8 <aes_write>
	aes_write(key[1],AES_ADDR_KEY_BASE +1);
4000160c:	fd842783          	lw	a5,-40(s0)
40001610:	00478793          	addi	a5,a5,4
40001614:	0007a783          	lw	a5,0(a5)
40001618:	01100593          	li	a1,17
4000161c:	00078513          	mv	a0,a5
40001620:	e89ff0ef          	jal	ra,400014a8 <aes_write>
	aes_write(key[0],AES_ADDR_KEY_BASE);
40001624:	fd842783          	lw	a5,-40(s0)
40001628:	0007a783          	lw	a5,0(a5)
4000162c:	01000593          	li	a1,16
40001630:	00078513          	mv	a0,a5
40001634:	e75ff0ef          	jal	ra,400014a8 <aes_write>

	aes_write(AES_CONFIG_128_KEY,AES_ADDR_CONFIG);
40001638:	00a00593          	li	a1,10
4000163c:	00000513          	li	a0,0
40001640:	e69ff0ef          	jal	ra,400014a8 <aes_write>
	aes_write(AES_CTRL_INIT_KEY,AES_ADDR_CTRL);
40001644:	00800593          	li	a1,8
40001648:	00100513          	li	a0,1
4000164c:	e5dff0ef          	jal	ra,400014a8 <aes_write>

    while(aes_read(AES_ADDR_STATUS) == 0);
40001650:	00000013          	nop
40001654:	00900513          	li	a0,9
40001658:	ec1ff0ef          	jal	ra,40001518 <aes_read>
4000165c:	00050793          	mv	a5,a0
40001660:	fe078ae3          	beqz	a5,40001654 <aes_128_cipher+0xd0>

    aes_write(block[3],AES_ADDR_BLOCK_BASE + 3);
40001664:	fd442783          	lw	a5,-44(s0)
40001668:	00c78793          	addi	a5,a5,12
4000166c:	0007a783          	lw	a5,0(a5)
40001670:	02300593          	li	a1,35
40001674:	00078513          	mv	a0,a5
40001678:	e31ff0ef          	jal	ra,400014a8 <aes_write>
    aes_write(block[2],AES_ADDR_BLOCK_BASE + 2);
4000167c:	fd442783          	lw	a5,-44(s0)
40001680:	00878793          	addi	a5,a5,8
40001684:	0007a783          	lw	a5,0(a5)
40001688:	02200593          	li	a1,34
4000168c:	00078513          	mv	a0,a5
40001690:	e19ff0ef          	jal	ra,400014a8 <aes_write>
    aes_write(block[1],AES_ADDR_BLOCK_BASE + 1);
40001694:	fd442783          	lw	a5,-44(s0)
40001698:	00478793          	addi	a5,a5,4
4000169c:	0007a783          	lw	a5,0(a5)
400016a0:	02100593          	li	a1,33
400016a4:	00078513          	mv	a0,a5
400016a8:	e01ff0ef          	jal	ra,400014a8 <aes_write>
    aes_write(block[0],AES_ADDR_BLOCK_BASE + 0);
400016ac:	fd442783          	lw	a5,-44(s0)
400016b0:	0007a783          	lw	a5,0(a5)
400016b4:	02000593          	li	a1,32
400016b8:	00078513          	mv	a0,a5
400016bc:	dedff0ef          	jal	ra,400014a8 <aes_write>


    unsigned char AES_CONFIG = 0x00;
400016c0:	fe0407a3          	sb	zero,-17(s0)
	if (operation == 0x01)
400016c4:	fdf44703          	lbu	a4,-33(s0)
400016c8:	00100793          	li	a5,1
400016cc:	00f71863          	bne	a4,a5,400016dc <aes_128_cipher+0x158>
		AES_CONFIG = AES_CONFIG_128_EN;
400016d0:	00100793          	li	a5,1
400016d4:	fef407a3          	sb	a5,-17(s0)
400016d8:	0080006f          	j	400016e0 <aes_128_cipher+0x15c>
	else
		AES_CONFIG = AES_CONFIG_128_DE;
400016dc:	fe0407a3          	sb	zero,-17(s0)

	aes_write(AES_CONFIG,AES_ADDR_CONFIG);
400016e0:	fef44783          	lbu	a5,-17(s0)
400016e4:	00a00593          	li	a1,10
400016e8:	00078513          	mv	a0,a5
400016ec:	dbdff0ef          	jal	ra,400014a8 <aes_write>
    aes_write(AES_CTRL_START, AES_ADDR_CTRL);
400016f0:	00800593          	li	a1,8
400016f4:	00200513          	li	a0,2
400016f8:	db1ff0ef          	jal	ra,400014a8 <aes_write>

    while(aes_read(AES_ADDR_STATUS) == 0);
400016fc:	00000013          	nop
40001700:	00900513          	li	a0,9
40001704:	e15ff0ef          	jal	ra,40001518 <aes_read>
40001708:	00050793          	mv	a5,a0
4000170c:	fe078ae3          	beqz	a5,40001700 <aes_128_cipher+0x17c>

    res[3] = aes_read(AES_ADDR_RESULT_BASE + 3);
40001710:	fd042783          	lw	a5,-48(s0)
40001714:	00c78493          	addi	s1,a5,12
40001718:	03300513          	li	a0,51
4000171c:	dfdff0ef          	jal	ra,40001518 <aes_read>
40001720:	00050793          	mv	a5,a0
40001724:	00f4a023          	sw	a5,0(s1)
    res[2] = aes_read(AES_ADDR_RESULT_BASE + 2);
40001728:	fd042783          	lw	a5,-48(s0)
4000172c:	00878493          	addi	s1,a5,8
40001730:	03200513          	li	a0,50
40001734:	de5ff0ef          	jal	ra,40001518 <aes_read>
40001738:	00050793          	mv	a5,a0
4000173c:	00f4a023          	sw	a5,0(s1)
    res[1] = aes_read(AES_ADDR_RESULT_BASE + 1);
40001740:	fd042783          	lw	a5,-48(s0)
40001744:	00478493          	addi	s1,a5,4
40001748:	03100513          	li	a0,49
4000174c:	dcdff0ef          	jal	ra,40001518 <aes_read>
40001750:	00050793          	mv	a5,a0
40001754:	00f4a023          	sw	a5,0(s1)
    res[0] = aes_read(AES_ADDR_RESULT_BASE + 0);
40001758:	03000513          	li	a0,48
4000175c:	dbdff0ef          	jal	ra,40001518 <aes_read>
40001760:	00050713          	mv	a4,a0
40001764:	fd042783          	lw	a5,-48(s0)
40001768:	00e7a023          	sw	a4,0(a5)

    //print result to terminal
	if(operation == 0x1)
4000176c:	fdf44703          	lbu	a4,-33(s0)
40001770:	00100793          	li	a5,1
40001774:	00f71a63          	bne	a4,a5,40001788 <aes_128_cipher+0x204>
		print("============================AES128 ENCRYPTTION==============================\r\n");
40001778:	400037b7          	lui	a5,0x40003
4000177c:	a5878513          	addi	a0,a5,-1448 # 40002a58 <vga_simRes_h160_v120+0x20>
40001780:	53c000ef          	jal	ra,40001cbc <print>
40001784:	0100006f          	j	40001794 <aes_128_cipher+0x210>
	else
		print("============================AES128 DECRYPTTION==============================\r\n");
40001788:	400037b7          	lui	a5,0x40003
4000178c:	aa878513          	addi	a0,a5,-1368 # 40002aa8 <vga_simRes_h160_v120+0x70>
40001790:	52c000ef          	jal	ra,40001cbc <print>
	print128bit("\r\nPLAIN_TEXT (128-bit) : ", block);
40001794:	fd442583          	lw	a1,-44(s0)
40001798:	400037b7          	lui	a5,0x40003
4000179c:	af878513          	addi	a0,a5,-1288 # 40002af8 <vga_simRes_h160_v120+0xc0>
400017a0:	7e8000ef          	jal	ra,40001f88 <print128bit>
	print128bit("KEY (128-bit) : ", key);
400017a4:	fd842583          	lw	a1,-40(s0)
400017a8:	400037b7          	lui	a5,0x40003
400017ac:	b1478513          	addi	a0,a5,-1260 # 40002b14 <vga_simRes_h160_v120+0xdc>
400017b0:	7d8000ef          	jal	ra,40001f88 <print128bit>
	print128bit("RESULT (128-bit) : ", res);
400017b4:	fd042583          	lw	a1,-48(s0)
400017b8:	400037b7          	lui	a5,0x40003
400017bc:	b2878513          	addi	a0,a5,-1240 # 40002b28 <vga_simRes_h160_v120+0xf0>
400017c0:	7c8000ef          	jal	ra,40001f88 <print128bit>
	print("\r\n============================================================================\r\n");
400017c4:	400037b7          	lui	a5,0x40003
400017c8:	b3c78513          	addi	a0,a5,-1220 # 40002b3c <vga_simRes_h160_v120+0x104>
400017cc:	4f0000ef          	jal	ra,40001cbc <print>
}
400017d0:	00000013          	nop
400017d4:	02c12083          	lw	ra,44(sp)
400017d8:	02812403          	lw	s0,40(sp)
400017dc:	02412483          	lw	s1,36(sp)
400017e0:	03010113          	addi	sp,sp,48
400017e4:	00008067          	ret

400017e8 <aes_256_cipher>:

void aes_256_cipher(unsigned char operation, uint32_t *key, uint32_t *block, uint32_t *res) {
400017e8:	fd010113          	addi	sp,sp,-48
400017ec:	02112623          	sw	ra,44(sp)
400017f0:	02812423          	sw	s0,40(sp)
400017f4:	02912223          	sw	s1,36(sp)
400017f8:	03010413          	addi	s0,sp,48
400017fc:	00050793          	mv	a5,a0
40001800:	fcb42c23          	sw	a1,-40(s0)
40001804:	fcc42a23          	sw	a2,-44(s0)
40001808:	fcd42823          	sw	a3,-48(s0)
4000180c:	fcf40fa3          	sb	a5,-33(s0)
	aes_write(key[7],AES_ADDR_KEY_BASE +7);
40001810:	fd842783          	lw	a5,-40(s0)
40001814:	01c78793          	addi	a5,a5,28
40001818:	0007a783          	lw	a5,0(a5)
4000181c:	01700593          	li	a1,23
40001820:	00078513          	mv	a0,a5
40001824:	c85ff0ef          	jal	ra,400014a8 <aes_write>
	aes_write(key[6],AES_ADDR_KEY_BASE +6);
40001828:	fd842783          	lw	a5,-40(s0)
4000182c:	01878793          	addi	a5,a5,24
40001830:	0007a783          	lw	a5,0(a5)
40001834:	01600593          	li	a1,22
40001838:	00078513          	mv	a0,a5
4000183c:	c6dff0ef          	jal	ra,400014a8 <aes_write>
	aes_write(key[5],AES_ADDR_KEY_BASE +5);
40001840:	fd842783          	lw	a5,-40(s0)
40001844:	01478793          	addi	a5,a5,20
40001848:	0007a783          	lw	a5,0(a5)
4000184c:	01500593          	li	a1,21
40001850:	00078513          	mv	a0,a5
40001854:	c55ff0ef          	jal	ra,400014a8 <aes_write>
	aes_write(key[4],AES_ADDR_KEY_BASE +4);
40001858:	fd842783          	lw	a5,-40(s0)
4000185c:	01078793          	addi	a5,a5,16
40001860:	0007a783          	lw	a5,0(a5)
40001864:	01400593          	li	a1,20
40001868:	00078513          	mv	a0,a5
4000186c:	c3dff0ef          	jal	ra,400014a8 <aes_write>
	aes_write(key[3],AES_ADDR_KEY_BASE +3);
40001870:	fd842783          	lw	a5,-40(s0)
40001874:	00c78793          	addi	a5,a5,12
40001878:	0007a783          	lw	a5,0(a5)
4000187c:	01300593          	li	a1,19
40001880:	00078513          	mv	a0,a5
40001884:	c25ff0ef          	jal	ra,400014a8 <aes_write>
	aes_write(key[2],AES_ADDR_KEY_BASE +2);
40001888:	fd842783          	lw	a5,-40(s0)
4000188c:	00878793          	addi	a5,a5,8
40001890:	0007a783          	lw	a5,0(a5)
40001894:	01200593          	li	a1,18
40001898:	00078513          	mv	a0,a5
4000189c:	c0dff0ef          	jal	ra,400014a8 <aes_write>
	aes_write(key[1],AES_ADDR_KEY_BASE +1);
400018a0:	fd842783          	lw	a5,-40(s0)
400018a4:	00478793          	addi	a5,a5,4
400018a8:	0007a783          	lw	a5,0(a5)
400018ac:	01100593          	li	a1,17
400018b0:	00078513          	mv	a0,a5
400018b4:	bf5ff0ef          	jal	ra,400014a8 <aes_write>
	aes_write(key[0],AES_ADDR_KEY_BASE);
400018b8:	fd842783          	lw	a5,-40(s0)
400018bc:	0007a783          	lw	a5,0(a5)
400018c0:	01000593          	li	a1,16
400018c4:	00078513          	mv	a0,a5
400018c8:	be1ff0ef          	jal	ra,400014a8 <aes_write>

	aes_write(AES_CONFIG_256_KEY,AES_ADDR_CONFIG);
400018cc:	00a00593          	li	a1,10
400018d0:	00200513          	li	a0,2
400018d4:	bd5ff0ef          	jal	ra,400014a8 <aes_write>
	aes_write(AES_CTRL_INIT_KEY,AES_ADDR_CTRL);
400018d8:	00800593          	li	a1,8
400018dc:	00100513          	li	a0,1
400018e0:	bc9ff0ef          	jal	ra,400014a8 <aes_write>

    while(aes_read(AES_ADDR_STATUS) == 0);
400018e4:	00000013          	nop
400018e8:	00900513          	li	a0,9
400018ec:	c2dff0ef          	jal	ra,40001518 <aes_read>
400018f0:	00050793          	mv	a5,a0
400018f4:	fe078ae3          	beqz	a5,400018e8 <aes_256_cipher+0x100>

    aes_write(block[3],AES_ADDR_BLOCK_BASE + 3);
400018f8:	fd442783          	lw	a5,-44(s0)
400018fc:	00c78793          	addi	a5,a5,12
40001900:	0007a783          	lw	a5,0(a5)
40001904:	02300593          	li	a1,35
40001908:	00078513          	mv	a0,a5
4000190c:	b9dff0ef          	jal	ra,400014a8 <aes_write>
    aes_write(block[2],AES_ADDR_BLOCK_BASE + 2);
40001910:	fd442783          	lw	a5,-44(s0)
40001914:	00878793          	addi	a5,a5,8
40001918:	0007a783          	lw	a5,0(a5)
4000191c:	02200593          	li	a1,34
40001920:	00078513          	mv	a0,a5
40001924:	b85ff0ef          	jal	ra,400014a8 <aes_write>
    aes_write(block[1],AES_ADDR_BLOCK_BASE + 1);
40001928:	fd442783          	lw	a5,-44(s0)
4000192c:	00478793          	addi	a5,a5,4
40001930:	0007a783          	lw	a5,0(a5)
40001934:	02100593          	li	a1,33
40001938:	00078513          	mv	a0,a5
4000193c:	b6dff0ef          	jal	ra,400014a8 <aes_write>
    aes_write(block[0],AES_ADDR_BLOCK_BASE + 0);
40001940:	fd442783          	lw	a5,-44(s0)
40001944:	0007a783          	lw	a5,0(a5)
40001948:	02000593          	li	a1,32
4000194c:	00078513          	mv	a0,a5
40001950:	b59ff0ef          	jal	ra,400014a8 <aes_write>


    unsigned char AES_CONFIG = 0x00;
40001954:	fe0407a3          	sb	zero,-17(s0)
	if (operation == 0x01)
40001958:	fdf44703          	lbu	a4,-33(s0)
4000195c:	00100793          	li	a5,1
40001960:	00f71863          	bne	a4,a5,40001970 <aes_256_cipher+0x188>
		AES_CONFIG = AES_CONFIG_256_EN;
40001964:	00300793          	li	a5,3
40001968:	fef407a3          	sb	a5,-17(s0)
4000196c:	00c0006f          	j	40001978 <aes_256_cipher+0x190>
	else
		AES_CONFIG = AES_CONFIG_256_DE;
40001970:	00200793          	li	a5,2
40001974:	fef407a3          	sb	a5,-17(s0)

	aes_write(AES_CONFIG, AES_ADDR_CONFIG);
40001978:	fef44783          	lbu	a5,-17(s0)
4000197c:	00a00593          	li	a1,10
40001980:	00078513          	mv	a0,a5
40001984:	b25ff0ef          	jal	ra,400014a8 <aes_write>
    aes_write(AES_CTRL_START, AES_ADDR_CTRL);
40001988:	00800593          	li	a1,8
4000198c:	00200513          	li	a0,2
40001990:	b19ff0ef          	jal	ra,400014a8 <aes_write>

    while(aes_read(AES_ADDR_STATUS) == 0);
40001994:	00000013          	nop
40001998:	00900513          	li	a0,9
4000199c:	b7dff0ef          	jal	ra,40001518 <aes_read>
400019a0:	00050793          	mv	a5,a0
400019a4:	fe078ae3          	beqz	a5,40001998 <aes_256_cipher+0x1b0>

    res[3] = aes_read(AES_ADDR_RESULT_BASE + 3);
400019a8:	fd042783          	lw	a5,-48(s0)
400019ac:	00c78493          	addi	s1,a5,12
400019b0:	03300513          	li	a0,51
400019b4:	b65ff0ef          	jal	ra,40001518 <aes_read>
400019b8:	00050793          	mv	a5,a0
400019bc:	00f4a023          	sw	a5,0(s1)
    res[2] = aes_read(AES_ADDR_RESULT_BASE + 2);
400019c0:	fd042783          	lw	a5,-48(s0)
400019c4:	00878493          	addi	s1,a5,8
400019c8:	03200513          	li	a0,50
400019cc:	b4dff0ef          	jal	ra,40001518 <aes_read>
400019d0:	00050793          	mv	a5,a0
400019d4:	00f4a023          	sw	a5,0(s1)
    res[1] = aes_read(AES_ADDR_RESULT_BASE + 1);
400019d8:	fd042783          	lw	a5,-48(s0)
400019dc:	00478493          	addi	s1,a5,4
400019e0:	03100513          	li	a0,49
400019e4:	b35ff0ef          	jal	ra,40001518 <aes_read>
400019e8:	00050793          	mv	a5,a0
400019ec:	00f4a023          	sw	a5,0(s1)
    res[0] = aes_read(AES_ADDR_RESULT_BASE + 0);
400019f0:	03000513          	li	a0,48
400019f4:	b25ff0ef          	jal	ra,40001518 <aes_read>
400019f8:	00050713          	mv	a4,a0
400019fc:	fd042783          	lw	a5,-48(s0)
40001a00:	00e7a023          	sw	a4,0(a5)

    //print result to terminal
	if(operation == 0x1)
40001a04:	fdf44703          	lbu	a4,-33(s0)
40001a08:	00100793          	li	a5,1
40001a0c:	00f71a63          	bne	a4,a5,40001a20 <aes_256_cipher+0x238>
		print("======================================AES256 ENCRYPTTION========================================\r\n");
40001a10:	400037b7          	lui	a5,0x40003
40001a14:	b9078513          	addi	a0,a5,-1136 # 40002b90 <vga_simRes_h160_v120+0x158>
40001a18:	2a4000ef          	jal	ra,40001cbc <print>
40001a1c:	0100006f          	j	40001a2c <aes_256_cipher+0x244>
	else
		print("======================================AES256 DECRYPTTION========================================\r\n");
40001a20:	400037b7          	lui	a5,0x40003
40001a24:	bf478513          	addi	a0,a5,-1036 # 40002bf4 <vga_simRes_h160_v120+0x1bc>
40001a28:	294000ef          	jal	ra,40001cbc <print>
	print128bit("\r\nPLAIN_TEXT (128-bit) : ", block);
40001a2c:	fd442583          	lw	a1,-44(s0)
40001a30:	400037b7          	lui	a5,0x40003
40001a34:	af878513          	addi	a0,a5,-1288 # 40002af8 <vga_simRes_h160_v120+0xc0>
40001a38:	550000ef          	jal	ra,40001f88 <print128bit>
	print256bit("KEY (256-bit) : ", key);
40001a3c:	fd842583          	lw	a1,-40(s0)
40001a40:	400037b7          	lui	a5,0x40003
40001a44:	c5878513          	addi	a0,a5,-936 # 40002c58 <vga_simRes_h160_v120+0x220>
40001a48:	644000ef          	jal	ra,4000208c <print256bit>
	print128bit("RESULT (128-bit) : ", res);
40001a4c:	fd042583          	lw	a1,-48(s0)
40001a50:	400037b7          	lui	a5,0x40003
40001a54:	b2878513          	addi	a0,a5,-1240 # 40002b28 <vga_simRes_h160_v120+0xf0>
40001a58:	530000ef          	jal	ra,40001f88 <print128bit>
	print("\r\n================================================================================================\r\n");
40001a5c:	400037b7          	lui	a5,0x40003
40001a60:	c6c78513          	addi	a0,a5,-916 # 40002c6c <vga_simRes_h160_v120+0x234>
40001a64:	258000ef          	jal	ra,40001cbc <print>

}
40001a68:	00000013          	nop
40001a6c:	02c12083          	lw	ra,44(sp)
40001a70:	02812403          	lw	s0,40(sp)
40001a74:	02412483          	lw	s1,36(sp)
40001a78:	03010113          	addi	sp,sp,48
40001a7c:	00008067          	ret

40001a80 <timer_init>:
static void timer_init(Timer_Reg *reg){
40001a80:	fe010113          	addi	sp,sp,-32
40001a84:	00812e23          	sw	s0,28(sp)
40001a88:	02010413          	addi	s0,sp,32
40001a8c:	fea42623          	sw	a0,-20(s0)
	reg->CLEARS_TICKS  = 0;
40001a90:	fec42783          	lw	a5,-20(s0)
40001a94:	0007a023          	sw	zero,0(a5)
	reg->VALUE = 0;
40001a98:	fec42783          	lw	a5,-20(s0)
40001a9c:	0007a423          	sw	zero,8(a5)
}
40001aa0:	00000013          	nop
40001aa4:	01c12403          	lw	s0,28(sp)
40001aa8:	02010113          	addi	sp,sp,32
40001aac:	00008067          	ret

40001ab0 <prescaler_init>:
static void prescaler_init(Prescaler_Reg* reg){
40001ab0:	fe010113          	addi	sp,sp,-32
40001ab4:	00812e23          	sw	s0,28(sp)
40001ab8:	02010413          	addi	s0,sp,32
40001abc:	fea42623          	sw	a0,-20(s0)
}
40001ac0:	00000013          	nop
40001ac4:	01c12403          	lw	s0,28(sp)
40001ac8:	02010113          	addi	sp,sp,32
40001acc:	00008067          	ret

40001ad0 <interruptCtrl_init>:
static void interruptCtrl_init(InterruptCtrl_Reg* reg){
40001ad0:	fe010113          	addi	sp,sp,-32
40001ad4:	00812e23          	sw	s0,28(sp)
40001ad8:	02010413          	addi	s0,sp,32
40001adc:	fea42623          	sw	a0,-20(s0)
	reg->MASKS = 0;
40001ae0:	fec42783          	lw	a5,-20(s0)
40001ae4:	0007a223          	sw	zero,4(a5)
	reg->PENDINGS = 0xFFFFFFFF;
40001ae8:	fec42783          	lw	a5,-20(s0)
40001aec:	fff00713          	li	a4,-1
40001af0:	00e7a023          	sw	a4,0(a5)
}
40001af4:	00000013          	nop
40001af8:	01c12403          	lw	s0,28(sp)
40001afc:	02010113          	addi	sp,sp,32
40001b00:	00008067          	ret

40001b04 <uart_writeAvailability>:
static uint32_t uart_writeAvailability(Uart_Reg *reg){
40001b04:	fe010113          	addi	sp,sp,-32
40001b08:	00812e23          	sw	s0,28(sp)
40001b0c:	02010413          	addi	s0,sp,32
40001b10:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS >> 16) & 0xFF;
40001b14:	fec42783          	lw	a5,-20(s0)
40001b18:	0047a783          	lw	a5,4(a5)
40001b1c:	0107d793          	srli	a5,a5,0x10
40001b20:	0ff7f793          	zext.b	a5,a5
}
40001b24:	00078513          	mv	a0,a5
40001b28:	01c12403          	lw	s0,28(sp)
40001b2c:	02010113          	addi	sp,sp,32
40001b30:	00008067          	ret

40001b34 <uart_readOccupancy>:
static uint32_t uart_readOccupancy(Uart_Reg *reg){
40001b34:	fe010113          	addi	sp,sp,-32
40001b38:	00812e23          	sw	s0,28(sp)
40001b3c:	02010413          	addi	s0,sp,32
40001b40:	fea42623          	sw	a0,-20(s0)
	return reg->STATUS >> 24;
40001b44:	fec42783          	lw	a5,-20(s0)
40001b48:	0047a783          	lw	a5,4(a5)
40001b4c:	0187d793          	srli	a5,a5,0x18
}
40001b50:	00078513          	mv	a0,a5
40001b54:	01c12403          	lw	s0,28(sp)
40001b58:	02010113          	addi	sp,sp,32
40001b5c:	00008067          	ret

40001b60 <uart_write>:
static void uart_write(Uart_Reg *reg, uint32_t data){
40001b60:	fe010113          	addi	sp,sp,-32
40001b64:	00112e23          	sw	ra,28(sp)
40001b68:	00812c23          	sw	s0,24(sp)
40001b6c:	02010413          	addi	s0,sp,32
40001b70:	fea42623          	sw	a0,-20(s0)
40001b74:	feb42423          	sw	a1,-24(s0)
	while(uart_writeAvailability(reg) == 0);
40001b78:	00000013          	nop
40001b7c:	fec42503          	lw	a0,-20(s0)
40001b80:	f85ff0ef          	jal	ra,40001b04 <uart_writeAvailability>
40001b84:	00050793          	mv	a5,a0
40001b88:	fe078ae3          	beqz	a5,40001b7c <uart_write+0x1c>
	reg->DATA = data;
40001b8c:	fec42783          	lw	a5,-20(s0)
40001b90:	fe842703          	lw	a4,-24(s0)
40001b94:	00e7a023          	sw	a4,0(a5)
}
40001b98:	00000013          	nop
40001b9c:	01c12083          	lw	ra,28(sp)
40001ba0:	01812403          	lw	s0,24(sp)
40001ba4:	02010113          	addi	sp,sp,32
40001ba8:	00008067          	ret

40001bac <uart_applyConfig>:
static void uart_applyConfig(Uart_Reg *reg, Uart_Config *config){
40001bac:	fe010113          	addi	sp,sp,-32
40001bb0:	00812e23          	sw	s0,28(sp)
40001bb4:	02010413          	addi	s0,sp,32
40001bb8:	fea42623          	sw	a0,-20(s0)
40001bbc:	feb42423          	sw	a1,-24(s0)
	reg->CLOCK_DIVIDER = config->clockDivider;
40001bc0:	fe842783          	lw	a5,-24(s0)
40001bc4:	00c7a703          	lw	a4,12(a5)
40001bc8:	fec42783          	lw	a5,-20(s0)
40001bcc:	00e7a423          	sw	a4,8(a5)
	reg->FRAME_CONFIG = ((config->dataLength-1) << 0) | (config->parity << 8) | (config->stop << 16);
40001bd0:	fe842783          	lw	a5,-24(s0)
40001bd4:	0007a783          	lw	a5,0(a5)
40001bd8:	fff78713          	addi	a4,a5,-1
40001bdc:	fe842783          	lw	a5,-24(s0)
40001be0:	0047a783          	lw	a5,4(a5)
40001be4:	00879793          	slli	a5,a5,0x8
40001be8:	00f76733          	or	a4,a4,a5
40001bec:	fe842783          	lw	a5,-24(s0)
40001bf0:	0087a783          	lw	a5,8(a5)
40001bf4:	01079793          	slli	a5,a5,0x10
40001bf8:	00f76733          	or	a4,a4,a5
40001bfc:	fec42783          	lw	a5,-20(s0)
40001c00:	00e7a623          	sw	a4,12(a5)
}
40001c04:	00000013          	nop
40001c08:	01c12403          	lw	s0,28(sp)
40001c0c:	02010113          	addi	sp,sp,32
40001c10:	00008067          	ret

40001c14 <vga_isBusy>:
static uint32_t vga_isBusy(Vga_Reg *reg){
40001c14:	fe010113          	addi	sp,sp,-32
40001c18:	00812e23          	sw	s0,28(sp)
40001c1c:	02010413          	addi	s0,sp,32
40001c20:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS & 2) != 0;
40001c24:	fec42783          	lw	a5,-20(s0)
40001c28:	0007a783          	lw	a5,0(a5)
40001c2c:	0027f793          	andi	a5,a5,2
40001c30:	00f037b3          	snez	a5,a5
40001c34:	0ff7f793          	zext.b	a5,a5
}
40001c38:	00078513          	mv	a0,a5
40001c3c:	01c12403          	lw	s0,28(sp)
40001c40:	02010113          	addi	sp,sp,32
40001c44:	00008067          	ret

40001c48 <vga_run>:
static void vga_run(Vga_Reg *reg){
40001c48:	fe010113          	addi	sp,sp,-32
40001c4c:	00812e23          	sw	s0,28(sp)
40001c50:	02010413          	addi	s0,sp,32
40001c54:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 1;
40001c58:	fec42783          	lw	a5,-20(s0)
40001c5c:	00100713          	li	a4,1
40001c60:	00e7a023          	sw	a4,0(a5)
}
40001c64:	00000013          	nop
40001c68:	01c12403          	lw	s0,28(sp)
40001c6c:	02010113          	addi	sp,sp,32
40001c70:	00008067          	ret

40001c74 <vga_stop>:
static void vga_stop(Vga_Reg *reg){
40001c74:	fe010113          	addi	sp,sp,-32
40001c78:	00112e23          	sw	ra,28(sp)
40001c7c:	00812c23          	sw	s0,24(sp)
40001c80:	02010413          	addi	s0,sp,32
40001c84:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 0;
40001c88:	fec42783          	lw	a5,-20(s0)
40001c8c:	0007a023          	sw	zero,0(a5)
	while(vga_isBusy(reg));
40001c90:	00000013          	nop
40001c94:	fec42503          	lw	a0,-20(s0)
40001c98:	f7dff0ef          	jal	ra,40001c14 <vga_isBusy>
40001c9c:	00050793          	mv	a5,a0
40001ca0:	fe079ae3          	bnez	a5,40001c94 <vga_stop+0x20>
}
40001ca4:	00000013          	nop
40001ca8:	00000013          	nop
40001cac:	01c12083          	lw	ra,28(sp)
40001cb0:	01812403          	lw	s0,24(sp)
40001cb4:	02010113          	addi	sp,sp,32
40001cb8:	00008067          	ret

40001cbc <print>:
#include <briey.h>

void print(char *str){
40001cbc:	fe010113          	addi	sp,sp,-32
40001cc0:	00112e23          	sw	ra,28(sp)
40001cc4:	00812c23          	sw	s0,24(sp)
40001cc8:	02010413          	addi	s0,sp,32
40001ccc:	fea42623          	sw	a0,-20(s0)
	while(*str){
40001cd0:	0200006f          	j	40001cf0 <print+0x34>
		uart_write(UART,*(str++));
40001cd4:	fec42783          	lw	a5,-20(s0)
40001cd8:	00178713          	addi	a4,a5,1
40001cdc:	fee42623          	sw	a4,-20(s0)
40001ce0:	0007c783          	lbu	a5,0(a5)
40001ce4:	00078593          	mv	a1,a5
40001ce8:	f0010537          	lui	a0,0xf0010
40001cec:	e75ff0ef          	jal	ra,40001b60 <uart_write>
	while(*str){
40001cf0:	fec42783          	lw	a5,-20(s0)
40001cf4:	0007c783          	lbu	a5,0(a5)
40001cf8:	fc079ee3          	bnez	a5,40001cd4 <print+0x18>
	}
}
40001cfc:	00000013          	nop
40001d00:	00000013          	nop
40001d04:	01c12083          	lw	ra,28(sp)
40001d08:	01812403          	lw	s0,24(sp)
40001d0c:	02010113          	addi	sp,sp,32
40001d10:	00008067          	ret

40001d14 <print16bit>:

void print16bit(uint32_t n)
{
40001d14:	fc010113          	addi	sp,sp,-64
40001d18:	02112e23          	sw	ra,60(sp)
40001d1c:	02812c23          	sw	s0,56(sp)
40001d20:	04010413          	addi	s0,sp,64
40001d24:	fca42623          	sw	a0,-52(s0)

    int i = 0;
40001d28:	fe042623          	sw	zero,-20(s0)
    char outbuf_inv[8]="";
40001d2c:	fc042e23          	sw	zero,-36(s0)
40001d30:	fe042023          	sw	zero,-32(s0)
    do{
    	outbuf_inv[i] = "0123456789abcdef"[n % 16];
40001d34:	fcc42783          	lw	a5,-52(s0)
40001d38:	00f7f793          	andi	a5,a5,15
40001d3c:	40003737          	lui	a4,0x40003
40001d40:	d3870713          	addi	a4,a4,-712 # 40002d38 <vga_simRes_h160_v120+0x24>
40001d44:	00f707b3          	add	a5,a4,a5
40001d48:	0007c703          	lbu	a4,0(a5)
40001d4c:	fec42783          	lw	a5,-20(s0)
40001d50:	ff040693          	addi	a3,s0,-16
40001d54:	00f687b3          	add	a5,a3,a5
40001d58:	fee78623          	sb	a4,-20(a5)
        i++;
40001d5c:	fec42783          	lw	a5,-20(s0)
40001d60:	00178793          	addi	a5,a5,1
40001d64:	fef42623          	sw	a5,-20(s0)
        n = n/16;
40001d68:	fcc42783          	lw	a5,-52(s0)
40001d6c:	0047d793          	srli	a5,a5,0x4
40001d70:	fcf42623          	sw	a5,-52(s0)
    }while( n > 0);
40001d74:	fcc42783          	lw	a5,-52(s0)
40001d78:	fa079ee3          	bnez	a5,40001d34 <print16bit+0x20>
    if(i<8) {
40001d7c:	fec42703          	lw	a4,-20(s0)
40001d80:	00700793          	li	a5,7
40001d84:	02e7ce63          	blt	a5,a4,40001dc0 <print16bit+0xac>
    	for(int j=7;j>=i;j--){
40001d88:	00700793          	li	a5,7
40001d8c:	fef42423          	sw	a5,-24(s0)
40001d90:	0240006f          	j	40001db4 <print16bit+0xa0>
    		outbuf_inv[j]="0"[0];
40001d94:	03000713          	li	a4,48
40001d98:	fe842783          	lw	a5,-24(s0)
40001d9c:	ff040693          	addi	a3,s0,-16
40001da0:	00f687b3          	add	a5,a3,a5
40001da4:	fee78623          	sb	a4,-20(a5)
    	for(int j=7;j>=i;j--){
40001da8:	fe842783          	lw	a5,-24(s0)
40001dac:	fff78793          	addi	a5,a5,-1
40001db0:	fef42423          	sw	a5,-24(s0)
40001db4:	fe842703          	lw	a4,-24(s0)
40001db8:	fec42783          	lw	a5,-20(s0)
40001dbc:	fcf75ce3          	bge	a4,a5,40001d94 <print16bit+0x80>
    	}
    }
    for(int j=3;j>=0;j--)
40001dc0:	00300793          	li	a5,3
40001dc4:	fef42223          	sw	a5,-28(s0)
40001dc8:	02c0006f          	j	40001df4 <print16bit+0xe0>
    {
    	uart_write(UART,outbuf_inv[j]);
40001dcc:	fe442783          	lw	a5,-28(s0)
40001dd0:	ff040713          	addi	a4,s0,-16
40001dd4:	00f707b3          	add	a5,a4,a5
40001dd8:	fec7c783          	lbu	a5,-20(a5)
40001ddc:	00078593          	mv	a1,a5
40001de0:	f0010537          	lui	a0,0xf0010
40001de4:	d7dff0ef          	jal	ra,40001b60 <uart_write>
    for(int j=3;j>=0;j--)
40001de8:	fe442783          	lw	a5,-28(s0)
40001dec:	fff78793          	addi	a5,a5,-1
40001df0:	fef42223          	sw	a5,-28(s0)
40001df4:	fe442783          	lw	a5,-28(s0)
40001df8:	fc07dae3          	bgez	a5,40001dcc <print16bit+0xb8>
    }
    print(" ");
40001dfc:	400037b7          	lui	a5,0x40003
40001e00:	d3478513          	addi	a0,a5,-716 # 40002d34 <vga_simRes_h160_v120+0x20>
40001e04:	eb9ff0ef          	jal	ra,40001cbc <print>
}
40001e08:	00000013          	nop
40001e0c:	03c12083          	lw	ra,60(sp)
40001e10:	03812403          	lw	s0,56(sp)
40001e14:	04010113          	addi	sp,sp,64
40001e18:	00008067          	ret

40001e1c <print32bit>:
void print32bit(uint32_t n)
{
40001e1c:	fc010113          	addi	sp,sp,-64
40001e20:	02112e23          	sw	ra,60(sp)
40001e24:	02812c23          	sw	s0,56(sp)
40001e28:	04010413          	addi	s0,sp,64
40001e2c:	fca42623          	sw	a0,-52(s0)

    int i = 0;
40001e30:	fe042623          	sw	zero,-20(s0)
    char outbuf_inv[8]="";
40001e34:	fc042e23          	sw	zero,-36(s0)
40001e38:	fe042023          	sw	zero,-32(s0)
    do{
    	outbuf_inv[i] = "0123456789abcdef"[n % 16];
40001e3c:	fcc42783          	lw	a5,-52(s0)
40001e40:	00f7f793          	andi	a5,a5,15
40001e44:	40003737          	lui	a4,0x40003
40001e48:	d3870713          	addi	a4,a4,-712 # 40002d38 <vga_simRes_h160_v120+0x24>
40001e4c:	00f707b3          	add	a5,a4,a5
40001e50:	0007c703          	lbu	a4,0(a5)
40001e54:	fec42783          	lw	a5,-20(s0)
40001e58:	ff040693          	addi	a3,s0,-16
40001e5c:	00f687b3          	add	a5,a3,a5
40001e60:	fee78623          	sb	a4,-20(a5)
        i++;
40001e64:	fec42783          	lw	a5,-20(s0)
40001e68:	00178793          	addi	a5,a5,1
40001e6c:	fef42623          	sw	a5,-20(s0)
        n = n/16;
40001e70:	fcc42783          	lw	a5,-52(s0)
40001e74:	0047d793          	srli	a5,a5,0x4
40001e78:	fcf42623          	sw	a5,-52(s0)
    }while( n > 0);
40001e7c:	fcc42783          	lw	a5,-52(s0)
40001e80:	fa079ee3          	bnez	a5,40001e3c <print32bit+0x20>
    if(i<8) {
40001e84:	fec42703          	lw	a4,-20(s0)
40001e88:	00700793          	li	a5,7
40001e8c:	02e7ce63          	blt	a5,a4,40001ec8 <print32bit+0xac>
    	for(int j=7;j>=i;j--){
40001e90:	00700793          	li	a5,7
40001e94:	fef42423          	sw	a5,-24(s0)
40001e98:	0240006f          	j	40001ebc <print32bit+0xa0>
    		outbuf_inv[j]="0"[0];
40001e9c:	03000713          	li	a4,48
40001ea0:	fe842783          	lw	a5,-24(s0)
40001ea4:	ff040693          	addi	a3,s0,-16
40001ea8:	00f687b3          	add	a5,a3,a5
40001eac:	fee78623          	sb	a4,-20(a5)
    	for(int j=7;j>=i;j--){
40001eb0:	fe842783          	lw	a5,-24(s0)
40001eb4:	fff78793          	addi	a5,a5,-1
40001eb8:	fef42423          	sw	a5,-24(s0)
40001ebc:	fe842703          	lw	a4,-24(s0)
40001ec0:	fec42783          	lw	a5,-20(s0)
40001ec4:	fcf75ce3          	bge	a4,a5,40001e9c <print32bit+0x80>
    	}
    }
    for(int j=7;j>=0;j--)
40001ec8:	00700793          	li	a5,7
40001ecc:	fef42223          	sw	a5,-28(s0)
40001ed0:	02c0006f          	j	40001efc <print32bit+0xe0>
    {
    	uart_write(UART,outbuf_inv[j]);
40001ed4:	fe442783          	lw	a5,-28(s0)
40001ed8:	ff040713          	addi	a4,s0,-16
40001edc:	00f707b3          	add	a5,a4,a5
40001ee0:	fec7c783          	lbu	a5,-20(a5)
40001ee4:	00078593          	mv	a1,a5
40001ee8:	f0010537          	lui	a0,0xf0010
40001eec:	c75ff0ef          	jal	ra,40001b60 <uart_write>
    for(int j=7;j>=0;j--)
40001ef0:	fe442783          	lw	a5,-28(s0)
40001ef4:	fff78793          	addi	a5,a5,-1
40001ef8:	fef42223          	sw	a5,-28(s0)
40001efc:	fe442783          	lw	a5,-28(s0)
40001f00:	fc07dae3          	bgez	a5,40001ed4 <print32bit+0xb8>
    }
    print(" ");
40001f04:	400037b7          	lui	a5,0x40003
40001f08:	d3478513          	addi	a0,a5,-716 # 40002d34 <vga_simRes_h160_v120+0x20>
40001f0c:	db1ff0ef          	jal	ra,40001cbc <print>
}
40001f10:	00000013          	nop
40001f14:	03c12083          	lw	ra,60(sp)
40001f18:	03812403          	lw	s0,56(sp)
40001f1c:	04010113          	addi	sp,sp,64
40001f20:	00008067          	ret

40001f24 <print64bit>:

void print64bit(char *message,uint32_t *num)
{
40001f24:	fe010113          	addi	sp,sp,-32
40001f28:	00112e23          	sw	ra,28(sp)
40001f2c:	00812c23          	sw	s0,24(sp)
40001f30:	02010413          	addi	s0,sp,32
40001f34:	fea42623          	sw	a0,-20(s0)
40001f38:	feb42423          	sw	a1,-24(s0)
	print(message);
40001f3c:	fec42503          	lw	a0,-20(s0)
40001f40:	d7dff0ef          	jal	ra,40001cbc <print>
	print32bit(num[1]);
40001f44:	fe842783          	lw	a5,-24(s0)
40001f48:	00478793          	addi	a5,a5,4
40001f4c:	0007a783          	lw	a5,0(a5)
40001f50:	00078513          	mv	a0,a5
40001f54:	ec9ff0ef          	jal	ra,40001e1c <print32bit>
	print32bit(num[0]);
40001f58:	fe842783          	lw	a5,-24(s0)
40001f5c:	0007a783          	lw	a5,0(a5)
40001f60:	00078513          	mv	a0,a5
40001f64:	eb9ff0ef          	jal	ra,40001e1c <print32bit>
	print("\r\n");
40001f68:	400037b7          	lui	a5,0x40003
40001f6c:	d4c78513          	addi	a0,a5,-692 # 40002d4c <vga_simRes_h160_v120+0x38>
40001f70:	d4dff0ef          	jal	ra,40001cbc <print>
}
40001f74:	00000013          	nop
40001f78:	01c12083          	lw	ra,28(sp)
40001f7c:	01812403          	lw	s0,24(sp)
40001f80:	02010113          	addi	sp,sp,32
40001f84:	00008067          	ret

40001f88 <print128bit>:
void print128bit(char *message, uint32_t *num)
{
40001f88:	fe010113          	addi	sp,sp,-32
40001f8c:	00112e23          	sw	ra,28(sp)
40001f90:	00812c23          	sw	s0,24(sp)
40001f94:	02010413          	addi	s0,sp,32
40001f98:	fea42623          	sw	a0,-20(s0)
40001f9c:	feb42423          	sw	a1,-24(s0)
	print(message);
40001fa0:	fec42503          	lw	a0,-20(s0)
40001fa4:	d19ff0ef          	jal	ra,40001cbc <print>
	print32bit(num[3]);
40001fa8:	fe842783          	lw	a5,-24(s0)
40001fac:	00c78793          	addi	a5,a5,12
40001fb0:	0007a783          	lw	a5,0(a5)
40001fb4:	00078513          	mv	a0,a5
40001fb8:	e65ff0ef          	jal	ra,40001e1c <print32bit>
	print32bit(num[2]);
40001fbc:	fe842783          	lw	a5,-24(s0)
40001fc0:	00878793          	addi	a5,a5,8
40001fc4:	0007a783          	lw	a5,0(a5)
40001fc8:	00078513          	mv	a0,a5
40001fcc:	e51ff0ef          	jal	ra,40001e1c <print32bit>
	print32bit(num[1]);
40001fd0:	fe842783          	lw	a5,-24(s0)
40001fd4:	00478793          	addi	a5,a5,4
40001fd8:	0007a783          	lw	a5,0(a5)
40001fdc:	00078513          	mv	a0,a5
40001fe0:	e3dff0ef          	jal	ra,40001e1c <print32bit>
	print32bit(num[0]);
40001fe4:	fe842783          	lw	a5,-24(s0)
40001fe8:	0007a783          	lw	a5,0(a5)
40001fec:	00078513          	mv	a0,a5
40001ff0:	e2dff0ef          	jal	ra,40001e1c <print32bit>
	print("\r\n");
40001ff4:	400037b7          	lui	a5,0x40003
40001ff8:	d4c78513          	addi	a0,a5,-692 # 40002d4c <vga_simRes_h160_v120+0x38>
40001ffc:	cc1ff0ef          	jal	ra,40001cbc <print>
}
40002000:	00000013          	nop
40002004:	01c12083          	lw	ra,28(sp)
40002008:	01812403          	lw	s0,24(sp)
4000200c:	02010113          	addi	sp,sp,32
40002010:	00008067          	ret

40002014 <print80bit>:
void print80bit(char *message,uint32_t *num)
{
40002014:	fe010113          	addi	sp,sp,-32
40002018:	00112e23          	sw	ra,28(sp)
4000201c:	00812c23          	sw	s0,24(sp)
40002020:	02010413          	addi	s0,sp,32
40002024:	fea42623          	sw	a0,-20(s0)
40002028:	feb42423          	sw	a1,-24(s0)
	print(message);
4000202c:	fec42503          	lw	a0,-20(s0)
40002030:	c8dff0ef          	jal	ra,40001cbc <print>
	print32bit(num[2]);
40002034:	fe842783          	lw	a5,-24(s0)
40002038:	00878793          	addi	a5,a5,8
4000203c:	0007a783          	lw	a5,0(a5)
40002040:	00078513          	mv	a0,a5
40002044:	dd9ff0ef          	jal	ra,40001e1c <print32bit>
	print32bit(num[1]);
40002048:	fe842783          	lw	a5,-24(s0)
4000204c:	00478793          	addi	a5,a5,4
40002050:	0007a783          	lw	a5,0(a5)
40002054:	00078513          	mv	a0,a5
40002058:	dc5ff0ef          	jal	ra,40001e1c <print32bit>
	print16bit(num[0]);
4000205c:	fe842783          	lw	a5,-24(s0)
40002060:	0007a783          	lw	a5,0(a5)
40002064:	00078513          	mv	a0,a5
40002068:	cadff0ef          	jal	ra,40001d14 <print16bit>
	print("\r\n");
4000206c:	400037b7          	lui	a5,0x40003
40002070:	d4c78513          	addi	a0,a5,-692 # 40002d4c <vga_simRes_h160_v120+0x38>
40002074:	c49ff0ef          	jal	ra,40001cbc <print>
}
40002078:	00000013          	nop
4000207c:	01c12083          	lw	ra,28(sp)
40002080:	01812403          	lw	s0,24(sp)
40002084:	02010113          	addi	sp,sp,32
40002088:	00008067          	ret

4000208c <print256bit>:
void print256bit(char *message, uint32_t *num)
{
4000208c:	fe010113          	addi	sp,sp,-32
40002090:	00112e23          	sw	ra,28(sp)
40002094:	00812c23          	sw	s0,24(sp)
40002098:	02010413          	addi	s0,sp,32
4000209c:	fea42623          	sw	a0,-20(s0)
400020a0:	feb42423          	sw	a1,-24(s0)
	print(message);
400020a4:	fec42503          	lw	a0,-20(s0)
400020a8:	c15ff0ef          	jal	ra,40001cbc <print>
	print32bit(num[7]);
400020ac:	fe842783          	lw	a5,-24(s0)
400020b0:	01c78793          	addi	a5,a5,28
400020b4:	0007a783          	lw	a5,0(a5)
400020b8:	00078513          	mv	a0,a5
400020bc:	d61ff0ef          	jal	ra,40001e1c <print32bit>
	print32bit(num[6]);
400020c0:	fe842783          	lw	a5,-24(s0)
400020c4:	01878793          	addi	a5,a5,24
400020c8:	0007a783          	lw	a5,0(a5)
400020cc:	00078513          	mv	a0,a5
400020d0:	d4dff0ef          	jal	ra,40001e1c <print32bit>
	print32bit(num[5]);
400020d4:	fe842783          	lw	a5,-24(s0)
400020d8:	01478793          	addi	a5,a5,20
400020dc:	0007a783          	lw	a5,0(a5)
400020e0:	00078513          	mv	a0,a5
400020e4:	d39ff0ef          	jal	ra,40001e1c <print32bit>
	print32bit(num[4]);
400020e8:	fe842783          	lw	a5,-24(s0)
400020ec:	01078793          	addi	a5,a5,16
400020f0:	0007a783          	lw	a5,0(a5)
400020f4:	00078513          	mv	a0,a5
400020f8:	d25ff0ef          	jal	ra,40001e1c <print32bit>
	print32bit(num[3]);
400020fc:	fe842783          	lw	a5,-24(s0)
40002100:	00c78793          	addi	a5,a5,12
40002104:	0007a783          	lw	a5,0(a5)
40002108:	00078513          	mv	a0,a5
4000210c:	d11ff0ef          	jal	ra,40001e1c <print32bit>
	print32bit(num[2]);
40002110:	fe842783          	lw	a5,-24(s0)
40002114:	00878793          	addi	a5,a5,8
40002118:	0007a783          	lw	a5,0(a5)
4000211c:	00078513          	mv	a0,a5
40002120:	cfdff0ef          	jal	ra,40001e1c <print32bit>
	print32bit(num[1]);
40002124:	fe842783          	lw	a5,-24(s0)
40002128:	00478793          	addi	a5,a5,4
4000212c:	0007a783          	lw	a5,0(a5)
40002130:	00078513          	mv	a0,a5
40002134:	ce9ff0ef          	jal	ra,40001e1c <print32bit>
	print32bit(num[0]);
40002138:	fe842783          	lw	a5,-24(s0)
4000213c:	0007a783          	lw	a5,0(a5)
40002140:	00078513          	mv	a0,a5
40002144:	cd9ff0ef          	jal	ra,40001e1c <print32bit>
	print("\r\n");
40002148:	400037b7          	lui	a5,0x40003
4000214c:	d4c78513          	addi	a0,a5,-692 # 40002d4c <vga_simRes_h160_v120+0x38>
40002150:	b6dff0ef          	jal	ra,40001cbc <print>
}
40002154:	00000013          	nop
40002158:	01c12083          	lw	ra,28(sp)
4000215c:	01812403          	lw	s0,24(sp)
40002160:	02010113          	addi	sp,sp,32
40002164:	00008067          	ret
