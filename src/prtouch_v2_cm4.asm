
prtouch_v2_cm4.o:	file format elf32-littlearm

Disassembly of section .text.sys_time_event:

00000000 <sys_time_event>:
       0: 70 b5        	push	{r4, r5, r6, lr}
       2: 0d 4c        	ldr	r4, [pc, #52]           @ 0x38 <$d>
       4: ff f7 fe ff  	bl	0x4 <sys_time_event+0x4> @ imm = #-4
       8: a6 69        	ldr	r6, [r4, #24]
       a: 0c 49        	ldr	r1, [pc, #48]           @ 0x3c <$d+0x4>
       c: 05 46        	mov	r5, r0
       e: 30 46        	mov	r0, r6
      10: ff f7 fe ff  	bl	0x10 <sys_time_event+0x10> @ imm = #-4
      14: ff f7 fe ff  	bl	0x14 <sys_time_event+0x14> @ imm = #-4
      18: 05 44        	add	r5, r0
      1a: e5 60        	str	r5, [r4, #12]
      1c: 30 46        	mov	r0, r6
      1e: ff f7 fe ff  	bl	0x1e <sys_time_event+0x1e> @ imm = #-4
      22: 02 46        	mov	r2, r0
      24: 0b 46        	mov	r3, r1
      26: d4 e9 04 01  	ldrd	r0, r1, [r4, #16]
      2a: ff f7 fe ff  	bl	0x2a <sys_time_event+0x2a> @ imm = #-4
      2e: c4 e9 04 01  	strd	r0, r1, [r4, #16]
      32: 01 20        	movs	r0, #1
      34: 70 bd        	pop	{r4, r5, r6, pc}
      36: 00 bf        	nop

00000038 <$d>:
      38:	00 00 00 00	.word	0x00000000
      3c:	c0 e1 e4 4c	.word	0x4ce4e1c0

Disassembly of section .text.start_sys_time.part.0:

00000000 <start_sys_time.part.0>:
       0: 38 b5        	push	{r3, r4, r5, lr}
       2: 0a 4c        	ldr	r4, [pc, #40]           @ 0x2c <$d>
       4: 0a 4b        	ldr	r3, [pc, #40]           @ 0x30 <$d+0x4>
       6: a3 60        	str	r3, [r4, #8]
       8: 01 23        	movs	r3, #1
       a: 23 60        	str	r3, [r4]
       c: ff f7 fe ff  	bl	0xc <start_sys_time.part.0+0xc> @ imm = #-4
      10: 08 49        	ldr	r1, [pc, #32]           @ 0x34 <$d+0x8>
      12: 05 46        	mov	r5, r0
      14: a0 69        	ldr	r0, [r4, #24]
      16: ff f7 fe ff  	bl	0x16 <start_sys_time.part.0+0x16> @ imm = #-4
      1a: ff f7 fe ff  	bl	0x1a <start_sys_time.part.0+0x1a> @ imm = #-4
      1e: 05 44        	add	r5, r0
      20: e5 60        	str	r5, [r4, #12]
      22: 20 1d        	adds	r0, r4, #4
      24: bd e8 38 40  	pop.w	{r3, r4, r5, lr}
      28: ff f7 fe bf  	b.w	0x28 <start_sys_time.part.0+0x28> @ imm = #-4

0000002c <$d>:
      2c:	00 00 00 00	.word	0x00000000
      30:	00 00 00 00	.word	0x00000000
      34:	c0 e1 e4 4c	.word	0x4ce4e1c0

Disassembly of section .text.stop_sys_time.part.0:

00000000 <stop_sys_time.part.0>:
       0: 10 b5        	push	{r4, lr}
       2: 03 4c        	ldr	r4, [pc, #12]           @ 0x10 <$d>
       4: 20 1d        	adds	r0, r4, #4
       6: ff f7 fe ff  	bl	0x6 <stop_sys_time.part.0+0x6> @ imm = #-4
       a: 00 23        	movs	r3, #0
       c: 23 60        	str	r3, [r4]
       e: 10 bd        	pop	{r4, pc}

00000010 <$d>:
      10:	00 00 00 00	.word	0x00000000

Disassembly of section .text.pr_fifo_write:

00000000 <pr_fifo_write>:
       0: 03 68        	ldr	r3, [r0]
       2: 10 b4        	push	{r4}
       4: 5c 42        	rsbs	r4, r3, #0
       6: 04 f0 1f 04  	and	r4, r4, #31
       a: 03 f0 1f 02  	and	r2, r3, #31
       e: 58 bf        	it	pl
      10: 62 42        	rsbpl	r2, r4, #0
      12: 00 eb 82 02  	add.w	r2, r0, r2, lsl #2
      16: 01 33        	adds	r3, #1
      18: 51 60        	str	r1, [r2, #4]
      1a: 10 bc        	pop	{r4}
      1c: 03 60        	str	r3, [r0]
      1e: 70 47        	bx	lr

Disassembly of section .text.pr_fifo_read:

00000000 <pr_fifo_read>:
       0: 10 b4        	push	{r4}
       2: 04 39        	subs	r1, #4
       4: 00 22        	movs	r2, #0
       6: 03 68        	ldr	r3, [r0]
       8: 13 44        	add	r3, r2
       a: 5c 42        	rsbs	r4, r3, #0
       c: 04 f0 1f 04  	and	r4, r4, #31
      10: 03 f0 1f 03  	and	r3, r3, #31
      14: 58 bf        	it	pl
      16: 63 42        	rsbpl	r3, r4, #0
      18: 00 eb 83 03  	add.w	r3, r0, r3, lsl #2
      1c: 01 32        	adds	r2, #1
      1e: 5b 68        	ldr	r3, [r3, #4]
      20: 41 f8 04 3f  	str	r3, [r1, #4]!
      24: 20 2a        	cmp	r2, #32
      26: ee d1        	bne	0x6 <pr_fifo_read+0x6>  @ imm = #-36
      28: 10 bc        	pop	{r4}
      2a: 70 47        	bx	lr

Disassembly of section .text.start_sys_time:

00000000 <start_sys_time>:
       0: 02 4b        	ldr	r3, [pc, #8]            @ 0xc <$d>
       2: 1b 68        	ldr	r3, [r3]
       4: 03 b1        	cbz	r3, 0x8 <start_sys_time+0x8> @ imm = #0
       6: 70 47        	bx	lr
       8: ff f7 fe bf  	b.w	0x8 <start_sys_time+0x8> @ imm = #-4

0000000c <$d>:
       c:	00 00 00 00	.word	0x00000000

Disassembly of section .text.stop_sys_time:

00000000 <stop_sys_time>:
       0: 03 4b        	ldr	r3, [pc, #12]           @ 0x10 <$d>
       2: 1b 68        	ldr	r3, [r3]
       4: 01 2b        	cmp	r3, #1
       6: 00 d0        	beq	0xa <stop_sys_time+0xa> @ imm = #0
       8: 70 47        	bx	lr
       a: ff f7 fe bf  	b.w	0xa <stop_sys_time+0xa> @ imm = #-4
       e: 00 bf        	nop

00000010 <$d>:
      10:	00 00 00 00	.word	0x00000000

Disassembly of section .text.get_sys_tick_s:

00000000 <get_sys_tick_s>:
       0: 01 4b        	ldr	r3, [pc, #4]            @ 0x8 <$d>
       2: d3 e9 04 01  	ldrd	r0, r1, [r3, #16]
       6: 70 47        	bx	lr

00000008 <$d>:
       8:	00 00 00 00	.word	0x00000000

Disassembly of section .text.write_swap_sta:

00000000 <write_swap_sta>:
       0: 02 4b        	ldr	r3, [pc, #8]            @ 0xc <$d>
       2: c1 b2        	uxtb	r1, r0
       4: 18 68        	ldr	r0, [r3]
       6: ff f7 fe bf  	b.w	0x6 <write_swap_sta+0x6> @ imm = #-4
       a: 00 bf        	nop

0000000c <$d>:
       c:	00 00 00 00	.word	0x00000000

Disassembly of section .text.read_swap_sta:

00000000 <read_swap_sta>:
       0: 08 b5        	push	{r3, lr}
       2: 02 4b        	ldr	r3, [pc, #8]            @ 0xc <$d>
       4: 18 79        	ldrb	r0, [r3, #4]
       6: ff f7 fe ff  	bl	0x6 <read_swap_sta+0x6> @ imm = #-4
       a: 08 bd        	pop	{r3, pc}

0000000c <$d>:
       c:	00 00 00 00	.word	0x00000000

Disassembly of section .text.send_debug_args:

00000000 <send_debug_args>:
       0: 30 b5        	push	{r4, r5, lr}
       2: 04 46        	mov	r4, r0
       4: 87 b0        	sub	sp, #28
       6: 0a 48        	ldr	r0, [pc, #40]           @ 0x30 <$d>
       8: ff f7 fe ff  	bl	0x8 <send_debug_args+0x8> @ imm = #-4
       c: d4 e9 04 21  	ldrd	r2, r1, [r4, #16]
      10: 23 68        	ldr	r3, [r4]
      12: 04 91        	str	r1, [sp, #16]
      14: e1 68        	ldr	r1, [r4, #12]
      16: 03 92        	str	r2, [sp, #12]
      18: d4 e9 01 25  	ldrd	r2, r5, [r4, #4]
      1c: 02 91        	str	r1, [sp, #8]
      1e: cd e9 00 25  	strd	r2, r5, [sp]
      22: d9 b2        	uxtb	r1, r3
      24: 40 f2 33 12  	movw	r2, #307
      28: ff f7 fe ff  	bl	0x28 <send_debug_args+0x28> @ imm = #-4
      2c: 07 b0        	add	sp, #28
      2e: 30 bd        	pop	{r4, r5, pc}

00000030 <$d>:
      30:	00 00 00 00	.word	0x00000000

Disassembly of section .text.check_delay:

00000000 <check_delay>:
       0: 2d e9 f8 43  	push.w	{r3, r4, r5, r6, r7, r8, r9, lr}
       4: 10 4b        	ldr	r3, [pc, #64]           @ 0x48 <$d>
       6: d3 e9 04 89  	ldrd	r8, r9, [r3, #16]
       a: 0d 46        	mov	r5, r1
       c: d0 e9 00 23  	ldrd	r2, r3, [r0]
      10: c0 e9 02 89  	strd	r8, r9, [r0, #8]
      14: 04 46        	mov	r4, r0
      16: 49 46        	mov	r1, r9
      18: 40 46        	mov	r0, r8
      1a: ff f7 fe ff  	bl	0x1a <check_delay+0x1a> @ imm = #-4
      1e: 06 46        	mov	r6, r0
      20: 28 46        	mov	r0, r5
      22: 0f 46        	mov	r7, r1
      24: ff f7 fe ff  	bl	0x24 <check_delay+0x24> @ imm = #-4
      28: 02 46        	mov	r2, r0
      2a: 0b 46        	mov	r3, r1
      2c: 30 46        	mov	r0, r6
      2e: 39 46        	mov	r1, r7
      30: ff f7 fe ff  	bl	0x30 <check_delay+0x30> @ imm = #-4
      34: 20 b9        	cbnz	r0, 0x40 <check_delay+0x40> @ imm = #8
      36: c4 e9 00 89  	strd	r8, r9, [r4]
      3a: 01 20        	movs	r0, #1
      3c: bd e8 f8 83  	pop.w	{r3, r4, r5, r6, r7, r8, r9, pc}
      40: 00 20        	movs	r0, #0
      42: bd e8 f8 83  	pop.w	{r3, r4, r5, r6, r7, r8, r9, pc}
      46: 00 bf        	nop

00000048 <$d>:
      48:	00 00 00 00	.word	0x00000000

Disassembly of section .text.deal_dirs_prtouch:

00000000 <deal_dirs_prtouch>:
       0: 2d e9 f0 41  	push.w	{r4, r5, r6, r7, r8, lr}
       4: 12 4e        	ldr	r6, [pc, #72]           @ 0x50 <$d>
       6: 33 8c        	ldrh	r3, [r6, #32]
       8: a3 b1        	cbz	r3, 0x34 <deal_dirs_prtouch+0x34> @ imm = #40
       a: 80 46        	mov	r8, r0
       c: 0f 46        	mov	r7, r1
       e: 06 f1 22 05  	add.w	r5, r6, #34
      12: 00 24        	movs	r4, #0
      14: 00 2f        	cmp	r7, #0
      16: 06 eb 04 03  	add.w	r3, r6, r4
      1a: 0d dc        	bgt	0x38 <deal_dirs_prtouch+0x38> @ imm = #26
      1c: 29 78        	ldrb	r1, [r5]
      1e: 06 eb 84 03  	add.w	r3, r6, r4, lsl #2
      22: 01 34        	adds	r4, #1
      24: d8 6b        	ldr	r0, [r3, #60]
      26: ff f7 fe ff  	bl	0x26 <deal_dirs_prtouch+0x26> @ imm = #-4
      2a: 33 8c        	ldrh	r3, [r6, #32]
      2c: a3 42        	cmp	r3, r4
      2e: 05 f1 02 05  	add.w	r5, r5, #2
      32: ef dc        	bgt	0x14 <deal_dirs_prtouch+0x14> @ imm = #-34
      34: bd e8 f0 81  	pop.w	{r4, r5, r6, r7, r8, pc}
      38: 93 f8 5c 00  	ldrb.w	r0, [r3, #92]
      3c: ff f7 fe ff  	bl	0x3c <deal_dirs_prtouch+0x3c> @ imm = #-4
      40: 29 89        	ldrh	r1, [r5, #8]
      42: 28 80        	strh	r0, [r5]
      44: b1 eb 08 01  	subs.w	r1, r1, r8
      48: 18 bf        	it	ne
      4a: 01 21        	movne	r1, #1
      4c: e7 e7        	b	0x1e <deal_dirs_prtouch+0x1e> @ imm = #-50
      4e: 00 bf        	nop

00000050 <$d>:
      50:	00 00 00 00	.word	0x00000000

Disassembly of section .text.prtouch_event:

00000000 <prtouch_event>:
       0: 70 b5        	push	{r4, r5, r6, lr}
       2: 89 4c        	ldr	r4, [pc, #548]          @ 0x228 <$d+0x8>
       4: 23 8c        	ldrh	r3, [r4, #32]
       6: 4b b1        	cbz	r3, 0x1c <prtouch_event+0x1c> @ imm = #18
       8: 00 25        	movs	r5, #0
       a: 04 eb 85 03  	add.w	r3, r4, r5, lsl #2
       e: 01 35        	adds	r5, #1
      10: d8 6c        	ldr	r0, [r3, #76]
      12: ff f7 fe ff  	bl	0x12 <prtouch_event+0x12> @ imm = #-4
      16: 23 8c        	ldrh	r3, [r4, #32]
      18: 9d 42        	cmp	r5, r3
      1a: f6 db        	blt	0xa <prtouch_event+0xa> @ imm = #-20
      1c: d4 f8 78 31  	ldr.w	r3, [r4, #376]
      20: 22 6e        	ldr	r2, [r4, #96]
      22: 01 3b        	subs	r3, #1
      24: c4 f8 78 31  	str.w	r3, [r4, #376]
      28: 00 2a        	cmp	r2, #0
      2a: 00 f0 8f 80  	beq.w	0x14c <prtouch_event+0x14c> @ imm = #286
      2e: 3b b1        	cbz	r3, 0x40 <prtouch_event+0x40> @ imm = #14
      30: da 07        	lsls	r2, r3, #31
      32: 00 f1 9d 80  	bmi.w	0x170 <prtouch_event+0x170> @ imm = #314
      36: b4 f8 72 31  	ldrh.w	r3, [r4, #370]
      3a: 01 2b        	cmp	r3, #1
      3c: 40 f0 8f 80  	bne.w	0x15e <prtouch_event+0x15e> @ imm = #286
      40: d4 f8 ec 50  	ldr.w	r5, [r4, #236]
      44: 79 4a        	ldr	r2, [pc, #484]          @ 0x22c <$d+0xc>
      46: 6b 42        	rsbs	r3, r5, #0
      48: 03 f0 1f 03  	and	r3, r3, #31
      4c: 05 f0 1f 06  	and	r6, r5, #31
      50: d2 e9 04 01  	ldrd	r0, r1, [r2, #16]
      54: 58 bf        	it	pl
      56: 5e 42        	rsbpl	r6, r3, #0
      58: 71 a3        	adr	r3, #452 <prtouch_event+0xcd>
      5a: d3 e9 00 23  	ldrd	r2, r3, [r3]
      5e: ff f7 fe ff  	bl	0x5e <prtouch_event+0x5e> @ imm = #-4
      62: ff f7 fe ff  	bl	0x62 <prtouch_event+0x62> @ imm = #-4
      66: 04 eb 86 06  	add.w	r6, r4, r6, lsl #2
      6a: 01 35        	adds	r5, #1
      6c: c6 f8 f0 00  	str.w	r0, [r6, #240]
      70: a3 6e        	ldr	r3, [r4, #104]
      72: d4 f8 78 21  	ldr.w	r2, [r4, #376]
      76: b4 f8 88 61  	ldrh.w	r6, [r4, #392]
      7a: c4 f8 ec 50  	str.w	r5, [r4, #236]
      7e: 58 42        	rsbs	r0, r3, #0
      80: 00 f0 1f 00  	and	r0, r0, #31
      84: 03 f0 1f 01  	and	r1, r3, #31
      88: 58 bf        	it	pl
      8a: 41 42        	rsbpl	r1, r0, #0
      8c: 04 eb 81 01  	add.w	r1, r4, r1, lsl #2
      90: 02 eb d2 72  	add.w	r2, r2, r2, lsr #31
      94: 01 33        	adds	r3, #1
      96: 52 10        	asrs	r2, r2, #1
      98: 01 2e        	cmp	r6, #1
      9a: ca 66        	str	r2, [r1, #108]
      9c: a3 66        	str	r3, [r4, #104]
      9e: 44 d1        	bne	0x12a <prtouch_event+0x12a> @ imm = #136
      a0: 00 21        	movs	r1, #0
      a2: d4 f8 74 31  	ldr.w	r3, [r4, #372]
      a6: c4 f8 78 31  	str.w	r3, [r4, #376]
      aa: 08 46        	mov	r0, r1
      ac: a4 f8 88 11  	strh.w	r1, [r4, #392]
      b0: ff f7 fe ff  	bl	0xb0 <prtouch_event+0xb0> @ imm = #-4
      b4: b4 f8 70 01  	ldrh.w	r0, [r4, #368]
      b8: b0 fa 80 f0  	clz	r0, r0
      bc: 31 46        	mov	r1, r6
      be: 40 09        	lsrs	r0, r0, #5
      c0: ff f7 fe ff  	bl	0xc0 <prtouch_event+0xc0> @ imm = #-4
      c4: ff f7 fe ff  	bl	0xc4 <prtouch_event+0xc4> @ imm = #-4
      c8: d4 e9 5e 32  	ldrd	r3, r2, [r4, #376]
      cc: 02 44        	add	r2, r0
      ce: e2 60        	str	r2, [r4, #12]
      d0: d4 f8 74 21  	ldr.w	r2, [r4, #372]
      d4: d4 f8 80 11  	ldr.w	r1, [r4, #384]
      d8: d2 1a        	subs	r2, r2, r3
      da: 8a 42        	cmp	r2, r1
      dc: c0 f2 87 80  	blt.w	0x1ee <prtouch_event+0x1ee> @ imm = #270
      e0: 99 42        	cmp	r1, r3
      e2: 40 f3 86 80  	ble.w	0x1f2 <prtouch_event+0x1f2> @ imm = #268
      e6: 1d 02        	lsls	r5, r3, #8
      e8: 95 fb f1 f5  	sdiv	r5, r5, r1
      ec: c5 f5 80 75  	rsb.w	r5, r5, #256
      f0: ff 2d        	cmp	r5, #255
      f2: a8 bf        	it	ge
      f4: ff 25        	movge	r5, #255
      f6: 25 ea e5 75  	bic.w	r5, r5, r5, asr #31
      fa: ff f7 fe ff  	bl	0xfa <prtouch_event+0xfa> @ imm = #-4
      fe: 4c 4b        	ldr	r3, [pc, #304]          @ 0x230 <$d+0x10>
     100: d4 f8 7c 61  	ldr.w	r6, [r4, #380]
     104: b4 f8 84 11  	ldrh.w	r1, [r4, #388]
     108: 33 f8 15 30  	ldrh.w	r3, [r3, r5, lsl #1]
     10c: 49 4a        	ldr	r2, [pc, #292]          @ 0x234 <$d+0x14>
     10e: 06 fb 01 f1  	mul	r1, r6, r1
     112: 03 fb 01 f3  	mul	r3, r3, r1
     116: 82 fb 03 12  	smull	r1, r2, r2, r3
     11a: db 17        	asrs	r3, r3, #31
     11c: c3 eb a2 13  	rsb	r3, r3, r2, asr #6
     120: 33 44        	add	r3, r6
     122: 03 44        	add	r3, r0
     124: e3 60        	str	r3, [r4, #12]
     126: 01 20        	movs	r0, #1
     128: 70 bd        	pop	{r4, r5, r6, pc}
     12a: 43 48        	ldr	r0, [pc, #268]          @ 0x238 <$d+0x18>
     12c: ff f7 fe ff  	bl	0x12c <prtouch_event+0x12c> @ imm = #-4
     130: 00 21        	movs	r1, #0
     132: 08 46        	mov	r0, r1
     134: ff f7 fe ff  	bl	0x134 <prtouch_event+0x134> @ imm = #-4
     138: 00 23        	movs	r3, #0
     13a: 08 22        	movs	r2, #8
     13c: a4 f8 64 20  	strh.w	r2, [r4, #100]
     140: a4 f8 72 31  	strh.w	r3, [r4, #370]
     144: c4 f8 78 31  	str.w	r3, [r4, #376]
     148: 01 20        	movs	r0, #1
     14a: 70 bd        	pop	{r4, r5, r6, pc}
     14c: 3b 4b        	ldr	r3, [pc, #236]          @ 0x23c <$d+0x1c>
     14e: 18 79        	ldrb	r0, [r3, #4]
     150: ff f7 fe ff  	bl	0x150 <prtouch_event+0x150> @ imm = #-4
     154: 01 28        	cmp	r0, #1
     156: 54 d0        	beq	0x202 <prtouch_event+0x202> @ imm = #168
     158: d4 f8 78 31  	ldr.w	r3, [r4, #376]
     15c: 67 e7        	b	0x2e <prtouch_event+0x2e> @ imm = #-306
     15e: 37 4b        	ldr	r3, [pc, #220]          @ 0x23c <$d+0x1c>
     160: 18 79        	ldrb	r0, [r3, #4]
     162: ff f7 fe ff  	bl	0x162 <prtouch_event+0x162> @ imm = #-4
     166: 01 28        	cmp	r0, #1
     168: 3f f4 6a af  	beq.w	0x40 <prtouch_event+0x40> @ imm = #-300
     16c: d4 f8 78 31  	ldr.w	r3, [r4, #376]
     170: b4 f8 86 21  	ldrh.w	r2, [r4, #390]
     174: 52 00        	lsls	r2, r2, #1
     176: 93 fb f2 f1  	sdiv	r1, r3, r2
     17a: 02 fb 11 32  	mls	r2, r2, r1, r3
     17e: 00 2a        	cmp	r2, #0
     180: a6 d1        	bne	0xd0 <prtouch_event+0xd0> @ imm = #-180
     182: d4 f8 ec 50  	ldr.w	r5, [r4, #236]
     186: 29 4a        	ldr	r2, [pc, #164]          @ 0x22c <$d+0xc>
     188: 6b 42        	rsbs	r3, r5, #0
     18a: 03 f0 1f 03  	and	r3, r3, #31
     18e: 05 f0 1f 06  	and	r6, r5, #31
     192: d2 e9 04 01  	ldrd	r0, r1, [r2, #16]
     196: 58 bf        	it	pl
     198: 5e 42        	rsbpl	r6, r3, #0
     19a: 21 a3        	adr	r3, #132 <prtouch_event+0x1bf>
     19c: d3 e9 00 23  	ldrd	r2, r3, [r3]
     1a0: ff f7 fe ff  	bl	0x1a0 <prtouch_event+0x1a0> @ imm = #-4
     1a4: ff f7 fe ff  	bl	0x1a4 <prtouch_event+0x1a4> @ imm = #-4
     1a8: 04 eb 86 06  	add.w	r6, r4, r6, lsl #2
     1ac: 01 35        	adds	r5, #1
     1ae: c6 f8 f0 00  	str.w	r0, [r6, #240]
     1b2: a3 6e        	ldr	r3, [r4, #104]
     1b4: d4 f8 78 21  	ldr.w	r2, [r4, #376]
     1b8: c4 f8 ec 50  	str.w	r5, [r4, #236]
     1bc: 58 42        	rsbs	r0, r3, #0
     1be: 00 f0 1f 00  	and	r0, r0, #31
     1c2: 03 f0 1f 01  	and	r1, r3, #31
     1c6: 58 bf        	it	pl
     1c8: 41 42        	rsbpl	r1, r0, #0
     1ca: 04 eb 81 01  	add.w	r1, r4, r1, lsl #2
     1ce: 02 eb d2 72  	add.w	r2, r2, r2, lsr #31
     1d2: 52 10        	asrs	r2, r2, #1
     1d4: ca 66        	str	r2, [r1, #108]
     1d6: 5a 1c        	adds	r2, r3, #1
     1d8: a2 66        	str	r2, [r4, #104]
     1da: d4 f8 78 31  	ldr.w	r3, [r4, #376]
     1de: d4 f8 74 21  	ldr.w	r2, [r4, #372]
     1e2: d4 f8 80 11  	ldr.w	r1, [r4, #384]
     1e6: d2 1a        	subs	r2, r2, r3
     1e8: 8a 42        	cmp	r2, r1
     1ea: bf f6 79 af  	bge.w	0xe0 <prtouch_event+0xe0> @ imm = #-270
     1ee: 15 02        	lsls	r5, r2, #8
     1f0: 7a e7        	b	0xe8 <prtouch_event+0xe8> @ imm = #-268
     1f2: ff f7 fe ff  	bl	0x1f2 <prtouch_event+0x1f2> @ imm = #-4
     1f6: d4 f8 7c 31  	ldr.w	r3, [r4, #380]
     1fa: 03 44        	add	r3, r0
     1fc: e3 60        	str	r3, [r4, #12]
     1fe: 01 20        	movs	r0, #1
     200: 70 bd        	pop	{r4, r5, r6, pc}
     202: 0a 49        	ldr	r1, [pc, #40]           @ 0x22c <$d+0xc>
     204: 06 a3        	adr	r3, #24 <prtouch_event+0x20e>
     206: d3 e9 00 23  	ldrd	r2, r3, [r3]
     20a: d1 e9 04 01  	ldrd	r0, r1, [r1, #16]
     20e: ff f7 fe ff  	bl	0x20e <prtouch_event+0x20e> @ imm = #-4
     212: ff f7 fe ff  	bl	0x212 <prtouch_event+0x212> @ imm = #-4
     216: d4 f8 78 31  	ldr.w	r3, [r4, #376]
     21a: 20 66        	str	r0, [r4, #96]
     21c: 07 e7        	b	0x2e <prtouch_event+0x2e> @ imm = #-498
     21e: 00 bf        	nop

00000220 <$d>:
     220:	00 00 00 00	.word	0x00000000
     224:	00 88 c3 40	.word	0x40c38800
     228:	00 00 00 00	.word	0x00000000
     22c:	00 00 00 00	.word	0x00000000
     230:	00 00 00 00	.word	0x00000000
     234:	d3 4d 62 10	.word	0x10624dd3
     238:	04 00 00 00	.word	0x00000004
     23c:	00 00 00 00	.word	0x00000000

Disassembly of section .text.deal_steps_prtouch:

00000000 <deal_steps_prtouch>:
       0: 38 b5        	push	{r3, r4, r5, lr}
       2: 07 4d        	ldr	r5, [pc, #28]           @ 0x20 <$d>
       4: 2b 8c        	ldrh	r3, [r5, #32]
       6: 4b b1        	cbz	r3, 0x1c <deal_steps_prtouch+0x1c> @ imm = #18
       8: 00 24        	movs	r4, #0
       a: 05 eb 84 03  	add.w	r3, r5, r4, lsl #2
       e: 01 34        	adds	r4, #1
      10: d8 6c        	ldr	r0, [r3, #76]
      12: ff f7 fe ff  	bl	0x12 <deal_steps_prtouch+0x12> @ imm = #-4
      16: 2b 8c        	ldrh	r3, [r5, #32]
      18: a3 42        	cmp	r3, r4
      1a: f6 dc        	bgt	0xa <deal_steps_prtouch+0xa> @ imm = #-20
      1c: 38 bd        	pop	{r3, r4, r5, pc}
      1e: 00 bf        	nop

00000020 <$d>:
      20:	00 00 00 00	.word	0x00000000

Disassembly of section .text.command_config_step_prtouch:

00000000 <command_config_step_prtouch>:
       0: 0d 4b        	ldr	r3, [pc, #52]           @ 0x38 <$d>
       2: 02 68        	ldr	r2, [r0]
       4: 70 b5        	push	{r4, r5, r6, lr}
       6: 1a 80        	strh	r2, [r3]
       8: 42 68        	ldr	r2, [r0, #4]
       a: 0c 4e        	ldr	r6, [pc, #48]           @ 0x3c <$d+0x4>
       c: 0c 4d        	ldr	r5, [pc, #48]           @ 0x40 <$d+0x8>
       e: 04 46        	mov	r4, r0
      10: c0 68        	ldr	r0, [r0, #12]
      12: 1a 84        	strh	r2, [r3, #32]
      14: ff f7 fe ff  	bl	0x14 <command_config_step_prtouch+0x14> @ imm = #-4
      18: 0a 49        	ldr	r1, [pc, #40]           @ 0x44 <$d+0xc>
      1a: ff f7 fe ff  	bl	0x1a <command_config_step_prtouch+0x1a> @ imm = #-4
      1e: 01 21        	movs	r1, #1
      20: 03 46        	mov	r3, r0
      22: 20 7a        	ldrb	r0, [r4, #8]
      24: b3 61        	str	r3, [r6, #24]
      26: ff f7 fe ff  	bl	0x26 <command_config_step_prtouch+0x26> @ imm = #-4
      2a: 28 71        	strb	r0, [r5, #4]
      2c: 20 46        	mov	r0, r4
      2e: bd e8 70 40  	pop.w	{r4, r5, r6, lr}
      32: ff f7 fe bf  	b.w	0x32 <command_config_step_prtouch+0x32> @ imm = #-4
      36: 00 bf        	nop

00000038 <$d>:
      38:	00 00 00 00	.word	0x00000000
      3c:	00 00 00 00	.word	0x00000000
      40:	00 00 00 00	.word	0x00000000
      44:	00 50 c3 47	.word	0x47c35000

Disassembly of section .text.command_add_step_prtouch:

00000000 <command_add_step_prtouch>:
       0: f8 b5        	push	{r3, r4, r5, r6, r7, lr}
       2: 14 4d        	ldr	r5, [pc, #80]           @ 0x54 <$d>
       4: 43 68        	ldr	r3, [r0, #4]
       6: 04 46        	mov	r4, r0
       8: 00 21        	movs	r1, #0
       a: 00 7a        	ldrb	r0, [r0, #8]
       c: ef 18        	adds	r7, r5, r3
       e: ff f7 fe ff  	bl	0xe <command_add_step_prtouch+0xe> @ imm = #-4
      12: 66 68        	ldr	r6, [r4, #4]
      14: 87 f8 5c 00  	strb.w	r0, [r7, #92]
      18: 00 21        	movs	r1, #0
      1a: 20 7a        	ldrb	r0, [r4, #8]
      1c: ff f7 fe ff  	bl	0x1c <command_add_step_prtouch+0x1c> @ imm = #-4
      20: 0e 36        	adds	r6, #14
      22: 05 eb 86 06  	add.w	r6, r5, r6, lsl #2
      26: 70 60        	str	r0, [r6, #4]
      28: 63 68        	ldr	r3, [r4, #4]
      2a: 21 7d        	ldrb	r1, [r4, #20]
      2c: 20 7b        	ldrb	r0, [r4, #12]
      2e: 12 33        	adds	r3, #18
      30: 05 eb 83 06  	add.w	r6, r5, r3, lsl #2
      34: ff f7 fe ff  	bl	0x34 <command_add_step_prtouch+0x34> @ imm = #-4
      38: 70 60        	str	r0, [r6, #4]
      3a: 63 68        	ldr	r3, [r4, #4]
      3c: d4 e9 04 62  	ldrd	r6, r2, [r4, #16]
      40: 05 eb 43 01  	add.w	r1, r5, r3, lsl #1
      44: 20 46        	mov	r0, r4
      46: 4e 85        	strh	r6, [r1, #42]
      48: bd e8 f8 40  	pop.w	{r3, r4, r5, r6, r7, lr}
      4c: 4a 86        	strh	r2, [r1, #50]
      4e: ff f7 fe bf  	b.w	0x4e <command_add_step_prtouch+0x4e> @ imm = #-4
      52: 00 bf        	nop

00000054 <$d>:
      54:	00 00 00 00	.word	0x00000000

Disassembly of section .text.command_read_swap_prtouch:

00000000 <command_read_swap_prtouch>:
       0: 70 b5        	push	{r4, r5, r6, lr}
       2: 04 46        	mov	r4, r0
       4: 09 48        	ldr	r0, [pc, #36]           @ 0x2c <$d>
       6: ff f7 fe ff  	bl	0x6 <command_read_swap_prtouch+0x6> @ imm = #-4
       a: 09 4b        	ldr	r3, [pc, #36]           @ 0x30 <$d+0x4>
       c: 09 4a        	ldr	r2, [pc, #36]           @ 0x34 <$d+0x8>
       e: 05 46        	mov	r5, r0
      10: 18 79        	ldrb	r0, [r3, #4]
      12: 16 88        	ldrh	r6, [r2]
      14: ff f7 fe ff  	bl	0x14 <command_read_swap_prtouch+0x14> @ imm = #-4
      18: 31 46        	mov	r1, r6
      1a: 02 46        	mov	r2, r0
      1c: 28 46        	mov	r0, r5
      1e: ff f7 fe ff  	bl	0x1e <command_read_swap_prtouch+0x1e> @ imm = #-4
      22: 20 46        	mov	r0, r4
      24: bd e8 70 40  	pop.w	{r4, r5, r6, lr}
      28: ff f7 fe bf  	b.w	0x28 <command_read_swap_prtouch+0x28> @ imm = #-4

0000002c <$d>:
      2c:	00 00 00 00	.word	0x00000000
      30:	00 00 00 00	.word	0x00000000
      34:	00 00 00 00	.word	0x00000000

Disassembly of section .text.command_start_step_prtouch:

00000000 <command_start_step_prtouch>:
       0: f8 b5        	push	{r3, r4, r5, r6, r7, lr}
       2: 83 68        	ldr	r3, [r0, #8]
       4: 00 2b        	cmp	r3, #0
       6: 6f d0        	beq	0xe8 <command_start_step_prtouch+0xe8> @ imm = #222
       8: 45 4f        	ldr	r7, [pc, #276]          @ 0x120 <$d+0x18>
       a: 3b 68        	ldr	r3, [r7]
       c: 05 46        	mov	r5, r0
       e: 00 2b        	cmp	r3, #0
      10: 67 d0        	beq	0xe2 <command_start_step_prtouch+0xe2> @ imm = #206
      12: 44 4c        	ldr	r4, [pc, #272]          @ 0x124 <$d+0x1c>
      14: 00 26        	movs	r6, #0
      16: 31 46        	mov	r1, r6
      18: 80 22        	movs	r2, #128
      1a: 04 f1 f0 00  	add.w	r0, r4, #240
      1e: c4 f8 ec 60  	str.w	r6, [r4, #236]
      22: a6 66        	str	r6, [r4, #104]
      24: ff f7 fe ff  	bl	0x24 <command_start_step_prtouch+0x24> @ imm = #-4
      28: 31 46        	mov	r1, r6
      2a: 80 22        	movs	r2, #128
      2c: 04 f1 6c 00  	add.w	r0, r4, #108
      30: ff f7 fe ff  	bl	0x30 <command_start_step_prtouch+0x30> @ imm = #-4
      34: 34 a3        	adr	r3, #208 <command_start_step_prtouch+0x6c>
      36: d3 e9 00 23  	ldrd	r2, r3, [r3]
      3a: d7 e9 04 01  	ldrd	r0, r1, [r7, #16]
      3e: ff f7 fe ff  	bl	0x3e <command_start_step_prtouch+0x3e> @ imm = #-4
      42: ff f7 fe ff  	bl	0x42 <command_start_step_prtouch+0x42> @ imm = #-4
      46: 04 f1 ec 03  	add.w	r3, r4, #236
      4a: 04 f5 b6 72  	add.w	r2, r4, #364
      4e: 43 f8 04 0f  	str	r0, [r3, #4]!
      52: 93 42        	cmp	r3, r2
      54: fb d1        	bne	0x4e <command_start_step_prtouch+0x4e> @ imm = #-10
      56: 68 68        	ldr	r0, [r5, #4]
      58: 01 21        	movs	r1, #1
      5a: ff f7 fe ff  	bl	0x5a <command_start_step_prtouch+0x5a> @ imm = #-4
      5e: 29 1d        	adds	r1, r5, #4
      60: 0e c9        	ldm	r1, {r1, r2, r3}
      62: 5b 00        	lsls	r3, r3, #1
      64: c4 e9 5d 33  	strd	r3, r3, [r4, #372]
      68: a4 f8 70 11  	strh.w	r1, [r4, #368]
      6c: 28 69        	ldr	r0, [r5, #16]
      6e: a4 f8 66 20  	strh.w	r2, [r4, #102]
      72: ff f7 fe ff  	bl	0x72 <command_start_step_prtouch+0x72> @ imm = #-4
      76: 26 a3        	adr	r3, #152 <command_start_step_prtouch+0xa0>
      78: d3 e9 00 23  	ldrd	r2, r3, [r3]
      7c: ff f7 fe ff  	bl	0x7c <command_start_step_prtouch+0x7c> @ imm = #-4
      80: 25 a3        	adr	r3, #148 <command_start_step_prtouch+0xa9>
      82: d3 e9 00 23  	ldrd	r2, r3, [r3]
      86: ff f7 fe ff  	bl	0x86 <command_start_step_prtouch+0x86> @ imm = #-4
      8a: ff f7 fe ff  	bl	0x8a <command_start_step_prtouch+0x8a> @ imm = #-4
      8e: 40 08        	lsrs	r0, r0, #1
      90: c4 f8 7c 01  	str.w	r0, [r4, #380]
      94: 6b 69        	ldr	r3, [r5, #20]
      96: 24 4a        	ldr	r2, [pc, #144]          @ 0x128 <$d+0x20>
      98: a2 60        	str	r2, [r4, #8]
      9a: 00 26        	movs	r6, #0
      9c: 5b 00        	lsls	r3, r3, #1
      9e: c4 f8 80 31  	str.w	r3, [r4, #384]
      a2: 26 66        	str	r6, [r4, #96]
      a4: d5 e9 06 12  	ldrd	r1, r2, [r5, #24]
      a8: 2b 6a        	ldr	r3, [r5, #32]
      aa: a4 f8 88 31  	strh.w	r3, [r4, #392]
      ae: a4 f8 84 11  	strh.w	r1, [r4, #388]
      b2: a4 f8 86 21  	strh.w	r2, [r4, #390]
      b6: a4 f8 64 60  	strh.w	r6, [r4, #100]
      ba: ff f7 fe ff  	bl	0xba <command_start_step_prtouch+0xba> @ imm = #-4
      be: b4 f8 84 21  	ldrh.w	r2, [r4, #388]
      c2: d4 f8 7c 31  	ldr.w	r3, [r4, #380]
      c6: a4 f8 72 61  	strh.w	r6, [r4, #370]
      ca: 02 fb 03 33  	mla	r3, r2, r3, r3
      ce: 03 44        	add	r3, r0
      d0: 16 48        	ldr	r0, [pc, #88]           @ 0x12c <$d+0x24>
      d2: e3 60        	str	r3, [r4, #12]
      d4: ff f7 fe ff  	bl	0xd4 <command_start_step_prtouch+0xd4> @ imm = #-4
      d8: 28 46        	mov	r0, r5
      da: bd e8 f8 40  	pop.w	{r3, r4, r5, r6, r7, lr}
      de: ff f7 fe bf  	b.w	0xde <command_start_step_prtouch+0xde> @ imm = #-4
      e2: ff f7 fe ff  	bl	0xe2 <command_start_step_prtouch+0xe2> @ imm = #-4
      e6: 94 e7        	b	0x12 <command_start_step_prtouch+0x12> @ imm = #-216
      e8: 0e 4b        	ldr	r3, [pc, #56]           @ 0x124 <$d+0x1c>
      ea: 01 22        	movs	r2, #1
      ec: a3 f8 72 21  	strh.w	r2, [r3, #370]
      f0: ff f7 fe ff  	bl	0xf0 <command_start_step_prtouch+0xf0> @ imm = #-4
      f4: 0a 4b        	ldr	r3, [pc, #40]           @ 0x120 <$d+0x18>
      f6: 1b 68        	ldr	r3, [r3]
      f8: 01 2b        	cmp	r3, #1
      fa: 00 d0        	beq	0xfe <command_start_step_prtouch+0xfe> @ imm = #0
      fc: f8 bd        	pop	{r3, r4, r5, r6, r7, pc}
      fe: bd e8 f8 40  	pop.w	{r3, r4, r5, r6, r7, lr}
     102: ff f7 fe bf  	b.w	0x102 <command_start_step_prtouch+0x102> @ imm = #-4
     106: 00 bf        	nop

00000108 <$d>:
     108:	00 00 00 00	.word	0x00000000
     10c:	00 88 c3 40	.word	0x40c38800
     110:	00 00 00 00	.word	0x00000000
     114:	80 84 2e 41	.word	0x412e8480
     118:	00 00 00 00	.word	0x00000000
     11c:	38 9c 9c 41	.word	0x419c9c38
     120:	00 00 00 00	.word	0x00000000
     124:	00 00 00 00	.word	0x00000000
     128:	00 00 00 00	.word	0x00000000
     12c:	04 00 00 00	.word	0x00000004

Disassembly of section .text.command_manual_get_steps:

00000000 <command_manual_get_steps>:
       0: 70 b5        	push	{r4, r5, r6, lr}
       2: 03 46        	mov	r3, r0
       4: 88 b0        	sub	sp, #32
       6: 15 48        	ldr	r0, [pc, #84]           @ 0x5c <$d>
       8: 5c 68        	ldr	r4, [r3, #4]
       a: ff f7 fe ff  	bl	0xa <command_manual_get_steps+0xa> @ imm = #-4
       e: 14 49        	ldr	r1, [pc, #80]           @ 0x60 <$d+0x4>
      10: 01 eb 84 06  	add.w	r6, r1, r4, lsl #2
      14: 35 46        	mov	r5, r6
      16: 32 46        	mov	r2, r6
      18: 33 46        	mov	r3, r6
      1a: b6 6f        	ldr	r6, [r6, #120]
      1c: 6d 6f        	ldr	r5, [r5, #116]
      1e: 12 6f        	ldr	r2, [r2, #112]
      20: db 6e        	ldr	r3, [r3, #108]
      22: 07 96        	str	r6, [sp, #28]
      24: 01 eb 84 06  	add.w	r6, r1, r4, lsl #2
      28: 06 95        	str	r5, [sp, #24]
      2a: 35 46        	mov	r5, r6
      2c: d6 f8 fc 60  	ldr.w	r6, [r6, #252]
      30: d5 f8 f8 50  	ldr.w	r5, [r5, #248]
      34: 05 92        	str	r2, [sp, #20]
      36: 01 eb 84 02  	add.w	r2, r1, r4, lsl #2
      3a: 04 93        	str	r3, [sp, #16]
      3c: 13 46        	mov	r3, r2
      3e: d2 f8 f4 20  	ldr.w	r2, [r2, #244]
      42: d3 f8 f0 30  	ldr.w	r3, [r3, #240]
      46: cd e9 02 56  	strd	r5, r6, [sp, #8]
      4a: cd e9 00 32  	strd	r3, r2, [sp]
      4e: 22 46        	mov	r2, r4
      50: 0b 6e        	ldr	r3, [r1, #96]
      52: 09 78        	ldrb	r1, [r1]
      54: ff f7 fe ff  	bl	0x54 <command_manual_get_steps+0x54> @ imm = #-4
      58: 08 b0        	add	sp, #32
      5a: 70 bd        	pop	{r4, r5, r6, pc}

0000005c <$d>:
      5c:	00 00 00 00	.word	0x00000000
      60:	00 00 00 00	.word	0x00000000

Disassembly of section .text.prtouch_step_task:

00000000 <prtouch_step_task>:
       0: 2d e9 f0 4f  	push.w	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
       4: 4e 4c        	ldr	r4, [pc, #312]          @ 0x140 <$d>
       6: b4 f8 64 50  	ldrh.w	r5, [r4, #100]
       a: a9 b0        	sub	sp, #164
       c: 00 2d        	cmp	r5, #0
       e: 00 f0 94 80  	beq.w	0x13a <prtouch_step_task+0x13a> @ imm = #296
      12: b4 f8 66 00  	ldrh.w	r0, [r4, #102]
      16: df f8 40 a1  	ldr.w	r10, [pc, #320]         @ 0x158 <$d+0x18>
      1a: ff f7 fe ff  	bl	0x1a <prtouch_step_task+0x1a> @ imm = #-4
      1e: 49 49        	ldr	r1, [pc, #292]          @ 0x144 <$d+0x4>
      20: ff f7 fe ff  	bl	0x20 <prtouch_step_task+0x20> @ imm = #-4
      24: 48 4b        	ldr	r3, [pc, #288]          @ 0x148 <$d+0x8>
      26: d3 e9 04 89  	ldrd	r8, r9, [r3, #16]
      2a: 83 46        	mov	r11, r0
      2c: da e9 00 23  	ldrd	r2, r3, [r10]
      30: ca e9 02 89  	strd	r8, r9, [r10, #8]
      34: 40 46        	mov	r0, r8
      36: 49 46        	mov	r1, r9
      38: ff f7 fe ff  	bl	0x38 <prtouch_step_task+0x38> @ imm = #-4
      3c: 06 46        	mov	r6, r0
      3e: 58 46        	mov	r0, r11
      40: 0f 46        	mov	r7, r1
      42: ff f7 fe ff  	bl	0x42 <prtouch_step_task+0x42> @ imm = #-4
      46: 02 46        	mov	r2, r0
      48: 0b 46        	mov	r3, r1
      4a: 30 46        	mov	r0, r6
      4c: 39 46        	mov	r1, r7
      4e: ff f7 fe ff  	bl	0x4e <prtouch_step_task+0x4e> @ imm = #-4
      52: 00 28        	cmp	r0, #0
      54: 71 d1        	bne	0x13a <prtouch_step_task+0x13a> @ imm = #226
      56: d4 f8 ec 60  	ldr.w	r6, [r4, #236]
      5a: ca e9 00 89  	strd	r8, r9, [r10]
      5e: 00 2e        	cmp	r6, #0
      60: 3d d0        	beq	0xde <prtouch_step_task+0xde> @ imm = #122
      62: 01 46        	mov	r1, r0
      64: 80 22        	movs	r2, #128
      66: 08 a8        	add	r0, sp, #32
      68: 07 af        	add	r7, sp, #28
      6a: ff f7 fe ff  	bl	0x6a <prtouch_step_task+0x6a> @ imm = #-4
      6e: 32 46        	mov	r2, r6
      70: 27 a9        	add	r1, sp, #156
      72: 3e 46        	mov	r6, r7
      74: 50 42        	rsbs	r0, r2, #0
      76: 00 f0 1f 00  	and	r0, r0, #31
      7a: 02 f0 1f 03  	and	r3, r2, #31
      7e: 58 bf        	it	pl
      80: 43 42        	rsbpl	r3, r0, #0
      82: 04 eb 83 03  	add.w	r3, r4, r3, lsl #2
      86: 01 32        	adds	r2, #1
      88: d3 f8 f0 30  	ldr.w	r3, [r3, #240]
      8c: 46 f8 04 3f  	str	r3, [r6, #4]!
      90: 8e 42        	cmp	r6, r1
      92: ef d1        	bne	0x74 <prtouch_step_task+0x74> @ imm = #-34
      94: 2d 4a        	ldr	r2, [pc, #180]          @ 0x14c <$d+0xc>
      96: 3b 46        	mov	r3, r7
      98: 53 f8 04 0f  	ldr	r0, [r3, #4]!
      9c: 42 f8 04 0f  	str	r0, [r2, #4]!
      a0: 8b 42        	cmp	r3, r1
      a2: f9 d1        	bne	0x98 <prtouch_step_task+0x98> @ imm = #-14
      a4: 00 23        	movs	r3, #0
      a6: a2 6e        	ldr	r2, [r4, #104]
      a8: c4 f8 ec 30  	str.w	r3, [r4, #236]
      ac: 3e 46        	mov	r6, r7
      ae: 50 42        	rsbs	r0, r2, #0
      b0: 00 f0 1f 00  	and	r0, r0, #31
      b4: 02 f0 1f 03  	and	r3, r2, #31
      b8: 58 bf        	it	pl
      ba: 43 42        	rsbpl	r3, r0, #0
      bc: 04 eb 83 03  	add.w	r3, r4, r3, lsl #2
      c0: 01 32        	adds	r2, #1
      c2: db 6e        	ldr	r3, [r3, #108]
      c4: 46 f8 04 3f  	str	r3, [r6, #4]!
      c8: 8e 42        	cmp	r6, r1
      ca: f0 d1        	bne	0xae <prtouch_step_task+0xae> @ imm = #-32
      cc: 20 4b        	ldr	r3, [pc, #128]          @ 0x150 <$d+0x10>
      ce: 57 f8 04 2f  	ldr	r2, [r7, #4]!
      d2: 43 f8 04 2f  	str	r2, [r3, #4]!
      d6: 8f 42        	cmp	r7, r1
      d8: f9 d1        	bne	0xce <prtouch_step_task+0xce> @ imm = #-14
      da: 00 23        	movs	r3, #0
      dc: a3 66        	str	r3, [r4, #104]
      de: 01 3d        	subs	r5, #1
      e0: ad b2        	uxth	r5, r5
      e2: c5 f1 07 06  	rsb.w	r6, r5, #7
      e6: b6 00        	lsls	r6, r6, #2
      e8: a4 f8 64 50  	strh.w	r5, [r4, #100]
      ec: 19 48        	ldr	r0, [pc, #100]          @ 0x154 <$d+0x14>
      ee: 04 eb 86 05  	add.w	r5, r4, r6, lsl #2
      f2: ff f7 fe ff  	bl	0xf2 <prtouch_step_task+0xf2> @ imm = #-4
      f6: 29 46        	mov	r1, r5
      f8: 2a 46        	mov	r2, r5
      fa: 2b 46        	mov	r3, r5
      fc: ad 6f        	ldr	r5, [r5, #120]
      fe: 49 6f        	ldr	r1, [r1, #116]
     100: 12 6f        	ldr	r2, [r2, #112]
     102: db 6e        	ldr	r3, [r3, #108]
     104: 07 95        	str	r5, [sp, #28]
     106: 04 eb 86 05  	add.w	r5, r4, r6, lsl #2
     10a: 06 91        	str	r1, [sp, #24]
     10c: 29 46        	mov	r1, r5
     10e: d5 f8 fc 50  	ldr.w	r5, [r5, #252]
     112: d1 f8 f8 10  	ldr.w	r1, [r1, #248]
     116: 05 92        	str	r2, [sp, #20]
     118: 04 eb 86 02  	add.w	r2, r4, r6, lsl #2
     11c: 04 93        	str	r3, [sp, #16]
     11e: 13 46        	mov	r3, r2
     120: d2 f8 f4 20  	ldr.w	r2, [r2, #244]
     124: d3 f8 f0 30  	ldr.w	r3, [r3, #240]
     128: cd e9 02 15  	strd	r1, r5, [sp, #8]
     12c: cd e9 00 32  	strd	r3, r2, [sp]
     130: 21 78        	ldrb	r1, [r4]
     132: 23 6e        	ldr	r3, [r4, #96]
     134: 32 46        	mov	r2, r6
     136: ff f7 fe ff  	bl	0x136 <prtouch_step_task+0x136> @ imm = #-4
     13a: 29 b0        	add	sp, #164
     13c: bd e8 f0 8f  	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}

00000140 <$d>:
     140:	00 00 00 00	.word	0x00000000
     144:	00 00 7a 44	.word	0x447a0000
     148:	00 00 00 00	.word	0x00000000
     14c:	ec 00 00 00	.word	0x000000ec
     150:	68 00 00 00	.word	0x00000068
     154:	00 00 00 00	.word	0x00000000
     158:	00 00 00 00	.word	0x00000000

Disassembly of section .text.read_pres_prtouch:

00000000 <read_pres_prtouch>:
       0: 2d e9 f0 4f  	push.w	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
       4: 7c 4c        	ldr	r4, [pc, #496]          @ 0x1f8 <$d+0x10>
       6: 63 8b        	ldrh	r3, [r4, #26]
       8: 83 b0        	sub	sp, #12
       a: 07 46        	mov	r7, r0
       c: 00 2b        	cmp	r3, #0
       e: 40 f0 ae 80  	bne.w	0x16e <read_pres_prtouch+0x16e> @ imm = #348
      12: 22 8b        	ldrh	r2, [r4, #24]
      14: 00 2a        	cmp	r2, #0
      16: 00 f0 de 80  	beq.w	0x1d6 <read_pres_prtouch+0x1d6> @ imm = #444
      1a: 98 46        	mov	r8, r3
      1c: 1d 46        	mov	r5, r3
      1e: 63 19        	adds	r3, r4, r5
      20: 93 f8 3c 00  	ldrb.w	r0, [r3, #60]
      24: ff f7 fe ff  	bl	0x24 <read_pres_prtouch+0x24> @ imm = #-4
      28: 26 8b        	ldrh	r6, [r4, #24]
      2a: a8 40        	lsls	r0, r5
      2c: 01 35        	adds	r5, #1
      2e: b5 42        	cmp	r5, r6
      30: 48 ea 00 08  	orr.w	r8, r8, r0
      34: f3 db        	blt	0x1e <read_pres_prtouch+0x1e> @ imm = #-26
      36: 71 4d        	ldr	r5, [pc, #452]          @ 0x1fc <$d+0x14>
      38: df f8 c8 91  	ldr.w	r9, [pc, #456]          @ 0x204 <$d+0x1c>
      3c: b8 f1 00 0f  	cmp.w	r8, #0
      40: 0e d0        	beq	0x60 <read_pres_prtouch+0x60> @ imm = #28
      42: d9 e9 00 23  	ldrd	r2, r3, [r9]
      46: d5 e9 04 01  	ldrd	r0, r1, [r5, #16]
      4a: ff f7 fe ff  	bl	0x4a <read_pres_prtouch+0x4a> @ imm = #-4
      4e: 66 a3        	adr	r3, #408 <read_pres_prtouch+0xb8>
      50: d3 e9 00 23  	ldrd	r2, r3, [r3]
      54: ff f7 fe ff  	bl	0x54 <read_pres_prtouch+0x54> @ imm = #-4
      58: 10 b9        	cbnz	r0, 0x60 <read_pres_prtouch+0x60> @ imm = #4
      5a: 03 b0        	add	sp, #12
      5c: bd e8 f0 8f  	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
      60: 00 2e        	cmp	r6, #0
      62: 00 f0 bb 80  	beq.w	0x1dc <read_pres_prtouch+0x1dc> @ imm = #374
      66: 00 26        	movs	r6, #0
      68: 04 eb 86 03  	add.w	r3, r4, r6, lsl #2
      6c: 00 21        	movs	r1, #0
      6e: d8 6a        	ldr	r0, [r3, #44]
      70: ff f7 fe ff  	bl	0x70 <read_pres_prtouch+0x70> @ imm = #-4
      74: 23 8b        	ldrh	r3, [r4, #24]
      76: 01 36        	adds	r6, #1
      78: 9e 42        	cmp	r6, r3
      7a: f5 db        	blt	0x68 <read_pres_prtouch+0x68> @ imm = #-22
      7c: 4f f0 18 08  	mov.w	r8, #24
      80: 00 2b        	cmp	r3, #0
      82: 00 f0 ab 80  	beq.w	0x1dc <read_pres_prtouch+0x1dc> @ imm = #342
      86: 00 26        	movs	r6, #0
      88: 04 eb 86 03  	add.w	r3, r4, r6, lsl #2
      8c: 01 21        	movs	r1, #1
      8e: d8 6a        	ldr	r0, [r3, #44]
      90: ff f7 fe ff  	bl	0x90 <read_pres_prtouch+0x90> @ imm = #-4
      94: 21 8b        	ldrh	r1, [r4, #24]
      96: 01 36        	adds	r6, #1
      98: 8e 42        	cmp	r6, r1
      9a: f5 db        	blt	0x88 <read_pres_prtouch+0x88> @ imm = #-22
      9c: 00 29        	cmp	r1, #0
      9e: 00 f0 9d 80  	beq.w	0x1dc <read_pres_prtouch+0x1dc> @ imm = #314
      a2: 07 eb 81 01  	add.w	r1, r7, r1, lsl #2
      a6: 3b 46        	mov	r3, r7
      a8: 1a 68        	ldr	r2, [r3]
      aa: 52 00        	lsls	r2, r2, #1
      ac: 43 f8 04 2b  	str	r2, [r3], #4
      b0: 99 42        	cmp	r1, r3
      b2: f9 d1        	bne	0xa8 <read_pres_prtouch+0xa8> @ imm = #-14
      b4: 00 26        	movs	r6, #0
      b6: 04 eb 86 03  	add.w	r3, r4, r6, lsl #2
      ba: 00 21        	movs	r1, #0
      bc: d8 6a        	ldr	r0, [r3, #44]
      be: ff f7 fe ff  	bl	0xbe <read_pres_prtouch+0xbe> @ imm = #-4
      c2: 23 8b        	ldrh	r3, [r4, #24]
      c4: 01 36        	adds	r6, #1
      c6: 9e 42        	cmp	r6, r3
      c8: f5 db        	blt	0xb6 <read_pres_prtouch+0xb6> @ imm = #-22
      ca: 93 b1        	cbz	r3, 0xf2 <read_pres_prtouch+0xf2> @ imm = #36
      cc: a7 f1 04 0a  	sub.w	r10, r7, #4
      d0: 00 26        	movs	r6, #0
      d2: a3 19        	adds	r3, r4, r6
      d4: 01 36        	adds	r6, #1
      d6: 93 f8 3c 00  	ldrb.w	r0, [r3, #60]
      da: ff f7 fe ff  	bl	0xda <read_pres_prtouch+0xda> @ imm = #-4
      de: 5a f8 04 2f  	ldr	r2, [r10, #4]!
      e2: 23 8b        	ldrh	r3, [r4, #24]
      e4: 00 28        	cmp	r0, #0
      e6: 18 bf        	it	ne
      e8: 01 32        	addne	r2, #1
      ea: 9e 42        	cmp	r6, r3
      ec: ca f8 00 20  	str.w	r2, [r10]
      f0: ef db        	blt	0xd2 <read_pres_prtouch+0xd2> @ imm = #-34
      f2: b8 f1 01 08  	subs.w	r8, r8, #1
      f6: c3 d1        	bne	0x80 <read_pres_prtouch+0x80> @ imm = #-122
      f8: 00 2b        	cmp	r3, #0
      fa: 6f d0        	beq	0x1dc <read_pres_prtouch+0x1dc> @ imm = #222
      fc: 04 eb 88 03  	add.w	r3, r4, r8, lsl #2
     100: 01 21        	movs	r1, #1
     102: d8 6a        	ldr	r0, [r3, #44]
     104: ff f7 fe ff  	bl	0x104 <read_pres_prtouch+0x104> @ imm = #-4
     108: 21 8b        	ldrh	r1, [r4, #24]
     10a: 08 f1 01 08  	add.w	r8, r8, #1
     10e: 88 45        	cmp	r8, r1
     110: f4 db        	blt	0xfc <read_pres_prtouch+0xfc> @ imm = #-24
     112: 00 29        	cmp	r1, #0
     114: 62 d0        	beq	0x1dc <read_pres_prtouch+0x1dc> @ imm = #196
     116: 07 eb 81 01  	add.w	r1, r7, r1, lsl #2
     11a: 3b 46        	mov	r3, r7
     11c: 53 f8 04 2b  	ldr	r2, [r3], #4
     120: 10 02        	lsls	r0, r2, #8
     122: 48 bf        	it	mi
     124: 42 f0 7f 42  	orrmi	r2, r2, #4278190080
     128: 8b 42        	cmp	r3, r1
     12a: 43 f8 04 2c  	str	r2, [r3, #-4]
     12e: f5 d1        	bne	0x11c <read_pres_prtouch+0x11c> @ imm = #-22
     130: 00 26        	movs	r6, #0
     132: 04 eb 86 03  	add.w	r3, r4, r6, lsl #2
     136: 00 21        	movs	r1, #0
     138: d8 6a        	ldr	r0, [r3, #44]
     13a: ff f7 fe ff  	bl	0x13a <read_pres_prtouch+0x13a> @ imm = #-4
     13e: 21 8b        	ldrh	r1, [r4, #24]
     140: 01 36        	adds	r6, #1
     142: 8e 42        	cmp	r6, r1
     144: f5 db        	blt	0x132 <read_pres_prtouch+0x132> @ imm = #-22
     146: d5 e9 04 23  	ldrd	r2, r3, [r5, #16]
     14a: c9 e9 00 23  	strd	r2, r3, [r9]
     14e: 51 b1        	cbz	r1, 0x166 <read_pres_prtouch+0x166> @ imm = #20
     150: 2b 4a        	ldr	r2, [pc, #172]          @ 0x200 <$d+0x18>
     152: 07 eb 81 01  	add.w	r1, r7, r1, lsl #2
     156: 3b 68        	ldr	r3, [r7]
     158: 52 f8 04 0b  	ldr	r0, [r2], #4
     15c: 1b 1a        	subs	r3, r3, r0
     15e: 47 f8 04 3b  	str	r3, [r7], #4
     162: 8f 42        	cmp	r7, r1
     164: f7 d1        	bne	0x156 <read_pres_prtouch+0x156> @ imm = #-18
     166: 01 20        	movs	r0, #1
     168: 03 b0        	add	sp, #12
     16a: bd e8 f0 8f  	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
     16e: 23 8b        	ldrh	r3, [r4, #24]
     170: 00 2b        	cmp	r3, #0
     172: f8 d0        	beq	0x166 <read_pres_prtouch+0x166> @ imm = #-16
     174: 03 1f        	subs	r3, r0, #4
     176: 0f f2 78 09  	adr.w	r9, #120
     17a: d9 e9 00 89  	ldrd	r8, r9, [r9]
     17e: 01 93        	str	r3, [sp, #4]
     180: 1e 4d        	ldr	r5, [pc, #120]          @ 0x1fc <$d+0x14>
     182: 00 23        	movs	r3, #0
     184: 00 93        	str	r3, [sp]
     186: 00 9b        	ldr	r3, [sp]
     188: 9f 1d        	adds	r7, r3, #6
     18a: d5 e9 04 ab  	ldrd	r10, r11, [r5, #16]
     18e: 04 eb 87 06  	add.w	r6, r4, r7, lsl #2
     192: 08 e0        	b	0x1a6 <read_pres_prtouch+0x1a6> @ imm = #16
     194: d5 e9 04 01  	ldrd	r0, r1, [r5, #16]
     198: ff f7 fe ff  	bl	0x198 <read_pres_prtouch+0x198> @ imm = #-4
     19c: 42 46        	mov	r2, r8
     19e: 4b 46        	mov	r3, r9
     1a0: ff f7 fe ff  	bl	0x1a0 <read_pres_prtouch+0x1a0> @ imm = #-4
     1a4: 30 b1        	cbz	r0, 0x1b4 <read_pres_prtouch+0x1b4> @ imm = #12
     1a6: 70 68        	ldr	r0, [r6, #4]
     1a8: ff f7 fe ff  	bl	0x1a8 <read_pres_prtouch+0x1a8> @ imm = #-4
     1ac: 52 46        	mov	r2, r10
     1ae: 5b 46        	mov	r3, r11
     1b0: 00 28        	cmp	r0, #0
     1b2: ef d1        	bne	0x194 <read_pres_prtouch+0x194> @ imm = #-34
     1b4: 00 9e        	ldr	r6, [sp]
     1b6: 04 eb 87 07  	add.w	r7, r4, r7, lsl #2
     1ba: 01 36        	adds	r6, #1
     1bc: 78 68        	ldr	r0, [r7, #4]
     1be: 00 96        	str	r6, [sp]
     1c0: ff f7 fe ff  	bl	0x1c0 <read_pres_prtouch+0x1c0> @ imm = #-4
     1c4: 01 9a        	ldr	r2, [sp, #4]
     1c6: 23 8b        	ldrh	r3, [r4, #24]
     1c8: 42 f8 04 0f  	str	r0, [r2, #4]!
     1cc: b3 42        	cmp	r3, r6
     1ce: 01 92        	str	r2, [sp, #4]
     1d0: d9 dc        	bgt	0x186 <read_pres_prtouch+0x186> @ imm = #-78
     1d2: 01 20        	movs	r0, #1
     1d4: c8 e7        	b	0x168 <read_pres_prtouch+0x168> @ imm = #-112
     1d6: 09 4d        	ldr	r5, [pc, #36]           @ 0x1fc <$d+0x14>
     1d8: df f8 28 90  	ldr.w	r9, [pc, #40]           @ 0x204 <$d+0x1c>
     1dc: d5 e9 04 23  	ldrd	r2, r3, [r5, #16]
     1e0: c9 e9 00 23  	strd	r2, r3, [r9]
     1e4: bf e7        	b	0x166 <read_pres_prtouch+0x166> @ imm = #-130
     1e6: 00 bf        	nop

000001e8 <$d>:
     1e8:	9a 99 99 99	.word	0x9999999a
     1ec:	99 99 99 3f	.word	0x3f999999
     1f0:	fc a9 f1 d2	.word	0xd2f1a9fc
     1f4:	4d 62 60 3f	.word	0x3f60624d
     1f8:	00 00 00 00	.word	0x00000000
     1fc:	00 00 00 00	.word	0x00000000
     200:	0c 03 00 00	.word	0x0000030c
     204:	00 00 00 00	.word	0x00000000

Disassembly of section .text.filter_datas_prtouch:

00000000 <filter_datas_prtouch>:
       0: 2d e9 f0 4f  	push.w	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
       4: 80 22        	movs	r2, #128
       6: 04 46        	mov	r4, r0
       8: 85 b0        	sub	sp, #20
       a: b6 48        	ldr	r0, [pc, #728]          @ 0x2e4 <$d>
       c: b6 4e        	ldr	r6, [pc, #728]          @ 0x2e8 <$d+0x4>
       e: 0d 46        	mov	r5, r1
      10: 00 21        	movs	r1, #0
      12: ff f7 fe ff  	bl	0x12 <filter_datas_prtouch+0x12> @ imm = #-4
      16: 4f f4 80 72  	mov.w	r2, #256
      1a: 00 21        	movs	r1, #0
      1c: b3 48        	ldr	r0, [pc, #716]          @ 0x2ec <$d+0x8>
      1e: ff f7 fe ff  	bl	0x1e <filter_datas_prtouch+0x1e> @ imm = #-4
      22: b3 4b        	ldr	r3, [pc, #716]          @ 0x2f0 <$d+0xc>
      24: 04 eb 44 10  	add.w	r0, r4, r4, lsl #5
      28: 03 eb 80 03  	add.w	r3, r3, r0, lsl #2
      2c: 06 f1 04 0c  	add.w	r12, r6, #4
      30: d3 f8 c4 20  	ldr.w	r2, [r3, #196]
      34: cd f8 0c c0  	str.w	r12, [sp, #12]
      38: 67 01        	lsls	r7, r4, #5
      3a: 0c f1 7c 0b  	add.w	r11, r12, #124
      3e: 31 46        	mov	r1, r6
      40: a0 46        	mov	r8, r4
      42: d2 f1 00 0e  	rsbs.w	lr, r2, #0
      46: 0e f0 1f 0e  	and	lr, lr, #31
      4a: 02 f0 1f 03  	and	r3, r2, #31
      4e: a8 4c        	ldr	r4, [pc, #672]          @ 0x2f0 <$d+0xc>
      50: 58 bf        	it	pl
      52: ce f1 00 03  	rsbpl.w	r3, lr, #0
      56: 03 44        	add	r3, r0
      58: 04 eb 83 03  	add.w	r3, r4, r3, lsl #2
      5c: 01 32        	adds	r2, #1
      5e: d3 f8 c8 30  	ldr.w	r3, [r3, #200]
      62: 41 f8 04 3f  	str	r3, [r1, #4]!
      66: 59 45        	cmp	r1, r11
      68: eb d1        	bne	0x42 <filter_datas_prtouch+0x42> @ imm = #-42
      6a: dc f8 00 00  	ldr.w	r0, [r12]
      6e: dc f8 7c 30  	ldr.w	r3, [r12, #124]
      72: 83 42        	cmp	r3, r0
      74: 44 46        	mov	r4, r8
      76: 80 f2 c5 80  	bge.w	0x204 <filter_datas_prtouch+0x204> @ imm = #394
      7a: 9d 4b        	ldr	r3, [pc, #628]          @ 0x2f0 <$d+0xc>
      7c: 9d 49        	ldr	r1, [pc, #628]          @ 0x2f4 <$d+0x10>
      7e: 5a 8b        	ldrh	r2, [r3, #26]
      80: a1 f1 80 03  	sub.w	r3, r1, #128
      84: 42 b1        	cbz	r2, 0x98 <filter_datas_prtouch+0x98> @ imm = #16
      86: c0 f5 80 50  	rsb.w	r0, r0, #4096
      8a: 43 f8 04 0b  	str	r0, [r3], #4
      8e: 8b 42        	cmp	r3, r1
      90: 07 d0        	beq	0xa2 <filter_datas_prtouch+0xa2> @ imm = #14
      92: 18 68        	ldr	r0, [r3]
      94: 00 2a        	cmp	r2, #0
      96: f6 d1        	bne	0x86 <filter_datas_prtouch+0x86> @ imm = #-20
      98: 40 42        	rsbs	r0, r0, #0
      9a: 43 f8 04 0b  	str	r0, [r3], #4
      9e: 8b 42        	cmp	r3, r1
      a0: f7 d1        	bne	0x92 <filter_datas_prtouch+0x92> @ imm = #-18
      a2: dc f8 00 00  	ldr.w	r0, [r12]
      a6: 00 2a        	cmp	r2, #0
      a8: 40 f0 b1 80  	bne.w	0x20e <filter_datas_prtouch+0x20e> @ imm = #354
      ac: 00 2d        	cmp	r5, #0
      ae: 40 f0 ed 80  	bne.w	0x28c <filter_datas_prtouch+0x28c> @ imm = #474
      b2: 91 4b        	ldr	r3, [pc, #580]          @ 0x2f8 <$d+0x14>
      b4: a3 f1 78 05  	sub.w	r5, r3, #120
      b8: 00 e0        	b	0xbc <filter_datas_prtouch+0xbc> @ imm = #0
      ba: 28 68        	ldr	r0, [r5]
      bc: ff f7 fe ff  	bl	0xbc <filter_datas_prtouch+0xbc> @ imm = #-4
      c0: 04 46        	mov	r4, r0
      c2: 68 68        	ldr	r0, [r5, #4]
      c4: 8a 46        	mov	r10, r1
      c6: ff f7 fe ff  	bl	0xc6 <filter_datas_prtouch+0xc6> @ imm = #-4
      ca: 2a f0 00 47  	bic	r7, r10, #2147483648
      ce: 06 46        	mov	r6, r0
      d0: 21 f0 00 48  	bic	r8, r1, #2147483648
      d4: 89 46        	mov	r9, r1
      d6: 20 46        	mov	r0, r4
      d8: 32 46        	mov	r2, r6
      da: 39 46        	mov	r1, r7
      dc: 43 46        	mov	r3, r8
      de: ff f7 fe ff  	bl	0xde <filter_datas_prtouch+0xde> @ imm = #-4
      e2: 00 94        	str	r4, [sp]
      e4: 18 b9        	cbnz	r0, 0xee <filter_datas_prtouch+0xee> @ imm = #6
      e6: 34 46        	mov	r4, r6
      e8: 00 96        	str	r6, [sp]
      ea: 47 46        	mov	r7, r8
      ec: ca 46        	mov	r10, r9
      ee: ae 68        	ldr	r6, [r5, #8]
      f0: 30 46        	mov	r0, r6
      f2: ff f7 fe ff  	bl	0xf2 <filter_datas_prtouch+0xf2> @ imm = #-4
      f6: 21 f0 00 49  	bic	r9, r1, #2147483648
      fa: 00 9a        	ldr	r2, [sp]
      fc: 3b 46        	mov	r3, r7
      fe: 49 46        	mov	r1, r9
     100: ff f7 fe ff  	bl	0x100 <filter_datas_prtouch+0x100> @ imm = #-4
     104: 20 b1        	cbz	r0, 0x110 <filter_datas_prtouch+0x110> @ imm = #8
     106: 20 46        	mov	r0, r4
     108: 51 46        	mov	r1, r10
     10a: ff f7 fe ff  	bl	0x10a <filter_datas_prtouch+0x10a> @ imm = #-4
     10e: 06 46        	mov	r6, r0
     110: 45 f8 04 6b  	str	r6, [r5], #4
     114: 78 4b        	ldr	r3, [pc, #480]          @ 0x2f8 <$d+0x14>
     116: 9d 42        	cmp	r5, r3
     118: cf d1        	bne	0xba <filter_datas_prtouch+0xba> @ imm = #-98
     11a: 75 4e        	ldr	r6, [pc, #468]          @ 0x2f0 <$d+0xc>
     11c: 77 48        	ldr	r0, [pc, #476]          @ 0x2fc <$d+0x18>
     11e: d6 f8 f0 12  	ldr.w	r1, [r6, #752]
     122: df f8 c8 a1  	ldr.w	r10, [pc, #456]         @ 0x2ec <$d+0x8>
     126: ff f7 fe ff  	bl	0x126 <filter_datas_prtouch+0x126> @ imm = #-4
     12a: ff f7 fe ff  	bl	0x12a <filter_datas_prtouch+0x12a> @ imm = #-4
     12e: 04 46        	mov	r4, r0
     130: b6 f8 ee 02  	ldrh.w	r0, [r6, #750]
     134: 0d 46        	mov	r5, r1
     136: ff f7 fe ff  	bl	0x136 <filter_datas_prtouch+0x136> @ imm = #-4
     13a: 01 46        	mov	r1, r0
     13c: 70 48        	ldr	r0, [pc, #448]          @ 0x300 <$d+0x1c>
     13e: ff f7 fe ff  	bl	0x13e <filter_datas_prtouch+0x13e> @ imm = #-4
     142: 01 46        	mov	r1, r0
     144: 4f f0 7e 50  	mov.w	r0, #1065353216
     148: ff f7 fe ff  	bl	0x148 <filter_datas_prtouch+0x148> @ imm = #-4
     14c: ff f7 fe ff  	bl	0x14c <filter_datas_prtouch+0x14c> @ imm = #-4
     150: 22 46        	mov	r2, r4
     152: 2b 46        	mov	r3, r5
     154: ff f7 fe ff  	bl	0x154 <filter_datas_prtouch+0x154> @ imm = #-4
     158: 02 46        	mov	r2, r0
     15a: 0b 46        	mov	r3, r1
     15c: 20 46        	mov	r0, r4
     15e: 29 46        	mov	r1, r5
     160: ff f7 fe ff  	bl	0x160 <filter_datas_prtouch+0x160> @ imm = #-4
     164: 03 9f        	ldr	r7, [sp, #12]
     166: 04 46        	mov	r4, r0
     168: 0d 46        	mov	r5, r1
     16a: 56 46        	mov	r6, r10
     16c: 4f f0 00 08  	mov.w	r8, #0
     170: 4f f0 00 09  	mov.w	r9, #0
     174: 3b 46        	mov	r3, r7
     176: d3 e9 00 30  	ldrd	r3, r0, [r3]
     17a: c0 1a        	subs	r0, r0, r3
     17c: ff f7 fe ff  	bl	0x17c <filter_datas_prtouch+0x17c> @ imm = #-4
     180: 42 46        	mov	r2, r8
     182: 4b 46        	mov	r3, r9
     184: ff f7 fe ff  	bl	0x184 <filter_datas_prtouch+0x184> @ imm = #-4
     188: 22 46        	mov	r2, r4
     18a: 2b 46        	mov	r3, r5
     18c: ff f7 fe ff  	bl	0x18c <filter_datas_prtouch+0x18c> @ imm = #-4
     190: 04 37        	adds	r7, #4
     192: 80 46        	mov	r8, r0
     194: 89 46        	mov	r9, r1
     196: 5f 45        	cmp	r7, r11
     198: e6 e9 02 89  	strd	r8, r9, [r6, #8]!
     19c: ea d1        	bne	0x174 <filter_datas_prtouch+0x174> @ imm = #-44
     19e: 54 4b        	ldr	r3, [pc, #336]          @ 0x2f0 <$d+0xc>
     1a0: df f8 68 b1  	ldr.w	r11, [pc, #360]         @ 0x30c <$d+0x28>
     1a4: d3 f8 f4 42  	ldr.w	r4, [r3, #756]
     1a8: 20 46        	mov	r0, r4
     1aa: ff f7 fe ff  	bl	0x1aa <filter_datas_prtouch+0x1aa> @ imm = #-4
     1ae: 80 46        	mov	r8, r0
     1b0: 89 46        	mov	r9, r1
     1b2: 4f f0 7e 50  	mov.w	r0, #1065353216
     1b6: 21 46        	mov	r1, r4
     1b8: ff f7 fe ff  	bl	0x1b8 <filter_datas_prtouch+0x1b8> @ imm = #-4
     1bc: ff f7 fe ff  	bl	0x1bc <filter_datas_prtouch+0x1bc> @ imm = #-4
     1c0: cd e9 00 01  	strd	r0, r1, [sp]
     1c4: 00 24        	movs	r4, #0
     1c6: 00 25        	movs	r5, #0
     1c8: fa e9 02 23  	ldrd	r2, r3, [r10, #8]!
     1cc: 40 46        	mov	r0, r8
     1ce: 49 46        	mov	r1, r9
     1d0: ff f7 fe ff  	bl	0x1d0 <filter_datas_prtouch+0x1d0> @ imm = #-4
     1d4: 22 46        	mov	r2, r4
     1d6: 2b 46        	mov	r3, r5
     1d8: 06 46        	mov	r6, r0
     1da: 0f 46        	mov	r7, r1
     1dc: dd e9 00 01  	ldrd	r0, r1, [sp]
     1e0: ff f7 fe ff  	bl	0x1e0 <filter_datas_prtouch+0x1e0> @ imm = #-4
     1e4: 02 46        	mov	r2, r0
     1e6: 0b 46        	mov	r3, r1
     1e8: 30 46        	mov	r0, r6
     1ea: 39 46        	mov	r1, r7
     1ec: ff f7 fe ff  	bl	0x1ec <filter_datas_prtouch+0x1ec> @ imm = #-4
     1f0: d3 45        	cmp	r11, r10
     1f2: 04 46        	mov	r4, r0
     1f4: 0d 46        	mov	r5, r1
     1f6: ca e9 00 45  	strd	r4, r5, [r10]
     1fa: e5 d1        	bne	0x1c8 <filter_datas_prtouch+0x1c8> @ imm = #-54
     1fc: 3b 48        	ldr	r0, [pc, #236]          @ 0x2ec <$d+0x8>
     1fe: 05 b0        	add	sp, #20
     200: bd e8 f0 8f  	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
     204: 3a 4b        	ldr	r3, [pc, #232]          @ 0x2f0 <$d+0xc>
     206: 5a 8b        	ldrh	r2, [r3, #26]
     208: 00 2a        	cmp	r2, #0
     20a: 3f f4 4f af  	beq.w	0xac <filter_datas_prtouch+0xac> @ imm = #-354
     20e: 00 2d        	cmp	r5, #0
     210: 5a d1        	bne	0x2c8 <filter_datas_prtouch+0x2c8> @ imm = #180
     212: 3c 4d        	ldr	r5, [pc, #240]          @ 0x304 <$d+0x20>
     214: 03 9e        	ldr	r6, [sp, #12]
     216: 05 f1 08 04  	add.w	r4, r5, #8
     21a: 05 f5 80 7a  	add.w	r10, r5, #256
     21e: 01 e0        	b	0x224 <filter_datas_prtouch+0x224> @ imm = #2
     220: 56 f8 04 0f  	ldr	r0, [r6, #4]!
     224: ff f7 fe ff  	bl	0x224 <filter_datas_prtouch+0x224> @ imm = #-4
     228: e5 e9 02 01  	strd	r0, r1, [r5, #8]!
     22c: aa 45        	cmp	r10, r5
     22e: f7 d1        	bne	0x220 <filter_datas_prtouch+0x220> @ imm = #-18
     230: 2f 4b        	ldr	r3, [pc, #188]          @ 0x2f0 <$d+0xc>
     232: d3 f8 f4 52  	ldr.w	r5, [r3, #756]
     236: 28 46        	mov	r0, r5
     238: ff f7 fe ff  	bl	0x238 <filter_datas_prtouch+0x238> @ imm = #-4
     23c: 80 46        	mov	r8, r0
     23e: 89 46        	mov	r9, r1
     240: 4f f0 7e 50  	mov.w	r0, #1065353216
     244: 29 46        	mov	r1, r5
     246: ff f7 fe ff  	bl	0x246 <filter_datas_prtouch+0x246> @ imm = #-4
     24a: ff f7 fe ff  	bl	0x24a <filter_datas_prtouch+0x24a> @ imm = #-4
     24e: cd e9 00 01  	strd	r0, r1, [sp]
     252: a3 46        	mov	r11, r4
     254: db e9 02 23  	ldrd	r2, r3, [r11, #8]
     258: 40 46        	mov	r0, r8
     25a: 49 46        	mov	r1, r9
     25c: ff f7 fe ff  	bl	0x25c <filter_datas_prtouch+0x25c> @ imm = #-4
     260: db e9 00 23  	ldrd	r2, r3, [r11]
     264: 06 46        	mov	r6, r0
     266: 0f 46        	mov	r7, r1
     268: dd e9 00 01  	ldrd	r0, r1, [sp]
     26c: ff f7 fe ff  	bl	0x26c <filter_datas_prtouch+0x26c> @ imm = #-4
     270: 02 46        	mov	r2, r0
     272: 0b 46        	mov	r3, r1
     274: 30 46        	mov	r0, r6
     276: 39 46        	mov	r1, r7
     278: ff f7 fe ff  	bl	0x278 <filter_datas_prtouch+0x278> @ imm = #-4
     27c: eb e9 02 01  	strd	r0, r1, [r11, #8]!
     280: da 45        	cmp	r10, r11
     282: e7 d1        	bne	0x254 <filter_datas_prtouch+0x254> @ imm = #-50
     284: 19 48        	ldr	r0, [pc, #100]          @ 0x2ec <$d+0x8>
     286: 05 b0        	add	sp, #20
     288: bd e8 f0 8f  	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
     28c: 18 49        	ldr	r1, [pc, #96]           @ 0x2f0 <$d+0xc>
     28e: 1e 4b        	ldr	r3, [pc, #120]          @ 0x308 <$d+0x24>
     290: 3a 19        	adds	r2, r7, r4
     292: 01 eb 82 02  	add.w	r2, r1, r2, lsl #2
     296: c4 32        	adds	r2, #196
     298: 03 f1 7c 01  	add.w	r1, r3, #124
     29c: 01 e0        	b	0x2a2 <filter_datas_prtouch+0x2a2> @ imm = #2
     29e: 53 f8 04 0b  	ldr	r0, [r3], #4
     2a2: 42 f8 04 0f  	str	r0, [r2, #4]!
     2a6: 8b 42        	cmp	r3, r1
     2a8: f9 d1        	bne	0x29e <filter_datas_prtouch+0x29e> @ imm = #-14
     2aa: 11 49        	ldr	r1, [pc, #68]           @ 0x2f0 <$d+0xc>
     2ac: 0a 8b        	ldrh	r2, [r1, #24]
     2ae: 3b 19        	adds	r3, r7, r4
     2b0: 01 eb 83 03  	add.w	r3, r1, r3, lsl #2
     2b4: 01 3a        	subs	r2, #1
     2b6: 00 21        	movs	r1, #0
     2b8: a2 42        	cmp	r2, r4
     2ba: c3 f8 c4 10  	str.w	r1, [r3, #196]
     2be: 50 d0        	beq	0x362 <$t+0x52>         @ imm = #160
     2c0: 0a 48        	ldr	r0, [pc, #40]           @ 0x2ec <$d+0x8>
     2c2: 05 b0        	add	sp, #20
     2c4: bd e8 f0 8f  	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
     2c8: 09 4a        	ldr	r2, [pc, #36]           @ 0x2f0 <$d+0xc>
     2ca: 0f 4b        	ldr	r3, [pc, #60]           @ 0x308 <$d+0x24>
     2cc: 27 44        	add	r7, r4
     2ce: 02 eb 87 01  	add.w	r1, r2, r7, lsl #2
     2d2: 00 25        	movs	r5, #0
     2d4: 01 f1 c4 02  	add.w	r2, r1, #196
     2d8: c1 f8 c4 50  	str.w	r5, [r1, #196]
     2dc: 03 f1 7c 01  	add.w	r1, r3, #124
     2e0: 18 e0        	b	0x314 <$t+0x4>          @ imm = #48
     2e2: 00 bf        	nop

000002e4 <$d>:
     2e4:	00 00 00 00	.word	0x00000000
     2e8:	fc ff ff ff	.word	0xfffffffc
     2ec:	00 00 00 00	.word	0x00000000
     2f0:	00 00 00 00	.word	0x00000000
     2f4:	80 00 00 00	.word	0x00000080
     2f8:	78 00 00 00	.word	0x00000078
     2fc:	84 f9 22 3e	.word	0x3e22f984
     300:	00 00 7a 44	.word	0x447a0000
     304:	f8 ff ff ff	.word	0xfffffff8
     308:	04 00 00 00	.word	0x00000004
     30c:	f8 00 00 00	.word	0x000000f8

00000310 <$t>:
     310: 53 f8 04 0b  	ldr	r0, [r3], #4
     314: 42 f8 04 0f  	str	r0, [r2, #4]!
     318: 99 42        	cmp	r1, r3
     31a: f9 d1        	bne	0x310 <$t>              @ imm = #-14
     31c: 23 4b        	ldr	r3, [pc, #140]          @ 0x3ac <$d>
     31e: 1b 8b        	ldrh	r3, [r3, #24]
     320: 01 3b        	subs	r3, #1
     322: a3 42        	cmp	r3, r4
     324: cc d1        	bne	0x2c0 <filter_datas_prtouch+0x2c0> @ imm = #-104
     326: 21 4b        	ldr	r3, [pc, #132]          @ 0x3ac <$d>
     328: 1a 6c        	ldr	r2, [r3, #64]
     32a: 30 46        	mov	r0, r6
     32c: 51 42        	rsbs	r1, r2, #0
     32e: 01 f0 1f 01  	and	r1, r1, #31
     332: 02 f0 1f 03  	and	r3, r2, #31
     336: 58 bf        	it	pl
     338: 4b 42        	rsbpl	r3, r1, #0
     33a: 1c 49        	ldr	r1, [pc, #112]          @ 0x3ac <$d>
     33c: 01 eb 83 03  	add.w	r3, r1, r3, lsl #2
     340: 01 32        	adds	r2, #1
     342: 5b 6c        	ldr	r3, [r3, #68]
     344: 40 f8 04 3f  	str	r3, [r0, #4]!
     348: 58 45        	cmp	r0, r11
     34a: ef d1        	bne	0x32c <$t+0x1c>         @ imm = #-34
     34c: 00 22        	movs	r2, #0
     34e: 01 f1 40 03  	add.w	r3, r1, #64
     352: 0a 64        	str	r2, [r1, #64]
     354: 56 f8 04 2f  	ldr	r2, [r6, #4]!
     358: 43 f8 04 2f  	str	r2, [r3, #4]!
     35c: 5e 45        	cmp	r6, r11
     35e: f9 d1        	bne	0x354 <$t+0x44>         @ imm = #-14
     360: ae e7        	b	0x2c0 <filter_datas_prtouch+0x2c0> @ imm = #-164
     362: 12 4b        	ldr	r3, [pc, #72]           @ 0x3ac <$d>
     364: 1a 6c        	ldr	r2, [r3, #64]
     366: c3 f8 04 23  	str.w	r2, [r3, #772]
     36a: 30 46        	mov	r0, r6
     36c: 51 42        	rsbs	r1, r2, #0
     36e: 01 f0 1f 01  	and	r1, r1, #31
     372: 02 f0 1f 03  	and	r3, r2, #31
     376: 58 bf        	it	pl
     378: 4b 42        	rsbpl	r3, r1, #0
     37a: 0c 49        	ldr	r1, [pc, #48]           @ 0x3ac <$d>
     37c: 01 eb 83 03  	add.w	r3, r1, r3, lsl #2
     380: 01 32        	adds	r2, #1
     382: 5b 6c        	ldr	r3, [r3, #68]
     384: 40 f8 04 3f  	str	r3, [r0, #4]!
     388: 58 45        	cmp	r0, r11
     38a: ef d1        	bne	0x36c <$t+0x5c>         @ imm = #-34
     38c: 01 f1 40 03  	add.w	r3, r1, #64
     390: 56 f8 04 2f  	ldr	r2, [r6, #4]!
     394: 43 f8 04 2f  	str	r2, [r3, #4]!
     398: 5e 45        	cmp	r6, r11
     39a: f9 d1        	bne	0x390 <$t+0x80>         @ imm = #-14
     39c: 03 4a        	ldr	r2, [pc, #12]           @ 0x3ac <$d>
     39e: 04 48        	ldr	r0, [pc, #16]           @ 0x3b0 <$d+0x4>
     3a0: 00 23        	movs	r3, #0
     3a2: 13 64        	str	r3, [r2, #64]
     3a4: 05 b0        	add	sp, #20
     3a6: bd e8 f0 8f  	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
     3aa: 00 bf        	nop

000003ac <$d>:
     3ac:	00 00 00 00	.word	0x00000000
     3b0:	00 00 00 00	.word	0x00000000

Disassembly of section .text.check_pres_tri_prtouch:

00000000 <check_pres_tri_prtouch>:
       0: 2d e9 f0 4f  	push.w	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
       4: df f8 0c b2  	ldr.w	r11, [pc, #524]         @ 0x214 <$d+0x4>
       8: bb f8 1a 30  	ldrh.w	r3, [r11, #26]
       c: 87 b0        	sub	sp, #28
       e: 00 2b        	cmp	r3, #0
      10: 48 d0        	beq	0xa4 <check_pres_tri_prtouch+0xa4> @ imm = #144
      12: bb f8 18 30  	ldrh.w	r3, [r11, #24]
      16: 4f f0 00 09  	mov.w	r9, #0
      1a: ab f8 e2 92  	strh.w	r9, [r11, #738]
      1e: 00 2b        	cmp	r3, #0
      20: 00 f0 ef 80  	beq.w	0x202 <check_pres_tri_prtouch+0x202> @ imm = #478
      24: cd f8 14 90  	str.w	r9, [sp, #20]
      28: 00 21        	movs	r1, #0
      2a: 48 46        	mov	r0, r9
      2c: ff f7 fe ff  	bl	0x2c <check_pres_tri_prtouch+0x2c> @ imm = #-4
      30: db f8 fc a2  	ldr.w	r10, [r11, #764]
      34: 04 46        	mov	r4, r0
      36: ba f1 00 0f  	cmp.w	r10, #0
      3a: 28 d0        	beq	0x8e <check_pres_tri_prtouch+0x8e> @ imm = #80
      3c: db f8 00 03  	ldr.w	r0, [r11, #768]
      40: ff f7 fe ff  	bl	0x40 <check_pres_tri_prtouch+0x40> @ imm = #-4
      44: 4f ea ca 08  	lsl.w	r8, r10, #3
      48: c8 f5 80 78  	rsb.w	r8, r8, #256
      4c: a0 44        	add	r8, r4
      4e: 06 46        	mov	r6, r0
      50: 0f 46        	mov	r7, r1
      52: 04 f5 80 74  	add.w	r4, r4, #256
      56: 00 25        	movs	r5, #0
      58: 74 e9 02 01  	ldrd	r0, r1, [r4, #-8]!
      5c: 32 46        	mov	r2, r6
      5e: 3b 46        	mov	r3, r7
      60: ff f7 fe ff  	bl	0x60 <check_pres_tri_prtouch+0x60> @ imm = #-4
      64: 00 28        	cmp	r0, #0
      66: 18 bf        	it	ne
      68: 01 35        	addne	r5, #1
      6a: a0 45        	cmp	r8, r4
      6c: f4 d1        	bne	0x58 <check_pres_tri_prtouch+0x58> @ imm = #-24
      6e: 55 45        	cmp	r5, r10
      70: 0d d0        	beq	0x8e <check_pres_tri_prtouch+0x8e> @ imm = #26
      72: bb f8 e2 32  	ldrh.w	r3, [r11, #738]
      76: bb f8 18 20  	ldrh.w	r2, [r11, #24]
      7a: ab f8 e2 32  	strh.w	r3, [r11, #738]
      7e: 09 f1 01 09  	add.w	r9, r9, #1
      82: 4a 45        	cmp	r2, r9
      84: d0 dc        	bgt	0x28 <check_pres_tri_prtouch+0x28> @ imm = #-96
      86: 05 98        	ldr	r0, [sp, #20]
      88: 07 b0        	add	sp, #28
      8a: bd e8 f0 8f  	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
      8e: bb f8 e2 22  	ldrh.w	r2, [r11, #738]
      92: 01 23        	movs	r3, #1
      94: 03 fa 09 f3  	lsl.w	r3, r3, r9
      98: 13 43        	orrs	r3, r2
      9a: 05 9a        	ldr	r2, [sp, #20]
      9c: 01 32        	adds	r2, #1
      9e: 05 92        	str	r2, [sp, #20]
      a0: 9b b2        	uxth	r3, r3
      a2: e8 e7        	b	0x76 <check_pres_tri_prtouch+0x76> @ imm = #-48
      a4: bb f8 18 20  	ldrh.w	r2, [r11, #24]
      a8: ab f8 e2 32  	strh.w	r3, [r11, #738]
      ac: 00 2a        	cmp	r2, #0
      ae: 00 f0 a8 80  	beq.w	0x202 <check_pres_tri_prtouch+0x202> @ imm = #336
      b2: cd e9 00 3b  	strd	r3, r11, [sp]
      b6: 05 93        	str	r3, [sp, #20]
      b8: 06 e0        	b	0xc8 <check_pres_tri_prtouch+0xc8> @ imm = #12
      ba: 01 9b        	ldr	r3, [sp, #4]
      bc: 00 9a        	ldr	r2, [sp]
      be: 1b 8b        	ldrh	r3, [r3, #24]
      c0: 01 32        	adds	r2, #1
      c2: 9a 42        	cmp	r2, r3
      c4: 00 92        	str	r2, [sp]
      c6: de da        	bge	0x86 <check_pres_tri_prtouch+0x86> @ imm = #-68
      c8: 00 21        	movs	r1, #0
      ca: 00 98        	ldr	r0, [sp]
      cc: ff f7 fe ff  	bl	0xcc <check_pres_tri_prtouch+0xcc> @ imm = #-4
      d0: 01 9b        	ldr	r3, [sp, #4]
      d2: d3 f8 00 43  	ldr.w	r4, [r3, #768]
      d6: d0 e9 3e 89  	ldrd	r8, r9, [r0, #248]
      da: 07 46        	mov	r7, r0
      dc: 20 46        	mov	r0, r4
      de: ff f7 fe ff  	bl	0xde <check_pres_tri_prtouch+0xde> @ imm = #-4
      e2: 02 46        	mov	r2, r0
      e4: 0b 46        	mov	r3, r1
      e6: 40 46        	mov	r0, r8
      e8: 49 46        	mov	r1, r9
      ea: ff f7 fe ff  	bl	0xea <check_pres_tri_prtouch+0xea> @ imm = #-4
      ee: b8 b1        	cbz	r0, 0x120 <check_pres_tri_prtouch+0x120> @ imm = #46
      f0: 60 08        	lsrs	r0, r4, #1
      f2: ff f7 fe ff  	bl	0xf2 <check_pres_tri_prtouch+0xf2> @ imm = #-4
      f6: 02 46        	mov	r2, r0
      f8: 0b 46        	mov	r3, r1
      fa: d7 e9 3c 01  	ldrd	r0, r1, [r7, #240]
      fe: ff f7 fe ff  	bl	0xfe <check_pres_tri_prtouch+0xfe> @ imm = #-4
     102: 68 b1        	cbz	r0, 0x120 <check_pres_tri_prtouch+0x120> @ imm = #26
     104: 42 4b        	ldr	r3, [pc, #264]          @ 0x210 <$d>
     106: a3 fb 04 30  	umull	r3, r0, r3, r4
     10a: 40 08        	lsrs	r0, r0, #1
     10c: ff f7 fe ff  	bl	0x10c <check_pres_tri_prtouch+0x10c> @ imm = #-4
     110: 02 46        	mov	r2, r0
     112: 0b 46        	mov	r3, r1
     114: d7 e9 3a 01  	ldrd	r0, r1, [r7, #232]
     118: ff f7 fe ff  	bl	0x118 <check_pres_tri_prtouch+0x118> @ imm = #-4
     11c: 00 28        	cmp	r0, #0
     11e: 62 d1        	bne	0x1e6 <check_pres_tri_prtouch+0x1e6> @ imm = #196
     120: 01 9b        	ldr	r3, [sp, #4]
     122: d3 f8 c4 30  	ldr.w	r3, [r3, #196]
     126: 1f 2b        	cmp	r3, #31
     128: c7 dd        	ble	0xba <check_pres_tri_prtouch+0xba> @ imm = #-114
     12a: d7 e9 3c ab  	ldrd	r10, r11, [r7, #240]
     12e: 40 46        	mov	r0, r8
     130: 49 46        	mov	r1, r9
     132: 52 46        	mov	r2, r10
     134: 5b 46        	mov	r3, r11
     136: ff f7 fe ff  	bl	0x136 <check_pres_tri_prtouch+0x136> @ imm = #-4
     13a: 00 28        	cmp	r0, #0
     13c: bd d0        	beq	0xba <check_pres_tri_prtouch+0xba> @ imm = #-134
     13e: d7 e9 3a 34  	ldrd	r3, r4, [r7, #232]
     142: 50 46        	mov	r0, r10
     144: cd e9 02 34  	strd	r3, r4, [sp, #8]
     148: 1a 46        	mov	r2, r3
     14a: 59 46        	mov	r1, r11
     14c: 23 46        	mov	r3, r4
     14e: ff f7 fe ff  	bl	0x14e <check_pres_tri_prtouch+0x14e> @ imm = #-4
     152: 00 28        	cmp	r0, #0
     154: b1 d0        	beq	0xba <check_pres_tri_prtouch+0xba> @ imm = #-158
     156: a7 f1 08 06  	sub.w	r6, r7, #8
     15a: 00 23        	movs	r3, #0
     15c: e0 37        	adds	r7, #224
     15e: 04 93        	str	r3, [sp, #16]
     160: 33 46        	mov	r3, r6
     162: 3e 46        	mov	r6, r7
     164: 1f 46        	mov	r7, r3
     166: f7 e9 02 45  	ldrd	r4, r5, [r7, #8]!
     16a: 49 46        	mov	r1, r9
     16c: 22 46        	mov	r2, r4
     16e: 2b 46        	mov	r3, r5
     170: 40 46        	mov	r0, r8
     172: ff f7 fe ff  	bl	0x172 <check_pres_tri_prtouch+0x172> @ imm = #-4
     176: 84 46        	mov	r12, r0
     178: 22 46        	mov	r2, r4
     17a: 2b 46        	mov	r3, r5
     17c: 50 46        	mov	r0, r10
     17e: 59 46        	mov	r1, r11
     180: bc f1 00 0f  	cmp.w	r12, #0
     184: 0f d0        	beq	0x1a6 <check_pres_tri_prtouch+0x1a6> @ imm = #30
     186: ff f7 fe ff  	bl	0x186 <check_pres_tri_prtouch+0x186> @ imm = #-4
     18a: 84 46        	mov	r12, r0
     18c: 22 46        	mov	r2, r4
     18e: dd e9 02 01  	ldrd	r0, r1, [sp, #8]
     192: 2b 46        	mov	r3, r5
     194: bc f1 00 0f  	cmp.w	r12, #0
     198: 05 d0        	beq	0x1a6 <check_pres_tri_prtouch+0x1a6> @ imm = #10
     19a: ff f7 fe ff  	bl	0x19a <check_pres_tri_prtouch+0x19a> @ imm = #-4
     19e: 10 b1        	cbz	r0, 0x1a6 <check_pres_tri_prtouch+0x1a6> @ imm = #4
     1a0: 04 9b        	ldr	r3, [sp, #16]
     1a2: 01 33        	adds	r3, #1
     1a4: 04 93        	str	r3, [sp, #16]
     1a6: be 42        	cmp	r6, r7
     1a8: dd d1        	bne	0x166 <check_pres_tri_prtouch+0x166> @ imm = #-70
     1aa: 04 9b        	ldr	r3, [sp, #16]
     1ac: 1d 2b        	cmp	r3, #29
     1ae: 84 d1        	bne	0xba <check_pres_tri_prtouch+0xba> @ imm = #-248
     1b0: 01 9c        	ldr	r4, [sp, #4]
     1b2: d4 f8 fc 02  	ldr.w	r0, [r4, #764]
     1b6: ff f7 fe ff  	bl	0x1b6 <check_pres_tri_prtouch+0x1b6> @ imm = #-4
     1ba: 02 46        	mov	r2, r0
     1bc: 0b 46        	mov	r3, r1
     1be: 40 46        	mov	r0, r8
     1c0: 49 46        	mov	r1, r9
     1c2: ff f7 fe ff  	bl	0x1c2 <check_pres_tri_prtouch+0x1c2> @ imm = #-4
     1c6: 00 28        	cmp	r0, #0
     1c8: 7f f4 77 af  	bne.w	0xba <check_pres_tri_prtouch+0xba> @ imm = #-274
     1cc: 00 9b        	ldr	r3, [sp]
     1ce: b4 f8 e2 22  	ldrh.w	r2, [r4, #738]
     1d2: 01 20        	movs	r0, #1
     1d4: 00 fa 03 f3  	lsl.w	r3, r0, r3
     1d8: 13 43        	orrs	r3, r2
     1da: 05 9a        	ldr	r2, [sp, #20]
     1dc: a4 f8 e2 32  	strh.w	r3, [r4, #738]
     1e0: 02 44        	add	r2, r0
     1e2: 05 92        	str	r2, [sp, #20]
     1e4: 69 e7        	b	0xba <check_pres_tri_prtouch+0xba> @ imm = #-302
     1e6: 01 99        	ldr	r1, [sp, #4]
     1e8: 00 9b        	ldr	r3, [sp]
     1ea: b1 f8 e2 22  	ldrh.w	r2, [r1, #738]
     1ee: 01 20        	movs	r0, #1
     1f0: 00 fa 03 f3  	lsl.w	r3, r0, r3
     1f4: 13 43        	orrs	r3, r2
     1f6: 05 9a        	ldr	r2, [sp, #20]
     1f8: a1 f8 e2 32  	strh.w	r3, [r1, #738]
     1fc: 02 44        	add	r2, r0
     1fe: 05 92        	str	r2, [sp, #20]
     200: 5b e7        	b	0xba <check_pres_tri_prtouch+0xba> @ imm = #-330
     202: 00 23        	movs	r3, #0
     204: 05 93        	str	r3, [sp, #20]
     206: 05 98        	ldr	r0, [sp, #20]
     208: 07 b0        	add	sp, #28
     20a: bd e8 f0 8f  	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
     20e: 00 bf        	nop

00000210 <$d>:
     210:	ab aa aa aa	.word	0xaaaaaaab
     214:	00 00 00 00	.word	0x00000000

Disassembly of section .text.command_config_pres_prtouch:

00000000 <command_config_pres_prtouch>:
       0: 0f 4b        	ldr	r3, [pc, #60]           @ 0x40 <$d>
       2: 02 68        	ldr	r2, [r0]
       4: 70 b5        	push	{r4, r5, r6, lr}
       6: 1a 80        	strh	r2, [r3]
       8: d0 e9 01 12  	ldrd	r1, r2, [r0, #4]
       c: 04 46        	mov	r4, r0
       e: 00 69        	ldr	r0, [r0, #16]
      10: 1a 83        	strh	r2, [r3, #24]
      12: 59 83        	strh	r1, [r3, #26]
      14: ff f7 fe ff  	bl	0x14 <command_config_pres_prtouch+0x14> @ imm = #-4
      18: 0a 49        	ldr	r1, [pc, #40]           @ 0x44 <$d+0x4>
      1a: 0b 4e        	ldr	r6, [pc, #44]           @ 0x48 <$d+0x8>
      1c: 0b 4d        	ldr	r5, [pc, #44]           @ 0x4c <$d+0xc>
      1e: ff f7 fe ff  	bl	0x1e <command_config_pres_prtouch+0x1e> @ imm = #-4
      22: 00 21        	movs	r1, #0
      24: 03 46        	mov	r3, r0
      26: 20 7b        	ldrb	r0, [r4, #12]
      28: b3 61        	str	r3, [r6, #24]
      2a: ff f7 fe ff  	bl	0x2a <command_config_pres_prtouch+0x2a> @ imm = #-4
      2e: 00 21        	movs	r1, #0
      30: 28 60        	str	r0, [r5]
      32: ff f7 fe ff  	bl	0x32 <command_config_pres_prtouch+0x32> @ imm = #-4
      36: 20 46        	mov	r0, r4
      38: bd e8 70 40  	pop.w	{r4, r5, r6, lr}
      3c: ff f7 fe bf  	b.w	0x3c <command_config_pres_prtouch+0x3c> @ imm = #-4

00000040 <$d>:
      40:	00 00 00 00	.word	0x00000000
      44:	00 50 c3 47	.word	0x47c35000
      48:	00 00 00 00	.word	0x00000000
      4c:	00 00 00 00	.word	0x00000000

Disassembly of section .text.command_add_pres_prtouch:

00000000 <command_add_pres_prtouch>:
       0: f8 b5        	push	{r3, r4, r5, r6, r7, lr}
       2: 12 4d        	ldr	r5, [pc, #72]           @ 0x4c <$d>
       4: 43 68        	ldr	r3, [r0, #4]
       6: 6e 8b        	ldrh	r6, [r5, #26]
       8: 04 46        	mov	r4, r0
       a: 00 7a        	ldrb	r0, [r0, #8]
       c: 56 b1        	cbz	r6, 0x24 <command_add_pres_prtouch+0x24> @ imm = #20
       e: 06 33        	adds	r3, #6
      10: 05 eb 83 05  	add.w	r5, r5, r3, lsl #2
      14: ff f7 fe ff  	bl	0x14 <command_add_pres_prtouch+0x14> @ imm = #-4
      18: 68 60        	str	r0, [r5, #4]
      1a: 20 46        	mov	r0, r4
      1c: bd e8 f8 40  	pop.w	{r3, r4, r5, r6, r7, lr}
      20: ff f7 fe bf  	b.w	0x20 <command_add_pres_prtouch+0x20> @ imm = #-4
      24: 0a 33        	adds	r3, #10
      26: 31 46        	mov	r1, r6
      28: 05 eb 83 07  	add.w	r7, r5, r3, lsl #2
      2c: ff f7 fe ff  	bl	0x2c <command_add_pres_prtouch+0x2c> @ imm = #-4
      30: 78 60        	str	r0, [r7, #4]
      32: 63 68        	ldr	r3, [r4, #4]
      34: 20 7b        	ldrb	r0, [r4, #12]
      36: 31 46        	mov	r1, r6
      38: 1d 44        	add	r5, r3
      3a: ff f7 fe ff  	bl	0x3a <command_add_pres_prtouch+0x3a> @ imm = #-4
      3e: 85 f8 3c 00  	strb.w	r0, [r5, #60]
      42: 20 46        	mov	r0, r4
      44: bd e8 f8 40  	pop.w	{r3, r4, r5, r6, r7, lr}
      48: ff f7 fe bf  	b.w	0x48 <command_add_pres_prtouch+0x48> @ imm = #-4

0000004c <$d>:
      4c:	00 00 00 00	.word	0x00000000

Disassembly of section .text.command_write_swap_prtouch:

00000000 <command_write_swap_prtouch>:
       0: 09 4b        	ldr	r3, [pc, #36]           @ 0x28 <$d>
       2: 01 79        	ldrb	r1, [r0, #4]
       4: 10 b5        	push	{r4, lr}
       6: 04 46        	mov	r4, r0
       8: 18 68        	ldr	r0, [r3]
       a: ff f7 fe ff  	bl	0xa <command_write_swap_prtouch+0xa> @ imm = #-4
       e: 20 46        	mov	r0, r4
      10: ff f7 fe ff  	bl	0x10 <command_write_swap_prtouch+0x10> @ imm = #-4
      14: 05 48        	ldr	r0, [pc, #20]           @ 0x2c <$d+0x4>
      16: ff f7 fe ff  	bl	0x16 <command_write_swap_prtouch+0x16> @ imm = #-4
      1a: 05 4b        	ldr	r3, [pc, #20]           @ 0x30 <$d+0x8>
      1c: bd e8 10 40  	pop.w	{r4, lr}
      20: 19 88        	ldrh	r1, [r3]
      22: ff f7 fe bf  	b.w	0x22 <command_write_swap_prtouch+0x22> @ imm = #-4
      26: 00 bf        	nop

00000028 <$d>:
      28:	00 00 00 00	.word	0x00000000
      2c:	00 00 00 00	.word	0x00000000
      30:	00 00 00 00	.word	0x00000000

Disassembly of section .text.command_read_pres_prtouch:

00000000 <command_read_pres_prtouch>:
       0: f8 b5        	push	{r3, r4, r5, r6, r7, lr}
       2: 83 68        	ldr	r3, [r0, #8]
       4: 3b b3        	cbz	r3, 0x56 <command_read_pres_prtouch+0x56> @ imm = #78
       6: 1a 4e        	ldr	r6, [pc, #104]          @ 0x70 <$d>
       8: 32 68        	ldr	r2, [r6]
       a: 04 46        	mov	r4, r0
       c: fa b1        	cbz	r2, 0x4e <command_read_pres_prtouch+0x4e> @ imm = #62
       e: d6 e9 04 67  	ldrd	r6, r7, [r6, #16]
      12: 18 4d        	ldr	r5, [pc, #96]           @ 0x74 <$d+0x4>
      14: 62 68        	ldr	r2, [r4, #4]
      16: a5 f8 dc 22  	strh.w	r2, [r5, #732]
      1a: 4f f0 00 0c  	mov.w	r12, #0
      1e: a5 f8 e0 32  	strh.w	r3, [r5, #736]
      22: c5 e9 04 67  	strd	r6, r7, [r5, #16]
      26: d5 e9 02 23  	ldrd	r2, r3, [r5, #8]
      2a: 30 46        	mov	r0, r6
      2c: 39 46        	mov	r1, r7
      2e: a5 f8 de c2  	strh.w	r12, [r5, #734]
      32: ff f7 fe ff  	bl	0x32 <command_read_pres_prtouch+0x32> @ imm = #-4
      36: 00 22        	movs	r2, #0
      38: 00 23        	movs	r3, #0
      3a: ff f7 fe ff  	bl	0x3a <command_read_pres_prtouch+0x3a> @ imm = #-4
      3e: 08 b9        	cbnz	r0, 0x44 <command_read_pres_prtouch+0x44> @ imm = #2
      40: c5 e9 02 67  	strd	r6, r7, [r5, #8]
      44: 20 46        	mov	r0, r4
      46: bd e8 f8 40  	pop.w	{r3, r4, r5, r6, r7, lr}
      4a: ff f7 fe bf  	b.w	0x4a <command_read_pres_prtouch+0x4a> @ imm = #-4
      4e: ff f7 fe ff  	bl	0x4e <command_read_pres_prtouch+0x4e> @ imm = #-4
      52: a3 68        	ldr	r3, [r4, #8]
      54: db e7        	b	0xe <command_read_pres_prtouch+0xe> @ imm = #-74
      56: 06 4a        	ldr	r2, [pc, #24]           @ 0x70 <$d>
      58: 06 49        	ldr	r1, [pc, #24]           @ 0x74 <$d+0x4>
      5a: 12 68        	ldr	r2, [r2]
      5c: a1 f8 e0 32  	strh.w	r3, [r1, #736]
      60: 01 2a        	cmp	r2, #1
      62: 00 d0        	beq	0x66 <command_read_pres_prtouch+0x66> @ imm = #0
      64: f8 bd        	pop	{r3, r4, r5, r6, r7, pc}
      66: bd e8 f8 40  	pop.w	{r3, r4, r5, r6, r7, lr}
      6a: ff f7 fe bf  	b.w	0x6a <command_read_pres_prtouch+0x6a> @ imm = #-4
      6e: 00 bf        	nop

00000070 <$d>:
      70:	00 00 00 00	.word	0x00000000
      74:	00 00 00 00	.word	0x00000000

Disassembly of section .text.command_deal_avgs_prtouch:

00000000 <command_deal_avgs_prtouch>:
       0: 2d e9 f0 4f  	push.w	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
       4: 61 4f        	ldr	r7, [pc, #388]          @ 0x18c <$d>
       6: 87 b0        	sub	sp, #28
       8: 80 46        	mov	r8, r0
       a: ff f7 fe ff  	bl	0xa <command_deal_avgs_prtouch+0xa> @ imm = #-4
       e: 3b 68        	ldr	r3, [r7]
      10: 0b b9        	cbnz	r3, 0x16 <command_deal_avgs_prtouch+0x16> @ imm = #2
      12: ff f7 fe ff  	bl	0x12 <command_deal_avgs_prtouch+0x12> @ imm = #-4
      16: 5e 4e        	ldr	r6, [pc, #376]          @ 0x190 <$d+0x4>
      18: 74 8b        	ldrh	r4, [r6, #26]
      1a: 00 23        	movs	r3, #0
      1c: c6 e9 c4 33  	strd	r3, r3, [r6, #784]
      20: c6 f8 18 33  	str.w	r3, [r6, #792]
      24: c6 f8 0c 33  	str.w	r3, [r6, #780]
      28: 00 2c        	cmp	r4, #0
      2a: 40 f0 9a 80  	bne.w	0x162 <command_deal_avgs_prtouch+0x162> @ imm = #308
      2e: d8 f8 04 50  	ldr.w	r5, [r8, #4]
      32: 00 2d        	cmp	r5, #0
      34: 00 f0 95 80  	beq.w	0x162 <command_deal_avgs_prtouch+0x162> @ imm = #298
      38: 33 8b        	ldrh	r3, [r6, #24]
      3a: 93 b1        	cbz	r3, 0x62 <command_deal_avgs_prtouch+0x62> @ imm = #36
      3c: 25 46        	mov	r5, r4
      3e: 06 f1 c8 03  	add.w	r3, r6, #200
      42: 80 22        	movs	r2, #128
      44: 18 46        	mov	r0, r3
      46: 43 f8 04 5c  	str	r5, [r3, #-4]
      4a: 00 21        	movs	r1, #0
      4c: ff f7 fe ff  	bl	0x4c <command_deal_avgs_prtouch+0x4c> @ imm = #-4
      50: 32 8b        	ldrh	r2, [r6, #24]
      52: 01 34        	adds	r4, #1
      54: 03 46        	mov	r3, r0
      56: a2 42        	cmp	r2, r4
      58: 03 f1 84 03  	add.w	r3, r3, #132
      5c: f1 dc        	bgt	0x42 <command_deal_avgs_prtouch+0x42> @ imm = #-30
      5e: d8 f8 04 50  	ldr.w	r5, [r8, #4]
      62: 20 2d        	cmp	r5, #32
      64: a8 bf        	it	ge
      66: 20 25        	movge	r5, #32
      68: 4f f0 00 08  	mov.w	r8, #0
      6c: 08 2d        	cmp	r5, #8
      6e: b8 bf        	it	lt
      70: 08 25        	movlt	r5, #8
      72: 44 46        	mov	r4, r8
      74: cd e9 02 44  	strd	r4, r4, [sp, #8]
      78: cd e9 04 44  	strd	r4, r4, [sp, #16]
      7c: 02 a8        	add	r0, sp, #8
      7e: ff f7 fe ff  	bl	0x7e <command_deal_avgs_prtouch+0x7e> @ imm = #-4
      82: 00 28        	cmp	r0, #0
      84: fa d0        	beq	0x7c <command_deal_avgs_prtouch+0x7c> @ imm = #-12
      86: b6 f8 18 c0  	ldrh.w	r12, [r6, #24]
      8a: bc f1 00 0f  	cmp.w	r12, #0
      8e: 1d d0        	beq	0xcc <command_deal_avgs_prtouch+0xcc> @ imm = #58
      90: 3f 48        	ldr	r0, [pc, #252]          @ 0x190 <$d+0x4>
      92: 0d f1 08 0e  	add.w	lr, sp, #8
      96: 00 21        	movs	r1, #0
      98: d0 f8 c4 30  	ldr.w	r3, [r0, #196]
      9c: 5e f8 04 9b  	ldr	r9, [lr], #4
      a0: 5a 42        	rsbs	r2, r3, #0
      a2: 02 f0 1f 02  	and	r2, r2, #31
      a6: 03 f0 1f 0a  	and	r10, r3, #31
      aa: 58 bf        	it	pl
      ac: c2 f1 00 0a  	rsbpl.w	r10, r2, #0
      b0: 01 eb 41 12  	add.w	r2, r1, r1, lsl #5
      b4: 52 44        	add	r2, r10
      b6: 06 eb 82 02  	add.w	r2, r6, r2, lsl #2
      ba: 01 31        	adds	r1, #1
      bc: 01 33        	adds	r3, #1
      be: 61 45        	cmp	r1, r12
      c0: c2 f8 c8 90  	str.w	r9, [r2, #200]
      c4: 00 f1 84 00  	add.w	r0, r0, #132
      c8: 03 64        	str	r3, [r0, #64]
      ca: e5 db        	blt	0x98 <command_deal_avgs_prtouch+0x98> @ imm = #-54
      cc: 08 f1 01 08  	add.w	r8, r8, #1
      d0: 45 45        	cmp	r5, r8
      d2: cf d1        	bne	0x74 <command_deal_avgs_prtouch+0x74> @ imm = #-98
      d4: bc f1 00 0f  	cmp.w	r12, #0
      d8: 43 d0        	beq	0x162 <command_deal_avgs_prtouch+0x162> @ imm = #134
      da: 2e 4c        	ldr	r4, [pc, #184]          @ 0x194 <$d+0x8>
      dc: c5 eb 85 78  	rsb	r8, r5, r5, lsl #30
      e0: 04 eb 85 04  	add.w	r4, r4, r5, lsl #2
      e4: 4f ea 88 08  	lsl.w	r8, r8, #2
      e8: 4f ea 85 09  	lsl.w	r9, r5, #2
      ec: 0c eb 4c 1b  	add.w	r11, r12, r12, lsl #5
      f0: 4f f0 00 0a  	mov.w	r10, #0
      f4: 04 eb 08 00  	add.w	r0, r4, r8
      f8: 4f f0 00 0e  	mov.w	lr, #0
      fc: 75 45        	cmp	r5, lr
      fe: c8 bf        	it	gt
     100: 03 46        	movgt	r3, r0
     102: 08 dd        	ble	0x116 <command_deal_avgs_prtouch+0x116> @ imm = #16
     104: 53 f8 04 1f  	ldr	r1, [r3, #4]!
     108: 42 68        	ldr	r2, [r0, #4]
     10a: 8a 42        	cmp	r2, r1
     10c: 84 bf        	itt	hi
     10e: 41 60        	strhi	r1, [r0, #4]
     110: 1a 60        	strhi	r2, [r3]
     112: a3 42        	cmp	r3, r4
     114: f6 d1        	bne	0x104 <command_deal_avgs_prtouch+0x104> @ imm = #-20
     116: 0e f1 01 0e  	add.w	lr, lr, #1
     11a: 75 45        	cmp	r5, lr
     11c: 00 f1 04 00  	add.w	r0, r0, #4
     120: ec d1        	bne	0xfc <command_deal_avgs_prtouch+0xfc> @ imm = #-40
     122: 0a f1 21 0a  	add.w	r10, r10, #33
     126: da 45        	cmp	r10, r11
     128: 04 f1 84 04  	add.w	r4, r4, #132
     12c: e2 d1        	bne	0xf4 <command_deal_avgs_prtouch+0xf4> @ imm = #-60
     12e: 1a 4c        	ldr	r4, [pc, #104]          @ 0x198 <$d+0xc>
     130: a4 f5 14 70  	sub.w	r0, r4, #592
     134: 04 3d        	subs	r5, #4
     136: 08 f1 10 08  	add.w	r8, r8, #16
     13a: 04 eb 8c 0c  	add.w	r12, r4, r12, lsl #2
     13e: 48 44        	add	r0, r9
     140: 54 f8 04 2b  	ldr	r2, [r4], #4
     144: 08 eb 00 03  	add.w	r3, r8, r0
     148: 53 f8 04 1f  	ldr	r1, [r3, #4]!
     14c: 83 42        	cmp	r3, r0
     14e: 0a 44        	add	r2, r1
     150: fa d1        	bne	0x148 <command_deal_avgs_prtouch+0x148> @ imm = #-12
     152: 92 fb f5 f2  	sdiv	r2, r2, r5
     156: a4 45        	cmp	r12, r4
     158: 00 f1 84 00  	add.w	r0, r0, #132
     15c: 44 f8 04 2c  	str	r2, [r4, #-4]
     160: ee d1        	bne	0x140 <command_deal_avgs_prtouch+0x140> @ imm = #-36
     162: 3b 68        	ldr	r3, [r7]
     164: 01 2b        	cmp	r3, #1
     166: 0e d0        	beq	0x186 <command_deal_avgs_prtouch+0x186> @ imm = #28
     168: 0c 48        	ldr	r0, [pc, #48]           @ 0x19c <$d+0x10>
     16a: ff f7 fe ff  	bl	0x16a <command_deal_avgs_prtouch+0x16a> @ imm = #-4
     16e: d6 e9 c5 32  	ldrd	r3, r2, [r6, #788]
     172: 31 88        	ldrh	r1, [r6]
     174: cd e9 00 32  	strd	r3, r2, [sp]
     178: d6 e9 c3 23  	ldrd	r2, r3, [r6, #780]
     17c: ff f7 fe ff  	bl	0x17c <command_deal_avgs_prtouch+0x17c> @ imm = #-4
     180: 07 b0        	add	sp, #28
     182: bd e8 f0 8f  	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
     186: ff f7 fe ff  	bl	0x186 <command_deal_avgs_prtouch+0x186> @ imm = #-4
     18a: ed e7        	b	0x168 <command_deal_avgs_prtouch+0x168> @ imm = #-38

0000018c <$d>:
     18c:	00 00 00 00	.word	0x00000000
     190:	00 00 00 00	.word	0x00000000
     194:	c4 00 00 00	.word	0x000000c4
     198:	0c 03 00 00	.word	0x0000030c
     19c:	00 00 00 00	.word	0x00000000

Disassembly of section .text.command_start_pres_prtouch:

00000000 <command_start_pres_prtouch>:
       0: f8 b5        	push	{r3, r4, r5, r6, r7, lr}
       2: 05 46        	mov	r5, r0
       4: ff f7 fe ff  	bl	0x4 <command_start_pres_prtouch+0x4> @ imm = #-4
       8: 3d 4b        	ldr	r3, [pc, #244]          @ 0x100 <$d+0x8>
       a: 00 21        	movs	r1, #0
       c: 18 68        	ldr	r0, [r3]
       e: ff f7 fe ff  	bl	0xe <command_start_pres_prtouch+0xe> @ imm = #-4
      12: 2b 69        	ldr	r3, [r5, #16]
      14: 00 2b        	cmp	r3, #0
      16: 62 d0        	beq	0xde <command_start_pres_prtouch+0xde> @ imm = #196
      18: 3a 4e        	ldr	r6, [pc, #232]          @ 0x104 <$d+0xc>
      1a: 33 68        	ldr	r3, [r6]
      1c: 00 2b        	cmp	r3, #0
      1e: 5b d0        	beq	0xd8 <command_start_pres_prtouch+0xd8> @ imm = #182
      20: 6b 68        	ldr	r3, [r5, #4]
      22: 39 4c        	ldr	r4, [pc, #228]          @ 0x108 <$d+0x10>
      24: 00 2b        	cmp	r3, #0
      26: 0c bf        	ite	eq
      28: 00 23        	moveq	r3, #0
      2a: 1f 23        	movne	r3, #31
      2c: 80 22        	movs	r2, #128
      2e: 00 21        	movs	r1, #0
      30: 04 f1 44 00  	add.w	r0, r4, #68
      34: 23 64        	str	r3, [r4, #64]
      36: ff f7 fe ff  	bl	0x36 <command_start_pres_prtouch+0x36> @ imm = #-4
      3a: 2f a3        	adr	r3, #188 <command_start_pres_prtouch+0x6d>
      3c: d3 e9 00 23  	ldrd	r2, r3, [r3]
      40: d6 e9 04 01  	ldrd	r0, r1, [r6, #16]
      44: ff f7 fe ff  	bl	0x44 <command_start_pres_prtouch+0x44> @ imm = #-4
      48: ff f7 fe ff  	bl	0x48 <command_start_pres_prtouch+0x48> @ imm = #-4
      4c: 04 f1 40 03  	add.w	r3, r4, #64
      50: 04 f1 c0 02  	add.w	r2, r4, #192
      54: 43 f8 04 0f  	str	r0, [r3, #4]!
      58: 9a 42        	cmp	r2, r3
      5a: fb d1        	bne	0x54 <command_start_pres_prtouch+0x54> @ imm = #-10
      5c: 23 8b        	ldrh	r3, [r4, #24]
      5e: a3 b1        	cbz	r3, 0x8a <command_start_pres_prtouch+0x8a> @ imm = #40
      60: 2a 4b        	ldr	r3, [pc, #168]          @ 0x10c <$d+0x14>
      62: 00 26        	movs	r6, #0
      64: 6a 68        	ldr	r2, [r5, #4]
      66: 00 2a        	cmp	r2, #0
      68: 0c bf        	ite	eq
      6a: 00 27        	moveq	r7, #0
      6c: 1f 27        	movne	r7, #31
      6e: 80 22        	movs	r2, #128
      70: 18 46        	mov	r0, r3
      72: 43 f8 04 7c  	str	r7, [r3, #-4]
      76: 00 21        	movs	r1, #0
      78: ff f7 fe ff  	bl	0x78 <command_start_pres_prtouch+0x78> @ imm = #-4
      7c: 22 8b        	ldrh	r2, [r4, #24]
      7e: 01 36        	adds	r6, #1
      80: 03 46        	mov	r3, r0
      82: 96 42        	cmp	r6, r2
      84: 03 f1 84 03  	add.w	r3, r3, #132
      88: ec db        	blt	0x64 <command_start_pres_prtouch+0x64> @ imm = #-40
      8a: d5 e9 03 23  	ldrd	r2, r3, [r5, #12]
      8e: 69 68        	ldr	r1, [r5, #4]
      90: 68 69        	ldr	r0, [r5, #20]
      92: a4 f8 ec 22  	strh.w	r2, [r4, #748]
      96: a4 f8 f8 32  	strh.w	r3, [r4, #760]
      9a: a4 f8 e4 12  	strh.w	r1, [r4, #740]
      9e: ff f7 fe ff  	bl	0x9e <command_start_pres_prtouch+0x9e> @ imm = #-4
      a2: 1b 49        	ldr	r1, [pc, #108]          @ 0x110 <$d+0x18>
      a4: ff f7 fe ff  	bl	0xa4 <command_start_pres_prtouch+0xa4> @ imm = #-4
      a8: 03 46        	mov	r3, r0
      aa: a8 69        	ldr	r0, [r5, #24]
      ac: c4 f8 f0 32  	str.w	r3, [r4, #752]
      b0: ff f7 fe ff  	bl	0xb0 <command_start_pres_prtouch+0xb0> @ imm = #-4
      b4: 16 49        	ldr	r1, [pc, #88]           @ 0x110 <$d+0x18>
      b6: ff f7 fe ff  	bl	0xb6 <command_start_pres_prtouch+0xb6> @ imm = #-4
      ba: eb 69        	ldr	r3, [r5, #28]
      bc: c4 f8 fc 32  	str.w	r3, [r4, #764]
      c0: 2b 6a        	ldr	r3, [r5, #32]
      c2: c4 f8 00 33  	str.w	r3, [r4, #768]
      c6: 00 23        	movs	r3, #0
      c8: c4 e9 b5 33  	strd	r3, r3, [r4, #724]
      cc: ab 68        	ldr	r3, [r5, #8]
      ce: a4 f8 ee 32  	strh.w	r3, [r4, #750]
      d2: c4 f8 f4 02  	str.w	r0, [r4, #756]
      d6: f8 bd        	pop	{r3, r4, r5, r6, r7, pc}
      d8: ff f7 fe ff  	bl	0xd8 <command_start_pres_prtouch+0xd8> @ imm = #-4
      dc: a0 e7        	b	0x20 <command_start_pres_prtouch+0x20> @ imm = #-192
      de: 09 4a        	ldr	r2, [pc, #36]           @ 0x104 <$d+0xc>
      e0: 09 49        	ldr	r1, [pc, #36]           @ 0x108 <$d+0x10>
      e2: 12 68        	ldr	r2, [r2]
      e4: a1 f8 ee 32  	strh.w	r3, [r1, #750]
      e8: 01 2a        	cmp	r2, #1
      ea: f4 d1        	bne	0xd6 <command_start_pres_prtouch+0xd6> @ imm = #-24
      ec: bd e8 f8 40  	pop.w	{r3, r4, r5, r6, r7, lr}
      f0: ff f7 fe bf  	b.w	0xf0 <command_start_pres_prtouch+0xf0> @ imm = #-4
      f4: af f3 00 80  	nop.w

000000f8 <$d>:
      f8:	00 00 00 00	.word	0x00000000
      fc:	00 88 c3 40	.word	0x40c38800
     100:	00 00 00 00	.word	0x00000000
     104:	00 00 00 00	.word	0x00000000
     108:	00 00 00 00	.word	0x00000000
     10c:	c8 00 00 00	.word	0x000000c8
     110:	00 00 7a 44	.word	0x447a0000

Disassembly of section .text.command_manual_get_pres:

00000000 <command_manual_get_pres>:
       0: 70 b5        	push	{r4, r5, r6, lr}
       2: 03 46        	mov	r3, r0
       4: 8c b0        	sub	sp, #48
       6: 1e 48        	ldr	r0, [pc, #120]          @ 0x80 <$d>
       8: 5c 68        	ldr	r4, [r3, #4]
       a: ff f7 fe ff  	bl	0xa <command_manual_get_pres+0xa> @ imm = #-4
       e: 1d 49        	ldr	r1, [pc, #116]          @ 0x84 <$d+0x4>
      10: 01 eb 84 06  	add.w	r6, r1, r4, lsl #2
      14: 35 46        	mov	r5, r6
      16: 32 46        	mov	r2, r6
      18: d5 f8 4c 51  	ldr.w	r5, [r5, #332]
      1c: d2 f8 c8 20  	ldr.w	r2, [r2, #200]
      20: 33 46        	mov	r3, r6
      22: d6 f8 d0 61  	ldr.w	r6, [r6, #464]
      26: 5b 6c        	ldr	r3, [r3, #68]
      28: 02 93        	str	r3, [sp, #8]
      2a: cd e9 04 56  	strd	r5, r6, [sp, #16]
      2e: 01 eb 84 06  	add.w	r6, r1, r4, lsl #2
      32: 03 92        	str	r2, [sp, #12]
      34: 35 46        	mov	r5, r6
      36: 32 46        	mov	r2, r6
      38: 33 46        	mov	r3, r6
      3a: d6 f8 58 62  	ldr.w	r6, [r6, #600]
      3e: d5 f8 d4 51  	ldr.w	r5, [r5, #468]
      42: d2 f8 50 21  	ldr.w	r2, [r2, #336]
      46: d3 f8 cc 30  	ldr.w	r3, [r3, #204]
      4a: 0b 96        	str	r6, [sp, #44]
      4c: 01 eb 84 06  	add.w	r6, r1, r4, lsl #2
      50: 0a 95        	str	r5, [sp, #40]
      52: 35 46        	mov	r5, r6
      54: b6 6c        	ldr	r6, [r6, #72]
      56: d5 f8 54 52  	ldr.w	r5, [r5, #596]
      5a: 09 92        	str	r2, [sp, #36]
      5c: 08 93        	str	r3, [sp, #32]
      5e: d1 f8 04 33  	ldr.w	r3, [r1, #772]
      62: 01 93        	str	r3, [sp, #4]
      64: 91 f8 e2 32  	ldrb.w	r3, [r1, #738]
      68: 00 93        	str	r3, [sp]
      6a: d1 f8 d8 32  	ldr.w	r3, [r1, #728]
      6e: 09 78        	ldrb	r1, [r1]
      70: 22 46        	mov	r2, r4
      72: cd e9 06 56  	strd	r5, r6, [sp, #24]
      76: ff f7 fe ff  	bl	0x76 <command_manual_get_pres+0x76> @ imm = #-4
      7a: 0c b0        	add	sp, #48
      7c: 70 bd        	pop	{r4, r5, r6, pc}
      7e: 00 bf        	nop

00000080 <$d>:
      80:	00 00 00 00	.word	0x00000000
      84:	00 00 00 00	.word	0x00000000

Disassembly of section .text.prtouch_pres_task:

00000000 <prtouch_pres_task>:
       0: 2d e9 f0 4f  	push.w	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
       4: b2 4c        	ldr	r4, [pc, #712]          @ 0x2d0 <$d+0x8>
       6: b4 f8 ee 52  	ldrh.w	r5, [r4, #750]
       a: 91 b0        	sub	sp, #68
       c: 00 23        	movs	r3, #0
       e: cd e9 0c 33  	strd	r3, r3, [sp, #48]
      12: cd e9 0e 33  	strd	r3, r3, [sp, #56]
      16: 00 2d        	cmp	r5, #0
      18: 00 f0 8e 80  	beq.w	0x138 <prtouch_pres_task+0x138> @ imm = #284
      1c: 63 8b        	ldrh	r3, [r4, #26]
      1e: fb b1        	cbz	r3, 0x60 <prtouch_pres_task+0x60> @ imm = #62
      20: ac 4b        	ldr	r3, [pc, #688]          @ 0x2d4 <$d+0xc>
      22: d3 e9 04 67  	ldrd	r6, r7, [r3, #16]
      26: d4 e9 02 23  	ldrd	r2, r3, [r4, #8]
      2a: c4 e9 04 67  	strd	r6, r7, [r4, #16]
      2e: 30 46        	mov	r0, r6
      30: 39 46        	mov	r1, r7
      32: ff f7 fe ff  	bl	0x32 <prtouch_pres_task+0x32> @ imm = #-4
      36: 80 46        	mov	r8, r0
      38: 28 46        	mov	r0, r5
      3a: 89 46        	mov	r9, r1
      3c: ff f7 fe ff  	bl	0x3c <prtouch_pres_task+0x3c> @ imm = #-4
      40: a5 49        	ldr	r1, [pc, #660]          @ 0x2d8 <$d+0x10>
      42: ff f7 fe ff  	bl	0x42 <prtouch_pres_task+0x42> @ imm = #-4
      46: ff f7 fe ff  	bl	0x46 <prtouch_pres_task+0x46> @ imm = #-4
      4a: 02 46        	mov	r2, r0
      4c: 0b 46        	mov	r3, r1
      4e: 40 46        	mov	r0, r8
      50: 49 46        	mov	r1, r9
      52: ff f7 fe ff  	bl	0x52 <prtouch_pres_task+0x52> @ imm = #-4
      56: 00 28        	cmp	r0, #0
      58: 40 f0 2a 81  	bne.w	0x2b0 <prtouch_pres_task+0x2b0> @ imm = #596
      5c: c4 e9 02 67  	strd	r6, r7, [r4, #8]
      60: 0c a8        	add	r0, sp, #48
      62: ff f7 fe ff  	bl	0x62 <prtouch_pres_task+0x62> @ imm = #-4
      66: 00 28        	cmp	r0, #0
      68: 00 f0 22 81  	beq.w	0x2b0 <prtouch_pres_task+0x2b0> @ imm = #580
      6c: 26 6c        	ldr	r6, [r4, #64]
      6e: 99 4d        	ldr	r5, [pc, #612]          @ 0x2d4 <$d+0xc>
      70: 73 42        	rsbs	r3, r6, #0
      72: 03 f0 1f 03  	and	r3, r3, #31
      76: 06 f0 1f 07  	and	r7, r6, #31
      7a: d5 e9 04 01  	ldrd	r0, r1, [r5, #16]
      7e: 58 bf        	it	pl
      80: 5f 42        	rsbpl	r7, r3, #0
      82: 91 a3        	adr	r3, #580 <prtouch_pres_task+0x117>
      84: d3 e9 00 23  	ldrd	r2, r3, [r3]
      88: ff f7 fe ff  	bl	0x88 <prtouch_pres_task+0x88> @ imm = #-4
      8c: ff f7 fe ff  	bl	0x8c <prtouch_pres_task+0x8c> @ imm = #-4
      90: 04 eb 87 07  	add.w	r7, r4, r7, lsl #2
      94: b4 f8 18 e0  	ldrh.w	lr, [r4, #24]
      98: 78 64        	str	r0, [r7, #68]
      9a: 01 36        	adds	r6, #1
      9c: 26 64        	str	r6, [r4, #64]
      9e: be f1 00 0f  	cmp.w	lr, #0
      a2: 1b d0        	beq	0xdc <prtouch_pres_task+0xdc> @ imm = #54
      a4: 8a 4e        	ldr	r6, [pc, #552]          @ 0x2d0 <$d+0x8>
      a6: 0c aa        	add	r2, sp, #48
      a8: 00 20        	movs	r0, #0
      aa: d6 f8 c4 30  	ldr.w	r3, [r6, #196]
      ae: 52 f8 04 cb  	ldr	r12, [r2], #4
      b2: 59 42        	rsbs	r1, r3, #0
      b4: 01 f0 1f 01  	and	r1, r1, #31
      b8: 03 f0 1f 07  	and	r7, r3, #31
      bc: 58 bf        	it	pl
      be: 4f 42        	rsbpl	r7, r1, #0
      c0: 00 eb 40 11  	add.w	r1, r0, r0, lsl #5
      c4: 39 44        	add	r1, r7
      c6: 04 eb 81 01  	add.w	r1, r4, r1, lsl #2
      ca: 01 30        	adds	r0, #1
      cc: 01 33        	adds	r3, #1
      ce: 70 45        	cmp	r0, lr
      d0: c1 f8 c8 c0  	str.w	r12, [r1, #200]
      d4: 06 f1 84 06  	add.w	r6, r6, #132
      d8: 33 64        	str	r3, [r6, #64]
      da: e6 db        	blt	0xaa <prtouch_pres_task+0xaa> @ imm = #-52
      dc: ff f7 fe ff  	bl	0xdc <prtouch_pres_task+0xdc> @ imm = #-4
      e0: b4 f8 f8 32  	ldrh.w	r3, [r4, #760]
      e4: 83 42        	cmp	r3, r0
      e6: 00 f3 e3 80  	bgt.w	0x2b0 <prtouch_pres_task+0x2b0> @ imm = #454
      ea: b4 f8 e2 32  	ldrh.w	r3, [r4, #738]
      ee: 00 2b        	cmp	r3, #0
      f0: 00 f0 de 80  	beq.w	0x2b0 <prtouch_pres_task+0x2b0> @ imm = #444
      f4: 00 26        	movs	r6, #0
      f6: 74 a3        	adr	r3, #464 <prtouch_pres_task+0x16e>
      f8: d3 e9 00 23  	ldrd	r2, r3, [r3]
      fc: d5 e9 04 01  	ldrd	r0, r1, [r5, #16]
     100: a4 f8 ee 62  	strh.w	r6, [r4, #750]
     104: ff f7 fe ff  	bl	0x104 <prtouch_pres_task+0x104> @ imm = #-4
     108: ff f7 fe ff  	bl	0x108 <prtouch_pres_task+0x108> @ imm = #-4
     10c: 73 4b        	ldr	r3, [pc, #460]          @ 0x2dc <$d+0x14>
     10e: c4 f8 d8 02  	str.w	r0, [r4, #728]
     112: 01 21        	movs	r1, #1
     114: 18 68        	ldr	r0, [r3]
     116: ff f7 fe ff  	bl	0x116 <prtouch_pres_task+0x116> @ imm = #-4
     11a: 23 8b        	ldrh	r3, [r4, #24]
     11c: 3b b1        	cbz	r3, 0x12e <prtouch_pres_task+0x12e> @ imm = #14
     11e: 30 46        	mov	r0, r6
     120: 01 21        	movs	r1, #1
     122: ff f7 fe ff  	bl	0x122 <prtouch_pres_task+0x122> @ imm = #-4
     126: 23 8b        	ldrh	r3, [r4, #24]
     128: 01 36        	adds	r6, #1
     12a: b3 42        	cmp	r3, r6
     12c: f7 dc        	bgt	0x11e <prtouch_pres_task+0x11e> @ imm = #-18
     12e: 10 23        	movs	r3, #16
     130: c4 f8 d4 32  	str.w	r3, [r4, #724]
     134: 9b 46        	mov	r11, r3
     136: 59 e0        	b	0x1ec <prtouch_pres_task+0x1ec> @ imm = #178
     138: b4 f8 e0 32  	ldrh.w	r3, [r4, #736]
     13c: 00 2b        	cmp	r3, #0
     13e: 4f d0        	beq	0x1e0 <prtouch_pres_task+0x1e0> @ imm = #158
     140: 63 8b        	ldrh	r3, [r4, #26]
     142: 13 b3        	cbz	r3, 0x18a <prtouch_pres_task+0x18a> @ imm = #68
     144: b4 f8 dc 02  	ldrh.w	r0, [r4, #732]
     148: ff f7 fe ff  	bl	0x148 <prtouch_pres_task+0x148> @ imm = #-4
     14c: 62 49        	ldr	r1, [pc, #392]          @ 0x2d8 <$d+0x10>
     14e: ff f7 fe ff  	bl	0x14e <prtouch_pres_task+0x14e> @ imm = #-4
     152: 60 4b        	ldr	r3, [pc, #384]          @ 0x2d4 <$d+0xc>
     154: d3 e9 04 89  	ldrd	r8, r9, [r3, #16]
     158: 05 46        	mov	r5, r0
     15a: d4 e9 02 23  	ldrd	r2, r3, [r4, #8]
     15e: c4 e9 04 89  	strd	r8, r9, [r4, #16]
     162: 40 46        	mov	r0, r8
     164: 49 46        	mov	r1, r9
     166: ff f7 fe ff  	bl	0x166 <prtouch_pres_task+0x166> @ imm = #-4
     16a: 06 46        	mov	r6, r0
     16c: 28 46        	mov	r0, r5
     16e: 0f 46        	mov	r7, r1
     170: ff f7 fe ff  	bl	0x170 <prtouch_pres_task+0x170> @ imm = #-4
     174: 02 46        	mov	r2, r0
     176: 0b 46        	mov	r3, r1
     178: 30 46        	mov	r0, r6
     17a: 39 46        	mov	r1, r7
     17c: ff f7 fe ff  	bl	0x17c <prtouch_pres_task+0x17c> @ imm = #-4
     180: 00 28        	cmp	r0, #0
     182: 40 f0 95 80  	bne.w	0x2b0 <prtouch_pres_task+0x2b0> @ imm = #298
     186: c4 e9 02 89  	strd	r8, r9, [r4, #8]
     18a: 0c a8        	add	r0, sp, #48
     18c: ff f7 fe ff  	bl	0x18c <prtouch_pres_task+0x18c> @ imm = #-4
     190: 00 28        	cmp	r0, #0
     192: 00 f0 8d 80  	beq.w	0x2b0 <prtouch_pres_task+0x2b0> @ imm = #282
     196: 52 48        	ldr	r0, [pc, #328]          @ 0x2e0 <$d+0x18>
     198: 4e 4d        	ldr	r5, [pc, #312]          @ 0x2d4 <$d+0xc>
     19a: ff f7 fe ff  	bl	0x19a <prtouch_pres_task+0x19a> @ imm = #-4
     19e: 4a a3        	adr	r3, #296 <prtouch_pres_task+0x1ec>
     1a0: d3 e9 00 23  	ldrd	r2, r3, [r3]
     1a4: 06 46        	mov	r6, r0
     1a6: d5 e9 04 01  	ldrd	r0, r1, [r5, #16]
     1aa: ff f7 fe ff  	bl	0x1aa <prtouch_pres_task+0x1aa> @ imm = #-4
     1ae: ff f7 fe ff  	bl	0x1ae <prtouch_pres_task+0x1ae> @ imm = #-4
     1b2: 0c 9f        	ldr	r7, [sp, #48]
     1b4: 0d 99        	ldr	r1, [sp, #52]
     1b6: 0f 9b        	ldr	r3, [sp, #60]
     1b8: 02 93        	str	r3, [sp, #8]
     1ba: 02 46        	mov	r2, r0
     1bc: 30 46        	mov	r0, r6
     1be: 0e 9e        	ldr	r6, [sp, #56]
     1c0: 3b 46        	mov	r3, r7
     1c2: cd e9 00 16  	strd	r1, r6, [sp]
     1c6: 21 88        	ldrh	r1, [r4]
     1c8: ff f7 fe ff  	bl	0x1c8 <prtouch_pres_task+0x1c8> @ imm = #-4
     1cc: b4 f8 de 32  	ldrh.w	r3, [r4, #734]
     1d0: b4 f8 e0 22  	ldrh.w	r2, [r4, #736]
     1d4: 01 33        	adds	r3, #1
     1d6: 9b b2        	uxth	r3, r3
     1d8: 9a 42        	cmp	r2, r3
     1da: a4 f8 de 32  	strh.w	r3, [r4, #734]
     1de: 6a d0        	beq	0x2b6 <prtouch_pres_task+0x2b6> @ imm = #212
     1e0: d4 f8 d4 b2  	ldr.w	r11, [r4, #724]
     1e4: bb f1 00 0f  	cmp.w	r11, #0
     1e8: 62 d0        	beq	0x2b0 <prtouch_pres_task+0x2b0> @ imm = #196
     1ea: 3a 4d        	ldr	r5, [pc, #232]          @ 0x2d4 <$d+0xc>
     1ec: b4 f8 ec 02  	ldrh.w	r0, [r4, #748]
     1f0: df f8 f4 a0  	ldr.w	r10, [pc, #244]         @ 0x2e8 <$d+0x20>
     1f4: ff f7 fe ff  	bl	0x1f4 <prtouch_pres_task+0x1f4> @ imm = #-4
     1f8: 37 49        	ldr	r1, [pc, #220]          @ 0x2d8 <$d+0x10>
     1fa: ff f7 fe ff  	bl	0x1fa <prtouch_pres_task+0x1fa> @ imm = #-4
     1fe: d5 e9 04 67  	ldrd	r6, r7, [r5, #16]
     202: da e9 00 23  	ldrd	r2, r3, [r10]
     206: 84 46        	mov	r12, r0
     208: ca e9 02 67  	strd	r6, r7, [r10, #8]
     20c: 30 46        	mov	r0, r6
     20e: 39 46        	mov	r1, r7
     210: 65 46        	mov	r5, r12
     212: ff f7 fe ff  	bl	0x212 <prtouch_pres_task+0x212> @ imm = #-4
     216: 80 46        	mov	r8, r0
     218: 28 46        	mov	r0, r5
     21a: 89 46        	mov	r9, r1
     21c: ff f7 fe ff  	bl	0x21c <prtouch_pres_task+0x21c> @ imm = #-4
     220: 02 46        	mov	r2, r0
     222: 0b 46        	mov	r3, r1
     224: 40 46        	mov	r0, r8
     226: 49 46        	mov	r1, r9
     228: ff f7 fe ff  	bl	0x228 <prtouch_pres_task+0x228> @ imm = #-4
     22c: 00 28        	cmp	r0, #0
     22e: 3f d1        	bne	0x2b0 <prtouch_pres_task+0x2b0> @ imm = #126
     230: 0b f1 ff 33  	add.w	r3, r11, #4294967295
     234: c3 f1 0f 05  	rsb.w	r5, r3, #15
     238: 6d 00        	lsls	r5, r5, #1
     23a: ca e9 00 67  	strd	r6, r7, [r10]
     23e: 29 48        	ldr	r0, [pc, #164]          @ 0x2e4 <$d+0x1c>
     240: c4 f8 d4 32  	str.w	r3, [r4, #724]
     244: 04 eb 85 06  	add.w	r6, r4, r5, lsl #2
     248: ff f7 fe ff  	bl	0x248 <prtouch_pres_task+0x248> @ imm = #-4
     24c: 31 46        	mov	r1, r6
     24e: 32 46        	mov	r2, r6
     250: d1 f8 4c 11  	ldr.w	r1, [r1, #332]
     254: d2 f8 c8 20  	ldr.w	r2, [r2, #200]
     258: 33 46        	mov	r3, r6
     25a: d6 f8 d0 61  	ldr.w	r6, [r6, #464]
     25e: 5b 6c        	ldr	r3, [r3, #68]
     260: 02 93        	str	r3, [sp, #8]
     262: cd e9 04 16  	strd	r1, r6, [sp, #16]
     266: 04 eb 85 06  	add.w	r6, r4, r5, lsl #2
     26a: 03 92        	str	r2, [sp, #12]
     26c: 31 46        	mov	r1, r6
     26e: 32 46        	mov	r2, r6
     270: 33 46        	mov	r3, r6
     272: d6 f8 58 62  	ldr.w	r6, [r6, #600]
     276: d1 f8 d4 11  	ldr.w	r1, [r1, #468]
     27a: d2 f8 50 21  	ldr.w	r2, [r2, #336]
     27e: d3 f8 cc 30  	ldr.w	r3, [r3, #204]
     282: 0b 96        	str	r6, [sp, #44]
     284: 04 eb 85 06  	add.w	r6, r4, r5, lsl #2
     288: 0a 91        	str	r1, [sp, #40]
     28a: b7 6c        	ldr	r7, [r6, #72]
     28c: d6 f8 54 62  	ldr.w	r6, [r6, #596]
     290: 08 93        	str	r3, [sp, #32]
     292: d4 f8 04 33  	ldr.w	r3, [r4, #772]
     296: 01 93        	str	r3, [sp, #4]
     298: 94 f8 e2 32  	ldrb.w	r3, [r4, #738]
     29c: 09 92        	str	r2, [sp, #36]
     29e: 00 93        	str	r3, [sp]
     2a0: 21 78        	ldrb	r1, [r4]
     2a2: d4 f8 d8 32  	ldr.w	r3, [r4, #728]
     2a6: 2a 46        	mov	r2, r5
     2a8: cd e9 06 67  	strd	r6, r7, [sp, #24]
     2ac: ff f7 fe ff  	bl	0x2ac <prtouch_pres_task+0x2ac> @ imm = #-4
     2b0: 11 b0        	add	sp, #68
     2b2: bd e8 f0 8f  	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
     2b6: 2b 68        	ldr	r3, [r5]
     2b8: 00 22        	movs	r2, #0
     2ba: 01 2b        	cmp	r3, #1
     2bc: a4 f8 e0 22  	strh.w	r2, [r4, #736]
     2c0: 8e d1        	bne	0x1e0 <prtouch_pres_task+0x1e0> @ imm = #-228
     2c2: ff f7 fe ff  	bl	0x2c2 <prtouch_pres_task+0x2c2> @ imm = #-4
     2c6: 8b e7        	b	0x1e0 <prtouch_pres_task+0x1e0> @ imm = #-234

000002c8 <$d>:
     2c8:	00 00 00 00	.word	0x00000000
     2cc:	00 88 c3 40	.word	0x40c38800
     2d0:	00 00 00 00	.word	0x00000000
     2d4:	00 00 00 00	.word	0x00000000
     2d8:	00 00 7a 44	.word	0x447a0000
     2dc:	00 00 00 00	.word	0x00000000
     2e0:	00 00 00 00	.word	0x00000000
     2e4:	44 00 00 00	.word	0x00000044
     2e8:	00 00 00 00	.word	0x00000000

Disassembly of section .text.prtouch_task:

00000000 <prtouch_task>:
       0: 08 b5        	push	{r3, lr}
       2: ff f7 fe ff  	bl	0x2 <prtouch_task+0x2>  @ imm = #-4
       6: bd e8 08 40  	pop.w	{r3, lr}
       a: ff f7 fe bf  	b.w	0xa <prtouch_task+0xa>  @ imm = #-4
       e: 00 bf        	nop
