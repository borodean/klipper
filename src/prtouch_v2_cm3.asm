
prtouch_v2_cm3.o:	file format elf32-littlearm

Disassembly of section .text.sys_time_event:

00000000 <sys_time_event>:
       0: 70 b5        	push	{r4, r5, r6, lr}
       2: ff f7 fe ff  	bl	0x2 <sys_time_event+0x2> @ imm = #-4
       6: 0d 4c        	ldr	r4, [pc, #52]           @ 0x3c <$d>
       8: 05 46        	mov	r5, r0
       a: a6 69        	ldr	r6, [r4, #24]
       c: 0c 49        	ldr	r1, [pc, #48]           @ 0x40 <$d+0x4>
       e: 30 46        	mov	r0, r6
      10: ff f7 fe ff  	bl	0x10 <sys_time_event+0x10> @ imm = #-4
      14: ff f7 fe ff  	bl	0x14 <sys_time_event+0x14> @ imm = #-4
      18: 03 46        	mov	r3, r0
      1a: 2b 44        	add	r3, r5
      1c: e3 60        	str	r3, [r4, #12]
      1e: 30 46        	mov	r0, r6
      20: ff f7 fe ff  	bl	0x20 <sys_time_event+0x20> @ imm = #-4
      24: 02 46        	mov	r2, r0
      26: 0b 46        	mov	r3, r1
      28: d4 e9 04 01  	ldrd	r0, r1, [r4, #16]
      2c: ff f7 fe ff  	bl	0x2c <sys_time_event+0x2c> @ imm = #-4
      30: 02 46        	mov	r2, r0
      32: 0b 46        	mov	r3, r1
      34: 01 20        	movs	r0, #1
      36: c4 e9 04 23  	strd	r2, r3, [r4, #16]
      3a: 70 bd        	pop	{r4, r5, r6, pc}

0000003c <$d>:
      3c:	00 00 00 00	.word	0x00000000
      40:	40 54 89 4c	.word	0x4c895440

Disassembly of section .text.start_sys_time.part.0:

00000000 <start_sys_time.part.0>:
       0: 01 22        	movs	r2, #1
       2: 38 b5        	push	{r3, r4, r5, lr}
       4: 0a 4c        	ldr	r4, [pc, #40]           @ 0x30 <$d>
       6: 0b 4b        	ldr	r3, [pc, #44]           @ 0x34 <$d+0x4>
       8: 22 60        	str	r2, [r4]
       a: a3 60        	str	r3, [r4, #8]
       c: ff f7 fe ff  	bl	0xc <start_sys_time.part.0+0xc> @ imm = #-4
      10: 09 49        	ldr	r1, [pc, #36]           @ 0x38 <$d+0x8>
      12: 05 46        	mov	r5, r0
      14: a0 69        	ldr	r0, [r4, #24]
      16: ff f7 fe ff  	bl	0x16 <start_sys_time.part.0+0x16> @ imm = #-4
      1a: ff f7 fe ff  	bl	0x1a <start_sys_time.part.0+0x1a> @ imm = #-4
      1e: 03 46        	mov	r3, r0
      20: 2b 44        	add	r3, r5
      22: 20 1d        	adds	r0, r4, #4
      24: e3 60        	str	r3, [r4, #12]
      26: bd e8 38 40  	pop.w	{r3, r4, r5, lr}
      2a: ff f7 fe bf  	b.w	0x2a <start_sys_time.part.0+0x2a> @ imm = #-4
      2e: 00 bf        	nop

00000030 <$d>:
      30:	00 00 00 00	.word	0x00000000
      34:	00 00 00 00	.word	0x00000000
      38:	40 54 89 4c	.word	0x4c895440

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
       0: 00 22        	movs	r2, #0
       2: 10 b4        	push	{r4}
       4: 04 39        	subs	r1, #4
       6: 03 68        	ldr	r3, [r0]
       8: 13 44        	add	r3, r2
       a: 5c 42        	rsbs	r4, r3, #0
       c: 04 f0 1f 04  	and	r4, r4, #31
      10: 03 f0 1f 03  	and	r3, r3, #31
      14: 58 bf        	it	pl
      16: 63 42        	rsbpl	r3, r4, #0
      18: 00 eb 83 03  	add.w	r3, r0, r3, lsl #2
      1c: 5b 68        	ldr	r3, [r3, #4]
      1e: 01 32        	adds	r2, #1
      20: 20 2a        	cmp	r2, #32
      22: 41 f8 04 3f  	str	r3, [r1, #4]!
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
       2: 02 46        	mov	r2, r0
       4: 93 e8 03 00  	ldm.w	r3, {r0, r1}
       8: ff f7 fe bf  	b.w	0x8 <write_swap_sta+0x8> @ imm = #-4

0000000c <$d>:
       c:	00 00 00 00	.word	0x00000000

Disassembly of section .text.read_swap_sta:

00000000 <read_swap_sta>:
       0: 08 b5        	push	{r3, lr}
       2: 03 4b        	ldr	r3, [pc, #12]           @ 0x10 <$d>
       4: 93 e8 03 00  	ldm.w	r3, {r0, r1}
       8: ff f7 fe ff  	bl	0x8 <read_swap_sta+0x8> @ imm = #-4
       c: 08 bd        	pop	{r3, pc}
       e: 00 bf        	nop

00000010 <$d>:
      10:	08 00 00 00	.word	0x00000008

Disassembly of section .text.send_debug_args:

00000000 <send_debug_args>:
       0: 70 b5        	push	{r4, r5, r6, lr}
       2: 04 46        	mov	r4, r0
       4: 86 b0        	sub	sp, #24
       6: 0a 48        	ldr	r0, [pc, #40]           @ 0x30 <$d>
       8: ff f7 fe ff  	bl	0x8 <send_debug_args+0x8> @ imm = #-4
       c: d4 e9 04 25  	ldrd	r2, r5, [r4, #16]
      10: 23 68        	ldr	r3, [r4]
      12: e6 68        	ldr	r6, [r4, #12]
      14: cd e9 03 25  	strd	r2, r5, [sp, #12]
      18: d9 b2        	uxtb	r1, r3
      1a: d4 e9 01 25  	ldrd	r2, r5, [r4, #4]
      1e: 00 92        	str	r2, [sp]
      20: cd e9 01 56  	strd	r5, r6, [sp, #4]
      24: 40 f2 33 12  	movw	r2, #307
      28: ff f7 fe ff  	bl	0x28 <send_debug_args+0x28> @ imm = #-4
      2c: 06 b0        	add	sp, #24
      2e: 70 bd        	pop	{r4, r5, r6, pc}

00000030 <$d>:
      30:	00 00 00 00	.word	0x00000000

Disassembly of section .text.check_delay:

00000000 <check_delay>:
       0: 2d e9 f8 43  	push.w	{r3, r4, r5, r6, r7, r8, r9, lr}
       4: d0 e9 00 23  	ldrd	r2, r3, [r0]
       8: 04 46        	mov	r4, r0
       a: 0f 48        	ldr	r0, [pc, #60]           @ 0x48 <$d>
       c: 0d 46        	mov	r5, r1
       e: d0 e9 04 89  	ldrd	r8, r9, [r0, #16]
      12: 40 46        	mov	r0, r8
      14: 49 46        	mov	r1, r9
      16: c4 e9 02 89  	strd	r8, r9, [r4, #8]
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
      36: 01 20        	movs	r0, #1
      38: c4 e9 00 89  	strd	r8, r9, [r4]
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
       8: ab b1        	cbz	r3, 0x36 <deal_dirs_prtouch+0x36> @ imm = #42
       a: 80 46        	mov	r8, r0
       c: 0f 46        	mov	r7, r1
       e: 00 24        	movs	r4, #0
      10: 06 f1 22 05  	add.w	r5, r6, #34
      14: 00 2f        	cmp	r7, #0
      16: 06 eb c4 03  	add.w	r3, r6, r4, lsl #3
      1a: 0e dc        	bgt	0x3a <deal_dirs_prtouch+0x3a> @ imm = #28
      1c: 2a 88        	ldrh	r2, [r5]
      1e: 06 eb c4 03  	add.w	r3, r6, r4, lsl #3
      22: d3 e9 0f 01  	ldrd	r0, r1, [r3, #60]
      26: ff f7 fe ff  	bl	0x26 <deal_dirs_prtouch+0x26> @ imm = #-4
      2a: 33 8c        	ldrh	r3, [r6, #32]
      2c: 01 34        	adds	r4, #1
      2e: a3 42        	cmp	r3, r4
      30: 05 f1 02 05  	add.w	r5, r5, #2
      34: ee dc        	bgt	0x14 <deal_dirs_prtouch+0x14> @ imm = #-36
      36: bd e8 f0 81  	pop.w	{r4, r5, r6, r7, r8, pc}
      3a: d3 e9 1f 01  	ldrd	r0, r1, [r3, #124]
      3e: ff f7 fe ff  	bl	0x3e <deal_dirs_prtouch+0x3e> @ imm = #-4
      42: 2a 89        	ldrh	r2, [r5, #8]
      44: 28 80        	strh	r0, [r5]
      46: b2 eb 08 02  	subs.w	r2, r2, r8
      4a: 18 bf        	it	ne
      4c: 01 22        	movne	r2, #1
      4e: e6 e7        	b	0x1e <deal_dirs_prtouch+0x1e> @ imm = #-52

00000050 <$d>:
      50:	00 00 00 00	.word	0x00000000

Disassembly of section .text.prtouch_event:

00000000 <prtouch_event>:
       0: 70 b5        	push	{r4, r5, r6, lr}
       2: 8f 4c        	ldr	r4, [pc, #572]          @ 0x240 <$d+0x8>
       4: 23 8c        	ldrh	r3, [r4, #32]
       6: 53 b1        	cbz	r3, 0x1e <prtouch_event+0x1e> @ imm = #20
       8: 00 25        	movs	r5, #0
       a: 04 eb c5 03  	add.w	r3, r4, r5, lsl #3
       e: d3 e9 17 01  	ldrd	r0, r1, [r3, #92]
      12: ff f7 fe ff  	bl	0x12 <prtouch_event+0x12> @ imm = #-4
      16: 23 8c        	ldrh	r3, [r4, #32]
      18: 01 35        	adds	r5, #1
      1a: 9d 42        	cmp	r5, r3
      1c: f5 db        	blt	0xa <prtouch_event+0xa> @ imm = #-22
      1e: d4 f8 b4 31  	ldr.w	r3, [r4, #436]
      22: d4 f8 9c 20  	ldr.w	r2, [r4, #156]
      26: 01 3b        	subs	r3, #1
      28: c4 f8 b4 31  	str.w	r3, [r4, #436]
      2c: 00 2a        	cmp	r2, #0
      2e: 00 f0 92 80  	beq.w	0x156 <prtouch_event+0x156> @ imm = #292
      32: 3b b1        	cbz	r3, 0x44 <prtouch_event+0x44> @ imm = #14
      34: da 07        	lsls	r2, r3, #31
      36: 00 f1 a2 80  	bmi.w	0x17e <prtouch_event+0x17e> @ imm = #324
      3a: b4 f8 ae 31  	ldrh.w	r3, [r4, #430]
      3e: 01 2b        	cmp	r3, #1
      40: 40 f0 93 80  	bne.w	0x16a <prtouch_event+0x16a> @ imm = #294
      44: d4 f8 28 51  	ldr.w	r5, [r4, #296]
      48: 7e 4a        	ldr	r2, [pc, #504]          @ 0x244 <$d+0xc>
      4a: 6b 42        	rsbs	r3, r5, #0
      4c: 03 f0 1f 03  	and	r3, r3, #31
      50: 05 f0 1f 06  	and	r6, r5, #31
      54: d2 e9 04 01  	ldrd	r0, r1, [r2, #16]
      58: 58 bf        	it	pl
      5a: 5e 42        	rsbpl	r6, r3, #0
      5c: 76 a3        	adr	r3, #472 <prtouch_event+0xd6>
      5e: d3 e9 00 23  	ldrd	r2, r3, [r3]
      62: ff f7 fe ff  	bl	0x62 <prtouch_event+0x62> @ imm = #-4
      66: ff f7 fe ff  	bl	0x66 <prtouch_event+0x66> @ imm = #-4
      6a: 04 eb 86 06  	add.w	r6, r4, r6, lsl #2
      6e: c6 f8 2c 01  	str.w	r0, [r6, #300]
      72: d4 f8 a4 30  	ldr.w	r3, [r4, #164]
      76: d4 f8 b4 21  	ldr.w	r2, [r4, #436]
      7a: 58 42        	rsbs	r0, r3, #0
      7c: b4 f8 c4 61  	ldrh.w	r6, [r4, #452]
      80: 00 f0 1f 00  	and	r0, r0, #31
      84: 03 f0 1f 01  	and	r1, r3, #31
      88: 02 eb d2 72  	add.w	r2, r2, r2, lsr #31
      8c: 58 bf        	it	pl
      8e: 41 42        	rsbpl	r1, r0, #0
      90: 01 35        	adds	r5, #1
      92: 04 eb 81 01  	add.w	r1, r4, r1, lsl #2
      96: 01 33        	adds	r3, #1
      98: 52 10        	asrs	r2, r2, #1
      9a: 01 2e        	cmp	r6, #1
      9c: c4 f8 28 51  	str.w	r5, [r4, #296]
      a0: c1 f8 a8 20  	str.w	r2, [r1, #168]
      a4: c4 f8 a4 30  	str.w	r3, [r4, #164]
      a8: 44 d1        	bne	0x134 <prtouch_event+0x134> @ imm = #136
      aa: 00 21        	movs	r1, #0
      ac: d4 f8 b0 31  	ldr.w	r3, [r4, #432]
      b0: 08 46        	mov	r0, r1
      b2: c4 f8 b4 31  	str.w	r3, [r4, #436]
      b6: a4 f8 c4 11  	strh.w	r1, [r4, #452]
      ba: ff f7 fe ff  	bl	0xba <prtouch_event+0xba> @ imm = #-4
      be: b4 f8 ac 01  	ldrh.w	r0, [r4, #428]
      c2: 31 46        	mov	r1, r6
      c4: b0 fa 80 f0  	clz	r0, r0
      c8: 40 09        	lsrs	r0, r0, #5
      ca: ff f7 fe ff  	bl	0xca <prtouch_event+0xca> @ imm = #-4
      ce: ff f7 fe ff  	bl	0xce <prtouch_event+0xce> @ imm = #-4
      d2: d4 e9 6d 32  	ldrd	r3, r2, [r4, #436]
      d6: 02 44        	add	r2, r0
      d8: e2 60        	str	r2, [r4, #12]
      da: d4 f8 b0 21  	ldr.w	r2, [r4, #432]
      de: d4 f8 bc 11  	ldr.w	r1, [r4, #444]
      e2: d2 1a        	subs	r2, r2, r3
      e4: 8a 42        	cmp	r2, r1
      e6: c0 f2 8e 80  	blt.w	0x206 <prtouch_event+0x206> @ imm = #284
      ea: 99 42        	cmp	r1, r3
      ec: 40 f3 8d 80  	ble.w	0x20a <prtouch_event+0x20a> @ imm = #282
      f0: 1d 02        	lsls	r5, r3, #8
      f2: 95 fb f1 f5  	sdiv	r5, r5, r1
      f6: c5 f5 80 75  	rsb.w	r5, r5, #256
      fa: ff 2d        	cmp	r5, #255
      fc: a8 bf        	it	ge
      fe: ff 25        	movge	r5, #255
     100: ff f7 fe ff  	bl	0x100 <prtouch_event+0x100> @ imm = #-4
     104: d4 f8 b8 61  	ldr.w	r6, [r4, #440]
     108: b4 f8 c0 11  	ldrh.w	r1, [r4, #448]
     10c: 4e 4b        	ldr	r3, [pc, #312]          @ 0x248 <$d+0x10>
     10e: 06 fb 01 f1  	mul	r1, r6, r1
     112: 25 ea e5 75  	bic.w	r5, r5, r5, asr #31
     116: 33 f8 15 30  	ldrh.w	r3, [r3, r5, lsl #1]
     11a: 4c 4a        	ldr	r2, [pc, #304]          @ 0x24c <$d+0x14>
     11c: 03 fb 01 f3  	mul	r3, r3, r1
     120: 82 fb 03 12  	smull	r1, r2, r2, r3
     124: db 17        	asrs	r3, r3, #31
     126: c3 eb a2 13  	rsb	r3, r3, r2, asr #6
     12a: 33 44        	add	r3, r6
     12c: 03 44        	add	r3, r0
     12e: e3 60        	str	r3, [r4, #12]
     130: 01 20        	movs	r0, #1
     132: 70 bd        	pop	{r4, r5, r6, pc}
     134: 46 48        	ldr	r0, [pc, #280]          @ 0x250 <$d+0x18>
     136: ff f7 fe ff  	bl	0x136 <prtouch_event+0x136> @ imm = #-4
     13a: 00 21        	movs	r1, #0
     13c: 08 46        	mov	r0, r1
     13e: ff f7 fe ff  	bl	0x13e <prtouch_event+0x13e> @ imm = #-4
     142: 00 23        	movs	r3, #0
     144: 08 22        	movs	r2, #8
     146: 01 20        	movs	r0, #1
     148: a4 f8 a0 20  	strh.w	r2, [r4, #160]
     14c: a4 f8 ae 31  	strh.w	r3, [r4, #430]
     150: c4 f8 b4 31  	str.w	r3, [r4, #436]
     154: 70 bd        	pop	{r4, r5, r6, pc}
     156: 3f 4b        	ldr	r3, [pc, #252]          @ 0x254 <$d+0x1c>
     158: 93 e8 03 00  	ldm.w	r3, {r0, r1}
     15c: ff f7 fe ff  	bl	0x15c <prtouch_event+0x15c> @ imm = #-4
     160: 01 28        	cmp	r0, #1
     162: 5a d0        	beq	0x21a <prtouch_event+0x21a> @ imm = #180
     164: d4 f8 b4 31  	ldr.w	r3, [r4, #436]
     168: 63 e7        	b	0x32 <prtouch_event+0x32> @ imm = #-314
     16a: 3a 4b        	ldr	r3, [pc, #232]          @ 0x254 <$d+0x1c>
     16c: 93 e8 03 00  	ldm.w	r3, {r0, r1}
     170: ff f7 fe ff  	bl	0x170 <prtouch_event+0x170> @ imm = #-4
     174: 01 28        	cmp	r0, #1
     176: 3f f4 65 af  	beq.w	0x44 <prtouch_event+0x44> @ imm = #-310
     17a: d4 f8 b4 31  	ldr.w	r3, [r4, #436]
     17e: b4 f8 c2 21  	ldrh.w	r2, [r4, #450]
     182: 52 00        	lsls	r2, r2, #1
     184: 93 fb f2 f1  	sdiv	r1, r3, r2
     188: 02 fb 11 32  	mls	r2, r2, r1, r3
     18c: 00 2a        	cmp	r2, #0
     18e: a4 d1        	bne	0xda <prtouch_event+0xda> @ imm = #-184
     190: 29 a3        	adr	r3, #164 <prtouch_event+0x1bd>
     192: d3 e9 00 23  	ldrd	r2, r3, [r3]
     196: d4 f8 28 51  	ldr.w	r5, [r4, #296]
     19a: 2a 48        	ldr	r0, [pc, #168]          @ 0x244 <$d+0xc>
     19c: 69 42        	rsbs	r1, r5, #0
     19e: 01 f0 1f 01  	and	r1, r1, #31
     1a2: 05 f0 1f 06  	and	r6, r5, #31
     1a6: 58 bf        	it	pl
     1a8: 4e 42        	rsbpl	r6, r1, #0
     1aa: 00 f1 10 01  	add.w	r1, r0, #16
     1ae: d1 e9 00 01  	ldrd	r0, r1, [r1]
     1b2: ff f7 fe ff  	bl	0x1b2 <prtouch_event+0x1b2> @ imm = #-4
     1b6: ff f7 fe ff  	bl	0x1b6 <prtouch_event+0x1b6> @ imm = #-4
     1ba: 04 eb 86 06  	add.w	r6, r4, r6, lsl #2
     1be: c6 f8 2c 01  	str.w	r0, [r6, #300]
     1c2: d4 f8 a4 30  	ldr.w	r3, [r4, #164]
     1c6: d4 f8 b4 21  	ldr.w	r2, [r4, #436]
     1ca: 58 42        	rsbs	r0, r3, #0
     1cc: 00 f0 1f 00  	and	r0, r0, #31
     1d0: 03 f0 1f 01  	and	r1, r3, #31
     1d4: 02 eb d2 72  	add.w	r2, r2, r2, lsr #31
     1d8: 58 bf        	it	pl
     1da: 41 42        	rsbpl	r1, r0, #0
     1dc: 04 eb 81 01  	add.w	r1, r4, r1, lsl #2
     1e0: 52 10        	asrs	r2, r2, #1
     1e2: 01 35        	adds	r5, #1
     1e4: c4 f8 28 51  	str.w	r5, [r4, #296]
     1e8: c1 f8 a8 20  	str.w	r2, [r1, #168]
     1ec: 5a 1c        	adds	r2, r3, #1
     1ee: c4 f8 a4 20  	str.w	r2, [r4, #164]
     1f2: d4 f8 b4 31  	ldr.w	r3, [r4, #436]
     1f6: d4 f8 b0 21  	ldr.w	r2, [r4, #432]
     1fa: d4 f8 bc 11  	ldr.w	r1, [r4, #444]
     1fe: d2 1a        	subs	r2, r2, r3
     200: 8a 42        	cmp	r2, r1
     202: bf f6 72 af  	bge.w	0xea <prtouch_event+0xea> @ imm = #-284
     206: 15 02        	lsls	r5, r2, #8
     208: 73 e7        	b	0xf2 <prtouch_event+0xf2> @ imm = #-282
     20a: ff f7 fe ff  	bl	0x20a <prtouch_event+0x20a> @ imm = #-4
     20e: d4 f8 b8 31  	ldr.w	r3, [r4, #440]
     212: 03 44        	add	r3, r0
     214: e3 60        	str	r3, [r4, #12]
     216: 01 20        	movs	r0, #1
     218: 70 bd        	pop	{r4, r5, r6, pc}
     21a: 0a 49        	ldr	r1, [pc, #40]           @ 0x244 <$d+0xc>
     21c: 06 a3        	adr	r3, #24 <prtouch_event+0x226>
     21e: d3 e9 00 23  	ldrd	r2, r3, [r3]
     222: d1 e9 04 01  	ldrd	r0, r1, [r1, #16]
     226: ff f7 fe ff  	bl	0x226 <prtouch_event+0x226> @ imm = #-4
     22a: ff f7 fe ff  	bl	0x22a <prtouch_event+0x22a> @ imm = #-4
     22e: d4 f8 b4 31  	ldr.w	r3, [r4, #436]
     232: c4 f8 9c 00  	str.w	r0, [r4, #156]
     236: fc e6        	b	0x32 <prtouch_event+0x32> @ imm = #-520

00000238 <$d>:
     238:	00 00 00 00	.word	0x00000000
     23c:	00 88 c3 40	.word	0x40c38800
     240:	00 00 00 00	.word	0x00000000
     244:	00 00 00 00	.word	0x00000000
     248:	00 00 00 00	.word	0x00000000
     24c:	d3 4d 62 10	.word	0x10624dd3
     250:	04 00 00 00	.word	0x00000004
     254:	08 00 00 00	.word	0x00000008

Disassembly of section .text.deal_steps_prtouch:

00000000 <deal_steps_prtouch>:
       0: 38 b5        	push	{r3, r4, r5, lr}
       2: 07 4d        	ldr	r5, [pc, #28]           @ 0x20 <$d>
       4: 2b 8c        	ldrh	r3, [r5, #32]
       6: 53 b1        	cbz	r3, 0x1e <deal_steps_prtouch+0x1e> @ imm = #20
       8: 00 24        	movs	r4, #0
       a: 05 eb c4 03  	add.w	r3, r5, r4, lsl #3
       e: d3 e9 17 01  	ldrd	r0, r1, [r3, #92]
      12: ff f7 fe ff  	bl	0x12 <deal_steps_prtouch+0x12> @ imm = #-4
      16: 2b 8c        	ldrh	r3, [r5, #32]
      18: 01 34        	adds	r4, #1
      1a: a3 42        	cmp	r3, r4
      1c: f5 dc        	bgt	0xa <deal_steps_prtouch+0xa> @ imm = #-22
      1e: 38 bd        	pop	{r3, r4, r5, pc}

00000020 <$d>:
      20:	00 00 00 00	.word	0x00000000

Disassembly of section .text.command_config_step_prtouch:

00000000 <command_config_step_prtouch>:
       0: 30 b5        	push	{r4, r5, lr}
       2: d0 e9 00 12  	ldrd	r1, r2, [r0]
       6: 0f 4b        	ldr	r3, [pc, #60]           @ 0x44 <$d>
       8: 83 b0        	sub	sp, #12
       a: 04 46        	mov	r4, r0
       c: 19 80        	strh	r1, [r3]
       e: c0 68        	ldr	r0, [r0, #12]
      10: 1a 84        	strh	r2, [r3, #32]
      12: ff f7 fe ff  	bl	0x12 <command_config_step_prtouch+0x12> @ imm = #-4
      16: 0c 49        	ldr	r1, [pc, #48]           @ 0x48 <$d+0x4>
      18: ff f7 fe ff  	bl	0x18 <command_config_step_prtouch+0x18> @ imm = #-4
      1c: 6d 46        	mov	r5, sp
      1e: 02 46        	mov	r2, r0
      20: 0a 4b        	ldr	r3, [pc, #40]           @ 0x4c <$d+0x8>
      22: a1 68        	ldr	r1, [r4, #8]
      24: 28 46        	mov	r0, r5
      26: 9a 61        	str	r2, [r3, #24]
      28: 01 22        	movs	r2, #1
      2a: ff f7 fe ff  	bl	0x2a <command_config_step_prtouch+0x2a> @ imm = #-4
      2e: 95 e8 03 00  	ldm.w	r5, {r0, r1}
      32: 07 4b        	ldr	r3, [pc, #28]           @ 0x50 <$d+0xc>
      34: 83 e8 03 00  	stm.w	r3, {r0, r1}
      38: 20 46        	mov	r0, r4
      3a: 03 b0        	add	sp, #12
      3c: bd e8 30 40  	pop.w	{r4, r5, lr}
      40: ff f7 fe bf  	b.w	0x40 <command_config_step_prtouch+0x40> @ imm = #-4

00000044 <$d>:
      44:	00 00 00 00	.word	0x00000000
      48:	00 50 c3 47	.word	0x47c35000
      4c:	00 00 00 00	.word	0x00000000
      50:	08 00 00 00	.word	0x00000008

Disassembly of section .text.command_add_step_prtouch:

00000000 <command_add_step_prtouch>:
       0: f0 b5        	push	{r4, r5, r6, r7, lr}
       2: 43 68        	ldr	r3, [r0, #4]
       4: 04 46        	mov	r4, r0
       6: 85 b0        	sub	sp, #20
       8: 1c 4e        	ldr	r6, [pc, #112]          @ 0x7c <$d>
       a: 02 af        	add	r7, sp, #8
       c: 81 68        	ldr	r1, [r0, #8]
       e: 0f 33        	adds	r3, #15
      10: 38 46        	mov	r0, r7
      12: 00 22        	movs	r2, #0
      14: 06 eb c3 05  	add.w	r5, r6, r3, lsl #3
      18: ff f7 fe ff  	bl	0x18 <command_add_step_prtouch+0x18> @ imm = #-4
      1c: 97 e8 03 00  	ldm.w	r7, {r0, r1}
      20: 6f 46        	mov	r7, sp
      22: 2b 1d        	adds	r3, r5, #4
      24: 83 e8 03 00  	stm.w	r3, {r0, r1}
      28: 63 68        	ldr	r3, [r4, #4]
      2a: 38 46        	mov	r0, r7
      2c: 07 33        	adds	r3, #7
      2e: 06 eb c3 05  	add.w	r5, r6, r3, lsl #3
      32: a1 68        	ldr	r1, [r4, #8]
      34: 00 22        	movs	r2, #0
      36: ff f7 fe ff  	bl	0x36 <command_add_step_prtouch+0x36> @ imm = #-4
      3a: 97 e8 03 00  	ldm.w	r7, {r0, r1}
      3e: 2b 1d        	adds	r3, r5, #4
      40: 83 e8 03 00  	stm.w	r3, {r0, r1}
      44: 63 68        	ldr	r3, [r4, #4]
      46: 38 46        	mov	r0, r7
      48: 0b 33        	adds	r3, #11
      4a: 06 eb c3 05  	add.w	r5, r6, r3, lsl #3
      4e: 62 69        	ldr	r2, [r4, #20]
      50: e1 68        	ldr	r1, [r4, #12]
      52: ff f7 fe ff  	bl	0x52 <command_add_step_prtouch+0x52> @ imm = #-4
      56: 97 e8 03 00  	ldm.w	r7, {r0, r1}
      5a: 2b 1d        	adds	r3, r5, #4
      5c: 83 e8 03 00  	stm.w	r3, {r0, r1}
      60: 20 46        	mov	r0, r4
      62: d4 e9 04 52  	ldrd	r5, r2, [r4, #16]
      66: 63 68        	ldr	r3, [r4, #4]
      68: 06 eb 43 01  	add.w	r1, r6, r3, lsl #1
      6c: 4d 85        	strh	r5, [r1, #42]
      6e: 4a 86        	strh	r2, [r1, #50]
      70: 05 b0        	add	sp, #20
      72: bd e8 f0 40  	pop.w	{r4, r5, r6, r7, lr}
      76: ff f7 fe bf  	b.w	0x76 <command_add_step_prtouch+0x76> @ imm = #-4
      7a: 00 bf        	nop

0000007c <$d>:
      7c:	00 00 00 00	.word	0x00000000

Disassembly of section .text.command_read_swap_prtouch:

00000000 <command_read_swap_prtouch>:
       0: 70 b5        	push	{r4, r5, r6, lr}
       2: 04 46        	mov	r4, r0
       4: 0a 48        	ldr	r0, [pc, #40]           @ 0x30 <$d>
       6: ff f7 fe ff  	bl	0x6 <command_read_swap_prtouch+0x6> @ imm = #-4
       a: 0a 4b        	ldr	r3, [pc, #40]           @ 0x34 <$d+0x4>
       c: 0a 4a        	ldr	r2, [pc, #40]           @ 0x38 <$d+0x8>
       e: 05 46        	mov	r5, r0
      10: 93 e8 03 00  	ldm.w	r3, {r0, r1}
      14: 16 88        	ldrh	r6, [r2]
      16: ff f7 fe ff  	bl	0x16 <command_read_swap_prtouch+0x16> @ imm = #-4
      1a: 31 46        	mov	r1, r6
      1c: 02 46        	mov	r2, r0
      1e: 28 46        	mov	r0, r5
      20: ff f7 fe ff  	bl	0x20 <command_read_swap_prtouch+0x20> @ imm = #-4
      24: 20 46        	mov	r0, r4
      26: bd e8 70 40  	pop.w	{r4, r5, r6, lr}
      2a: ff f7 fe bf  	b.w	0x2a <command_read_swap_prtouch+0x2a> @ imm = #-4
      2e: 00 bf        	nop

00000030 <$d>:
      30:	00 00 00 00	.word	0x00000000
      34:	08 00 00 00	.word	0x00000008
      38:	00 00 00 00	.word	0x00000000

Disassembly of section .text.command_start_step_prtouch:

00000000 <command_start_step_prtouch>:
       0: f8 b5        	push	{r3, r4, r5, r6, r7, lr}
       2: 83 68        	ldr	r3, [r0, #8]
       4: 00 2b        	cmp	r3, #0
       6: 73 d0        	beq	0xf0 <command_start_step_prtouch+0xf0> @ imm = #230
       8: 47 4f        	ldr	r7, [pc, #284]          @ 0x128 <$d+0x18>
       a: 05 46        	mov	r5, r0
       c: 3b 68        	ldr	r3, [r7]
       e: 00 2b        	cmp	r3, #0
      10: 6b d0        	beq	0xea <command_start_step_prtouch+0xea> @ imm = #214
      12: 00 26        	movs	r6, #0
      14: 45 4c        	ldr	r4, [pc, #276]          @ 0x12c <$d+0x1c>
      16: 31 46        	mov	r1, r6
      18: 80 22        	movs	r2, #128
      1a: 04 f5 96 70  	add.w	r0, r4, #300
      1e: c4 f8 28 61  	str.w	r6, [r4, #296]
      22: c4 f8 a4 60  	str.w	r6, [r4, #164]
      26: ff f7 fe ff  	bl	0x26 <command_start_step_prtouch+0x26> @ imm = #-4
      2a: 31 46        	mov	r1, r6
      2c: 80 22        	movs	r2, #128
      2e: 04 f1 a8 00  	add.w	r0, r4, #168
      32: ff f7 fe ff  	bl	0x32 <command_start_step_prtouch+0x32> @ imm = #-4
      36: 36 a3        	adr	r3, #216 <command_start_step_prtouch+0x70>
      38: d3 e9 00 23  	ldrd	r2, r3, [r3]
      3c: d7 e9 04 01  	ldrd	r0, r1, [r7, #16]
      40: ff f7 fe ff  	bl	0x40 <command_start_step_prtouch+0x40> @ imm = #-4
      44: ff f7 fe ff  	bl	0x44 <command_start_step_prtouch+0x44> @ imm = #-4
      48: 04 f5 94 73  	add.w	r3, r4, #296
      4c: 04 f5 d4 72  	add.w	r2, r4, #424
      50: 43 f8 04 0f  	str	r0, [r3, #4]!
      54: 93 42        	cmp	r3, r2
      56: fb d1        	bne	0x50 <command_start_step_prtouch+0x50> @ imm = #-10
      58: 68 68        	ldr	r0, [r5, #4]
      5a: 01 21        	movs	r1, #1
      5c: ff f7 fe ff  	bl	0x5c <command_start_step_prtouch+0x5c> @ imm = #-4
      60: eb 68        	ldr	r3, [r5, #12]
      62: aa 68        	ldr	r2, [r5, #8]
      64: 5b 00        	lsls	r3, r3, #1
      66: 69 68        	ldr	r1, [r5, #4]
      68: c4 e9 6c 33  	strd	r3, r3, [r4, #432]
      6c: 28 69        	ldr	r0, [r5, #16]
      6e: a4 f8 a2 20  	strh.w	r2, [r4, #162]
      72: a4 f8 ac 11  	strh.w	r1, [r4, #428]
      76: ff f7 fe ff  	bl	0x76 <command_start_step_prtouch+0x76> @ imm = #-4
      7a: 27 a3        	adr	r3, #156 <command_start_step_prtouch+0xa5>
      7c: d3 e9 00 23  	ldrd	r2, r3, [r3]
      80: ff f7 fe ff  	bl	0x80 <command_start_step_prtouch+0x80> @ imm = #-4
      84: 26 a3        	adr	r3, #152 <command_start_step_prtouch+0xae>
      86: d3 e9 00 23  	ldrd	r2, r3, [r3]
      8a: ff f7 fe ff  	bl	0x8a <command_start_step_prtouch+0x8a> @ imm = #-4
      8e: ff f7 fe ff  	bl	0x8e <command_start_step_prtouch+0x8e> @ imm = #-4
      92: 00 26        	movs	r6, #0
      94: 40 08        	lsrs	r0, r0, #1
      96: c4 f8 b8 01  	str.w	r0, [r4, #440]
      9a: 6b 69        	ldr	r3, [r5, #20]
      9c: c4 f8 9c 60  	str.w	r6, [r4, #156]
      a0: 5b 00        	lsls	r3, r3, #1
      a2: c4 f8 bc 31  	str.w	r3, [r4, #444]
      a6: 2a 6a        	ldr	r2, [r5, #32]
      a8: 21 4b        	ldr	r3, [pc, #132]          @ 0x130 <$d+0x20>
      aa: d5 e9 06 01  	ldrd	r0, r1, [r5, #24]
      ae: a3 60        	str	r3, [r4, #8]
      b0: a4 f8 c2 11  	strh.w	r1, [r4, #450]
      b4: a4 f8 c4 21  	strh.w	r2, [r4, #452]
      b8: a4 f8 a0 60  	strh.w	r6, [r4, #160]
      bc: a4 f8 c0 01  	strh.w	r0, [r4, #448]
      c0: ff f7 fe ff  	bl	0xc0 <command_start_step_prtouch+0xc0> @ imm = #-4
      c4: 02 46        	mov	r2, r0
      c6: b4 f8 c0 11  	ldrh.w	r1, [r4, #448]
      ca: d4 f8 b8 31  	ldr.w	r3, [r4, #440]
      ce: 19 48        	ldr	r0, [pc, #100]          @ 0x134 <$d+0x24>
      d0: 01 fb 03 33  	mla	r3, r1, r3, r3
      d4: 13 44        	add	r3, r2
      d6: a4 f8 ae 61  	strh.w	r6, [r4, #430]
      da: e3 60        	str	r3, [r4, #12]
      dc: ff f7 fe ff  	bl	0xdc <command_start_step_prtouch+0xdc> @ imm = #-4
      e0: 28 46        	mov	r0, r5
      e2: bd e8 f8 40  	pop.w	{r3, r4, r5, r6, r7, lr}
      e6: ff f7 fe bf  	b.w	0xe6 <command_start_step_prtouch+0xe6> @ imm = #-4
      ea: ff f7 fe ff  	bl	0xea <command_start_step_prtouch+0xea> @ imm = #-4
      ee: 90 e7        	b	0x12 <command_start_step_prtouch+0x12> @ imm = #-224
      f0: 01 22        	movs	r2, #1
      f2: 0e 4b        	ldr	r3, [pc, #56]           @ 0x12c <$d+0x1c>
      f4: a3 f8 ae 21  	strh.w	r2, [r3, #430]
      f8: ff f7 fe ff  	bl	0xf8 <command_start_step_prtouch+0xf8> @ imm = #-4
      fc: 0a 4b        	ldr	r3, [pc, #40]           @ 0x128 <$d+0x18>
      fe: 1b 68        	ldr	r3, [r3]
     100: 01 2b        	cmp	r3, #1
     102: 00 d0        	beq	0x106 <command_start_step_prtouch+0x106> @ imm = #0
     104: f8 bd        	pop	{r3, r4, r5, r6, r7, pc}
     106: bd e8 f8 40  	pop.w	{r3, r4, r5, r6, r7, lr}
     10a: ff f7 fe bf  	b.w	0x10a <command_start_step_prtouch+0x10a> @ imm = #-4
     10e: 00 bf        	nop

00000110 <$d>:
     110:	00 00 00 00	.word	0x00000000
     114:	00 88 c3 40	.word	0x40c38800
     118:	00 00 00 00	.word	0x00000000
     11c:	80 84 2e 41	.word	0x412e8480
     120:	00 00 00 00	.word	0x00000000
     124:	88 2a 91 41	.word	0x41912a88
     128:	00 00 00 00	.word	0x00000000
     12c:	00 00 00 00	.word	0x00000000
     130:	00 00 00 00	.word	0x00000000
     134:	04 00 00 00	.word	0x00000004

Disassembly of section .text.command_manual_get_steps:

00000000 <command_manual_get_steps>:
       0: 03 46        	mov	r3, r0
       2: f0 b5        	push	{r4, r5, r6, r7, lr}
       4: 17 48        	ldr	r0, [pc, #92]           @ 0x64 <$d>
       6: 89 b0        	sub	sp, #36
       8: 5c 68        	ldr	r4, [r3, #4]
       a: ff f7 fe ff  	bl	0xa <command_manual_get_steps+0xa> @ imm = #-4
       e: 16 49        	ldr	r1, [pc, #88]           @ 0x68 <$d+0x4>
      10: 22 46        	mov	r2, r4
      12: 01 eb 84 03  	add.w	r3, r1, r4, lsl #2
      16: 1d 46        	mov	r5, r3
      18: d3 f8 b4 30  	ldr.w	r3, [r3, #180]
      1c: d5 f8 b0 60  	ldr.w	r6, [r5, #176]
      20: d5 f8 ac 50  	ldr.w	r5, [r5, #172]
      24: 07 93        	str	r3, [sp, #28]
      26: 01 eb 84 03  	add.w	r3, r1, r4, lsl #2
      2a: d3 f8 a8 30  	ldr.w	r3, [r3, #168]
      2e: 06 96        	str	r6, [sp, #24]
      30: 01 eb 84 06  	add.w	r6, r1, r4, lsl #2
      34: d6 f8 38 71  	ldr.w	r7, [r6, #312]
      38: 05 95        	str	r5, [sp, #20]
      3a: 35 46        	mov	r5, r6
      3c: d6 f8 34 61  	ldr.w	r6, [r6, #308]
      40: 04 93        	str	r3, [sp, #16]
      42: 2b 46        	mov	r3, r5
      44: d5 f8 30 51  	ldr.w	r5, [r5, #304]
      48: d3 f8 2c 31  	ldr.w	r3, [r3, #300]
      4c: cd e9 02 67  	strd	r6, r7, [sp, #8]
      50: cd e9 00 35  	strd	r3, r5, [sp]
      54: d1 f8 9c 30  	ldr.w	r3, [r1, #156]
      58: 09 78        	ldrb	r1, [r1]
      5a: ff f7 fe ff  	bl	0x5a <command_manual_get_steps+0x5a> @ imm = #-4
      5e: 09 b0        	add	sp, #36
      60: f0 bd        	pop	{r4, r5, r6, r7, pc}
      62: 00 bf        	nop

00000064 <$d>:
      64:	00 00 00 00	.word	0x00000000
      68:	00 00 00 00	.word	0x00000000

Disassembly of section .text.prtouch_step_task:

00000000 <prtouch_step_task>:
       0: 2d e9 f0 47  	push.w	{r4, r5, r6, r7, r8, r9, r10, lr}
       4: 53 4c        	ldr	r4, [pc, #332]          @ 0x154 <$d>
       6: a8 b0        	sub	sp, #160
       8: b4 f8 a0 50  	ldrh.w	r5, [r4, #160]
       c: 00 2d        	cmp	r5, #0
       e: 00 f0 9e 80  	beq.w	0x14e <prtouch_step_task+0x14e> @ imm = #316
      12: b4 f8 a2 00  	ldrh.w	r0, [r4, #162]
      16: ff f7 fe ff  	bl	0x16 <prtouch_step_task+0x16> @ imm = #-4
      1a: 4f 49        	ldr	r1, [pc, #316]          @ 0x158 <$d+0x4>
      1c: ff f7 fe ff  	bl	0x1c <prtouch_step_task+0x1c> @ imm = #-4
      20: df f8 48 a1  	ldr.w	r10, [pc, #328]         @ 0x16c <$d+0x18>
      24: 4d 4b        	ldr	r3, [pc, #308]          @ 0x15c <$d+0x8>
      26: 07 46        	mov	r7, r0
      28: d3 e9 04 89  	ldrd	r8, r9, [r3, #16]
      2c: da e9 00 23  	ldrd	r2, r3, [r10]
      30: 40 46        	mov	r0, r8
      32: 49 46        	mov	r1, r9
      34: ca e9 02 89  	strd	r8, r9, [r10, #8]
      38: ff f7 fe ff  	bl	0x38 <prtouch_step_task+0x38> @ imm = #-4
      3c: 02 46        	mov	r2, r0
      3e: 38 46        	mov	r0, r7
      40: 16 46        	mov	r6, r2
      42: 0f 46        	mov	r7, r1
      44: ff f7 fe ff  	bl	0x44 <prtouch_step_task+0x44> @ imm = #-4
      48: 02 46        	mov	r2, r0
      4a: 0b 46        	mov	r3, r1
      4c: 30 46        	mov	r0, r6
      4e: 39 46        	mov	r1, r7
      50: ff f7 fe ff  	bl	0x50 <prtouch_step_task+0x50> @ imm = #-4
      54: 00 28        	cmp	r0, #0
      56: 7a d1        	bne	0x14e <prtouch_step_task+0x14e> @ imm = #244
      58: d4 f8 28 61  	ldr.w	r6, [r4, #296]
      5c: ca e9 00 89  	strd	r8, r9, [r10]
      60: 00 2e        	cmp	r6, #0
      62: 40 d0        	beq	0xe6 <prtouch_step_task+0xe6> @ imm = #128
      64: 01 46        	mov	r1, r0
      66: 80 22        	movs	r2, #128
      68: 08 a8        	add	r0, sp, #32
      6a: 07 af        	add	r7, sp, #28
      6c: ff f7 fe ff  	bl	0x6c <prtouch_step_task+0x6c> @ imm = #-4
      70: 32 46        	mov	r2, r6
      72: 3e 46        	mov	r6, r7
      74: 27 a9        	add	r1, sp, #156
      76: 50 42        	rsbs	r0, r2, #0
      78: 00 f0 1f 00  	and	r0, r0, #31
      7c: 02 f0 1f 03  	and	r3, r2, #31
      80: 58 bf        	it	pl
      82: 43 42        	rsbpl	r3, r0, #0
      84: 04 eb 83 03  	add.w	r3, r4, r3, lsl #2
      88: d3 f8 2c 31  	ldr.w	r3, [r3, #300]
      8c: 01 32        	adds	r2, #1
      8e: 46 f8 04 3f  	str	r3, [r6, #4]!
      92: 8e 42        	cmp	r6, r1
      94: ef d1        	bne	0x76 <prtouch_step_task+0x76> @ imm = #-34
      96: 3b 46        	mov	r3, r7
      98: 31 4a        	ldr	r2, [pc, #196]          @ 0x160 <$d+0xc>
      9a: 53 f8 04 0f  	ldr	r0, [r3, #4]!
      9e: 8b 42        	cmp	r3, r1
      a0: 42 f8 04 0f  	str	r0, [r2, #4]!
      a4: f9 d1        	bne	0x9a <prtouch_step_task+0x9a> @ imm = #-14
      a6: 00 23        	movs	r3, #0
      a8: 3e 46        	mov	r6, r7
      aa: d4 f8 a4 20  	ldr.w	r2, [r4, #164]
      ae: c4 f8 28 31  	str.w	r3, [r4, #296]
      b2: 50 42        	rsbs	r0, r2, #0
      b4: 00 f0 1f 00  	and	r0, r0, #31
      b8: 02 f0 1f 03  	and	r3, r2, #31
      bc: 58 bf        	it	pl
      be: 43 42        	rsbpl	r3, r0, #0
      c0: 04 eb 83 03  	add.w	r3, r4, r3, lsl #2
      c4: d3 f8 a8 30  	ldr.w	r3, [r3, #168]
      c8: 01 32        	adds	r2, #1
      ca: 46 f8 04 3f  	str	r3, [r6, #4]!
      ce: 8e 42        	cmp	r6, r1
      d0: ef d1        	bne	0xb2 <prtouch_step_task+0xb2> @ imm = #-34
      d2: 24 4b        	ldr	r3, [pc, #144]          @ 0x164 <$d+0x10>
      d4: 57 f8 04 2f  	ldr	r2, [r7, #4]!
      d8: 8f 42        	cmp	r7, r1
      da: 43 f8 04 2f  	str	r2, [r3, #4]!
      de: f9 d1        	bne	0xd4 <prtouch_step_task+0xd4> @ imm = #-14
      e0: 00 23        	movs	r3, #0
      e2: c4 f8 a4 30  	str.w	r3, [r4, #164]
      e6: 01 3d        	subs	r5, #1
      e8: ad b2        	uxth	r5, r5
      ea: c5 f1 07 06  	rsb.w	r6, r5, #7
      ee: b6 00        	lsls	r6, r6, #2
      f0: 1d 48        	ldr	r0, [pc, #116]          @ 0x168 <$d+0x14>
      f2: a4 f8 a0 50  	strh.w	r5, [r4, #160]
      f6: ff f7 fe ff  	bl	0xf6 <prtouch_step_task+0xf6> @ imm = #-4
      fa: 04 eb 86 01  	add.w	r1, r4, r6, lsl #2
      fe: 0a 46        	mov	r2, r1
     100: 0b 46        	mov	r3, r1
     102: d1 f8 b4 50  	ldr.w	r5, [r1, #180]
     106: d1 f8 b0 10  	ldr.w	r1, [r1, #176]
     10a: d2 f8 ac 20  	ldr.w	r2, [r2, #172]
     10e: d3 f8 a8 30  	ldr.w	r3, [r3, #168]
     112: 07 95        	str	r5, [sp, #28]
     114: 04 eb 86 05  	add.w	r5, r4, r6, lsl #2
     118: d5 f8 38 51  	ldr.w	r5, [r5, #312]
     11c: 06 91        	str	r1, [sp, #24]
     11e: 04 eb 86 01  	add.w	r1, r4, r6, lsl #2
     122: d1 f8 34 11  	ldr.w	r1, [r1, #308]
     126: 05 92        	str	r2, [sp, #20]
     128: 04 eb 86 02  	add.w	r2, r4, r6, lsl #2
     12c: d2 f8 30 21  	ldr.w	r2, [r2, #304]
     130: 04 93        	str	r3, [sp, #16]
     132: 04 eb 86 03  	add.w	r3, r4, r6, lsl #2
     136: d3 f8 2c 31  	ldr.w	r3, [r3, #300]
     13a: cd e9 02 15  	strd	r1, r5, [sp, #8]
     13e: cd e9 00 32  	strd	r3, r2, [sp]
     142: 21 78        	ldrb	r1, [r4]
     144: 32 46        	mov	r2, r6
     146: d4 f8 9c 30  	ldr.w	r3, [r4, #156]
     14a: ff f7 fe ff  	bl	0x14a <prtouch_step_task+0x14a> @ imm = #-4
     14e: 28 b0        	add	sp, #160
     150: bd e8 f0 87  	pop.w	{r4, r5, r6, r7, r8, r9, r10, pc}

00000154 <$d>:
     154:	00 00 00 00	.word	0x00000000
     158:	00 00 7a 44	.word	0x447a0000
     15c:	00 00 00 00	.word	0x00000000
     160:	28 01 00 00	.word	0x00000128
     164:	a4 00 00 00	.word	0x000000a4
     168:	00 00 00 00	.word	0x00000000
     16c:	00 00 00 00	.word	0x00000000

Disassembly of section .text.read_pres_prtouch:

00000000 <read_pres_prtouch>:
       0: 2d e9 f0 4f  	push.w	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
       4: 82 4c        	ldr	r4, [pc, #520]          @ 0x210 <$d+0x10>
       6: 06 46        	mov	r6, r0
       8: 63 8b        	ldrh	r3, [r4, #26]
       a: 83 b0        	sub	sp, #12
       c: 4b bb        	cbnz	r3, 0x62 <read_pres_prtouch+0x62> @ imm = #82
       e: 22 8b        	ldrh	r2, [r4, #24]
      10: 00 2a        	cmp	r2, #0
      12: 00 f0 e8 80  	beq.w	0x1e6 <read_pres_prtouch+0x1e6> @ imm = #464
      16: 98 46        	mov	r8, r3
      18: 1d 46        	mov	r5, r3
      1a: 04 eb c5 03  	add.w	r3, r4, r5, lsl #3
      1e: d3 e9 17 01  	ldrd	r0, r1, [r3, #92]
      22: ff f7 fe ff  	bl	0x22 <read_pres_prtouch+0x22> @ imm = #-4
      26: 27 8b        	ldrh	r7, [r4, #24]
      28: a8 40        	lsls	r0, r5
      2a: 01 35        	adds	r5, #1
      2c: bd 42        	cmp	r5, r7
      2e: 48 ea 00 08  	orr.w	r8, r8, r0
      32: f2 db        	blt	0x1a <read_pres_prtouch+0x1a> @ imm = #-28
      34: df f8 e0 a1  	ldr.w	r10, [pc, #480]         @ 0x218 <$d+0x18>
      38: b8 f1 00 0f  	cmp.w	r8, #0
      3c: 4c d0        	beq	0xd8 <read_pres_prtouch+0xd8> @ imm = #152
      3e: da e9 04 01  	ldrd	r0, r1, [r10, #16]
      42: df f8 d8 81  	ldr.w	r8, [pc, #472]          @ 0x21c <$d+0x1c>
      46: d8 e9 00 23  	ldrd	r2, r3, [r8]
      4a: ff f7 fe ff  	bl	0x4a <read_pres_prtouch+0x4a> @ imm = #-4
      4e: 6c a3        	adr	r3, #432 <read_pres_prtouch+0xbe>
      50: d3 e9 00 23  	ldrd	r2, r3, [r3]
      54: ff f7 fe ff  	bl	0x54 <read_pres_prtouch+0x54> @ imm = #-4
      58: 00 28        	cmp	r0, #0
      5a: 3f d1        	bne	0xdc <read_pres_prtouch+0xdc> @ imm = #126
      5c: 03 b0        	add	sp, #12
      5e: bd e8 f0 8f  	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
      62: 23 8b        	ldrh	r3, [r4, #24]
      64: 00 2b        	cmp	r3, #0
      66: 33 d0        	beq	0xd0 <read_pres_prtouch+0xd0> @ imm = #102
      68: 0f f2 9c 19  	adr.w	r9, #412
      6c: d9 e9 00 89  	ldrd	r8, r9, [r9]
      70: 00 23        	movs	r3, #0
      72: df f8 a4 a1  	ldr.w	r10, [pc, #420]         @ 0x218 <$d+0x18>
      76: 00 93        	str	r3, [sp]
      78: 03 1f        	subs	r3, r0, #4
      7a: 01 93        	str	r3, [sp, #4]
      7c: 00 9b        	ldr	r3, [sp]
      7e: da e9 04 67  	ldrd	r6, r7, [r10, #16]
      82: 03 f1 03 0b  	add.w	r11, r3, #3
      86: 04 eb cb 05  	add.w	r5, r4, r11, lsl #3
      8a: 04 35        	adds	r5, #4
      8c: 0a e0        	b	0xa4 <read_pres_prtouch+0xa4> @ imm = #20
      8e: 32 46        	mov	r2, r6
      90: da e9 04 01  	ldrd	r0, r1, [r10, #16]
      94: 3b 46        	mov	r3, r7
      96: ff f7 fe ff  	bl	0x96 <read_pres_prtouch+0x96> @ imm = #-4
      9a: 42 46        	mov	r2, r8
      9c: 4b 46        	mov	r3, r9
      9e: ff f7 fe ff  	bl	0x9e <read_pres_prtouch+0x9e> @ imm = #-4
      a2: 28 b1        	cbz	r0, 0xb0 <read_pres_prtouch+0xb0> @ imm = #10
      a4: 95 e8 03 00  	ldm.w	r5, {r0, r1}
      a8: ff f7 fe ff  	bl	0xa8 <read_pres_prtouch+0xa8> @ imm = #-4
      ac: 00 28        	cmp	r0, #0
      ae: ee d1        	bne	0x8e <read_pres_prtouch+0x8e> @ imm = #-36
      b0: 04 eb cb 0b  	add.w	r11, r4, r11, lsl #3
      b4: db e9 01 01  	ldrd	r0, r1, [r11, #4]
      b8: ff f7 fe ff  	bl	0xb8 <read_pres_prtouch+0xb8> @ imm = #-4
      bc: 00 9a        	ldr	r2, [sp]
      be: 23 8b        	ldrh	r3, [r4, #24]
      c0: 01 99        	ldr	r1, [sp, #4]
      c2: 01 32        	adds	r2, #1
      c4: 41 f8 04 0f  	str	r0, [r1, #4]!
      c8: 93 42        	cmp	r3, r2
      ca: 00 92        	str	r2, [sp]
      cc: 01 91        	str	r1, [sp, #4]
      ce: d5 dc        	bgt	0x7c <read_pres_prtouch+0x7c> @ imm = #-86
      d0: 01 20        	movs	r0, #1
      d2: 03 b0        	add	sp, #12
      d4: bd e8 f0 8f  	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
      d8: df f8 40 81  	ldr.w	r8, [pc, #320]          @ 0x21c <$d+0x1c>
      dc: 00 25        	movs	r5, #0
      de: 00 2f        	cmp	r7, #0
      e0: 00 f0 85 80  	beq.w	0x1ee <read_pres_prtouch+0x1ee> @ imm = #266
      e4: 04 eb c5 03  	add.w	r3, r4, r5, lsl #3
      e8: d3 e9 0f 01  	ldrd	r0, r1, [r3, #60]
      ec: 00 22        	movs	r2, #0
      ee: ff f7 fe ff  	bl	0xee <read_pres_prtouch+0xee> @ imm = #-4
      f2: 23 8b        	ldrh	r3, [r4, #24]
      f4: 01 35        	adds	r5, #1
      f6: 9d 42        	cmp	r5, r3
      f8: f4 db        	blt	0xe4 <read_pres_prtouch+0xe4> @ imm = #-24
      fa: 18 27        	movs	r7, #24
      fc: 00 2b        	cmp	r3, #0
      fe: 76 d0        	beq	0x1ee <read_pres_prtouch+0x1ee> @ imm = #236
     100: 00 25        	movs	r5, #0
     102: 04 eb c5 03  	add.w	r3, r4, r5, lsl #3
     106: d3 e9 0f 01  	ldrd	r0, r1, [r3, #60]
     10a: 01 22        	movs	r2, #1
     10c: ff f7 fe ff  	bl	0x10c <read_pres_prtouch+0x10c> @ imm = #-4
     110: 21 8b        	ldrh	r1, [r4, #24]
     112: 01 35        	adds	r5, #1
     114: 8d 42        	cmp	r5, r1
     116: f4 db        	blt	0x102 <read_pres_prtouch+0x102> @ imm = #-24
     118: 00 29        	cmp	r1, #0
     11a: 68 d0        	beq	0x1ee <read_pres_prtouch+0x1ee> @ imm = #208
     11c: 33 46        	mov	r3, r6
     11e: 06 eb 81 01  	add.w	r1, r6, r1, lsl #2
     122: 1a 68        	ldr	r2, [r3]
     124: 52 00        	lsls	r2, r2, #1
     126: 43 f8 04 2b  	str	r2, [r3], #4
     12a: 99 42        	cmp	r1, r3
     12c: f9 d1        	bne	0x122 <read_pres_prtouch+0x122> @ imm = #-14
     12e: 00 25        	movs	r5, #0
     130: 04 eb c5 03  	add.w	r3, r4, r5, lsl #3
     134: d3 e9 0f 01  	ldrd	r0, r1, [r3, #60]
     138: 00 22        	movs	r2, #0
     13a: ff f7 fe ff  	bl	0x13a <read_pres_prtouch+0x13a> @ imm = #-4
     13e: 23 8b        	ldrh	r3, [r4, #24]
     140: 01 35        	adds	r5, #1
     142: 9d 42        	cmp	r5, r3
     144: f4 db        	blt	0x130 <read_pres_prtouch+0x130> @ imm = #-24
     146: 9b b1        	cbz	r3, 0x170 <read_pres_prtouch+0x170> @ imm = #38
     148: 00 25        	movs	r5, #0
     14a: a6 f1 04 09  	sub.w	r9, r6, #4
     14e: 04 eb c5 03  	add.w	r3, r4, r5, lsl #3
     152: d3 e9 17 01  	ldrd	r0, r1, [r3, #92]
     156: ff f7 fe ff  	bl	0x156 <read_pres_prtouch+0x156> @ imm = #-4
     15a: 59 f8 04 2f  	ldr	r2, [r9, #4]!
     15e: 23 8b        	ldrh	r3, [r4, #24]
     160: 00 28        	cmp	r0, #0
     162: 18 bf        	it	ne
     164: 01 32        	addne	r2, #1
     166: 01 35        	adds	r5, #1
     168: 9d 42        	cmp	r5, r3
     16a: c9 f8 00 20  	str.w	r2, [r9]
     16e: ee db        	blt	0x14e <read_pres_prtouch+0x14e> @ imm = #-36
     170: 01 3f        	subs	r7, #1
     172: c3 d1        	bne	0xfc <read_pres_prtouch+0xfc> @ imm = #-122
     174: 00 2b        	cmp	r3, #0
     176: 3a d0        	beq	0x1ee <read_pres_prtouch+0x1ee> @ imm = #116
     178: 04 eb c7 03  	add.w	r3, r4, r7, lsl #3
     17c: d3 e9 0f 01  	ldrd	r0, r1, [r3, #60]
     180: 01 22        	movs	r2, #1
     182: ff f7 fe ff  	bl	0x182 <read_pres_prtouch+0x182> @ imm = #-4
     186: 21 8b        	ldrh	r1, [r4, #24]
     188: 01 37        	adds	r7, #1
     18a: 8f 42        	cmp	r7, r1
     18c: f4 db        	blt	0x178 <read_pres_prtouch+0x178> @ imm = #-24
     18e: 71 b3        	cbz	r1, 0x1ee <read_pres_prtouch+0x1ee> @ imm = #92
     190: 33 46        	mov	r3, r6
     192: 06 eb 81 01  	add.w	r1, r6, r1, lsl #2
     196: 53 f8 04 2b  	ldr	r2, [r3], #4
     19a: 10 02        	lsls	r0, r2, #8
     19c: 48 bf        	it	mi
     19e: 42 f0 7f 42  	orrmi	r2, r2, #4278190080
     1a2: 8b 42        	cmp	r3, r1
     1a4: 43 f8 04 2c  	str	r2, [r3, #-4]
     1a8: f5 d1        	bne	0x196 <read_pres_prtouch+0x196> @ imm = #-22
     1aa: 00 25        	movs	r5, #0
     1ac: 04 eb c5 03  	add.w	r3, r4, r5, lsl #3
     1b0: d3 e9 0f 01  	ldrd	r0, r1, [r3, #60]
     1b4: 00 22        	movs	r2, #0
     1b6: ff f7 fe ff  	bl	0x1b6 <read_pres_prtouch+0x1b6> @ imm = #-4
     1ba: 21 8b        	ldrh	r1, [r4, #24]
     1bc: 01 35        	adds	r5, #1
     1be: 8d 42        	cmp	r5, r1
     1c0: f4 db        	blt	0x1ac <read_pres_prtouch+0x1ac> @ imm = #-24
     1c2: da e9 04 23  	ldrd	r2, r3, [r10, #16]
     1c6: c8 e9 00 23  	strd	r2, r3, [r8]
     1ca: 00 29        	cmp	r1, #0
     1cc: 80 d0        	beq	0xd0 <read_pres_prtouch+0xd0> @ imm = #-256
     1ce: 11 4a        	ldr	r2, [pc, #68]           @ 0x214 <$d+0x14>
     1d0: 06 eb 81 01  	add.w	r1, r6, r1, lsl #2
     1d4: 33 68        	ldr	r3, [r6]
     1d6: 52 f8 04 0b  	ldr	r0, [r2], #4
     1da: 1b 1a        	subs	r3, r3, r0
     1dc: 46 f8 04 3b  	str	r3, [r6], #4
     1e0: 8e 42        	cmp	r6, r1
     1e2: f7 d1        	bne	0x1d4 <read_pres_prtouch+0x1d4> @ imm = #-18
     1e4: 74 e7        	b	0xd0 <read_pres_prtouch+0xd0> @ imm = #-280
     1e6: df f8 30 a0  	ldr.w	r10, [pc, #48]          @ 0x218 <$d+0x18>
     1ea: df f8 30 80  	ldr.w	r8, [pc, #48]           @ 0x21c <$d+0x1c>
     1ee: da e9 04 23  	ldrd	r2, r3, [r10, #16]
     1f2: 01 20        	movs	r0, #1
     1f4: c8 e9 00 23  	strd	r2, r3, [r8]
     1f8: 30 e7        	b	0x5c <read_pres_prtouch+0x5c> @ imm = #-416
     1fa: 00 bf        	nop
     1fc: af f3 00 80  	nop.w

00000200 <$d>:
     200:	9a 99 99 99	.word	0x9999999a
     204:	99 99 99 3f	.word	0x3f999999
     208:	fc a9 f1 d2	.word	0xd2f1a9fc
     20c:	4d 62 60 3f	.word	0x3f60624d
     210:	00 00 00 00	.word	0x00000000
     214:	48 03 00 00	.word	0x00000348
     218:	00 00 00 00	.word	0x00000000
     21c:	00 00 00 00	.word	0x00000000

Disassembly of section .text.filter_datas_prtouch:

00000000 <filter_datas_prtouch>:
       0: 2d e9 f0 4f  	push.w	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
       4: 04 46        	mov	r4, r0
       6: 80 22        	movs	r2, #128
       8: b8 4e        	ldr	r6, [pc, #736]          @ 0x2ec <$d>
       a: 83 b0        	sub	sp, #12
       c: 0d 46        	mov	r5, r1
       e: b8 48        	ldr	r0, [pc, #736]          @ 0x2f0 <$d+0x4>
      10: 00 21        	movs	r1, #0
      12: ff f7 fe ff  	bl	0x12 <filter_datas_prtouch+0x12> @ imm = #-4
      16: 4f f4 80 72  	mov.w	r2, #256
      1a: 00 21        	movs	r1, #0
      1c: b5 48        	ldr	r0, [pc, #724]          @ 0x2f4 <$d+0x8>
      1e: ff f7 fe ff  	bl	0x1e <filter_datas_prtouch+0x1e> @ imm = #-4
      22: 06 f1 04 0c  	add.w	r12, r6, #4
      26: e3 46        	mov	r11, r12
      28: 31 46        	mov	r1, r6
      2a: a0 46        	mov	r8, r4
      2c: b2 4a        	ldr	r2, [pc, #712]          @ 0x2f8 <$d+0xc>
      2e: 04 eb 44 13  	add.w	r3, r4, r4, lsl #5
      32: 18 46        	mov	r0, r3
      34: 02 eb 83 03  	add.w	r3, r2, r3, lsl #2
      38: d3 f8 00 21  	ldr.w	r2, [r3, #256]
      3c: 67 01        	lsls	r7, r4, #5
      3e: 0c f1 7c 0a  	add.w	r10, r12, #124
      42: d2 f1 00 0e  	rsbs.w	lr, r2, #0
      46: 0e f0 1f 0e  	and	lr, lr, #31
      4a: 02 f0 1f 03  	and	r3, r2, #31
      4e: aa 4c        	ldr	r4, [pc, #680]          @ 0x2f8 <$d+0xc>
      50: 58 bf        	it	pl
      52: ce f1 00 03  	rsbpl.w	r3, lr, #0
      56: 03 44        	add	r3, r0
      58: 04 eb 83 03  	add.w	r3, r4, r3, lsl #2
      5c: d3 f8 04 31  	ldr.w	r3, [r3, #260]
      60: 01 32        	adds	r2, #1
      62: 41 f8 04 3f  	str	r3, [r1, #4]!
      66: 51 45        	cmp	r1, r10
      68: eb d1        	bne	0x42 <filter_datas_prtouch+0x42> @ imm = #-42
      6a: dc f8 00 00  	ldr.w	r0, [r12]
      6e: dc f8 7c 30  	ldr.w	r3, [r12, #124]
      72: 44 46        	mov	r4, r8
      74: 83 42        	cmp	r3, r0
      76: 80 f2 ca 80  	bge.w	0x20e <filter_datas_prtouch+0x20e> @ imm = #404
      7a: 9f 4b        	ldr	r3, [pc, #636]          @ 0x2f8 <$d+0xc>
      7c: 9f 49        	ldr	r1, [pc, #636]          @ 0x2fc <$d+0x10>
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
      a8: 40 f0 b6 80  	bne.w	0x218 <filter_datas_prtouch+0x218> @ imm = #364
      ac: 00 2d        	cmp	r5, #0
      ae: 40 f0 f1 80  	bne.w	0x294 <filter_datas_prtouch+0x294> @ imm = #482
      b2: 93 4b        	ldr	r3, [pc, #588]          @ 0x300 <$d+0x14>
      b4: cd f8 04 b0  	str.w	r11, [sp, #4]
      b8: a3 f1 78 05  	sub.w	r5, r3, #120
      bc: 00 e0        	b	0xc0 <filter_datas_prtouch+0xc0> @ imm = #0
      be: 28 68        	ldr	r0, [r5]
      c0: ff f7 fe ff  	bl	0xc0 <filter_datas_prtouch+0xc0> @ imm = #-4
      c4: 04 46        	mov	r4, r0
      c6: 68 68        	ldr	r0, [r5, #4]
      c8: 0f 46        	mov	r7, r1
      ca: 00 91        	str	r1, [sp]
      cc: ff f7 fe ff  	bl	0xcc <filter_datas_prtouch+0xcc> @ imm = #-4
      d0: 80 46        	mov	r8, r0
      d2: 21 f0 00 49  	bic	r9, r1, #2147483648
      d6: 27 f0 00 47  	bic	r7, r7, #2147483648
      da: 0e 46        	mov	r6, r1
      dc: 20 46        	mov	r0, r4
      de: 39 46        	mov	r1, r7
      e0: 42 46        	mov	r2, r8
      e2: 4b 46        	mov	r3, r9
      e4: ff f7 fe ff  	bl	0xe4 <filter_datas_prtouch+0xe4> @ imm = #-4
      e8: a3 46        	mov	r11, r4
      ea: 18 b9        	cbnz	r0, 0xf4 <filter_datas_prtouch+0xf4> @ imm = #6
      ec: c3 46        	mov	r11, r8
      ee: 4f 46        	mov	r7, r9
      f0: 44 46        	mov	r4, r8
      f2: 00 96        	str	r6, [sp]
      f4: ae 68        	ldr	r6, [r5, #8]
      f6: 30 46        	mov	r0, r6
      f8: ff f7 fe ff  	bl	0xf8 <filter_datas_prtouch+0xf8> @ imm = #-4
      fc: 21 f0 00 49  	bic	r9, r1, #2147483648
     100: 5a 46        	mov	r2, r11
     102: 3b 46        	mov	r3, r7
     104: 49 46        	mov	r1, r9
     106: ff f7 fe ff  	bl	0x106 <filter_datas_prtouch+0x106> @ imm = #-4
     10a: 28 b1        	cbz	r0, 0x118 <filter_datas_prtouch+0x118> @ imm = #10
     10c: 00 9b        	ldr	r3, [sp]
     10e: 20 46        	mov	r0, r4
     110: 19 46        	mov	r1, r3
     112: ff f7 fe ff  	bl	0x112 <filter_datas_prtouch+0x112> @ imm = #-4
     116: 06 46        	mov	r6, r0
     118: 79 4b        	ldr	r3, [pc, #484]          @ 0x300 <$d+0x14>
     11a: 45 f8 04 6b  	str	r6, [r5], #4
     11e: 9d 42        	cmp	r5, r3
     120: cd d1        	bne	0xbe <filter_datas_prtouch+0xbe> @ imm = #-102
     122: 75 4e        	ldr	r6, [pc, #468]          @ 0x2f8 <$d+0xc>
     124: 77 48        	ldr	r0, [pc, #476]          @ 0x304 <$d+0x18>
     126: d6 f8 2c 13  	ldr.w	r1, [r6, #812]
     12a: ff f7 fe ff  	bl	0x12a <filter_datas_prtouch+0x12a> @ imm = #-4
     12e: ff f7 fe ff  	bl	0x12e <filter_datas_prtouch+0x12e> @ imm = #-4
     132: 04 46        	mov	r4, r0
     134: b6 f8 2a 03  	ldrh.w	r0, [r6, #810]
     138: 0d 46        	mov	r5, r1
     13a: ff f7 fe ff  	bl	0x13a <filter_datas_prtouch+0x13a> @ imm = #-4
     13e: 01 46        	mov	r1, r0
     140: 71 48        	ldr	r0, [pc, #452]          @ 0x308 <$d+0x1c>
     142: ff f7 fe ff  	bl	0x142 <filter_datas_prtouch+0x142> @ imm = #-4
     146: 01 46        	mov	r1, r0
     148: 4f f0 7e 50  	mov.w	r0, #1065353216
     14c: ff f7 fe ff  	bl	0x14c <filter_datas_prtouch+0x14c> @ imm = #-4
     150: ff f7 fe ff  	bl	0x150 <filter_datas_prtouch+0x150> @ imm = #-4
     154: 22 46        	mov	r2, r4
     156: 2b 46        	mov	r3, r5
     158: ff f7 fe ff  	bl	0x158 <filter_datas_prtouch+0x158> @ imm = #-4
     15c: 02 46        	mov	r2, r0
     15e: 0b 46        	mov	r3, r1
     160: 20 46        	mov	r0, r4
     162: 29 46        	mov	r1, r5
     164: ff f7 fe ff  	bl	0x164 <filter_datas_prtouch+0x164> @ imm = #-4
     168: 62 4e        	ldr	r6, [pc, #392]          @ 0x2f4 <$d+0x8>
     16a: 04 46        	mov	r4, r0
     16c: 0d 46        	mov	r5, r1
     16e: 37 46        	mov	r7, r6
     170: 4f f0 00 08  	mov.w	r8, #0
     174: 4f f0 00 09  	mov.w	r9, #0
     178: dd f8 04 b0  	ldr.w	r11, [sp, #4]
     17c: db f8 00 30  	ldr.w	r3, [r11]
     180: db f8 04 00  	ldr.w	r0, [r11, #4]
     184: 0b f1 04 0b  	add.w	r11, r11, #4
     188: c0 1a        	subs	r0, r0, r3
     18a: ff f7 fe ff  	bl	0x18a <filter_datas_prtouch+0x18a> @ imm = #-4
     18e: 42 46        	mov	r2, r8
     190: 4b 46        	mov	r3, r9
     192: ff f7 fe ff  	bl	0x192 <filter_datas_prtouch+0x192> @ imm = #-4
     196: 22 46        	mov	r2, r4
     198: 2b 46        	mov	r3, r5
     19a: ff f7 fe ff  	bl	0x19a <filter_datas_prtouch+0x19a> @ imm = #-4
     19e: 80 46        	mov	r8, r0
     1a0: 89 46        	mov	r9, r1
     1a2: d3 45        	cmp	r11, r10
     1a4: e7 e9 02 89  	strd	r8, r9, [r7, #8]!
     1a8: e8 d1        	bne	0x17c <filter_datas_prtouch+0x17c> @ imm = #-48
     1aa: 53 4b        	ldr	r3, [pc, #332]          @ 0x2f8 <$d+0xc>
     1ac: 00 24        	movs	r4, #0
     1ae: d3 f8 30 73  	ldr.w	r7, [r3, #816]
     1b2: 00 25        	movs	r5, #0
     1b4: 38 46        	mov	r0, r7
     1b6: ff f7 fe ff  	bl	0x1b6 <filter_datas_prtouch+0x1b6> @ imm = #-4
     1ba: 80 46        	mov	r8, r0
     1bc: 89 46        	mov	r9, r1
     1be: 4f f0 7e 50  	mov.w	r0, #1065353216
     1c2: 39 46        	mov	r1, r7
     1c4: ff f7 fe ff  	bl	0x1c4 <filter_datas_prtouch+0x1c4> @ imm = #-4
     1c8: ff f7 fe ff  	bl	0x1c8 <filter_datas_prtouch+0x1c8> @ imm = #-4
     1cc: 82 46        	mov	r10, r0
     1ce: 8b 46        	mov	r11, r1
     1d0: 4e 4f        	ldr	r7, [pc, #312]          @ 0x30c <$d+0x20>
     1d2: f6 e9 02 23  	ldrd	r2, r3, [r6, #8]!
     1d6: 40 46        	mov	r0, r8
     1d8: 49 46        	mov	r1, r9
     1da: ff f7 fe ff  	bl	0x1da <filter_datas_prtouch+0x1da> @ imm = #-4
     1de: 22 46        	mov	r2, r4
     1e0: 2b 46        	mov	r3, r5
     1e2: 04 46        	mov	r4, r0
     1e4: 0d 46        	mov	r5, r1
     1e6: 50 46        	mov	r0, r10
     1e8: 59 46        	mov	r1, r11
     1ea: ff f7 fe ff  	bl	0x1ea <filter_datas_prtouch+0x1ea> @ imm = #-4
     1ee: 02 46        	mov	r2, r0
     1f0: 0b 46        	mov	r3, r1
     1f2: 20 46        	mov	r0, r4
     1f4: 29 46        	mov	r1, r5
     1f6: ff f7 fe ff  	bl	0x1f6 <filter_datas_prtouch+0x1f6> @ imm = #-4
     1fa: 04 46        	mov	r4, r0
     1fc: 0d 46        	mov	r5, r1
     1fe: b7 42        	cmp	r7, r6
     200: c6 e9 00 45  	strd	r4, r5, [r6]
     204: e5 d1        	bne	0x1d2 <filter_datas_prtouch+0x1d2> @ imm = #-54
     206: 3b 48        	ldr	r0, [pc, #236]          @ 0x2f4 <$d+0x8>
     208: 03 b0        	add	sp, #12
     20a: bd e8 f0 8f  	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
     20e: 3a 4b        	ldr	r3, [pc, #232]          @ 0x2f8 <$d+0xc>
     210: 5a 8b        	ldrh	r2, [r3, #26]
     212: 00 2a        	cmp	r2, #0
     214: 3f f4 4a af  	beq.w	0xac <filter_datas_prtouch+0xac> @ imm = #-364
     218: 00 2d        	cmp	r5, #0
     21a: 5a d1        	bne	0x2d2 <filter_datas_prtouch+0x2d2> @ imm = #180
     21c: 3c 4c        	ldr	r4, [pc, #240]          @ 0x310 <$d+0x24>
     21e: 04 f1 08 0a  	add.w	r10, r4, #8
     222: 04 f5 80 76  	add.w	r6, r4, #256
     226: 01 e0        	b	0x22c <filter_datas_prtouch+0x22c> @ imm = #2
     228: 5b f8 04 0f  	ldr	r0, [r11, #4]!
     22c: ff f7 fe ff  	bl	0x22c <filter_datas_prtouch+0x22c> @ imm = #-4
     230: e4 e9 02 01  	strd	r0, r1, [r4, #8]!
     234: a6 42        	cmp	r6, r4
     236: f7 d1        	bne	0x228 <filter_datas_prtouch+0x228> @ imm = #-18
     238: 2f 4b        	ldr	r3, [pc, #188]          @ 0x2f8 <$d+0xc>
     23a: 57 46        	mov	r7, r10
     23c: d3 f8 30 43  	ldr.w	r4, [r3, #816]
     240: 20 46        	mov	r0, r4
     242: ff f7 fe ff  	bl	0x242 <filter_datas_prtouch+0x242> @ imm = #-4
     246: 80 46        	mov	r8, r0
     248: 89 46        	mov	r9, r1
     24a: 4f f0 7e 50  	mov.w	r0, #1065353216
     24e: 21 46        	mov	r1, r4
     250: ff f7 fe ff  	bl	0x250 <filter_datas_prtouch+0x250> @ imm = #-4
     254: ff f7 fe ff  	bl	0x254 <filter_datas_prtouch+0x254> @ imm = #-4
     258: 82 46        	mov	r10, r0
     25a: 8b 46        	mov	r11, r1
     25c: d7 e9 02 23  	ldrd	r2, r3, [r7, #8]
     260: 40 46        	mov	r0, r8
     262: 49 46        	mov	r1, r9
     264: ff f7 fe ff  	bl	0x264 <filter_datas_prtouch+0x264> @ imm = #-4
     268: d7 e9 00 23  	ldrd	r2, r3, [r7]
     26c: 04 46        	mov	r4, r0
     26e: 0d 46        	mov	r5, r1
     270: 50 46        	mov	r0, r10
     272: 59 46        	mov	r1, r11
     274: ff f7 fe ff  	bl	0x274 <filter_datas_prtouch+0x274> @ imm = #-4
     278: 02 46        	mov	r2, r0
     27a: 0b 46        	mov	r3, r1
     27c: 20 46        	mov	r0, r4
     27e: 29 46        	mov	r1, r5
     280: ff f7 fe ff  	bl	0x280 <filter_datas_prtouch+0x280> @ imm = #-4
     284: e7 e9 02 01  	strd	r0, r1, [r7, #8]!
     288: be 42        	cmp	r6, r7
     28a: e7 d1        	bne	0x25c <filter_datas_prtouch+0x25c> @ imm = #-50
     28c: 19 48        	ldr	r0, [pc, #100]          @ 0x2f4 <$d+0x8>
     28e: 03 b0        	add	sp, #12
     290: bd e8 f0 8f  	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
     294: 18 49        	ldr	r1, [pc, #96]           @ 0x2f8 <$d+0xc>
     296: 1f 4b        	ldr	r3, [pc, #124]          @ 0x314 <$d+0x28>
     298: 3a 19        	adds	r2, r7, r4
     29a: 01 eb 82 02  	add.w	r2, r1, r2, lsl #2
     29e: 02 f5 80 72  	add.w	r2, r2, #256
     2a2: 03 f1 7c 01  	add.w	r1, r3, #124
     2a6: 01 e0        	b	0x2ac <filter_datas_prtouch+0x2ac> @ imm = #2
     2a8: 53 f8 04 0b  	ldr	r0, [r3], #4
     2ac: 8b 42        	cmp	r3, r1
     2ae: 42 f8 04 0f  	str	r0, [r2, #4]!
     2b2: f9 d1        	bne	0x2a8 <filter_datas_prtouch+0x2a8> @ imm = #-14
     2b4: 00 21        	movs	r1, #0
     2b6: 10 48        	ldr	r0, [pc, #64]           @ 0x2f8 <$d+0xc>
     2b8: 3b 19        	adds	r3, r7, r4
     2ba: 02 8b        	ldrh	r2, [r0, #24]
     2bc: 00 eb 83 03  	add.w	r3, r0, r3, lsl #2
     2c0: 01 3a        	subs	r2, #1
     2c2: a2 42        	cmp	r2, r4
     2c4: c3 f8 00 11  	str.w	r1, [r3, #256]
     2c8: 50 d0        	beq	0x36c <$t+0x54>         @ imm = #160
     2ca: 0a 48        	ldr	r0, [pc, #40]           @ 0x2f4 <$d+0x8>
     2cc: 03 b0        	add	sp, #12
     2ce: bd e8 f0 8f  	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
     2d2: 00 25        	movs	r5, #0
     2d4: 08 4a        	ldr	r2, [pc, #32]           @ 0x2f8 <$d+0xc>
     2d6: 0f 4b        	ldr	r3, [pc, #60]           @ 0x314 <$d+0x28>
     2d8: 27 44        	add	r7, r4
     2da: 02 eb 87 01  	add.w	r1, r2, r7, lsl #2
     2de: 01 f5 80 72  	add.w	r2, r1, #256
     2e2: c1 f8 00 51  	str.w	r5, [r1, #256]
     2e6: 03 f1 7c 01  	add.w	r1, r3, #124
     2ea: 17 e0        	b	0x31c <$t+0x4>          @ imm = #46

000002ec <$d>:
     2ec:	fc ff ff ff	.word	0xfffffffc
     2f0:	00 00 00 00	.word	0x00000000
     2f4:	00 00 00 00	.word	0x00000000
     2f8:	00 00 00 00	.word	0x00000000
     2fc:	80 00 00 00	.word	0x00000080
     300:	78 00 00 00	.word	0x00000078
     304:	84 f9 22 3e	.word	0x3e22f984
     308:	00 00 7a 44	.word	0x447a0000
     30c:	f8 00 00 00	.word	0x000000f8
     310:	f8 ff ff ff	.word	0xfffffff8
     314:	04 00 00 00	.word	0x00000004

00000318 <$t>:
     318: 53 f8 04 0b  	ldr	r0, [r3], #4
     31c: 99 42        	cmp	r1, r3
     31e: 42 f8 04 0f  	str	r0, [r2, #4]!
     322: f9 d1        	bne	0x318 <$t>              @ imm = #-14
     324: 24 4b        	ldr	r3, [pc, #144]          @ 0x3b8 <$d>
     326: 1b 8b        	ldrh	r3, [r3, #24]
     328: 01 3b        	subs	r3, #1
     32a: a3 42        	cmp	r3, r4
     32c: cd d1        	bne	0x2ca <filter_datas_prtouch+0x2ca> @ imm = #-102
     32e: 30 46        	mov	r0, r6
     330: 21 4b        	ldr	r3, [pc, #132]          @ 0x3b8 <$d>
     332: da 6f        	ldr	r2, [r3, #124]
     334: 51 42        	rsbs	r1, r2, #0
     336: 01 f0 1f 01  	and	r1, r1, #31
     33a: 02 f0 1f 03  	and	r3, r2, #31
     33e: 58 bf        	it	pl
     340: 4b 42        	rsbpl	r3, r1, #0
     342: 1d 49        	ldr	r1, [pc, #116]          @ 0x3b8 <$d>
     344: 01 32        	adds	r2, #1
     346: 01 eb 83 03  	add.w	r3, r1, r3, lsl #2
     34a: d3 f8 80 30  	ldr.w	r3, [r3, #128]
     34e: 40 f8 04 3f  	str	r3, [r0, #4]!
     352: 50 45        	cmp	r0, r10
     354: ee d1        	bne	0x334 <$t+0x1c>         @ imm = #-36
     356: 00 22        	movs	r2, #0
     358: 01 f1 7c 03  	add.w	r3, r1, #124
     35c: ca 67        	str	r2, [r1, #124]
     35e: 56 f8 04 2f  	ldr	r2, [r6, #4]!
     362: 56 45        	cmp	r6, r10
     364: 43 f8 04 2f  	str	r2, [r3, #4]!
     368: f9 d1        	bne	0x35e <$t+0x46>         @ imm = #-14
     36a: ae e7        	b	0x2ca <filter_datas_prtouch+0x2ca> @ imm = #-164
     36c: 30 46        	mov	r0, r6
     36e: 12 4b        	ldr	r3, [pc, #72]           @ 0x3b8 <$d>
     370: da 6f        	ldr	r2, [r3, #124]
     372: c3 f8 40 23  	str.w	r2, [r3, #832]
     376: 51 42        	rsbs	r1, r2, #0
     378: 01 f0 1f 01  	and	r1, r1, #31
     37c: 02 f0 1f 03  	and	r3, r2, #31
     380: 58 bf        	it	pl
     382: 4b 42        	rsbpl	r3, r1, #0
     384: 0c 49        	ldr	r1, [pc, #48]           @ 0x3b8 <$d>
     386: 01 32        	adds	r2, #1
     388: 01 eb 83 03  	add.w	r3, r1, r3, lsl #2
     38c: d3 f8 80 30  	ldr.w	r3, [r3, #128]
     390: 40 f8 04 3f  	str	r3, [r0, #4]!
     394: 50 45        	cmp	r0, r10
     396: ee d1        	bne	0x376 <$t+0x5e>         @ imm = #-36
     398: 01 f1 7c 03  	add.w	r3, r1, #124
     39c: 56 f8 04 2f  	ldr	r2, [r6, #4]!
     3a0: 56 45        	cmp	r6, r10
     3a2: 43 f8 04 2f  	str	r2, [r3, #4]!
     3a6: f9 d1        	bne	0x39c <$t+0x84>         @ imm = #-14
     3a8: 00 23        	movs	r3, #0
     3aa: 03 4a        	ldr	r2, [pc, #12]           @ 0x3b8 <$d>
     3ac: 03 48        	ldr	r0, [pc, #12]           @ 0x3bc <$d+0x4>
     3ae: d3 67        	str	r3, [r2, #124]
     3b0: 03 b0        	add	sp, #12
     3b2: bd e8 f0 8f  	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
     3b6: 00 bf        	nop

000003b8 <$d>:
     3b8:	00 00 00 00	.word	0x00000000
     3bc:	00 00 00 00	.word	0x00000000

Disassembly of section .text.check_pres_tri_prtouch:

00000000 <check_pres_tri_prtouch>:
       0: 2d e9 f0 4f  	push.w	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
       4: df f8 dc b1  	ldr.w	r11, [pc, #476]         @ 0x1e4 <$d+0x4>
       8: 87 b0        	sub	sp, #28
       a: bb f8 1a 30  	ldrh.w	r3, [r11, #26]
       e: 00 2b        	cmp	r3, #0
      10: 48 d0        	beq	0xa4 <check_pres_tri_prtouch+0xa4> @ imm = #144
      12: 4f f0 00 09  	mov.w	r9, #0
      16: bb f8 18 30  	ldrh.w	r3, [r11, #24]
      1a: ab f8 1e 93  	strh.w	r9, [r11, #798]
      1e: 00 2b        	cmp	r3, #0
      20: 00 f0 d7 80  	beq.w	0x1d2 <check_pres_tri_prtouch+0x1d2> @ imm = #430
      24: cd f8 10 90  	str.w	r9, [sp, #16]
      28: 00 21        	movs	r1, #0
      2a: 48 46        	mov	r0, r9
      2c: ff f7 fe ff  	bl	0x2c <check_pres_tri_prtouch+0x2c> @ imm = #-4
      30: db f8 38 a3  	ldr.w	r10, [r11, #824]
      34: 04 46        	mov	r4, r0
      36: ba f1 00 0f  	cmp.w	r10, #0
      3a: 28 d0        	beq	0x8e <check_pres_tri_prtouch+0x8e> @ imm = #80
      3c: db f8 3c 03  	ldr.w	r0, [r11, #828]
      40: ff f7 fe ff  	bl	0x40 <check_pres_tri_prtouch+0x40> @ imm = #-4
      44: 00 25        	movs	r5, #0
      46: 06 46        	mov	r6, r0
      48: 0f 46        	mov	r7, r1
      4a: 4f ea ca 08  	lsl.w	r8, r10, #3
      4e: c8 f5 80 78  	rsb.w	r8, r8, #256
      52: a0 44        	add	r8, r4
      54: 04 f5 80 74  	add.w	r4, r4, #256
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
      72: bb f8 1e 33  	ldrh.w	r3, [r11, #798]
      76: bb f8 18 20  	ldrh.w	r2, [r11, #24]
      7a: 09 f1 01 09  	add.w	r9, r9, #1
      7e: 4a 45        	cmp	r2, r9
      80: ab f8 1e 33  	strh.w	r3, [r11, #798]
      84: d0 dc        	bgt	0x28 <check_pres_tri_prtouch+0x28> @ imm = #-96
      86: 04 98        	ldr	r0, [sp, #16]
      88: 07 b0        	add	sp, #28
      8a: bd e8 f0 8f  	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
      8e: 01 23        	movs	r3, #1
      90: bb f8 1e 23  	ldrh.w	r2, [r11, #798]
      94: 03 fa 09 f3  	lsl.w	r3, r3, r9
      98: 13 43        	orrs	r3, r2
      9a: 04 9a        	ldr	r2, [sp, #16]
      9c: 9b b2        	uxth	r3, r3
      9e: 01 32        	adds	r2, #1
      a0: 04 92        	str	r2, [sp, #16]
      a2: e8 e7        	b	0x76 <check_pres_tri_prtouch+0x76> @ imm = #-48
      a4: bb f8 18 20  	ldrh.w	r2, [r11, #24]
      a8: ab f8 1e 33  	strh.w	r3, [r11, #798]
      ac: 00 2a        	cmp	r2, #0
      ae: 00 f0 90 80  	beq.w	0x1d2 <check_pres_tri_prtouch+0x1d2> @ imm = #288
      b2: 9a 46        	mov	r10, r3
      b4: 04 93        	str	r3, [sp, #16]
      b6: 05 e0        	b	0xc4 <check_pres_tri_prtouch+0xc4> @ imm = #10
      b8: bb f8 18 30  	ldrh.w	r3, [r11, #24]
      bc: 0a f1 01 0a  	add.w	r10, r10, #1
      c0: 9a 45        	cmp	r10, r3
      c2: e0 da        	bge	0x86 <check_pres_tri_prtouch+0x86> @ imm = #-64
      c4: 00 21        	movs	r1, #0
      c6: 50 46        	mov	r0, r10
      c8: ff f7 fe ff  	bl	0xc8 <check_pres_tri_prtouch+0xc8> @ imm = #-4
      cc: db f8 3c 43  	ldr.w	r4, [r11, #828]
      d0: d0 e9 3e 89  	ldrd	r8, r9, [r0, #248]
      d4: 05 46        	mov	r5, r0
      d6: 20 46        	mov	r0, r4
      d8: ff f7 fe ff  	bl	0xd8 <check_pres_tri_prtouch+0xd8> @ imm = #-4
      dc: 02 46        	mov	r2, r0
      de: 0b 46        	mov	r3, r1
      e0: 40 46        	mov	r0, r8
      e2: 49 46        	mov	r1, r9
      e4: ff f7 fe ff  	bl	0xe4 <check_pres_tri_prtouch+0xe4> @ imm = #-4
      e8: b8 b1        	cbz	r0, 0x11a <check_pres_tri_prtouch+0x11a> @ imm = #46
      ea: 60 08        	lsrs	r0, r4, #1
      ec: ff f7 fe ff  	bl	0xec <check_pres_tri_prtouch+0xec> @ imm = #-4
      f0: 02 46        	mov	r2, r0
      f2: 0b 46        	mov	r3, r1
      f4: d5 e9 3c 01  	ldrd	r0, r1, [r5, #240]
      f8: ff f7 fe ff  	bl	0xf8 <check_pres_tri_prtouch+0xf8> @ imm = #-4
      fc: 68 b1        	cbz	r0, 0x11a <check_pres_tri_prtouch+0x11a> @ imm = #26
      fe: 38 4b        	ldr	r3, [pc, #224]          @ 0x1e0 <$d>
     100: a3 fb 04 30  	umull	r3, r0, r3, r4
     104: 40 08        	lsrs	r0, r0, #1
     106: ff f7 fe ff  	bl	0x106 <check_pres_tri_prtouch+0x106> @ imm = #-4
     10a: 02 46        	mov	r2, r0
     10c: 0b 46        	mov	r3, r1
     10e: d5 e9 3a 01  	ldrd	r0, r1, [r5, #232]
     112: ff f7 fe ff  	bl	0x112 <check_pres_tri_prtouch+0x112> @ imm = #-4
     116: 00 28        	cmp	r0, #0
     118: 4f d1        	bne	0x1ba <check_pres_tri_prtouch+0x1ba> @ imm = #158
     11a: db f8 00 31  	ldr.w	r3, [r11, #256]
     11e: 1f 2b        	cmp	r3, #31
     120: ca dd        	ble	0xb8 <check_pres_tri_prtouch+0xb8> @ imm = #-108
     122: d5 e9 3c 67  	ldrd	r6, r7, [r5, #240]
     126: 40 46        	mov	r0, r8
     128: 49 46        	mov	r1, r9
     12a: 32 46        	mov	r2, r6
     12c: 3b 46        	mov	r3, r7
     12e: cd e9 00 67  	strd	r6, r7, [sp]
     132: ff f7 fe ff  	bl	0x132 <check_pres_tri_prtouch+0x132> @ imm = #-4
     136: 00 28        	cmp	r0, #0
     138: be d0        	beq	0xb8 <check_pres_tri_prtouch+0xb8> @ imm = #-132
     13a: d5 e9 3a 34  	ldrd	r3, r4, [r5, #232]
     13e: 30 46        	mov	r0, r6
     140: 1a 46        	mov	r2, r3
     142: cd e9 02 34  	strd	r3, r4, [sp, #8]
     146: 39 46        	mov	r1, r7
     148: 23 46        	mov	r3, r4
     14a: ff f7 fe ff  	bl	0x14a <check_pres_tri_prtouch+0x14a> @ imm = #-4
     14e: 00 28        	cmp	r0, #0
     150: b2 d0        	beq	0xb8 <check_pres_tri_prtouch+0xb8> @ imm = #-156
     152: 00 23        	movs	r3, #0
     154: a5 f1 08 04  	sub.w	r4, r5, #8
     158: e0 35        	adds	r5, #224
     15a: cd f8 14 a0  	str.w	r10, [sp, #20]
     15e: a2 46        	mov	r10, r4
     160: 2c 46        	mov	r4, r5
     162: 1d 46        	mov	r5, r3
     164: fa e9 02 67  	ldrd	r6, r7, [r10, #8]!
     168: 40 46        	mov	r0, r8
     16a: 49 46        	mov	r1, r9
     16c: 32 46        	mov	r2, r6
     16e: 3b 46        	mov	r3, r7
     170: ff f7 fe ff  	bl	0x170 <check_pres_tri_prtouch+0x170> @ imm = #-4
     174: 70 b1        	cbz	r0, 0x194 <check_pres_tri_prtouch+0x194> @ imm = #28
     176: dd e9 00 01  	ldrd	r0, r1, [sp]
     17a: 32 46        	mov	r2, r6
     17c: 3b 46        	mov	r3, r7
     17e: ff f7 fe ff  	bl	0x17e <check_pres_tri_prtouch+0x17e> @ imm = #-4
     182: 38 b1        	cbz	r0, 0x194 <check_pres_tri_prtouch+0x194> @ imm = #14
     184: dd e9 02 01  	ldrd	r0, r1, [sp, #8]
     188: 32 46        	mov	r2, r6
     18a: 3b 46        	mov	r3, r7
     18c: ff f7 fe ff  	bl	0x18c <check_pres_tri_prtouch+0x18c> @ imm = #-4
     190: 00 b1        	cbz	r0, 0x194 <check_pres_tri_prtouch+0x194> @ imm = #0
     192: 01 35        	adds	r5, #1
     194: 54 45        	cmp	r4, r10
     196: e5 d1        	bne	0x164 <check_pres_tri_prtouch+0x164> @ imm = #-54
     198: 1d 2d        	cmp	r5, #29
     19a: dd f8 14 a0  	ldr.w	r10, [sp, #20]
     19e: 8b d1        	bne	0xb8 <check_pres_tri_prtouch+0xb8> @ imm = #-234
     1a0: db f8 38 03  	ldr.w	r0, [r11, #824]
     1a4: ff f7 fe ff  	bl	0x1a4 <check_pres_tri_prtouch+0x1a4> @ imm = #-4
     1a8: 02 46        	mov	r2, r0
     1aa: 0b 46        	mov	r3, r1
     1ac: 40 46        	mov	r0, r8
     1ae: 49 46        	mov	r1, r9
     1b0: ff f7 fe ff  	bl	0x1b0 <check_pres_tri_prtouch+0x1b0> @ imm = #-4
     1b4: 00 28        	cmp	r0, #0
     1b6: 7f f4 7f af  	bne.w	0xb8 <check_pres_tri_prtouch+0xb8> @ imm = #-258
     1ba: 01 23        	movs	r3, #1
     1bc: bb f8 1e 23  	ldrh.w	r2, [r11, #798]
     1c0: 03 fa 0a f3  	lsl.w	r3, r3, r10
     1c4: 13 43        	orrs	r3, r2
     1c6: 04 9a        	ldr	r2, [sp, #16]
     1c8: ab f8 1e 33  	strh.w	r3, [r11, #798]
     1cc: 01 32        	adds	r2, #1
     1ce: 04 92        	str	r2, [sp, #16]
     1d0: 72 e7        	b	0xb8 <check_pres_tri_prtouch+0xb8> @ imm = #-284
     1d2: 00 23        	movs	r3, #0
     1d4: 04 93        	str	r3, [sp, #16]
     1d6: 04 98        	ldr	r0, [sp, #16]
     1d8: 07 b0        	add	sp, #28
     1da: bd e8 f0 8f  	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
     1de: 00 bf        	nop

000001e0 <$d>:
     1e0:	ab aa aa aa	.word	0xaaaaaaab
     1e4:	00 00 00 00	.word	0x00000000

Disassembly of section .text.command_config_pres_prtouch:

00000000 <command_config_pres_prtouch>:
       0: 70 b5        	push	{r4, r5, r6, lr}
       2: 04 46        	mov	r4, r0
       4: 03 c8        	ldm	r0, {r0, r1}
       6: a2 68        	ldr	r2, [r4, #8]
       8: 10 4b        	ldr	r3, [pc, #64]           @ 0x4c <$d>
       a: 82 b0        	sub	sp, #8
       c: 18 80        	strh	r0, [r3]
       e: 20 69        	ldr	r0, [r4, #16]
      10: 59 83        	strh	r1, [r3, #26]
      12: 1a 83        	strh	r2, [r3, #24]
      14: ff f7 fe ff  	bl	0x14 <command_config_pres_prtouch+0x14> @ imm = #-4
      18: 0d 49        	ldr	r1, [pc, #52]           @ 0x50 <$d+0x4>
      1a: ff f7 fe ff  	bl	0x1a <command_config_pres_prtouch+0x1a> @ imm = #-4
      1e: 6e 46        	mov	r6, sp
      20: 0c 4b        	ldr	r3, [pc, #48]           @ 0x54 <$d+0x8>
      22: e1 68        	ldr	r1, [r4, #12]
      24: 00 22        	movs	r2, #0
      26: 98 61        	str	r0, [r3, #24]
      28: 0b 4d        	ldr	r5, [pc, #44]           @ 0x58 <$d+0xc>
      2a: 30 46        	mov	r0, r6
      2c: ff f7 fe ff  	bl	0x2c <command_config_pres_prtouch+0x2c> @ imm = #-4
      30: 96 e8 03 00  	ldm.w	r6, {r0, r1}
      34: 00 22        	movs	r2, #0
      36: 85 e8 03 00  	stm.w	r5, {r0, r1}
      3a: ff f7 fe ff  	bl	0x3a <command_config_pres_prtouch+0x3a> @ imm = #-4
      3e: 20 46        	mov	r0, r4
      40: 02 b0        	add	sp, #8
      42: bd e8 70 40  	pop.w	{r4, r5, r6, lr}
      46: ff f7 fe bf  	b.w	0x46 <command_config_pres_prtouch+0x46> @ imm = #-4
      4a: 00 bf        	nop

0000004c <$d>:
      4c:	00 00 00 00	.word	0x00000000
      50:	00 50 c3 47	.word	0x47c35000
      54:	00 00 00 00	.word	0x00000000
      58:	00 00 00 00	.word	0x00000000

Disassembly of section .text.command_add_pres_prtouch:

00000000 <command_add_pres_prtouch>:
       0: 2d e9 f0 41  	push.w	{r4, r5, r6, r7, r8, lr}
       4: 1e 4d        	ldr	r5, [pc, #120]          @ 0x80 <$d>
       6: 04 46        	mov	r4, r0
       8: 6f 8b        	ldrh	r7, [r5, #26]
       a: 43 68        	ldr	r3, [r0, #4]
       c: 86 b0        	sub	sp, #24
       e: 97 b1        	cbz	r7, 0x36 <command_add_pres_prtouch+0x36> @ imm = #36
      10: 03 33        	adds	r3, #3
      12: 04 ae        	add	r6, sp, #16
      14: 05 eb c3 05  	add.w	r5, r5, r3, lsl #3
      18: 30 46        	mov	r0, r6
      1a: a1 68        	ldr	r1, [r4, #8]
      1c: 04 35        	adds	r5, #4
      1e: ff f7 fe ff  	bl	0x1e <command_add_pres_prtouch+0x1e> @ imm = #-4
      22: 96 e8 03 00  	ldm.w	r6, {r0, r1}
      26: 85 e8 03 00  	stm.w	r5, {r0, r1}
      2a: 20 46        	mov	r0, r4
      2c: 06 b0        	add	sp, #24
      2e: bd e8 f0 41  	pop.w	{r4, r5, r6, r7, r8, lr}
      32: ff f7 fe bf  	b.w	0x32 <command_add_pres_prtouch+0x32> @ imm = #-4
      36: 0d f1 08 08  	add.w	r8, sp, #8
      3a: 07 33        	adds	r3, #7
      3c: 05 eb c3 06  	add.w	r6, r5, r3, lsl #3
      40: 40 46        	mov	r0, r8
      42: 3a 46        	mov	r2, r7
      44: a1 68        	ldr	r1, [r4, #8]
      46: ff f7 fe ff  	bl	0x46 <command_add_pres_prtouch+0x46> @ imm = #-4
      4a: 98 e8 03 00  	ldm.w	r8, {r0, r1}
      4e: 33 1d        	adds	r3, r6, #4
      50: 6e 46        	mov	r6, sp
      52: 83 e8 03 00  	stm.w	r3, {r0, r1}
      56: 63 68        	ldr	r3, [r4, #4]
      58: 30 46        	mov	r0, r6
      5a: 0b 33        	adds	r3, #11
      5c: 05 eb c3 05  	add.w	r5, r5, r3, lsl #3
      60: e1 68        	ldr	r1, [r4, #12]
      62: 3a 46        	mov	r2, r7
      64: 04 35        	adds	r5, #4
      66: ff f7 fe ff  	bl	0x66 <command_add_pres_prtouch+0x66> @ imm = #-4
      6a: 96 e8 03 00  	ldm.w	r6, {r0, r1}
      6e: 85 e8 03 00  	stm.w	r5, {r0, r1}
      72: 20 46        	mov	r0, r4
      74: 06 b0        	add	sp, #24
      76: bd e8 f0 41  	pop.w	{r4, r5, r6, r7, r8, lr}
      7a: ff f7 fe bf  	b.w	0x7a <command_add_pres_prtouch+0x7a> @ imm = #-4
      7e: 00 bf        	nop

00000080 <$d>:
      80:	00 00 00 00	.word	0x00000000

Disassembly of section .text.command_write_swap_prtouch:

00000000 <command_write_swap_prtouch>:
       0: 10 b5        	push	{r4, lr}
       2: 04 46        	mov	r4, r0
       4: 08 4b        	ldr	r3, [pc, #32]           @ 0x28 <$d>
       6: 42 68        	ldr	r2, [r0, #4]
       8: 93 e8 03 00  	ldm.w	r3, {r0, r1}
       c: ff f7 fe ff  	bl	0xc <command_write_swap_prtouch+0xc> @ imm = #-4
      10: 20 46        	mov	r0, r4
      12: ff f7 fe ff  	bl	0x12 <command_write_swap_prtouch+0x12> @ imm = #-4
      16: 05 48        	ldr	r0, [pc, #20]           @ 0x2c <$d+0x4>
      18: ff f7 fe ff  	bl	0x18 <command_write_swap_prtouch+0x18> @ imm = #-4
      1c: bd e8 10 40  	pop.w	{r4, lr}
      20: 03 4b        	ldr	r3, [pc, #12]           @ 0x30 <$d+0x8>
      22: 19 88        	ldrh	r1, [r3]
      24: ff f7 fe bf  	b.w	0x24 <command_write_swap_prtouch+0x24> @ imm = #-4

00000028 <$d>:
      28:	00 00 00 00	.word	0x00000000
      2c:	00 00 00 00	.word	0x00000000
      30:	00 00 00 00	.word	0x00000000

Disassembly of section .text.command_read_pres_prtouch:

00000000 <command_read_pres_prtouch>:
       0: 2d e9 70 43  	push.w	{r4, r5, r6, r8, r9, lr}
       4: 86 68        	ldr	r6, [r0, #8]
       6: 36 b3        	cbz	r6, 0x56 <command_read_pres_prtouch+0x56> @ imm = #76
       8: 19 4d        	ldr	r5, [pc, #100]          @ 0x70 <$d>
       a: 04 46        	mov	r4, r0
       c: 2b 68        	ldr	r3, [r5]
       e: f3 b1        	cbz	r3, 0x4e <command_read_pres_prtouch+0x4e> @ imm = #60
      10: d5 e9 04 89  	ldrd	r8, r9, [r5, #16]
      14: 00 20        	movs	r0, #0
      16: 17 4d        	ldr	r5, [pc, #92]           @ 0x74 <$d+0x4>
      18: 61 68        	ldr	r1, [r4, #4]
      1a: d5 e9 02 23  	ldrd	r2, r3, [r5, #8]
      1e: a5 f8 1a 03  	strh.w	r0, [r5, #794]
      22: a5 f8 18 13  	strh.w	r1, [r5, #792]
      26: 40 46        	mov	r0, r8
      28: 49 46        	mov	r1, r9
      2a: c5 e9 04 89  	strd	r8, r9, [r5, #16]
      2e: a5 f8 1c 63  	strh.w	r6, [r5, #796]
      32: ff f7 fe ff  	bl	0x32 <command_read_pres_prtouch+0x32> @ imm = #-4
      36: 00 22        	movs	r2, #0
      38: 00 23        	movs	r3, #0
      3a: ff f7 fe ff  	bl	0x3a <command_read_pres_prtouch+0x3a> @ imm = #-4
      3e: 08 b9        	cbnz	r0, 0x44 <command_read_pres_prtouch+0x44> @ imm = #2
      40: c5 e9 02 89  	strd	r8, r9, [r5, #8]
      44: 20 46        	mov	r0, r4
      46: bd e8 70 43  	pop.w	{r4, r5, r6, r8, r9, lr}
      4a: ff f7 fe bf  	b.w	0x4a <command_read_pres_prtouch+0x4a> @ imm = #-4
      4e: ff f7 fe ff  	bl	0x4e <command_read_pres_prtouch+0x4e> @ imm = #-4
      52: a6 68        	ldr	r6, [r4, #8]
      54: dc e7        	b	0x10 <command_read_pres_prtouch+0x10> @ imm = #-72
      56: 06 4b        	ldr	r3, [pc, #24]           @ 0x70 <$d>
      58: 06 4a        	ldr	r2, [pc, #24]           @ 0x74 <$d+0x4>
      5a: 1b 68        	ldr	r3, [r3]
      5c: a2 f8 1c 63  	strh.w	r6, [r2, #796]
      60: 01 2b        	cmp	r3, #1
      62: 01 d0        	beq	0x68 <command_read_pres_prtouch+0x68> @ imm = #2
      64: bd e8 70 83  	pop.w	{r4, r5, r6, r8, r9, pc}
      68: bd e8 70 43  	pop.w	{r4, r5, r6, r8, r9, lr}
      6c: ff f7 fe bf  	b.w	0x6c <command_read_pres_prtouch+0x6c> @ imm = #-4

00000070 <$d>:
      70:	00 00 00 00	.word	0x00000000
      74:	00 00 00 00	.word	0x00000000

Disassembly of section .text.command_deal_avgs_prtouch:

00000000 <command_deal_avgs_prtouch>:
       0: 2d e9 f0 4f  	push.w	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
       4: 62 4f        	ldr	r7, [pc, #392]          @ 0x190 <$d>
       6: 87 b0        	sub	sp, #28
       8: 80 46        	mov	r8, r0
       a: ff f7 fe ff  	bl	0xa <command_deal_avgs_prtouch+0xa> @ imm = #-4
       e: 3b 68        	ldr	r3, [r7]
      10: 0b b9        	cbnz	r3, 0x16 <command_deal_avgs_prtouch+0x16> @ imm = #2
      12: ff f7 fe ff  	bl	0x12 <command_deal_avgs_prtouch+0x12> @ imm = #-4
      16: 00 23        	movs	r3, #0
      18: 5e 4e        	ldr	r6, [pc, #376]          @ 0x194 <$d+0x4>
      1a: 74 8b        	ldrh	r4, [r6, #26]
      1c: c6 e9 d3 33  	strd	r3, r3, [r6, #844]
      20: c6 f8 54 33  	str.w	r3, [r6, #852]
      24: c6 f8 48 33  	str.w	r3, [r6, #840]
      28: 00 2c        	cmp	r4, #0
      2a: 40 f0 9b 80  	bne.w	0x164 <command_deal_avgs_prtouch+0x164> @ imm = #310
      2e: d8 f8 04 50  	ldr.w	r5, [r8, #4]
      32: 00 2d        	cmp	r5, #0
      34: 00 f0 96 80  	beq.w	0x164 <command_deal_avgs_prtouch+0x164> @ imm = #300
      38: 33 8b        	ldrh	r3, [r6, #24]
      3a: 93 b1        	cbz	r3, 0x62 <command_deal_avgs_prtouch+0x62> @ imm = #36
      3c: 25 46        	mov	r5, r4
      3e: 06 f5 82 73  	add.w	r3, r6, #260
      42: 80 22        	movs	r2, #128
      44: 18 46        	mov	r0, r3
      46: 43 f8 04 5c  	str	r5, [r3, #-4]
      4a: 00 21        	movs	r1, #0
      4c: ff f7 fe ff  	bl	0x4c <command_deal_avgs_prtouch+0x4c> @ imm = #-4
      50: 03 46        	mov	r3, r0
      52: 32 8b        	ldrh	r2, [r6, #24]
      54: 01 34        	adds	r4, #1
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
      8e: 1e d0        	beq	0xce <command_deal_avgs_prtouch+0xce> @ imm = #60
      90: 00 21        	movs	r1, #0
      92: 40 48        	ldr	r0, [pc, #256]          @ 0x194 <$d+0x4>
      94: 0d f1 08 0e  	add.w	lr, sp, #8
      98: d0 f8 00 31  	ldr.w	r3, [r0, #256]
      9c: 01 eb 41 12  	add.w	r2, r1, r1, lsl #5
      a0: d3 f1 00 0a  	rsbs.w	r10, r3, #0
      a4: 0a f0 1f 0a  	and	r10, r10, #31
      a8: 03 f0 1f 09  	and	r9, r3, #31
      ac: 58 bf        	it	pl
      ae: ca f1 00 09  	rsbpl.w	r9, r10, #0
      b2: 4a 44        	add	r2, r9
      b4: 01 31        	adds	r1, #1
      b6: 5e f8 04 9b  	ldr	r9, [lr], #4
      ba: 01 33        	adds	r3, #1
      bc: 06 eb 82 02  	add.w	r2, r6, r2, lsl #2
      c0: 61 45        	cmp	r1, r12
      c2: c2 f8 04 91  	str.w	r9, [r2, #260]
      c6: 00 f1 84 00  	add.w	r0, r0, #132
      ca: c3 67        	str	r3, [r0, #124]
      cc: e4 db        	blt	0x98 <command_deal_avgs_prtouch+0x98> @ imm = #-56
      ce: 08 f1 01 08  	add.w	r8, r8, #1
      d2: 45 45        	cmp	r5, r8
      d4: ce d1        	bne	0x74 <command_deal_avgs_prtouch+0x74> @ imm = #-100
      d6: bc f1 00 0f  	cmp.w	r12, #0
      da: 43 d0        	beq	0x164 <command_deal_avgs_prtouch+0x164> @ imm = #134
      dc: 4f f0 00 0a  	mov.w	r10, #0
      e0: 2d 4c        	ldr	r4, [pc, #180]          @ 0x198 <$d+0x8>
      e2: c5 eb 85 78  	rsb	r8, r5, r5, lsl #30
      e6: 04 eb 85 04  	add.w	r4, r4, r5, lsl #2
      ea: 4f ea 88 08  	lsl.w	r8, r8, #2
      ee: 4f ea 85 09  	lsl.w	r9, r5, #2
      f2: 0c eb 4c 1b  	add.w	r11, r12, r12, lsl #5
      f6: 4f f0 00 0e  	mov.w	lr, #0
      fa: 04 eb 08 00  	add.w	r0, r4, r8
      fe: 75 45        	cmp	r5, lr
     100: c8 bf        	it	gt
     102: 03 46        	movgt	r3, r0
     104: 08 dd        	ble	0x118 <command_deal_avgs_prtouch+0x118> @ imm = #16
     106: 53 f8 04 1f  	ldr	r1, [r3, #4]!
     10a: 42 68        	ldr	r2, [r0, #4]
     10c: 8a 42        	cmp	r2, r1
     10e: 84 bf        	itt	hi
     110: 41 60        	strhi	r1, [r0, #4]
     112: 1a 60        	strhi	r2, [r3]
     114: a3 42        	cmp	r3, r4
     116: f6 d1        	bne	0x106 <command_deal_avgs_prtouch+0x106> @ imm = #-20
     118: 0e f1 01 0e  	add.w	lr, lr, #1
     11c: 75 45        	cmp	r5, lr
     11e: 00 f1 04 00  	add.w	r0, r0, #4
     122: ec d1        	bne	0xfe <command_deal_avgs_prtouch+0xfe> @ imm = #-40
     124: 0a f1 21 0a  	add.w	r10, r10, #33
     128: da 45        	cmp	r10, r11
     12a: 04 f1 84 04  	add.w	r4, r4, #132
     12e: e2 d1        	bne	0xf6 <command_deal_avgs_prtouch+0xf6> @ imm = #-60
     130: 1a 4c        	ldr	r4, [pc, #104]          @ 0x19c <$d+0xc>
     132: 04 3d        	subs	r5, #4
     134: a4 f5 14 70  	sub.w	r0, r4, #592
     138: 08 f1 10 08  	add.w	r8, r8, #16
     13c: 04 eb 8c 0c  	add.w	r12, r4, r12, lsl #2
     140: 48 44        	add	r0, r9
     142: 54 f8 04 2b  	ldr	r2, [r4], #4
     146: 08 eb 00 03  	add.w	r3, r8, r0
     14a: 53 f8 04 1f  	ldr	r1, [r3, #4]!
     14e: 83 42        	cmp	r3, r0
     150: 0a 44        	add	r2, r1
     152: fa d1        	bne	0x14a <command_deal_avgs_prtouch+0x14a> @ imm = #-12
     154: 92 fb f5 f2  	sdiv	r2, r2, r5
     158: a4 45        	cmp	r12, r4
     15a: 00 f1 84 00  	add.w	r0, r0, #132
     15e: 44 f8 04 2c  	str	r2, [r4, #-4]
     162: ee d1        	bne	0x142 <command_deal_avgs_prtouch+0x142> @ imm = #-36
     164: 3b 68        	ldr	r3, [r7]
     166: 01 2b        	cmp	r3, #1
     168: 0e d0        	beq	0x188 <command_deal_avgs_prtouch+0x188> @ imm = #28
     16a: 0d 48        	ldr	r0, [pc, #52]           @ 0x1a0 <$d+0x10>
     16c: ff f7 fe ff  	bl	0x16c <command_deal_avgs_prtouch+0x16c> @ imm = #-4
     170: d6 e9 d4 32  	ldrd	r3, r2, [r6, #848]
     174: 31 88        	ldrh	r1, [r6]
     176: cd e9 00 32  	strd	r3, r2, [sp]
     17a: d6 e9 d2 23  	ldrd	r2, r3, [r6, #840]
     17e: ff f7 fe ff  	bl	0x17e <command_deal_avgs_prtouch+0x17e> @ imm = #-4
     182: 07 b0        	add	sp, #28
     184: bd e8 f0 8f  	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
     188: ff f7 fe ff  	bl	0x188 <command_deal_avgs_prtouch+0x188> @ imm = #-4
     18c: ed e7        	b	0x16a <command_deal_avgs_prtouch+0x16a> @ imm = #-38
     18e: 00 bf        	nop

00000190 <$d>:
     190:	00 00 00 00	.word	0x00000000
     194:	00 00 00 00	.word	0x00000000
     198:	00 01 00 00	.word	0x00000100
     19c:	48 03 00 00	.word	0x00000348
     1a0:	00 00 00 00	.word	0x00000000

Disassembly of section .text.command_start_pres_prtouch:

00000000 <command_start_pres_prtouch>:
       0: f8 b5        	push	{r3, r4, r5, r6, r7, lr}
       2: 05 46        	mov	r5, r0
       4: ff f7 fe ff  	bl	0x4 <command_start_pres_prtouch+0x4> @ imm = #-4
       8: 3f 4b        	ldr	r3, [pc, #252]          @ 0x108 <$d+0x8>
       a: 00 22        	movs	r2, #0
       c: 93 e8 03 00  	ldm.w	r3, {r0, r1}
      10: ff f7 fe ff  	bl	0x10 <command_start_pres_prtouch+0x10> @ imm = #-4
      14: 2b 69        	ldr	r3, [r5, #16]
      16: 00 2b        	cmp	r3, #0
      18: 64 d0        	beq	0xe4 <command_start_pres_prtouch+0xe4> @ imm = #200
      1a: 3c 4e        	ldr	r6, [pc, #240]          @ 0x10c <$d+0xc>
      1c: 33 68        	ldr	r3, [r6]
      1e: 00 2b        	cmp	r3, #0
      20: 5d d0        	beq	0xde <command_start_pres_prtouch+0xde> @ imm = #186
      22: 6b 68        	ldr	r3, [r5, #4]
      24: 3a 4c        	ldr	r4, [pc, #232]          @ 0x110 <$d+0x10>
      26: 00 2b        	cmp	r3, #0
      28: 0c bf        	ite	eq
      2a: 00 23        	moveq	r3, #0
      2c: 1f 23        	movne	r3, #31
      2e: 80 22        	movs	r2, #128
      30: 00 21        	movs	r1, #0
      32: 04 f1 80 00  	add.w	r0, r4, #128
      36: e3 67        	str	r3, [r4, #124]
      38: ff f7 fe ff  	bl	0x38 <command_start_pres_prtouch+0x38> @ imm = #-4
      3c: 30 a3        	adr	r3, #192 <command_start_pres_prtouch+0x70>
      3e: d3 e9 00 23  	ldrd	r2, r3, [r3]
      42: d6 e9 04 01  	ldrd	r0, r1, [r6, #16]
      46: ff f7 fe ff  	bl	0x46 <command_start_pres_prtouch+0x46> @ imm = #-4
      4a: ff f7 fe ff  	bl	0x4a <command_start_pres_prtouch+0x4a> @ imm = #-4
      4e: 04 f1 7c 03  	add.w	r3, r4, #124
      52: 04 f1 fc 02  	add.w	r2, r4, #252
      56: 43 f8 04 0f  	str	r0, [r3, #4]!
      5a: 9a 42        	cmp	r2, r3
      5c: fb d1        	bne	0x56 <command_start_pres_prtouch+0x56> @ imm = #-10
      5e: 23 8b        	ldrh	r3, [r4, #24]
      60: a3 b1        	cbz	r3, 0x8c <command_start_pres_prtouch+0x8c> @ imm = #40
      62: 00 26        	movs	r6, #0
      64: 2b 4b        	ldr	r3, [pc, #172]          @ 0x114 <$d+0x14>
      66: 69 68        	ldr	r1, [r5, #4]
      68: 80 22        	movs	r2, #128
      6a: 00 29        	cmp	r1, #0
      6c: 0c bf        	ite	eq
      6e: 00 27        	moveq	r7, #0
      70: 1f 27        	movne	r7, #31
      72: 18 46        	mov	r0, r3
      74: 43 f8 04 7c  	str	r7, [r3, #-4]
      78: 00 21        	movs	r1, #0
      7a: ff f7 fe ff  	bl	0x7a <command_start_pres_prtouch+0x7a> @ imm = #-4
      7e: 03 46        	mov	r3, r0
      80: 22 8b        	ldrh	r2, [r4, #24]
      82: 01 36        	adds	r6, #1
      84: 96 42        	cmp	r6, r2
      86: 03 f1 84 03  	add.w	r3, r3, #132
      8a: ec db        	blt	0x66 <command_start_pres_prtouch+0x66> @ imm = #-40
      8c: d5 e9 03 23  	ldrd	r2, r3, [r5, #12]
      90: 69 68        	ldr	r1, [r5, #4]
      92: 68 69        	ldr	r0, [r5, #20]
      94: a4 f8 28 23  	strh.w	r2, [r4, #808]
      98: a4 f8 34 33  	strh.w	r3, [r4, #820]
      9c: a4 f8 20 13  	strh.w	r1, [r4, #800]
      a0: ff f7 fe ff  	bl	0xa0 <command_start_pres_prtouch+0xa0> @ imm = #-4
      a4: 1c 49        	ldr	r1, [pc, #112]          @ 0x118 <$d+0x18>
      a6: ff f7 fe ff  	bl	0xa6 <command_start_pres_prtouch+0xa6> @ imm = #-4
      aa: 03 46        	mov	r3, r0
      ac: a8 69        	ldr	r0, [r5, #24]
      ae: c4 f8 2c 33  	str.w	r3, [r4, #812]
      b2: ff f7 fe ff  	bl	0xb2 <command_start_pres_prtouch+0xb2> @ imm = #-4
      b6: 18 49        	ldr	r1, [pc, #96]           @ 0x118 <$d+0x18>
      b8: ff f7 fe ff  	bl	0xb8 <command_start_pres_prtouch+0xb8> @ imm = #-4
      bc: 00 23        	movs	r3, #0
      be: ea 69        	ldr	r2, [r5, #28]
      c0: c4 f8 30 03  	str.w	r0, [r4, #816]
      c4: c4 f8 38 23  	str.w	r2, [r4, #824]
      c8: 2a 6a        	ldr	r2, [r5, #32]
      ca: c4 f8 14 33  	str.w	r3, [r4, #788]
      ce: c4 f8 3c 23  	str.w	r2, [r4, #828]
      d2: c4 f8 10 33  	str.w	r3, [r4, #784]
      d6: ab 68        	ldr	r3, [r5, #8]
      d8: a4 f8 2a 33  	strh.w	r3, [r4, #810]
      dc: f8 bd        	pop	{r3, r4, r5, r6, r7, pc}
      de: ff f7 fe ff  	bl	0xde <command_start_pres_prtouch+0xde> @ imm = #-4
      e2: 9e e7        	b	0x22 <command_start_pres_prtouch+0x22> @ imm = #-196
      e4: 09 4a        	ldr	r2, [pc, #36]           @ 0x10c <$d+0xc>
      e6: 0a 49        	ldr	r1, [pc, #40]           @ 0x110 <$d+0x10>
      e8: 12 68        	ldr	r2, [r2]
      ea: a1 f8 2a 33  	strh.w	r3, [r1, #810]
      ee: 01 2a        	cmp	r2, #1
      f0: f4 d1        	bne	0xdc <command_start_pres_prtouch+0xdc> @ imm = #-24
      f2: bd e8 f8 40  	pop.w	{r3, r4, r5, r6, r7, lr}
      f6: ff f7 fe bf  	b.w	0xf6 <command_start_pres_prtouch+0xf6> @ imm = #-4
      fa: 00 bf        	nop
      fc: af f3 00 80  	nop.w

00000100 <$d>:
     100:	00 00 00 00	.word	0x00000000
     104:	00 88 c3 40	.word	0x40c38800
     108:	00 00 00 00	.word	0x00000000
     10c:	00 00 00 00	.word	0x00000000
     110:	00 00 00 00	.word	0x00000000
     114:	04 01 00 00	.word	0x00000104
     118:	00 00 7a 44	.word	0x447a0000

Disassembly of section .text.command_manual_get_pres:

00000000 <command_manual_get_pres>:
       0: 03 46        	mov	r3, r0
       2: 70 b5        	push	{r4, r5, r6, lr}
       4: 1f 48        	ldr	r0, [pc, #124]          @ 0x84 <$d>
       6: 8c b0        	sub	sp, #48
       8: 5c 68        	ldr	r4, [r3, #4]
       a: ff f7 fe ff  	bl	0xa <command_manual_get_pres+0xa> @ imm = #-4
       e: 1e 49        	ldr	r1, [pc, #120]          @ 0x88 <$d+0x4>
      10: 22 46        	mov	r2, r4
      12: 01 eb 84 03  	add.w	r3, r1, r4, lsl #2
      16: 1d 46        	mov	r5, r3
      18: d3 f8 0c 32  	ldr.w	r3, [r3, #524]
      1c: d5 f8 88 61  	ldr.w	r6, [r5, #392]
      20: d5 f8 04 51  	ldr.w	r5, [r5, #260]
      24: 05 93        	str	r3, [sp, #20]
      26: 01 eb 84 03  	add.w	r3, r1, r4, lsl #2
      2a: d3 f8 80 30  	ldr.w	r3, [r3, #128]
      2e: cd e9 03 56  	strd	r5, r6, [sp, #12]
      32: 01 eb 84 05  	add.w	r5, r1, r4, lsl #2
      36: d5 f8 94 62  	ldr.w	r6, [r5, #660]
      3a: 02 93        	str	r3, [sp, #8]
      3c: 2b 46        	mov	r3, r5
      3e: d5 f8 10 52  	ldr.w	r5, [r5, #528]
      42: d3 f8 8c 31  	ldr.w	r3, [r3, #396]
      46: 0b 96        	str	r6, [sp, #44]
      48: 01 eb 84 06  	add.w	r6, r1, r4, lsl #2
      4c: d6 f8 08 61  	ldr.w	r6, [r6, #264]
      50: 0a 95        	str	r5, [sp, #40]
      52: 01 eb 84 05  	add.w	r5, r1, r4, lsl #2
      56: 2c 46        	mov	r4, r5
      58: d5 f8 84 50  	ldr.w	r5, [r5, #132]
      5c: d4 f8 90 42  	ldr.w	r4, [r4, #656]
      60: 09 93        	str	r3, [sp, #36]
      62: d1 f8 40 33  	ldr.w	r3, [r1, #832]
      66: 08 96        	str	r6, [sp, #32]
      68: 01 93        	str	r3, [sp, #4]
      6a: 91 f8 1e 33  	ldrb.w	r3, [r1, #798]
      6e: 07 95        	str	r5, [sp, #28]
      70: 00 93        	str	r3, [sp]
      72: d1 f8 14 33  	ldr.w	r3, [r1, #788]
      76: 09 78        	ldrb	r1, [r1]
      78: 06 94        	str	r4, [sp, #24]
      7a: ff f7 fe ff  	bl	0x7a <command_manual_get_pres+0x7a> @ imm = #-4
      7e: 0c b0        	add	sp, #48
      80: 70 bd        	pop	{r4, r5, r6, pc}
      82: 00 bf        	nop

00000084 <$d>:
      84:	00 00 00 00	.word	0x00000000
      88:	00 00 00 00	.word	0x00000000

Disassembly of section .text.prtouch_pres_task:

00000000 <prtouch_pres_task>:
       0: 00 23        	movs	r3, #0
       2: 2d e9 f0 4f  	push.w	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
       6: b6 4c        	ldr	r4, [pc, #728]          @ 0x2e0 <$d+0x8>
       8: 91 b0        	sub	sp, #68
       a: b4 f8 2a 53  	ldrh.w	r5, [r4, #810]
       e: cd e9 0c 33  	strd	r3, r3, [sp, #48]
      12: cd e9 0e 33  	strd	r3, r3, [sp, #56]
      16: 00 2d        	cmp	r5, #0
      18: 00 f0 93 80  	beq.w	0x142 <prtouch_pres_task+0x142> @ imm = #294
      1c: 63 8b        	ldrh	r3, [r4, #26]
      1e: fb b1        	cbz	r3, 0x60 <prtouch_pres_task+0x60> @ imm = #62
      20: d4 e9 02 23  	ldrd	r2, r3, [r4, #8]
      24: af 49        	ldr	r1, [pc, #700]          @ 0x2e4 <$d+0xc>
      26: d1 e9 04 67  	ldrd	r6, r7, [r1, #16]
      2a: 30 46        	mov	r0, r6
      2c: 39 46        	mov	r1, r7
      2e: c4 e9 04 67  	strd	r6, r7, [r4, #16]
      32: ff f7 fe ff  	bl	0x32 <prtouch_pres_task+0x32> @ imm = #-4
      36: 80 46        	mov	r8, r0
      38: 28 46        	mov	r0, r5
      3a: 89 46        	mov	r9, r1
      3c: ff f7 fe ff  	bl	0x3c <prtouch_pres_task+0x3c> @ imm = #-4
      40: a9 49        	ldr	r1, [pc, #676]          @ 0x2e8 <$d+0x10>
      42: ff f7 fe ff  	bl	0x42 <prtouch_pres_task+0x42> @ imm = #-4
      46: ff f7 fe ff  	bl	0x46 <prtouch_pres_task+0x46> @ imm = #-4
      4a: 02 46        	mov	r2, r0
      4c: 0b 46        	mov	r3, r1
      4e: 40 46        	mov	r0, r8
      50: 49 46        	mov	r1, r9
      52: ff f7 fe ff  	bl	0x52 <prtouch_pres_task+0x52> @ imm = #-4
      56: 00 28        	cmp	r0, #0
      58: 40 f0 30 81  	bne.w	0x2bc <prtouch_pres_task+0x2bc> @ imm = #608
      5c: c4 e9 02 67  	strd	r6, r7, [r4, #8]
      60: 0c a8        	add	r0, sp, #48
      62: ff f7 fe ff  	bl	0x62 <prtouch_pres_task+0x62> @ imm = #-4
      66: 00 28        	cmp	r0, #0
      68: 00 f0 28 81  	beq.w	0x2bc <prtouch_pres_task+0x2bc> @ imm = #592
      6c: 9a a3        	adr	r3, #616 <prtouch_pres_task+0x10a>
      6e: d3 e9 00 23  	ldrd	r2, r3, [r3]
      72: e6 6f        	ldr	r6, [r4, #124]
      74: 9b 4d        	ldr	r5, [pc, #620]          @ 0x2e4 <$d+0xc>
      76: 71 42        	rsbs	r1, r6, #0
      78: 01 f0 1f 01  	and	r1, r1, #31
      7c: 06 f0 1f 07  	and	r7, r6, #31
      80: 58 bf        	it	pl
      82: 4f 42        	rsbpl	r7, r1, #0
      84: d5 e9 04 01  	ldrd	r0, r1, [r5, #16]
      88: ff f7 fe ff  	bl	0x88 <prtouch_pres_task+0x88> @ imm = #-4
      8c: ff f7 fe ff  	bl	0x8c <prtouch_pres_task+0x8c> @ imm = #-4
      90: b4 f8 18 e0  	ldrh.w	lr, [r4, #24]
      94: 04 eb 87 07  	add.w	r7, r4, r7, lsl #2
      98: 01 36        	adds	r6, #1
      9a: c7 f8 80 00  	str.w	r0, [r7, #128]
      9e: e6 67        	str	r6, [r4, #124]
      a0: be f1 00 0f  	cmp.w	lr, #0
      a4: 1d d0        	beq	0xe2 <prtouch_pres_task+0xe2> @ imm = #58
      a6: 00 20        	movs	r0, #0
      a8: 8d 4e        	ldr	r6, [pc, #564]          @ 0x2e0 <$d+0x8>
      aa: 0c aa        	add	r2, sp, #48
      ac: d6 f8 00 31  	ldr.w	r3, [r6, #256]
      b0: 00 eb 40 11  	add.w	r1, r0, r0, lsl #5
      b4: d3 f1 00 0c  	rsbs.w	r12, r3, #0
      b8: 0c f0 1f 0c  	and	r12, r12, #31
      bc: 03 f0 1f 07  	and	r7, r3, #31
      c0: 58 bf        	it	pl
      c2: cc f1 00 07  	rsbpl.w	r7, r12, #0
      c6: 39 44        	add	r1, r7
      c8: 01 30        	adds	r0, #1
      ca: 52 f8 04 7b  	ldr	r7, [r2], #4
      ce: 01 33        	adds	r3, #1
      d0: 04 eb 81 01  	add.w	r1, r4, r1, lsl #2
      d4: 70 45        	cmp	r0, lr
      d6: c1 f8 04 71  	str.w	r7, [r1, #260]
      da: 06 f1 84 06  	add.w	r6, r6, #132
      de: f3 67        	str	r3, [r6, #124]
      e0: e4 db        	blt	0xac <prtouch_pres_task+0xac> @ imm = #-56
      e2: ff f7 fe ff  	bl	0xe2 <prtouch_pres_task+0xe2> @ imm = #-4
      e6: b4 f8 34 33  	ldrh.w	r3, [r4, #820]
      ea: 83 42        	cmp	r3, r0
      ec: 00 f3 e6 80  	bgt.w	0x2bc <prtouch_pres_task+0x2bc> @ imm = #460
      f0: b4 f8 1e 33  	ldrh.w	r3, [r4, #798]
      f4: 00 2b        	cmp	r3, #0
      f6: 00 f0 e1 80  	beq.w	0x2bc <prtouch_pres_task+0x2bc> @ imm = #450
      fa: 77 a3        	adr	r3, #476 <prtouch_pres_task+0x175>
      fc: d3 e9 00 23  	ldrd	r2, r3, [r3]
     100: d5 e9 04 01  	ldrd	r0, r1, [r5, #16]
     104: 00 26        	movs	r6, #0
     106: a4 f8 2a 63  	strh.w	r6, [r4, #810]
     10a: ff f7 fe ff  	bl	0x10a <prtouch_pres_task+0x10a> @ imm = #-4
     10e: ff f7 fe ff  	bl	0x10e <prtouch_pres_task+0x10e> @ imm = #-4
     112: 07 46        	mov	r7, r0
     114: 75 4b        	ldr	r3, [pc, #468]          @ 0x2ec <$d+0x14>
     116: 01 22        	movs	r2, #1
     118: 93 e8 03 00  	ldm.w	r3, {r0, r1}
     11c: c4 f8 14 73  	str.w	r7, [r4, #788]
     120: ff f7 fe ff  	bl	0x120 <prtouch_pres_task+0x120> @ imm = #-4
     124: 23 8b        	ldrh	r3, [r4, #24]
     126: 3b b1        	cbz	r3, 0x138 <prtouch_pres_task+0x138> @ imm = #14
     128: 30 46        	mov	r0, r6
     12a: 01 21        	movs	r1, #1
     12c: ff f7 fe ff  	bl	0x12c <prtouch_pres_task+0x12c> @ imm = #-4
     130: 23 8b        	ldrh	r3, [r4, #24]
     132: 01 36        	adds	r6, #1
     134: b3 42        	cmp	r3, r6
     136: f7 dc        	bgt	0x128 <prtouch_pres_task+0x128> @ imm = #-18
     138: 10 23        	movs	r3, #16
     13a: 9a 46        	mov	r10, r3
     13c: c4 f8 10 33  	str.w	r3, [r4, #784]
     140: 58 e0        	b	0x1f4 <prtouch_pres_task+0x1f4> @ imm = #176
     142: b4 f8 1c 33  	ldrh.w	r3, [r4, #796]
     146: 00 2b        	cmp	r3, #0
     148: 4e d0        	beq	0x1e8 <prtouch_pres_task+0x1e8> @ imm = #156
     14a: 63 8b        	ldrh	r3, [r4, #26]
     14c: 13 b3        	cbz	r3, 0x194 <prtouch_pres_task+0x194> @ imm = #68
     14e: b4 f8 18 03  	ldrh.w	r0, [r4, #792]
     152: ff f7 fe ff  	bl	0x152 <prtouch_pres_task+0x152> @ imm = #-4
     156: 64 49        	ldr	r1, [pc, #400]          @ 0x2e8 <$d+0x10>
     158: ff f7 fe ff  	bl	0x158 <prtouch_pres_task+0x158> @ imm = #-4
     15c: d4 e9 02 23  	ldrd	r2, r3, [r4, #8]
     160: 60 49        	ldr	r1, [pc, #384]          @ 0x2e4 <$d+0xc>
     162: 05 46        	mov	r5, r0
     164: d1 e9 04 89  	ldrd	r8, r9, [r1, #16]
     168: 40 46        	mov	r0, r8
     16a: 49 46        	mov	r1, r9
     16c: c4 e9 04 89  	strd	r8, r9, [r4, #16]
     170: ff f7 fe ff  	bl	0x170 <prtouch_pres_task+0x170> @ imm = #-4
     174: 06 46        	mov	r6, r0
     176: 28 46        	mov	r0, r5
     178: 0f 46        	mov	r7, r1
     17a: ff f7 fe ff  	bl	0x17a <prtouch_pres_task+0x17a> @ imm = #-4
     17e: 02 46        	mov	r2, r0
     180: 0b 46        	mov	r3, r1
     182: 30 46        	mov	r0, r6
     184: 39 46        	mov	r1, r7
     186: ff f7 fe ff  	bl	0x186 <prtouch_pres_task+0x186> @ imm = #-4
     18a: 00 28        	cmp	r0, #0
     18c: 40 f0 96 80  	bne.w	0x2bc <prtouch_pres_task+0x2bc> @ imm = #300
     190: c4 e9 02 89  	strd	r8, r9, [r4, #8]
     194: 0c a8        	add	r0, sp, #48
     196: ff f7 fe ff  	bl	0x196 <prtouch_pres_task+0x196> @ imm = #-4
     19a: 00 28        	cmp	r0, #0
     19c: 00 f0 8e 80  	beq.w	0x2bc <prtouch_pres_task+0x2bc> @ imm = #284
     1a0: 53 48        	ldr	r0, [pc, #332]          @ 0x2f0 <$d+0x18>
     1a2: ff f7 fe ff  	bl	0x1a2 <prtouch_pres_task+0x1a2> @ imm = #-4
     1a6: 4c a3        	adr	r3, #304 <prtouch_pres_task+0x1f6>
     1a8: d3 e9 00 23  	ldrd	r2, r3, [r3]
     1ac: 4d 4d        	ldr	r5, [pc, #308]          @ 0x2e4 <$d+0xc>
     1ae: 80 46        	mov	r8, r0
     1b0: d5 e9 04 01  	ldrd	r0, r1, [r5, #16]
     1b4: ff f7 fe ff  	bl	0x1b4 <prtouch_pres_task+0x1b4> @ imm = #-4
     1b8: ff f7 fe ff  	bl	0x1b8 <prtouch_pres_task+0x1b8> @ imm = #-4
     1bc: dd e9 0e 67  	ldrd	r6, r7, [sp, #56]
     1c0: 0d 99        	ldr	r1, [sp, #52]
     1c2: 02 46        	mov	r2, r0
     1c4: 0c 9b        	ldr	r3, [sp, #48]
     1c6: 00 91        	str	r1, [sp]
     1c8: 40 46        	mov	r0, r8
     1ca: cd e9 01 67  	strd	r6, r7, [sp, #4]
     1ce: 21 88        	ldrh	r1, [r4]
     1d0: ff f7 fe ff  	bl	0x1d0 <prtouch_pres_task+0x1d0> @ imm = #-4
     1d4: b4 f8 1a 33  	ldrh.w	r3, [r4, #794]
     1d8: b4 f8 1c 23  	ldrh.w	r2, [r4, #796]
     1dc: 01 33        	adds	r3, #1
     1de: 9b b2        	uxth	r3, r3
     1e0: 9a 42        	cmp	r2, r3
     1e2: a4 f8 1a 33  	strh.w	r3, [r4, #794]
     1e6: 6c d0        	beq	0x2c2 <prtouch_pres_task+0x2c2> @ imm = #216
     1e8: d4 f8 10 a3  	ldr.w	r10, [r4, #784]
     1ec: ba f1 00 0f  	cmp.w	r10, #0
     1f0: 64 d0        	beq	0x2bc <prtouch_pres_task+0x2bc> @ imm = #200
     1f2: 3c 4d        	ldr	r5, [pc, #240]          @ 0x2e4 <$d+0xc>
     1f4: b4 f8 28 03  	ldrh.w	r0, [r4, #808]
     1f8: ff f7 fe ff  	bl	0x1f8 <prtouch_pres_task+0x1f8> @ imm = #-4
     1fc: 3a 49        	ldr	r1, [pc, #232]          @ 0x2e8 <$d+0x10>
     1fe: ff f7 fe ff  	bl	0x1fe <prtouch_pres_task+0x1fe> @ imm = #-4
     202: d5 e9 04 67  	ldrd	r6, r7, [r5, #16]
     206: 84 46        	mov	r12, r0
     208: df f8 ec b0  	ldr.w	r11, [pc, #236]         @ 0x2f8 <$d+0x20>
     20c: 30 46        	mov	r0, r6
     20e: db e9 00 23  	ldrd	r2, r3, [r11]
     212: 39 46        	mov	r1, r7
     214: cb e9 02 67  	strd	r6, r7, [r11, #8]
     218: 65 46        	mov	r5, r12
     21a: ff f7 fe ff  	bl	0x21a <prtouch_pres_task+0x21a> @ imm = #-4
     21e: 80 46        	mov	r8, r0
     220: 28 46        	mov	r0, r5
     222: 89 46        	mov	r9, r1
     224: ff f7 fe ff  	bl	0x224 <prtouch_pres_task+0x224> @ imm = #-4
     228: 02 46        	mov	r2, r0
     22a: 0b 46        	mov	r3, r1
     22c: 40 46        	mov	r0, r8
     22e: 49 46        	mov	r1, r9
     230: ff f7 fe ff  	bl	0x230 <prtouch_pres_task+0x230> @ imm = #-4
     234: 00 28        	cmp	r0, #0
     236: 41 d1        	bne	0x2bc <prtouch_pres_task+0x2bc> @ imm = #130
     238: 0a f1 ff 33  	add.w	r3, r10, #4294967295
     23c: c3 f1 0f 05  	rsb.w	r5, r3, #15
     240: 6d 00        	lsls	r5, r5, #1
     242: 2c 48        	ldr	r0, [pc, #176]          @ 0x2f4 <$d+0x1c>
     244: cb e9 00 67  	strd	r6, r7, [r11]
     248: c4 f8 10 33  	str.w	r3, [r4, #784]
     24c: ff f7 fe ff  	bl	0x24c <prtouch_pres_task+0x24c> @ imm = #-4
     250: 04 eb 85 01  	add.w	r1, r4, r5, lsl #2
     254: 0a 46        	mov	r2, r1
     256: 0b 46        	mov	r3, r1
     258: d1 f8 0c 62  	ldr.w	r6, [r1, #524]
     25c: d1 f8 88 11  	ldr.w	r1, [r1, #392]
     260: d2 f8 04 21  	ldr.w	r2, [r2, #260]
     264: d3 f8 80 30  	ldr.w	r3, [r3, #128]
     268: cd e9 04 16  	strd	r1, r6, [sp, #16]
     26c: 04 eb 85 01  	add.w	r1, r4, r5, lsl #2
     270: d1 f8 94 12  	ldr.w	r1, [r1, #660]
     274: 03 92        	str	r2, [sp, #12]
     276: 04 eb 85 02  	add.w	r2, r4, r5, lsl #2
     27a: d2 f8 10 22  	ldr.w	r2, [r2, #528]
     27e: 04 eb 85 06  	add.w	r6, r4, r5, lsl #2
     282: 02 93        	str	r3, [sp, #8]
     284: 04 eb 85 03  	add.w	r3, r4, r5, lsl #2
     288: d3 f8 8c 31  	ldr.w	r3, [r3, #396]
     28c: d6 f8 08 71  	ldr.w	r7, [r6, #264]
     290: 0b 91        	str	r1, [sp, #44]
     292: d6 f8 84 10  	ldr.w	r1, [r6, #132]
     296: 0a 92        	str	r2, [sp, #40]
     298: d6 f8 90 62  	ldr.w	r6, [r6, #656]
     29c: 09 93        	str	r3, [sp, #36]
     29e: d4 f8 40 33  	ldr.w	r3, [r4, #832]
     2a2: 07 91        	str	r1, [sp, #28]
     2a4: 01 93        	str	r3, [sp, #4]
     2a6: 94 f8 1e 33  	ldrb.w	r3, [r4, #798]
     2aa: 2a 46        	mov	r2, r5
     2ac: 00 93        	str	r3, [sp]
     2ae: 21 78        	ldrb	r1, [r4]
     2b0: d4 f8 14 33  	ldr.w	r3, [r4, #788]
     2b4: 08 97        	str	r7, [sp, #32]
     2b6: 06 96        	str	r6, [sp, #24]
     2b8: ff f7 fe ff  	bl	0x2b8 <prtouch_pres_task+0x2b8> @ imm = #-4
     2bc: 11 b0        	add	sp, #68
     2be: bd e8 f0 8f  	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
     2c2: 00 22        	movs	r2, #0
     2c4: 2b 68        	ldr	r3, [r5]
     2c6: a4 f8 1c 23  	strh.w	r2, [r4, #796]
     2ca: 01 2b        	cmp	r3, #1
     2cc: 8c d1        	bne	0x1e8 <prtouch_pres_task+0x1e8> @ imm = #-232
     2ce: ff f7 fe ff  	bl	0x2ce <prtouch_pres_task+0x2ce> @ imm = #-4
     2d2: 89 e7        	b	0x1e8 <prtouch_pres_task+0x1e8> @ imm = #-238
     2d4: af f3 00 80  	nop.w

000002d8 <$d>:
     2d8:	00 00 00 00	.word	0x00000000
     2dc:	00 88 c3 40	.word	0x40c38800
     2e0:	00 00 00 00	.word	0x00000000
     2e4:	00 00 00 00	.word	0x00000000
     2e8:	00 00 7a 44	.word	0x447a0000
     2ec:	00 00 00 00	.word	0x00000000
     2f0:	00 00 00 00	.word	0x00000000
     2f4:	44 00 00 00	.word	0x00000044
     2f8:	00 00 00 00	.word	0x00000000

Disassembly of section .text.prtouch_task:

00000000 <prtouch_task>:
       0: 08 b5        	push	{r3, lr}
       2: ff f7 fe ff  	bl	0x2 <prtouch_task+0x2>  @ imm = #-4
       6: bd e8 08 40  	pop.w	{r3, lr}
       a: ff f7 fe bf  	b.w	0xa <prtouch_task+0xa>  @ imm = #-4
       e: 00 bf        	nop
