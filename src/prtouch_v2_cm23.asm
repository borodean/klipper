
prtouch_v2_cm23.o:	file format elf32-littlearm

Disassembly of section .text.sys_time_event:

00000000 <sys_time_event>:
       0: 70 b5        	push	{r4, r5, r6, lr}
       2: 40 f2 00 04  	movw	r4, #0
       6: ff f7 fe ff  	bl	0x6 <sys_time_event+0x6> @ imm = #-4
       a: 45 f2 40 41  	movw	r1, #21568
       e: c0 f2 00 04  	movt	r4, #0
      12: a6 69        	ldr	r6, [r4, #24]
      14: 05 00        	movs	r5, r0
      16: c4 f6 89 41  	movt	r1, #19593
      1a: 30 1c        	adds	r0, r6, #0
      1c: ff f7 fe ff  	bl	0x1c <sys_time_event+0x1c> @ imm = #-4
      20: ff f7 fe ff  	bl	0x20 <sys_time_event+0x20> @ imm = #-4
      24: 40 19        	adds	r0, r0, r5
      26: e0 60        	str	r0, [r4, #12]
      28: 30 1c        	adds	r0, r6, #0
      2a: ff f7 fe ff  	bl	0x2a <sys_time_event+0x2a> @ imm = #-4
      2e: 02 00        	movs	r2, r0
      30: 0b 00        	movs	r3, r1
      32: 20 69        	ldr	r0, [r4, #16]
      34: 61 69        	ldr	r1, [r4, #20]
      36: ff f7 fe ff  	bl	0x36 <sys_time_event+0x36> @ imm = #-4
      3a: 20 61        	str	r0, [r4, #16]
      3c: 61 61        	str	r1, [r4, #20]
      3e: 01 20        	movs	r0, #1
      40: 70 bd        	pop	{r4, r5, r6, pc}
      42: c0 46        	mov	r8, r8

Disassembly of section .text.start_sys_time.part.0:

00000000 <start_sys_time.part.0>:
       0: 70 b5        	push	{r4, r5, r6, lr}
       2: 40 f2 00 04  	movw	r4, #0
       6: 01 23        	movs	r3, #1
       8: c0 f2 00 04  	movt	r4, #0
       c: 23 60        	str	r3, [r4]
       e: 40 f2 00 03  	movw	r3, #0
      12: c0 f2 00 03  	movt	r3, #0
      16: a3 60        	str	r3, [r4, #8]
      18: ff f7 fe ff  	bl	0x18 <start_sys_time.part.0+0x18> @ imm = #-4
      1c: 45 f2 40 41  	movw	r1, #21568
      20: 05 00        	movs	r5, r0
      22: c4 f6 89 41  	movt	r1, #19593
      26: a0 69        	ldr	r0, [r4, #24]
      28: ff f7 fe ff  	bl	0x28 <start_sys_time.part.0+0x28> @ imm = #-4
      2c: ff f7 fe ff  	bl	0x2c <start_sys_time.part.0+0x2c> @ imm = #-4
      30: 40 19        	adds	r0, r0, r5
      32: e0 60        	str	r0, [r4, #12]
      34: 20 1d        	adds	r0, r4, #4
      36: ff f7 fe ff  	bl	0x36 <start_sys_time.part.0+0x36> @ imm = #-4
      3a: 70 bd        	pop	{r4, r5, r6, pc}

Disassembly of section .text.stop_sys_time.part.0:

00000000 <stop_sys_time.part.0>:
       0: 10 b5        	push	{r4, lr}
       2: 40 f2 00 04  	movw	r4, #0
       6: c0 f2 00 04  	movt	r4, #0
       a: 20 1d        	adds	r0, r4, #4
       c: ff f7 fe ff  	bl	0xc <stop_sys_time.part.0+0xc> @ imm = #-4
      10: 00 23        	movs	r3, #0
      12: 23 60        	str	r3, [r4]
      14: 10 bd        	pop	{r4, pc}
      16: c0 46        	mov	r8, r8

Disassembly of section .text.pr_fifo_write:

00000000 <pr_fifo_write>:
       0: 1f 23        	movs	r3, #31
       2: 02 68        	ldr	r2, [r0]
       4: 30 b5        	push	{r4, r5, lr}
       6: d4 17        	asrs	r4, r2, #31
       8: e4 0e        	lsrs	r4, r4, #27
       a: 15 19        	adds	r5, r2, r4
       c: 2b 40        	ands	r3, r5
       e: 1b 1b        	subs	r3, r3, r4
      10: 9b 00        	lsls	r3, r3, #2
      12: c3 18        	adds	r3, r0, r3
      14: 01 32        	adds	r2, #1
      16: 59 60        	str	r1, [r3, #4]
      18: 02 60        	str	r2, [r0]
      1a: 30 bd        	pop	{r4, r5, pc}

Disassembly of section .text.pr_fifo_read:

00000000 <pr_fifo_read>:
       0: 30 b5        	push	{r4, r5, lr}
       2: 00 22        	movs	r2, #0
       4: 1f 25        	movs	r5, #31
       6: 03 68        	ldr	r3, [r0]
       8: d3 18        	adds	r3, r2, r3
       a: dc 17        	asrs	r4, r3, #31
       c: e4 0e        	lsrs	r4, r4, #27
       e: 1b 19        	adds	r3, r3, r4
      10: 2b 40        	ands	r3, r5
      12: 1b 1b        	subs	r3, r3, r4
      14: 9b 00        	lsls	r3, r3, #2
      16: c3 18        	adds	r3, r0, r3
      18: 5c 68        	ldr	r4, [r3, #4]
      1a: 93 00        	lsls	r3, r2, #2
      1c: 01 32        	adds	r2, #1
      1e: cc 50        	str	r4, [r1, r3]
      20: 20 2a        	cmp	r2, #32
      22: f0 d1        	bne	0x6 <pr_fifo_read+0x6>  @ imm = #-32
      24: 30 bd        	pop	{r4, r5, pc}
      26: c0 46        	mov	r8, r8

Disassembly of section .text.start_sys_time:

00000000 <start_sys_time>:
       0: 40 f2 00 03  	movw	r3, #0
       4: c0 f2 00 03  	movt	r3, #0
       8: 1b 68        	ldr	r3, [r3]
       a: 10 b5        	push	{r4, lr}
       c: 0b b9        	cbnz	r3, 0x12 <start_sys_time+0x12> @ imm = #2
       e: ff f7 fe ff  	bl	0xe <start_sys_time+0xe> @ imm = #-4
      12: 10 bd        	pop	{r4, pc}

Disassembly of section .text.stop_sys_time:

00000000 <stop_sys_time>:
       0: 40 f2 00 03  	movw	r3, #0
       4: c0 f2 00 03  	movt	r3, #0
       8: 1b 68        	ldr	r3, [r3]
       a: 10 b5        	push	{r4, lr}
       c: 01 2b        	cmp	r3, #1
       e: 00 d0        	beq	0x12 <stop_sys_time+0x12> @ imm = #0
      10: 10 bd        	pop	{r4, pc}
      12: ff f7 fe ff  	bl	0x12 <stop_sys_time+0x12> @ imm = #-4
      16: fb e7        	b	0x10 <stop_sys_time+0x10> @ imm = #-10

Disassembly of section .text.get_sys_tick_s:

00000000 <get_sys_tick_s>:
       0: 40 f2 00 03  	movw	r3, #0
       4: c0 f2 00 03  	movt	r3, #0
       8: 18 69        	ldr	r0, [r3, #16]
       a: 59 69        	ldr	r1, [r3, #20]
       c: 70 47        	bx	lr
       e: c0 46        	mov	r8, r8

Disassembly of section .text.write_swap_sta:

00000000 <write_swap_sta>:
       0: 40 f2 00 03  	movw	r3, #0
       4: 10 b5        	push	{r4, lr}
       6: c0 f2 00 03  	movt	r3, #0
       a: c1 b2        	uxtb	r1, r0
       c: 18 68        	ldr	r0, [r3]
       e: ff f7 fe ff  	bl	0xe <write_swap_sta+0xe> @ imm = #-4
      12: 10 bd        	pop	{r4, pc}

Disassembly of section .text.read_swap_sta:

00000000 <read_swap_sta>:
       0: 40 f2 00 03  	movw	r3, #0
       4: 10 b5        	push	{r4, lr}
       6: c0 f2 00 03  	movt	r3, #0
       a: 18 79        	ldrb	r0, [r3, #4]
       c: ff f7 fe ff  	bl	0xc <read_swap_sta+0xc> @ imm = #-4
      10: 10 bd        	pop	{r4, pc}
      12: c0 46        	mov	r8, r8

Disassembly of section .text.send_debug_args:

00000000 <send_debug_args>:
       0: 10 b5        	push	{r4, lr}
       2: 04 00        	movs	r4, r0
       4: 40 f2 00 00  	movw	r0, #0
       8: 86 b0        	sub	sp, #24
       a: c0 f2 00 00  	movt	r0, #0
       e: ff f7 fe ff  	bl	0xe <send_debug_args+0xe> @ imm = #-4
      12: 62 69        	ldr	r2, [r4, #20]
      14: 23 68        	ldr	r3, [r4]
      16: 04 92        	str	r2, [sp, #16]
      18: 22 69        	ldr	r2, [r4, #16]
      1a: 21 78        	ldrb	r1, [r4]
      1c: 03 92        	str	r2, [sp, #12]
      1e: e2 68        	ldr	r2, [r4, #12]
      20: 02 92        	str	r2, [sp, #8]
      22: a2 68        	ldr	r2, [r4, #8]
      24: 01 92        	str	r2, [sp, #4]
      26: 62 68        	ldr	r2, [r4, #4]
      28: 00 92        	str	r2, [sp]
      2a: 40 f2 33 12  	movw	r2, #307
      2e: ff f7 fe ff  	bl	0x2e <send_debug_args+0x2e> @ imm = #-4
      32: 06 b0        	add	sp, #24
      34: 10 bd        	pop	{r4, pc}
      36: c0 46        	mov	r8, r8

Disassembly of section .text.check_delay:

00000000 <check_delay>:
       0: f8 b5        	push	{r3, r4, r5, r6, r7, lr}
       2: 40 f2 00 03  	movw	r3, #0
       6: ce 46        	mov	lr, r9
       8: 47 46        	mov	r7, r8
       a: c0 f2 00 03  	movt	r3, #0
       e: 80 b5        	push	{r7, lr}
      10: 1c 69        	ldr	r4, [r3, #16]
      12: 5d 69        	ldr	r5, [r3, #20]
      14: 02 68        	ldr	r2, [r0]
      16: 43 68        	ldr	r3, [r0, #4]
      18: 89 46        	mov	r9, r1
      1a: 84 60        	str	r4, [r0, #8]
      1c: c5 60        	str	r5, [r0, #12]
      1e: 80 46        	mov	r8, r0
      20: 29 00        	movs	r1, r5
      22: 20 00        	movs	r0, r4
      24: ff f7 fe ff  	bl	0x24 <check_delay+0x24> @ imm = #-4
      28: 06 00        	movs	r6, r0
      2a: 48 46        	mov	r0, r9
      2c: 0f 00        	movs	r7, r1
      2e: ff f7 fe ff  	bl	0x2e <check_delay+0x2e> @ imm = #-4
      32: 02 00        	movs	r2, r0
      34: 0b 00        	movs	r3, r1
      36: 30 00        	movs	r0, r6
      38: 39 00        	movs	r1, r7
      3a: ff f7 fe ff  	bl	0x3a <check_delay+0x3a> @ imm = #-4
      3e: 38 b9        	cbnz	r0, 0x50 <check_delay+0x50> @ imm = #14
      40: 43 46        	mov	r3, r8
      42: 1c 60        	str	r4, [r3]
      44: 5d 60        	str	r5, [r3, #4]
      46: 01 30        	adds	r0, #1
      48: 0c bc        	pop	{r2, r3}
      4a: 90 46        	mov	r8, r2
      4c: 99 46        	mov	r9, r3
      4e: f8 bd        	pop	{r3, r4, r5, r6, r7, pc}
      50: 00 20        	movs	r0, #0
      52: f9 e7        	b	0x48 <check_delay+0x48> @ imm = #-14

Disassembly of section .text.deal_dirs_prtouch:

00000000 <deal_dirs_prtouch>:
       0: f0 b5        	push	{r4, r5, r6, r7, lr}
       2: 40 f2 00 06  	movw	r6, #0
       6: c6 46        	mov	lr, r8
       8: c0 f2 00 06  	movt	r6, #0
       c: 33 8c        	ldrh	r3, [r6, #32]
       e: 80 46        	mov	r8, r0
      10: 0f 00        	movs	r7, r1
      12: 00 b5        	push	{lr}
      14: b3 b1        	cbz	r3, 0x44 <deal_dirs_prtouch+0x44> @ imm = #44
      16: 35 00        	movs	r5, r6
      18: 00 24        	movs	r4, #0
      1a: 00 2f        	cmp	r7, #0
      1c: 15 dc        	bgt	0x4a <deal_dirs_prtouch+0x4a> @ imm = #42
      1e: 69 8c        	ldrh	r1, [r5, #34]
      20: c9 b2        	uxtb	r1, r1
      22: 40 f2 00 02  	movw	r2, #0
      26: 23 00        	movs	r3, r4
      28: c0 f2 00 02  	movt	r2, #0
      2c: 94 46        	mov	r12, r2
      2e: 0e 33        	adds	r3, #14
      30: 9b 00        	lsls	r3, r3, #2
      32: 63 44        	add	r3, r12
      34: 58 68        	ldr	r0, [r3, #4]
      36: ff f7 fe ff  	bl	0x36 <deal_dirs_prtouch+0x36> @ imm = #-4
      3a: 33 8c        	ldrh	r3, [r6, #32]
      3c: 01 34        	adds	r4, #1
      3e: 02 35        	adds	r5, #2
      40: a3 42        	cmp	r3, r4
      42: ea dc        	bgt	0x1a <deal_dirs_prtouch+0x1a> @ imm = #-44
      44: 04 bc        	pop	{r2}
      46: 90 46        	mov	r8, r2
      48: f0 bd        	pop	{r4, r5, r6, r7, pc}
      4a: 40 f2 00 03  	movw	r3, #0
      4e: c0 f2 00 03  	movt	r3, #0
      52: e3 18        	adds	r3, r4, r3
      54: 5c 33        	adds	r3, #92
      56: 18 78        	ldrb	r0, [r3]
      58: ff f7 fe ff  	bl	0x58 <deal_dirs_prtouch+0x58> @ imm = #-4
      5c: 43 46        	mov	r3, r8
      5e: 69 8d        	ldrh	r1, [r5, #42]
      60: 68 84        	strh	r0, [r5, #34]
      62: c9 1a        	subs	r1, r1, r3
      64: 4b 1e        	subs	r3, r1, #1
      66: 99 41        	sbcs	r1, r3
      68: c9 b2        	uxtb	r1, r1
      6a: da e7        	b	0x22 <deal_dirs_prtouch+0x22> @ imm = #-76

Disassembly of section .text.prtouch_event:

00000000 <prtouch_event>:
       0: f0 b5        	push	{r4, r5, r6, r7, lr}
       2: 40 f2 00 04  	movw	r4, #0
       6: c6 46        	mov	lr, r8
       8: c0 f2 00 04  	movt	r4, #0
       c: 23 8c        	ldrh	r3, [r4, #32]
       e: 00 25        	movs	r5, #0
      10: 00 b5        	push	{lr}
      12: 7b b1        	cbz	r3, 0x34 <prtouch_event+0x34> @ imm = #30
      14: 40 f2 00 02  	movw	r2, #0
      18: 2b 00        	movs	r3, r5
      1a: c0 f2 00 02  	movt	r2, #0
      1e: 94 46        	mov	r12, r2
      20: 12 33        	adds	r3, #18
      22: 9b 00        	lsls	r3, r3, #2
      24: 63 44        	add	r3, r12
      26: 58 68        	ldr	r0, [r3, #4]
      28: ff f7 fe ff  	bl	0x28 <prtouch_event+0x28> @ imm = #-4
      2c: 23 8c        	ldrh	r3, [r4, #32]
      2e: 01 35        	adds	r5, #1
      30: 9d 42        	cmp	r5, r3
      32: ef db        	blt	0x14 <prtouch_event+0x14> @ imm = #-34
      34: 40 f2 78 15  	movw	r5, #376
      38: 63 59        	ldr	r3, [r4, r5]
      3a: 22 6e        	ldr	r2, [r4, #96]
      3c: 01 3b        	subs	r3, #1
      3e: 63 51        	str	r3, [r4, r5]
      40: 00 2a        	cmp	r2, #0
      42: 00 d1        	bne	0x46 <prtouch_event+0x46> @ imm = #0
      44: a5 e0        	b	0x192 <prtouch_event+0x192> @ imm = #330
      46: 43 b1        	cbz	r3, 0x5a <prtouch_event+0x5a> @ imm = #16
      48: da 07        	lsls	r2, r3, #31
      4a: 00 d5        	bpl	0x4e <prtouch_event+0x4e> @ imm = #0
      4c: b9 e0        	b	0x1c2 <prtouch_event+0x1c2> @ imm = #370
      4e: 40 f2 72 13  	movw	r3, #370
      52: e3 5a        	ldrh	r3, [r4, r3]
      54: 01 2b        	cmp	r3, #1
      56: 00 d0        	beq	0x5a <prtouch_event+0x5a> @ imm = #0
      58: a6 e0        	b	0x1a8 <prtouch_event+0x1a8> @ imm = #332
      5a: 40 f2 ec 08  	movw	r8, #236
      5e: 43 46        	mov	r3, r8
      60: 1f 25        	movs	r5, #31
      62: e7 58        	ldr	r7, [r4, r3]
      64: 40 f2 00 01  	movw	r1, #0
      68: fb 17        	asrs	r3, r7, #31
      6a: db 0e        	lsrs	r3, r3, #27
      6c: fe 18        	adds	r6, r7, r3
      6e: 2e 40        	ands	r6, r5
      70: f6 1a        	subs	r6, r6, r3
      72: 40 f2 00 03  	movw	r3, #0
      76: c0 f2 00 03  	movt	r3, #0
      7a: 9c 46        	mov	r12, r3
      7c: 48 f6 00 03  	movw	r3, #34816
      80: c0 f2 00 01  	movt	r1, #0
      84: 00 22        	movs	r2, #0
      86: 08 69        	ldr	r0, [r1, #16]
      88: 49 69        	ldr	r1, [r1, #20]
      8a: c4 f2 c3 03  	movt	r3, #16579
      8e: b6 00        	lsls	r6, r6, #2
      90: 66 44        	add	r6, r12
      92: ff f7 fe ff  	bl	0x92 <prtouch_event+0x92> @ imm = #-4
      96: ff f7 fe ff  	bl	0x96 <prtouch_event+0x96> @ imm = #-4
      9a: f0 23        	movs	r3, #240
      9c: f0 50        	str	r0, [r6, r3]
      9e: 43 46        	mov	r3, r8
      a0: 01 37        	adds	r7, #1
      a2: e7 50        	str	r7, [r4, r3]
      a4: a3 6e        	ldr	r3, [r4, #104]
      a6: 40 f2 78 16  	movw	r6, #376
      aa: da 17        	asrs	r2, r3, #31
      ac: d2 0e        	lsrs	r2, r2, #27
      ae: 99 18        	adds	r1, r3, r2
      b0: 0d 40        	ands	r5, r1
      b2: ad 1a        	subs	r5, r5, r2
      b4: 40 f2 00 02  	movw	r2, #0
      b8: c0 f2 00 02  	movt	r2, #0
      bc: 94 46        	mov	r12, r2
      be: a1 59        	ldr	r1, [r4, r6]
      c0: ad 00        	lsls	r5, r5, #2
      c2: ca 0f        	lsrs	r2, r1, #31
      c4: 52 18        	adds	r2, r2, r1
      c6: 52 10        	asrs	r2, r2, #1
      c8: 01 33        	adds	r3, #1
      ca: 65 44        	add	r5, r12
      cc: ea 66        	str	r2, [r5, #108]
      ce: a3 66        	str	r3, [r4, #104]
      d0: 40 f2 88 13  	movw	r3, #392
      d4: e2 5a        	ldrh	r2, [r4, r3]
      d6: 01 2a        	cmp	r2, #1
      d8: 48 d1        	bne	0x16c <prtouch_event+0x16c> @ imm = #144
      da: 00 22        	movs	r2, #0
      dc: e2 52        	strh	r2, [r4, r3]
      de: 14 3b        	subs	r3, #20
      e0: e3 58        	ldr	r3, [r4, r3]
      e2: 00 21        	movs	r1, #0
      e4: 00 20        	movs	r0, #0
      e6: a3 51        	str	r3, [r4, r6]
      e8: ff f7 fe ff  	bl	0xe8 <prtouch_event+0xe8> @ imm = #-4
      ec: 40 f2 70 13  	movw	r3, #368
      f0: e0 5a        	ldrh	r0, [r4, r3]
      f2: 01 21        	movs	r1, #1
      f4: 43 42        	rsbs	r3, r0, #0
      f6: 58 41        	adcs	r0, r3
      f8: ff f7 fe ff  	bl	0xf8 <prtouch_event+0xf8> @ imm = #-4
      fc: ff f7 fe ff  	bl	0xfc <prtouch_event+0xfc> @ imm = #-4
     100: 40 f2 7c 13  	movw	r3, #380
     104: e3 58        	ldr	r3, [r4, r3]
     106: 1b 18        	adds	r3, r3, r0
     108: e3 60        	str	r3, [r4, #12]
     10a: a3 59        	ldr	r3, [r4, r6]
     10c: 40 f2 74 12  	movw	r2, #372
     110: 40 f2 80 11  	movw	r1, #384
     114: a2 58        	ldr	r2, [r4, r2]
     116: 61 58        	ldr	r1, [r4, r1]
     118: d2 1a        	subs	r2, r2, r3
     11a: 8a 42        	cmp	r2, r1
     11c: 00 da        	bge	0x120 <prtouch_event+0x120> @ imm = #0
     11e: 96 e0        	b	0x24e <prtouch_event+0x24e> @ imm = #300
     120: 99 42        	cmp	r1, r3
     122: 00 dc        	bgt	0x126 <prtouch_event+0x126> @ imm = #0
     124: 9e e0        	b	0x264 <prtouch_event+0x264> @ imm = #316
     126: 1b 02        	lsls	r3, r3, #8
     128: 93 fb f1 f3  	sdiv	r3, r3, r1
     12c: 40 f2 00 15  	movw	r5, #256
     130: ed 1a        	subs	r5, r5, r3
     132: ff 2d        	cmp	r5, #255
     134: 00 dd        	ble	0x138 <prtouch_event+0x138> @ imm = #0
     136: 93 e0        	b	0x260 <prtouch_event+0x260> @ imm = #294
     138: ff f7 fe ff  	bl	0x138 <prtouch_event+0x138> @ imm = #-4
     13c: 40 f2 7c 13  	movw	r3, #380
     140: ee 43        	mvns	r6, r5
     142: 40 f2 00 01  	movw	r1, #0
     146: e7 58        	ldr	r7, [r4, r3]
     148: 08 33        	adds	r3, #8
     14a: e2 5a        	ldrh	r2, [r4, r3]
     14c: f6 17        	asrs	r6, r6, #31
     14e: 7a 43        	muls	r2, r7, r2
     150: 35 40        	ands	r5, r6
     152: c0 f2 00 01  	movt	r1, #0
     156: 6d 00        	lsls	r5, r5, #1
     158: 6b 5a        	ldrh	r3, [r5, r1]
     15a: 5a 43        	muls	r2, r3, r2
     15c: 40 f2 e8 33  	movw	r3, #1000
     160: 92 fb f3 f3  	sdiv	r3, r2, r3
     164: db 19        	adds	r3, r3, r7
     166: 1b 18        	adds	r3, r3, r0
     168: e3 60        	str	r3, [r4, #12]
     16a: 0e e0        	b	0x18a <prtouch_event+0x18a> @ imm = #28
     16c: 20 1d        	adds	r0, r4, #4
     16e: ff f7 fe ff  	bl	0x16e <prtouch_event+0x16e> @ imm = #-4
     172: 00 21        	movs	r1, #0
     174: 00 20        	movs	r0, #0
     176: ff f7 fe ff  	bl	0x176 <prtouch_event+0x176> @ imm = #-4
     17a: 64 23        	movs	r3, #100
     17c: 08 22        	movs	r2, #8
     17e: e2 52        	strh	r2, [r4, r3]
     180: 00 23        	movs	r3, #0
     182: 6b 32        	adds	r2, #107
     184: ff 32        	adds	r2, #255
     186: a3 52        	strh	r3, [r4, r2]
     188: a3 51        	str	r3, [r4, r6]
     18a: 01 20        	movs	r0, #1
     18c: 04 bc        	pop	{r2}
     18e: 90 46        	mov	r8, r2
     190: f0 bd        	pop	{r4, r5, r6, r7, pc}
     192: 40 f2 00 03  	movw	r3, #0
     196: c0 f2 00 03  	movt	r3, #0
     19a: 18 79        	ldrb	r0, [r3, #4]
     19c: ff f7 fe ff  	bl	0x19c <prtouch_event+0x19c> @ imm = #-4
     1a0: 01 28        	cmp	r0, #1
     1a2: 67 d0        	beq	0x274 <prtouch_event+0x274> @ imm = #206
     1a4: 63 59        	ldr	r3, [r4, r5]
     1a6: 4e e7        	b	0x46 <prtouch_event+0x46> @ imm = #-356
     1a8: 40 f2 00 03  	movw	r3, #0
     1ac: c0 f2 00 03  	movt	r3, #0
     1b0: 18 79        	ldrb	r0, [r3, #4]
     1b2: ff f7 fe ff  	bl	0x1b2 <prtouch_event+0x1b2> @ imm = #-4
     1b6: 01 28        	cmp	r0, #1
     1b8: 00 d1        	bne	0x1bc <prtouch_event+0x1bc> @ imm = #0
     1ba: 4e e7        	b	0x5a <prtouch_event+0x5a> @ imm = #-356
     1bc: 40 f2 78 13  	movw	r3, #376
     1c0: e3 58        	ldr	r3, [r4, r3]
     1c2: 40 f2 86 12  	movw	r2, #390
     1c6: a2 5a        	ldrh	r2, [r4, r2]
     1c8: 52 00        	lsls	r2, r2, #1
     1ca: 93 fb f2 f1  	sdiv	r1, r3, r2
     1ce: 4a 43        	muls	r2, r1, r2
     1d0: 93 42        	cmp	r3, r2
     1d2: 9b d1        	bne	0x10c <prtouch_event+0x10c> @ imm = #-202
     1d4: 40 f2 ec 08  	movw	r8, #236
     1d8: 43 46        	mov	r3, r8
     1da: 1f 25        	movs	r5, #31
     1dc: e7 58        	ldr	r7, [r4, r3]
     1de: 40 f2 00 01  	movw	r1, #0
     1e2: fb 17        	asrs	r3, r7, #31
     1e4: db 0e        	lsrs	r3, r3, #27
     1e6: fe 18        	adds	r6, r7, r3
     1e8: 2e 40        	ands	r6, r5
     1ea: f6 1a        	subs	r6, r6, r3
     1ec: 40 f2 00 03  	movw	r3, #0
     1f0: c0 f2 00 03  	movt	r3, #0
     1f4: 9c 46        	mov	r12, r3
     1f6: 48 f6 00 03  	movw	r3, #34816
     1fa: c0 f2 00 01  	movt	r1, #0
     1fe: 00 22        	movs	r2, #0
     200: 08 69        	ldr	r0, [r1, #16]
     202: 49 69        	ldr	r1, [r1, #20]
     204: c4 f2 c3 03  	movt	r3, #16579
     208: b6 00        	lsls	r6, r6, #2
     20a: 66 44        	add	r6, r12
     20c: ff f7 fe ff  	bl	0x20c <prtouch_event+0x20c> @ imm = #-4
     210: ff f7 fe ff  	bl	0x210 <prtouch_event+0x210> @ imm = #-4
     214: f0 23        	movs	r3, #240
     216: f0 50        	str	r0, [r6, r3]
     218: 43 46        	mov	r3, r8
     21a: 01 37        	adds	r7, #1
     21c: e7 50        	str	r7, [r4, r3]
     21e: a3 6e        	ldr	r3, [r4, #104]
     220: da 17        	asrs	r2, r3, #31
     222: d2 0e        	lsrs	r2, r2, #27
     224: 99 18        	adds	r1, r3, r2
     226: 0d 40        	ands	r5, r1
     228: ad 1a        	subs	r5, r5, r2
     22a: 40 f2 00 02  	movw	r2, #0
     22e: 40 f2 78 11  	movw	r1, #376
     232: c0 f2 00 02  	movt	r2, #0
     236: 94 46        	mov	r12, r2
     238: 60 58        	ldr	r0, [r4, r1]
     23a: ad 00        	lsls	r5, r5, #2
     23c: c2 0f        	lsrs	r2, r0, #31
     23e: 12 18        	adds	r2, r2, r0
     240: 65 44        	add	r5, r12
     242: 52 10        	asrs	r2, r2, #1
     244: ea 66        	str	r2, [r5, #108]
     246: 01 33        	adds	r3, #1
     248: a3 66        	str	r3, [r4, #104]
     24a: 63 58        	ldr	r3, [r4, r1]
     24c: 5e e7        	b	0x10c <prtouch_event+0x10c> @ imm = #-324
     24e: 12 02        	lsls	r2, r2, #8
     250: 92 fb f1 f2  	sdiv	r2, r2, r1
     254: 40 f2 00 15  	movw	r5, #256
     258: ad 1a        	subs	r5, r5, r2
     25a: ff 2d        	cmp	r5, #255
     25c: 00 dc        	bgt	0x260 <prtouch_event+0x260> @ imm = #0
     25e: 6b e7        	b	0x138 <prtouch_event+0x138> @ imm = #-298
     260: ff 25        	movs	r5, #255
     262: 69 e7        	b	0x138 <prtouch_event+0x138> @ imm = #-302
     264: ff f7 fe ff  	bl	0x264 <prtouch_event+0x264> @ imm = #-4
     268: 40 f2 7c 13  	movw	r3, #380
     26c: e3 58        	ldr	r3, [r4, r3]
     26e: 1b 18        	adds	r3, r3, r0
     270: e3 60        	str	r3, [r4, #12]
     272: 8a e7        	b	0x18a <prtouch_event+0x18a> @ imm = #-236
     274: 40 f2 00 01  	movw	r1, #0
     278: 48 f6 00 03  	movw	r3, #34816
     27c: c0 f2 00 01  	movt	r1, #0
     280: c4 f2 c3 03  	movt	r3, #16579
     284: 00 22        	movs	r2, #0
     286: 08 69        	ldr	r0, [r1, #16]
     288: 49 69        	ldr	r1, [r1, #20]
     28a: ff f7 fe ff  	bl	0x28a <prtouch_event+0x28a> @ imm = #-4
     28e: ff f7 fe ff  	bl	0x28e <prtouch_event+0x28e> @ imm = #-4
     292: 63 59        	ldr	r3, [r4, r5]
     294: 20 66        	str	r0, [r4, #96]
     296: d6 e6        	b	0x46 <prtouch_event+0x46> @ imm = #-596

Disassembly of section .text.deal_steps_prtouch:

00000000 <deal_steps_prtouch>:
       0: 70 b5        	push	{r4, r5, r6, lr}
       2: 40 f2 00 05  	movw	r5, #0
       6: c0 f2 00 05  	movt	r5, #0
       a: 2b 8c        	ldrh	r3, [r5, #32]
       c: 83 b1        	cbz	r3, 0x30 <deal_steps_prtouch+0x30> @ imm = #32
       e: 00 24        	movs	r4, #0
      10: 40 f2 00 02  	movw	r2, #0
      14: 23 00        	movs	r3, r4
      16: c0 f2 00 02  	movt	r2, #0
      1a: 94 46        	mov	r12, r2
      1c: 12 33        	adds	r3, #18
      1e: 9b 00        	lsls	r3, r3, #2
      20: 63 44        	add	r3, r12
      22: 58 68        	ldr	r0, [r3, #4]
      24: ff f7 fe ff  	bl	0x24 <deal_steps_prtouch+0x24> @ imm = #-4
      28: 2b 8c        	ldrh	r3, [r5, #32]
      2a: 01 34        	adds	r4, #1
      2c: a3 42        	cmp	r3, r4
      2e: ef dc        	bgt	0x10 <deal_steps_prtouch+0x10> @ imm = #-34
      30: 70 bd        	pop	{r4, r5, r6, pc}
      32: c0 46        	mov	r8, r8

Disassembly of section .text.command_config_step_prtouch:

00000000 <command_config_step_prtouch>:
       0: 40 f2 00 03  	movw	r3, #0
       4: 02 68        	ldr	r2, [r0]
       6: c0 f2 00 03  	movt	r3, #0
       a: 70 b5        	push	{r4, r5, r6, lr}
       c: 1a 80        	strh	r2, [r3]
       e: 42 68        	ldr	r2, [r0, #4]
      10: 04 00        	movs	r4, r0
      12: 1a 84        	strh	r2, [r3, #32]
      14: c0 68        	ldr	r0, [r0, #12]
      16: ff f7 fe ff  	bl	0x16 <command_config_step_prtouch+0x16> @ imm = #-4
      1a: 45 f2 00 01  	movw	r1, #20480
      1e: 40 f2 00 05  	movw	r5, #0
      22: c4 f2 c3 71  	movt	r1, #18371
      26: ff f7 fe ff  	bl	0x26 <command_config_step_prtouch+0x26> @ imm = #-4
      2a: c0 f2 00 05  	movt	r5, #0
      2e: 01 21        	movs	r1, #1
      30: a8 61        	str	r0, [r5, #24]
      32: 20 7a        	ldrb	r0, [r4, #8]
      34: 40 f2 00 05  	movw	r5, #0
      38: ff f7 fe ff  	bl	0x38 <command_config_step_prtouch+0x38> @ imm = #-4
      3c: c0 f2 00 05  	movt	r5, #0
      40: 28 71        	strb	r0, [r5, #4]
      42: 20 00        	movs	r0, r4
      44: ff f7 fe ff  	bl	0x44 <command_config_step_prtouch+0x44> @ imm = #-4
      48: 70 bd        	pop	{r4, r5, r6, pc}
      4a: c0 46        	mov	r8, r8

Disassembly of section .text.command_add_step_prtouch:

00000000 <command_add_step_prtouch>:
       0: 40 f2 00 02  	movw	r2, #0
       4: c0 f2 00 02  	movt	r2, #0
       8: 94 46        	mov	r12, r2
       a: 43 68        	ldr	r3, [r0, #4]
       c: 70 b5        	push	{r4, r5, r6, lr}
       e: 63 44        	add	r3, r12
      10: 04 00        	movs	r4, r0
      12: 00 21        	movs	r1, #0
      14: 00 7a        	ldrb	r0, [r0, #8]
      16: 1d 00        	movs	r5, r3
      18: ff f7 fe ff  	bl	0x18 <command_add_step_prtouch+0x18> @ imm = #-4
      1c: 40 f2 00 03  	movw	r3, #0
      20: c0 f2 00 03  	movt	r3, #0
      24: 9c 46        	mov	r12, r3
      26: 5c 35        	adds	r5, #92
      28: 28 70        	strb	r0, [r5]
      2a: 65 68        	ldr	r5, [r4, #4]
      2c: 00 21        	movs	r1, #0
      2e: 0e 35        	adds	r5, #14
      30: 20 7a        	ldrb	r0, [r4, #8]
      32: ad 00        	lsls	r5, r5, #2
      34: 65 44        	add	r5, r12
      36: ff f7 fe ff  	bl	0x36 <command_add_step_prtouch+0x36> @ imm = #-4
      3a: 40 f2 00 03  	movw	r3, #0
      3e: c0 f2 00 03  	movt	r3, #0
      42: 9c 46        	mov	r12, r3
      44: 68 60        	str	r0, [r5, #4]
      46: 65 68        	ldr	r5, [r4, #4]
      48: 21 7d        	ldrb	r1, [r4, #20]
      4a: 12 35        	adds	r5, #18
      4c: 20 7b        	ldrb	r0, [r4, #12]
      4e: ad 00        	lsls	r5, r5, #2
      50: 65 44        	add	r5, r12
      52: ff f7 fe ff  	bl	0x52 <command_add_step_prtouch+0x52> @ imm = #-4
      56: 40 f2 00 01  	movw	r1, #0
      5a: 68 60        	str	r0, [r5, #4]
      5c: 63 68        	ldr	r3, [r4, #4]
      5e: c0 f2 00 01  	movt	r1, #0
      62: 1a 00        	movs	r2, r3
      64: 8c 46        	mov	r12, r1
      66: 14 32        	adds	r2, #20
      68: 21 69        	ldr	r1, [r4, #16]
      6a: 52 00        	lsls	r2, r2, #1
      6c: 62 44        	add	r2, r12
      6e: 18 33        	adds	r3, #24
      70: 51 80        	strh	r1, [r2, #2]
      72: 5b 00        	lsls	r3, r3, #1
      74: 62 69        	ldr	r2, [r4, #20]
      76: 63 44        	add	r3, r12
      78: 20 00        	movs	r0, r4
      7a: 5a 80        	strh	r2, [r3, #2]
      7c: ff f7 fe ff  	bl	0x7c <command_add_step_prtouch+0x7c> @ imm = #-4
      80: 70 bd        	pop	{r4, r5, r6, pc}
      82: c0 46        	mov	r8, r8

Disassembly of section .text.command_read_swap_prtouch:

00000000 <command_read_swap_prtouch>:
       0: 70 b5        	push	{r4, r5, r6, lr}
       2: 04 00        	movs	r4, r0
       4: 40 f2 00 00  	movw	r0, #0
       8: c0 f2 00 00  	movt	r0, #0
       c: ff f7 fe ff  	bl	0xc <command_read_swap_prtouch+0xc> @ imm = #-4
      10: 40 f2 00 03  	movw	r3, #0
      14: c0 f2 00 03  	movt	r3, #0
      18: 1e 88        	ldrh	r6, [r3]
      1a: 40 f2 00 03  	movw	r3, #0
      1e: c0 f2 00 03  	movt	r3, #0
      22: 05 00        	movs	r5, r0
      24: 18 79        	ldrb	r0, [r3, #4]
      26: ff f7 fe ff  	bl	0x26 <command_read_swap_prtouch+0x26> @ imm = #-4
      2a: 31 00        	movs	r1, r6
      2c: 02 00        	movs	r2, r0
      2e: 28 00        	movs	r0, r5
      30: ff f7 fe ff  	bl	0x30 <command_read_swap_prtouch+0x30> @ imm = #-4
      34: 20 00        	movs	r0, r4
      36: ff f7 fe ff  	bl	0x36 <command_read_swap_prtouch+0x36> @ imm = #-4
      3a: 70 bd        	pop	{r4, r5, r6, pc}

Disassembly of section .text.command_start_step_prtouch:

00000000 <command_start_step_prtouch>:
       0: f0 b5        	push	{r4, r5, r6, r7, lr}
       2: c6 46        	mov	lr, r8
       4: 83 68        	ldr	r3, [r0, #8]
       6: 06 00        	movs	r6, r0
       8: 00 b5        	push	{lr}
       a: 00 2b        	cmp	r3, #0
       c: 00 d1        	bne	0x10 <command_start_step_prtouch+0x10> @ imm = #0
       e: 89 e0        	b	0x124 <command_start_step_prtouch+0x124> @ imm = #274
      10: 40 f2 00 07  	movw	r7, #0
      14: c0 f2 00 07  	movt	r7, #0
      18: 3b 68        	ldr	r3, [r7]
      1a: 00 2b        	cmp	r3, #0
      1c: 00 d1        	bne	0x20 <command_start_step_prtouch+0x20> @ imm = #0
      1e: 7e e0        	b	0x11e <command_start_step_prtouch+0x11e> @ imm = #252
      20: 40 f2 00 05  	movw	r5, #0
      24: c0 f2 00 05  	movt	r5, #0
      28: 2c 00        	movs	r4, r5
      2a: 00 23        	movs	r3, #0
      2c: ec 22        	movs	r2, #236
      2e: f0 34        	adds	r4, #240
      30: ab 50        	str	r3, [r5, r2]
      32: 00 21        	movs	r1, #0
      34: 6c 3a        	subs	r2, #108
      36: 20 00        	movs	r0, r4
      38: ab 66        	str	r3, [r5, #104]
      3a: ff f7 fe ff  	bl	0x3a <command_start_step_prtouch+0x3a> @ imm = #-4
      3e: 28 00        	movs	r0, r5
      40: 80 22        	movs	r2, #128
      42: 00 21        	movs	r1, #0
      44: 6c 30        	adds	r0, #108
      46: ff f7 fe ff  	bl	0x46 <command_start_step_prtouch+0x46> @ imm = #-4
      4a: 38 69        	ldr	r0, [r7, #16]
      4c: 79 69        	ldr	r1, [r7, #20]
      4e: 48 f6 00 03  	movw	r3, #34816
      52: 00 22        	movs	r2, #0
      54: c4 f2 c3 03  	movt	r3, #16579
      58: ff f7 fe ff  	bl	0x58 <command_start_step_prtouch+0x58> @ imm = #-4
      5c: ff f7 fe ff  	bl	0x5c <command_start_step_prtouch+0x5c> @ imm = #-4
      60: 2a 00        	movs	r2, r5
      62: 71 32        	adds	r2, #113
      64: ff 32        	adds	r2, #255
      66: 01 c4        	stm	r4!, {r0}
      68: 94 42        	cmp	r4, r2
      6a: fc d1        	bne	0x66 <command_start_step_prtouch+0x66> @ imm = #-8
      6c: 01 21        	movs	r1, #1
      6e: 70 68        	ldr	r0, [r6, #4]
      70: ff f7 fe ff  	bl	0x70 <command_start_step_prtouch+0x70> @ imm = #-4
      74: 40 f2 70 13  	movw	r3, #368
      78: 72 68        	ldr	r2, [r6, #4]
      7a: 40 f2 7c 17  	movw	r7, #380
      7e: ea 52        	strh	r2, [r5, r3]
      80: b2 68        	ldr	r2, [r6, #8]
      82: 0b 3b        	subs	r3, #11
      84: ff 3b        	subs	r3, #255
      86: ea 52        	strh	r2, [r5, r3]
      88: 40 f2 74 12  	movw	r2, #372
      8c: f3 68        	ldr	r3, [r6, #12]
      8e: 40 f2 84 18  	movw	r8, #388
      92: 5b 00        	lsls	r3, r3, #1
      94: ab 50        	str	r3, [r5, r2]
      96: 04 32        	adds	r2, #4
      98: ab 50        	str	r3, [r5, r2]
      9a: 30 69        	ldr	r0, [r6, #16]
      9c: ff f7 fe ff  	bl	0x9c <command_start_step_prtouch+0x9c> @ imm = #-4
      a0: 48 f2 80 43  	movw	r3, #33920
      a4: 00 22        	movs	r2, #0
      a6: c4 f2 2e 13  	movt	r3, #16686
      aa: ff f7 fe ff  	bl	0xaa <command_start_step_prtouch+0xaa> @ imm = #-4
      ae: 42 f6 88 23  	movw	r3, #10888
      b2: 00 22        	movs	r2, #0
      b4: c4 f2 91 13  	movt	r3, #16785
      b8: ff f7 fe ff  	bl	0xb8 <command_start_step_prtouch+0xb8> @ imm = #-4
      bc: ff f7 fe ff  	bl	0xbc <command_start_step_prtouch+0xbc> @ imm = #-4
      c0: 40 f2 80 12  	movw	r2, #384
      c4: 40 08        	lsrs	r0, r0, #1
      c6: e8 51        	str	r0, [r5, r7]
      c8: 73 69        	ldr	r3, [r6, #20]
      ca: 00 24        	movs	r4, #0
      cc: 5b 00        	lsls	r3, r3, #1
      ce: ab 50        	str	r3, [r5, r2]
      d0: 64 23        	movs	r3, #100
      d2: 42 46        	mov	r2, r8
      d4: 2c 66        	str	r4, [r5, #96]
      d6: ec 52        	strh	r4, [r5, r3]
      d8: b3 69        	ldr	r3, [r6, #24]
      da: ab 52        	strh	r3, [r5, r2]
      dc: 40 f2 86 13  	movw	r3, #390
      e0: f2 69        	ldr	r2, [r6, #28]
      e2: ea 52        	strh	r2, [r5, r3]
      e4: 32 6a        	ldr	r2, [r6, #32]
      e6: 02 33        	adds	r3, #2
      e8: ea 52        	strh	r2, [r5, r3]
      ea: 40 f2 00 03  	movw	r3, #0
      ee: c0 f2 00 03  	movt	r3, #0
      f2: ab 60        	str	r3, [r5, #8]
      f4: ff f7 fe ff  	bl	0xf4 <command_start_step_prtouch+0xf4> @ imm = #-4
      f8: 43 46        	mov	r3, r8
      fa: ea 5a        	ldrh	r2, [r5, r3]
      fc: eb 59        	ldr	r3, [r5, r7]
      fe: 01 32        	adds	r2, #1
     100: 53 43        	muls	r3, r2, r3
     102: 1b 18        	adds	r3, r3, r0
     104: eb 60        	str	r3, [r5, #12]
     106: 40 f2 72 13  	movw	r3, #370
     10a: 28 1d        	adds	r0, r5, #4
     10c: ec 52        	strh	r4, [r5, r3]
     10e: ff f7 fe ff  	bl	0x10e <command_start_step_prtouch+0x10e> @ imm = #-4
     112: 30 00        	movs	r0, r6
     114: ff f7 fe ff  	bl	0x114 <command_start_step_prtouch+0x114> @ imm = #-4
     118: 04 bc        	pop	{r2}
     11a: 90 46        	mov	r8, r2
     11c: f0 bd        	pop	{r4, r5, r6, r7, pc}
     11e: ff f7 fe ff  	bl	0x11e <command_start_step_prtouch+0x11e> @ imm = #-4
     122: 7d e7        	b	0x20 <command_start_step_prtouch+0x20> @ imm = #-262
     124: 40 f2 00 03  	movw	r3, #0
     128: 40 f2 72 12  	movw	r2, #370
     12c: 01 21        	movs	r1, #1
     12e: c0 f2 00 03  	movt	r3, #0
     132: 99 52        	strh	r1, [r3, r2]
     134: ff f7 fe ff  	bl	0x134 <command_start_step_prtouch+0x134> @ imm = #-4
     138: 40 f2 00 03  	movw	r3, #0
     13c: c0 f2 00 03  	movt	r3, #0
     140: 1b 68        	ldr	r3, [r3]
     142: 01 2b        	cmp	r3, #1
     144: e8 d1        	bne	0x118 <command_start_step_prtouch+0x118> @ imm = #-48
     146: ff f7 fe ff  	bl	0x146 <command_start_step_prtouch+0x146> @ imm = #-4
     14a: e5 e7        	b	0x118 <command_start_step_prtouch+0x118> @ imm = #-54

Disassembly of section .text.command_manual_get_steps:

00000000 <command_manual_get_steps>:
       0: 30 b5        	push	{r4, r5, lr}
       2: 44 68        	ldr	r4, [r0, #4]
       4: 40 f2 00 00  	movw	r0, #0
       8: 89 b0        	sub	sp, #36
       a: c0 f2 00 00  	movt	r0, #0
       e: ff f7 fe ff  	bl	0xe <command_manual_get_steps+0xe> @ imm = #-4
      12: 40 f2 00 02  	movw	r2, #0
      16: 40 f2 00 05  	movw	r5, #0
      1a: c0 f2 00 02  	movt	r2, #0
      1e: 13 6e        	ldr	r3, [r2, #96]
      20: 11 78        	ldrb	r1, [r2]
      22: 22 00        	movs	r2, r4
      24: c0 f2 00 05  	movt	r5, #0
      28: ac 46        	mov	r12, r5
      2a: 1d 32        	adds	r2, #29
      2c: 92 00        	lsls	r2, r2, #2
      2e: 62 44        	add	r2, r12
      30: 52 68        	ldr	r2, [r2, #4]
      32: 07 92        	str	r2, [sp, #28]
      34: 22 00        	movs	r2, r4
      36: 1c 32        	adds	r2, #28
      38: 92 00        	lsls	r2, r2, #2
      3a: 62 44        	add	r2, r12
      3c: 52 68        	ldr	r2, [r2, #4]
      3e: 06 92        	str	r2, [sp, #24]
      40: 22 00        	movs	r2, r4
      42: 1b 32        	adds	r2, #27
      44: 92 00        	lsls	r2, r2, #2
      46: 62 44        	add	r2, r12
      48: 52 68        	ldr	r2, [r2, #4]
      4a: 05 92        	str	r2, [sp, #20]
      4c: 22 00        	movs	r2, r4
      4e: 1a 32        	adds	r2, #26
      50: 92 00        	lsls	r2, r2, #2
      52: 62 44        	add	r2, r12
      54: 52 68        	ldr	r2, [r2, #4]
      56: 04 92        	str	r2, [sp, #16]
      58: 22 00        	movs	r2, r4
      5a: 3d 32        	adds	r2, #61
      5c: 92 00        	lsls	r2, r2, #2
      5e: 62 44        	add	r2, r12
      60: 92 68        	ldr	r2, [r2, #8]
      62: 03 92        	str	r2, [sp, #12]
      64: 22 00        	movs	r2, r4
      66: 3c 32        	adds	r2, #60
      68: 92 00        	lsls	r2, r2, #2
      6a: 62 44        	add	r2, r12
      6c: 92 68        	ldr	r2, [r2, #8]
      6e: 02 92        	str	r2, [sp, #8]
      70: 22 00        	movs	r2, r4
      72: 3b 32        	adds	r2, #59
      74: 92 00        	lsls	r2, r2, #2
      76: 62 44        	add	r2, r12
      78: 92 68        	ldr	r2, [r2, #8]
      7a: 01 92        	str	r2, [sp, #4]
      7c: 22 00        	movs	r2, r4
      7e: 3a 32        	adds	r2, #58
      80: 92 00        	lsls	r2, r2, #2
      82: 62 44        	add	r2, r12
      84: 92 68        	ldr	r2, [r2, #8]
      86: 00 92        	str	r2, [sp]
      88: 22 00        	movs	r2, r4
      8a: ff f7 fe ff  	bl	0x8a <command_manual_get_steps+0x8a> @ imm = #-4
      8e: 09 b0        	add	sp, #36
      90: 30 bd        	pop	{r4, r5, pc}
      92: c0 46        	mov	r8, r8

Disassembly of section .text.prtouch_step_task:

00000000 <prtouch_step_task>:
       0: f0 b5        	push	{r4, r5, r6, r7, lr}
       2: 45 46        	mov	r5, r8
       4: 40 f2 00 08  	movw	r8, #0
       8: 4e 46        	mov	r6, r9
       a: de 46        	mov	lr, r11
       c: 57 46        	mov	r7, r10
       e: c0 f2 00 08  	movt	r8, #0
      12: 64 23        	movs	r3, #100
      14: 42 46        	mov	r2, r8
      16: e0 b5        	push	{r5, r6, r7, lr}
      18: d3 5a        	ldrh	r3, [r2, r3]
      1a: a9 b0        	sub	sp, #164
      1c: 99 46        	mov	r9, r3
      1e: 00 2b        	cmp	r3, #0
      20: 00 d1        	bne	0x24 <prtouch_step_task+0x24> @ imm = #0
      22: c1 e0        	b	0x1a8 <prtouch_step_task+0x1a8> @ imm = #386
      24: 66 23        	movs	r3, #102
      26: d0 5a        	ldrh	r0, [r2, r3]
      28: ff f7 fe ff  	bl	0x28 <prtouch_step_task+0x28> @ imm = #-4
      2c: 00 21        	movs	r1, #0
      2e: c4 f2 7a 41  	movt	r1, #17530
      32: ff f7 fe ff  	bl	0x32 <prtouch_step_task+0x32> @ imm = #-4
      36: 40 f2 00 0a  	movw	r10, #0
      3a: 40 f2 00 03  	movw	r3, #0
      3e: c0 f2 00 0a  	movt	r10, #0
      42: c0 f2 00 03  	movt	r3, #0
      46: 1c 69        	ldr	r4, [r3, #16]
      48: 5d 69        	ldr	r5, [r3, #20]
      4a: 53 46        	mov	r3, r10
      4c: 83 46        	mov	r11, r0
      4e: 9c 60        	str	r4, [r3, #8]
      50: dd 60        	str	r5, [r3, #12]
      52: 1a 68        	ldr	r2, [r3]
      54: 5b 68        	ldr	r3, [r3, #4]
      56: 20 00        	movs	r0, r4
      58: 29 00        	movs	r1, r5
      5a: ff f7 fe ff  	bl	0x5a <prtouch_step_task+0x5a> @ imm = #-4
      5e: 06 00        	movs	r6, r0
      60: 58 46        	mov	r0, r11
      62: 0f 00        	movs	r7, r1
      64: ff f7 fe ff  	bl	0x64 <prtouch_step_task+0x64> @ imm = #-4
      68: 02 00        	movs	r2, r0
      6a: 0b 00        	movs	r3, r1
      6c: 30 00        	movs	r0, r6
      6e: 39 00        	movs	r1, r7
      70: ff f7 fe ff  	bl	0x70 <prtouch_step_task+0x70> @ imm = #-4
      74: 00 28        	cmp	r0, #0
      76: 00 d0        	beq	0x7a <prtouch_step_task+0x7a> @ imm = #0
      78: 96 e0        	b	0x1a8 <prtouch_step_task+0x1a8> @ imm = #300
      7a: 53 46        	mov	r3, r10
      7c: 42 46        	mov	r2, r8
      7e: 1c 60        	str	r4, [r3]
      80: 5d 60        	str	r5, [r3, #4]
      82: ec 23        	movs	r3, #236
      84: d4 58        	ldr	r4, [r2, r3]
      86: 00 2c        	cmp	r4, #0
      88: 43 d0        	beq	0x112 <prtouch_step_task+0x112> @ imm = #134
      8a: 80 22        	movs	r2, #128
      8c: 00 21        	movs	r1, #0
      8e: 08 a8        	add	r0, sp, #32
      90: ff f7 fe ff  	bl	0x90 <prtouch_step_task+0x90> @ imm = #-4
      94: 08 a9        	add	r1, sp, #32
      96: 20 00        	movs	r0, r4
      98: 1f 26        	movs	r6, #31
      9a: 0c 00        	movs	r4, r1
      9c: f0 25        	movs	r5, #240
      9e: 28 aa        	add	r2, sp, #160
      a0: c7 17        	asrs	r7, r0, #31
      a2: ff 0e        	lsrs	r7, r7, #27
      a4: c3 19        	adds	r3, r0, r7
      a6: 33 40        	ands	r3, r6
      a8: db 1b        	subs	r3, r3, r7
      aa: 40 f2 00 07  	movw	r7, #0
      ae: c0 f2 00 07  	movt	r7, #0
      b2: bc 46        	mov	r12, r7
      b4: 9b 00        	lsls	r3, r3, #2
      b6: 63 44        	add	r3, r12
      b8: 5b 59        	ldr	r3, [r3, r5]
      ba: 01 30        	adds	r0, #1
      bc: 08 c4        	stm	r4!, {r3}
      be: 94 42        	cmp	r4, r2
      c0: ee d1        	bne	0xa0 <prtouch_step_task+0xa0> @ imm = #-36
      c2: 40 46        	mov	r0, r8
      c4: 08 ab        	add	r3, sp, #32
      c6: f0 30        	adds	r0, #240
      c8: 10 cb        	ldm	r3!, {r4}
      ca: 10 c0        	stm	r0!, {r4}
      cc: 93 42        	cmp	r3, r2
      ce: fb d1        	bne	0xc8 <prtouch_step_task+0xc8> @ imm = #-10
      d0: 44 46        	mov	r4, r8
      d2: ec 23        	movs	r3, #236
      d4: 00 20        	movs	r0, #0
      d6: 1f 26        	movs	r6, #31
      d8: e0 50        	str	r0, [r4, r3]
      da: a4 6e        	ldr	r4, [r4, #104]
      dc: 08 ad        	add	r5, sp, #32
      de: e0 17        	asrs	r0, r4, #31
      e0: c0 0e        	lsrs	r0, r0, #27
      e2: 23 18        	adds	r3, r4, r0
      e4: 33 40        	ands	r3, r6
      e6: 1b 1a        	subs	r3, r3, r0
      e8: 40 f2 00 00  	movw	r0, #0
      ec: c0 f2 00 00  	movt	r0, #0
      f0: 84 46        	mov	r12, r0
      f2: 9b 00        	lsls	r3, r3, #2
      f4: 63 44        	add	r3, r12
      f6: db 6e        	ldr	r3, [r3, #108]
      f8: 01 34        	adds	r4, #1
      fa: 08 c5        	stm	r5!, {r3}
      fc: 95 42        	cmp	r5, r2
      fe: ee d1        	bne	0xde <prtouch_step_task+0xde> @ imm = #-36
     100: 43 46        	mov	r3, r8
     102: 6c 33        	adds	r3, #108
     104: 01 c9        	ldm	r1!, {r0}
     106: 01 c3        	stm	r3!, {r0}
     108: 91 42        	cmp	r1, r2
     10a: fb d1        	bne	0x104 <prtouch_step_task+0x104> @ imm = #-10
     10c: 00 23        	movs	r3, #0
     10e: 42 46        	mov	r2, r8
     110: 93 66        	str	r3, [r2, #104]
     112: 4b 46        	mov	r3, r9
     114: 40 f2 00 00  	movw	r0, #0
     118: 64 22        	movs	r2, #100
     11a: 41 46        	mov	r1, r8
     11c: 07 24        	movs	r4, #7
     11e: 01 3b        	subs	r3, #1
     120: 9b b2        	uxth	r3, r3
     122: c0 f2 00 00  	movt	r0, #0
     126: 8b 52        	strh	r3, [r1, r2]
     128: e4 1a        	subs	r4, r4, r3
     12a: ff f7 fe ff  	bl	0x12a <prtouch_step_task+0x12a> @ imm = #-4
     12e: 42 46        	mov	r2, r8
     130: 40 f2 00 05  	movw	r5, #0
     134: a4 00        	lsls	r4, r4, #2
     136: 11 78        	ldrb	r1, [r2]
     138: 22 00        	movs	r2, r4
     13a: c0 f2 00 05  	movt	r5, #0
     13e: ac 46        	mov	r12, r5
     140: 43 46        	mov	r3, r8
     142: 1d 32        	adds	r2, #29
     144: 92 00        	lsls	r2, r2, #2
     146: 62 44        	add	r2, r12
     148: 52 68        	ldr	r2, [r2, #4]
     14a: 1b 6e        	ldr	r3, [r3, #96]
     14c: 07 92        	str	r2, [sp, #28]
     14e: 22 00        	movs	r2, r4
     150: 1c 32        	adds	r2, #28
     152: 92 00        	lsls	r2, r2, #2
     154: 62 44        	add	r2, r12
     156: 52 68        	ldr	r2, [r2, #4]
     158: 06 92        	str	r2, [sp, #24]
     15a: 22 00        	movs	r2, r4
     15c: 1b 32        	adds	r2, #27
     15e: 92 00        	lsls	r2, r2, #2
     160: 62 44        	add	r2, r12
     162: 52 68        	ldr	r2, [r2, #4]
     164: 05 92        	str	r2, [sp, #20]
     166: 22 00        	movs	r2, r4
     168: 1a 32        	adds	r2, #26
     16a: 92 00        	lsls	r2, r2, #2
     16c: 62 44        	add	r2, r12
     16e: 52 68        	ldr	r2, [r2, #4]
     170: 04 92        	str	r2, [sp, #16]
     172: 22 00        	movs	r2, r4
     174: 3d 32        	adds	r2, #61
     176: 92 00        	lsls	r2, r2, #2
     178: 62 44        	add	r2, r12
     17a: 92 68        	ldr	r2, [r2, #8]
     17c: 03 92        	str	r2, [sp, #12]
     17e: 22 00        	movs	r2, r4
     180: 3c 32        	adds	r2, #60
     182: 92 00        	lsls	r2, r2, #2
     184: 62 44        	add	r2, r12
     186: 92 68        	ldr	r2, [r2, #8]
     188: 02 92        	str	r2, [sp, #8]
     18a: 22 00        	movs	r2, r4
     18c: 3b 32        	adds	r2, #59
     18e: 92 00        	lsls	r2, r2, #2
     190: 62 44        	add	r2, r12
     192: 92 68        	ldr	r2, [r2, #8]
     194: 01 92        	str	r2, [sp, #4]
     196: 22 00        	movs	r2, r4
     198: 3a 32        	adds	r2, #58
     19a: 92 00        	lsls	r2, r2, #2
     19c: 62 44        	add	r2, r12
     19e: 92 68        	ldr	r2, [r2, #8]
     1a0: 00 92        	str	r2, [sp]
     1a2: 22 00        	movs	r2, r4
     1a4: ff f7 fe ff  	bl	0x1a4 <prtouch_step_task+0x1a4> @ imm = #-4
     1a8: 29 b0        	add	sp, #164
     1aa: 3c bc        	pop	{r2, r3, r4, r5}
     1ac: 90 46        	mov	r8, r2
     1ae: 99 46        	mov	r9, r3
     1b0: a2 46        	mov	r10, r4
     1b2: ab 46        	mov	r11, r5
     1b4: f0 bd        	pop	{r4, r5, r6, r7, pc}
     1b6: c0 46        	mov	r8, r8

Disassembly of section .text.read_pres_prtouch:

00000000 <read_pres_prtouch>:
       0: f8 b5        	push	{r3, r4, r5, r6, r7, lr}
       2: 45 46        	mov	r5, r8
       4: de 46        	mov	lr, r11
       6: 57 46        	mov	r7, r10
       8: 4e 46        	mov	r6, r9
       a: e0 b5        	push	{r5, r6, r7, lr}
       c: 40 f2 00 05  	movw	r5, #0
      10: c0 f2 00 05  	movt	r5, #0
      14: 6b 8b        	ldrh	r3, [r5, #26]
      16: 80 46        	mov	r8, r0
      18: 00 2b        	cmp	r3, #0
      1a: 00 d0        	beq	0x1e <read_pres_prtouch+0x1e> @ imm = #0
      1c: e6 e0        	b	0x1ec <read_pres_prtouch+0x1ec> @ imm = #460
      1e: 2b 8b        	ldrh	r3, [r5, #24]
      20: 00 2b        	cmp	r3, #0
      22: 00 d1        	bne	0x26 <read_pres_prtouch+0x26> @ imm = #0
      24: 27 e1        	b	0x276 <read_pres_prtouch+0x276> @ imm = #590
      26: 00 26        	movs	r6, #0
      28: 00 24        	movs	r4, #0
      2a: 40 f2 00 03  	movw	r3, #0
      2e: c0 f2 00 03  	movt	r3, #0
      32: e3 18        	adds	r3, r4, r3
      34: 3c 33        	adds	r3, #60
      36: 18 78        	ldrb	r0, [r3]
      38: ff f7 fe ff  	bl	0x38 <read_pres_prtouch+0x38> @ imm = #-4
      3c: a0 40        	lsls	r0, r4
      3e: 2b 8b        	ldrh	r3, [r5, #24]
      40: 01 34        	adds	r4, #1
      42: 9a 46        	mov	r10, r3
      44: 06 43        	orrs	r6, r0
      46: 9c 42        	cmp	r4, r3
      48: ef db        	blt	0x2a <read_pres_prtouch+0x2a> @ imm = #-34
      4a: 40 f2 00 09  	movw	r9, #0
      4e: 40 f2 00 0b  	movw	r11, #0
      52: c0 f2 00 09  	movt	r9, #0
      56: c0 f2 00 0b  	movt	r11, #0
      5a: c6 b1        	cbz	r6, 0x8e <read_pres_prtouch+0x8e> @ imm = #48
      5c: 5b 46        	mov	r3, r11
      5e: 49 46        	mov	r1, r9
      60: 1a 68        	ldr	r2, [r3]
      62: 5b 68        	ldr	r3, [r3, #4]
      64: 08 69        	ldr	r0, [r1, #16]
      66: 49 69        	ldr	r1, [r1, #20]
      68: ff f7 fe ff  	bl	0x68 <read_pres_prtouch+0x68> @ imm = #-4
      6c: 49 f6 9a 12  	movw	r2, #39322
      70: 49 f6 99 13  	movw	r3, #39321
      74: c9 f6 99 12  	movt	r2, #39321
      78: c3 f6 99 73  	movt	r3, #16281
      7c: ff f7 fe ff  	bl	0x7c <read_pres_prtouch+0x7c> @ imm = #-4
      80: 28 b9        	cbnz	r0, 0x8e <read_pres_prtouch+0x8e> @ imm = #10
      82: 3c bc        	pop	{r2, r3, r4, r5}
      84: 90 46        	mov	r8, r2
      86: 99 46        	mov	r9, r3
      88: a2 46        	mov	r10, r4
      8a: ab 46        	mov	r11, r5
      8c: f8 bd        	pop	{r3, r4, r5, r6, r7, pc}
      8e: 53 46        	mov	r3, r10
      90: 00 24        	movs	r4, #0
      92: 00 2b        	cmp	r3, #0
      94: 00 d1        	bne	0x98 <read_pres_prtouch+0x98> @ imm = #0
      96: f6 e0        	b	0x286 <read_pres_prtouch+0x286> @ imm = #492
      98: 40 f2 00 02  	movw	r2, #0
      9c: 23 00        	movs	r3, r4
      9e: c0 f2 00 02  	movt	r2, #0
      a2: 94 46        	mov	r12, r2
      a4: 0a 33        	adds	r3, #10
      a6: 9b 00        	lsls	r3, r3, #2
      a8: 63 44        	add	r3, r12
      aa: 58 68        	ldr	r0, [r3, #4]
      ac: 00 21        	movs	r1, #0
      ae: ff f7 fe ff  	bl	0xae <read_pres_prtouch+0xae> @ imm = #-4
      b2: 2b 8b        	ldrh	r3, [r5, #24]
      b4: 01 34        	adds	r4, #1
      b6: 9c 42        	cmp	r4, r3
      b8: ee db        	blt	0x98 <read_pres_prtouch+0x98> @ imm = #-36
      ba: 18 26        	movs	r6, #24
      bc: 00 2b        	cmp	r3, #0
      be: 00 d1        	bne	0xc2 <read_pres_prtouch+0xc2> @ imm = #0
      c0: e1 e0        	b	0x286 <read_pres_prtouch+0x286> @ imm = #450
      c2: 00 24        	movs	r4, #0
      c4: 40 f2 00 02  	movw	r2, #0
      c8: 23 00        	movs	r3, r4
      ca: c0 f2 00 02  	movt	r2, #0
      ce: 94 46        	mov	r12, r2
      d0: 0a 33        	adds	r3, #10
      d2: 9b 00        	lsls	r3, r3, #2
      d4: 63 44        	add	r3, r12
      d6: 01 21        	movs	r1, #1
      d8: 58 68        	ldr	r0, [r3, #4]
      da: ff f7 fe ff  	bl	0xda <read_pres_prtouch+0xda> @ imm = #-4
      de: 2a 8b        	ldrh	r2, [r5, #24]
      e0: 01 34        	adds	r4, #1
      e2: 94 42        	cmp	r4, r2
      e4: ee db        	blt	0xc4 <read_pres_prtouch+0xc4> @ imm = #-36
      e6: 00 2a        	cmp	r2, #0
      e8: 00 d1        	bne	0xec <read_pres_prtouch+0xec> @ imm = #0
      ea: cc e0        	b	0x286 <read_pres_prtouch+0x286> @ imm = #408
      ec: 43 46        	mov	r3, r8
      ee: 92 00        	lsls	r2, r2, #2
      f0: 42 44        	add	r2, r8
      f2: 19 68        	ldr	r1, [r3]
      f4: 49 00        	lsls	r1, r1, #1
      f6: 02 c3        	stm	r3!, {r1}
      f8: 93 42        	cmp	r3, r2
      fa: fa d1        	bne	0xf2 <read_pres_prtouch+0xf2> @ imm = #-12
      fc: 00 24        	movs	r4, #0
      fe: 40 f2 00 02  	movw	r2, #0
     102: 23 00        	movs	r3, r4
     104: c0 f2 00 02  	movt	r2, #0
     108: 94 46        	mov	r12, r2
     10a: 0a 33        	adds	r3, #10
     10c: 9b 00        	lsls	r3, r3, #2
     10e: 63 44        	add	r3, r12
     110: 58 68        	ldr	r0, [r3, #4]
     112: 00 21        	movs	r1, #0
     114: ff f7 fe ff  	bl	0x114 <read_pres_prtouch+0x114> @ imm = #-4
     118: 2b 8b        	ldrh	r3, [r5, #24]
     11a: 01 34        	adds	r4, #1
     11c: 9c 42        	cmp	r4, r3
     11e: ee db        	blt	0xfe <read_pres_prtouch+0xfe> @ imm = #-36
     120: a3 b1        	cbz	r3, 0x14c <read_pres_prtouch+0x14c> @ imm = #40
     122: 47 46        	mov	r7, r8
     124: 00 24        	movs	r4, #0
     126: 40 f2 00 03  	movw	r3, #0
     12a: c0 f2 00 03  	movt	r3, #0
     12e: e3 18        	adds	r3, r4, r3
     130: 3c 33        	adds	r3, #60
     132: 18 78        	ldrb	r0, [r3]
     134: ff f7 fe ff  	bl	0x134 <read_pres_prtouch+0x134> @ imm = #-4
     138: 43 1e        	subs	r3, r0, #1
     13a: 98 41        	sbcs	r0, r3
     13c: 3b 68        	ldr	r3, [r7]
     13e: 01 34        	adds	r4, #1
     140: 9c 46        	mov	r12, r3
     142: 60 44        	add	r0, r12
     144: 01 c7        	stm	r7!, {r0}
     146: 2b 8b        	ldrh	r3, [r5, #24]
     148: 9c 42        	cmp	r4, r3
     14a: ec db        	blt	0x126 <read_pres_prtouch+0x126> @ imm = #-40
     14c: 01 3e        	subs	r6, #1
     14e: 00 2e        	cmp	r6, #0
     150: b4 d1        	bne	0xbc <read_pres_prtouch+0xbc> @ imm = #-152
     152: 00 24        	movs	r4, #0
     154: 00 2b        	cmp	r3, #0
     156: 00 d1        	bne	0x15a <read_pres_prtouch+0x15a> @ imm = #0
     158: 95 e0        	b	0x286 <read_pres_prtouch+0x286> @ imm = #298
     15a: 40 f2 00 02  	movw	r2, #0
     15e: 23 00        	movs	r3, r4
     160: c0 f2 00 02  	movt	r2, #0
     164: 94 46        	mov	r12, r2
     166: 0a 33        	adds	r3, #10
     168: 9b 00        	lsls	r3, r3, #2
     16a: 63 44        	add	r3, r12
     16c: 01 21        	movs	r1, #1
     16e: 58 68        	ldr	r0, [r3, #4]
     170: ff f7 fe ff  	bl	0x170 <read_pres_prtouch+0x170> @ imm = #-4
     174: 2a 8b        	ldrh	r2, [r5, #24]
     176: 01 34        	adds	r4, #1
     178: 94 42        	cmp	r4, r2
     17a: ee db        	blt	0x15a <read_pres_prtouch+0x15a> @ imm = #-36
     17c: 00 2a        	cmp	r2, #0
     17e: 00 d1        	bne	0x182 <read_pres_prtouch+0x182> @ imm = #0
     180: 81 e0        	b	0x286 <read_pres_prtouch+0x286> @ imm = #258
     182: 92 00        	lsls	r2, r2, #2
     184: 80 20        	movs	r0, #128
     186: ff 24        	movs	r4, #255
     188: 42 44        	add	r2, r8
     18a: 43 46        	mov	r3, r8
     18c: 11 00        	movs	r1, r2
     18e: 00 04        	lsls	r0, r0, #16
     190: 24 06        	lsls	r4, r4, #24
     192: 1a 68        	ldr	r2, [r3]
     194: 02 42        	tst	r2, r0
     196: 00 d0        	beq	0x19a <read_pres_prtouch+0x19a> @ imm = #0
     198: 22 43        	orrs	r2, r4
     19a: 04 c3        	stm	r3!, {r2}
     19c: 8b 42        	cmp	r3, r1
     19e: f8 d1        	bne	0x192 <read_pres_prtouch+0x192> @ imm = #-16
     1a0: 00 24        	movs	r4, #0
     1a2: 40 f2 00 02  	movw	r2, #0
     1a6: 23 00        	movs	r3, r4
     1a8: c0 f2 00 02  	movt	r2, #0
     1ac: 94 46        	mov	r12, r2
     1ae: 0a 33        	adds	r3, #10
     1b0: 9b 00        	lsls	r3, r3, #2
     1b2: 63 44        	add	r3, r12
     1b4: 00 21        	movs	r1, #0
     1b6: 58 68        	ldr	r0, [r3, #4]
     1b8: ff f7 fe ff  	bl	0x1b8 <read_pres_prtouch+0x1b8> @ imm = #-4
     1bc: 2a 8b        	ldrh	r2, [r5, #24]
     1be: 01 34        	adds	r4, #1
     1c0: 94 42        	cmp	r4, r2
     1c2: ee db        	blt	0x1a2 <read_pres_prtouch+0x1a2> @ imm = #-36
     1c4: 59 46        	mov	r1, r11
     1c6: 4b 46        	mov	r3, r9
     1c8: 5c 69        	ldr	r4, [r3, #20]
     1ca: 1b 69        	ldr	r3, [r3, #16]
     1cc: 0b 60        	str	r3, [r1]
     1ce: 4c 60        	str	r4, [r1, #4]
     1d0: 52 b1        	cbz	r2, 0x1e8 <read_pres_prtouch+0x1e8> @ imm = #20
     1d2: 31 49        	ldr	r1, [pc, #196]          @ 0x298 <$d>
     1d4: 92 00        	lsls	r2, r2, #2
     1d6: 43 46        	mov	r3, r8
     1d8: 88 59        	ldr	r0, [r1, r6]
     1da: 9b 59        	ldr	r3, [r3, r6]
     1dc: 1b 1a        	subs	r3, r3, r0
     1de: 40 46        	mov	r0, r8
     1e0: 83 51        	str	r3, [r0, r6]
     1e2: 04 36        	adds	r6, #4
     1e4: b2 42        	cmp	r2, r6
     1e6: f6 d1        	bne	0x1d6 <read_pres_prtouch+0x1d6> @ imm = #-20
     1e8: 01 20        	movs	r0, #1
     1ea: 4a e7        	b	0x82 <read_pres_prtouch+0x82> @ imm = #-364
     1ec: 2b 8b        	ldrh	r3, [r5, #24]
     1ee: 00 2b        	cmp	r3, #0
     1f0: fa d0        	beq	0x1e8 <read_pres_prtouch+0x1e8> @ imm = #-12
     1f2: 40 f2 00 09  	movw	r9, #0
     1f6: 40 f2 00 0b  	movw	r11, #0
     1fa: c0 f2 00 09  	movt	r9, #0
     1fe: 4b 46        	mov	r3, r9
     200: 1e 69        	ldr	r6, [r3, #16]
     202: 5f 69        	ldr	r7, [r3, #20]
     204: 06 23        	movs	r3, #6
     206: 5b 44        	add	r3, r11
     208: 9c 00        	lsls	r4, r3, #2
     20a: 9a 46        	mov	r10, r3
     20c: 40 f2 00 03  	movw	r3, #0
     210: c0 f2 00 03  	movt	r3, #0
     214: 9c 46        	mov	r12, r3
     216: 64 44        	add	r4, r12
     218: 11 e0        	b	0x23e <read_pres_prtouch+0x23e> @ imm = #34
     21a: 49 46        	mov	r1, r9
     21c: 32 00        	movs	r2, r6
     21e: 08 69        	ldr	r0, [r1, #16]
     220: 49 69        	ldr	r1, [r1, #20]
     222: 3b 00        	movs	r3, r7
     224: ff f7 fe ff  	bl	0x224 <read_pres_prtouch+0x224> @ imm = #-4
     228: 4a f6 fc 12  	movw	r2, #43516
     22c: 46 f2 4d 23  	movw	r3, #25165
     230: cd f2 f1 22  	movt	r2, #54001
     234: c3 f6 60 73  	movt	r3, #16224
     238: ff f7 fe ff  	bl	0x238 <read_pres_prtouch+0x238> @ imm = #-4
     23c: 20 b1        	cbz	r0, 0x248 <read_pres_prtouch+0x248> @ imm = #8
     23e: 60 68        	ldr	r0, [r4, #4]
     240: ff f7 fe ff  	bl	0x240 <read_pres_prtouch+0x240> @ imm = #-4
     244: 00 28        	cmp	r0, #0
     246: e8 d1        	bne	0x21a <read_pres_prtouch+0x21a> @ imm = #-48
     248: 40 f2 00 02  	movw	r2, #0
     24c: 53 46        	mov	r3, r10
     24e: c0 f2 00 02  	movt	r2, #0
     252: 94 46        	mov	r12, r2
     254: 9b 00        	lsls	r3, r3, #2
     256: 63 44        	add	r3, r12
     258: 58 68        	ldr	r0, [r3, #4]
     25a: ff f7 fe ff  	bl	0x25a <read_pres_prtouch+0x25a> @ imm = #-4
     25e: 5b 46        	mov	r3, r11
     260: 42 46        	mov	r2, r8
     262: 40 f2 01 0c  	movw	r12, #1
     266: 9b 00        	lsls	r3, r3, #2
     268: d0 50        	str	r0, [r2, r3]
     26a: 2b 8b        	ldrh	r3, [r5, #24]
     26c: e3 44        	add	r11, r12
     26e: 5b 45        	cmp	r3, r11
     270: c5 dc        	bgt	0x1fe <read_pres_prtouch+0x1fe> @ imm = #-118
     272: 01 20        	movs	r0, #1
     274: 05 e7        	b	0x82 <read_pres_prtouch+0x82> @ imm = #-502
     276: 40 f2 00 09  	movw	r9, #0
     27a: 40 f2 00 0b  	movw	r11, #0
     27e: c0 f2 00 09  	movt	r9, #0
     282: c0 f2 00 0b  	movt	r11, #0
     286: 5a 46        	mov	r2, r11
     288: 4b 46        	mov	r3, r9
     28a: 01 20        	movs	r0, #1
     28c: 5c 69        	ldr	r4, [r3, #20]
     28e: 1b 69        	ldr	r3, [r3, #16]
     290: 13 60        	str	r3, [r2]
     292: 54 60        	str	r4, [r2, #4]
     294: f5 e6        	b	0x82 <read_pres_prtouch+0x82> @ imm = #-534
     296: c0 46        	mov	r8, r8

00000298 <$d>:
     298:	0c 03 00 00	.word	0x0000030c

Disassembly of section .text.filter_datas_prtouch:

00000000 <filter_datas_prtouch>:
       0: f0 b5        	push	{r4, r5, r6, r7, lr}
       2: de 46        	mov	lr, r11
       4: 57 46        	mov	r7, r10
       6: 4e 46        	mov	r6, r9
       8: 45 46        	mov	r5, r8
       a: e0 b5        	push	{r5, r6, r7, lr}
       c: 40 f2 00 05  	movw	r5, #0
      10: 85 b0        	sub	sp, #20
      12: c0 f2 00 05  	movt	r5, #0
      16: 04 00        	movs	r4, r0
      18: 80 22        	movs	r2, #128
      1a: 02 90        	str	r0, [sp, #8]
      1c: 8b 46        	mov	r11, r1
      1e: 28 00        	movs	r0, r5
      20: 00 21        	movs	r1, #0
      22: ff f7 fe ff  	bl	0x22 <filter_datas_prtouch+0x22> @ imm = #-4
      26: 40 f2 00 00  	movw	r0, #0
      2a: 40 f2 00 12  	movw	r2, #256
      2e: 00 21        	movs	r1, #0
      30: c0 f2 00 00  	movt	r0, #0
      34: ff f7 fe ff  	bl	0x34 <filter_datas_prtouch+0x34> @ imm = #-4
      38: 62 01        	lsls	r2, r4, #5
      3a: 90 46        	mov	r8, r2
      3c: 40 f2 00 02  	movw	r2, #0
      40: 23 00        	movs	r3, r4
      42: c0 f2 00 02  	movt	r2, #0
      46: 94 46        	mov	r12, r2
      48: 43 44        	add	r3, r8
      4a: 18 00        	movs	r0, r3
      4c: 9b 00        	lsls	r3, r3, #2
      4e: 63 44        	add	r3, r12
      50: c4 33        	adds	r3, #196
      52: 19 68        	ldr	r1, [r3]
      54: 40 f2 00 03  	movw	r3, #0
      58: 2f 00        	movs	r7, r5
      5a: aa 46        	mov	r10, r5
      5c: a9 46        	mov	r9, r5
      5e: 2c 00        	movs	r4, r5
      60: 1f 26        	movs	r6, #31
      62: c0 f2 00 03  	movt	r3, #0
      66: 80 37        	adds	r7, #128
      68: 00 93        	str	r3, [sp]
      6a: ca 17        	asrs	r2, r1, #31
      6c: d2 0e        	lsrs	r2, r2, #27
      6e: 8b 18        	adds	r3, r1, r2
      70: 33 40        	ands	r3, r6
      72: 9b 1a        	subs	r3, r3, r2
      74: 40 f2 00 02  	movw	r2, #0
      78: c0 f2 00 02  	movt	r2, #0
      7c: 94 46        	mov	r12, r2
      7e: c3 18        	adds	r3, r0, r3
      80: 30 33        	adds	r3, #48
      82: 9b 00        	lsls	r3, r3, #2
      84: 63 44        	add	r3, r12
      86: 9b 68        	ldr	r3, [r3, #8]
      88: 01 31        	adds	r1, #1
      8a: 08 c4        	stm	r4!, {r3}
      8c: bc 42        	cmp	r4, r7
      8e: ec d1        	bne	0x6a <filter_datas_prtouch+0x6a> @ imm = #-40
      90: 4b 46        	mov	r3, r9
      92: 18 68        	ldr	r0, [r3]
      94: db 6f        	ldr	r3, [r3, #124]
      96: 83 42        	cmp	r3, r0
      98: 5b da        	bge	0x152 <filter_datas_prtouch+0x152> @ imm = #182
      9a: 00 9b        	ldr	r3, [sp]
      9c: 41 f2 00 04  	movw	r4, #4096
      a0: 59 8b        	ldrh	r1, [r3, #26]
      a2: 40 f2 00 03  	movw	r3, #0
      a6: c0 f2 00 03  	movt	r3, #0
      aa: 00 e0        	b	0xae <filter_datas_prtouch+0xae> @ imm = #0
      ac: 18 68        	ldr	r0, [r3]
      ae: 42 42        	rsbs	r2, r0, #0
      b0: 01 b1        	cbz	r1, 0xb4 <filter_datas_prtouch+0xb4> @ imm = #0
      b2: 22 1a        	subs	r2, r4, r0
      b4: 04 c3        	stm	r3!, {r2}
      b6: bb 42        	cmp	r3, r7
      b8: f8 d1        	bne	0xac <filter_datas_prtouch+0xac> @ imm = #-16
      ba: 4b 46        	mov	r3, r9
      bc: 18 68        	ldr	r0, [r3]
      be: 5b 46        	mov	r3, r11
      c0: 00 29        	cmp	r1, #0
      c2: 4b d0        	beq	0x15c <filter_datas_prtouch+0x15c> @ imm = #150
      c4: 00 2b        	cmp	r3, #0
      c6: 00 d0        	beq	0xca <filter_datas_prtouch+0xca> @ imm = #0
      c8: 38 e1        	b	0x33c <filter_datas_prtouch+0x33c> @ imm = #624
      ca: 40 f2 00 08  	movw	r8, #0
      ce: c0 f2 00 08  	movt	r8, #0
      d2: 43 46        	mov	r3, r8
      d4: 5e 1c        	adds	r6, r3, #1
      d6: 44 46        	mov	r4, r8
      d8: d0 4d        	ldr	r5, [pc, #832]          @ 0x41c <$d>
      da: ff 36        	adds	r6, #255
      dc: 00 e0        	b	0xe0 <filter_datas_prtouch+0xe0> @ imm = #0
      de: 01 cd        	ldm	r5!, {r0}
      e0: ff f7 fe ff  	bl	0xe0 <filter_datas_prtouch+0xe0> @ imm = #-4
      e4: 03 c4        	stm	r4!, {r0, r1}
      e6: a6 42        	cmp	r6, r4
      e8: f9 d1        	bne	0xde <filter_datas_prtouch+0xde> @ imm = #-14
      ea: 40 f2 f4 23  	movw	r3, #756
      ee: 00 9a        	ldr	r2, [sp]
      f0: d4 58        	ldr	r4, [r2, r3]
      f2: 20 1c        	adds	r0, r4, #0
      f4: ff f7 fe ff  	bl	0xf4 <filter_datas_prtouch+0xf4> @ imm = #-4
      f8: 06 00        	movs	r6, r0
      fa: fe 20        	movs	r0, #254
      fc: 0f 00        	movs	r7, r1
      fe: 80 05        	lsls	r0, r0, #22
     100: 21 1c        	adds	r1, r4, #0
     102: ff f7 fe ff  	bl	0x102 <filter_datas_prtouch+0x102> @ imm = #-4
     106: ff f7 fe ff  	bl	0x106 <filter_datas_prtouch+0x106> @ imm = #-4
     10a: f8 23        	movs	r3, #248
     10c: 43 44        	add	r3, r8
     10e: 99 46        	mov	r9, r3
     110: 00 90        	str	r0, [sp]
     112: 01 91        	str	r1, [sp, #4]
     114: 43 46        	mov	r3, r8
     116: 30 00        	movs	r0, r6
     118: 9a 68        	ldr	r2, [r3, #8]
     11a: db 68        	ldr	r3, [r3, #12]
     11c: 39 00        	movs	r1, r7
     11e: ff f7 fe ff  	bl	0x11e <filter_datas_prtouch+0x11e> @ imm = #-4
     122: 43 46        	mov	r3, r8
     124: 04 00        	movs	r4, r0
     126: 1a 68        	ldr	r2, [r3]
     128: 5b 68        	ldr	r3, [r3, #4]
     12a: 0d 00        	movs	r5, r1
     12c: 00 98        	ldr	r0, [sp]
     12e: 01 99        	ldr	r1, [sp, #4]
     130: ff f7 fe ff  	bl	0x130 <filter_datas_prtouch+0x130> @ imm = #-4
     134: 0b 00        	movs	r3, r1
     136: 02 00        	movs	r2, r0
     138: 29 00        	movs	r1, r5
     13a: 20 00        	movs	r0, r4
     13c: ff f7 fe ff  	bl	0x13c <filter_datas_prtouch+0x13c> @ imm = #-4
     140: 40 f2 08 0c  	movw	r12, #8
     144: 43 46        	mov	r3, r8
     146: e0 44        	add	r8, r12
     148: 98 60        	str	r0, [r3, #8]
     14a: d9 60        	str	r1, [r3, #12]
     14c: c1 45        	cmp	r9, r8
     14e: e1 d1        	bne	0x114 <filter_datas_prtouch+0x114> @ imm = #-62
     150: e9 e0        	b	0x326 <filter_datas_prtouch+0x326> @ imm = #466
     152: 00 9b        	ldr	r3, [sp]
     154: 59 8b        	ldrh	r1, [r3, #26]
     156: 5b 46        	mov	r3, r11
     158: 00 29        	cmp	r1, #0
     15a: b3 d1        	bne	0xc4 <filter_datas_prtouch+0xc4> @ imm = #-154
     15c: 00 2b        	cmp	r3, #0
     15e: 00 d0        	beq	0x162 <filter_datas_prtouch+0x162> @ imm = #0
     160: b9 e0        	b	0x2d6 <filter_datas_prtouch+0x2d6> @ imm = #370
     162: 53 46        	mov	r3, r10
     164: 2f 00        	movs	r7, r5
     166: 02 93        	str	r3, [sp, #8]
     168: 00 e0        	b	0x16c <filter_datas_prtouch+0x16c> @ imm = #0
     16a: 38 68        	ldr	r0, [r7]
     16c: ff f7 fe ff  	bl	0x16c <filter_datas_prtouch+0x16c> @ imm = #-4
     170: 04 00        	movs	r4, r0
     172: 80 46        	mov	r8, r0
     174: 78 68        	ldr	r0, [r7, #4]
     176: 4d 00        	lsls	r5, r1, #1
     178: 8a 46        	mov	r10, r1
     17a: ff f7 fe ff  	bl	0x17a <filter_datas_prtouch+0x17a> @ imm = #-4
     17e: 6d 08        	lsrs	r5, r5, #1
     180: 4b 00        	lsls	r3, r1, #1
     182: 83 46        	mov	r11, r0
     184: 0e 00        	movs	r6, r1
     186: 02 00        	movs	r2, r0
     188: 5b 08        	lsrs	r3, r3, #1
     18a: 20 00        	movs	r0, r4
     18c: 29 00        	movs	r1, r5
     18e: 99 46        	mov	r9, r3
     190: ff f7 fe ff  	bl	0x190 <filter_datas_prtouch+0x190> @ imm = #-4
     194: 18 b9        	cbnz	r0, 0x19e <filter_datas_prtouch+0x19e> @ imm = #6
     196: d8 46        	mov	r8, r11
     198: 4d 46        	mov	r5, r9
     19a: 5c 46        	mov	r4, r11
     19c: b2 46        	mov	r10, r6
     19e: be 68        	ldr	r6, [r7, #8]
     1a0: 30 00        	movs	r0, r6
     1a2: ff f7 fe ff  	bl	0x1a2 <filter_datas_prtouch+0x1a2> @ imm = #-4
     1a6: 4b 00        	lsls	r3, r1, #1
     1a8: 99 46        	mov	r9, r3
     1aa: 2b 00        	movs	r3, r5
     1ac: 4d 46        	mov	r5, r9
     1ae: 42 46        	mov	r2, r8
     1b0: 69 08        	lsrs	r1, r5, #1
     1b2: ff f7 fe ff  	bl	0x1b2 <filter_datas_prtouch+0x1b2> @ imm = #-4
     1b6: 20 b1        	cbz	r0, 0x1c2 <filter_datas_prtouch+0x1c2> @ imm = #8
     1b8: 20 00        	movs	r0, r4
     1ba: 51 46        	mov	r1, r10
     1bc: ff f7 fe ff  	bl	0x1bc <filter_datas_prtouch+0x1bc> @ imm = #-4
     1c0: 06 00        	movs	r6, r0
     1c2: 97 4b        	ldr	r3, [pc, #604]          @ 0x420 <$d+0x4>
     1c4: 40 c7        	stm	r7!, {r6}
     1c6: bb 42        	cmp	r3, r7
     1c8: cf d1        	bne	0x16a <filter_datas_prtouch+0x16a> @ imm = #-98
     1ca: 02 9b        	ldr	r3, [sp, #8]
     1cc: 4f f6 84 10  	movw	r0, #63876
     1d0: 9a 46        	mov	r10, r3
     1d2: 40 f2 f0 23  	movw	r3, #752
     1d6: 00 9e        	ldr	r6, [sp]
     1d8: c3 f6 22 60  	movt	r0, #15906
     1dc: f1 58        	ldr	r1, [r6, r3]
     1de: ff f7 fe ff  	bl	0x1de <filter_datas_prtouch+0x1de> @ imm = #-4
     1e2: ff f7 fe ff  	bl	0x1e2 <filter_datas_prtouch+0x1e2> @ imm = #-4
     1e6: 40 f2 ee 23  	movw	r3, #750
     1ea: 04 00        	movs	r4, r0
     1ec: f0 5a        	ldrh	r0, [r6, r3]
     1ee: 0d 00        	movs	r5, r1
     1f0: ff f7 fe ff  	bl	0x1f0 <filter_datas_prtouch+0x1f0> @ imm = #-4
     1f4: 01 1c        	adds	r1, r0, #0
     1f6: 00 20        	movs	r0, #0
     1f8: c4 f2 7a 40  	movt	r0, #17530
     1fc: ff f7 fe ff  	bl	0x1fc <filter_datas_prtouch+0x1fc> @ imm = #-4
     200: 01 1c        	adds	r1, r0, #0
     202: fe 20        	movs	r0, #254
     204: 80 05        	lsls	r0, r0, #22
     206: ff f7 fe ff  	bl	0x206 <filter_datas_prtouch+0x206> @ imm = #-4
     20a: ff f7 fe ff  	bl	0x20a <filter_datas_prtouch+0x20a> @ imm = #-4
     20e: 22 00        	movs	r2, r4
     210: 2b 00        	movs	r3, r5
     212: ff f7 fe ff  	bl	0x212 <filter_datas_prtouch+0x212> @ imm = #-4
     216: 0b 00        	movs	r3, r1
     218: 02 00        	movs	r2, r0
     21a: 29 00        	movs	r1, r5
     21c: 20 00        	movs	r0, r4
     21e: ff f7 fe ff  	bl	0x21e <filter_datas_prtouch+0x21e> @ imm = #-4
     222: 80 4b        	ldr	r3, [pc, #512]          @ 0x424 <$d+0x8>
     224: 06 00        	movs	r6, r0
     226: 98 46        	mov	r8, r3
     228: f0 23        	movs	r3, #240
     22a: 43 44        	add	r3, r8
     22c: 0f 00        	movs	r7, r1
     22e: 9b 46        	mov	r11, r3
     230: c1 46        	mov	r9, r8
     232: 00 24        	movs	r4, #0
     234: 00 25        	movs	r5, #0
     236: 02 e0        	b	0x23e <filter_datas_prtouch+0x23e> @ imm = #4
     238: 40 f2 08 0c  	movw	r12, #8
     23c: e1 44        	add	r9, r12
     23e: 52 46        	mov	r2, r10
     240: 53 46        	mov	r3, r10
     242: 58 68        	ldr	r0, [r3, #4]
     244: 08 ca        	ldm	r2!, {r3}
     246: c0 1a        	subs	r0, r0, r3
     248: 92 46        	mov	r10, r2
     24a: ff f7 fe ff  	bl	0x24a <filter_datas_prtouch+0x24a> @ imm = #-4
     24e: 22 00        	movs	r2, r4
     250: 2b 00        	movs	r3, r5
     252: ff f7 fe ff  	bl	0x252 <filter_datas_prtouch+0x252> @ imm = #-4
     256: 3b 00        	movs	r3, r7
     258: 32 00        	movs	r2, r6
     25a: ff f7 fe ff  	bl	0x25a <filter_datas_prtouch+0x25a> @ imm = #-4
     25e: 4b 46        	mov	r3, r9
     260: 04 00        	movs	r4, r0
     262: 0d 00        	movs	r5, r1
     264: 1c 60        	str	r4, [r3]
     266: 5d 60        	str	r5, [r3, #4]
     268: cb 45        	cmp	r11, r9
     26a: e5 d1        	bne	0x238 <filter_datas_prtouch+0x238> @ imm = #-54
     26c: 40 f2 f4 23  	movw	r3, #756
     270: 00 9a        	ldr	r2, [sp]
     272: 00 25        	movs	r5, #0
     274: d4 58        	ldr	r4, [r2, r3]
     276: 20 1c        	adds	r0, r4, #0
     278: ff f7 fe ff  	bl	0x278 <filter_datas_prtouch+0x278> @ imm = #-4
     27c: 00 90        	str	r0, [sp]
     27e: 01 91        	str	r1, [sp, #4]
     280: fe 20        	movs	r0, #254
     282: 21 1c        	adds	r1, r4, #0
     284: 80 05        	lsls	r0, r0, #22
     286: ff f7 fe ff  	bl	0x286 <filter_datas_prtouch+0x286> @ imm = #-4
     28a: ff f7 fe ff  	bl	0x28a <filter_datas_prtouch+0x28a> @ imm = #-4
     28e: 00 24        	movs	r4, #0
     290: 02 90        	str	r0, [sp, #8]
     292: 03 91        	str	r1, [sp, #12]
     294: 02 e0        	b	0x29c <filter_datas_prtouch+0x29c> @ imm = #4
     296: 40 f2 08 0c  	movw	r12, #8
     29a: e0 44        	add	r8, r12
     29c: 43 46        	mov	r3, r8
     29e: 00 98        	ldr	r0, [sp]
     2a0: 01 99        	ldr	r1, [sp, #4]
     2a2: 1a 68        	ldr	r2, [r3]
     2a4: 5b 68        	ldr	r3, [r3, #4]
     2a6: ff f7 fe ff  	bl	0x2a6 <filter_datas_prtouch+0x2a6> @ imm = #-4
     2aa: 22 00        	movs	r2, r4
     2ac: 2b 00        	movs	r3, r5
     2ae: 06 00        	movs	r6, r0
     2b0: 0f 00        	movs	r7, r1
     2b2: 02 98        	ldr	r0, [sp, #8]
     2b4: 03 99        	ldr	r1, [sp, #12]
     2b6: ff f7 fe ff  	bl	0x2b6 <filter_datas_prtouch+0x2b6> @ imm = #-4
     2ba: 0b 00        	movs	r3, r1
     2bc: 02 00        	movs	r2, r0
     2be: 39 00        	movs	r1, r7
     2c0: 30 00        	movs	r0, r6
     2c2: ff f7 fe ff  	bl	0x2c2 <filter_datas_prtouch+0x2c2> @ imm = #-4
     2c6: 43 46        	mov	r3, r8
     2c8: 04 00        	movs	r4, r0
     2ca: 0d 00        	movs	r5, r1
     2cc: 1c 60        	str	r4, [r3]
     2ce: 5d 60        	str	r5, [r3, #4]
     2d0: c8 45        	cmp	r8, r9
     2d2: e0 d1        	bne	0x296 <filter_datas_prtouch+0x296> @ imm = #-64
     2d4: 27 e0        	b	0x326 <filter_datas_prtouch+0x326> @ imm = #78
     2d6: 02 9b        	ldr	r3, [sp, #8]
     2d8: 43 44        	add	r3, r8
     2da: 99 00        	lsls	r1, r3, #2
     2dc: 40 f2 00 03  	movw	r3, #0
     2e0: c0 f2 00 03  	movt	r3, #0
     2e4: 9c 46        	mov	r12, r3
     2e6: c8 31        	adds	r1, #200
     2e8: 00 23        	movs	r3, #0
     2ea: 61 44        	add	r1, r12
     2ec: 05 e0        	b	0x2fa <filter_datas_prtouch+0x2fa> @ imm = #10
     2ee: 40 f2 00 02  	movw	r2, #0
     2f2: c0 f2 00 02  	movt	r2, #0
     2f6: 9a 18        	adds	r2, r3, r2
     2f8: 10 68        	ldr	r0, [r2]
     2fa: c8 50        	str	r0, [r1, r3]
     2fc: 04 33        	adds	r3, #4
     2fe: 80 2b        	cmp	r3, #128
     300: f5 d1        	bne	0x2ee <filter_datas_prtouch+0x2ee> @ imm = #-22
     302: 40 f2 00 02  	movw	r2, #0
     306: 02 99        	ldr	r1, [sp, #8]
     308: c0 f2 00 02  	movt	r2, #0
     30c: 0b 00        	movs	r3, r1
     30e: 94 46        	mov	r12, r2
     310: 00 22        	movs	r2, #0
     312: 43 44        	add	r3, r8
     314: 9b 00        	lsls	r3, r3, #2
     316: 63 44        	add	r3, r12
     318: c4 33        	adds	r3, #196
     31a: 1a 60        	str	r2, [r3]
     31c: 00 9b        	ldr	r3, [sp]
     31e: 1b 8b        	ldrh	r3, [r3, #24]
     320: 01 3b        	subs	r3, #1
     322: 8b 42        	cmp	r3, r1
     324: 52 d0        	beq	0x3cc <filter_datas_prtouch+0x3cc> @ imm = #164
     326: 40 f2 00 00  	movw	r0, #0
     32a: c0 f2 00 00  	movt	r0, #0
     32e: 05 b0        	add	sp, #20
     330: 3c bc        	pop	{r2, r3, r4, r5}
     332: 90 46        	mov	r8, r2
     334: 99 46        	mov	r9, r3
     336: a2 46        	mov	r10, r4
     338: ab 46        	mov	r11, r5
     33a: f0 bd        	pop	{r4, r5, r6, r7, pc}
     33c: 02 9b        	ldr	r3, [sp, #8]
     33e: 00 22        	movs	r2, #0
     340: 43 44        	add	r3, r8
     342: 99 00        	lsls	r1, r3, #2
     344: 40 f2 00 03  	movw	r3, #0
     348: c0 f2 00 03  	movt	r3, #0
     34c: cb 18        	adds	r3, r1, r3
     34e: c4 33        	adds	r3, #196
     350: 1a 60        	str	r2, [r3]
     352: 40 f2 00 03  	movw	r3, #0
     356: c0 f2 00 03  	movt	r3, #0
     35a: 9c 46        	mov	r12, r3
     35c: c8 31        	adds	r1, #200
     35e: 00 23        	movs	r3, #0
     360: 61 44        	add	r1, r12
     362: 05 e0        	b	0x370 <filter_datas_prtouch+0x370> @ imm = #10
     364: 40 f2 00 02  	movw	r2, #0
     368: c0 f2 00 02  	movt	r2, #0
     36c: 9a 18        	adds	r2, r3, r2
     36e: 10 68        	ldr	r0, [r2]
     370: c8 50        	str	r0, [r1, r3]
     372: 04 33        	adds	r3, #4
     374: 80 2b        	cmp	r3, #128
     376: f5 d1        	bne	0x364 <filter_datas_prtouch+0x364> @ imm = #-22
     378: 00 9b        	ldr	r3, [sp]
     37a: 02 9a        	ldr	r2, [sp, #8]
     37c: 1b 8b        	ldrh	r3, [r3, #24]
     37e: 01 3b        	subs	r3, #1
     380: 93 42        	cmp	r3, r2
     382: d0 d1        	bne	0x326 <filter_datas_prtouch+0x326> @ imm = #-96
     384: 1f 20        	movs	r0, #31
     386: 54 46        	mov	r4, r10
     388: 00 9b        	ldr	r3, [sp]
     38a: 19 6c        	ldr	r1, [r3, #64]
     38c: ca 17        	asrs	r2, r1, #31
     38e: d2 0e        	lsrs	r2, r2, #27
     390: 8b 18        	adds	r3, r1, r2
     392: 03 40        	ands	r3, r0
     394: 9b 1a        	subs	r3, r3, r2
     396: 40 f2 00 02  	movw	r2, #0
     39a: c0 f2 00 02  	movt	r2, #0
     39e: 94 46        	mov	r12, r2
     3a0: 9b 00        	lsls	r3, r3, #2
     3a2: 63 44        	add	r3, r12
     3a4: 5b 6c        	ldr	r3, [r3, #68]
     3a6: 01 31        	adds	r1, #1
     3a8: 08 c4        	stm	r4!, {r3}
     3aa: bc 42        	cmp	r4, r7
     3ac: ee d1        	bne	0x38c <filter_datas_prtouch+0x38c> @ imm = #-36
     3ae: 00 23        	movs	r3, #0
     3b0: 00 9a        	ldr	r2, [sp]
     3b2: 1d 49        	ldr	r1, [pc, #116]          @ 0x428 <$d+0xc>
     3b4: 13 64        	str	r3, [r2, #64]
     3b6: 40 f2 00 02  	movw	r2, #0
     3ba: c0 f2 00 02  	movt	r2, #0
     3be: 9a 18        	adds	r2, r3, r2
     3c0: 12 68        	ldr	r2, [r2]
     3c2: ca 50        	str	r2, [r1, r3]
     3c4: 04 33        	adds	r3, #4
     3c6: 80 2b        	cmp	r3, #128
     3c8: f5 d1        	bne	0x3b6 <filter_datas_prtouch+0x3b6> @ imm = #-22
     3ca: ac e7        	b	0x326 <filter_datas_prtouch+0x326> @ imm = #-168
     3cc: 40 f2 04 33  	movw	r3, #772
     3d0: 1f 20        	movs	r0, #31
     3d2: 54 46        	mov	r4, r10
     3d4: 00 9a        	ldr	r2, [sp]
     3d6: 11 6c        	ldr	r1, [r2, #64]
     3d8: d1 50        	str	r1, [r2, r3]
     3da: ca 17        	asrs	r2, r1, #31
     3dc: d2 0e        	lsrs	r2, r2, #27
     3de: 8b 18        	adds	r3, r1, r2
     3e0: 03 40        	ands	r3, r0
     3e2: 9b 1a        	subs	r3, r3, r2
     3e4: 40 f2 00 02  	movw	r2, #0
     3e8: c0 f2 00 02  	movt	r2, #0
     3ec: 94 46        	mov	r12, r2
     3ee: 9b 00        	lsls	r3, r3, #2
     3f0: 63 44        	add	r3, r12
     3f2: 5b 6c        	ldr	r3, [r3, #68]
     3f4: 01 31        	adds	r1, #1
     3f6: 08 c4        	stm	r4!, {r3}
     3f8: bc 42        	cmp	r4, r7
     3fa: ee d1        	bne	0x3da <filter_datas_prtouch+0x3da> @ imm = #-36
     3fc: 00 23        	movs	r3, #0
     3fe: 0a 49        	ldr	r1, [pc, #40]           @ 0x428 <$d+0xc>
     400: 40 f2 00 02  	movw	r2, #0
     404: c0 f2 00 02  	movt	r2, #0
     408: 9a 18        	adds	r2, r3, r2
     40a: 12 68        	ldr	r2, [r2]
     40c: ca 50        	str	r2, [r1, r3]
     40e: 04 33        	adds	r3, #4
     410: 80 2b        	cmp	r3, #128
     412: f5 d1        	bne	0x400 <filter_datas_prtouch+0x400> @ imm = #-22
     414: 00 23        	movs	r3, #0
     416: 00 9a        	ldr	r2, [sp]
     418: 13 64        	str	r3, [r2, #64]
     41a: 84 e7        	b	0x326 <filter_datas_prtouch+0x326> @ imm = #-248

0000041c <$d>:
     41c:	04 00 00 00	.word	0x00000004
     420:	78 00 00 00	.word	0x00000078
     424:	08 00 00 00	.word	0x00000008
     428:	44 00 00 00	.word	0x00000044

Disassembly of section .text.check_pres_tri_prtouch:

00000000 <check_pres_tri_prtouch>:
       0: f0 b5        	push	{r4, r5, r6, r7, lr}
       2: 57 46        	mov	r7, r10
       4: 40 f2 00 0a  	movw	r10, #0
       8: de 46        	mov	lr, r11
       a: 4e 46        	mov	r6, r9
       c: 45 46        	mov	r5, r8
       e: c0 f2 00 0a  	movt	r10, #0
      12: 53 46        	mov	r3, r10
      14: e0 b5        	push	{r5, r6, r7, lr}
      16: 5b 8b        	ldrh	r3, [r3, #26]
      18: 87 b0        	sub	sp, #28
      1a: 00 2b        	cmp	r3, #0
      1c: 58 d0        	beq	0xd0 <check_pres_tri_prtouch+0xd0> @ imm = #176
      1e: 40 f2 e2 23  	movw	r3, #738
      22: 00 22        	movs	r2, #0
      24: 51 46        	mov	r1, r10
      26: ca 52        	strh	r2, [r1, r3]
      28: 0b 8b        	ldrh	r3, [r1, #24]
      2a: 40 f2 00 09  	movw	r9, #0
      2e: 05 92        	str	r2, [sp, #20]
      30: 00 2b        	cmp	r3, #0
      32: 00 d1        	bne	0x36 <check_pres_tri_prtouch+0x36> @ imm = #0
      34: 09 e1        	b	0x24a <check_pres_tri_prtouch+0x24a> @ imm = #530
      36: 00 21        	movs	r1, #0
      38: 48 46        	mov	r0, r9
      3a: ff f7 fe ff  	bl	0x3a <check_pres_tri_prtouch+0x3a> @ imm = #-4
      3e: 40 f2 fc 23  	movw	r3, #764
      42: 52 46        	mov	r2, r10
      44: d3 58        	ldr	r3, [r2, r3]
      46: 05 00        	movs	r5, r0
      48: 9b 46        	mov	r11, r3
      4a: 00 2b        	cmp	r3, #0
      4c: 33 d0        	beq	0xb6 <check_pres_tri_prtouch+0xb6> @ imm = #102
      4e: 40 f2 00 33  	movw	r3, #768
      52: d0 58        	ldr	r0, [r2, r3]
      54: ff f7 fe ff  	bl	0x54 <check_pres_tri_prtouch+0x54> @ imm = #-4
      58: 5b 46        	mov	r3, r11
      5a: 40 f2 f8 08  	movw	r8, #248
      5e: 06 00        	movs	r6, r0
      60: d8 00        	lsls	r0, r3, #3
      62: 2c 00        	movs	r4, r5
      64: 2d 1a        	subs	r5, r5, r0
      66: a8 44        	add	r8, r5
      68: 0f 00        	movs	r7, r1
      6a: 00 25        	movs	r5, #0
      6c: f8 34        	adds	r4, #248
      6e: 3b 00        	movs	r3, r7
      70: 20 68        	ldr	r0, [r4]
      72: 61 68        	ldr	r1, [r4, #4]
      74: 32 00        	movs	r2, r6
      76: ff f7 fe ff  	bl	0x76 <check_pres_tri_prtouch+0x76> @ imm = #-4
      7a: 43 1e        	subs	r3, r0, #1
      7c: 98 41        	sbcs	r0, r3
      7e: 08 3c        	subs	r4, #8
      80: 2d 18        	adds	r5, r5, r0
      82: a0 45        	cmp	r8, r4
      84: f3 d1        	bne	0x6e <check_pres_tri_prtouch+0x6e> @ imm = #-26
      86: 5d 45        	cmp	r5, r11
      88: 15 d0        	beq	0xb6 <check_pres_tri_prtouch+0xb6> @ imm = #42
      8a: 53 46        	mov	r3, r10
      8c: 40 f2 e2 22  	movw	r2, #738
      90: 9b 5a        	ldrh	r3, [r3, r2]
      92: 52 46        	mov	r2, r10
      94: 40 f2 e2 21  	movw	r1, #738
      98: 40 f2 01 0c  	movw	r12, #1
      9c: 53 52        	strh	r3, [r2, r1]
      9e: 13 8b        	ldrh	r3, [r2, #24]
      a0: e1 44        	add	r9, r12
      a2: 4b 45        	cmp	r3, r9
      a4: c7 dc        	bgt	0x36 <check_pres_tri_prtouch+0x36> @ imm = #-114
      a6: 05 98        	ldr	r0, [sp, #20]
      a8: 07 b0        	add	sp, #28
      aa: 3c bc        	pop	{r2, r3, r4, r5}
      ac: 90 46        	mov	r8, r2
      ae: 99 46        	mov	r9, r3
      b0: a2 46        	mov	r10, r4
      b2: ab 46        	mov	r11, r5
      b4: f0 bd        	pop	{r4, r5, r6, r7, pc}
      b6: 05 9b        	ldr	r3, [sp, #20]
      b8: 40 f2 e2 22  	movw	r2, #738
      bc: 01 33        	adds	r3, #1
      be: 05 93        	str	r3, [sp, #20]
      c0: 53 46        	mov	r3, r10
      c2: 49 46        	mov	r1, r9
      c4: 9a 5a        	ldrh	r2, [r3, r2]
      c6: 01 23        	movs	r3, #1
      c8: 8b 40        	lsls	r3, r1
      ca: 13 43        	orrs	r3, r2
      cc: 9b b2        	uxth	r3, r3
      ce: e0 e7        	b	0x92 <check_pres_tri_prtouch+0x92> @ imm = #-64
      d0: 51 46        	mov	r1, r10
      d2: 40 f2 e2 22  	movw	r2, #738
      d6: 8b 52        	strh	r3, [r1, r2]
      d8: 0b 8b        	ldrh	r3, [r1, #24]
      da: 00 2b        	cmp	r3, #0
      dc: 00 d1        	bne	0xe0 <check_pres_tri_prtouch+0xe0> @ imm = #0
      de: b4 e0        	b	0x24a <check_pres_tri_prtouch+0x24a> @ imm = #360
      e0: 00 23        	movs	r3, #0
      e2: 40 f2 00 0b  	movw	r11, #0
      e6: 05 93        	str	r3, [sp, #20]
      e8: 06 e0        	b	0xf8 <check_pres_tri_prtouch+0xf8> @ imm = #12
      ea: 53 46        	mov	r3, r10
      ec: 40 f2 01 0c  	movw	r12, #1
      f0: 1b 8b        	ldrh	r3, [r3, #24]
      f2: e3 44        	add	r11, r12
      f4: 9b 45        	cmp	r11, r3
      f6: d6 da        	bge	0xa6 <check_pres_tri_prtouch+0xa6> @ imm = #-84
      f8: 00 21        	movs	r1, #0
      fa: 58 46        	mov	r0, r11
      fc: ff f7 fe ff  	bl	0xfc <check_pres_tri_prtouch+0xfc> @ imm = #-4
     100: 03 00        	movs	r3, r0
     102: f8 33        	adds	r3, #248
     104: 40 f2 00 32  	movw	r2, #768
     108: 1e 68        	ldr	r6, [r3]
     10a: 5f 68        	ldr	r7, [r3, #4]
     10c: 53 46        	mov	r3, r10
     10e: 9d 58        	ldr	r5, [r3, r2]
     110: 04 00        	movs	r4, r0
     112: 28 00        	movs	r0, r5
     114: ff f7 fe ff  	bl	0x114 <check_pres_tri_prtouch+0x114> @ imm = #-4
     118: 02 00        	movs	r2, r0
     11a: 0b 00        	movs	r3, r1
     11c: 30 00        	movs	r0, r6
     11e: 39 00        	movs	r1, r7
     120: ff f7 fe ff  	bl	0x120 <check_pres_tri_prtouch+0x120> @ imm = #-4
     124: d0 b1        	cbz	r0, 0x15c <check_pres_tri_prtouch+0x15c> @ imm = #52
     126: 68 08        	lsrs	r0, r5, #1
     128: ff f7 fe ff  	bl	0x128 <check_pres_tri_prtouch+0x128> @ imm = #-4
     12c: 0b 00        	movs	r3, r1
     12e: 21 00        	movs	r1, r4
     130: f0 31        	adds	r1, #240
     132: 02 00        	movs	r2, r0
     134: 08 68        	ldr	r0, [r1]
     136: 49 68        	ldr	r1, [r1, #4]
     138: ff f7 fe ff  	bl	0x138 <check_pres_tri_prtouch+0x138> @ imm = #-4
     13c: 70 b1        	cbz	r0, 0x15c <check_pres_tri_prtouch+0x15c> @ imm = #28
     13e: 03 20        	movs	r0, #3
     140: b5 fb f0 f0  	udiv	r0, r5, r0
     144: ff f7 fe ff  	bl	0x144 <check_pres_tri_prtouch+0x144> @ imm = #-4
     148: 0b 00        	movs	r3, r1
     14a: 21 00        	movs	r1, r4
     14c: e8 31        	adds	r1, #232
     14e: 02 00        	movs	r2, r0
     150: 08 68        	ldr	r0, [r1]
     152: 49 68        	ldr	r1, [r1, #4]
     154: ff f7 fe ff  	bl	0x154 <check_pres_tri_prtouch+0x154> @ imm = #-4
     158: 00 28        	cmp	r0, #0
     15a: 68 d1        	bne	0x22e <check_pres_tri_prtouch+0x22e> @ imm = #208
     15c: 53 46        	mov	r3, r10
     15e: c4 22        	movs	r2, #196
     160: 9b 58        	ldr	r3, [r3, r2]
     162: 00 93        	str	r3, [sp]
     164: 1f 2b        	cmp	r3, #31
     166: c0 dd        	ble	0xea <check_pres_tri_prtouch+0xea> @ imm = #-128
     168: 23 00        	movs	r3, r4
     16a: f0 33        	adds	r3, #240
     16c: 1a 68        	ldr	r2, [r3]
     16e: 5b 68        	ldr	r3, [r3, #4]
     170: 30 00        	movs	r0, r6
     172: 39 00        	movs	r1, r7
     174: 00 92        	str	r2, [sp]
     176: 01 93        	str	r3, [sp, #4]
     178: ff f7 fe ff  	bl	0x178 <check_pres_tri_prtouch+0x178> @ imm = #-4
     17c: 00 28        	cmp	r0, #0
     17e: b4 d0        	beq	0xea <check_pres_tri_prtouch+0xea> @ imm = #-152
     180: 40 f2 e8 09  	movw	r9, #232
     184: a1 44        	add	r9, r4
     186: 4b 46        	mov	r3, r9
     188: 19 68        	ldr	r1, [r3]
     18a: 5a 68        	ldr	r2, [r3, #4]
     18c: 02 91        	str	r1, [sp, #8]
     18e: 03 92        	str	r2, [sp, #12]
     190: 13 00        	movs	r3, r2
     192: 0a 00        	movs	r2, r1
     194: 00 98        	ldr	r0, [sp]
     196: 01 99        	ldr	r1, [sp, #4]
     198: ff f7 fe ff  	bl	0x198 <check_pres_tri_prtouch+0x198> @ imm = #-4
     19c: 00 28        	cmp	r0, #0
     19e: a4 d0        	beq	0xea <check_pres_tri_prtouch+0xea> @ imm = #-184
     1a0: 00 23        	movs	r3, #0
     1a2: a0 46        	mov	r8, r4
     1a4: 04 93        	str	r3, [sp, #16]
     1a6: 43 46        	mov	r3, r8
     1a8: 30 00        	movs	r0, r6
     1aa: 1c 68        	ldr	r4, [r3]
     1ac: 5d 68        	ldr	r5, [r3, #4]
     1ae: 39 00        	movs	r1, r7
     1b0: 22 00        	movs	r2, r4
     1b2: 2b 00        	movs	r3, r5
     1b4: ff f7 fe ff  	bl	0x1b4 <check_pres_tri_prtouch+0x1b4> @ imm = #-4
     1b8: 98 b1        	cbz	r0, 0x1e2 <check_pres_tri_prtouch+0x1e2> @ imm = #38
     1ba: 00 98        	ldr	r0, [sp]
     1bc: 01 99        	ldr	r1, [sp, #4]
     1be: 22 00        	movs	r2, r4
     1c0: 2b 00        	movs	r3, r5
     1c2: ff f7 fe ff  	bl	0x1c2 <check_pres_tri_prtouch+0x1c2> @ imm = #-4
     1c6: 60 b1        	cbz	r0, 0x1e2 <check_pres_tri_prtouch+0x1e2> @ imm = #24
     1c8: 02 98        	ldr	r0, [sp, #8]
     1ca: 03 99        	ldr	r1, [sp, #12]
     1cc: 2b 00        	movs	r3, r5
     1ce: 22 00        	movs	r2, r4
     1d0: ff f7 fe ff  	bl	0x1d0 <check_pres_tri_prtouch+0x1d0> @ imm = #-4
     1d4: 43 1e        	subs	r3, r0, #1
     1d6: 98 41        	sbcs	r0, r3
     1d8: 04 9b        	ldr	r3, [sp, #16]
     1da: 9c 46        	mov	r12, r3
     1dc: 84 44        	add	r12, r0
     1de: 63 46        	mov	r3, r12
     1e0: 04 93        	str	r3, [sp, #16]
     1e2: 40 f2 08 0c  	movw	r12, #8
     1e6: e0 44        	add	r8, r12
     1e8: c1 45        	cmp	r9, r8
     1ea: dc d1        	bne	0x1a6 <check_pres_tri_prtouch+0x1a6> @ imm = #-72
     1ec: 04 9b        	ldr	r3, [sp, #16]
     1ee: 1d 2b        	cmp	r3, #29
     1f0: 00 d0        	beq	0x1f4 <check_pres_tri_prtouch+0x1f4> @ imm = #0
     1f2: 7a e7        	b	0xea <check_pres_tri_prtouch+0xea> @ imm = #-268
     1f4: 53 46        	mov	r3, r10
     1f6: 40 f2 fc 22  	movw	r2, #764
     1fa: 98 58        	ldr	r0, [r3, r2]
     1fc: ff f7 fe ff  	bl	0x1fc <check_pres_tri_prtouch+0x1fc> @ imm = #-4
     200: 02 00        	movs	r2, r0
     202: 0b 00        	movs	r3, r1
     204: 30 00        	movs	r0, r6
     206: 39 00        	movs	r1, r7
     208: ff f7 fe ff  	bl	0x208 <check_pres_tri_prtouch+0x208> @ imm = #-4
     20c: 00 28        	cmp	r0, #0
     20e: 00 d0        	beq	0x212 <check_pres_tri_prtouch+0x212> @ imm = #0
     210: 6b e7        	b	0xea <check_pres_tri_prtouch+0xea> @ imm = #-298
     212: 5b 46        	mov	r3, r11
     214: 01 22        	movs	r2, #1
     216: 40 f2 e2 21  	movw	r1, #738
     21a: 9a 40        	lsls	r2, r3
     21c: 53 46        	mov	r3, r10
     21e: 5b 5a        	ldrh	r3, [r3, r1]
     220: 13 43        	orrs	r3, r2
     222: 52 46        	mov	r2, r10
     224: 53 52        	strh	r3, [r2, r1]
     226: 05 9b        	ldr	r3, [sp, #20]
     228: 01 33        	adds	r3, #1
     22a: 05 93        	str	r3, [sp, #20]
     22c: 5d e7        	b	0xea <check_pres_tri_prtouch+0xea> @ imm = #-326
     22e: 05 9b        	ldr	r3, [sp, #20]
     230: 01 22        	movs	r2, #1
     232: 01 33        	adds	r3, #1
     234: 05 93        	str	r3, [sp, #20]
     236: 5b 46        	mov	r3, r11
     238: 40 f2 e2 21  	movw	r1, #738
     23c: 9a 40        	lsls	r2, r3
     23e: 53 46        	mov	r3, r10
     240: 5b 5a        	ldrh	r3, [r3, r1]
     242: 13 43        	orrs	r3, r2
     244: 52 46        	mov	r2, r10
     246: 53 52        	strh	r3, [r2, r1]
     248: 4f e7        	b	0xea <check_pres_tri_prtouch+0xea> @ imm = #-354
     24a: 00 23        	movs	r3, #0
     24c: 05 93        	str	r3, [sp, #20]
     24e: 2a e7        	b	0xa6 <check_pres_tri_prtouch+0xa6> @ imm = #-428

Disassembly of section .text.command_config_pres_prtouch:

00000000 <command_config_pres_prtouch>:
       0: 40 f2 00 03  	movw	r3, #0
       4: 02 68        	ldr	r2, [r0]
       6: c0 f2 00 03  	movt	r3, #0
       a: 70 b5        	push	{r4, r5, r6, lr}
       c: 1a 80        	strh	r2, [r3]
       e: 42 68        	ldr	r2, [r0, #4]
      10: 04 00        	movs	r4, r0
      12: 5a 83        	strh	r2, [r3, #26]
      14: 82 68        	ldr	r2, [r0, #8]
      16: 00 69        	ldr	r0, [r0, #16]
      18: 1a 83        	strh	r2, [r3, #24]
      1a: ff f7 fe ff  	bl	0x1a <command_config_pres_prtouch+0x1a> @ imm = #-4
      1e: 45 f2 00 01  	movw	r1, #20480
      22: 40 f2 00 05  	movw	r5, #0
      26: c4 f2 c3 71  	movt	r1, #18371
      2a: ff f7 fe ff  	bl	0x2a <command_config_pres_prtouch+0x2a> @ imm = #-4
      2e: c0 f2 00 05  	movt	r5, #0
      32: a8 61        	str	r0, [r5, #24]
      34: 00 21        	movs	r1, #0
      36: 20 7b        	ldrb	r0, [r4, #12]
      38: 40 f2 00 05  	movw	r5, #0
      3c: ff f7 fe ff  	bl	0x3c <command_config_pres_prtouch+0x3c> @ imm = #-4
      40: c0 f2 00 05  	movt	r5, #0
      44: 00 21        	movs	r1, #0
      46: 28 60        	str	r0, [r5]
      48: ff f7 fe ff  	bl	0x48 <command_config_pres_prtouch+0x48> @ imm = #-4
      4c: 20 00        	movs	r0, r4
      4e: ff f7 fe ff  	bl	0x4e <command_config_pres_prtouch+0x4e> @ imm = #-4
      52: 70 bd        	pop	{r4, r5, r6, pc}

Disassembly of section .text.command_add_pres_prtouch:

00000000 <command_add_pres_prtouch>:
       0: 40 f2 00 03  	movw	r3, #0
       4: 70 b5        	push	{r4, r5, r6, lr}
       6: c0 f2 00 03  	movt	r3, #0
       a: 5b 8b        	ldrh	r3, [r3, #26]
       c: 04 00        	movs	r4, r0
       e: 83 b1        	cbz	r3, 0x32 <command_add_pres_prtouch+0x32> @ imm = #32
      10: 43 68        	ldr	r3, [r0, #4]
      12: 00 7a        	ldrb	r0, [r0, #8]
      14: 9d 1d        	adds	r5, r3, #6
      16: 40 f2 00 03  	movw	r3, #0
      1a: c0 f2 00 03  	movt	r3, #0
      1e: 9c 46        	mov	r12, r3
      20: ad 00        	lsls	r5, r5, #2
      22: 65 44        	add	r5, r12
      24: ff f7 fe ff  	bl	0x24 <command_add_pres_prtouch+0x24> @ imm = #-4
      28: 68 60        	str	r0, [r5, #4]
      2a: 20 00        	movs	r0, r4
      2c: ff f7 fe ff  	bl	0x2c <command_add_pres_prtouch+0x2c> @ imm = #-4
      30: 70 bd        	pop	{r4, r5, r6, pc}
      32: 40 f2 00 03  	movw	r3, #0
      36: c0 f2 00 03  	movt	r3, #0
      3a: 9c 46        	mov	r12, r3
      3c: 45 68        	ldr	r5, [r0, #4]
      3e: 00 21        	movs	r1, #0
      40: 0a 35        	adds	r5, #10
      42: 00 7a        	ldrb	r0, [r0, #8]
      44: ad 00        	lsls	r5, r5, #2
      46: 65 44        	add	r5, r12
      48: ff f7 fe ff  	bl	0x48 <command_add_pres_prtouch+0x48> @ imm = #-4
      4c: 40 f2 00 02  	movw	r2, #0
      50: c0 f2 00 02  	movt	r2, #0
      54: 94 46        	mov	r12, r2
      56: 68 60        	str	r0, [r5, #4]
      58: 63 68        	ldr	r3, [r4, #4]
      5a: 00 21        	movs	r1, #0
      5c: 63 44        	add	r3, r12
      5e: 1d 00        	movs	r5, r3
      60: 20 7b        	ldrb	r0, [r4, #12]
      62: ff f7 fe ff  	bl	0x62 <command_add_pres_prtouch+0x62> @ imm = #-4
      66: 3c 35        	adds	r5, #60
      68: 28 70        	strb	r0, [r5]
      6a: de e7        	b	0x2a <command_add_pres_prtouch+0x2a> @ imm = #-68

Disassembly of section .text.command_write_swap_prtouch:

00000000 <command_write_swap_prtouch>:
       0: 40 f2 00 03  	movw	r3, #0
       4: 10 b5        	push	{r4, lr}
       6: 04 00        	movs	r4, r0
       8: c0 f2 00 03  	movt	r3, #0
       c: 01 79        	ldrb	r1, [r0, #4]
       e: 18 68        	ldr	r0, [r3]
      10: ff f7 fe ff  	bl	0x10 <command_write_swap_prtouch+0x10> @ imm = #-4
      14: 20 00        	movs	r0, r4
      16: ff f7 fe ff  	bl	0x16 <command_write_swap_prtouch+0x16> @ imm = #-4
      1a: 40 f2 00 00  	movw	r0, #0
      1e: c0 f2 00 00  	movt	r0, #0
      22: ff f7 fe ff  	bl	0x22 <command_write_swap_prtouch+0x22> @ imm = #-4
      26: 40 f2 00 03  	movw	r3, #0
      2a: c0 f2 00 03  	movt	r3, #0
      2e: 19 88        	ldrh	r1, [r3]
      30: ff f7 fe ff  	bl	0x30 <command_write_swap_prtouch+0x30> @ imm = #-4
      34: 10 bd        	pop	{r4, pc}
      36: c0 46        	mov	r8, r8

Disassembly of section .text.command_read_pres_prtouch:

00000000 <command_read_pres_prtouch>:
       0: f8 b5        	push	{r3, r4, r5, r6, r7, lr}
       2: 83 68        	ldr	r3, [r0, #8]
       4: 05 00        	movs	r5, r0
       6: 00 2b        	cmp	r3, #0
       8: 2c d0        	beq	0x64 <command_read_pres_prtouch+0x64> @ imm = #88
       a: 40 f2 00 06  	movw	r6, #0
       e: c0 f2 00 06  	movt	r6, #0
      12: 32 68        	ldr	r2, [r6]
      14: 12 b3        	cbz	r2, 0x5c <command_read_pres_prtouch+0x5c> @ imm = #68
      16: 77 69        	ldr	r7, [r6, #20]
      18: 36 69        	ldr	r6, [r6, #16]
      1a: 40 f2 00 04  	movw	r4, #0
      1e: 40 f2 dc 22  	movw	r2, #732
      22: 69 68        	ldr	r1, [r5, #4]
      24: c0 f2 00 04  	movt	r4, #0
      28: a1 52        	strh	r1, [r4, r2]
      2a: 04 32        	adds	r2, #4
      2c: a3 52        	strh	r3, [r4, r2]
      2e: 40 f2 de 23  	movw	r3, #734
      32: 00 22        	movs	r2, #0
      34: 30 00        	movs	r0, r6
      36: e2 52        	strh	r2, [r4, r3]
      38: 39 00        	movs	r1, r7
      3a: a2 68        	ldr	r2, [r4, #8]
      3c: e3 68        	ldr	r3, [r4, #12]
      3e: 26 61        	str	r6, [r4, #16]
      40: 67 61        	str	r7, [r4, #20]
      42: ff f7 fe ff  	bl	0x42 <command_read_pres_prtouch+0x42> @ imm = #-4
      46: 00 22        	movs	r2, #0
      48: 00 23        	movs	r3, #0
      4a: ff f7 fe ff  	bl	0x4a <command_read_pres_prtouch+0x4a> @ imm = #-4
      4e: 08 b9        	cbnz	r0, 0x54 <command_read_pres_prtouch+0x54> @ imm = #2
      50: a6 60        	str	r6, [r4, #8]
      52: e7 60        	str	r7, [r4, #12]
      54: 28 00        	movs	r0, r5
      56: ff f7 fe ff  	bl	0x56 <command_read_pres_prtouch+0x56> @ imm = #-4
      5a: f8 bd        	pop	{r3, r4, r5, r6, r7, pc}
      5c: ff f7 fe ff  	bl	0x5c <command_read_pres_prtouch+0x5c> @ imm = #-4
      60: ab 68        	ldr	r3, [r5, #8]
      62: d8 e7        	b	0x16 <command_read_pres_prtouch+0x16> @ imm = #-80
      64: 40 f2 00 02  	movw	r2, #0
      68: 40 f2 e0 21  	movw	r1, #736
      6c: c0 f2 00 02  	movt	r2, #0
      70: 53 52        	strh	r3, [r2, r1]
      72: 40 f2 00 03  	movw	r3, #0
      76: c0 f2 00 03  	movt	r3, #0
      7a: 1b 68        	ldr	r3, [r3]
      7c: 01 2b        	cmp	r3, #1
      7e: ec d1        	bne	0x5a <command_read_pres_prtouch+0x5a> @ imm = #-40
      80: ff f7 fe ff  	bl	0x80 <command_read_pres_prtouch+0x80> @ imm = #-4
      84: e9 e7        	b	0x5a <command_read_pres_prtouch+0x5a> @ imm = #-46
      86: c0 46        	mov	r8, r8

Disassembly of section .text.command_deal_avgs_prtouch:

00000000 <command_deal_avgs_prtouch>:
       0: f0 b5        	push	{r4, r5, r6, r7, lr}
       2: de 46        	mov	lr, r11
       4: 57 46        	mov	r7, r10
       6: 4e 46        	mov	r6, r9
       8: 45 46        	mov	r5, r8
       a: e0 b5        	push	{r5, r6, r7, lr}
       c: 89 b0        	sub	sp, #36
       e: 04 00        	movs	r4, r0
      10: ff f7 fe ff  	bl	0x10 <command_deal_avgs_prtouch+0x10> @ imm = #-4
      14: 40 f2 00 03  	movw	r3, #0
      18: c0 f2 00 03  	movt	r3, #0
      1c: 03 93        	str	r3, [sp, #12]
      1e: 1b 68        	ldr	r3, [r3]
      20: 02 93        	str	r3, [sp, #8]
      22: 0b b9        	cbnz	r3, 0x28 <command_deal_avgs_prtouch+0x28> @ imm = #2
      24: ff f7 fe ff  	bl	0x24 <command_deal_avgs_prtouch+0x24> @ imm = #-4
      28: 6b 4b        	ldr	r3, [pc, #428]          @ 0x1d8 <$d>
      2a: 6c 4d        	ldr	r5, [pc, #432]          @ 0x1dc <$d+0x4>
      2c: 98 46        	mov	r8, r3
      2e: 18 00        	movs	r0, r3
      30: 10 22        	movs	r2, #16
      32: 00 21        	movs	r1, #0
      34: 45 44        	add	r5, r8
      36: ff f7 fe ff  	bl	0x36 <command_deal_avgs_prtouch+0x36> @ imm = #-4
      3a: 6b 8b        	ldrh	r3, [r5, #26]
      3c: 00 2b        	cmp	r3, #0
      3e: 00 d0        	beq	0x42 <command_deal_avgs_prtouch+0x42> @ imm = #0
      40: 9f e0        	b	0x182 <command_deal_avgs_prtouch+0x182> @ imm = #318
      42: 63 68        	ldr	r3, [r4, #4]
      44: 00 2b        	cmp	r3, #0
      46: 00 d1        	bne	0x4a <command_deal_avgs_prtouch+0x4a> @ imm = #0
      48: 9b e0        	b	0x182 <command_deal_avgs_prtouch+0x182> @ imm = #310
      4a: 2a 8b        	ldrh	r2, [r5, #24]
      4c: a2 b1        	cbz	r2, 0x78 <command_deal_avgs_prtouch+0x78> @ imm = #40
      4e: 64 4b        	ldr	r3, [pc, #400]          @ 0x1e0 <$d+0x8>
      50: 00 26        	movs	r6, #0
      52: 43 44        	add	r3, r8
      54: 99 46        	mov	r9, r3
      56: 23 00        	movs	r3, r4
      58: 00 27        	movs	r7, #0
      5a: 4c 46        	mov	r4, r9
      5c: 99 46        	mov	r9, r3
      5e: 20 00        	movs	r0, r4
      60: 80 22        	movs	r2, #128
      62: 00 21        	movs	r1, #0
      64: 80 c0        	stm	r0!, {r7}
      66: ff f7 fe ff  	bl	0x66 <command_deal_avgs_prtouch+0x66> @ imm = #-4
      6a: 2b 8b        	ldrh	r3, [r5, #24]
      6c: 01 36        	adds	r6, #1
      6e: 84 34        	adds	r4, #132
      70: b3 42        	cmp	r3, r6
      72: f4 dc        	bgt	0x5e <command_deal_avgs_prtouch+0x5e> @ imm = #-24
      74: 4c 46        	mov	r4, r9
      76: 63 68        	ldr	r3, [r4, #4]
      78: 20 24        	movs	r4, #32
      7a: 20 2b        	cmp	r3, #32
      7c: 00 dc        	bgt	0x80 <command_deal_avgs_prtouch+0x80> @ imm = #0
      7e: a2 e0        	b	0x1c6 <command_deal_avgs_prtouch+0x1c6> @ imm = #324
      80: 40 f2 00 0a  	movw	r10, #0
      84: a1 46        	mov	r9, r4
      86: d3 46        	mov	r11, r10
      88: 10 22        	movs	r2, #16
      8a: 00 21        	movs	r1, #0
      8c: 04 a8        	add	r0, sp, #16
      8e: ff f7 fe ff  	bl	0x8e <command_deal_avgs_prtouch+0x8e> @ imm = #-4
      92: 04 a8        	add	r0, sp, #16
      94: ff f7 fe ff  	bl	0x94 <command_deal_avgs_prtouch+0x94> @ imm = #-4
      98: 00 28        	cmp	r0, #0
      9a: fa d0        	beq	0x92 <command_deal_avgs_prtouch+0x92> @ imm = #-12
      9c: 2c 8b        	ldrh	r4, [r5, #24]
      9e: 04 b3        	cbz	r4, 0xe2 <command_deal_avgs_prtouch+0xe2> @ imm = #64
      a0: 28 00        	movs	r0, r5
      a2: 00 21        	movs	r1, #0
      a4: 04 af        	add	r7, sp, #16
      a6: c4 30        	adds	r0, #196
      a8: 02 68        	ldr	r2, [r0]
      aa: 1f 26        	movs	r6, #31
      ac: d3 17        	asrs	r3, r2, #31
      ae: db 0e        	lsrs	r3, r3, #27
      b0: 9a 46        	mov	r10, r3
      b2: d3 18        	adds	r3, r2, r3
      b4: 33 40        	ands	r3, r6
      b6: 56 46        	mov	r6, r10
      b8: 9b 1b        	subs	r3, r3, r6
      ba: 40 f2 00 06  	movw	r6, #0
      be: 9a 46        	mov	r10, r3
      c0: c0 f2 00 06  	movt	r6, #0
      c4: b4 46        	mov	r12, r6
      c6: 4b 01        	lsls	r3, r1, #5
      c8: 5b 18        	adds	r3, r3, r1
      ca: 53 44        	add	r3, r10
      cc: 30 33        	adds	r3, #48
      ce: 40 cf        	ldm	r7!, {r6}
      d0: 9b 00        	lsls	r3, r3, #2
      d2: 63 44        	add	r3, r12
      d4: 01 32        	adds	r2, #1
      d6: 01 31        	adds	r1, #1
      d8: 9e 60        	str	r6, [r3, #8]
      da: 02 60        	str	r2, [r0]
      dc: 84 30        	adds	r0, #132
      de: a1 42        	cmp	r1, r4
      e0: e2 db        	blt	0xa8 <command_deal_avgs_prtouch+0xa8> @ imm = #-60
      e2: 40 f2 01 0c  	movw	r12, #1
      e6: e3 44        	add	r11, r12
      e8: d9 45        	cmp	r9, r11
      ea: cd d1        	bne	0x88 <command_deal_avgs_prtouch+0x88> @ imm = #-102
      ec: 23 00        	movs	r3, r4
      ee: 4c 46        	mov	r4, r9
      f0: 99 46        	mov	r9, r3
      f2: 00 2b        	cmp	r3, #0
      f4: 45 d0        	beq	0x182 <command_deal_avgs_prtouch+0x182> @ imm = #138
      f6: a3 00        	lsls	r3, r4, #2
      f8: 9c 46        	mov	r12, r3
      fa: 4b 46        	mov	r3, r9
      fc: 5b 01        	lsls	r3, r3, #5
      fe: 4b 44        	add	r3, r9
     100: 02 93        	str	r3, [sp, #8]
     102: 63 46        	mov	r3, r12
     104: 2e 00        	movs	r6, r5
     106: 5b 42        	rsbs	r3, r3, #0
     108: 9b 46        	mov	r11, r3
     10a: 40 f2 00 0a  	movw	r10, #0
     10e: 62 46        	mov	r2, r12
     110: c8 36        	adds	r6, #200
     112: 66 44        	add	r6, r12
     114: 5b 46        	mov	r3, r11
     116: 00 27        	movs	r7, #0
     118: 94 46        	mov	r12, r2
     11a: f0 18        	adds	r0, r6, r3
     11c: 03 00        	movs	r3, r0
     11e: bc 42        	cmp	r4, r7
     120: 08 dd        	ble	0x134 <command_deal_avgs_prtouch+0x134> @ imm = #16
     122: 02 68        	ldr	r2, [r0]
     124: 19 68        	ldr	r1, [r3]
     126: 8a 42        	cmp	r2, r1
     128: 01 d9        	bls	0x12e <command_deal_avgs_prtouch+0x12e> @ imm = #2
     12a: 01 60        	str	r1, [r0]
     12c: 1a 60        	str	r2, [r3]
     12e: 04 33        	adds	r3, #4
     130: b3 42        	cmp	r3, r6
     132: f6 d1        	bne	0x122 <command_deal_avgs_prtouch+0x122> @ imm = #-20
     134: 01 37        	adds	r7, #1
     136: 04 30        	adds	r0, #4
     138: bc 42        	cmp	r4, r7
     13a: ef d1        	bne	0x11c <command_deal_avgs_prtouch+0x11c> @ imm = #-34
     13c: 62 46        	mov	r2, r12
     13e: 40 f2 21 0c  	movw	r12, #33
     142: 02 9b        	ldr	r3, [sp, #8]
     144: e2 44        	add	r10, r12
     146: 84 36        	adds	r6, #132
     148: 9a 45        	cmp	r10, r3
     14a: e3 d1        	bne	0x114 <command_deal_avgs_prtouch+0x114> @ imm = #-58
     14c: 4b 46        	mov	r3, r9
     14e: 28 00        	movs	r0, r5
     150: 9b 00        	lsls	r3, r3, #2
     152: 94 46        	mov	r12, r2
     154: 99 46        	mov	r9, r3
     156: c0 30        	adds	r0, #192
     158: 60 44        	add	r0, r12
     15a: c1 44        	add	r9, r8
     15c: 40 f2 10 0c  	movw	r12, #16
     160: 46 46        	mov	r6, r8
     162: 4f 46        	mov	r7, r9
     164: 04 3c        	subs	r4, #4
     166: e3 44        	add	r11, r12
     168: 5b 46        	mov	r3, r11
     16a: 32 68        	ldr	r2, [r6]
     16c: 1b 18        	adds	r3, r3, r0
     16e: 02 cb        	ldm	r3!, {r1}
     170: 52 18        	adds	r2, r2, r1
     172: 83 42        	cmp	r3, r0
     174: fb d1        	bne	0x16e <command_deal_avgs_prtouch+0x16e> @ imm = #-10
     176: 92 fb f4 f2  	sdiv	r2, r2, r4
     17a: 04 c6        	stm	r6!, {r2}
     17c: 84 30        	adds	r0, #132
     17e: be 42        	cmp	r6, r7
     180: f2 d1        	bne	0x168 <command_deal_avgs_prtouch+0x168> @ imm = #-28
     182: 03 9b        	ldr	r3, [sp, #12]
     184: 1b 68        	ldr	r3, [r3]
     186: 01 2b        	cmp	r3, #1
     188: 23 d0        	beq	0x1d2 <command_deal_avgs_prtouch+0x1d2> @ imm = #70
     18a: 40 f2 00 00  	movw	r0, #0
     18e: 40 f2 18 34  	movw	r4, #792
     192: c0 f2 00 00  	movt	r0, #0
     196: ff f7 fe ff  	bl	0x196 <command_deal_avgs_prtouch+0x196> @ imm = #-4
     19a: 40 f2 10 33  	movw	r3, #784
     19e: 40 f2 0c 32  	movw	r2, #780
     1a2: 2c 59        	ldr	r4, [r5, r4]
     1a4: eb 58        	ldr	r3, [r5, r3]
     1a6: aa 58        	ldr	r2, [r5, r2]
     1a8: 29 88        	ldrh	r1, [r5]
     1aa: 01 94        	str	r4, [sp, #4]
     1ac: 40 f2 14 34  	movw	r4, #788
     1b0: 2c 59        	ldr	r4, [r5, r4]
     1b2: 00 94        	str	r4, [sp]
     1b4: ff f7 fe ff  	bl	0x1b4 <command_deal_avgs_prtouch+0x1b4> @ imm = #-4
     1b8: 09 b0        	add	sp, #36
     1ba: 3c bc        	pop	{r2, r3, r4, r5}
     1bc: 90 46        	mov	r8, r2
     1be: 99 46        	mov	r9, r3
     1c0: a2 46        	mov	r10, r4
     1c2: ab 46        	mov	r11, r5
     1c4: f0 bd        	pop	{r4, r5, r6, r7, pc}
     1c6: 1c 00        	movs	r4, r3
     1c8: 08 2b        	cmp	r3, #8
     1ca: 00 db        	blt	0x1ce <command_deal_avgs_prtouch+0x1ce> @ imm = #0
     1cc: 58 e7        	b	0x80 <command_deal_avgs_prtouch+0x80> @ imm = #-336
     1ce: 08 24        	movs	r4, #8
     1d0: 56 e7        	b	0x80 <command_deal_avgs_prtouch+0x80> @ imm = #-340
     1d2: ff f7 fe ff  	bl	0x1d2 <command_deal_avgs_prtouch+0x1d2> @ imm = #-4
     1d6: d8 e7        	b	0x18a <command_deal_avgs_prtouch+0x18a> @ imm = #-80

000001d8 <$d>:
     1d8:	0c 03 00 00	.word	0x0000030c
     1dc:	f4 fc ff ff	.word	0xfffffcf4
     1e0:	b8 fd ff ff	.word	0xfffffdb8

Disassembly of section .text.command_start_pres_prtouch:

00000000 <command_start_pres_prtouch>:
       0: f0 b5        	push	{r4, r5, r6, r7, lr}
       2: c6 46        	mov	lr, r8
       4: 00 b5        	push	{lr}
       6: 06 00        	movs	r6, r0
       8: ff f7 fe ff  	bl	0x8 <command_start_pres_prtouch+0x8> @ imm = #-4
       c: 40 f2 00 03  	movw	r3, #0
      10: c0 f2 00 03  	movt	r3, #0
      14: 18 68        	ldr	r0, [r3]
      16: 00 21        	movs	r1, #0
      18: ff f7 fe ff  	bl	0x18 <command_start_pres_prtouch+0x18> @ imm = #-4
      1c: 33 69        	ldr	r3, [r6, #16]
      1e: 00 2b        	cmp	r3, #0
      20: 00 d1        	bne	0x24 <command_start_pres_prtouch+0x24> @ imm = #0
      22: 79 e0        	b	0x118 <command_start_pres_prtouch+0x118> @ imm = #242
      24: 40 f2 00 07  	movw	r7, #0
      28: c0 f2 00 07  	movt	r7, #0
      2c: 3b 68        	ldr	r3, [r7]
      2e: 00 2b        	cmp	r3, #0
      30: 00 d1        	bne	0x34 <command_start_pres_prtouch+0x34> @ imm = #0
      32: 6e e0        	b	0x112 <command_start_pres_prtouch+0x112> @ imm = #220
      34: 40 f2 00 05  	movw	r5, #0
      38: 73 68        	ldr	r3, [r6, #4]
      3a: c0 f2 00 05  	movt	r5, #0
      3e: 5a 42        	rsbs	r2, r3, #0
      40: 53 41        	adcs	r3, r2
      42: 2c 00        	movs	r4, r5
      44: 1e 22        	movs	r2, #30
      46: 5b 42        	rsbs	r3, r3, #0
      48: 93 43        	bics	r3, r2
      4a: 44 34        	adds	r4, #68
      4c: 1f 33        	adds	r3, #31
      4e: 00 21        	movs	r1, #0
      50: 62 32        	adds	r2, #98
      52: 20 00        	movs	r0, r4
      54: 2b 64        	str	r3, [r5, #64]
      56: ff f7 fe ff  	bl	0x56 <command_start_pres_prtouch+0x56> @ imm = #-4
      5a: 38 69        	ldr	r0, [r7, #16]
      5c: 79 69        	ldr	r1, [r7, #20]
      5e: 48 f6 00 03  	movw	r3, #34816
      62: 00 22        	movs	r2, #0
      64: c4 f2 c3 03  	movt	r3, #16579
      68: ff f7 fe ff  	bl	0x68 <command_start_pres_prtouch+0x68> @ imm = #-4
      6c: ff f7 fe ff  	bl	0x6c <command_start_pres_prtouch+0x6c> @ imm = #-4
      70: 2a 00        	movs	r2, r5
      72: c4 32        	adds	r2, #196
      74: 01 c4        	stm	r4!, {r0}
      76: a2 42        	cmp	r2, r4
      78: fc d1        	bne	0x74 <command_start_pres_prtouch+0x74> @ imm = #-8
      7a: 2b 8b        	ldrh	r3, [r5, #24]
      7c: b3 b1        	cbz	r3, 0xac <command_start_pres_prtouch+0xac> @ imm = #44
      7e: 2f 00        	movs	r7, r5
      80: 00 24        	movs	r4, #0
      82: 40 f2 1e 08  	movw	r8, #30
      86: c4 37        	adds	r7, #196
      88: 73 68        	ldr	r3, [r6, #4]
      8a: 38 00        	movs	r0, r7
      8c: 5a 42        	rsbs	r2, r3, #0
      8e: 53 41        	adcs	r3, r2
      90: 42 46        	mov	r2, r8
      92: 5b 42        	rsbs	r3, r3, #0
      94: 93 43        	bics	r3, r2
      96: 1f 33        	adds	r3, #31
      98: 08 c0        	stm	r0!, {r3}
      9a: 80 22        	movs	r2, #128
      9c: 00 21        	movs	r1, #0
      9e: ff f7 fe ff  	bl	0x9e <command_start_pres_prtouch+0x9e> @ imm = #-4
      a2: 2b 8b        	ldrh	r3, [r5, #24]
      a4: 01 34        	adds	r4, #1
      a6: 84 37        	adds	r7, #132
      a8: 9c 42        	cmp	r4, r3
      aa: ed db        	blt	0x88 <command_start_pres_prtouch+0x88> @ imm = #-38
      ac: 40 f2 e4 23  	movw	r3, #740
      b0: 72 68        	ldr	r2, [r6, #4]
      b2: 70 69        	ldr	r0, [r6, #20]
      b4: ea 52        	strh	r2, [r5, r3]
      b6: f2 68        	ldr	r2, [r6, #12]
      b8: 08 33        	adds	r3, #8
      ba: ea 52        	strh	r2, [r5, r3]
      bc: 32 69        	ldr	r2, [r6, #16]
      be: 0c 33        	adds	r3, #12
      c0: ea 52        	strh	r2, [r5, r3]
      c2: ff f7 fe ff  	bl	0xc2 <command_start_pres_prtouch+0xc2> @ imm = #-4
      c6: 00 21        	movs	r1, #0
      c8: c4 f2 7a 41  	movt	r1, #17530
      cc: ff f7 fe ff  	bl	0xcc <command_start_pres_prtouch+0xcc> @ imm = #-4
      d0: 40 f2 f0 23  	movw	r3, #752
      d4: e8 50        	str	r0, [r5, r3]
      d6: b0 69        	ldr	r0, [r6, #24]
      d8: ff f7 fe ff  	bl	0xd8 <command_start_pres_prtouch+0xd8> @ imm = #-4
      dc: 00 21        	movs	r1, #0
      de: c4 f2 7a 41  	movt	r1, #17530
      e2: ff f7 fe ff  	bl	0xe2 <command_start_pres_prtouch+0xe2> @ imm = #-4
      e6: 40 f2 f4 23  	movw	r3, #756
      ea: f2 69        	ldr	r2, [r6, #28]
      ec: e8 50        	str	r0, [r5, r3]
      ee: 08 33        	adds	r3, #8
      f0: ea 50        	str	r2, [r5, r3]
      f2: 32 6a        	ldr	r2, [r6, #32]
      f4: 04 33        	adds	r3, #4
      f6: ea 50        	str	r2, [r5, r3]
      f8: 00 23        	movs	r3, #0
      fa: 40 f2 d8 22  	movw	r2, #728
      fe: ab 50        	str	r3, [r5, r2]
     100: 04 3a        	subs	r2, #4
     102: ab 50        	str	r3, [r5, r2]
     104: 40 f2 ee 23  	movw	r3, #750
     108: b2 68        	ldr	r2, [r6, #8]
     10a: ea 52        	strh	r2, [r5, r3]
     10c: 04 bc        	pop	{r2}
     10e: 90 46        	mov	r8, r2
     110: f0 bd        	pop	{r4, r5, r6, r7, pc}
     112: ff f7 fe ff  	bl	0x112 <command_start_pres_prtouch+0x112> @ imm = #-4
     116: 8d e7        	b	0x34 <command_start_pres_prtouch+0x34> @ imm = #-230
     118: 40 f2 00 02  	movw	r2, #0
     11c: 40 f2 ee 21  	movw	r1, #750
     120: c0 f2 00 02  	movt	r2, #0
     124: 53 52        	strh	r3, [r2, r1]
     126: 40 f2 00 03  	movw	r3, #0
     12a: c0 f2 00 03  	movt	r3, #0
     12e: 1b 68        	ldr	r3, [r3]
     130: 01 2b        	cmp	r3, #1
     132: eb d1        	bne	0x10c <command_start_pres_prtouch+0x10c> @ imm = #-42
     134: ff f7 fe ff  	bl	0x134 <command_start_pres_prtouch+0x134> @ imm = #-4
     138: e8 e7        	b	0x10c <command_start_pres_prtouch+0x10c> @ imm = #-48
     13a: c0 46        	mov	r8, r8

Disassembly of section .text.command_manual_get_pres:

00000000 <command_manual_get_pres>:
       0: 70 b5        	push	{r4, r5, r6, lr}
       2: 44 68        	ldr	r4, [r0, #4]
       4: 40 f2 00 00  	movw	r0, #0
       8: 8c b0        	sub	sp, #48
       a: c0 f2 00 00  	movt	r0, #0
       e: ff f7 fe ff  	bl	0xe <command_manual_get_pres+0xe> @ imm = #-4
      12: 40 f2 00 02  	movw	r2, #0
      16: 25 00        	movs	r5, r4
      18: c0 f2 00 02  	movt	r2, #0
      1c: 94 46        	mov	r12, r2
      1e: 40 f2 d8 23  	movw	r3, #728
      22: 94 35        	adds	r5, #148
      24: ad 00        	lsls	r5, r5, #2
      26: 65 44        	add	r5, r12
      28: ad 68        	ldr	r5, [r5, #8]
      2a: d3 58        	ldr	r3, [r2, r3]
      2c: 11 78        	ldrb	r1, [r2]
      2e: 0b 95        	str	r5, [sp, #44]
      30: 25 00        	movs	r5, r4
      32: 73 35        	adds	r5, #115
      34: ad 00        	lsls	r5, r5, #2
      36: 65 44        	add	r5, r12
      38: ad 68        	ldr	r5, [r5, #8]
      3a: 0a 95        	str	r5, [sp, #40]
      3c: 25 00        	movs	r5, r4
      3e: 52 35        	adds	r5, #82
      40: ad 00        	lsls	r5, r5, #2
      42: 65 44        	add	r5, r12
      44: ad 68        	ldr	r5, [r5, #8]
      46: 09 95        	str	r5, [sp, #36]
      48: 25 00        	movs	r5, r4
      4a: 31 35        	adds	r5, #49
      4c: ad 00        	lsls	r5, r5, #2
      4e: 65 44        	add	r5, r12
      50: ad 68        	ldr	r5, [r5, #8]
      52: 08 95        	str	r5, [sp, #32]
      54: 25 00        	movs	r5, r4
      56: 11 35        	adds	r5, #17
      58: ad 00        	lsls	r5, r5, #2
      5a: 65 44        	add	r5, r12
      5c: 6d 68        	ldr	r5, [r5, #4]
      5e: 07 95        	str	r5, [sp, #28]
      60: 25 00        	movs	r5, r4
      62: 93 35        	adds	r5, #147
      64: ad 00        	lsls	r5, r5, #2
      66: 65 44        	add	r5, r12
      68: ad 68        	ldr	r5, [r5, #8]
      6a: 06 95        	str	r5, [sp, #24]
      6c: 25 00        	movs	r5, r4
      6e: 72 35        	adds	r5, #114
      70: ad 00        	lsls	r5, r5, #2
      72: 65 44        	add	r5, r12
      74: ad 68        	ldr	r5, [r5, #8]
      76: 05 95        	str	r5, [sp, #20]
      78: 25 00        	movs	r5, r4
      7a: 51 35        	adds	r5, #81
      7c: ad 00        	lsls	r5, r5, #2
      7e: 65 44        	add	r5, r12
      80: ad 68        	ldr	r5, [r5, #8]
      82: 04 95        	str	r5, [sp, #16]
      84: 25 00        	movs	r5, r4
      86: 30 35        	adds	r5, #48
      88: ad 00        	lsls	r5, r5, #2
      8a: 65 44        	add	r5, r12
      8c: ad 68        	ldr	r5, [r5, #8]
      8e: 03 95        	str	r5, [sp, #12]
      90: 25 00        	movs	r5, r4
      92: 10 35        	adds	r5, #16
      94: ad 00        	lsls	r5, r5, #2
      96: 65 44        	add	r5, r12
      98: 6d 68        	ldr	r5, [r5, #4]
      9a: 02 95        	str	r5, [sp, #8]
      9c: 40 f2 04 35  	movw	r5, #772
      a0: 55 59        	ldr	r5, [r2, r5]
      a2: 01 95        	str	r5, [sp, #4]
      a4: 40 f2 e2 25  	movw	r5, #738
      a8: 52 5d        	ldrb	r2, [r2, r5]
      aa: 00 92        	str	r2, [sp]
      ac: 22 00        	movs	r2, r4
      ae: ff f7 fe ff  	bl	0xae <command_manual_get_pres+0xae> @ imm = #-4
      b2: 0c b0        	add	sp, #48
      b4: 70 bd        	pop	{r4, r5, r6, pc}
      b6: c0 46        	mov	r8, r8

Disassembly of section .text.prtouch_pres_task:

00000000 <prtouch_pres_task>:
       0: f0 b5        	push	{r4, r5, r6, r7, lr}
       2: de 46        	mov	lr, r11
       4: 4e 46        	mov	r6, r9
       6: 45 46        	mov	r5, r8
       8: 57 46        	mov	r7, r10
       a: 40 f2 00 08  	movw	r8, #0
       e: e0 b5        	push	{r5, r6, r7, lr}
      10: 93 b0        	sub	sp, #76
      12: 10 22        	movs	r2, #16
      14: 00 21        	movs	r1, #0
      16: 0e a8        	add	r0, sp, #56
      18: c0 f2 00 08  	movt	r8, #0
      1c: ff f7 fe ff  	bl	0x1c <prtouch_pres_task+0x1c> @ imm = #-4
      20: 40 f2 ee 23  	movw	r3, #750
      24: 42 46        	mov	r2, r8
      26: d3 5a        	ldrh	r3, [r2, r3]
      28: 99 46        	mov	r9, r3
      2a: 00 2b        	cmp	r3, #0
      2c: 00 d1        	bne	0x30 <prtouch_pres_task+0x30> @ imm = #0
      2e: b5 e0        	b	0x19c <prtouch_pres_task+0x19c> @ imm = #362
      30: 53 8b        	ldrh	r3, [r2, #26]
      32: 2b b3        	cbz	r3, 0x80 <prtouch_pres_task+0x80> @ imm = #74
      34: 40 f2 00 03  	movw	r3, #0
      38: c0 f2 00 03  	movt	r3, #0
      3c: 1c 69        	ldr	r4, [r3, #16]
      3e: 5d 69        	ldr	r5, [r3, #20]
      40: 14 61        	str	r4, [r2, #16]
      42: 55 61        	str	r5, [r2, #20]
      44: d3 68        	ldr	r3, [r2, #12]
      46: 92 68        	ldr	r2, [r2, #8]
      48: 20 00        	movs	r0, r4
      4a: 29 00        	movs	r1, r5
      4c: ff f7 fe ff  	bl	0x4c <prtouch_pres_task+0x4c> @ imm = #-4
      50: 06 00        	movs	r6, r0
      52: 48 46        	mov	r0, r9
      54: 0f 00        	movs	r7, r1
      56: ff f7 fe ff  	bl	0x56 <prtouch_pres_task+0x56> @ imm = #-4
      5a: 00 21        	movs	r1, #0
      5c: c4 f2 7a 41  	movt	r1, #17530
      60: ff f7 fe ff  	bl	0x60 <prtouch_pres_task+0x60> @ imm = #-4
      64: ff f7 fe ff  	bl	0x64 <prtouch_pres_task+0x64> @ imm = #-4
      68: 02 00        	movs	r2, r0
      6a: 0b 00        	movs	r3, r1
      6c: 30 00        	movs	r0, r6
      6e: 39 00        	movs	r1, r7
      70: ff f7 fe ff  	bl	0x70 <prtouch_pres_task+0x70> @ imm = #-4
      74: 00 28        	cmp	r0, #0
      76: 00 d0        	beq	0x7a <prtouch_pres_task+0x7a> @ imm = #0
      78: 91 e1        	b	0x39e <prtouch_pres_task+0x39e> @ imm = #802
      7a: 43 46        	mov	r3, r8
      7c: 9c 60        	str	r4, [r3, #8]
      7e: dd 60        	str	r5, [r3, #12]
      80: 0e a8        	add	r0, sp, #56
      82: ff f7 fe ff  	bl	0x82 <prtouch_pres_task+0x82> @ imm = #-4
      86: 00 28        	cmp	r0, #0
      88: 00 d1        	bne	0x8c <prtouch_pres_task+0x8c> @ imm = #0
      8a: 88 e1        	b	0x39e <prtouch_pres_task+0x39e> @ imm = #784
      8c: 43 46        	mov	r3, r8
      8e: 1f 25        	movs	r5, #31
      90: 1e 6c        	ldr	r6, [r3, #64]
      92: 40 f2 00 04  	movw	r4, #0
      96: f3 17        	asrs	r3, r6, #31
      98: db 0e        	lsrs	r3, r3, #27
      9a: f2 18        	adds	r2, r6, r3
      9c: 15 40        	ands	r5, r2
      9e: ed 1a        	subs	r5, r5, r3
      a0: 40 f2 00 03  	movw	r3, #0
      a4: c0 f2 00 03  	movt	r3, #0
      a8: 9c 46        	mov	r12, r3
      aa: 48 f6 00 03  	movw	r3, #34816
      ae: c0 f2 00 04  	movt	r4, #0
      b2: c4 f2 c3 03  	movt	r3, #16579
      b6: 00 22        	movs	r2, #0
      b8: 20 69        	ldr	r0, [r4, #16]
      ba: 61 69        	ldr	r1, [r4, #20]
      bc: ad 00        	lsls	r5, r5, #2
      be: 65 44        	add	r5, r12
      c0: ff f7 fe ff  	bl	0xc0 <prtouch_pres_task+0xc0> @ imm = #-4
      c4: ff f7 fe ff  	bl	0xc4 <prtouch_pres_task+0xc4> @ imm = #-4
      c8: 43 46        	mov	r3, r8
      ca: 68 64        	str	r0, [r5, #68]
      cc: 01 36        	adds	r6, #1
      ce: 1e 64        	str	r6, [r3, #64]
      d0: 1e 8b        	ldrh	r6, [r3, #24]
      d2: 1e b3        	cbz	r6, 0x11c <prtouch_pres_task+0x11c> @ imm = #70
      d4: 45 46        	mov	r5, r8
      d6: 0e a9        	add	r1, sp, #56
      d8: 8a 46        	mov	r10, r1
      da: 00 20        	movs	r0, #0
      dc: 40 f2 1f 09  	movw	r9, #31
      e0: c4 35        	adds	r5, #196
      e2: 49 46        	mov	r1, r9
      e4: 2a 68        	ldr	r2, [r5]
      e6: d7 17        	asrs	r7, r2, #31
      e8: ff 0e        	lsrs	r7, r7, #27
      ea: d3 19        	adds	r3, r2, r7
      ec: 0b 40        	ands	r3, r1
      ee: db 1b        	subs	r3, r3, r7
      f0: 40 f2 00 01  	movw	r1, #0
      f4: 9c 46        	mov	r12, r3
      f6: 43 01        	lsls	r3, r0, #5
      f8: 57 46        	mov	r7, r10
      fa: 1b 18        	adds	r3, r3, r0
      fc: c0 f2 00 01  	movt	r1, #0
     100: 63 44        	add	r3, r12
     102: 8c 46        	mov	r12, r1
     104: 30 33        	adds	r3, #48
     106: 02 cf        	ldm	r7!, {r1}
     108: 9b 00        	lsls	r3, r3, #2
     10a: 63 44        	add	r3, r12
     10c: 01 32        	adds	r2, #1
     10e: 01 30        	adds	r0, #1
     110: 99 60        	str	r1, [r3, #8]
     112: ba 46        	mov	r10, r7
     114: 2a 60        	str	r2, [r5]
     116: 84 35        	adds	r5, #132
     118: b0 42        	cmp	r0, r6
     11a: e2 db        	blt	0xe2 <prtouch_pres_task+0xe2> @ imm = #-60
     11c: ff f7 fe ff  	bl	0x11c <prtouch_pres_task+0x11c> @ imm = #-4
     120: 40 f2 f8 23  	movw	r3, #760
     124: 42 46        	mov	r2, r8
     126: d3 5a        	ldrh	r3, [r2, r3]
     128: 83 42        	cmp	r3, r0
     12a: 00 dd        	ble	0x12e <prtouch_pres_task+0x12e> @ imm = #0
     12c: 37 e1        	b	0x39e <prtouch_pres_task+0x39e> @ imm = #622
     12e: 40 f2 e2 23  	movw	r3, #738
     132: d3 5a        	ldrh	r3, [r2, r3]
     134: 00 2b        	cmp	r3, #0
     136: 00 d1        	bne	0x13a <prtouch_pres_task+0x13a> @ imm = #0
     138: 31 e1        	b	0x39e <prtouch_pres_task+0x39e> @ imm = #610
     13a: 40 f2 ee 23  	movw	r3, #750
     13e: 00 22        	movs	r2, #0
     140: 41 46        	mov	r1, r8
     142: ca 52        	strh	r2, [r1, r3]
     144: 48 f6 00 03  	movw	r3, #34816
     148: 20 69        	ldr	r0, [r4, #16]
     14a: 61 69        	ldr	r1, [r4, #20]
     14c: 00 22        	movs	r2, #0
     14e: c4 f2 c3 03  	movt	r3, #16579
     152: ff f7 fe ff  	bl	0x152 <prtouch_pres_task+0x152> @ imm = #-4
     156: ff f7 fe ff  	bl	0x156 <prtouch_pres_task+0x156> @ imm = #-4
     15a: 40 f2 d8 23  	movw	r3, #728
     15e: 42 46        	mov	r2, r8
     160: d0 50        	str	r0, [r2, r3]
     162: 40 f2 00 03  	movw	r3, #0
     166: c0 f2 00 03  	movt	r3, #0
     16a: 18 68        	ldr	r0, [r3]
     16c: 01 21        	movs	r1, #1
     16e: ff f7 fe ff  	bl	0x16e <prtouch_pres_task+0x16e> @ imm = #-4
     172: 43 46        	mov	r3, r8
     174: 1b 8b        	ldrh	r3, [r3, #24]
     176: 00 25        	movs	r5, #0
     178: 43 b1        	cbz	r3, 0x18c <prtouch_pres_task+0x18c> @ imm = #16
     17a: 28 00        	movs	r0, r5
     17c: 01 21        	movs	r1, #1
     17e: ff f7 fe ff  	bl	0x17e <prtouch_pres_task+0x17e> @ imm = #-4
     182: 43 46        	mov	r3, r8
     184: 1b 8b        	ldrh	r3, [r3, #24]
     186: 01 35        	adds	r5, #1
     188: ab 42        	cmp	r3, r5
     18a: f6 dc        	bgt	0x17a <prtouch_pres_task+0x17a> @ imm = #-20
     18c: 40 f2 d4 23  	movw	r3, #724
     190: 10 22        	movs	r2, #16
     192: 41 46        	mov	r1, r8
     194: 40 f2 10 09  	movw	r9, #16
     198: ca 50        	str	r2, [r1, r3]
     19a: 74 e0        	b	0x286 <prtouch_pres_task+0x286> @ imm = #232
     19c: 40 f2 e0 23  	movw	r3, #736
     1a0: d3 5a        	ldrh	r3, [r2, r3]
     1a2: 00 2b        	cmp	r3, #0
     1a4: 63 d0        	beq	0x26e <prtouch_pres_task+0x26e> @ imm = #198
     1a6: 53 8b        	ldrh	r3, [r2, #26]
     1a8: 53 b3        	cbz	r3, 0x200 <prtouch_pres_task+0x200> @ imm = #84
     1aa: 40 f2 dc 23  	movw	r3, #732
     1ae: d0 5a        	ldrh	r0, [r2, r3]
     1b0: ff f7 fe ff  	bl	0x1b0 <prtouch_pres_task+0x1b0> @ imm = #-4
     1b4: 00 21        	movs	r1, #0
     1b6: c4 f2 7a 41  	movt	r1, #17530
     1ba: ff f7 fe ff  	bl	0x1ba <prtouch_pres_task+0x1ba> @ imm = #-4
     1be: 40 f2 00 03  	movw	r3, #0
     1c2: c0 f2 00 03  	movt	r3, #0
     1c6: 1c 69        	ldr	r4, [r3, #16]
     1c8: 5d 69        	ldr	r5, [r3, #20]
     1ca: 43 46        	mov	r3, r8
     1cc: 81 46        	mov	r9, r0
     1ce: 1c 61        	str	r4, [r3, #16]
     1d0: 5d 61        	str	r5, [r3, #20]
     1d2: 9a 68        	ldr	r2, [r3, #8]
     1d4: db 68        	ldr	r3, [r3, #12]
     1d6: 20 00        	movs	r0, r4
     1d8: 29 00        	movs	r1, r5
     1da: ff f7 fe ff  	bl	0x1da <prtouch_pres_task+0x1da> @ imm = #-4
     1de: 06 00        	movs	r6, r0
     1e0: 48 46        	mov	r0, r9
     1e2: 0f 00        	movs	r7, r1
     1e4: ff f7 fe ff  	bl	0x1e4 <prtouch_pres_task+0x1e4> @ imm = #-4
     1e8: 02 00        	movs	r2, r0
     1ea: 0b 00        	movs	r3, r1
     1ec: 30 00        	movs	r0, r6
     1ee: 39 00        	movs	r1, r7
     1f0: ff f7 fe ff  	bl	0x1f0 <prtouch_pres_task+0x1f0> @ imm = #-4
     1f4: 00 28        	cmp	r0, #0
     1f6: 00 d0        	beq	0x1fa <prtouch_pres_task+0x1fa> @ imm = #0
     1f8: d1 e0        	b	0x39e <prtouch_pres_task+0x39e> @ imm = #418
     1fa: 43 46        	mov	r3, r8
     1fc: 9c 60        	str	r4, [r3, #8]
     1fe: dd 60        	str	r5, [r3, #12]
     200: 0e a8        	add	r0, sp, #56
     202: ff f7 fe ff  	bl	0x202 <prtouch_pres_task+0x202> @ imm = #-4
     206: 00 28        	cmp	r0, #0
     208: 00 d1        	bne	0x20c <prtouch_pres_task+0x20c> @ imm = #0
     20a: c8 e0        	b	0x39e <prtouch_pres_task+0x39e> @ imm = #400
     20c: 40 f2 00 00  	movw	r0, #0
     210: 40 f2 00 04  	movw	r4, #0
     214: c0 f2 00 00  	movt	r0, #0
     218: ff f7 fe ff  	bl	0x218 <prtouch_pres_task+0x218> @ imm = #-4
     21c: 48 f6 00 03  	movw	r3, #34816
     220: c0 f2 00 04  	movt	r4, #0
     224: 00 22        	movs	r2, #0
     226: c4 f2 c3 03  	movt	r3, #16579
     22a: 05 00        	movs	r5, r0
     22c: 20 69        	ldr	r0, [r4, #16]
     22e: 61 69        	ldr	r1, [r4, #20]
     230: ff f7 fe ff  	bl	0x230 <prtouch_pres_task+0x230> @ imm = #-4
     234: ff f7 fe ff  	bl	0x234 <prtouch_pres_task+0x234> @ imm = #-4
     238: 43 46        	mov	r3, r8
     23a: 19 88        	ldrh	r1, [r3]
     23c: 11 9b        	ldr	r3, [sp, #68]
     23e: 02 00        	movs	r2, r0
     240: 02 93        	str	r3, [sp, #8]
     242: 10 9b        	ldr	r3, [sp, #64]
     244: 28 00        	movs	r0, r5
     246: 0d 93        	str	r3, [sp, #52]
     248: 01 93        	str	r3, [sp, #4]
     24a: 0f 9b        	ldr	r3, [sp, #60]
     24c: 00 93        	str	r3, [sp]
     24e: 0e 9b        	ldr	r3, [sp, #56]
     250: ff f7 fe ff  	bl	0x250 <prtouch_pres_task+0x250> @ imm = #-4
     254: 40 f2 de 22  	movw	r2, #734
     258: 43 46        	mov	r3, r8
     25a: 41 46        	mov	r1, r8
     25c: 9b 5a        	ldrh	r3, [r3, r2]
     25e: 01 33        	adds	r3, #1
     260: 9b b2        	uxth	r3, r3
     262: 8b 52        	strh	r3, [r1, r2]
     264: 02 32        	adds	r2, #2
     266: 89 5a        	ldrh	r1, [r1, r2]
     268: 99 42        	cmp	r1, r3
     26a: 00 d1        	bne	0x26e <prtouch_pres_task+0x26e> @ imm = #0
     26c: 9e e0        	b	0x3ac <prtouch_pres_task+0x3ac> @ imm = #316
     26e: 40 f2 d4 23  	movw	r3, #724
     272: 42 46        	mov	r2, r8
     274: d3 58        	ldr	r3, [r2, r3]
     276: 99 46        	mov	r9, r3
     278: 00 2b        	cmp	r3, #0
     27a: 00 d1        	bne	0x27e <prtouch_pres_task+0x27e> @ imm = #0
     27c: 8f e0        	b	0x39e <prtouch_pres_task+0x39e> @ imm = #286
     27e: 40 f2 00 04  	movw	r4, #0
     282: c0 f2 00 04  	movt	r4, #0
     286: 40 f2 ec 23  	movw	r3, #748
     28a: 42 46        	mov	r2, r8
     28c: d0 5a        	ldrh	r0, [r2, r3]
     28e: ff f7 fe ff  	bl	0x28e <prtouch_pres_task+0x28e> @ imm = #-4
     292: 40 f2 00 0b  	movw	r11, #0
     296: 00 21        	movs	r1, #0
     298: c0 f2 00 0b  	movt	r11, #0
     29c: c4 f2 7a 41  	movt	r1, #17530
     2a0: ff f7 fe ff  	bl	0x2a0 <prtouch_pres_task+0x2a0> @ imm = #-4
     2a4: 65 69        	ldr	r5, [r4, #20]
     2a6: 24 69        	ldr	r4, [r4, #16]
     2a8: 5b 46        	mov	r3, r11
     2aa: 82 46        	mov	r10, r0
     2ac: 9c 60        	str	r4, [r3, #8]
     2ae: dd 60        	str	r5, [r3, #12]
     2b0: 1a 68        	ldr	r2, [r3]
     2b2: 5b 68        	ldr	r3, [r3, #4]
     2b4: 20 00        	movs	r0, r4
     2b6: 29 00        	movs	r1, r5
     2b8: ff f7 fe ff  	bl	0x2b8 <prtouch_pres_task+0x2b8> @ imm = #-4
     2bc: 06 00        	movs	r6, r0
     2be: 50 46        	mov	r0, r10
     2c0: 0f 00        	movs	r7, r1
     2c2: ff f7 fe ff  	bl	0x2c2 <prtouch_pres_task+0x2c2> @ imm = #-4
     2c6: 02 00        	movs	r2, r0
     2c8: 0b 00        	movs	r3, r1
     2ca: 30 00        	movs	r0, r6
     2cc: 39 00        	movs	r1, r7
     2ce: ff f7 fe ff  	bl	0x2ce <prtouch_pres_task+0x2ce> @ imm = #-4
     2d2: 00 28        	cmp	r0, #0
     2d4: 63 d1        	bne	0x39e <prtouch_pres_task+0x39e> @ imm = #198
     2d6: 5b 46        	mov	r3, r11
     2d8: 1c 60        	str	r4, [r3]
     2da: 5d 60        	str	r5, [r3, #4]
     2dc: 4c 46        	mov	r4, r9
     2de: 42 46        	mov	r2, r8
     2e0: 40 f2 d4 23  	movw	r3, #724
     2e4: 01 3c        	subs	r4, #1
     2e6: 40 f2 00 00  	movw	r0, #0
     2ea: d4 50        	str	r4, [r2, r3]
     2ec: 0f 23        	movs	r3, #15
     2ee: c0 f2 00 00  	movt	r0, #0
     2f2: 1c 1b        	subs	r4, r3, r4
     2f4: ff f7 fe ff  	bl	0x2f4 <prtouch_pres_task+0x2f4> @ imm = #-4
     2f8: 42 46        	mov	r2, r8
     2fa: 40 f2 d8 23  	movw	r3, #728
     2fe: 40 f2 00 05  	movw	r5, #0
     302: 64 00        	lsls	r4, r4, #1
     304: d3 58        	ldr	r3, [r2, r3]
     306: 11 78        	ldrb	r1, [r2]
     308: 22 00        	movs	r2, r4
     30a: c0 f2 00 05  	movt	r5, #0
     30e: ac 46        	mov	r12, r5
     310: 94 32        	adds	r2, #148
     312: 92 00        	lsls	r2, r2, #2
     314: 62 44        	add	r2, r12
     316: 92 68        	ldr	r2, [r2, #8]
     318: 45 46        	mov	r5, r8
     31a: 0b 92        	str	r2, [sp, #44]
     31c: 22 00        	movs	r2, r4
     31e: 73 32        	adds	r2, #115
     320: 92 00        	lsls	r2, r2, #2
     322: 62 44        	add	r2, r12
     324: 92 68        	ldr	r2, [r2, #8]
     326: 0a 92        	str	r2, [sp, #40]
     328: 22 00        	movs	r2, r4
     32a: 52 32        	adds	r2, #82
     32c: 92 00        	lsls	r2, r2, #2
     32e: 62 44        	add	r2, r12
     330: 92 68        	ldr	r2, [r2, #8]
     332: 09 92        	str	r2, [sp, #36]
     334: 22 00        	movs	r2, r4
     336: 31 32        	adds	r2, #49
     338: 92 00        	lsls	r2, r2, #2
     33a: 62 44        	add	r2, r12
     33c: 92 68        	ldr	r2, [r2, #8]
     33e: 08 92        	str	r2, [sp, #32]
     340: 22 00        	movs	r2, r4
     342: 11 32        	adds	r2, #17
     344: 92 00        	lsls	r2, r2, #2
     346: 62 44        	add	r2, r12
     348: 52 68        	ldr	r2, [r2, #4]
     34a: 07 92        	str	r2, [sp, #28]
     34c: 22 00        	movs	r2, r4
     34e: 93 32        	adds	r2, #147
     350: 92 00        	lsls	r2, r2, #2
     352: 62 44        	add	r2, r12
     354: 92 68        	ldr	r2, [r2, #8]
     356: 06 92        	str	r2, [sp, #24]
     358: 22 00        	movs	r2, r4
     35a: 72 32        	adds	r2, #114
     35c: 92 00        	lsls	r2, r2, #2
     35e: 62 44        	add	r2, r12
     360: 92 68        	ldr	r2, [r2, #8]
     362: 05 92        	str	r2, [sp, #20]
     364: 22 00        	movs	r2, r4
     366: 51 32        	adds	r2, #81
     368: 92 00        	lsls	r2, r2, #2
     36a: 62 44        	add	r2, r12
     36c: 92 68        	ldr	r2, [r2, #8]
     36e: 04 92        	str	r2, [sp, #16]
     370: 22 00        	movs	r2, r4
     372: 30 32        	adds	r2, #48
     374: 92 00        	lsls	r2, r2, #2
     376: 62 44        	add	r2, r12
     378: 92 68        	ldr	r2, [r2, #8]
     37a: 03 92        	str	r2, [sp, #12]
     37c: 22 00        	movs	r2, r4
     37e: 10 32        	adds	r2, #16
     380: 92 00        	lsls	r2, r2, #2
     382: 62 44        	add	r2, r12
     384: 52 68        	ldr	r2, [r2, #4]
     386: 02 92        	str	r2, [sp, #8]
     388: 40 f2 04 32  	movw	r2, #772
     38c: aa 58        	ldr	r2, [r5, r2]
     38e: 01 92        	str	r2, [sp, #4]
     390: 40 f2 e2 22  	movw	r2, #738
     394: aa 5c        	ldrb	r2, [r5, r2]
     396: 00 92        	str	r2, [sp]
     398: 22 00        	movs	r2, r4
     39a: ff f7 fe ff  	bl	0x39a <prtouch_pres_task+0x39a> @ imm = #-4
     39e: 13 b0        	add	sp, #76
     3a0: 3c bc        	pop	{r2, r3, r4, r5}
     3a2: 90 46        	mov	r8, r2
     3a4: 99 46        	mov	r9, r3
     3a6: a2 46        	mov	r10, r4
     3a8: ab 46        	mov	r11, r5
     3aa: f0 bd        	pop	{r4, r5, r6, r7, pc}
     3ac: 00 23        	movs	r3, #0
     3ae: 41 46        	mov	r1, r8
     3b0: 8b 52        	strh	r3, [r1, r2]
     3b2: 23 68        	ldr	r3, [r4]
     3b4: 01 2b        	cmp	r3, #1
     3b6: 00 d0        	beq	0x3ba <prtouch_pres_task+0x3ba> @ imm = #0
     3b8: 59 e7        	b	0x26e <prtouch_pres_task+0x26e> @ imm = #-334
     3ba: ff f7 fe ff  	bl	0x3ba <prtouch_pres_task+0x3ba> @ imm = #-4
     3be: 56 e7        	b	0x26e <prtouch_pres_task+0x26e> @ imm = #-340

Disassembly of section .text.prtouch_task:

00000000 <prtouch_task>:
       0: 10 b5        	push	{r4, lr}
       2: ff f7 fe ff  	bl	0x2 <prtouch_task+0x2>  @ imm = #-4
       6: ff f7 fe ff  	bl	0x6 <prtouch_task+0x6>  @ imm = #-4
       a: 10 bd        	pop	{r4, pc}
