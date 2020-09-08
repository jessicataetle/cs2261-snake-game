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
	.file	"main.c"
	.text
	.align	2
	.global	goToStart
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L4
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L4+4
	mov	lr, pc
	bx	r4
	mov	r3, #32
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L4+8
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L4+12
	ldr	r1, .L4+16
	mov	lr, pc
	bx	r4
	mov	r3, #0
	ldr	r0, .L4+20
	ldr	r1, .L4+24
	ldr	r2, .L4+28
	str	r3, [r0]
	str	r3, [r1]
	str	r3, [r2]
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	DMANow
	.word	magentaPal
	.word	magentaTiles
	.word	100720640
	.word	magentaMap
	.word	isLost
	.word	appleCounter
	.word	.LANCHOR0
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	mov	ip, #4352
	mov	r0, #56320
	mov	r1, #0
	ldr	r2, .L7
	strh	ip, [r3]	@ movhi
	strh	r0, [r3, #8]	@ movhi
	str	r1, [r2]
	b	goToStart
.L8:
	.align	2
.L7:
	.word	seed
	.size	initialize, .-initialize
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	win.part.0, %function
win.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L11
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToStart
.L12:
	.align	2
.L11:
	.word	buttons
	.size	win.part.0, .-win.part.0
	.set	lose.part.0,win.part.0
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L15
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L15+4
	mov	lr, pc
	bx	r4
	mov	r3, #32
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L15+8
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L15+12
	ldr	r1, .L15+16
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L15+20
	ldr	r1, .L15+24
	mov	lr, pc
	bx	r4
	ldr	r2, .L15+28
	mov	r3, #16384
	mov	r0, #3
	ldr	r1, .L15+32
	mov	lr, pc
	bx	r4
	ldr	r3, .L15+36
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L15+40
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L16:
	.align	2
.L15:
	.word	DMANow
	.word	bluePal
	.word	blueTiles
	.word	100720640
	.word	blueMap
	.word	83886592
	.word	spritesheetPal
	.word	100728832
	.word	spritesheetTiles
	.word	hideSprites
	.word	.LANCHOR0
	.size	goToGame, .-goToGame
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L26
	ldr	r2, .L26+4
	ldr	r0, [r3]
	ldrh	r2, [r2]
	add	r0, r0, #1
	tst	r2, #8
	str	r0, [r3]
	bxeq	lr
	ldr	r3, .L26+8
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	push	{r4, lr}
	ldr	r3, .L26+12
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldr	r3, .L26+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L27:
	.align	2
.L26:
	.word	seed
	.word	oldButtons
	.word	buttons
	.word	srand
	.word	initGame
	.size	start, .-start
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L30
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L30+4
	mov	lr, pc
	bx	r4
	mov	r3, #16
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L30+8
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L30+12
	ldr	r1, .L30+16
	mov	r3, #4096
	mov	lr, pc
	bx	r4
	ldr	r3, .L30+20
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L30+24
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L30+28
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L31:
	.align	2
.L30:
	.word	DMANow
	.word	greenPal
	.word	greenTiles
	.word	100720640
	.word	greenMap
	.word	hideSprites
	.word	shadowOAM
	.word	.LANCHOR0
	.size	goToPause, .-goToPause
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L37
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L37+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToGame
.L38:
	.align	2
.L37:
	.word	oldButtons
	.word	buttons
	.size	pause, .-pause
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L41
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L41+4
	mov	lr, pc
	bx	r4
	mov	r3, #32
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L41+8
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L41+12
	ldr	r1, .L41+16
	mov	r3, #4096
	mov	lr, pc
	bx	r4
	ldr	r3, .L41+20
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L41+24
	mov	lr, pc
	bx	r4
	mov	r2, #3
	ldr	r3, .L41+28
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L42:
	.align	2
.L41:
	.word	DMANow
	.word	yellowPal
	.word	yellowTiles
	.word	100720640
	.word	yellowMap
	.word	hideSprites
	.word	shadowOAM
	.word	.LANCHOR0
	.size	goToWin, .-goToWin
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L45
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	b	win.part.0
.L46:
	.align	2
.L45:
	.word	oldButtons
	.size	win, .-win
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L49
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L49+4
	mov	lr, pc
	bx	r4
	mov	r3, #32
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L49+8
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L49+12
	ldr	r1, .L49+16
	mov	r3, #4096
	mov	lr, pc
	bx	r4
	ldr	r3, .L49+20
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L49+24
	mov	lr, pc
	bx	r4
	mov	r2, #4
	ldr	r3, .L49+28
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L50:
	.align	2
.L49:
	.word	DMANow
	.word	redPal
	.word	redTiles
	.word	100720640
	.word	redMap
	.word	hideSprites
	.word	shadowOAM
	.word	.LANCHOR0
	.size	goToLose, .-goToLose
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L62
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L62+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L52
	ldr	r3, .L62+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L59
.L52:
	ldr	r3, .L62+12
	ldr	r3, [r3]
	cmp	r3, #10
	beq	.L60
.L53:
	ldr	r3, .L62+16
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L61
	pop	{r4, lr}
	bx	lr
.L61:
	pop	{r4, lr}
	b	goToLose
.L60:
	bl	goToWin
	b	.L53
.L59:
	bl	goToPause
	b	.L52
.L63:
	.align	2
.L62:
	.word	updateGame
	.word	oldButtons
	.word	buttons
	.word	appleCounter
	.word	isLost
	.size	game, .-game
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	ip, #4352
	mov	r0, #56320
	mov	r1, #0
	push	{r4, r7, fp, lr}
	ldr	r2, .L85
	ldr	r4, .L85+4
	strh	ip, [r3]	@ movhi
	strh	r0, [r3, #8]	@ movhi
	ldr	r3, .L85+8
	str	r1, [r2]
	ldr	r5, .L85+12
	mov	lr, pc
	bx	r3
	ldr	r8, .L85+16
	ldrh	r3, [r4]
	ldr	r7, .L85+20
	ldr	r10, .L85+24
	ldr	r9, .L85+28
	ldr	fp, .L85+32
	ldr	r6, .L85+36
.L73:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r6, #48]
	strh	r3, [r4]	@ movhi
	mov	lr, pc
	bx	r8
	ldr	r3, [r7]
	cmp	r3, #4
	ldrls	pc, [pc, r3, asl #2]
	b	.L84
.L68:
	.word	.L72
	.word	.L71
	.word	.L70
	.word	.L69
	.word	.L67
.L67:
	ldrh	r3, [r5]
	tst	r3, #8
	beq	.L84
	ldr	r3, .L85+40
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L73
.L69:
	ldrh	r3, [r5]
	tst	r3, #8
	movne	lr, pc
	bxne	fp
.L84:
	ldrh	r3, [r4]
	b	.L73
.L70:
	ldrh	r3, [r5]
	tst	r3, #8
	ldrh	r3, [r4]
	beq	.L73
	tst	r3, #8
	bne	.L73
	ldr	r3, .L85+44
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L73
.L72:
	mov	lr, pc
	bx	r10
	ldrh	r3, [r4]
	b	.L73
.L71:
	mov	lr, pc
	bx	r9
	ldrh	r3, [r4]
	b	.L73
.L86:
	.align	2
.L85:
	.word	seed
	.word	buttons
	.word	goToStart
	.word	oldButtons
	.word	waitForVBlank
	.word	.LANCHOR0
	.word	start
	.word	game
	.word	win.part.0
	.word	67109120
	.word	lose.part.0
	.word	goToGame
	.size	main, .-main
	.text
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	win
	.size	lose, .-lose
	.global	state
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	seed,4,4
	.comm	appleCounter,4,4
	.comm	isLost,4,4
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	state, %object
	.size	state, 4
state:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
