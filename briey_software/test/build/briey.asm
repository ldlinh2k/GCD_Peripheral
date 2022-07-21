
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
80000068:	de8080e7          	jalr	-536(ra) # 40000e4c <irqCallback>
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
800000b8:	51c18193          	addi	gp,gp,1308 # 400035d0 <__global_pointer$>
  .option pop
  la sp, _stack_start
800000bc:	00001117          	auipc	sp,0x1
800000c0:	88410113          	addi	sp,sp,-1916 # 80000940 <_stack_start>

800000c4 <bss_init>:

bss_init:
  la a0, _bss_start
800000c4:	c0003517          	auipc	a0,0xc0003
800000c8:	d0c50513          	addi	a0,a0,-756 # 40002dd0 <_bss_end>
  la a1, _bss_end
800000cc:	c0003597          	auipc	a1,0xc0003
800000d0:	d0458593          	addi	a1,a1,-764 # 40002dd0 <_bss_end>

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
800000e8:	cec50513          	addi	a0,a0,-788 # 40002dd0 <_bss_end>
  addi sp,sp,-4
800000ec:	ffc10113          	addi	sp,sp,-4

800000f0 <ctors_loop>:
ctors_loop:
  la a1, _ctors_end
800000f0:	c0003597          	auipc	a1,0xc0003
800000f4:	ce058593          	addi	a1,a1,-800 # 40002dd0 <_bss_end>
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
80000134:	57c080e7          	jalr	1404(ra) # 400006ac <main>

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
			print("\r\t=============================PRINCE ENCRYPTTION=============================\r\n");
40000400:	400027b7          	lui	a5,0x40002
40000404:	2a878513          	addi	a0,a5,680 # 400022a8 <vga_simRes_h160_v120+0x20>
40000408:	165010ef          	jal	ra,40001d6c <print>
4000040c:	0100006f          	j	4000041c <prince_cipher+0x12c>
		else
			print("\r\t=============================PRINCE DECRYPTTION=============================\r\n");
40000410:	400027b7          	lui	a5,0x40002
40000414:	2fc78513          	addi	a0,a5,764 # 400022fc <vga_simRes_h160_v120+0x74>
40000418:	155010ef          	jal	ra,40001d6c <print>
		print("\r\n");
4000041c:	400027b7          	lui	a5,0x40002
40000420:	35078513          	addi	a0,a5,848 # 40002350 <vga_simRes_h160_v120+0xc8>
40000424:	149010ef          	jal	ra,40001d6c <print>
		print64bit("PLAIN_TEXT (64-bit) : ", block);
40000428:	fe442583          	lw	a1,-28(s0)
4000042c:	400027b7          	lui	a5,0x40002
40000430:	35478513          	addi	a0,a5,852 # 40002354 <vga_simRes_h160_v120+0xcc>
40000434:	3a1010ef          	jal	ra,40001fd4 <print64bit>
		print128bit("KEY (128-bit) : ", key);
40000438:	fe842583          	lw	a1,-24(s0)
4000043c:	400027b7          	lui	a5,0x40002
40000440:	36c78513          	addi	a0,a5,876 # 4000236c <vga_simRes_h160_v120+0xe4>
40000444:	401010ef          	jal	ra,40002044 <print128bit>
		print64bit("RESULT (64-bit) : ", res);
40000448:	fe042583          	lw	a1,-32(s0)
4000044c:	400027b7          	lui	a5,0x40002
40000450:	38078513          	addi	a0,a5,896 # 40002380 <vga_simRes_h160_v120+0xf8>
40000454:	381010ef          	jal	ra,40001fd4 <print64bit>
		//print("\r\n============================================================================\r\n");

}
40000458:	00000013          	nop
4000045c:	01c12083          	lw	ra,28(sp)
40000460:	01812403          	lw	s0,24(sp)
40000464:	01412483          	lw	s1,20(sp)
40000468:	02010113          	addi	sp,sp,32
4000046c:	00008067          	ret

40000470 <timer_init>:
static void timer_init(Timer_Reg *reg){
40000470:	fe010113          	addi	sp,sp,-32
40000474:	00812e23          	sw	s0,28(sp)
40000478:	02010413          	addi	s0,sp,32
4000047c:	fea42623          	sw	a0,-20(s0)
	reg->CLEARS_TICKS  = 0;
40000480:	fec42783          	lw	a5,-20(s0)
40000484:	0007a023          	sw	zero,0(a5)
	reg->VALUE = 0;
40000488:	fec42783          	lw	a5,-20(s0)
4000048c:	0007a423          	sw	zero,8(a5)
}
40000490:	00000013          	nop
40000494:	01c12403          	lw	s0,28(sp)
40000498:	02010113          	addi	sp,sp,32
4000049c:	00008067          	ret

400004a0 <prescaler_init>:
static void prescaler_init(Prescaler_Reg* reg){
400004a0:	fe010113          	addi	sp,sp,-32
400004a4:	00812e23          	sw	s0,28(sp)
400004a8:	02010413          	addi	s0,sp,32
400004ac:	fea42623          	sw	a0,-20(s0)
}
400004b0:	00000013          	nop
400004b4:	01c12403          	lw	s0,28(sp)
400004b8:	02010113          	addi	sp,sp,32
400004bc:	00008067          	ret

400004c0 <interruptCtrl_init>:
static void interruptCtrl_init(InterruptCtrl_Reg* reg){
400004c0:	fe010113          	addi	sp,sp,-32
400004c4:	00812e23          	sw	s0,28(sp)
400004c8:	02010413          	addi	s0,sp,32
400004cc:	fea42623          	sw	a0,-20(s0)
	reg->MASKS = 0;
400004d0:	fec42783          	lw	a5,-20(s0)
400004d4:	0007a223          	sw	zero,4(a5)
	reg->PENDINGS = 0xFFFFFFFF;
400004d8:	fec42783          	lw	a5,-20(s0)
400004dc:	fff00713          	li	a4,-1
400004e0:	00e7a023          	sw	a4,0(a5)
}
400004e4:	00000013          	nop
400004e8:	01c12403          	lw	s0,28(sp)
400004ec:	02010113          	addi	sp,sp,32
400004f0:	00008067          	ret

400004f4 <uart_writeAvailability>:
static uint32_t uart_writeAvailability(Uart_Reg *reg){
400004f4:	fe010113          	addi	sp,sp,-32
400004f8:	00812e23          	sw	s0,28(sp)
400004fc:	02010413          	addi	s0,sp,32
40000500:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS >> 16) & 0xFF;
40000504:	fec42783          	lw	a5,-20(s0)
40000508:	0047a783          	lw	a5,4(a5)
4000050c:	0107d793          	srli	a5,a5,0x10
40000510:	0ff7f793          	zext.b	a5,a5
}
40000514:	00078513          	mv	a0,a5
40000518:	01c12403          	lw	s0,28(sp)
4000051c:	02010113          	addi	sp,sp,32
40000520:	00008067          	ret

40000524 <uart_readOccupancy>:
static uint32_t uart_readOccupancy(Uart_Reg *reg){
40000524:	fe010113          	addi	sp,sp,-32
40000528:	00812e23          	sw	s0,28(sp)
4000052c:	02010413          	addi	s0,sp,32
40000530:	fea42623          	sw	a0,-20(s0)
	return reg->STATUS >> 24;
40000534:	fec42783          	lw	a5,-20(s0)
40000538:	0047a783          	lw	a5,4(a5)
4000053c:	0187d793          	srli	a5,a5,0x18
}
40000540:	00078513          	mv	a0,a5
40000544:	01c12403          	lw	s0,28(sp)
40000548:	02010113          	addi	sp,sp,32
4000054c:	00008067          	ret

40000550 <uart_write>:
static void uart_write(Uart_Reg *reg, uint32_t data){
40000550:	fe010113          	addi	sp,sp,-32
40000554:	00112e23          	sw	ra,28(sp)
40000558:	00812c23          	sw	s0,24(sp)
4000055c:	02010413          	addi	s0,sp,32
40000560:	fea42623          	sw	a0,-20(s0)
40000564:	feb42423          	sw	a1,-24(s0)
	while(uart_writeAvailability(reg) == 0);
40000568:	00000013          	nop
4000056c:	fec42503          	lw	a0,-20(s0)
40000570:	f85ff0ef          	jal	ra,400004f4 <uart_writeAvailability>
40000574:	00050793          	mv	a5,a0
40000578:	fe078ae3          	beqz	a5,4000056c <uart_write+0x1c>
	reg->DATA = data;
4000057c:	fec42783          	lw	a5,-20(s0)
40000580:	fe842703          	lw	a4,-24(s0)
40000584:	00e7a023          	sw	a4,0(a5)
}
40000588:	00000013          	nop
4000058c:	01c12083          	lw	ra,28(sp)
40000590:	01812403          	lw	s0,24(sp)
40000594:	02010113          	addi	sp,sp,32
40000598:	00008067          	ret

4000059c <uart_applyConfig>:
static void uart_applyConfig(Uart_Reg *reg, Uart_Config *config){
4000059c:	fe010113          	addi	sp,sp,-32
400005a0:	00812e23          	sw	s0,28(sp)
400005a4:	02010413          	addi	s0,sp,32
400005a8:	fea42623          	sw	a0,-20(s0)
400005ac:	feb42423          	sw	a1,-24(s0)
	reg->CLOCK_DIVIDER = config->clockDivider;
400005b0:	fe842783          	lw	a5,-24(s0)
400005b4:	00c7a703          	lw	a4,12(a5)
400005b8:	fec42783          	lw	a5,-20(s0)
400005bc:	00e7a423          	sw	a4,8(a5)
	reg->FRAME_CONFIG = ((config->dataLength-1) << 0) | (config->parity << 8) | (config->stop << 16);
400005c0:	fe842783          	lw	a5,-24(s0)
400005c4:	0007a783          	lw	a5,0(a5)
400005c8:	fff78713          	addi	a4,a5,-1
400005cc:	fe842783          	lw	a5,-24(s0)
400005d0:	0047a783          	lw	a5,4(a5)
400005d4:	00879793          	slli	a5,a5,0x8
400005d8:	00f76733          	or	a4,a4,a5
400005dc:	fe842783          	lw	a5,-24(s0)
400005e0:	0087a783          	lw	a5,8(a5)
400005e4:	01079793          	slli	a5,a5,0x10
400005e8:	00f76733          	or	a4,a4,a5
400005ec:	fec42783          	lw	a5,-20(s0)
400005f0:	00e7a623          	sw	a4,12(a5)
}
400005f4:	00000013          	nop
400005f8:	01c12403          	lw	s0,28(sp)
400005fc:	02010113          	addi	sp,sp,32
40000600:	00008067          	ret

40000604 <vga_isBusy>:
static uint32_t vga_isBusy(Vga_Reg *reg){
40000604:	fe010113          	addi	sp,sp,-32
40000608:	00812e23          	sw	s0,28(sp)
4000060c:	02010413          	addi	s0,sp,32
40000610:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS & 2) != 0;
40000614:	fec42783          	lw	a5,-20(s0)
40000618:	0007a783          	lw	a5,0(a5)
4000061c:	0027f793          	andi	a5,a5,2
40000620:	00f037b3          	snez	a5,a5
40000624:	0ff7f793          	zext.b	a5,a5
}
40000628:	00078513          	mv	a0,a5
4000062c:	01c12403          	lw	s0,28(sp)
40000630:	02010113          	addi	sp,sp,32
40000634:	00008067          	ret

40000638 <vga_run>:
static void vga_run(Vga_Reg *reg){
40000638:	fe010113          	addi	sp,sp,-32
4000063c:	00812e23          	sw	s0,28(sp)
40000640:	02010413          	addi	s0,sp,32
40000644:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 1;
40000648:	fec42783          	lw	a5,-20(s0)
4000064c:	00100713          	li	a4,1
40000650:	00e7a023          	sw	a4,0(a5)
}
40000654:	00000013          	nop
40000658:	01c12403          	lw	s0,28(sp)
4000065c:	02010113          	addi	sp,sp,32
40000660:	00008067          	ret

40000664 <vga_stop>:
static void vga_stop(Vga_Reg *reg){
40000664:	fe010113          	addi	sp,sp,-32
40000668:	00112e23          	sw	ra,28(sp)
4000066c:	00812c23          	sw	s0,24(sp)
40000670:	02010413          	addi	s0,sp,32
40000674:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 0;
40000678:	fec42783          	lw	a5,-20(s0)
4000067c:	0007a023          	sw	zero,0(a5)
	while(vga_isBusy(reg));
40000680:	00000013          	nop
40000684:	fec42503          	lw	a0,-20(s0)
40000688:	f7dff0ef          	jal	ra,40000604 <vga_isBusy>
4000068c:	00050793          	mv	a5,a0
40000690:	fe079ae3          	bnez	a5,40000684 <vga_stop+0x20>
}
40000694:	00000013          	nop
40000698:	00000013          	nop
4000069c:	01c12083          	lw	ra,28(sp)
400006a0:	01812403          	lw	s0,24(sp)
400006a4:	02010113          	addi	sp,sp,32
400006a8:	00008067          	ret

400006ac <main>:
#include <stdint.h>
#include <stdlib.h>
#include <briey.h>


int main() {
400006ac:	f5010113          	addi	sp,sp,-176
400006b0:	0a112623          	sw	ra,172(sp)
400006b4:	0a812423          	sw	s0,168(sp)
400006b8:	0b010413          	addi	s0,sp,176
	Uart_Config uartConfig;
	uartConfig.dataLength = 8;
400006bc:	00800793          	li	a5,8
400006c0:	fef42023          	sw	a5,-32(s0)
	uartConfig.parity = NONE;
400006c4:	fe042223          	sw	zero,-28(s0)
	uartConfig.stop = ONE;
400006c8:	fe042423          	sw	zero,-24(s0)
	uartConfig.clockDivider = (CORE_HZ / 8 / 115200) - 1;
400006cc:	03500793          	li	a5,53
400006d0:	fef42623          	sw	a5,-20(s0)
	uart_applyConfig(UART,&uartConfig);
400006d4:	fe040793          	addi	a5,s0,-32
400006d8:	00078593          	mv	a1,a5
400006dc:	f0010537          	lui	a0,0xf0010
400006e0:	ebdff0ef          	jal	ra,4000059c <uart_applyConfig>

	print("\r\t**********************************PRINCE TEST*******************************\r\n");
400006e4:	400027b7          	lui	a5,0x40002
400006e8:	3f478513          	addi	a0,a5,1012 # 400023f4 <vga_simRes_h160_v120+0x20>
400006ec:	680010ef          	jal	ra,40001d6c <print>
	uint32_t prince_key[4] 		= {0x0, 0x0, 0x0, 0x0};
400006f0:	fc042823          	sw	zero,-48(s0)
400006f4:	fc042a23          	sw	zero,-44(s0)
400006f8:	fc042c23          	sw	zero,-40(s0)
400006fc:	fc042e23          	sw	zero,-36(s0)
	uint32_t prince_block[2] 		= {0x0, 0x0};
40000700:	fc042423          	sw	zero,-56(s0)
40000704:	fc042623          	sw	zero,-52(s0)
	uint32_t prince_res[2] 	= {0x0,0x0};
40000708:	fc042023          	sw	zero,-64(s0)
4000070c:	fc042223          	sw	zero,-60(s0)
	print("\r\n\t===================================TEST 1===================================\r\n");
40000710:	400027b7          	lui	a5,0x40002
40000714:	44878513          	addi	a0,a5,1096 # 40002448 <vga_simRes_h160_v120+0x74>
40000718:	654010ef          	jal	ra,40001d6c <print>

	prince_block[1] 	= 0x01234567;
4000071c:	012347b7          	lui	a5,0x1234
40000720:	56778793          	addi	a5,a5,1383 # 1234567 <_stack_size+0x1233d67>
40000724:	fcf42623          	sw	a5,-52(s0)
	prince_block[0] 	= 0x89abcdef;
40000728:	89abd7b7          	lui	a5,0x89abd
4000072c:	def78793          	addi	a5,a5,-529 # 89abcdef <_stack_start+0x9abc4af>
40000730:	fcf42423          	sw	a5,-56(s0)

	prince_key[3]		= 0x00112233;
40000734:	001127b7          	lui	a5,0x112
40000738:	23378793          	addi	a5,a5,563 # 112233 <_stack_size+0x111a33>
4000073c:	fcf42e23          	sw	a5,-36(s0)
	prince_key[2]		= 0x44556677;
40000740:	445567b7          	lui	a5,0x44556
40000744:	67778793          	addi	a5,a5,1655 # 44556677 <__global_pointer$+0x45530a7>
40000748:	fcf42c23          	sw	a5,-40(s0)
	prince_key[1]		= 0x8899aabb;
4000074c:	8899b7b7          	lui	a5,0x8899b
40000750:	abb78793          	addi	a5,a5,-1349 # 8899aabb <_stack_start+0x899a17b>
40000754:	fcf42a23          	sw	a5,-44(s0)
	prince_key[0]		= 0xccddeeff;
40000758:	ccddf7b7          	lui	a5,0xccddf
4000075c:	eff78793          	addi	a5,a5,-257 # ccddeeff <_stack_start+0x4cdde5bf>
40000760:	fcf42823          	sw	a5,-48(s0)

	prince_cipher(PRINCE_OP_EN,prince_key,prince_block,prince_res);
40000764:	fc040693          	addi	a3,s0,-64
40000768:	fc840713          	addi	a4,s0,-56
4000076c:	fd040793          	addi	a5,s0,-48
40000770:	00070613          	mv	a2,a4
40000774:	00078593          	mv	a1,a5
40000778:	00100513          	li	a0,1
4000077c:	b75ff0ef          	jal	ra,400002f0 <prince_cipher>

	print("\r\n\t===================================TEST 2===================================\r\n");
40000780:	400027b7          	lui	a5,0x40002
40000784:	49c78513          	addi	a0,a5,1180 # 4000249c <vga_simRes_h160_v120+0xc8>
40000788:	5e4010ef          	jal	ra,40001d6c <print>

	prince_block[1] 	= 0x00000000;
4000078c:	fc042623          	sw	zero,-52(s0)
	prince_block[0] 	= 0x00000000;
40000790:	fc042423          	sw	zero,-56(s0)

	prince_key[3]		= 0x00000000;
40000794:	fc042e23          	sw	zero,-36(s0)
	prince_key[2]		= 0x00000000;
40000798:	fc042c23          	sw	zero,-40(s0)
	prince_key[1]		= 0x00000000;
4000079c:	fc042a23          	sw	zero,-44(s0)
	prince_key[0]		= 0x00000000;
400007a0:	fc042823          	sw	zero,-48(s0)

	prince_cipher(PRINCE_OP_EN,prince_key,prince_block,prince_res);
400007a4:	fc040693          	addi	a3,s0,-64
400007a8:	fc840713          	addi	a4,s0,-56
400007ac:	fd040793          	addi	a5,s0,-48
400007b0:	00070613          	mv	a2,a4
400007b4:	00078593          	mv	a1,a5
400007b8:	00100513          	li	a0,1
400007bc:	b35ff0ef          	jal	ra,400002f0 <prince_cipher>
	print("\r\n\t===================================TEST 3===================================\r\n");
400007c0:	400027b7          	lui	a5,0x40002
400007c4:	4f078513          	addi	a0,a5,1264 # 400024f0 <vga_simRes_h160_v120+0x11c>
400007c8:	5a4010ef          	jal	ra,40001d6c <print>

	prince_block[1] 	= 0x69c4e0d8;
400007cc:	69c4e7b7          	lui	a5,0x69c4e
400007d0:	0d878793          	addi	a5,a5,216 # 69c4e0d8 <__global_pointer$+0x29c4ab08>
400007d4:	fcf42623          	sw	a5,-52(s0)
	prince_block[0] 	= 0x6a7b0430;
400007d8:	6a7b07b7          	lui	a5,0x6a7b0
400007dc:	43078793          	addi	a5,a5,1072 # 6a7b0430 <__global_pointer$+0x2a7ace60>
400007e0:	fcf42423          	sw	a5,-56(s0)

	prince_key[3]		= 0xd8cdb780;
400007e4:	d8cdb7b7          	lui	a5,0xd8cdb
400007e8:	78078793          	addi	a5,a5,1920 # d8cdb780 <_stack_start+0x58cdae40>
400007ec:	fcf42e23          	sw	a5,-36(s0)
	prince_key[2]		= 0x70b4c55a;
400007f0:	70b4c7b7          	lui	a5,0x70b4c
400007f4:	55a78793          	addi	a5,a5,1370 # 70b4c55a <__global_pointer$+0x30b48f8a>
400007f8:	fcf42c23          	sw	a5,-40(s0)
	prince_key[1]		= 0x818665aa;
400007fc:	818667b7          	lui	a5,0x81866
40000800:	5aa78793          	addi	a5,a5,1450 # 818665aa <_stack_start+0x1865c6a>
40000804:	fcf42a23          	sw	a5,-44(s0)
	prince_key[0]		= 0x0d02dfda;
40000808:	0d02e7b7          	lui	a5,0xd02e
4000080c:	fda78793          	addi	a5,a5,-38 # d02dfda <_stack_size+0xd02d7da>
40000810:	fcf42823          	sw	a5,-48(s0)

	prince_cipher(PRINCE_OP_EN,prince_key,prince_block,prince_res);
40000814:	fc040693          	addi	a3,s0,-64
40000818:	fc840713          	addi	a4,s0,-56
4000081c:	fd040793          	addi	a5,s0,-48
40000820:	00070613          	mv	a2,a4
40000824:	00078593          	mv	a1,a5
40000828:	00100513          	li	a0,1
4000082c:	ac5ff0ef          	jal	ra,400002f0 <prince_cipher>
	print("\r\n\t===================================TEST 4===================================\r\n");
40000830:	400027b7          	lui	a5,0x40002
40000834:	54478513          	addi	a0,a5,1348 # 40002544 <vga_simRes_h160_v120+0x170>
40000838:	534010ef          	jal	ra,40001d6c <print>

	prince_block[1] 	= 0x43c6b256;
4000083c:	43c6b7b7          	lui	a5,0x43c6b
40000840:	25678793          	addi	a5,a5,598 # 43c6b256 <__global_pointer$+0x3c67c86>
40000844:	fcf42623          	sw	a5,-52(s0)
	prince_block[0] 	= 0xd79de7e8;
40000848:	d79de7b7          	lui	a5,0xd79de
4000084c:	7e878793          	addi	a5,a5,2024 # d79de7e8 <_stack_start+0x579ddea8>
40000850:	fcf42423          	sw	a5,-56(s0)

	prince_key[3]		= 0xd8cdb780;
40000854:	d8cdb7b7          	lui	a5,0xd8cdb
40000858:	78078793          	addi	a5,a5,1920 # d8cdb780 <_stack_start+0x58cdae40>
4000085c:	fcf42e23          	sw	a5,-36(s0)
	prince_key[2]		= 0x70b4c55a;
40000860:	70b4c7b7          	lui	a5,0x70b4c
40000864:	55a78793          	addi	a5,a5,1370 # 70b4c55a <__global_pointer$+0x30b48f8a>
40000868:	fcf42c23          	sw	a5,-40(s0)
	prince_key[1]		= 0x818665aa;
4000086c:	818667b7          	lui	a5,0x81866
40000870:	5aa78793          	addi	a5,a5,1450 # 818665aa <_stack_start+0x1865c6a>
40000874:	fcf42a23          	sw	a5,-44(s0)
	prince_key[0]		= 0x0d02dfda;
40000878:	0d02e7b7          	lui	a5,0xd02e
4000087c:	fda78793          	addi	a5,a5,-38 # d02dfda <_stack_size+0xd02d7da>
40000880:	fcf42823          	sw	a5,-48(s0)

	prince_cipher(PRINCE_OP_DE,prince_key,prince_block,prince_res);
40000884:	fc040693          	addi	a3,s0,-64
40000888:	fc840713          	addi	a4,s0,-56
4000088c:	fd040793          	addi	a5,s0,-48
40000890:	00070613          	mv	a2,a4
40000894:	00078593          	mv	a1,a5
40000898:	00000513          	li	a0,0
4000089c:	a55ff0ef          	jal	ra,400002f0 <prince_cipher>

	print("\r\t*********************************AES TEST***********************************\r\n");
400008a0:	400027b7          	lui	a5,0x40002
400008a4:	59878513          	addi	a0,a5,1432 # 40002598 <vga_simRes_h160_v120+0x1c4>
400008a8:	4c4010ef          	jal	ra,40001d6c <print>
    unsigned int aes_key_128[4] = {0x0, 0x0, 0x0, 0x0};
400008ac:	fa042823          	sw	zero,-80(s0)
400008b0:	fa042a23          	sw	zero,-76(s0)
400008b4:	fa042c23          	sw	zero,-72(s0)
400008b8:	fa042e23          	sw	zero,-68(s0)
    unsigned int aes_block[4] 	= {0x0, 0x0, 0x0, 0x0};
400008bc:	fa042023          	sw	zero,-96(s0)
400008c0:	fa042223          	sw	zero,-92(s0)
400008c4:	fa042423          	sw	zero,-88(s0)
400008c8:	fa042623          	sw	zero,-84(s0)

    unsigned int aes_res[4] 	= {0x0, 0x0, 0x0, 0x0};
400008cc:	f8042823          	sw	zero,-112(s0)
400008d0:	f8042a23          	sw	zero,-108(s0)
400008d4:	f8042c23          	sw	zero,-104(s0)
400008d8:	f8042e23          	sw	zero,-100(s0)

	print("\r\n\t=================================TEST 1=====================================\r\n");
400008dc:	400027b7          	lui	a5,0x40002
400008e0:	5ec78513          	addi	a0,a5,1516 # 400025ec <vga_simRes_h160_v120+0x218>
400008e4:	488010ef          	jal	ra,40001d6c <print>

    aes_block[3] 	= 0x33343536;
400008e8:	333437b7          	lui	a5,0x33343
400008ec:	53678793          	addi	a5,a5,1334 # 33343536 <_stack_size+0x33342d36>
400008f0:	faf42623          	sw	a5,-84(s0)
    aes_block[2] 	= 0x39303132;
400008f4:	393037b7          	lui	a5,0x39303
400008f8:	13278793          	addi	a5,a5,306 # 39303132 <_stack_size+0x39302932>
400008fc:	faf42423          	sw	a5,-88(s0)
    aes_block[1] 	= 0x35363738;
40000900:	353637b7          	lui	a5,0x35363
40000904:	73878793          	addi	a5,a5,1848 # 35363738 <_stack_size+0x35362f38>
40000908:	faf42223          	sw	a5,-92(s0)
    aes_block[0] 	= 0x31323334;
4000090c:	313237b7          	lui	a5,0x31323
40000910:	33478793          	addi	a5,a5,820 # 31323334 <_stack_size+0x31322b34>
40000914:	faf42023          	sw	a5,-96(s0)

	aes_key_128[3] 	= 0x37363534;
40000918:	373637b7          	lui	a5,0x37363
4000091c:	53478793          	addi	a5,a5,1332 # 37363534 <_stack_size+0x37362d34>
40000920:	faf42e23          	sw	a5,-68(s0)
    aes_key_128[2] 	= 0x31303938;
40000924:	313047b7          	lui	a5,0x31304
40000928:	93878793          	addi	a5,a5,-1736 # 31303938 <_stack_size+0x31303138>
4000092c:	faf42c23          	sw	a5,-72(s0)
    aes_key_128[1] 	= 0x35343332;
40000930:	353437b7          	lui	a5,0x35343
40000934:	33278793          	addi	a5,a5,818 # 35343332 <_stack_size+0x35342b32>
40000938:	faf42a23          	sw	a5,-76(s0)
    aes_key_128[0]	= 0x39383736;
4000093c:	393837b7          	lui	a5,0x39383
40000940:	73678793          	addi	a5,a5,1846 # 39383736 <_stack_size+0x39382f36>
40000944:	faf42823          	sw	a5,-80(s0)

   	aes_128_cipher(AES_OP_EN, aes_key_128, aes_block, aes_res);
40000948:	f9040693          	addi	a3,s0,-112
4000094c:	fa040713          	addi	a4,s0,-96
40000950:	fb040793          	addi	a5,s0,-80
40000954:	00070613          	mv	a2,a4
40000958:	00078593          	mv	a1,a5
4000095c:	00100513          	li	a0,1
40000960:	4d5000ef          	jal	ra,40001634 <aes_128_cipher>
	print("\r\n\t=================================TEST 2=====================================\r\n");
40000964:	400027b7          	lui	a5,0x40002
40000968:	64078513          	addi	a0,a5,1600 # 40002640 <vga_simRes_h160_v120+0x26c>
4000096c:	400010ef          	jal	ra,40001d6c <print>

    aes_block[3] 	= 0xfd1ee6b4;
40000970:	fd1ee7b7          	lui	a5,0xfd1ee
40000974:	6b478793          	addi	a5,a5,1716 # fd1ee6b4 <_stack_start+0x7d1edd74>
40000978:	faf42623          	sw	a5,-84(s0)
    aes_block[2] 	= 0xbd2fb855;
4000097c:	bd2fc7b7          	lui	a5,0xbd2fc
40000980:	85578793          	addi	a5,a5,-1963 # bd2fb855 <_stack_start+0x3d2faf15>
40000984:	faf42423          	sw	a5,-88(s0)
    aes_block[1] 	= 0x6428318a;
40000988:	642837b7          	lui	a5,0x64283
4000098c:	18a78793          	addi	a5,a5,394 # 6428318a <__global_pointer$+0x2427fbba>
40000990:	faf42223          	sw	a5,-92(s0)
    aes_block[0] 	= 0x6e6f9733;
40000994:	6e6f97b7          	lui	a5,0x6e6f9
40000998:	73378793          	addi	a5,a5,1843 # 6e6f9733 <__global_pointer$+0x2e6f6163>
4000099c:	faf42023          	sw	a5,-96(s0)

	aes_key_128[3] 	= 0x33343536;
400009a0:	333437b7          	lui	a5,0x33343
400009a4:	53678793          	addi	a5,a5,1334 # 33343536 <_stack_size+0x33342d36>
400009a8:	faf42e23          	sw	a5,-68(s0)
    aes_key_128[2] 	= 0x39303132;
400009ac:	393037b7          	lui	a5,0x39303
400009b0:	13278793          	addi	a5,a5,306 # 39303132 <_stack_size+0x39302932>
400009b4:	faf42c23          	sw	a5,-72(s0)
    aes_key_128[1] 	= 0x35363738;
400009b8:	353637b7          	lui	a5,0x35363
400009bc:	73878793          	addi	a5,a5,1848 # 35363738 <_stack_size+0x35362f38>
400009c0:	faf42a23          	sw	a5,-76(s0)
    aes_key_128[0]	= 0x31323334;
400009c4:	313237b7          	lui	a5,0x31323
400009c8:	33478793          	addi	a5,a5,820 # 31323334 <_stack_size+0x31322b34>
400009cc:	faf42823          	sw	a5,-80(s0)

   	aes_128_cipher(AES_OP_DE, aes_key_128, aes_block, aes_res);
400009d0:	f9040693          	addi	a3,s0,-112
400009d4:	fa040713          	addi	a4,s0,-96
400009d8:	fb040793          	addi	a5,s0,-80
400009dc:	00070613          	mv	a2,a4
400009e0:	00078593          	mv	a1,a5
400009e4:	00000513          	li	a0,0
400009e8:	44d000ef          	jal	ra,40001634 <aes_128_cipher>
	print("\r\n\t=================================TEST 3=====================================\r\n");
400009ec:	400027b7          	lui	a5,0x40002
400009f0:	69478513          	addi	a0,a5,1684 # 40002694 <vga_simRes_h160_v120+0x2c0>
400009f4:	378010ef          	jal	ra,40001d6c <print>

    aes_block[3] 	= 0x7393172a;
400009f8:	739317b7          	lui	a5,0x73931
400009fc:	72a78793          	addi	a5,a5,1834 # 7393172a <__global_pointer$+0x3392e15a>
40000a00:	faf42623          	sw	a5,-84(s0)
    aes_block[2] 	= 0xe93d7e11;
40000a04:	e93d87b7          	lui	a5,0xe93d8
40000a08:	e1178793          	addi	a5,a5,-495 # e93d7e11 <_stack_start+0x693d74d1>
40000a0c:	faf42423          	sw	a5,-88(s0)
    aes_block[1] 	= 0x2e409f96;
40000a10:	2e40a7b7          	lui	a5,0x2e40a
40000a14:	f9678793          	addi	a5,a5,-106 # 2e409f96 <_stack_size+0x2e409796>
40000a18:	faf42223          	sw	a5,-92(s0)
    aes_block[0] 	= 0x6bc1bee2;
40000a1c:	6bc1c7b7          	lui	a5,0x6bc1c
40000a20:	ee278793          	addi	a5,a5,-286 # 6bc1bee2 <__global_pointer$+0x2bc18912>
40000a24:	faf42023          	sw	a5,-96(s0)

	aes_key_128[3] 	= 0x09cf4f3c;
40000a28:	09cf57b7          	lui	a5,0x9cf5
40000a2c:	f3c78793          	addi	a5,a5,-196 # 9cf4f3c <_stack_size+0x9cf473c>
40000a30:	faf42e23          	sw	a5,-68(s0)
    aes_key_128[2] 	= 0xabf71588;
40000a34:	abf717b7          	lui	a5,0xabf71
40000a38:	58878793          	addi	a5,a5,1416 # abf71588 <_stack_start+0x2bf70c48>
40000a3c:	faf42c23          	sw	a5,-72(s0)
    aes_key_128[1] 	= 0x28aed2a6;
40000a40:	28aed7b7          	lui	a5,0x28aed
40000a44:	2a678793          	addi	a5,a5,678 # 28aed2a6 <_stack_size+0x28aecaa6>
40000a48:	faf42a23          	sw	a5,-76(s0)
    aes_key_128[0]	= 0x2b7e1516;
40000a4c:	2b7e17b7          	lui	a5,0x2b7e1
40000a50:	51678793          	addi	a5,a5,1302 # 2b7e1516 <_stack_size+0x2b7e0d16>
40000a54:	faf42823          	sw	a5,-80(s0)
   	aes_128_cipher(AES_OP_EN, aes_key_128, aes_block, aes_res);
40000a58:	f9040693          	addi	a3,s0,-112
40000a5c:	fa040713          	addi	a4,s0,-96
40000a60:	fb040793          	addi	a5,s0,-80
40000a64:	00070613          	mv	a2,a4
40000a68:	00078593          	mv	a1,a5
40000a6c:	00100513          	li	a0,1
40000a70:	3c5000ef          	jal	ra,40001634 <aes_128_cipher>
	print("\r\n\t=================================TEST 4=====================================\r\n");
40000a74:	400027b7          	lui	a5,0x40002
40000a78:	6e878513          	addi	a0,a5,1768 # 400026e8 <vga_simRes_h160_v120+0x314>
40000a7c:	2f0010ef          	jal	ra,40001d6c <print>

    aes_block[3] 	= 0x2466ef97;
40000a80:	2466f7b7          	lui	a5,0x2466f
40000a84:	f9778793          	addi	a5,a5,-105 # 2466ef97 <_stack_size+0x2466e797>
40000a88:	faf42623          	sw	a5,-84(s0)
    aes_block[2] 	= 0xa89ecaf3;
40000a8c:	a89ed7b7          	lui	a5,0xa89ed
40000a90:	af378793          	addi	a5,a5,-1293 # a89ecaf3 <_stack_start+0x289ec1b3>
40000a94:	faf42423          	sw	a5,-88(s0)
    aes_block[1] 	= 0x0d7a3660;
40000a98:	0d7a37b7          	lui	a5,0xd7a3
40000a9c:	66078793          	addi	a5,a5,1632 # d7a3660 <_stack_size+0xd7a2e60>
40000aa0:	faf42223          	sw	a5,-92(s0)
    aes_block[0] 	= 0x3ad77bb4;
40000aa4:	3ad787b7          	lui	a5,0x3ad78
40000aa8:	bb478793          	addi	a5,a5,-1100 # 3ad77bb4 <_stack_size+0x3ad773b4>
40000aac:	faf42023          	sw	a5,-96(s0)

	aes_key_128[3] 	= 0x09cf4f3c;
40000ab0:	09cf57b7          	lui	a5,0x9cf5
40000ab4:	f3c78793          	addi	a5,a5,-196 # 9cf4f3c <_stack_size+0x9cf473c>
40000ab8:	faf42e23          	sw	a5,-68(s0)
    aes_key_128[2] 	= 0xabf71588;
40000abc:	abf717b7          	lui	a5,0xabf71
40000ac0:	58878793          	addi	a5,a5,1416 # abf71588 <_stack_start+0x2bf70c48>
40000ac4:	faf42c23          	sw	a5,-72(s0)
    aes_key_128[1] 	= 0x28aed2a6;
40000ac8:	28aed7b7          	lui	a5,0x28aed
40000acc:	2a678793          	addi	a5,a5,678 # 28aed2a6 <_stack_size+0x28aecaa6>
40000ad0:	faf42a23          	sw	a5,-76(s0)
    aes_key_128[0]	= 0x2b7e1516;
40000ad4:	2b7e17b7          	lui	a5,0x2b7e1
40000ad8:	51678793          	addi	a5,a5,1302 # 2b7e1516 <_stack_size+0x2b7e0d16>
40000adc:	faf42823          	sw	a5,-80(s0)

   	aes_128_cipher(AES_OP_DE, aes_key_128, aes_block, aes_res);
40000ae0:	f9040693          	addi	a3,s0,-112
40000ae4:	fa040713          	addi	a4,s0,-96
40000ae8:	fb040793          	addi	a5,s0,-80
40000aec:	00070613          	mv	a2,a4
40000af0:	00078593          	mv	a1,a5
40000af4:	00000513          	li	a0,0
40000af8:	33d000ef          	jal	ra,40001634 <aes_128_cipher>

   	print("\r\n\t========================================TEST 5(AES256)==========================================\r\n");
40000afc:	400027b7          	lui	a5,0x40002
40000b00:	73c78513          	addi	a0,a5,1852 # 4000273c <vga_simRes_h160_v120+0x368>
40000b04:	268010ef          	jal	ra,40001d6c <print>
    unsigned int aes_key_256[8] = {0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0};
40000b08:	f6042823          	sw	zero,-144(s0)
40000b0c:	f6042a23          	sw	zero,-140(s0)
40000b10:	f6042c23          	sw	zero,-136(s0)
40000b14:	f6042e23          	sw	zero,-132(s0)
40000b18:	f8042023          	sw	zero,-128(s0)
40000b1c:	f8042223          	sw	zero,-124(s0)
40000b20:	f8042423          	sw	zero,-120(s0)
40000b24:	f8042623          	sw	zero,-116(s0)

    aes_block[3] 	= 0x7393172a;
40000b28:	739317b7          	lui	a5,0x73931
40000b2c:	72a78793          	addi	a5,a5,1834 # 7393172a <__global_pointer$+0x3392e15a>
40000b30:	faf42623          	sw	a5,-84(s0)
    aes_block[2] 	= 0xe93d7e11;
40000b34:	e93d87b7          	lui	a5,0xe93d8
40000b38:	e1178793          	addi	a5,a5,-495 # e93d7e11 <_stack_start+0x693d74d1>
40000b3c:	faf42423          	sw	a5,-88(s0)
    aes_block[1] 	= 0x2e409f96;
40000b40:	2e40a7b7          	lui	a5,0x2e40a
40000b44:	f9678793          	addi	a5,a5,-106 # 2e409f96 <_stack_size+0x2e409796>
40000b48:	faf42223          	sw	a5,-92(s0)
    aes_block[0] 	= 0x6bc1bee2;
40000b4c:	6bc1c7b7          	lui	a5,0x6bc1c
40000b50:	ee278793          	addi	a5,a5,-286 # 6bc1bee2 <__global_pointer$+0x2bc18912>
40000b54:	faf42023          	sw	a5,-96(s0)

    aes_key_256[7] 	= 0x0914dff4;
40000b58:	0914e7b7          	lui	a5,0x914e
40000b5c:	ff478793          	addi	a5,a5,-12 # 914dff4 <_stack_size+0x914d7f4>
40000b60:	f8f42623          	sw	a5,-116(s0)
    aes_key_256[6] 	= 0x2d9810a3;
40000b64:	2d9817b7          	lui	a5,0x2d981
40000b68:	0a378793          	addi	a5,a5,163 # 2d9810a3 <_stack_size+0x2d9808a3>
40000b6c:	f8f42423          	sw	a5,-120(s0)
    aes_key_256[5] 	= 0x3b6108d7;
40000b70:	3b6117b7          	lui	a5,0x3b611
40000b74:	8d778793          	addi	a5,a5,-1833 # 3b6108d7 <_stack_size+0x3b6100d7>
40000b78:	f8f42223          	sw	a5,-124(s0)
    aes_key_256[4]	= 0x1f352c07;
40000b7c:	1f3537b7          	lui	a5,0x1f353
40000b80:	c0778793          	addi	a5,a5,-1017 # 1f352c07 <_stack_size+0x1f352407>
40000b84:	f8f42023          	sw	a5,-128(s0)
    aes_key_256[3] 	= 0x857d7781;
40000b88:	857d77b7          	lui	a5,0x857d7
40000b8c:	78178793          	addi	a5,a5,1921 # 857d7781 <_stack_start+0x57d6e41>
40000b90:	f6f42e23          	sw	a5,-132(s0)
    aes_key_256[2] 	= 0x2b73aef0;
40000b94:	2b73b7b7          	lui	a5,0x2b73b
40000b98:	ef078793          	addi	a5,a5,-272 # 2b73aef0 <_stack_size+0x2b73a6f0>
40000b9c:	f6f42c23          	sw	a5,-136(s0)
    aes_key_256[1] 	= 0x15ca71be;
40000ba0:	15ca77b7          	lui	a5,0x15ca7
40000ba4:	1be78793          	addi	a5,a5,446 # 15ca71be <_stack_size+0x15ca69be>
40000ba8:	f6f42a23          	sw	a5,-140(s0)
    aes_key_256[0]	= 0x603deb10;
40000bac:	603df7b7          	lui	a5,0x603df
40000bb0:	b1078793          	addi	a5,a5,-1264 # 603deb10 <__global_pointer$+0x203db540>
40000bb4:	f6f42823          	sw	a5,-144(s0)

    aes_256_cipher(AES_OP_EN, aes_key_256, aes_block, aes_res);
40000bb8:	f9040693          	addi	a3,s0,-112
40000bbc:	fa040713          	addi	a4,s0,-96
40000bc0:	f7040793          	addi	a5,s0,-144
40000bc4:	00070613          	mv	a2,a4
40000bc8:	00078593          	mv	a1,a5
40000bcc:	00100513          	li	a0,1
40000bd0:	4c9000ef          	jal	ra,40001898 <aes_256_cipher>

   	print("\r\n\t========================================TEST 6(AES256)==========================================\r\n");
40000bd4:	400027b7          	lui	a5,0x40002
40000bd8:	7a478513          	addi	a0,a5,1956 # 400027a4 <vga_simRes_h160_v120+0x3d0>
40000bdc:	190010ef          	jal	ra,40001d6c <print>

    aes_block[3] 	= 0x3db181f8 ;
40000be0:	3db187b7          	lui	a5,0x3db18
40000be4:	1f878793          	addi	a5,a5,504 # 3db181f8 <_stack_size+0x3db179f8>
40000be8:	faf42623          	sw	a5,-84(s0)
    aes_block[2] 	= 0x064b5a7e ;
40000bec:	064b67b7          	lui	a5,0x64b6
40000bf0:	a7e78793          	addi	a5,a5,-1410 # 64b5a7e <_stack_size+0x64b527e>
40000bf4:	faf42423          	sw	a5,-88(s0)
    aes_block[1] 	= 0xb5d2a03c;
40000bf8:	b5d2a7b7          	lui	a5,0xb5d2a
40000bfc:	03c78793          	addi	a5,a5,60 # b5d2a03c <_stack_start+0x35d296fc>
40000c00:	faf42223          	sw	a5,-92(s0)
    aes_block[0] 	= 0xf3eed1bd;
40000c04:	f3eed7b7          	lui	a5,0xf3eed
40000c08:	1bd78793          	addi	a5,a5,445 # f3eed1bd <_stack_start+0x73eec87d>
40000c0c:	faf42023          	sw	a5,-96(s0)

    aes_key_256[7] 	= 0x0914dff4;
40000c10:	0914e7b7          	lui	a5,0x914e
40000c14:	ff478793          	addi	a5,a5,-12 # 914dff4 <_stack_size+0x914d7f4>
40000c18:	f8f42623          	sw	a5,-116(s0)
    aes_key_256[6] 	= 0x2d9810a3;
40000c1c:	2d9817b7          	lui	a5,0x2d981
40000c20:	0a378793          	addi	a5,a5,163 # 2d9810a3 <_stack_size+0x2d9808a3>
40000c24:	f8f42423          	sw	a5,-120(s0)
    aes_key_256[5] 	= 0x3b6108d7;
40000c28:	3b6117b7          	lui	a5,0x3b611
40000c2c:	8d778793          	addi	a5,a5,-1833 # 3b6108d7 <_stack_size+0x3b6100d7>
40000c30:	f8f42223          	sw	a5,-124(s0)
    aes_key_256[4]	= 0x1f352c07;
40000c34:	1f3537b7          	lui	a5,0x1f353
40000c38:	c0778793          	addi	a5,a5,-1017 # 1f352c07 <_stack_size+0x1f352407>
40000c3c:	f8f42023          	sw	a5,-128(s0)
    aes_key_256[3] 	= 0x857d7781;
40000c40:	857d77b7          	lui	a5,0x857d7
40000c44:	78178793          	addi	a5,a5,1921 # 857d7781 <_stack_start+0x57d6e41>
40000c48:	f6f42e23          	sw	a5,-132(s0)
    aes_key_256[2] 	= 0x2b73aef0;
40000c4c:	2b73b7b7          	lui	a5,0x2b73b
40000c50:	ef078793          	addi	a5,a5,-272 # 2b73aef0 <_stack_size+0x2b73a6f0>
40000c54:	f6f42c23          	sw	a5,-136(s0)
    aes_key_256[1] 	= 0x15ca71be;
40000c58:	15ca77b7          	lui	a5,0x15ca7
40000c5c:	1be78793          	addi	a5,a5,446 # 15ca71be <_stack_size+0x15ca69be>
40000c60:	f6f42a23          	sw	a5,-140(s0)
    aes_key_256[0]	= 0x603deb10;
40000c64:	603df7b7          	lui	a5,0x603df
40000c68:	b1078793          	addi	a5,a5,-1264 # 603deb10 <__global_pointer$+0x203db540>
40000c6c:	f6f42823          	sw	a5,-144(s0)

    aes_256_cipher(AES_OP_DE, aes_key_256, aes_block, aes_res);
40000c70:	f9040693          	addi	a3,s0,-112
40000c74:	fa040713          	addi	a4,s0,-96
40000c78:	f7040793          	addi	a5,s0,-144
40000c7c:	00070613          	mv	a2,a4
40000c80:	00078593          	mv	a1,a5
40000c84:	00000513          	li	a0,0
40000c88:	411000ef          	jal	ra,40001898 <aes_256_cipher>
	print("\r\n");
40000c8c:	400037b7          	lui	a5,0x40003
40000c90:	80c78513          	addi	a0,a5,-2036 # 4000280c <vga_simRes_h160_v120+0x438>
40000c94:	0d8010ef          	jal	ra,40001d6c <print>
	print("\r\t******************************PRESENT TEST***************************************\r\n");
40000c98:	400037b7          	lui	a5,0x40003
40000c9c:	81078513          	addi	a0,a5,-2032 # 40002810 <vga_simRes_h160_v120+0x43c>
40000ca0:	0cc010ef          	jal	ra,40001d6c <print>
	unsigned int present_key[3] = {0x0, 0x0, 0x0};
40000ca4:	f6042223          	sw	zero,-156(s0)
40000ca8:	f6042423          	sw	zero,-152(s0)
40000cac:	f6042623          	sw	zero,-148(s0)
	unsigned int present_block[2] 	= {0x0, 0x0};
40000cb0:	f4042e23          	sw	zero,-164(s0)
40000cb4:	f6042023          	sw	zero,-160(s0)
	unsigned int present_res[2] 	= {0x0, 0x0};
40000cb8:	f4042a23          	sw	zero,-172(s0)
40000cbc:	f4042c23          	sw	zero,-168(s0)

	print("\r\n\t==================================TEST 1====================================\r\n");
40000cc0:	400037b7          	lui	a5,0x40003
40000cc4:	86878513          	addi	a0,a5,-1944 # 40002868 <vga_simRes_h160_v120+0x494>
40000cc8:	0a4010ef          	jal	ra,40001d6c <print>

	present_block[1]=0x4c746e67;
40000ccc:	4c7477b7          	lui	a5,0x4c747
40000cd0:	e6778793          	addi	a5,a5,-409 # 4c746e67 <__global_pointer$+0xc743897>
40000cd4:	f6f42023          	sw	a5,-160(s0)
	present_block[0]=0x7579656e;
40000cd8:	757967b7          	lui	a5,0x75796
40000cdc:	56e78793          	addi	a5,a5,1390 # 7579656e <__global_pointer$+0x35792f9e>
40000ce0:	f4f42e23          	sw	a5,-164(s0)

	present_key[2] = 0x46657465;
40000ce4:	466577b7          	lui	a5,0x46657
40000ce8:	46578793          	addi	a5,a5,1125 # 46657465 <__global_pointer$+0x6653e95>
40000cec:	f6f42623          	sw	a5,-148(s0)
	present_key[1] = 0x6c48636d;
40000cf0:	6c4867b7          	lui	a5,0x6c486
40000cf4:	36d78793          	addi	a5,a5,877 # 6c48636d <__global_pointer$+0x2c482d9d>
40000cf8:	f6f42423          	sw	a5,-152(s0)
	present_key[0] = 0x7573;
40000cfc:	000077b7          	lui	a5,0x7
40000d00:	57378793          	addi	a5,a5,1395 # 7573 <_stack_size+0x6d73>
40000d04:	f6f42223          	sw	a5,-156(s0)

	present_cipher(PRESENT_OP_EN,present_key,present_block,present_res);
40000d08:	f5440693          	addi	a3,s0,-172
40000d0c:	f5c40713          	addi	a4,s0,-164
40000d10:	f6440793          	addi	a5,s0,-156
40000d14:	00070613          	mv	a2,a4
40000d18:	00078593          	mv	a1,a5
40000d1c:	00000513          	li	a0,0
40000d20:	47c000ef          	jal	ra,4000119c <present_cipher>

	print("\r\n\t==================================TEST 2====================================\r\n");
40000d24:	400037b7          	lui	a5,0x40003
40000d28:	8bc78513          	addi	a0,a5,-1860 # 400028bc <vga_simRes_h160_v120+0x4e8>
40000d2c:	040010ef          	jal	ra,40001d6c <print>

	present_block[1]=0x0e1d00d4;
40000d30:	0e1d07b7          	lui	a5,0xe1d0
40000d34:	0d478793          	addi	a5,a5,212 # e1d00d4 <_stack_size+0xe1cf8d4>
40000d38:	f6f42023          	sw	a5,-160(s0)
	present_block[0]=0xe46ba99c;
40000d3c:	e46bb7b7          	lui	a5,0xe46bb
40000d40:	99c78793          	addi	a5,a5,-1636 # e46ba99c <_stack_start+0x646ba05c>
40000d44:	f4f42e23          	sw	a5,-164(s0)

	present_key[2] = 0x46657465;
40000d48:	466577b7          	lui	a5,0x46657
40000d4c:	46578793          	addi	a5,a5,1125 # 46657465 <__global_pointer$+0x6653e95>
40000d50:	f6f42623          	sw	a5,-148(s0)
	present_key[1] = 0x6c48636d;
40000d54:	6c4867b7          	lui	a5,0x6c486
40000d58:	36d78793          	addi	a5,a5,877 # 6c48636d <__global_pointer$+0x2c482d9d>
40000d5c:	f6f42423          	sw	a5,-152(s0)
	present_key[0] = 0x7573;
40000d60:	000077b7          	lui	a5,0x7
40000d64:	57378793          	addi	a5,a5,1395 # 7573 <_stack_size+0x6d73>
40000d68:	f6f42223          	sw	a5,-156(s0)

	present_cipher(PRESENT_OP_DE,present_key,present_block,present_res);
40000d6c:	f5440693          	addi	a3,s0,-172
40000d70:	f5c40713          	addi	a4,s0,-164
40000d74:	f6440793          	addi	a5,s0,-156
40000d78:	00070613          	mv	a2,a4
40000d7c:	00078593          	mv	a1,a5
40000d80:	00100513          	li	a0,1
40000d84:	418000ef          	jal	ra,4000119c <present_cipher>

	print("\r\n\t==================================TEST 3====================================\r\n");
40000d88:	400037b7          	lui	a5,0x40003
40000d8c:	91078513          	addi	a0,a5,-1776 # 40002910 <vga_simRes_h160_v120+0x53c>
40000d90:	7dd000ef          	jal	ra,40001d6c <print>

	present_block[1]=0x46657465;
40000d94:	466577b7          	lui	a5,0x46657
40000d98:	46578793          	addi	a5,a5,1125 # 46657465 <__global_pointer$+0x6653e95>
40000d9c:	f6f42023          	sw	a5,-160(s0)
	present_block[0]=0x6c5f5553;
40000da0:	6c5f57b7          	lui	a5,0x6c5f5
40000da4:	55378793          	addi	a5,a5,1363 # 6c5f5553 <__global_pointer$+0x2c5f1f83>
40000da8:	f4f42e23          	sw	a5,-164(s0)

	present_key[2] = 0x00000000;
40000dac:	f6042623          	sw	zero,-148(s0)
	present_key[1] = 0x00000000;
40000db0:	f6042423          	sw	zero,-152(s0)
	present_key[0] = 0x0001;
40000db4:	00100793          	li	a5,1
40000db8:	f6f42223          	sw	a5,-156(s0)
	present_cipher(PRESENT_OP_EN,present_key,present_block,present_res);
40000dbc:	f5440693          	addi	a3,s0,-172
40000dc0:	f5c40713          	addi	a4,s0,-164
40000dc4:	f6440793          	addi	a5,s0,-156
40000dc8:	00070613          	mv	a2,a4
40000dcc:	00078593          	mv	a1,a5
40000dd0:	00000513          	li	a0,0
40000dd4:	3c8000ef          	jal	ra,4000119c <present_cipher>

	print("\r\n\t==================================TEST 4====================================\r\n");
40000dd8:	400037b7          	lui	a5,0x40003
40000ddc:	96478513          	addi	a0,a5,-1692 # 40002964 <vga_simRes_h160_v120+0x590>
40000de0:	78d000ef          	jal	ra,40001d6c <print>

	present_block[1]=0x9346f086;
40000de4:	9346f7b7          	lui	a5,0x9346f
40000de8:	08678793          	addi	a5,a5,134 # 9346f086 <_stack_start+0x1346e746>
40000dec:	f6f42023          	sw	a5,-160(s0)
	present_block[0]=0xb0b1c9b4;
40000df0:	b0b1d7b7          	lui	a5,0xb0b1d
40000df4:	9b478793          	addi	a5,a5,-1612 # b0b1c9b4 <_stack_start+0x30b1c074>
40000df8:	f4f42e23          	sw	a5,-164(s0)

	present_key[2] = 0x00000000;
40000dfc:	f6042623          	sw	zero,-148(s0)
	present_key[1] = 0x00000000;
40000e00:	f6042423          	sw	zero,-152(s0)
	present_key[0] = 0x0001;
40000e04:	00100793          	li	a5,1
40000e08:	f6f42223          	sw	a5,-156(s0)

	present_cipher(PRESENT_OP_DE,present_key,present_block,present_res);
40000e0c:	f5440693          	addi	a3,s0,-172
40000e10:	f5c40713          	addi	a4,s0,-164
40000e14:	f6440793          	addi	a5,s0,-156
40000e18:	00070613          	mv	a2,a4
40000e1c:	00078593          	mv	a1,a5
40000e20:	00100513          	li	a0,1
40000e24:	378000ef          	jal	ra,4000119c <present_cipher>
	print("\r\n");
40000e28:	400037b7          	lui	a5,0x40003
40000e2c:	80c78513          	addi	a0,a5,-2036 # 4000280c <vga_simRes_h160_v120+0x438>
40000e30:	73d000ef          	jal	ra,40001d6c <print>
	return 0;	
40000e34:	00000793          	li	a5,0
}
40000e38:	00078513          	mv	a0,a5
40000e3c:	0ac12083          	lw	ra,172(sp)
40000e40:	0a812403          	lw	s0,168(sp)
40000e44:	0b010113          	addi	sp,sp,176
40000e48:	00008067          	ret

40000e4c <irqCallback>:
void irqCallback(){
40000e4c:	ff010113          	addi	sp,sp,-16
40000e50:	00812623          	sw	s0,12(sp)
40000e54:	01010413          	addi	s0,sp,16

}
40000e58:	00000013          	nop
40000e5c:	00c12403          	lw	s0,12(sp)
40000e60:	01010113          	addi	sp,sp,16
40000e64:	00008067          	ret

40000e68 <timer_init>:
static void timer_init(Timer_Reg *reg){
40000e68:	fe010113          	addi	sp,sp,-32
40000e6c:	00812e23          	sw	s0,28(sp)
40000e70:	02010413          	addi	s0,sp,32
40000e74:	fea42623          	sw	a0,-20(s0)
	reg->CLEARS_TICKS  = 0;
40000e78:	fec42783          	lw	a5,-20(s0)
40000e7c:	0007a023          	sw	zero,0(a5)
	reg->VALUE = 0;
40000e80:	fec42783          	lw	a5,-20(s0)
40000e84:	0007a423          	sw	zero,8(a5)
}
40000e88:	00000013          	nop
40000e8c:	01c12403          	lw	s0,28(sp)
40000e90:	02010113          	addi	sp,sp,32
40000e94:	00008067          	ret

40000e98 <prescaler_init>:
static void prescaler_init(Prescaler_Reg* reg){
40000e98:	fe010113          	addi	sp,sp,-32
40000e9c:	00812e23          	sw	s0,28(sp)
40000ea0:	02010413          	addi	s0,sp,32
40000ea4:	fea42623          	sw	a0,-20(s0)
}
40000ea8:	00000013          	nop
40000eac:	01c12403          	lw	s0,28(sp)
40000eb0:	02010113          	addi	sp,sp,32
40000eb4:	00008067          	ret

40000eb8 <interruptCtrl_init>:
static void interruptCtrl_init(InterruptCtrl_Reg* reg){
40000eb8:	fe010113          	addi	sp,sp,-32
40000ebc:	00812e23          	sw	s0,28(sp)
40000ec0:	02010413          	addi	s0,sp,32
40000ec4:	fea42623          	sw	a0,-20(s0)
	reg->MASKS = 0;
40000ec8:	fec42783          	lw	a5,-20(s0)
40000ecc:	0007a223          	sw	zero,4(a5)
	reg->PENDINGS = 0xFFFFFFFF;
40000ed0:	fec42783          	lw	a5,-20(s0)
40000ed4:	fff00713          	li	a4,-1
40000ed8:	00e7a023          	sw	a4,0(a5)
}
40000edc:	00000013          	nop
40000ee0:	01c12403          	lw	s0,28(sp)
40000ee4:	02010113          	addi	sp,sp,32
40000ee8:	00008067          	ret

40000eec <uart_writeAvailability>:
static uint32_t uart_writeAvailability(Uart_Reg *reg){
40000eec:	fe010113          	addi	sp,sp,-32
40000ef0:	00812e23          	sw	s0,28(sp)
40000ef4:	02010413          	addi	s0,sp,32
40000ef8:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS >> 16) & 0xFF;
40000efc:	fec42783          	lw	a5,-20(s0)
40000f00:	0047a783          	lw	a5,4(a5)
40000f04:	0107d793          	srli	a5,a5,0x10
40000f08:	0ff7f793          	zext.b	a5,a5
}
40000f0c:	00078513          	mv	a0,a5
40000f10:	01c12403          	lw	s0,28(sp)
40000f14:	02010113          	addi	sp,sp,32
40000f18:	00008067          	ret

40000f1c <uart_readOccupancy>:
static uint32_t uart_readOccupancy(Uart_Reg *reg){
40000f1c:	fe010113          	addi	sp,sp,-32
40000f20:	00812e23          	sw	s0,28(sp)
40000f24:	02010413          	addi	s0,sp,32
40000f28:	fea42623          	sw	a0,-20(s0)
	return reg->STATUS >> 24;
40000f2c:	fec42783          	lw	a5,-20(s0)
40000f30:	0047a783          	lw	a5,4(a5)
40000f34:	0187d793          	srli	a5,a5,0x18
}
40000f38:	00078513          	mv	a0,a5
40000f3c:	01c12403          	lw	s0,28(sp)
40000f40:	02010113          	addi	sp,sp,32
40000f44:	00008067          	ret

40000f48 <uart_write>:
static void uart_write(Uart_Reg *reg, uint32_t data){
40000f48:	fe010113          	addi	sp,sp,-32
40000f4c:	00112e23          	sw	ra,28(sp)
40000f50:	00812c23          	sw	s0,24(sp)
40000f54:	02010413          	addi	s0,sp,32
40000f58:	fea42623          	sw	a0,-20(s0)
40000f5c:	feb42423          	sw	a1,-24(s0)
	while(uart_writeAvailability(reg) == 0);
40000f60:	00000013          	nop
40000f64:	fec42503          	lw	a0,-20(s0)
40000f68:	f85ff0ef          	jal	ra,40000eec <uart_writeAvailability>
40000f6c:	00050793          	mv	a5,a0
40000f70:	fe078ae3          	beqz	a5,40000f64 <uart_write+0x1c>
	reg->DATA = data;
40000f74:	fec42783          	lw	a5,-20(s0)
40000f78:	fe842703          	lw	a4,-24(s0)
40000f7c:	00e7a023          	sw	a4,0(a5)
}
40000f80:	00000013          	nop
40000f84:	01c12083          	lw	ra,28(sp)
40000f88:	01812403          	lw	s0,24(sp)
40000f8c:	02010113          	addi	sp,sp,32
40000f90:	00008067          	ret

40000f94 <uart_applyConfig>:
static void uart_applyConfig(Uart_Reg *reg, Uart_Config *config){
40000f94:	fe010113          	addi	sp,sp,-32
40000f98:	00812e23          	sw	s0,28(sp)
40000f9c:	02010413          	addi	s0,sp,32
40000fa0:	fea42623          	sw	a0,-20(s0)
40000fa4:	feb42423          	sw	a1,-24(s0)
	reg->CLOCK_DIVIDER = config->clockDivider;
40000fa8:	fe842783          	lw	a5,-24(s0)
40000fac:	00c7a703          	lw	a4,12(a5)
40000fb0:	fec42783          	lw	a5,-20(s0)
40000fb4:	00e7a423          	sw	a4,8(a5)
	reg->FRAME_CONFIG = ((config->dataLength-1) << 0) | (config->parity << 8) | (config->stop << 16);
40000fb8:	fe842783          	lw	a5,-24(s0)
40000fbc:	0007a783          	lw	a5,0(a5)
40000fc0:	fff78713          	addi	a4,a5,-1
40000fc4:	fe842783          	lw	a5,-24(s0)
40000fc8:	0047a783          	lw	a5,4(a5)
40000fcc:	00879793          	slli	a5,a5,0x8
40000fd0:	00f76733          	or	a4,a4,a5
40000fd4:	fe842783          	lw	a5,-24(s0)
40000fd8:	0087a783          	lw	a5,8(a5)
40000fdc:	01079793          	slli	a5,a5,0x10
40000fe0:	00f76733          	or	a4,a4,a5
40000fe4:	fec42783          	lw	a5,-20(s0)
40000fe8:	00e7a623          	sw	a4,12(a5)
}
40000fec:	00000013          	nop
40000ff0:	01c12403          	lw	s0,28(sp)
40000ff4:	02010113          	addi	sp,sp,32
40000ff8:	00008067          	ret

40000ffc <vga_isBusy>:
static uint32_t vga_isBusy(Vga_Reg *reg){
40000ffc:	fe010113          	addi	sp,sp,-32
40001000:	00812e23          	sw	s0,28(sp)
40001004:	02010413          	addi	s0,sp,32
40001008:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS & 2) != 0;
4000100c:	fec42783          	lw	a5,-20(s0)
40001010:	0007a783          	lw	a5,0(a5)
40001014:	0027f793          	andi	a5,a5,2
40001018:	00f037b3          	snez	a5,a5
4000101c:	0ff7f793          	zext.b	a5,a5
}
40001020:	00078513          	mv	a0,a5
40001024:	01c12403          	lw	s0,28(sp)
40001028:	02010113          	addi	sp,sp,32
4000102c:	00008067          	ret

40001030 <vga_run>:
static void vga_run(Vga_Reg *reg){
40001030:	fe010113          	addi	sp,sp,-32
40001034:	00812e23          	sw	s0,28(sp)
40001038:	02010413          	addi	s0,sp,32
4000103c:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 1;
40001040:	fec42783          	lw	a5,-20(s0)
40001044:	00100713          	li	a4,1
40001048:	00e7a023          	sw	a4,0(a5)
}
4000104c:	00000013          	nop
40001050:	01c12403          	lw	s0,28(sp)
40001054:	02010113          	addi	sp,sp,32
40001058:	00008067          	ret

4000105c <vga_stop>:
static void vga_stop(Vga_Reg *reg){
4000105c:	fe010113          	addi	sp,sp,-32
40001060:	00112e23          	sw	ra,28(sp)
40001064:	00812c23          	sw	s0,24(sp)
40001068:	02010413          	addi	s0,sp,32
4000106c:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 0;
40001070:	fec42783          	lw	a5,-20(s0)
40001074:	0007a023          	sw	zero,0(a5)
	while(vga_isBusy(reg));
40001078:	00000013          	nop
4000107c:	fec42503          	lw	a0,-20(s0)
40001080:	f7dff0ef          	jal	ra,40000ffc <vga_isBusy>
40001084:	00050793          	mv	a5,a0
40001088:	fe079ae3          	bnez	a5,4000107c <vga_stop+0x20>
}
4000108c:	00000013          	nop
40001090:	00000013          	nop
40001094:	01c12083          	lw	ra,28(sp)
40001098:	01812403          	lw	s0,24(sp)
4000109c:	02010113          	addi	sp,sp,32
400010a0:	00008067          	ret

400010a4 <present_write>:
#include "briey.h"
void present_write(uint32_t iData, uint32_t iAddress)
{
400010a4:	fe010113          	addi	sp,sp,-32
400010a8:	00812e23          	sw	s0,28(sp)
400010ac:	02010413          	addi	s0,sp,32
400010b0:	fea42623          	sw	a0,-20(s0)
400010b4:	feb42423          	sw	a1,-24(s0)
	PRESENT_BASE->ADDRESS		= iAddress;
400010b8:	f00037b7          	lui	a5,0xf0003
400010bc:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
400010c0:	fe842703          	lw	a4,-24(s0)
400010c4:	00e7a623          	sw	a4,12(a5)
	PRESENT_BASE->WRITE_N 		= 0;
400010c8:	f00037b7          	lui	a5,0xf0003
400010cc:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
400010d0:	0007a223          	sw	zero,4(a5)
	PRESENT_BASE->READ_N 		= 1;
400010d4:	f00037b7          	lui	a5,0xf0003
400010d8:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
400010dc:	00100713          	li	a4,1
400010e0:	00e7a423          	sw	a4,8(a5)
	PRESENT_BASE->IDATA			= iData;
400010e4:	f00037b7          	lui	a5,0xf0003
400010e8:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
400010ec:	fec42703          	lw	a4,-20(s0)
400010f0:	00e7a823          	sw	a4,16(a5)
	PRESENT_BASE->CHIP_SELECT_N	= 0;
400010f4:	f00037b7          	lui	a5,0xf0003
400010f8:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
400010fc:	0007a023          	sw	zero,0(a5)
	PRESENT_BASE->CHIP_SELECT_N	= 1;
40001100:	f00037b7          	lui	a5,0xf0003
40001104:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40001108:	00100713          	li	a4,1
4000110c:	00e7a023          	sw	a4,0(a5)
}
40001110:	00000013          	nop
40001114:	01c12403          	lw	s0,28(sp)
40001118:	02010113          	addi	sp,sp,32
4000111c:	00008067          	ret

40001120 <present_read>:
uint32_t present_read(uint32_t iAddress)
{
40001120:	fd010113          	addi	sp,sp,-48
40001124:	02812623          	sw	s0,44(sp)
40001128:	03010413          	addi	s0,sp,48
4000112c:	fca42e23          	sw	a0,-36(s0)
	PRESENT_BASE->ADDRESS		= iAddress;
40001130:	f00037b7          	lui	a5,0xf0003
40001134:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40001138:	fdc42703          	lw	a4,-36(s0)
4000113c:	00e7a623          	sw	a4,12(a5)
	PRESENT_BASE->READ_N		= 0;
40001140:	f00037b7          	lui	a5,0xf0003
40001144:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40001148:	0007a423          	sw	zero,8(a5)
	PRESENT_BASE->WRITE_N		= 1;
4000114c:	f00037b7          	lui	a5,0xf0003
40001150:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40001154:	00100713          	li	a4,1
40001158:	00e7a223          	sw	a4,4(a5)
	PRESENT_BASE->CHIP_SELECT_N	= 0;
4000115c:	f00037b7          	lui	a5,0xf0003
40001160:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40001164:	0007a023          	sw	zero,0(a5)
	uint32_t res 				= PRESENT_BASE->ODATA;
40001168:	f00037b7          	lui	a5,0xf0003
4000116c:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40001170:	0147a783          	lw	a5,20(a5)
40001174:	fef42623          	sw	a5,-20(s0)
	PRESENT_BASE->CHIP_SELECT_N	= 1;
40001178:	f00037b7          	lui	a5,0xf0003
4000117c:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40001180:	00100713          	li	a4,1
40001184:	00e7a023          	sw	a4,0(a5)
	return res;
40001188:	fec42783          	lw	a5,-20(s0)
}
4000118c:	00078513          	mv	a0,a5
40001190:	02c12403          	lw	s0,44(sp)
40001194:	03010113          	addi	sp,sp,48
40001198:	00008067          	ret

4000119c <present_cipher>:
void present_cipher(unsigned char operation, uint32_t *key, uint32_t *block, uint32_t *res) {
4000119c:	fe010113          	addi	sp,sp,-32
400011a0:	00112e23          	sw	ra,28(sp)
400011a4:	00812c23          	sw	s0,24(sp)
400011a8:	00912a23          	sw	s1,20(sp)
400011ac:	02010413          	addi	s0,sp,32
400011b0:	00050793          	mv	a5,a0
400011b4:	feb42423          	sw	a1,-24(s0)
400011b8:	fec42223          	sw	a2,-28(s0)
400011bc:	fed42023          	sw	a3,-32(s0)
400011c0:	fef407a3          	sb	a5,-17(s0)

	//EN_OR_DE
	if(operation == PRESENT_OP_EN) present_write(PRESENT_OP_EN,PRESENT_ADDR_EN_OR_DE);
400011c4:	fef44783          	lbu	a5,-17(s0)
400011c8:	00079a63          	bnez	a5,400011dc <present_cipher+0x40>
400011cc:	00800593          	li	a1,8
400011d0:	00000513          	li	a0,0
400011d4:	ed1ff0ef          	jal	ra,400010a4 <present_write>
400011d8:	0100006f          	j	400011e8 <present_cipher+0x4c>
	else present_write(PRESENT_OP_DE,PRESENT_ADDR_EN_OR_DE);
400011dc:	00800593          	li	a1,8
400011e0:	00100513          	li	a0,1
400011e4:	ec1ff0ef          	jal	ra,400010a4 <present_write>

	//PLAIN_TEXT
	present_write(block[1],PRESENT_ADDR_BLOCK_BASE +1);
400011e8:	fe442783          	lw	a5,-28(s0)
400011ec:	00478793          	addi	a5,a5,4
400011f0:	0007a783          	lw	a5,0(a5)
400011f4:	00500593          	li	a1,5
400011f8:	00078513          	mv	a0,a5
400011fc:	ea9ff0ef          	jal	ra,400010a4 <present_write>
	present_write(block[0],PRESENT_ADDR_BLOCK_BASE);
40001200:	fe442783          	lw	a5,-28(s0)
40001204:	0007a783          	lw	a5,0(a5)
40001208:	00400593          	li	a1,4
4000120c:	00078513          	mv	a0,a5
40001210:	e95ff0ef          	jal	ra,400010a4 <present_write>

	//KEY
	present_write(key[2],PRESENT_ADDR_KEY_BASE +2);
40001214:	fe842783          	lw	a5,-24(s0)
40001218:	00878793          	addi	a5,a5,8
4000121c:	0007a783          	lw	a5,0(a5)
40001220:	00300593          	li	a1,3
40001224:	00078513          	mv	a0,a5
40001228:	e7dff0ef          	jal	ra,400010a4 <present_write>
	present_write(key[1],PRESENT_ADDR_KEY_BASE +1);
4000122c:	fe842783          	lw	a5,-24(s0)
40001230:	00478793          	addi	a5,a5,4
40001234:	0007a783          	lw	a5,0(a5)
40001238:	00200593          	li	a1,2
4000123c:	00078513          	mv	a0,a5
40001240:	e65ff0ef          	jal	ra,400010a4 <present_write>
	present_write(key[0],PRESENT_ADDR_KEY_BASE);
40001244:	fe842783          	lw	a5,-24(s0)
40001248:	0007a783          	lw	a5,0(a5)
4000124c:	00100593          	li	a1,1
40001250:	00078513          	mv	a0,a5
40001254:	e51ff0ef          	jal	ra,400010a4 <present_write>

	//START
	present_write(0x1,PRESENT_ADDR_START);
40001258:	00000593          	li	a1,0
4000125c:	00100513          	li	a0,1
40001260:	e45ff0ef          	jal	ra,400010a4 <present_write>
    while(present_read(PRESENT_ADDR_RESULT_BASE) == 0);
40001264:	00000013          	nop
40001268:	00600513          	li	a0,6
4000126c:	eb5ff0ef          	jal	ra,40001120 <present_read>
40001270:	00050793          	mv	a5,a0
40001274:	fe078ae3          	beqz	a5,40001268 <present_cipher+0xcc>

    res[1] = present_read(PRESENT_ADDR_RESULT_BASE +1);
40001278:	fe042783          	lw	a5,-32(s0)
4000127c:	00478493          	addi	s1,a5,4
40001280:	00700513          	li	a0,7
40001284:	e9dff0ef          	jal	ra,40001120 <present_read>
40001288:	00050793          	mv	a5,a0
4000128c:	00f4a023          	sw	a5,0(s1)
    res[0] =present_read(PRESENT_ADDR_RESULT_BASE);
40001290:	00600513          	li	a0,6
40001294:	e8dff0ef          	jal	ra,40001120 <present_read>
40001298:	00050713          	mv	a4,a0
4000129c:	fe042783          	lw	a5,-32(s0)
400012a0:	00e7a023          	sw	a4,0(a5)


    //print result to terminal
	if(operation == PRESENT_OP_EN)
400012a4:	fef44783          	lbu	a5,-17(s0)
400012a8:	00079a63          	bnez	a5,400012bc <present_cipher+0x120>
		print("\r\t===========================PRESENT ENCRYPTTION==============================\r\n");
400012ac:	400037b7          	lui	a5,0x40003
400012b0:	a1878513          	addi	a0,a5,-1512 # 40002a18 <vga_simRes_h160_v120+0x20>
400012b4:	2b9000ef          	jal	ra,40001d6c <print>
400012b8:	0100006f          	j	400012c8 <present_cipher+0x12c>
	else
		print("\r\t===========================PRESENT DECRYPTTION==============================\r\n");
400012bc:	400037b7          	lui	a5,0x40003
400012c0:	a6c78513          	addi	a0,a5,-1428 # 40002a6c <vga_simRes_h160_v120+0x74>
400012c4:	2a9000ef          	jal	ra,40001d6c <print>
	print("\r\n");
400012c8:	400037b7          	lui	a5,0x40003
400012cc:	ac078513          	addi	a0,a5,-1344 # 40002ac0 <vga_simRes_h160_v120+0xc8>
400012d0:	29d000ef          	jal	ra,40001d6c <print>
	print64bit("\r\tPLAIN_TEXT (64-bit) : ", block);
400012d4:	fe442583          	lw	a1,-28(s0)
400012d8:	400037b7          	lui	a5,0x40003
400012dc:	ac478513          	addi	a0,a5,-1340 # 40002ac4 <vga_simRes_h160_v120+0xcc>
400012e0:	4f5000ef          	jal	ra,40001fd4 <print64bit>
	print80bit("KEY (80-bit) : ", key);
400012e4:	fe842583          	lw	a1,-24(s0)
400012e8:	400037b7          	lui	a5,0x40003
400012ec:	ae078513          	addi	a0,a5,-1312 # 40002ae0 <vga_simRes_h160_v120+0xe8>
400012f0:	5ed000ef          	jal	ra,400020dc <print80bit>
	print64bit("RESULT (64-bit) : ", res);
400012f4:	fe042583          	lw	a1,-32(s0)
400012f8:	400037b7          	lui	a5,0x40003
400012fc:	af078513          	addi	a0,a5,-1296 # 40002af0 <vga_simRes_h160_v120+0xf8>
40001300:	4d5000ef          	jal	ra,40001fd4 <print64bit>
	//print("\r\n============================================================================\r\n");
}
40001304:	00000013          	nop
40001308:	01c12083          	lw	ra,28(sp)
4000130c:	01812403          	lw	s0,24(sp)
40001310:	01412483          	lw	s1,20(sp)
40001314:	02010113          	addi	sp,sp,32
40001318:	00008067          	ret

4000131c <timer_init>:
static void timer_init(Timer_Reg *reg){
4000131c:	fe010113          	addi	sp,sp,-32
40001320:	00812e23          	sw	s0,28(sp)
40001324:	02010413          	addi	s0,sp,32
40001328:	fea42623          	sw	a0,-20(s0)
	reg->CLEARS_TICKS  = 0;
4000132c:	fec42783          	lw	a5,-20(s0)
40001330:	0007a023          	sw	zero,0(a5)
	reg->VALUE = 0;
40001334:	fec42783          	lw	a5,-20(s0)
40001338:	0007a423          	sw	zero,8(a5)
}
4000133c:	00000013          	nop
40001340:	01c12403          	lw	s0,28(sp)
40001344:	02010113          	addi	sp,sp,32
40001348:	00008067          	ret

4000134c <prescaler_init>:
static void prescaler_init(Prescaler_Reg* reg){
4000134c:	fe010113          	addi	sp,sp,-32
40001350:	00812e23          	sw	s0,28(sp)
40001354:	02010413          	addi	s0,sp,32
40001358:	fea42623          	sw	a0,-20(s0)
}
4000135c:	00000013          	nop
40001360:	01c12403          	lw	s0,28(sp)
40001364:	02010113          	addi	sp,sp,32
40001368:	00008067          	ret

4000136c <interruptCtrl_init>:
static void interruptCtrl_init(InterruptCtrl_Reg* reg){
4000136c:	fe010113          	addi	sp,sp,-32
40001370:	00812e23          	sw	s0,28(sp)
40001374:	02010413          	addi	s0,sp,32
40001378:	fea42623          	sw	a0,-20(s0)
	reg->MASKS = 0;
4000137c:	fec42783          	lw	a5,-20(s0)
40001380:	0007a223          	sw	zero,4(a5)
	reg->PENDINGS = 0xFFFFFFFF;
40001384:	fec42783          	lw	a5,-20(s0)
40001388:	fff00713          	li	a4,-1
4000138c:	00e7a023          	sw	a4,0(a5)
}
40001390:	00000013          	nop
40001394:	01c12403          	lw	s0,28(sp)
40001398:	02010113          	addi	sp,sp,32
4000139c:	00008067          	ret

400013a0 <uart_writeAvailability>:
static uint32_t uart_writeAvailability(Uart_Reg *reg){
400013a0:	fe010113          	addi	sp,sp,-32
400013a4:	00812e23          	sw	s0,28(sp)
400013a8:	02010413          	addi	s0,sp,32
400013ac:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS >> 16) & 0xFF;
400013b0:	fec42783          	lw	a5,-20(s0)
400013b4:	0047a783          	lw	a5,4(a5)
400013b8:	0107d793          	srli	a5,a5,0x10
400013bc:	0ff7f793          	zext.b	a5,a5
}
400013c0:	00078513          	mv	a0,a5
400013c4:	01c12403          	lw	s0,28(sp)
400013c8:	02010113          	addi	sp,sp,32
400013cc:	00008067          	ret

400013d0 <uart_readOccupancy>:
static uint32_t uart_readOccupancy(Uart_Reg *reg){
400013d0:	fe010113          	addi	sp,sp,-32
400013d4:	00812e23          	sw	s0,28(sp)
400013d8:	02010413          	addi	s0,sp,32
400013dc:	fea42623          	sw	a0,-20(s0)
	return reg->STATUS >> 24;
400013e0:	fec42783          	lw	a5,-20(s0)
400013e4:	0047a783          	lw	a5,4(a5)
400013e8:	0187d793          	srli	a5,a5,0x18
}
400013ec:	00078513          	mv	a0,a5
400013f0:	01c12403          	lw	s0,28(sp)
400013f4:	02010113          	addi	sp,sp,32
400013f8:	00008067          	ret

400013fc <uart_write>:
static void uart_write(Uart_Reg *reg, uint32_t data){
400013fc:	fe010113          	addi	sp,sp,-32
40001400:	00112e23          	sw	ra,28(sp)
40001404:	00812c23          	sw	s0,24(sp)
40001408:	02010413          	addi	s0,sp,32
4000140c:	fea42623          	sw	a0,-20(s0)
40001410:	feb42423          	sw	a1,-24(s0)
	while(uart_writeAvailability(reg) == 0);
40001414:	00000013          	nop
40001418:	fec42503          	lw	a0,-20(s0)
4000141c:	f85ff0ef          	jal	ra,400013a0 <uart_writeAvailability>
40001420:	00050793          	mv	a5,a0
40001424:	fe078ae3          	beqz	a5,40001418 <uart_write+0x1c>
	reg->DATA = data;
40001428:	fec42783          	lw	a5,-20(s0)
4000142c:	fe842703          	lw	a4,-24(s0)
40001430:	00e7a023          	sw	a4,0(a5)
}
40001434:	00000013          	nop
40001438:	01c12083          	lw	ra,28(sp)
4000143c:	01812403          	lw	s0,24(sp)
40001440:	02010113          	addi	sp,sp,32
40001444:	00008067          	ret

40001448 <uart_applyConfig>:
static void uart_applyConfig(Uart_Reg *reg, Uart_Config *config){
40001448:	fe010113          	addi	sp,sp,-32
4000144c:	00812e23          	sw	s0,28(sp)
40001450:	02010413          	addi	s0,sp,32
40001454:	fea42623          	sw	a0,-20(s0)
40001458:	feb42423          	sw	a1,-24(s0)
	reg->CLOCK_DIVIDER = config->clockDivider;
4000145c:	fe842783          	lw	a5,-24(s0)
40001460:	00c7a703          	lw	a4,12(a5)
40001464:	fec42783          	lw	a5,-20(s0)
40001468:	00e7a423          	sw	a4,8(a5)
	reg->FRAME_CONFIG = ((config->dataLength-1) << 0) | (config->parity << 8) | (config->stop << 16);
4000146c:	fe842783          	lw	a5,-24(s0)
40001470:	0007a783          	lw	a5,0(a5)
40001474:	fff78713          	addi	a4,a5,-1
40001478:	fe842783          	lw	a5,-24(s0)
4000147c:	0047a783          	lw	a5,4(a5)
40001480:	00879793          	slli	a5,a5,0x8
40001484:	00f76733          	or	a4,a4,a5
40001488:	fe842783          	lw	a5,-24(s0)
4000148c:	0087a783          	lw	a5,8(a5)
40001490:	01079793          	slli	a5,a5,0x10
40001494:	00f76733          	or	a4,a4,a5
40001498:	fec42783          	lw	a5,-20(s0)
4000149c:	00e7a623          	sw	a4,12(a5)
}
400014a0:	00000013          	nop
400014a4:	01c12403          	lw	s0,28(sp)
400014a8:	02010113          	addi	sp,sp,32
400014ac:	00008067          	ret

400014b0 <vga_isBusy>:
static uint32_t vga_isBusy(Vga_Reg *reg){
400014b0:	fe010113          	addi	sp,sp,-32
400014b4:	00812e23          	sw	s0,28(sp)
400014b8:	02010413          	addi	s0,sp,32
400014bc:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS & 2) != 0;
400014c0:	fec42783          	lw	a5,-20(s0)
400014c4:	0007a783          	lw	a5,0(a5)
400014c8:	0027f793          	andi	a5,a5,2
400014cc:	00f037b3          	snez	a5,a5
400014d0:	0ff7f793          	zext.b	a5,a5
}
400014d4:	00078513          	mv	a0,a5
400014d8:	01c12403          	lw	s0,28(sp)
400014dc:	02010113          	addi	sp,sp,32
400014e0:	00008067          	ret

400014e4 <vga_run>:
static void vga_run(Vga_Reg *reg){
400014e4:	fe010113          	addi	sp,sp,-32
400014e8:	00812e23          	sw	s0,28(sp)
400014ec:	02010413          	addi	s0,sp,32
400014f0:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 1;
400014f4:	fec42783          	lw	a5,-20(s0)
400014f8:	00100713          	li	a4,1
400014fc:	00e7a023          	sw	a4,0(a5)
}
40001500:	00000013          	nop
40001504:	01c12403          	lw	s0,28(sp)
40001508:	02010113          	addi	sp,sp,32
4000150c:	00008067          	ret

40001510 <vga_stop>:
static void vga_stop(Vga_Reg *reg){
40001510:	fe010113          	addi	sp,sp,-32
40001514:	00112e23          	sw	ra,28(sp)
40001518:	00812c23          	sw	s0,24(sp)
4000151c:	02010413          	addi	s0,sp,32
40001520:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 0;
40001524:	fec42783          	lw	a5,-20(s0)
40001528:	0007a023          	sw	zero,0(a5)
	while(vga_isBusy(reg));
4000152c:	00000013          	nop
40001530:	fec42503          	lw	a0,-20(s0)
40001534:	f7dff0ef          	jal	ra,400014b0 <vga_isBusy>
40001538:	00050793          	mv	a5,a0
4000153c:	fe079ae3          	bnez	a5,40001530 <vga_stop+0x20>
}
40001540:	00000013          	nop
40001544:	00000013          	nop
40001548:	01c12083          	lw	ra,28(sp)
4000154c:	01812403          	lw	s0,24(sp)
40001550:	02010113          	addi	sp,sp,32
40001554:	00008067          	ret

40001558 <aes_write>:
#include "briey.h"
void aes_write(uint32_t iData, uint32_t iAddress)
{
40001558:	fe010113          	addi	sp,sp,-32
4000155c:	00812e23          	sw	s0,28(sp)
40001560:	02010413          	addi	s0,sp,32
40001564:	fea42623          	sw	a0,-20(s0)
40001568:	feb42423          	sw	a1,-24(s0)
	AES_BASE->ADDRESS		= iAddress;
4000156c:	f00027b7          	lui	a5,0xf0002
40001570:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40001574:	fe842703          	lw	a4,-24(s0)
40001578:	00e7a423          	sw	a4,8(a5)
	AES_BASE->WRITE_ENABLE 	= 1;
4000157c:	f00027b7          	lui	a5,0xf0002
40001580:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40001584:	00100713          	li	a4,1
40001588:	00e7a223          	sw	a4,4(a5)
	AES_BASE->IDATA			= iData;
4000158c:	f00027b7          	lui	a5,0xf0002
40001590:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40001594:	fec42703          	lw	a4,-20(s0)
40001598:	00e7a623          	sw	a4,12(a5)
	AES_BASE->CHIP_SELECT	= 1;
4000159c:	f00027b7          	lui	a5,0xf0002
400015a0:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
400015a4:	00100713          	li	a4,1
400015a8:	00e7a023          	sw	a4,0(a5)
	AES_BASE->CHIP_SELECT	= 0;
400015ac:	f00027b7          	lui	a5,0xf0002
400015b0:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
400015b4:	0007a023          	sw	zero,0(a5)
}
400015b8:	00000013          	nop
400015bc:	01c12403          	lw	s0,28(sp)
400015c0:	02010113          	addi	sp,sp,32
400015c4:	00008067          	ret

400015c8 <aes_read>:
uint32_t aes_read(uint32_t iAddress)
{
400015c8:	fd010113          	addi	sp,sp,-48
400015cc:	02812623          	sw	s0,44(sp)
400015d0:	03010413          	addi	s0,sp,48
400015d4:	fca42e23          	sw	a0,-36(s0)
	AES_BASE->ADDRESS		= iAddress;
400015d8:	f00027b7          	lui	a5,0xf0002
400015dc:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
400015e0:	fdc42703          	lw	a4,-36(s0)
400015e4:	00e7a423          	sw	a4,8(a5)
	AES_BASE->WRITE_ENABLE	= 0;
400015e8:	f00027b7          	lui	a5,0xf0002
400015ec:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
400015f0:	0007a223          	sw	zero,4(a5)
	AES_BASE->CHIP_SELECT	= 1;
400015f4:	f00027b7          	lui	a5,0xf0002
400015f8:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
400015fc:	00100713          	li	a4,1
40001600:	00e7a023          	sw	a4,0(a5)
	uint32_t res 				= AES_BASE->ODATA;
40001604:	f00027b7          	lui	a5,0xf0002
40001608:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
4000160c:	0107a783          	lw	a5,16(a5)
40001610:	fef42623          	sw	a5,-20(s0)
	AES_BASE->CHIP_SELECT	= 0;
40001614:	f00027b7          	lui	a5,0xf0002
40001618:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
4000161c:	0007a023          	sw	zero,0(a5)
	return res;
40001620:	fec42783          	lw	a5,-20(s0)
}
40001624:	00078513          	mv	a0,a5
40001628:	02c12403          	lw	s0,44(sp)
4000162c:	03010113          	addi	sp,sp,48
40001630:	00008067          	ret

40001634 <aes_128_cipher>:
void aes_128_cipher(unsigned char operation, uint32_t *key, uint32_t *block, uint32_t *res) {
40001634:	fd010113          	addi	sp,sp,-48
40001638:	02112623          	sw	ra,44(sp)
4000163c:	02812423          	sw	s0,40(sp)
40001640:	02912223          	sw	s1,36(sp)
40001644:	03010413          	addi	s0,sp,48
40001648:	00050793          	mv	a5,a0
4000164c:	fcb42c23          	sw	a1,-40(s0)
40001650:	fcc42a23          	sw	a2,-44(s0)
40001654:	fcd42823          	sw	a3,-48(s0)
40001658:	fcf40fa3          	sb	a5,-33(s0)
	aes_write(0x0,AES_ADDR_KEY_BASE +7);
4000165c:	01700593          	li	a1,23
40001660:	00000513          	li	a0,0
40001664:	ef5ff0ef          	jal	ra,40001558 <aes_write>
	aes_write(0x0,AES_ADDR_KEY_BASE +6);
40001668:	01600593          	li	a1,22
4000166c:	00000513          	li	a0,0
40001670:	ee9ff0ef          	jal	ra,40001558 <aes_write>
	aes_write(0x0,AES_ADDR_KEY_BASE +5);
40001674:	01500593          	li	a1,21
40001678:	00000513          	li	a0,0
4000167c:	eddff0ef          	jal	ra,40001558 <aes_write>
	aes_write(0x0,AES_ADDR_KEY_BASE +4);
40001680:	01400593          	li	a1,20
40001684:	00000513          	li	a0,0
40001688:	ed1ff0ef          	jal	ra,40001558 <aes_write>
	aes_write(key[3],AES_ADDR_KEY_BASE +3);
4000168c:	fd842783          	lw	a5,-40(s0)
40001690:	00c78793          	addi	a5,a5,12
40001694:	0007a783          	lw	a5,0(a5)
40001698:	01300593          	li	a1,19
4000169c:	00078513          	mv	a0,a5
400016a0:	eb9ff0ef          	jal	ra,40001558 <aes_write>
	aes_write(key[2],AES_ADDR_KEY_BASE +2);
400016a4:	fd842783          	lw	a5,-40(s0)
400016a8:	00878793          	addi	a5,a5,8
400016ac:	0007a783          	lw	a5,0(a5)
400016b0:	01200593          	li	a1,18
400016b4:	00078513          	mv	a0,a5
400016b8:	ea1ff0ef          	jal	ra,40001558 <aes_write>
	aes_write(key[1],AES_ADDR_KEY_BASE +1);
400016bc:	fd842783          	lw	a5,-40(s0)
400016c0:	00478793          	addi	a5,a5,4
400016c4:	0007a783          	lw	a5,0(a5)
400016c8:	01100593          	li	a1,17
400016cc:	00078513          	mv	a0,a5
400016d0:	e89ff0ef          	jal	ra,40001558 <aes_write>
	aes_write(key[0],AES_ADDR_KEY_BASE);
400016d4:	fd842783          	lw	a5,-40(s0)
400016d8:	0007a783          	lw	a5,0(a5)
400016dc:	01000593          	li	a1,16
400016e0:	00078513          	mv	a0,a5
400016e4:	e75ff0ef          	jal	ra,40001558 <aes_write>

	aes_write(AES_CONFIG_128_KEY,AES_ADDR_CONFIG);
400016e8:	00a00593          	li	a1,10
400016ec:	00000513          	li	a0,0
400016f0:	e69ff0ef          	jal	ra,40001558 <aes_write>
	aes_write(AES_CTRL_INIT_KEY,AES_ADDR_CTRL);
400016f4:	00800593          	li	a1,8
400016f8:	00100513          	li	a0,1
400016fc:	e5dff0ef          	jal	ra,40001558 <aes_write>

    while(aes_read(AES_ADDR_STATUS) == 0);
40001700:	00000013          	nop
40001704:	00900513          	li	a0,9
40001708:	ec1ff0ef          	jal	ra,400015c8 <aes_read>
4000170c:	00050793          	mv	a5,a0
40001710:	fe078ae3          	beqz	a5,40001704 <aes_128_cipher+0xd0>

    aes_write(block[3],AES_ADDR_BLOCK_BASE + 3);
40001714:	fd442783          	lw	a5,-44(s0)
40001718:	00c78793          	addi	a5,a5,12
4000171c:	0007a783          	lw	a5,0(a5)
40001720:	02300593          	li	a1,35
40001724:	00078513          	mv	a0,a5
40001728:	e31ff0ef          	jal	ra,40001558 <aes_write>
    aes_write(block[2],AES_ADDR_BLOCK_BASE + 2);
4000172c:	fd442783          	lw	a5,-44(s0)
40001730:	00878793          	addi	a5,a5,8
40001734:	0007a783          	lw	a5,0(a5)
40001738:	02200593          	li	a1,34
4000173c:	00078513          	mv	a0,a5
40001740:	e19ff0ef          	jal	ra,40001558 <aes_write>
    aes_write(block[1],AES_ADDR_BLOCK_BASE + 1);
40001744:	fd442783          	lw	a5,-44(s0)
40001748:	00478793          	addi	a5,a5,4
4000174c:	0007a783          	lw	a5,0(a5)
40001750:	02100593          	li	a1,33
40001754:	00078513          	mv	a0,a5
40001758:	e01ff0ef          	jal	ra,40001558 <aes_write>
    aes_write(block[0],AES_ADDR_BLOCK_BASE + 0);
4000175c:	fd442783          	lw	a5,-44(s0)
40001760:	0007a783          	lw	a5,0(a5)
40001764:	02000593          	li	a1,32
40001768:	00078513          	mv	a0,a5
4000176c:	dedff0ef          	jal	ra,40001558 <aes_write>


    unsigned char AES_CONFIG = 0x00;
40001770:	fe0407a3          	sb	zero,-17(s0)
	if (operation == 0x01)
40001774:	fdf44703          	lbu	a4,-33(s0)
40001778:	00100793          	li	a5,1
4000177c:	00f71863          	bne	a4,a5,4000178c <aes_128_cipher+0x158>
		AES_CONFIG = AES_CONFIG_128_EN;
40001780:	00100793          	li	a5,1
40001784:	fef407a3          	sb	a5,-17(s0)
40001788:	0080006f          	j	40001790 <aes_128_cipher+0x15c>
	else
		AES_CONFIG = AES_CONFIG_128_DE;
4000178c:	fe0407a3          	sb	zero,-17(s0)

	aes_write(AES_CONFIG,AES_ADDR_CONFIG);
40001790:	fef44783          	lbu	a5,-17(s0)
40001794:	00a00593          	li	a1,10
40001798:	00078513          	mv	a0,a5
4000179c:	dbdff0ef          	jal	ra,40001558 <aes_write>
    aes_write(AES_CTRL_START, AES_ADDR_CTRL);
400017a0:	00800593          	li	a1,8
400017a4:	00200513          	li	a0,2
400017a8:	db1ff0ef          	jal	ra,40001558 <aes_write>

    while(aes_read(AES_ADDR_STATUS) == 0);
400017ac:	00000013          	nop
400017b0:	00900513          	li	a0,9
400017b4:	e15ff0ef          	jal	ra,400015c8 <aes_read>
400017b8:	00050793          	mv	a5,a0
400017bc:	fe078ae3          	beqz	a5,400017b0 <aes_128_cipher+0x17c>

    res[3] = aes_read(AES_ADDR_RESULT_BASE + 3);
400017c0:	fd042783          	lw	a5,-48(s0)
400017c4:	00c78493          	addi	s1,a5,12
400017c8:	03300513          	li	a0,51
400017cc:	dfdff0ef          	jal	ra,400015c8 <aes_read>
400017d0:	00050793          	mv	a5,a0
400017d4:	00f4a023          	sw	a5,0(s1)
    res[2] = aes_read(AES_ADDR_RESULT_BASE + 2);
400017d8:	fd042783          	lw	a5,-48(s0)
400017dc:	00878493          	addi	s1,a5,8
400017e0:	03200513          	li	a0,50
400017e4:	de5ff0ef          	jal	ra,400015c8 <aes_read>
400017e8:	00050793          	mv	a5,a0
400017ec:	00f4a023          	sw	a5,0(s1)
    res[1] = aes_read(AES_ADDR_RESULT_BASE + 1);
400017f0:	fd042783          	lw	a5,-48(s0)
400017f4:	00478493          	addi	s1,a5,4
400017f8:	03100513          	li	a0,49
400017fc:	dcdff0ef          	jal	ra,400015c8 <aes_read>
40001800:	00050793          	mv	a5,a0
40001804:	00f4a023          	sw	a5,0(s1)
    res[0] = aes_read(AES_ADDR_RESULT_BASE + 0);
40001808:	03000513          	li	a0,48
4000180c:	dbdff0ef          	jal	ra,400015c8 <aes_read>
40001810:	00050713          	mv	a4,a0
40001814:	fd042783          	lw	a5,-48(s0)
40001818:	00e7a023          	sw	a4,0(a5)

    //print result to terminal
	if(operation == 0x1)
4000181c:	fdf44703          	lbu	a4,-33(s0)
40001820:	00100793          	li	a5,1
40001824:	00f71a63          	bne	a4,a5,40001838 <aes_128_cipher+0x204>
		print("\r\t============================AES128 ENCRYPTTION==============================\r\n");
40001828:	400037b7          	lui	a5,0x40003
4000182c:	b6478513          	addi	a0,a5,-1180 # 40002b64 <vga_simRes_h160_v120+0x20>
40001830:	53c000ef          	jal	ra,40001d6c <print>
40001834:	0100006f          	j	40001844 <aes_128_cipher+0x210>
	else
		print("\r\t============================AES128 DECRYPTTION==============================\r\n");
40001838:	400037b7          	lui	a5,0x40003
4000183c:	bb878513          	addi	a0,a5,-1096 # 40002bb8 <vga_simRes_h160_v120+0x74>
40001840:	52c000ef          	jal	ra,40001d6c <print>
	print("\r\n");
40001844:	400037b7          	lui	a5,0x40003
40001848:	c0c78513          	addi	a0,a5,-1012 # 40002c0c <vga_simRes_h160_v120+0xc8>
4000184c:	520000ef          	jal	ra,40001d6c <print>
	print128bit("\r\tPLAIN_TEXT (128-bit) : ", block);
40001850:	fd442583          	lw	a1,-44(s0)
40001854:	400037b7          	lui	a5,0x40003
40001858:	c1078513          	addi	a0,a5,-1008 # 40002c10 <vga_simRes_h160_v120+0xcc>
4000185c:	7e8000ef          	jal	ra,40002044 <print128bit>
	print128bit("KEY (128-bit) : ", key);
40001860:	fd842583          	lw	a1,-40(s0)
40001864:	400037b7          	lui	a5,0x40003
40001868:	c2c78513          	addi	a0,a5,-980 # 40002c2c <vga_simRes_h160_v120+0xe8>
4000186c:	7d8000ef          	jal	ra,40002044 <print128bit>
	print128bit("RESULT (128-bit) : ", res);
40001870:	fd042583          	lw	a1,-48(s0)
40001874:	400037b7          	lui	a5,0x40003
40001878:	c4078513          	addi	a0,a5,-960 # 40002c40 <vga_simRes_h160_v120+0xfc>
4000187c:	7c8000ef          	jal	ra,40002044 <print128bit>
}
40001880:	00000013          	nop
40001884:	02c12083          	lw	ra,44(sp)
40001888:	02812403          	lw	s0,40(sp)
4000188c:	02412483          	lw	s1,36(sp)
40001890:	03010113          	addi	sp,sp,48
40001894:	00008067          	ret

40001898 <aes_256_cipher>:

void aes_256_cipher(unsigned char operation, uint32_t *key, uint32_t *block, uint32_t *res) {
40001898:	fd010113          	addi	sp,sp,-48
4000189c:	02112623          	sw	ra,44(sp)
400018a0:	02812423          	sw	s0,40(sp)
400018a4:	02912223          	sw	s1,36(sp)
400018a8:	03010413          	addi	s0,sp,48
400018ac:	00050793          	mv	a5,a0
400018b0:	fcb42c23          	sw	a1,-40(s0)
400018b4:	fcc42a23          	sw	a2,-44(s0)
400018b8:	fcd42823          	sw	a3,-48(s0)
400018bc:	fcf40fa3          	sb	a5,-33(s0)
	aes_write(key[7],AES_ADDR_KEY_BASE +7);
400018c0:	fd842783          	lw	a5,-40(s0)
400018c4:	01c78793          	addi	a5,a5,28
400018c8:	0007a783          	lw	a5,0(a5)
400018cc:	01700593          	li	a1,23
400018d0:	00078513          	mv	a0,a5
400018d4:	c85ff0ef          	jal	ra,40001558 <aes_write>
	aes_write(key[6],AES_ADDR_KEY_BASE +6);
400018d8:	fd842783          	lw	a5,-40(s0)
400018dc:	01878793          	addi	a5,a5,24
400018e0:	0007a783          	lw	a5,0(a5)
400018e4:	01600593          	li	a1,22
400018e8:	00078513          	mv	a0,a5
400018ec:	c6dff0ef          	jal	ra,40001558 <aes_write>
	aes_write(key[5],AES_ADDR_KEY_BASE +5);
400018f0:	fd842783          	lw	a5,-40(s0)
400018f4:	01478793          	addi	a5,a5,20
400018f8:	0007a783          	lw	a5,0(a5)
400018fc:	01500593          	li	a1,21
40001900:	00078513          	mv	a0,a5
40001904:	c55ff0ef          	jal	ra,40001558 <aes_write>
	aes_write(key[4],AES_ADDR_KEY_BASE +4);
40001908:	fd842783          	lw	a5,-40(s0)
4000190c:	01078793          	addi	a5,a5,16
40001910:	0007a783          	lw	a5,0(a5)
40001914:	01400593          	li	a1,20
40001918:	00078513          	mv	a0,a5
4000191c:	c3dff0ef          	jal	ra,40001558 <aes_write>
	aes_write(key[3],AES_ADDR_KEY_BASE +3);
40001920:	fd842783          	lw	a5,-40(s0)
40001924:	00c78793          	addi	a5,a5,12
40001928:	0007a783          	lw	a5,0(a5)
4000192c:	01300593          	li	a1,19
40001930:	00078513          	mv	a0,a5
40001934:	c25ff0ef          	jal	ra,40001558 <aes_write>
	aes_write(key[2],AES_ADDR_KEY_BASE +2);
40001938:	fd842783          	lw	a5,-40(s0)
4000193c:	00878793          	addi	a5,a5,8
40001940:	0007a783          	lw	a5,0(a5)
40001944:	01200593          	li	a1,18
40001948:	00078513          	mv	a0,a5
4000194c:	c0dff0ef          	jal	ra,40001558 <aes_write>
	aes_write(key[1],AES_ADDR_KEY_BASE +1);
40001950:	fd842783          	lw	a5,-40(s0)
40001954:	00478793          	addi	a5,a5,4
40001958:	0007a783          	lw	a5,0(a5)
4000195c:	01100593          	li	a1,17
40001960:	00078513          	mv	a0,a5
40001964:	bf5ff0ef          	jal	ra,40001558 <aes_write>
	aes_write(key[0],AES_ADDR_KEY_BASE);
40001968:	fd842783          	lw	a5,-40(s0)
4000196c:	0007a783          	lw	a5,0(a5)
40001970:	01000593          	li	a1,16
40001974:	00078513          	mv	a0,a5
40001978:	be1ff0ef          	jal	ra,40001558 <aes_write>

	aes_write(AES_CONFIG_256_KEY,AES_ADDR_CONFIG);
4000197c:	00a00593          	li	a1,10
40001980:	00200513          	li	a0,2
40001984:	bd5ff0ef          	jal	ra,40001558 <aes_write>
	aes_write(AES_CTRL_INIT_KEY,AES_ADDR_CTRL);
40001988:	00800593          	li	a1,8
4000198c:	00100513          	li	a0,1
40001990:	bc9ff0ef          	jal	ra,40001558 <aes_write>

    while(aes_read(AES_ADDR_STATUS) == 0);
40001994:	00000013          	nop
40001998:	00900513          	li	a0,9
4000199c:	c2dff0ef          	jal	ra,400015c8 <aes_read>
400019a0:	00050793          	mv	a5,a0
400019a4:	fe078ae3          	beqz	a5,40001998 <aes_256_cipher+0x100>

    aes_write(block[3],AES_ADDR_BLOCK_BASE + 3);
400019a8:	fd442783          	lw	a5,-44(s0)
400019ac:	00c78793          	addi	a5,a5,12
400019b0:	0007a783          	lw	a5,0(a5)
400019b4:	02300593          	li	a1,35
400019b8:	00078513          	mv	a0,a5
400019bc:	b9dff0ef          	jal	ra,40001558 <aes_write>
    aes_write(block[2],AES_ADDR_BLOCK_BASE + 2);
400019c0:	fd442783          	lw	a5,-44(s0)
400019c4:	00878793          	addi	a5,a5,8
400019c8:	0007a783          	lw	a5,0(a5)
400019cc:	02200593          	li	a1,34
400019d0:	00078513          	mv	a0,a5
400019d4:	b85ff0ef          	jal	ra,40001558 <aes_write>
    aes_write(block[1],AES_ADDR_BLOCK_BASE + 1);
400019d8:	fd442783          	lw	a5,-44(s0)
400019dc:	00478793          	addi	a5,a5,4
400019e0:	0007a783          	lw	a5,0(a5)
400019e4:	02100593          	li	a1,33
400019e8:	00078513          	mv	a0,a5
400019ec:	b6dff0ef          	jal	ra,40001558 <aes_write>
    aes_write(block[0],AES_ADDR_BLOCK_BASE + 0);
400019f0:	fd442783          	lw	a5,-44(s0)
400019f4:	0007a783          	lw	a5,0(a5)
400019f8:	02000593          	li	a1,32
400019fc:	00078513          	mv	a0,a5
40001a00:	b59ff0ef          	jal	ra,40001558 <aes_write>


    unsigned char AES_CONFIG = 0x00;
40001a04:	fe0407a3          	sb	zero,-17(s0)
	if (operation == 0x01)
40001a08:	fdf44703          	lbu	a4,-33(s0)
40001a0c:	00100793          	li	a5,1
40001a10:	00f71863          	bne	a4,a5,40001a20 <aes_256_cipher+0x188>
		AES_CONFIG = AES_CONFIG_256_EN;
40001a14:	00300793          	li	a5,3
40001a18:	fef407a3          	sb	a5,-17(s0)
40001a1c:	00c0006f          	j	40001a28 <aes_256_cipher+0x190>
	else
		AES_CONFIG = AES_CONFIG_256_DE;
40001a20:	00200793          	li	a5,2
40001a24:	fef407a3          	sb	a5,-17(s0)

	aes_write(AES_CONFIG, AES_ADDR_CONFIG);
40001a28:	fef44783          	lbu	a5,-17(s0)
40001a2c:	00a00593          	li	a1,10
40001a30:	00078513          	mv	a0,a5
40001a34:	b25ff0ef          	jal	ra,40001558 <aes_write>
    aes_write(AES_CTRL_START, AES_ADDR_CTRL);
40001a38:	00800593          	li	a1,8
40001a3c:	00200513          	li	a0,2
40001a40:	b19ff0ef          	jal	ra,40001558 <aes_write>

    while(aes_read(AES_ADDR_STATUS) == 0);
40001a44:	00000013          	nop
40001a48:	00900513          	li	a0,9
40001a4c:	b7dff0ef          	jal	ra,400015c8 <aes_read>
40001a50:	00050793          	mv	a5,a0
40001a54:	fe078ae3          	beqz	a5,40001a48 <aes_256_cipher+0x1b0>

    res[3] = aes_read(AES_ADDR_RESULT_BASE + 3);
40001a58:	fd042783          	lw	a5,-48(s0)
40001a5c:	00c78493          	addi	s1,a5,12
40001a60:	03300513          	li	a0,51
40001a64:	b65ff0ef          	jal	ra,400015c8 <aes_read>
40001a68:	00050793          	mv	a5,a0
40001a6c:	00f4a023          	sw	a5,0(s1)
    res[2] = aes_read(AES_ADDR_RESULT_BASE + 2);
40001a70:	fd042783          	lw	a5,-48(s0)
40001a74:	00878493          	addi	s1,a5,8
40001a78:	03200513          	li	a0,50
40001a7c:	b4dff0ef          	jal	ra,400015c8 <aes_read>
40001a80:	00050793          	mv	a5,a0
40001a84:	00f4a023          	sw	a5,0(s1)
    res[1] = aes_read(AES_ADDR_RESULT_BASE + 1);
40001a88:	fd042783          	lw	a5,-48(s0)
40001a8c:	00478493          	addi	s1,a5,4
40001a90:	03100513          	li	a0,49
40001a94:	b35ff0ef          	jal	ra,400015c8 <aes_read>
40001a98:	00050793          	mv	a5,a0
40001a9c:	00f4a023          	sw	a5,0(s1)
    res[0] = aes_read(AES_ADDR_RESULT_BASE + 0);
40001aa0:	03000513          	li	a0,48
40001aa4:	b25ff0ef          	jal	ra,400015c8 <aes_read>
40001aa8:	00050713          	mv	a4,a0
40001aac:	fd042783          	lw	a5,-48(s0)
40001ab0:	00e7a023          	sw	a4,0(a5)

    //print result to terminal
	if(operation == 0x1)
40001ab4:	fdf44703          	lbu	a4,-33(s0)
40001ab8:	00100793          	li	a5,1
40001abc:	00f71a63          	bne	a4,a5,40001ad0 <aes_256_cipher+0x238>
		print("\r\t======================================AES256 ENCRYPTTION========================================\r\n");
40001ac0:	400037b7          	lui	a5,0x40003
40001ac4:	c5478513          	addi	a0,a5,-940 # 40002c54 <vga_simRes_h160_v120+0x110>
40001ac8:	2a4000ef          	jal	ra,40001d6c <print>
40001acc:	0100006f          	j	40001adc <aes_256_cipher+0x244>
	else
		print("\r\t======================================AES256 DECRYPTTION========================================\r\n");
40001ad0:	400037b7          	lui	a5,0x40003
40001ad4:	cbc78513          	addi	a0,a5,-836 # 40002cbc <vga_simRes_h160_v120+0x178>
40001ad8:	294000ef          	jal	ra,40001d6c <print>
	print("\r\n");
40001adc:	400037b7          	lui	a5,0x40003
40001ae0:	c0c78513          	addi	a0,a5,-1012 # 40002c0c <vga_simRes_h160_v120+0xc8>
40001ae4:	288000ef          	jal	ra,40001d6c <print>
	print128bit("PLAIN_TEXT (128-bit) : ", block);
40001ae8:	fd442583          	lw	a1,-44(s0)
40001aec:	400037b7          	lui	a5,0x40003
40001af0:	d2478513          	addi	a0,a5,-732 # 40002d24 <vga_simRes_h160_v120+0x1e0>
40001af4:	550000ef          	jal	ra,40002044 <print128bit>
	print256bit("KEY (256-bit) : ", key);
40001af8:	fd842583          	lw	a1,-40(s0)
40001afc:	400037b7          	lui	a5,0x40003
40001b00:	d3c78513          	addi	a0,a5,-708 # 40002d3c <vga_simRes_h160_v120+0x1f8>
40001b04:	65c000ef          	jal	ra,40002160 <print256bit>
	print128bit("RESULT (128-bit) : ", res);
40001b08:	fd042583          	lw	a1,-48(s0)
40001b0c:	400037b7          	lui	a5,0x40003
40001b10:	c4078513          	addi	a0,a5,-960 # 40002c40 <vga_simRes_h160_v120+0xfc>
40001b14:	530000ef          	jal	ra,40002044 <print128bit>
	//print("\r\n================================================================================================\r\n");

}
40001b18:	00000013          	nop
40001b1c:	02c12083          	lw	ra,44(sp)
40001b20:	02812403          	lw	s0,40(sp)
40001b24:	02412483          	lw	s1,36(sp)
40001b28:	03010113          	addi	sp,sp,48
40001b2c:	00008067          	ret

40001b30 <timer_init>:
static void timer_init(Timer_Reg *reg){
40001b30:	fe010113          	addi	sp,sp,-32
40001b34:	00812e23          	sw	s0,28(sp)
40001b38:	02010413          	addi	s0,sp,32
40001b3c:	fea42623          	sw	a0,-20(s0)
	reg->CLEARS_TICKS  = 0;
40001b40:	fec42783          	lw	a5,-20(s0)
40001b44:	0007a023          	sw	zero,0(a5)
	reg->VALUE = 0;
40001b48:	fec42783          	lw	a5,-20(s0)
40001b4c:	0007a423          	sw	zero,8(a5)
}
40001b50:	00000013          	nop
40001b54:	01c12403          	lw	s0,28(sp)
40001b58:	02010113          	addi	sp,sp,32
40001b5c:	00008067          	ret

40001b60 <prescaler_init>:
static void prescaler_init(Prescaler_Reg* reg){
40001b60:	fe010113          	addi	sp,sp,-32
40001b64:	00812e23          	sw	s0,28(sp)
40001b68:	02010413          	addi	s0,sp,32
40001b6c:	fea42623          	sw	a0,-20(s0)
}
40001b70:	00000013          	nop
40001b74:	01c12403          	lw	s0,28(sp)
40001b78:	02010113          	addi	sp,sp,32
40001b7c:	00008067          	ret

40001b80 <interruptCtrl_init>:
static void interruptCtrl_init(InterruptCtrl_Reg* reg){
40001b80:	fe010113          	addi	sp,sp,-32
40001b84:	00812e23          	sw	s0,28(sp)
40001b88:	02010413          	addi	s0,sp,32
40001b8c:	fea42623          	sw	a0,-20(s0)
	reg->MASKS = 0;
40001b90:	fec42783          	lw	a5,-20(s0)
40001b94:	0007a223          	sw	zero,4(a5)
	reg->PENDINGS = 0xFFFFFFFF;
40001b98:	fec42783          	lw	a5,-20(s0)
40001b9c:	fff00713          	li	a4,-1
40001ba0:	00e7a023          	sw	a4,0(a5)
}
40001ba4:	00000013          	nop
40001ba8:	01c12403          	lw	s0,28(sp)
40001bac:	02010113          	addi	sp,sp,32
40001bb0:	00008067          	ret

40001bb4 <uart_writeAvailability>:
static uint32_t uart_writeAvailability(Uart_Reg *reg){
40001bb4:	fe010113          	addi	sp,sp,-32
40001bb8:	00812e23          	sw	s0,28(sp)
40001bbc:	02010413          	addi	s0,sp,32
40001bc0:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS >> 16) & 0xFF;
40001bc4:	fec42783          	lw	a5,-20(s0)
40001bc8:	0047a783          	lw	a5,4(a5)
40001bcc:	0107d793          	srli	a5,a5,0x10
40001bd0:	0ff7f793          	zext.b	a5,a5
}
40001bd4:	00078513          	mv	a0,a5
40001bd8:	01c12403          	lw	s0,28(sp)
40001bdc:	02010113          	addi	sp,sp,32
40001be0:	00008067          	ret

40001be4 <uart_readOccupancy>:
static uint32_t uart_readOccupancy(Uart_Reg *reg){
40001be4:	fe010113          	addi	sp,sp,-32
40001be8:	00812e23          	sw	s0,28(sp)
40001bec:	02010413          	addi	s0,sp,32
40001bf0:	fea42623          	sw	a0,-20(s0)
	return reg->STATUS >> 24;
40001bf4:	fec42783          	lw	a5,-20(s0)
40001bf8:	0047a783          	lw	a5,4(a5)
40001bfc:	0187d793          	srli	a5,a5,0x18
}
40001c00:	00078513          	mv	a0,a5
40001c04:	01c12403          	lw	s0,28(sp)
40001c08:	02010113          	addi	sp,sp,32
40001c0c:	00008067          	ret

40001c10 <uart_write>:
static void uart_write(Uart_Reg *reg, uint32_t data){
40001c10:	fe010113          	addi	sp,sp,-32
40001c14:	00112e23          	sw	ra,28(sp)
40001c18:	00812c23          	sw	s0,24(sp)
40001c1c:	02010413          	addi	s0,sp,32
40001c20:	fea42623          	sw	a0,-20(s0)
40001c24:	feb42423          	sw	a1,-24(s0)
	while(uart_writeAvailability(reg) == 0);
40001c28:	00000013          	nop
40001c2c:	fec42503          	lw	a0,-20(s0)
40001c30:	f85ff0ef          	jal	ra,40001bb4 <uart_writeAvailability>
40001c34:	00050793          	mv	a5,a0
40001c38:	fe078ae3          	beqz	a5,40001c2c <uart_write+0x1c>
	reg->DATA = data;
40001c3c:	fec42783          	lw	a5,-20(s0)
40001c40:	fe842703          	lw	a4,-24(s0)
40001c44:	00e7a023          	sw	a4,0(a5)
}
40001c48:	00000013          	nop
40001c4c:	01c12083          	lw	ra,28(sp)
40001c50:	01812403          	lw	s0,24(sp)
40001c54:	02010113          	addi	sp,sp,32
40001c58:	00008067          	ret

40001c5c <uart_applyConfig>:
static void uart_applyConfig(Uart_Reg *reg, Uart_Config *config){
40001c5c:	fe010113          	addi	sp,sp,-32
40001c60:	00812e23          	sw	s0,28(sp)
40001c64:	02010413          	addi	s0,sp,32
40001c68:	fea42623          	sw	a0,-20(s0)
40001c6c:	feb42423          	sw	a1,-24(s0)
	reg->CLOCK_DIVIDER = config->clockDivider;
40001c70:	fe842783          	lw	a5,-24(s0)
40001c74:	00c7a703          	lw	a4,12(a5)
40001c78:	fec42783          	lw	a5,-20(s0)
40001c7c:	00e7a423          	sw	a4,8(a5)
	reg->FRAME_CONFIG = ((config->dataLength-1) << 0) | (config->parity << 8) | (config->stop << 16);
40001c80:	fe842783          	lw	a5,-24(s0)
40001c84:	0007a783          	lw	a5,0(a5)
40001c88:	fff78713          	addi	a4,a5,-1
40001c8c:	fe842783          	lw	a5,-24(s0)
40001c90:	0047a783          	lw	a5,4(a5)
40001c94:	00879793          	slli	a5,a5,0x8
40001c98:	00f76733          	or	a4,a4,a5
40001c9c:	fe842783          	lw	a5,-24(s0)
40001ca0:	0087a783          	lw	a5,8(a5)
40001ca4:	01079793          	slli	a5,a5,0x10
40001ca8:	00f76733          	or	a4,a4,a5
40001cac:	fec42783          	lw	a5,-20(s0)
40001cb0:	00e7a623          	sw	a4,12(a5)
}
40001cb4:	00000013          	nop
40001cb8:	01c12403          	lw	s0,28(sp)
40001cbc:	02010113          	addi	sp,sp,32
40001cc0:	00008067          	ret

40001cc4 <vga_isBusy>:
static uint32_t vga_isBusy(Vga_Reg *reg){
40001cc4:	fe010113          	addi	sp,sp,-32
40001cc8:	00812e23          	sw	s0,28(sp)
40001ccc:	02010413          	addi	s0,sp,32
40001cd0:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS & 2) != 0;
40001cd4:	fec42783          	lw	a5,-20(s0)
40001cd8:	0007a783          	lw	a5,0(a5)
40001cdc:	0027f793          	andi	a5,a5,2
40001ce0:	00f037b3          	snez	a5,a5
40001ce4:	0ff7f793          	zext.b	a5,a5
}
40001ce8:	00078513          	mv	a0,a5
40001cec:	01c12403          	lw	s0,28(sp)
40001cf0:	02010113          	addi	sp,sp,32
40001cf4:	00008067          	ret

40001cf8 <vga_run>:
static void vga_run(Vga_Reg *reg){
40001cf8:	fe010113          	addi	sp,sp,-32
40001cfc:	00812e23          	sw	s0,28(sp)
40001d00:	02010413          	addi	s0,sp,32
40001d04:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 1;
40001d08:	fec42783          	lw	a5,-20(s0)
40001d0c:	00100713          	li	a4,1
40001d10:	00e7a023          	sw	a4,0(a5)
}
40001d14:	00000013          	nop
40001d18:	01c12403          	lw	s0,28(sp)
40001d1c:	02010113          	addi	sp,sp,32
40001d20:	00008067          	ret

40001d24 <vga_stop>:
static void vga_stop(Vga_Reg *reg){
40001d24:	fe010113          	addi	sp,sp,-32
40001d28:	00112e23          	sw	ra,28(sp)
40001d2c:	00812c23          	sw	s0,24(sp)
40001d30:	02010413          	addi	s0,sp,32
40001d34:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 0;
40001d38:	fec42783          	lw	a5,-20(s0)
40001d3c:	0007a023          	sw	zero,0(a5)
	while(vga_isBusy(reg));
40001d40:	00000013          	nop
40001d44:	fec42503          	lw	a0,-20(s0)
40001d48:	f7dff0ef          	jal	ra,40001cc4 <vga_isBusy>
40001d4c:	00050793          	mv	a5,a0
40001d50:	fe079ae3          	bnez	a5,40001d44 <vga_stop+0x20>
}
40001d54:	00000013          	nop
40001d58:	00000013          	nop
40001d5c:	01c12083          	lw	ra,28(sp)
40001d60:	01812403          	lw	s0,24(sp)
40001d64:	02010113          	addi	sp,sp,32
40001d68:	00008067          	ret

40001d6c <print>:
#include <briey.h>

void print(char *str){
40001d6c:	fe010113          	addi	sp,sp,-32
40001d70:	00112e23          	sw	ra,28(sp)
40001d74:	00812c23          	sw	s0,24(sp)
40001d78:	02010413          	addi	s0,sp,32
40001d7c:	fea42623          	sw	a0,-20(s0)
	while(*str){
40001d80:	0200006f          	j	40001da0 <print+0x34>
		uart_write(UART,*(str++));
40001d84:	fec42783          	lw	a5,-20(s0)
40001d88:	00178713          	addi	a4,a5,1
40001d8c:	fee42623          	sw	a4,-20(s0)
40001d90:	0007c783          	lbu	a5,0(a5)
40001d94:	00078593          	mv	a1,a5
40001d98:	f0010537          	lui	a0,0xf0010
40001d9c:	e75ff0ef          	jal	ra,40001c10 <uart_write>
	while(*str){
40001da0:	fec42783          	lw	a5,-20(s0)
40001da4:	0007c783          	lbu	a5,0(a5)
40001da8:	fc079ee3          	bnez	a5,40001d84 <print+0x18>
	}
}
40001dac:	00000013          	nop
40001db0:	00000013          	nop
40001db4:	01c12083          	lw	ra,28(sp)
40001db8:	01812403          	lw	s0,24(sp)
40001dbc:	02010113          	addi	sp,sp,32
40001dc0:	00008067          	ret

40001dc4 <print16bit>:

void print16bit(uint32_t n)
{
40001dc4:	fc010113          	addi	sp,sp,-64
40001dc8:	02112e23          	sw	ra,60(sp)
40001dcc:	02812c23          	sw	s0,56(sp)
40001dd0:	04010413          	addi	s0,sp,64
40001dd4:	fca42623          	sw	a0,-52(s0)

    int i = 0;
40001dd8:	fe042623          	sw	zero,-20(s0)
    char outbuf_inv[8]="";
40001ddc:	fc042e23          	sw	zero,-36(s0)
40001de0:	fe042023          	sw	zero,-32(s0)
    do{
    	outbuf_inv[i] = "0123456789abcdef"[n % 16];
40001de4:	fcc42783          	lw	a5,-52(s0)
40001de8:	00f7f793          	andi	a5,a5,15
40001dec:	40003737          	lui	a4,0x40003
40001df0:	db470713          	addi	a4,a4,-588 # 40002db4 <vga_simRes_h160_v120+0x24>
40001df4:	00f707b3          	add	a5,a4,a5
40001df8:	0007c703          	lbu	a4,0(a5)
40001dfc:	fec42783          	lw	a5,-20(s0)
40001e00:	ff040693          	addi	a3,s0,-16
40001e04:	00f687b3          	add	a5,a3,a5
40001e08:	fee78623          	sb	a4,-20(a5)
        i++;
40001e0c:	fec42783          	lw	a5,-20(s0)
40001e10:	00178793          	addi	a5,a5,1
40001e14:	fef42623          	sw	a5,-20(s0)
        n = n/16;
40001e18:	fcc42783          	lw	a5,-52(s0)
40001e1c:	0047d793          	srli	a5,a5,0x4
40001e20:	fcf42623          	sw	a5,-52(s0)
    }while( n > 0);
40001e24:	fcc42783          	lw	a5,-52(s0)
40001e28:	fa079ee3          	bnez	a5,40001de4 <print16bit+0x20>
    if(i<8) {
40001e2c:	fec42703          	lw	a4,-20(s0)
40001e30:	00700793          	li	a5,7
40001e34:	02e7ce63          	blt	a5,a4,40001e70 <print16bit+0xac>
    	for(int j=7;j>=i;j--){
40001e38:	00700793          	li	a5,7
40001e3c:	fef42423          	sw	a5,-24(s0)
40001e40:	0240006f          	j	40001e64 <print16bit+0xa0>
    		outbuf_inv[j]="0"[0];
40001e44:	03000713          	li	a4,48
40001e48:	fe842783          	lw	a5,-24(s0)
40001e4c:	ff040693          	addi	a3,s0,-16
40001e50:	00f687b3          	add	a5,a3,a5
40001e54:	fee78623          	sb	a4,-20(a5)
    	for(int j=7;j>=i;j--){
40001e58:	fe842783          	lw	a5,-24(s0)
40001e5c:	fff78793          	addi	a5,a5,-1
40001e60:	fef42423          	sw	a5,-24(s0)
40001e64:	fe842703          	lw	a4,-24(s0)
40001e68:	fec42783          	lw	a5,-20(s0)
40001e6c:	fcf75ce3          	bge	a4,a5,40001e44 <print16bit+0x80>
    	}
    }
    for(int j=3;j>=0;j--)
40001e70:	00300793          	li	a5,3
40001e74:	fef42223          	sw	a5,-28(s0)
40001e78:	02c0006f          	j	40001ea4 <print16bit+0xe0>
    {
    	uart_write(UART,outbuf_inv[j]);
40001e7c:	fe442783          	lw	a5,-28(s0)
40001e80:	ff040713          	addi	a4,s0,-16
40001e84:	00f707b3          	add	a5,a4,a5
40001e88:	fec7c783          	lbu	a5,-20(a5)
40001e8c:	00078593          	mv	a1,a5
40001e90:	f0010537          	lui	a0,0xf0010
40001e94:	d7dff0ef          	jal	ra,40001c10 <uart_write>
    for(int j=3;j>=0;j--)
40001e98:	fe442783          	lw	a5,-28(s0)
40001e9c:	fff78793          	addi	a5,a5,-1
40001ea0:	fef42223          	sw	a5,-28(s0)
40001ea4:	fe442783          	lw	a5,-28(s0)
40001ea8:	fc07dae3          	bgez	a5,40001e7c <print16bit+0xb8>
    }
    print(" ");
40001eac:	400037b7          	lui	a5,0x40003
40001eb0:	db078513          	addi	a0,a5,-592 # 40002db0 <vga_simRes_h160_v120+0x20>
40001eb4:	eb9ff0ef          	jal	ra,40001d6c <print>
}
40001eb8:	00000013          	nop
40001ebc:	03c12083          	lw	ra,60(sp)
40001ec0:	03812403          	lw	s0,56(sp)
40001ec4:	04010113          	addi	sp,sp,64
40001ec8:	00008067          	ret

40001ecc <print32bit>:
void print32bit(uint32_t n)
{
40001ecc:	fc010113          	addi	sp,sp,-64
40001ed0:	02112e23          	sw	ra,60(sp)
40001ed4:	02812c23          	sw	s0,56(sp)
40001ed8:	04010413          	addi	s0,sp,64
40001edc:	fca42623          	sw	a0,-52(s0)

    int i = 0;
40001ee0:	fe042623          	sw	zero,-20(s0)
    char outbuf_inv[8]="";
40001ee4:	fc042e23          	sw	zero,-36(s0)
40001ee8:	fe042023          	sw	zero,-32(s0)
    do{
    	outbuf_inv[i] = "0123456789abcdef"[n % 16];
40001eec:	fcc42783          	lw	a5,-52(s0)
40001ef0:	00f7f793          	andi	a5,a5,15
40001ef4:	40003737          	lui	a4,0x40003
40001ef8:	db470713          	addi	a4,a4,-588 # 40002db4 <vga_simRes_h160_v120+0x24>
40001efc:	00f707b3          	add	a5,a4,a5
40001f00:	0007c703          	lbu	a4,0(a5)
40001f04:	fec42783          	lw	a5,-20(s0)
40001f08:	ff040693          	addi	a3,s0,-16
40001f0c:	00f687b3          	add	a5,a3,a5
40001f10:	fee78623          	sb	a4,-20(a5)
        i++;
40001f14:	fec42783          	lw	a5,-20(s0)
40001f18:	00178793          	addi	a5,a5,1
40001f1c:	fef42623          	sw	a5,-20(s0)
        n = n/16;
40001f20:	fcc42783          	lw	a5,-52(s0)
40001f24:	0047d793          	srli	a5,a5,0x4
40001f28:	fcf42623          	sw	a5,-52(s0)
    }while( n > 0);
40001f2c:	fcc42783          	lw	a5,-52(s0)
40001f30:	fa079ee3          	bnez	a5,40001eec <print32bit+0x20>
    if(i<8) {
40001f34:	fec42703          	lw	a4,-20(s0)
40001f38:	00700793          	li	a5,7
40001f3c:	02e7ce63          	blt	a5,a4,40001f78 <print32bit+0xac>
    	for(int j=7;j>=i;j--){
40001f40:	00700793          	li	a5,7
40001f44:	fef42423          	sw	a5,-24(s0)
40001f48:	0240006f          	j	40001f6c <print32bit+0xa0>
    		outbuf_inv[j]="0"[0];
40001f4c:	03000713          	li	a4,48
40001f50:	fe842783          	lw	a5,-24(s0)
40001f54:	ff040693          	addi	a3,s0,-16
40001f58:	00f687b3          	add	a5,a3,a5
40001f5c:	fee78623          	sb	a4,-20(a5)
    	for(int j=7;j>=i;j--){
40001f60:	fe842783          	lw	a5,-24(s0)
40001f64:	fff78793          	addi	a5,a5,-1
40001f68:	fef42423          	sw	a5,-24(s0)
40001f6c:	fe842703          	lw	a4,-24(s0)
40001f70:	fec42783          	lw	a5,-20(s0)
40001f74:	fcf75ce3          	bge	a4,a5,40001f4c <print32bit+0x80>
    	}
    }
    for(int j=7;j>=0;j--)
40001f78:	00700793          	li	a5,7
40001f7c:	fef42223          	sw	a5,-28(s0)
40001f80:	02c0006f          	j	40001fac <print32bit+0xe0>
    {
    	uart_write(UART,outbuf_inv[j]);
40001f84:	fe442783          	lw	a5,-28(s0)
40001f88:	ff040713          	addi	a4,s0,-16
40001f8c:	00f707b3          	add	a5,a4,a5
40001f90:	fec7c783          	lbu	a5,-20(a5)
40001f94:	00078593          	mv	a1,a5
40001f98:	f0010537          	lui	a0,0xf0010
40001f9c:	c75ff0ef          	jal	ra,40001c10 <uart_write>
    for(int j=7;j>=0;j--)
40001fa0:	fe442783          	lw	a5,-28(s0)
40001fa4:	fff78793          	addi	a5,a5,-1
40001fa8:	fef42223          	sw	a5,-28(s0)
40001fac:	fe442783          	lw	a5,-28(s0)
40001fb0:	fc07dae3          	bgez	a5,40001f84 <print32bit+0xb8>
    }
    print(" ");
40001fb4:	400037b7          	lui	a5,0x40003
40001fb8:	db078513          	addi	a0,a5,-592 # 40002db0 <vga_simRes_h160_v120+0x20>
40001fbc:	db1ff0ef          	jal	ra,40001d6c <print>
}
40001fc0:	00000013          	nop
40001fc4:	03c12083          	lw	ra,60(sp)
40001fc8:	03812403          	lw	s0,56(sp)
40001fcc:	04010113          	addi	sp,sp,64
40001fd0:	00008067          	ret

40001fd4 <print64bit>:

void print64bit(char *message,uint32_t *num)
{
40001fd4:	fe010113          	addi	sp,sp,-32
40001fd8:	00112e23          	sw	ra,28(sp)
40001fdc:	00812c23          	sw	s0,24(sp)
40001fe0:	02010413          	addi	s0,sp,32
40001fe4:	fea42623          	sw	a0,-20(s0)
40001fe8:	feb42423          	sw	a1,-24(s0)
	print("\r\t");
40001fec:	400037b7          	lui	a5,0x40003
40001ff0:	dc878513          	addi	a0,a5,-568 # 40002dc8 <vga_simRes_h160_v120+0x38>
40001ff4:	d79ff0ef          	jal	ra,40001d6c <print>
	print(message);
40001ff8:	fec42503          	lw	a0,-20(s0)
40001ffc:	d71ff0ef          	jal	ra,40001d6c <print>
	print32bit(num[1]);
40002000:	fe842783          	lw	a5,-24(s0)
40002004:	00478793          	addi	a5,a5,4
40002008:	0007a783          	lw	a5,0(a5)
4000200c:	00078513          	mv	a0,a5
40002010:	ebdff0ef          	jal	ra,40001ecc <print32bit>
	print32bit(num[0]);
40002014:	fe842783          	lw	a5,-24(s0)
40002018:	0007a783          	lw	a5,0(a5)
4000201c:	00078513          	mv	a0,a5
40002020:	eadff0ef          	jal	ra,40001ecc <print32bit>
	print("\r\n");
40002024:	400037b7          	lui	a5,0x40003
40002028:	dcc78513          	addi	a0,a5,-564 # 40002dcc <vga_simRes_h160_v120+0x3c>
4000202c:	d41ff0ef          	jal	ra,40001d6c <print>
}
40002030:	00000013          	nop
40002034:	01c12083          	lw	ra,28(sp)
40002038:	01812403          	lw	s0,24(sp)
4000203c:	02010113          	addi	sp,sp,32
40002040:	00008067          	ret

40002044 <print128bit>:
void print128bit(char *message, uint32_t *num)
{
40002044:	fe010113          	addi	sp,sp,-32
40002048:	00112e23          	sw	ra,28(sp)
4000204c:	00812c23          	sw	s0,24(sp)
40002050:	02010413          	addi	s0,sp,32
40002054:	fea42623          	sw	a0,-20(s0)
40002058:	feb42423          	sw	a1,-24(s0)
	print("\r\t");
4000205c:	400037b7          	lui	a5,0x40003
40002060:	dc878513          	addi	a0,a5,-568 # 40002dc8 <vga_simRes_h160_v120+0x38>
40002064:	d09ff0ef          	jal	ra,40001d6c <print>
	print(message);
40002068:	fec42503          	lw	a0,-20(s0)
4000206c:	d01ff0ef          	jal	ra,40001d6c <print>
	print32bit(num[3]);
40002070:	fe842783          	lw	a5,-24(s0)
40002074:	00c78793          	addi	a5,a5,12
40002078:	0007a783          	lw	a5,0(a5)
4000207c:	00078513          	mv	a0,a5
40002080:	e4dff0ef          	jal	ra,40001ecc <print32bit>
	print32bit(num[2]);
40002084:	fe842783          	lw	a5,-24(s0)
40002088:	00878793          	addi	a5,a5,8
4000208c:	0007a783          	lw	a5,0(a5)
40002090:	00078513          	mv	a0,a5
40002094:	e39ff0ef          	jal	ra,40001ecc <print32bit>
	print32bit(num[1]);
40002098:	fe842783          	lw	a5,-24(s0)
4000209c:	00478793          	addi	a5,a5,4
400020a0:	0007a783          	lw	a5,0(a5)
400020a4:	00078513          	mv	a0,a5
400020a8:	e25ff0ef          	jal	ra,40001ecc <print32bit>
	print32bit(num[0]);
400020ac:	fe842783          	lw	a5,-24(s0)
400020b0:	0007a783          	lw	a5,0(a5)
400020b4:	00078513          	mv	a0,a5
400020b8:	e15ff0ef          	jal	ra,40001ecc <print32bit>
	print("\r\n");
400020bc:	400037b7          	lui	a5,0x40003
400020c0:	dcc78513          	addi	a0,a5,-564 # 40002dcc <vga_simRes_h160_v120+0x3c>
400020c4:	ca9ff0ef          	jal	ra,40001d6c <print>
}
400020c8:	00000013          	nop
400020cc:	01c12083          	lw	ra,28(sp)
400020d0:	01812403          	lw	s0,24(sp)
400020d4:	02010113          	addi	sp,sp,32
400020d8:	00008067          	ret

400020dc <print80bit>:
void print80bit(char *message,uint32_t *num)
{
400020dc:	fe010113          	addi	sp,sp,-32
400020e0:	00112e23          	sw	ra,28(sp)
400020e4:	00812c23          	sw	s0,24(sp)
400020e8:	02010413          	addi	s0,sp,32
400020ec:	fea42623          	sw	a0,-20(s0)
400020f0:	feb42423          	sw	a1,-24(s0)
	print("\r\t");
400020f4:	400037b7          	lui	a5,0x40003
400020f8:	dc878513          	addi	a0,a5,-568 # 40002dc8 <vga_simRes_h160_v120+0x38>
400020fc:	c71ff0ef          	jal	ra,40001d6c <print>
	print(message);
40002100:	fec42503          	lw	a0,-20(s0)
40002104:	c69ff0ef          	jal	ra,40001d6c <print>
	print32bit(num[2]);
40002108:	fe842783          	lw	a5,-24(s0)
4000210c:	00878793          	addi	a5,a5,8
40002110:	0007a783          	lw	a5,0(a5)
40002114:	00078513          	mv	a0,a5
40002118:	db5ff0ef          	jal	ra,40001ecc <print32bit>
	print32bit(num[1]);
4000211c:	fe842783          	lw	a5,-24(s0)
40002120:	00478793          	addi	a5,a5,4
40002124:	0007a783          	lw	a5,0(a5)
40002128:	00078513          	mv	a0,a5
4000212c:	da1ff0ef          	jal	ra,40001ecc <print32bit>
	print16bit(num[0]);
40002130:	fe842783          	lw	a5,-24(s0)
40002134:	0007a783          	lw	a5,0(a5)
40002138:	00078513          	mv	a0,a5
4000213c:	c89ff0ef          	jal	ra,40001dc4 <print16bit>
	print("\r\n");
40002140:	400037b7          	lui	a5,0x40003
40002144:	dcc78513          	addi	a0,a5,-564 # 40002dcc <vga_simRes_h160_v120+0x3c>
40002148:	c25ff0ef          	jal	ra,40001d6c <print>
}
4000214c:	00000013          	nop
40002150:	01c12083          	lw	ra,28(sp)
40002154:	01812403          	lw	s0,24(sp)
40002158:	02010113          	addi	sp,sp,32
4000215c:	00008067          	ret

40002160 <print256bit>:
void print256bit(char *message, uint32_t *num)
{
40002160:	fe010113          	addi	sp,sp,-32
40002164:	00112e23          	sw	ra,28(sp)
40002168:	00812c23          	sw	s0,24(sp)
4000216c:	02010413          	addi	s0,sp,32
40002170:	fea42623          	sw	a0,-20(s0)
40002174:	feb42423          	sw	a1,-24(s0)
	print("\r\t");
40002178:	400037b7          	lui	a5,0x40003
4000217c:	dc878513          	addi	a0,a5,-568 # 40002dc8 <vga_simRes_h160_v120+0x38>
40002180:	bedff0ef          	jal	ra,40001d6c <print>
	print(message);
40002184:	fec42503          	lw	a0,-20(s0)
40002188:	be5ff0ef          	jal	ra,40001d6c <print>
	print32bit(num[7]);
4000218c:	fe842783          	lw	a5,-24(s0)
40002190:	01c78793          	addi	a5,a5,28
40002194:	0007a783          	lw	a5,0(a5)
40002198:	00078513          	mv	a0,a5
4000219c:	d31ff0ef          	jal	ra,40001ecc <print32bit>
	print32bit(num[6]);
400021a0:	fe842783          	lw	a5,-24(s0)
400021a4:	01878793          	addi	a5,a5,24
400021a8:	0007a783          	lw	a5,0(a5)
400021ac:	00078513          	mv	a0,a5
400021b0:	d1dff0ef          	jal	ra,40001ecc <print32bit>
	print32bit(num[5]);
400021b4:	fe842783          	lw	a5,-24(s0)
400021b8:	01478793          	addi	a5,a5,20
400021bc:	0007a783          	lw	a5,0(a5)
400021c0:	00078513          	mv	a0,a5
400021c4:	d09ff0ef          	jal	ra,40001ecc <print32bit>
	print32bit(num[4]);
400021c8:	fe842783          	lw	a5,-24(s0)
400021cc:	01078793          	addi	a5,a5,16
400021d0:	0007a783          	lw	a5,0(a5)
400021d4:	00078513          	mv	a0,a5
400021d8:	cf5ff0ef          	jal	ra,40001ecc <print32bit>
	print32bit(num[3]);
400021dc:	fe842783          	lw	a5,-24(s0)
400021e0:	00c78793          	addi	a5,a5,12
400021e4:	0007a783          	lw	a5,0(a5)
400021e8:	00078513          	mv	a0,a5
400021ec:	ce1ff0ef          	jal	ra,40001ecc <print32bit>
	print32bit(num[2]);
400021f0:	fe842783          	lw	a5,-24(s0)
400021f4:	00878793          	addi	a5,a5,8
400021f8:	0007a783          	lw	a5,0(a5)
400021fc:	00078513          	mv	a0,a5
40002200:	ccdff0ef          	jal	ra,40001ecc <print32bit>
	print32bit(num[1]);
40002204:	fe842783          	lw	a5,-24(s0)
40002208:	00478793          	addi	a5,a5,4
4000220c:	0007a783          	lw	a5,0(a5)
40002210:	00078513          	mv	a0,a5
40002214:	cb9ff0ef          	jal	ra,40001ecc <print32bit>
	print32bit(num[0]);
40002218:	fe842783          	lw	a5,-24(s0)
4000221c:	0007a783          	lw	a5,0(a5)
40002220:	00078513          	mv	a0,a5
40002224:	ca9ff0ef          	jal	ra,40001ecc <print32bit>
	print("\r\n");
40002228:	400037b7          	lui	a5,0x40003
4000222c:	dcc78513          	addi	a0,a5,-564 # 40002dcc <vga_simRes_h160_v120+0x3c>
40002230:	b3dff0ef          	jal	ra,40001d6c <print>
}
40002234:	00000013          	nop
40002238:	01c12083          	lw	ra,28(sp)
4000223c:	01812403          	lw	s0,24(sp)
40002240:	02010113          	addi	sp,sp,32
40002244:	00008067          	ret
