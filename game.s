	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"game.c"
	.text
	.align	2
	.global	initGame
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #16
	mov	r2, #0
	mov	r1, #1
	mov	ip, #112
	mov	r0, #80
	push	{r4, r5, r6, lr}
	ldr	r4, .L18
	ldr	r5, .L18+4
	ldr	lr, .L18+8
	ldr	r6, .L18+12
	str	r2, [lr]
	str	r2, [r4, #12]
	str	r2, [r4, #24]
	str	r1, [r4, #28]
	str	r3, [r4, #16]
	str	r3, [r4, #20]
	str	r3, [r4, #8]
	str	r3, [r5, #8]
	str	r3, [r5, #12]
	stm	r4, {r0, ip}
	mov	lr, pc
	bx	r6
	ldr	r3, .L18+16
	smull	r1, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #10
	rsb	r2, r3, r3, lsl #3
	rsb	r3, r3, r2, lsl #3
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3, lsl #3
	cmp	r3, #0
	add	r2, r3, #15
	movlt	r3, r2
	asr	r3, r3, #4
	tst	r3, #15
	str	r3, [r5]
	beq	.L2
	add	r3, r3, #1
.L3:
	and	r2, r3, #15
	cmp	r2, #0
	mov	r2, r3
	add	r3, r3, #1
	bne	.L3
	str	r2, [r5]
.L2:
	mov	lr, pc
	bx	r6
	ldr	r3, .L18+20
	smull	r1, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #9
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #6
	sub	r3, r0, r3, lsl #2
	cmp	r3, #0
	add	r2, r3, #15
	movlt	r3, r2
	asr	r3, r3, #4
	tst	r3, #15
	str	r3, [r5, #4]
	beq	.L4
	add	r3, r3, #1
.L5:
	and	r2, r3, #15
	cmp	r2, #0
	mov	r2, r3
	add	r3, r3, #1
	bne	.L5
	str	r2, [r5, #4]
.L4:
	mov	r1, #16
	mov	r5, #5
	mov	lr, #0
	add	r0, r4, #16
	ldm	r0, {r0, r2}
	ldr	r3, .L18
	add	r0, r0, r0, lsr #31
	add	r2, r2, r2, lsr #31
	asr	r0, r0, #1
	asr	r2, r2, #1
	rsb	r0, r0, #120
	rsb	r2, r2, #64
	add	ip, r3, #288
.L6:
	str	r2, [r3, #32]
	str	r1, [r3, #48]
	str	r1, [r3, #52]
	str	r0, [r3, #36]
	str	r5, [r3, #56]
	str	lr, [r3, #60]
	add	r3, r3, #32
	cmp	r3, ip
	sub	r2, r2, #16
	bne	.L6
	ldr	r2, .L18+24
	ldr	r3, .L18+28
	ldrh	r2, [r2, #48]
	pop	{r4, r5, r6, lr}
	strh	r2, [r3]	@ movhi
	bx	lr
.L19:
	.align	2
.L18:
	.word	snake
	.word	apple
	.word	snakeTimer
	.word	rand
	.word	1999112051
	.word	1691556351
	.word	67109120
	.word	buttons
	.size	initGame, .-initGame
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	ip, .L83
	ldr	r2, .L83+4
	ldr	r3, [ip]
	ldrh	r2, [r2]
	add	r3, r3, #1
	tst	r2, #64
	str	r3, [ip]
	sub	sp, sp, #20
	beq	.L78
	ldr	r1, .L83+8
	ldrh	r1, [r1]
	ands	r1, r1, #64
	beq	.L76
.L78:
	ldr	r6, .L83+12
.L21:
	tst	r2, #128
	beq	.L22
	ldr	r1, .L83+8
	ldrh	r1, [r1]
	ands	r1, r1, #128
	moveq	r0, #16
	streq	r1, [r6, #12]
	streq	r1, [r6, #24]
	streq	r0, [r6, #8]
.L22:
	tst	r2, #16
	beq	.L23
	ldr	r1, .L83+8
	ldrh	r1, [r1]
	ands	r1, r1, #16
	moveq	lr, #16
	moveq	r0, #1
	streq	r1, [r6, #8]
	streq	lr, [r6, #12]
	streq	r0, [r6, #24]
.L23:
	tst	r2, #32
	beq	.L24
	ldr	r2, .L83+8
	ldrh	r2, [r2]
	ands	r2, r2, #32
	mvneq	r0, #15
	moveq	r1, #3
	streq	r2, [r6, #8]
	streq	r0, [r6, #12]
	streq	r1, [r6, #24]
.L24:
	cmp	r3, #10
	beq	.L25
	ldr	r0, [r6, #4]
	ldr	r1, [r6]
.L26:
	cmn	r1, #8
	movge	r3, #0
	movlt	r3, #1
	add	r2, r0, #8
	cmp	r2, #247
	orrhi	r3, r3, #1
	cmp	r3, #0
	beq	.L80
.L28:
	mov	r2, #1
	ldr	r3, .L83+16
	str	r2, [r3]
.L29:
	ldr	r7, .L83+20
	ldm	r7, {r2, r3, ip, lr}
	stmib	sp, {r2, ip, lr}
	str	r3, [sp]
	add	r2, r6, #16
	ldm	r2, {r2, r3}
	ldr	r8, .L83+24
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	bne	.L81
.L31:
	ldr	r4, .L83+12
	ldr	r0, [r6, #4]
	ldr	r1, [r6]
	mov	r5, r4
	mov	r6, r4
	add	r9, r4, #288
	b	.L42
.L39:
	add	r5, r5, #32
	cmp	r9, r5
	beq	.L41
.L42:
	ldr	r3, [r5, #60]
	cmp	r3, #0
	beq	.L39
	ldr	r3, [r5, #52]
	ldr	r2, [r5, #32]
	ldr	ip, [r5, #48]
	str	r3, [sp, #12]
	ldr	r3, [r5, #36]
	stmib	sp, {r2, ip}
	str	r3, [sp]
	add	r2, r6, #16
	ldm	r2, {r2, r3}
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	bne	.L40
	add	r5, r5, #32
	cmp	r9, r5
	ldr	r1, [r6]
	ldr	r0, [r6, #4]
	bne	.L42
.L41:
	ldr	r2, .L83+28
	mov	lr, #8
	mov	r3, r2
	ldr	ip, [r6, #24]
	lsl	ip, ip, #1
	strh	ip, [r2, #4]	@ movhi
	ldm	r7, {r5, ip}
	orr	ip, ip, #16384
	orr	r0, r0, #16384
	strh	r1, [r2]	@ movhi
	strh	r5, [r2, #8]	@ movhi
	strh	ip, [r2, #10]	@ movhi
	strh	lr, [r2, #12]	@ movhi
	strh	r0, [r2, #2]	@ movhi
	add	r0, r2, #72
.L44:
	ldr	r2, [r4, #60]
	cmp	r2, #0
	beq	.L43
	ldr	r1, [r4, #36]
	ldr	r2, [r4, #56]
	ldr	ip, [r4, #32]
	orr	r1, r1, #16384
	lsl	r2, r2, #1
	strh	r1, [r3, #18]	@ movhi
	strh	r2, [r3, #20]	@ movhi
	strh	ip, [r3, #16]	@ movhi
.L43:
	add	r3, r3, #8
	cmp	r0, r3
	add	r4, r4, #32
	bne	.L44
	ldr	r3, .L83+32
	mov	lr, pc
	bx	r3
	ldr	r4, .L83+36
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L83+28
	mov	lr, pc
	bx	r4
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L76:
	mvn	lr, #15
	mov	r0, #2
	ldr	r6, .L83+12
	str	lr, [r6, #8]
	str	r1, [r6, #12]
	str	r0, [r6, #24]
	b	.L21
.L25:
	ldr	r3, .L83+12
	sub	r0, r3, #288
.L27:
	add	r1, r3, #256
	ldm	r1, {r1, r2}
	sub	r3, r3, #32
	str	r1, [r3, #320]
	str	r2, [r3, #324]
	cmp	r3, r0
	bne	.L27
	mov	r3, #0
	ldr	r0, [r6]
	ldr	r1, [r6, #8]
	ldr	r2, [r6, #4]
	add	r1, r0, r1
	ldr	r0, [r6, #12]
	add	r0, r2, r0
	str	r1, [r6]
	str	r0, [r6, #4]
	str	r3, [ip]
	b	.L26
.L81:
	ldr	r2, .L83+40
	ldr	r3, [r2]
	ldr	r5, .L83+44
	add	r3, r3, #1
	str	r3, [r2]
	mov	lr, pc
	bx	r5
	ldr	r4, .L83+48
	smull	r2, r3, r4, r0
	asr	r4, r0, #31
	rsb	r4, r4, r3, asr #3
	rsb	r3, r4, r4, lsl #3
	rsb	r4, r4, r3, lsl #3
	sub	r4, r0, r4, lsl #2
	mov	lr, pc
	bx	r5
	ldr	r3, .L83+52
	smull	r1, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #6
	add	r3, r3, r3, lsl #6
	tst	r4, #15
	sub	r3, r0, r3, lsl #1
	beq	.L79
.L33:
	add	r4, r4, #1
	tst	r4, #15
	bne	.L33
	tst	r3, #15
	beq	.L82
.L35:
	add	r3, r3, #1
.L79:
	tst	r3, #15
	bne	.L35
.L82:
	mov	r2, #1
	stm	r7, {r3, r4}
	ldr	r1, .L83+56
	b	.L37
.L36:
	cmp	r2, #10
	beq	.L31
.L37:
	ldr	r3, [r1, r2, lsl #5]
	cmp	r3, #0
	lsl	r3, r2, #5
	add	r2, r2, #1
	bne	.L36
	mov	r2, #1
	add	r3, r6, r3
	str	r2, [r3, #28]
	b	.L31
.L40:
	mov	r2, #1
	ldr	r3, .L83+16
	ldr	r1, [r6]
	str	r2, [r3]
	ldr	r0, [r6, #4]
	b	.L41
.L80:
	ldr	r3, [r6, #20]
	cmp	r3, #0
	add	r2, r3, #7
	movlt	r3, r2
	asr	r3, r3, #3
	rsb	r3, r3, #159
	cmp	r3, r1
	bge	.L29
	b	.L28
.L84:
	.align	2
.L83:
	.word	snakeTimer
	.word	oldButtons
	.word	buttons
	.word	snake
	.word	isLost
	.word	apple
	.word	collision
	.word	shadowOAM
	.word	waitForVBlank
	.word	DMANow
	.word	appleCounter
	.word	rand
	.word	156180629
	.word	2114445439
	.word	snake+28
	.size	updateGame, .-updateGame
	.comm	snakeTimer,4,4
	.comm	shadowOAM,1024,4
	.comm	apple,16,4
	.comm	snake,320,4
	.comm	seed,4,4
	.comm	appleCounter,4,4
	.comm	isLost,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
