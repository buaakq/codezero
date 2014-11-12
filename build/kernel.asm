
kernel.elf：     文件格式 elf32-littlearm


Disassembly of section .text:

f0008000 <_start>:
f0008000:	e32ff013 	msr	CPSR_fsxc, #19
f0008004:	ee110f10 	mrc	15, 0, r0, cr1, cr0, {0}
f0008008:	e3c00001 	bic	r0, r0, #1
f000800c:	e3c00004 	bic	r0, r0, #4
f0008010:	e3c00a01 	bic	r0, r0, #4096	; 0x1000
f0008014:	e3c00008 	bic	r0, r0, #8
f0008018:	e3c00b02 	bic	r0, r0, #2048	; 0x800
f000801c:	ee010f10 	mcr	15, 0, r0, cr1, cr0, {0}
f0008020:	e59fd028 	ldr	sp, [pc, #40]	; f0008050 <_kernel_init_stack>
f0008024:	e329f0d7 	msr	CPSR_fc, #215	; 0xd7
f0008028:	e59fd024 	ldr	sp, [pc, #36]	; f0008054 <_kernel_abt_stack>
f000802c:	e329f0d2 	msr	CPSR_fc, #210	; 0xd2
f0008030:	e59fd020 	ldr	sp, [pc, #32]	; f0008058 <_kernel_irq_stack>
f0008034:	e329f0d1 	msr	CPSR_fc, #209	; 0xd1
f0008038:	e59fd01c 	ldr	sp, [pc, #28]	; f000805c <_kernel_fiq_stack>
f000803c:	e329f0db 	msr	CPSR_fc, #219	; 0xdb
f0008040:	e59fd018 	ldr	sp, [pc, #24]	; f0008060 <_kernel_und_stack>
f0008044:	e329f0d3 	msr	CPSR_fc, #211	; 0xd3
f0008048:	eb001feb 	bl	f000fffc <start_kernel>
f000804c:	eafffffe 	b	f000804c <_start+0x4c>

f0008050 <_kernel_init_stack>:
f0008050:	0002d000 	.word	0x0002d000

f0008054 <_kernel_abt_stack>:
f0008054:	ffff058c 	.word	0xffff058c

f0008058 <_kernel_irq_stack>:
f0008058:	ffff060c 	.word	0xffff060c

f000805c <_kernel_fiq_stack>:
f000805c:	ffff068c 	.word	0xffff068c

f0008060 <_kernel_und_stack>:
f0008060:	ffff070c 	.word	0xffff070c

f0008064 <link_init>:
f0008064:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f0008068:	e28db000 	add	fp, sp, #0
f000806c:	e24dd00c 	sub	sp, sp, #12
f0008070:	e50b0008 	str	r0, [fp, #-8]
f0008074:	e51b3008 	ldr	r3, [fp, #-8]
f0008078:	e51b2008 	ldr	r2, [fp, #-8]
f000807c:	e5832000 	str	r2, [r3]
f0008080:	e51b3008 	ldr	r3, [fp, #-8]
f0008084:	e51b2008 	ldr	r2, [fp, #-8]
f0008088:	e5832004 	str	r2, [r3, #4]
f000808c:	e24bd000 	sub	sp, fp, #0
f0008090:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0008094:	e12fff1e 	bx	lr

f0008098 <enable_irqs>:
f0008098:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f000809c:	e28db000 	add	fp, sp, #0
f00080a0:	e10f0000 	mrs	r0, CPSR
f00080a4:	e3c00080 	bic	r0, r0, #128	; 0x80
f00080a8:	e129f000 	msr	CPSR_fc, r0
f00080ac:	e24bd000 	sub	sp, fp, #0
f00080b0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f00080b4:	e12fff1e 	bx	lr

f00080b8 <waitqueue_head_init>:
f00080b8:	e92d4800 	push	{fp, lr}
f00080bc:	e28db004 	add	fp, sp, #4
f00080c0:	e24dd008 	sub	sp, sp, #8
f00080c4:	e50b0008 	str	r0, [fp, #-8]
f00080c8:	e51b0008 	ldr	r0, [fp, #-8]
f00080cc:	e3a01000 	mov	r1, #0
f00080d0:	e3a02010 	mov	r2, #16
f00080d4:	eb0037af 	bl	f0015f98 <memset>
f00080d8:	e51b3008 	ldr	r3, [fp, #-8]
f00080dc:	e2833008 	add	r3, r3, #8
f00080e0:	e1a00003 	mov	r0, r3
f00080e4:	ebffffde 	bl	f0008064 <link_init>
f00080e8:	e24bd004 	sub	sp, fp, #4
f00080ec:	e8bd8800 	pop	{fp, pc}

f00080f0 <system_account_irq>:
f00080f0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f00080f4:	e28db000 	add	fp, sp, #0
f00080f8:	e24bd000 	sub	sp, fp, #0
f00080fc:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0008100:	e12fff1e 	bx	lr

f0008104 <irq_enable>:
f0008104:	e92d4800 	push	{fp, lr}
f0008108:	e28db004 	add	fp, sp, #4
f000810c:	e24dd010 	sub	sp, sp, #16
f0008110:	e50b0010 	str	r0, [fp, #-16]
f0008114:	e51b2010 	ldr	r2, [fp, #-16]
f0008118:	e1a03002 	mov	r3, r2
f000811c:	e1a03103 	lsl	r3, r3, #2
f0008120:	e0833002 	add	r3, r3, r2
f0008124:	e1a03183 	lsl	r3, r3, #3
f0008128:	e1a02003 	mov	r2, r3
f000812c:	e59f3038 	ldr	r3, [pc, #56]	; f000816c <irq_enable+0x68>
f0008130:	e0823003 	add	r3, r2, r3
f0008134:	e50b3008 	str	r3, [fp, #-8]
f0008138:	e51b3008 	ldr	r3, [fp, #-8]
f000813c:	e5933008 	ldr	r3, [r3, #8]
f0008140:	e50b300c 	str	r3, [fp, #-12]
f0008144:	e51b300c 	ldr	r3, [fp, #-12]
f0008148:	e5933040 	ldr	r3, [r3, #64]	; 0x40
f000814c:	e51b200c 	ldr	r2, [fp, #-12]
f0008150:	e5922028 	ldr	r2, [r2, #40]	; 0x28
f0008154:	e51b1010 	ldr	r1, [fp, #-16]
f0008158:	e0622001 	rsb	r2, r2, r1
f000815c:	e1a00002 	mov	r0, r2
f0008160:	e12fff33 	blx	r3
f0008164:	e24bd004 	sub	sp, fp, #4
f0008168:	e8bd8800 	pop	{fp, pc}
f000816c:	f00200b8 	.word	0xf00200b8

f0008170 <irq_disable>:
f0008170:	e92d4800 	push	{fp, lr}
f0008174:	e28db004 	add	fp, sp, #4
f0008178:	e24dd010 	sub	sp, sp, #16
f000817c:	e50b0010 	str	r0, [fp, #-16]
f0008180:	e51b2010 	ldr	r2, [fp, #-16]
f0008184:	e1a03002 	mov	r3, r2
f0008188:	e1a03103 	lsl	r3, r3, #2
f000818c:	e0833002 	add	r3, r3, r2
f0008190:	e1a03183 	lsl	r3, r3, #3
f0008194:	e1a02003 	mov	r2, r3
f0008198:	e59f3038 	ldr	r3, [pc, #56]	; f00081d8 <irq_disable+0x68>
f000819c:	e0823003 	add	r3, r2, r3
f00081a0:	e50b3008 	str	r3, [fp, #-8]
f00081a4:	e51b3008 	ldr	r3, [fp, #-8]
f00081a8:	e5933008 	ldr	r3, [r3, #8]
f00081ac:	e50b300c 	str	r3, [fp, #-12]
f00081b0:	e51b300c 	ldr	r3, [fp, #-12]
f00081b4:	e593303c 	ldr	r3, [r3, #60]	; 0x3c
f00081b8:	e51b200c 	ldr	r2, [fp, #-12]
f00081bc:	e5922028 	ldr	r2, [r2, #40]	; 0x28
f00081c0:	e51b1010 	ldr	r1, [fp, #-16]
f00081c4:	e0622001 	rsb	r2, r2, r1
f00081c8:	e1a00002 	mov	r0, r2
f00081cc:	e12fff33 	blx	r3
f00081d0:	e24bd004 	sub	sp, fp, #4
f00081d4:	e8bd8800 	pop	{fp, pc}
f00081d8:	f00200b8 	.word	0xf00200b8

f00081dc <irq_register>:
f00081dc:	e92d4800 	push	{fp, lr}
f00081e0:	e28db004 	add	fp, sp, #4
f00081e4:	e24dd018 	sub	sp, sp, #24
f00081e8:	e50b0010 	str	r0, [fp, #-16]
f00081ec:	e50b1014 	str	r1, [fp, #-20]
f00081f0:	e50b2018 	str	r2, [fp, #-24]
f00081f4:	e51b2018 	ldr	r2, [fp, #-24]
f00081f8:	e1a03002 	mov	r3, r2
f00081fc:	e1a03103 	lsl	r3, r3, #2
f0008200:	e0833002 	add	r3, r3, r2
f0008204:	e1a03183 	lsl	r3, r3, #3
f0008208:	e1a02003 	mov	r2, r3
f000820c:	e59f3084 	ldr	r3, [pc, #132]	; f0008298 <irq_register+0xbc>
f0008210:	e0823003 	add	r3, r2, r3
f0008214:	e50b3008 	str	r3, [fp, #-8]
f0008218:	e51b3008 	ldr	r3, [fp, #-8]
f000821c:	e5933024 	ldr	r3, [r3, #36]	; 0x24
f0008220:	e3530000 	cmp	r3, #0
f0008224:	0a000003 	beq	f0008238 <irq_register+0x5c>
f0008228:	e51b3008 	ldr	r3, [fp, #-8]
f000822c:	e5933008 	ldr	r3, [r3, #8]
f0008230:	e3530000 	cmp	r3, #0
f0008234:	1a000001 	bne	f0008240 <irq_register+0x64>
f0008238:	e3e03088 	mvn	r3, #136	; 0x88
f000823c:	ea000012 	b	f000828c <irq_register+0xb0>
f0008240:	e51b3018 	ldr	r3, [fp, #-24]
f0008244:	e3530040 	cmp	r3, #64	; 0x40
f0008248:	9a000001 	bls	f0008254 <irq_register+0x78>
f000824c:	e3e03088 	mvn	r3, #136	; 0x88
f0008250:	ea00000d 	b	f000828c <irq_register+0xb0>
f0008254:	e51b3008 	ldr	r3, [fp, #-8]
f0008258:	e51b2010 	ldr	r2, [fp, #-16]
f000825c:	e583200c 	str	r2, [r3, #12]
f0008260:	e51b3008 	ldr	r3, [fp, #-8]
f0008264:	e51b2014 	ldr	r2, [fp, #-20]
f0008268:	e5832010 	str	r2, [r3, #16]
f000826c:	e51b3008 	ldr	r3, [fp, #-8]
f0008270:	e2833014 	add	r3, r3, #20
f0008274:	e1a00003 	mov	r0, r3
f0008278:	ebffff8e 	bl	f00080b8 <waitqueue_head_init>
f000827c:	e51b3018 	ldr	r3, [fp, #-24]
f0008280:	e1a00003 	mov	r0, r3
f0008284:	ebffff9e 	bl	f0008104 <irq_enable>
f0008288:	e3a03000 	mov	r3, #0
f000828c:	e1a00003 	mov	r0, r3
f0008290:	e24bd004 	sub	sp, fp, #4
f0008294:	e8bd8800 	pop	{fp, pc}
f0008298:	f00200b8 	.word	0xf00200b8

f000829c <cascade_irq_chip>:
f000829c:	e92d4800 	push	{fp, lr}
f00082a0:	e28db004 	add	fp, sp, #4
f00082a4:	e24dd008 	sub	sp, sp, #8
f00082a8:	e50b0008 	str	r0, [fp, #-8]
f00082ac:	e51b3008 	ldr	r3, [fp, #-8]
f00082b0:	e5933024 	ldr	r3, [r3, #36]	; 0x24
f00082b4:	e3530000 	cmp	r3, #0
f00082b8:	ba000009 	blt	f00082e4 <cascade_irq_chip+0x48>
f00082bc:	e51b3008 	ldr	r3, [fp, #-8]
f00082c0:	e5933040 	ldr	r3, [r3, #64]	; 0x40
f00082c4:	e3530000 	cmp	r3, #0
f00082c8:	0a000005 	beq	f00082e4 <cascade_irq_chip+0x48>
f00082cc:	e51b3008 	ldr	r3, [fp, #-8]
f00082d0:	e5933040 	ldr	r3, [r3, #64]	; 0x40
f00082d4:	e51b2008 	ldr	r2, [fp, #-8]
f00082d8:	e5922024 	ldr	r2, [r2, #36]	; 0x24
f00082dc:	e1a00002 	mov	r0, r2
f00082e0:	e12fff33 	blx	r3
f00082e4:	e24bd004 	sub	sp, fp, #4
f00082e8:	e8bd8800 	pop	{fp, pc}

f00082ec <irq_controllers_init>:
f00082ec:	e92d4800 	push	{fp, lr}
f00082f0:	e28db004 	add	fp, sp, #4
f00082f4:	e24dd008 	sub	sp, sp, #8
f00082f8:	e3a03000 	mov	r3, #0
f00082fc:	e50b3008 	str	r3, [fp, #-8]
f0008300:	ea000014 	b	f0008358 <irq_controllers_init+0x6c>
f0008304:	e51b2008 	ldr	r2, [fp, #-8]
f0008308:	e1a03002 	mov	r3, r2
f000830c:	e1a03183 	lsl	r3, r3, #3
f0008310:	e0833002 	add	r3, r3, r2
f0008314:	e1a03183 	lsl	r3, r3, #3
f0008318:	e1a02003 	mov	r2, r3
f000831c:	e59f3048 	ldr	r3, [pc, #72]	; f000836c <irq_controllers_init+0x80>
f0008320:	e0823003 	add	r3, r2, r3
f0008324:	e50b300c 	str	r3, [fp, #-12]
f0008328:	e51b300c 	ldr	r3, [fp, #-12]
f000832c:	e5933034 	ldr	r3, [r3, #52]	; 0x34
f0008330:	e3530000 	cmp	r3, #0
f0008334:	0a000002 	beq	f0008344 <irq_controllers_init+0x58>
f0008338:	e51b300c 	ldr	r3, [fp, #-12]
f000833c:	e5933034 	ldr	r3, [r3, #52]	; 0x34
f0008340:	e12fff33 	blx	r3
f0008344:	e51b000c 	ldr	r0, [fp, #-12]
f0008348:	ebffffd3 	bl	f000829c <cascade_irq_chip>
f000834c:	e51b3008 	ldr	r3, [fp, #-8]
f0008350:	e2833001 	add	r3, r3, #1
f0008354:	e50b3008 	str	r3, [fp, #-8]
f0008358:	e51b3008 	ldr	r3, [fp, #-8]
f000835c:	e3530001 	cmp	r3, #1
f0008360:	daffffe7 	ble	f0008304 <irq_controllers_init+0x18>
f0008364:	e24bd004 	sub	sp, fp, #4
f0008368:	e8bd8800 	pop	{fp, pc}
f000836c:	f0020028 	.word	0xf0020028

f0008370 <global_irq_index>:
f0008370:	e92d4800 	push	{fp, lr}
f0008374:	e28db004 	add	fp, sp, #4
f0008378:	e24dd010 	sub	sp, sp, #16
f000837c:	e3a03000 	mov	r3, #0
f0008380:	e50b3008 	str	r3, [fp, #-8]
f0008384:	e3a03000 	mov	r3, #0
f0008388:	e50b300c 	str	r3, [fp, #-12]
f000838c:	ea00002d 	b	f0008448 <global_irq_index+0xd8>
f0008390:	e51b200c 	ldr	r2, [fp, #-12]
f0008394:	e1a03002 	mov	r3, r2
f0008398:	e1a03183 	lsl	r3, r3, #3
f000839c:	e0833002 	add	r3, r3, r2
f00083a0:	e1a03183 	lsl	r3, r3, #3
f00083a4:	e1a02003 	mov	r2, r3
f00083a8:	e59f30c8 	ldr	r3, [pc, #200]	; f0008478 <global_irq_index+0x108>
f00083ac:	e0823003 	add	r3, r2, r3
f00083b0:	e50b3010 	str	r3, [fp, #-16]
f00083b4:	e51b3010 	ldr	r3, [fp, #-16]
f00083b8:	e5933038 	ldr	r3, [r3, #56]	; 0x38
f00083bc:	e3530000 	cmp	r3, #0
f00083c0:	0a00000f 	beq	f0008404 <global_irq_index+0x94>
f00083c4:	e51b3010 	ldr	r3, [fp, #-16]
f00083c8:	e5933038 	ldr	r3, [r3, #56]	; 0x38
f00083cc:	e51b2010 	ldr	r2, [fp, #-16]
f00083d0:	e5922030 	ldr	r2, [r2, #48]	; 0x30
f00083d4:	e1a00002 	mov	r0, r2
f00083d8:	e12fff33 	blx	r3
f00083dc:	e50b0008 	str	r0, [fp, #-8]
f00083e0:	e51b3008 	ldr	r3, [fp, #-8]
f00083e4:	e3730001 	cmn	r3, #1
f00083e8:	1a000005 	bne	f0008404 <global_irq_index+0x94>
f00083ec:	e59f0088 	ldr	r0, [pc, #136]	; f000847c <global_irq_index+0x10c>
f00083f0:	e59f1088 	ldr	r1, [pc, #136]	; f0008480 <global_irq_index+0x110>
f00083f4:	e59f2088 	ldr	r2, [pc, #136]	; f0008484 <global_irq_index+0x114>
f00083f8:	e3a0306a 	mov	r3, #106	; 0x6a
f00083fc:	eb0036ba 	bl	f0015eec <printk>
f0008400:	eafffffe 	b	f0008400 <global_irq_index+0x90>
f0008404:	e51b3010 	ldr	r3, [fp, #-16]
f0008408:	e5933024 	ldr	r3, [r3, #36]	; 0x24
f000840c:	e1a02003 	mov	r2, r3
f0008410:	e51b3008 	ldr	r3, [fp, #-8]
f0008414:	e1520003 	cmp	r2, r3
f0008418:	1a000003 	bne	f000842c <global_irq_index+0xbc>
f000841c:	e51b300c 	ldr	r3, [fp, #-12]
f0008420:	e2833001 	add	r3, r3, #1
f0008424:	e50b300c 	str	r3, [fp, #-12]
f0008428:	ea000006 	b	f0008448 <global_irq_index+0xd8>
f000842c:	e51b3010 	ldr	r3, [fp, #-16]
f0008430:	e5933028 	ldr	r3, [r3, #40]	; 0x28
f0008434:	e51b2008 	ldr	r2, [fp, #-8]
f0008438:	e0823003 	add	r3, r2, r3
f000843c:	e50b3008 	str	r3, [fp, #-8]
f0008440:	e51b3008 	ldr	r3, [fp, #-8]
f0008444:	ea000008 	b	f000846c <global_irq_index+0xfc>
f0008448:	e51b300c 	ldr	r3, [fp, #-12]
f000844c:	e3530001 	cmp	r3, #1
f0008450:	daffffce 	ble	f0008390 <global_irq_index+0x20>
f0008454:	e59f0020 	ldr	r0, [pc, #32]	; f000847c <global_irq_index+0x10c>
f0008458:	e59f1020 	ldr	r1, [pc, #32]	; f0008480 <global_irq_index+0x110>
f000845c:	e59f2020 	ldr	r2, [pc, #32]	; f0008484 <global_irq_index+0x114>
f0008460:	e3a0307d 	mov	r3, #125	; 0x7d
f0008464:	eb0036a0 	bl	f0015eec <printk>
f0008468:	eafffffe 	b	f0008468 <global_irq_index+0xf8>
f000846c:	e1a00003 	mov	r0, r3
f0008470:	e24bd004 	sub	sp, fp, #4
f0008474:	e8bd8800 	pop	{fp, pc}
f0008478:	f0020028 	.word	0xf0020028
f000847c:	f001e1cc 	.word	0xf001e1cc
f0008480:	f001e1f4 	.word	0xf001e1f4
f0008484:	f001e24c 	.word	0xf001e24c

f0008488 <do_irq>:
f0008488:	e92d4800 	push	{fp, lr}
f000848c:	e28db004 	add	fp, sp, #4
f0008490:	e24dd008 	sub	sp, sp, #8
f0008494:	ebffffb5 	bl	f0008370 <global_irq_index>
f0008498:	e50b0008 	str	r0, [fp, #-8]
f000849c:	e51b3008 	ldr	r3, [fp, #-8]
f00084a0:	e3730002 	cmn	r3, #2
f00084a4:	1a000008 	bne	f00084cc <do_irq+0x44>
f00084a8:	e59f00d0 	ldr	r0, [pc, #208]	; f0008580 <do_irq+0xf8>
f00084ac:	e3a01000 	mov	r1, #0
f00084b0:	eb00368d 	bl	f0015eec <printk>
f00084b4:	e59f00c8 	ldr	r0, [pc, #200]	; f0008584 <do_irq+0xfc>
f00084b8:	e59f10c8 	ldr	r1, [pc, #200]	; f0008588 <do_irq+0x100>
f00084bc:	e59f20c8 	ldr	r2, [pc, #200]	; f000858c <do_irq+0x104>
f00084c0:	e3a0308b 	mov	r3, #139	; 0x8b
f00084c4:	eb003688 	bl	f0015eec <printk>
f00084c8:	eafffffe 	b	f00084c8 <do_irq+0x40>
f00084cc:	e51b2008 	ldr	r2, [fp, #-8]
f00084d0:	e1a03002 	mov	r3, r2
f00084d4:	e1a03103 	lsl	r3, r3, #2
f00084d8:	e0833002 	add	r3, r3, r2
f00084dc:	e1a03183 	lsl	r3, r3, #3
f00084e0:	e1a02003 	mov	r2, r3
f00084e4:	e59f30a4 	ldr	r3, [pc, #164]	; f0008590 <do_irq+0x108>
f00084e8:	e0823003 	add	r3, r2, r3
f00084ec:	e50b300c 	str	r3, [fp, #-12]
f00084f0:	ebfffefe 	bl	f00080f0 <system_account_irq>
f00084f4:	e51b3008 	ldr	r3, [fp, #-8]
f00084f8:	e1a00003 	mov	r0, r3
f00084fc:	ebffff1b 	bl	f0008170 <irq_disable>
f0008500:	ebfffee4 	bl	f0008098 <enable_irqs>
f0008504:	e51b300c 	ldr	r3, [fp, #-12]
f0008508:	e5933024 	ldr	r3, [r3, #36]	; 0x24
f000850c:	e3530000 	cmp	r3, #0
f0008510:	1a000005 	bne	f000852c <do_irq+0xa4>
f0008514:	e59f0068 	ldr	r0, [pc, #104]	; f0008584 <do_irq+0xfc>
f0008518:	e59f1068 	ldr	r1, [pc, #104]	; f0008588 <do_irq+0x100>
f000851c:	e59f2068 	ldr	r2, [pc, #104]	; f000858c <do_irq+0x104>
f0008520:	e3a030a0 	mov	r3, #160	; 0xa0
f0008524:	eb003670 	bl	f0015eec <printk>
f0008528:	eafffffe 	b	f0008528 <do_irq+0xa0>
f000852c:	e51b300c 	ldr	r3, [fp, #-12]
f0008530:	e5933024 	ldr	r3, [r3, #36]	; 0x24
f0008534:	e51b000c 	ldr	r0, [fp, #-12]
f0008538:	e12fff33 	blx	r3
f000853c:	e1a03000 	mov	r3, r0
f0008540:	e3530000 	cmp	r3, #0
f0008544:	0a000008 	beq	f000856c <do_irq+0xe4>
f0008548:	e59f0044 	ldr	r0, [pc, #68]	; f0008594 <do_irq+0x10c>
f000854c:	e3a01000 	mov	r1, #0
f0008550:	eb003665 	bl	f0015eec <printk>
f0008554:	e59f0028 	ldr	r0, [pc, #40]	; f0008584 <do_irq+0xfc>
f0008558:	e59f1028 	ldr	r1, [pc, #40]	; f0008588 <do_irq+0x100>
f000855c:	e59f2028 	ldr	r2, [pc, #40]	; f000858c <do_irq+0x104>
f0008560:	e3a030a4 	mov	r3, #164	; 0xa4
f0008564:	eb003660 	bl	f0015eec <printk>
f0008568:	eafffffe 	b	f0008568 <do_irq+0xe0>
f000856c:	e51b3008 	ldr	r3, [fp, #-8]
f0008570:	e1a00003 	mov	r0, r3
f0008574:	ebfffee2 	bl	f0008104 <irq_enable>
f0008578:	e24bd004 	sub	sp, fp, #4
f000857c:	e8bd8800 	pop	{fp, pc}
f0008580:	f001e208 	.word	0xf001e208
f0008584:	f001e1cc 	.word	0xf001e1cc
f0008588:	f001e1f4 	.word	0xf001e1f4
f000858c:	f001e260 	.word	0xf001e260
f0008590:	f00200b8 	.word	0xf00200b8
f0008594:	f001e224 	.word	0xf001e224

f0008598 <link_init>:
f0008598:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f000859c:	e28db000 	add	fp, sp, #0
f00085a0:	e24dd00c 	sub	sp, sp, #12
f00085a4:	e50b0008 	str	r0, [fp, #-8]
f00085a8:	e51b3008 	ldr	r3, [fp, #-8]
f00085ac:	e51b2008 	ldr	r2, [fp, #-8]
f00085b0:	e5832000 	str	r2, [r3]
f00085b4:	e51b3008 	ldr	r3, [fp, #-8]
f00085b8:	e51b2008 	ldr	r2, [fp, #-8]
f00085bc:	e5832004 	str	r2, [r3, #4]
f00085c0:	e24bd000 	sub	sp, fp, #0
f00085c4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f00085c8:	e12fff1e 	bx	lr

f00085cc <list_insert>:
f00085cc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f00085d0:	e28db000 	add	fp, sp, #0
f00085d4:	e24dd014 	sub	sp, sp, #20
f00085d8:	e50b0010 	str	r0, [fp, #-16]
f00085dc:	e50b1014 	str	r1, [fp, #-20]
f00085e0:	e51b3014 	ldr	r3, [fp, #-20]
f00085e4:	e5933000 	ldr	r3, [r3]
f00085e8:	e50b3008 	str	r3, [fp, #-8]
f00085ec:	e51b3010 	ldr	r3, [fp, #-16]
f00085f0:	e51b2008 	ldr	r2, [fp, #-8]
f00085f4:	e5832000 	str	r2, [r3]
f00085f8:	e51b3008 	ldr	r3, [fp, #-8]
f00085fc:	e51b2010 	ldr	r2, [fp, #-16]
f0008600:	e5832004 	str	r2, [r3, #4]
f0008604:	e51b3014 	ldr	r3, [fp, #-20]
f0008608:	e51b2010 	ldr	r2, [fp, #-16]
f000860c:	e5832000 	str	r2, [r3]
f0008610:	e51b3010 	ldr	r3, [fp, #-16]
f0008614:	e51b2014 	ldr	r2, [fp, #-20]
f0008618:	e5832004 	str	r2, [r3, #4]
f000861c:	e24bd000 	sub	sp, fp, #0
f0008620:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0008624:	e12fff1e 	bx	lr

f0008628 <list_insert_tail>:
f0008628:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f000862c:	e28db000 	add	fp, sp, #0
f0008630:	e24dd014 	sub	sp, sp, #20
f0008634:	e50b0010 	str	r0, [fp, #-16]
f0008638:	e50b1014 	str	r1, [fp, #-20]
f000863c:	e51b3014 	ldr	r3, [fp, #-20]
f0008640:	e5933004 	ldr	r3, [r3, #4]
f0008644:	e50b3008 	str	r3, [fp, #-8]
f0008648:	e51b3010 	ldr	r3, [fp, #-16]
f000864c:	e51b2014 	ldr	r2, [fp, #-20]
f0008650:	e5832000 	str	r2, [r3]
f0008654:	e51b3014 	ldr	r3, [fp, #-20]
f0008658:	e51b2010 	ldr	r2, [fp, #-16]
f000865c:	e5832004 	str	r2, [r3, #4]
f0008660:	e51b3010 	ldr	r3, [fp, #-16]
f0008664:	e51b2008 	ldr	r2, [fp, #-8]
f0008668:	e5832004 	str	r2, [r3, #4]
f000866c:	e51b3008 	ldr	r3, [fp, #-8]
f0008670:	e51b2010 	ldr	r2, [fp, #-16]
f0008674:	e5832000 	str	r2, [r3]
f0008678:	e24bd000 	sub	sp, fp, #0
f000867c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0008680:	e12fff1e 	bx	lr

f0008684 <list_remove_init>:
f0008684:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f0008688:	e28db000 	add	fp, sp, #0
f000868c:	e24dd014 	sub	sp, sp, #20
f0008690:	e50b0010 	str	r0, [fp, #-16]
f0008694:	e51b3010 	ldr	r3, [fp, #-16]
f0008698:	e5933004 	ldr	r3, [r3, #4]
f000869c:	e50b3008 	str	r3, [fp, #-8]
f00086a0:	e51b3010 	ldr	r3, [fp, #-16]
f00086a4:	e5933000 	ldr	r3, [r3]
f00086a8:	e50b300c 	str	r3, [fp, #-12]
f00086ac:	e51b3008 	ldr	r3, [fp, #-8]
f00086b0:	e51b200c 	ldr	r2, [fp, #-12]
f00086b4:	e5832000 	str	r2, [r3]
f00086b8:	e51b300c 	ldr	r3, [fp, #-12]
f00086bc:	e51b2008 	ldr	r2, [fp, #-8]
f00086c0:	e5832004 	str	r2, [r3, #4]
f00086c4:	e51b3010 	ldr	r3, [fp, #-16]
f00086c8:	e51b2010 	ldr	r2, [fp, #-16]
f00086cc:	e5832000 	str	r2, [r3]
f00086d0:	e51b3010 	ldr	r3, [fp, #-16]
f00086d4:	e51b2010 	ldr	r2, [fp, #-16]
f00086d8:	e5832004 	str	r2, [r3, #4]
f00086dc:	e24bd000 	sub	sp, fp, #0
f00086e0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f00086e4:	e12fff1e 	bx	lr

f00086e8 <list_empty>:
f00086e8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f00086ec:	e28db000 	add	fp, sp, #0
f00086f0:	e24dd00c 	sub	sp, sp, #12
f00086f4:	e50b0008 	str	r0, [fp, #-8]
f00086f8:	e51b3008 	ldr	r3, [fp, #-8]
f00086fc:	e5932004 	ldr	r2, [r3, #4]
f0008700:	e51b3008 	ldr	r3, [fp, #-8]
f0008704:	e1520003 	cmp	r2, r3
f0008708:	1a000006 	bne	f0008728 <list_empty+0x40>
f000870c:	e51b3008 	ldr	r3, [fp, #-8]
f0008710:	e5932000 	ldr	r2, [r3]
f0008714:	e51b3008 	ldr	r3, [fp, #-8]
f0008718:	e1520003 	cmp	r2, r3
f000871c:	1a000001 	bne	f0008728 <list_empty+0x40>
f0008720:	e3a03001 	mov	r3, #1
f0008724:	ea000000 	b	f000872c <list_empty+0x44>
f0008728:	e3a03000 	mov	r3, #0
f000872c:	e1a00003 	mov	r0, r3
f0008730:	e24bd000 	sub	sp, fp, #0
f0008734:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0008738:	e12fff1e 	bx	lr

f000873c <disable_irqs>:
f000873c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f0008740:	e28db000 	add	fp, sp, #0
f0008744:	e10f0000 	mrs	r0, CPSR
f0008748:	e3800080 	orr	r0, r0, #128	; 0x80
f000874c:	e129f000 	msr	CPSR_fc, r0
f0008750:	e24bd000 	sub	sp, fp, #0
f0008754:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0008758:	e12fff1e 	bx	lr

f000875c <spin_lock_init>:
f000875c:	e92d4800 	push	{fp, lr}
f0008760:	e28db004 	add	fp, sp, #4
f0008764:	e24dd008 	sub	sp, sp, #8
f0008768:	e50b0008 	str	r0, [fp, #-8]
f000876c:	e51b0008 	ldr	r0, [fp, #-8]
f0008770:	e3a01000 	mov	r1, #0
f0008774:	e3a02004 	mov	r2, #4
f0008778:	eb003606 	bl	f0015f98 <memset>
f000877c:	e24bd004 	sub	sp, fp, #4
f0008780:	e8bd8800 	pop	{fp, pc}

f0008784 <spin_lock>:
f0008784:	e92d4800 	push	{fp, lr}
f0008788:	e28db004 	add	fp, sp, #4
f000878c:	e24dd008 	sub	sp, sp, #8
f0008790:	e50b0008 	str	r0, [fp, #-8]
f0008794:	eb00007c 	bl	f000898c <preempt_disable>
f0008798:	e24bd004 	sub	sp, fp, #4
f000879c:	e8bd8800 	pop	{fp, pc}

f00087a0 <spin_unlock>:
f00087a0:	e92d4800 	push	{fp, lr}
f00087a4:	e28db004 	add	fp, sp, #4
f00087a8:	e24dd008 	sub	sp, sp, #8
f00087ac:	e50b0008 	str	r0, [fp, #-8]
f00087b0:	eb000064 	bl	f0008948 <preempt_enable>
f00087b4:	e24bd004 	sub	sp, fp, #4
f00087b8:	e8bd8800 	pop	{fp, pc}

f00087bc <spin_lock_irq>:
f00087bc:	e92d4800 	push	{fp, lr}
f00087c0:	e28db004 	add	fp, sp, #4
f00087c4:	e24dd008 	sub	sp, sp, #8
f00087c8:	e50b0008 	str	r0, [fp, #-8]
f00087cc:	e50b100c 	str	r1, [fp, #-12]
f00087d0:	e51b000c 	ldr	r0, [fp, #-12]
f00087d4:	eb0030f8 	bl	f0014bbc <irq_local_disable_save>
f00087d8:	e24bd004 	sub	sp, fp, #4
f00087dc:	e8bd8800 	pop	{fp, pc}

f00087e0 <spin_unlock_irq>:
f00087e0:	e92d4800 	push	{fp, lr}
f00087e4:	e28db004 	add	fp, sp, #4
f00087e8:	e24dd008 	sub	sp, sp, #8
f00087ec:	e50b0008 	str	r0, [fp, #-8]
f00087f0:	e50b100c 	str	r1, [fp, #-12]
f00087f4:	e51b000c 	ldr	r0, [fp, #-12]
f00087f8:	eb0030fe 	bl	f0014bf8 <irq_local_restore>
f00087fc:	e24bd004 	sub	sp, fp, #4
f0008800:	e8bd8800 	pop	{fp, pc}

f0008804 <current_task>:
f0008804:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f0008808:	e28db000 	add	fp, sp, #0
f000880c:	e1a0300d 	mov	r3, sp
f0008810:	e3c33eff 	bic	r3, r3, #4080	; 0xff0
f0008814:	e3c3300f 	bic	r3, r3, #15
f0008818:	e1a00003 	mov	r0, r3
f000881c:	e24bd000 	sub	sp, fp, #0
f0008820:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0008824:	e12fff1e 	bx	lr

f0008828 <system_account_context_switch>:
f0008828:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f000882c:	e28db000 	add	fp, sp, #0
f0008830:	e24bd000 	sub	sp, fp, #0
f0008834:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0008838:	e12fff1e 	bx	lr

f000883c <sched_lock_runqueues>:
f000883c:	e92d4800 	push	{fp, lr}
f0008840:	e28db004 	add	fp, sp, #4
f0008844:	e24dd008 	sub	sp, sp, #8
f0008848:	e50b0008 	str	r0, [fp, #-8]
f000884c:	e50b100c 	str	r1, [fp, #-12]
f0008850:	e51b3008 	ldr	r3, [fp, #-8]
f0008854:	e283300c 	add	r3, r3, #12
f0008858:	e1a00003 	mov	r0, r3
f000885c:	e51b100c 	ldr	r1, [fp, #-12]
f0008860:	ebffffd5 	bl	f00087bc <spin_lock_irq>
f0008864:	e51b3008 	ldr	r3, [fp, #-8]
f0008868:	e2833020 	add	r3, r3, #32
f000886c:	e1a00003 	mov	r0, r3
f0008870:	ebffffc3 	bl	f0008784 <spin_lock>
f0008874:	eb0030e8 	bl	f0014c1c <irqs_enabled>
f0008878:	e1a03000 	mov	r3, r0
f000887c:	e3530000 	cmp	r3, #0
f0008880:	0a000005 	beq	f000889c <sched_lock_runqueues+0x60>
f0008884:	e59f0018 	ldr	r0, [pc, #24]	; f00088a4 <sched_lock_runqueues+0x68>
f0008888:	e59f1018 	ldr	r1, [pc, #24]	; f00088a8 <sched_lock_runqueues+0x6c>
f000888c:	e59f2018 	ldr	r2, [pc, #24]	; f00088ac <sched_lock_runqueues+0x70>
f0008890:	e3a0302c 	mov	r3, #44	; 0x2c
f0008894:	eb003594 	bl	f0015eec <printk>
f0008898:	eafffffe 	b	f0008898 <sched_lock_runqueues+0x5c>
f000889c:	e24bd004 	sub	sp, fp, #4
f00088a0:	e8bd8800 	pop	{fp, pc}
f00088a4:	f001e268 	.word	0xf001e268
f00088a8:	f001e290 	.word	0xf001e290
f00088ac:	f001e2a8 	.word	0xf001e2a8

f00088b0 <sched_unlock_runqueues>:
f00088b0:	e92d4800 	push	{fp, lr}
f00088b4:	e28db004 	add	fp, sp, #4
f00088b8:	e24dd008 	sub	sp, sp, #8
f00088bc:	e50b0008 	str	r0, [fp, #-8]
f00088c0:	e50b100c 	str	r1, [fp, #-12]
f00088c4:	e51b3008 	ldr	r3, [fp, #-8]
f00088c8:	e2833020 	add	r3, r3, #32
f00088cc:	e1a00003 	mov	r0, r3
f00088d0:	ebffffb2 	bl	f00087a0 <spin_unlock>
f00088d4:	e51b3008 	ldr	r3, [fp, #-8]
f00088d8:	e283300c 	add	r3, r3, #12
f00088dc:	e1a00003 	mov	r0, r3
f00088e0:	e51b100c 	ldr	r1, [fp, #-12]
f00088e4:	ebffffbd 	bl	f00087e0 <spin_unlock_irq>
f00088e8:	e24bd004 	sub	sp, fp, #4
f00088ec:	e8bd8800 	pop	{fp, pc}

f00088f0 <preemptive>:
f00088f0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f00088f4:	e28db000 	add	fp, sp, #0
f00088f8:	e59f3020 	ldr	r3, [pc, #32]	; f0008920 <preemptive+0x30>
f00088fc:	e5933000 	ldr	r3, [r3]
f0008900:	e3530000 	cmp	r3, #0
f0008904:	13a03000 	movne	r3, #0
f0008908:	03a03001 	moveq	r3, #1
f000890c:	e20330ff 	and	r3, r3, #255	; 0xff
f0008910:	e1a00003 	mov	r0, r3
f0008914:	e24bd000 	sub	sp, fp, #0
f0008918:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f000891c:	e12fff1e 	bx	lr
f0008920:	f002433c 	.word	0xf002433c

f0008924 <preempt_count>:
f0008924:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f0008928:	e28db000 	add	fp, sp, #0
f000892c:	e59f3010 	ldr	r3, [pc, #16]	; f0008944 <preempt_count+0x20>
f0008930:	e5933000 	ldr	r3, [r3]
f0008934:	e1a00003 	mov	r0, r3
f0008938:	e24bd000 	sub	sp, fp, #0
f000893c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0008940:	e12fff1e 	bx	lr
f0008944:	f002433c 	.word	0xf002433c

f0008948 <preempt_enable>:
f0008948:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f000894c:	e28db000 	add	fp, sp, #0
f0008950:	e59f302c 	ldr	r3, [pc, #44]	; f0008984 <preempt_enable+0x3c>
f0008954:	e5933000 	ldr	r3, [r3]
f0008958:	e2432001 	sub	r2, r3, #1
f000895c:	e59f3020 	ldr	r3, [pc, #32]	; f0008984 <preempt_enable+0x3c>
f0008960:	e5832000 	str	r2, [r3]
f0008964:	e59f301c 	ldr	r3, [pc, #28]	; f0008988 <preempt_enable+0x40>
f0008968:	e5933000 	ldr	r3, [r3]
f000896c:	e2432001 	sub	r2, r3, #1
f0008970:	e59f3010 	ldr	r3, [pc, #16]	; f0008988 <preempt_enable+0x40>
f0008974:	e5832000 	str	r2, [r3]
f0008978:	e24bd000 	sub	sp, fp, #0
f000897c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0008980:	e12fff1e 	bx	lr
f0008984:	f002d000 	.word	0xf002d000
f0008988:	f002433c 	.word	0xf002433c

f000898c <preempt_disable>:
f000898c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f0008990:	e28db000 	add	fp, sp, #0
f0008994:	e59f302c 	ldr	r3, [pc, #44]	; f00089c8 <preempt_disable+0x3c>
f0008998:	e5933000 	ldr	r3, [r3]
f000899c:	e2832001 	add	r2, r3, #1
f00089a0:	e59f3020 	ldr	r3, [pc, #32]	; f00089c8 <preempt_disable+0x3c>
f00089a4:	e5832000 	str	r2, [r3]
f00089a8:	e59f301c 	ldr	r3, [pc, #28]	; f00089cc <preempt_disable+0x40>
f00089ac:	e5933000 	ldr	r3, [r3]
f00089b0:	e2832001 	add	r2, r3, #1
f00089b4:	e59f3010 	ldr	r3, [pc, #16]	; f00089cc <preempt_disable+0x40>
f00089b8:	e5832000 	str	r2, [r3]
f00089bc:	e24bd000 	sub	sp, fp, #0
f00089c0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f00089c4:	e12fff1e 	bx	lr
f00089c8:	f002433c 	.word	0xf002433c
f00089cc:	f002d000 	.word	0xf002d000

f00089d0 <in_irq_context>:
f00089d0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f00089d4:	e28db000 	add	fp, sp, #0
f00089d8:	e59f3030 	ldr	r3, [pc, #48]	; f0008a10 <in_irq_context+0x40>
f00089dc:	e5933000 	ldr	r3, [r3]
f00089e0:	e2833001 	add	r3, r3, #1
f00089e4:	e1a02003 	mov	r2, r3
f00089e8:	e59f3024 	ldr	r3, [pc, #36]	; f0008a14 <in_irq_context+0x44>
f00089ec:	e5933000 	ldr	r3, [r3]
f00089f0:	e1520003 	cmp	r2, r3
f00089f4:	13a03000 	movne	r3, #0
f00089f8:	03a03001 	moveq	r3, #1
f00089fc:	e20330ff 	and	r3, r3, #255	; 0xff
f0008a00:	e1a00003 	mov	r0, r3
f0008a04:	e24bd000 	sub	sp, fp, #0
f0008a08:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0008a0c:	e12fff1e 	bx	lr
f0008a10:	f002d000 	.word	0xf002d000
f0008a14:	f002433c 	.word	0xf002433c

f0008a18 <in_nested_irq_context>:
f0008a18:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f0008a1c:	e28db000 	add	fp, sp, #0
f0008a20:	e59f302c 	ldr	r3, [pc, #44]	; f0008a54 <in_nested_irq_context+0x3c>
f0008a24:	e5932000 	ldr	r2, [r3]
f0008a28:	e59f3028 	ldr	r3, [pc, #40]	; f0008a58 <in_nested_irq_context+0x40>
f0008a2c:	e5933000 	ldr	r3, [r3]
f0008a30:	e0633002 	rsb	r3, r3, r2
f0008a34:	e3530001 	cmp	r3, #1
f0008a38:	93a03000 	movls	r3, #0
f0008a3c:	83a03001 	movhi	r3, #1
f0008a40:	e20330ff 	and	r3, r3, #255	; 0xff
f0008a44:	e1a00003 	mov	r0, r3
f0008a48:	e24bd000 	sub	sp, fp, #0
f0008a4c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0008a50:	e12fff1e 	bx	lr
f0008a54:	f002433c 	.word	0xf002433c
f0008a58:	f002d000 	.word	0xf002d000

f0008a5c <in_process_context>:
f0008a5c:	e92d4800 	push	{fp, lr}
f0008a60:	e28db004 	add	fp, sp, #4
f0008a64:	ebffffd9 	bl	f00089d0 <in_irq_context>
f0008a68:	e1a03000 	mov	r3, r0
f0008a6c:	e3530000 	cmp	r3, #0
f0008a70:	13a03000 	movne	r3, #0
f0008a74:	03a03001 	moveq	r3, #1
f0008a78:	e20330ff 	and	r3, r3, #255	; 0xff
f0008a7c:	e1a00003 	mov	r0, r3
f0008a80:	e8bd8800 	pop	{fp, pc}

f0008a84 <sched_init_runqueue>:
f0008a84:	e92d4800 	push	{fp, lr}
f0008a88:	e28db004 	add	fp, sp, #4
f0008a8c:	e24dd008 	sub	sp, sp, #8
f0008a90:	e50b0008 	str	r0, [fp, #-8]
f0008a94:	e50b100c 	str	r1, [fp, #-12]
f0008a98:	e51b300c 	ldr	r3, [fp, #-12]
f0008a9c:	e2833008 	add	r3, r3, #8
f0008aa0:	e1a00003 	mov	r0, r3
f0008aa4:	ebfffebb 	bl	f0008598 <link_init>
f0008aa8:	e51b300c 	ldr	r3, [fp, #-12]
f0008aac:	e2833004 	add	r3, r3, #4
f0008ab0:	e1a00003 	mov	r0, r3
f0008ab4:	ebffff28 	bl	f000875c <spin_lock_init>
f0008ab8:	e51b300c 	ldr	r3, [fp, #-12]
f0008abc:	e51b2008 	ldr	r2, [fp, #-8]
f0008ac0:	e5832000 	str	r2, [r3]
f0008ac4:	e24bd004 	sub	sp, fp, #4
f0008ac8:	e8bd8800 	pop	{fp, pc}

f0008acc <sched_init>:
f0008acc:	e92d4800 	push	{fp, lr}
f0008ad0:	e28db004 	add	fp, sp, #4
f0008ad4:	e24dd008 	sub	sp, sp, #8
f0008ad8:	e59f3094 	ldr	r3, [pc, #148]	; f0008b74 <sched_init+0xa8>
f0008adc:	e50b300c 	str	r3, [fp, #-12]
f0008ae0:	e3a03000 	mov	r3, #0
f0008ae4:	e50b3008 	str	r3, [fp, #-8]
f0008ae8:	ea00000d 	b	f0008b24 <sched_init+0x58>
f0008aec:	e51b2008 	ldr	r2, [fp, #-8]
f0008af0:	e1a03002 	mov	r3, r2
f0008af4:	e1a03103 	lsl	r3, r3, #2
f0008af8:	e0833002 	add	r3, r3, r2
f0008afc:	e1a03103 	lsl	r3, r3, #2
f0008b00:	e2833008 	add	r3, r3, #8
f0008b04:	e51b200c 	ldr	r2, [fp, #-12]
f0008b08:	e0823003 	add	r3, r2, r3
f0008b0c:	e51b000c 	ldr	r0, [fp, #-12]
f0008b10:	e1a01003 	mov	r1, r3
f0008b14:	ebffffda 	bl	f0008a84 <sched_init_runqueue>
f0008b18:	e51b3008 	ldr	r3, [fp, #-8]
f0008b1c:	e2833001 	add	r3, r3, #1
f0008b20:	e50b3008 	str	r3, [fp, #-8]
f0008b24:	e51b3008 	ldr	r3, [fp, #-8]
f0008b28:	e3530003 	cmp	r3, #3
f0008b2c:	daffffee 	ble	f0008aec <sched_init+0x20>
f0008b30:	e51b300c 	ldr	r3, [fp, #-12]
f0008b34:	e2832008 	add	r2, r3, #8
f0008b38:	e51b300c 	ldr	r3, [fp, #-12]
f0008b3c:	e5832058 	str	r2, [r3, #88]	; 0x58
f0008b40:	e51b300c 	ldr	r3, [fp, #-12]
f0008b44:	e283201c 	add	r2, r3, #28
f0008b48:	e51b300c 	ldr	r3, [fp, #-12]
f0008b4c:	e583205c 	str	r2, [r3, #92]	; 0x5c
f0008b50:	e51b300c 	ldr	r3, [fp, #-12]
f0008b54:	e3a0201e 	mov	r2, #30
f0008b58:	e5832064 	str	r2, [r3, #100]	; 0x64
f0008b5c:	ebffff28 	bl	f0008804 <current_task>
f0008b60:	e1a02000 	mov	r2, r0
f0008b64:	e51b300c 	ldr	r3, [fp, #-12]
f0008b68:	e5832060 	str	r2, [r3, #96]	; 0x60
f0008b6c:	e24bd004 	sub	sp, fp, #4
f0008b70:	e8bd8800 	pop	{fp, pc}
f0008b74:	f002d02c 	.word	0xf002d02c

f0008b78 <sched_rq_swap_queues>:
f0008b78:	e92d4800 	push	{fp, lr}
f0008b7c:	e28db004 	add	fp, sp, #4
f0008b80:	e24dd008 	sub	sp, sp, #8
f0008b84:	e59f3060 	ldr	r3, [pc, #96]	; f0008bec <sched_rq_swap_queues+0x74>
f0008b88:	e593305c 	ldr	r3, [r3, #92]	; 0x5c
f0008b8c:	e2833008 	add	r3, r3, #8
f0008b90:	e1a00003 	mov	r0, r3
f0008b94:	ebfffed3 	bl	f00086e8 <list_empty>
f0008b98:	e1a03000 	mov	r3, r0
f0008b9c:	e3530000 	cmp	r3, #0
f0008ba0:	0a000005 	beq	f0008bbc <sched_rq_swap_queues+0x44>
f0008ba4:	e59f0044 	ldr	r0, [pc, #68]	; f0008bf0 <sched_rq_swap_queues+0x78>
f0008ba8:	e59f1044 	ldr	r1, [pc, #68]	; f0008bf4 <sched_rq_swap_queues+0x7c>
f0008bac:	e59f2044 	ldr	r2, [pc, #68]	; f0008bf8 <sched_rq_swap_queues+0x80>
f0008bb0:	e3a03085 	mov	r3, #133	; 0x85
f0008bb4:	eb0034cc 	bl	f0015eec <printk>
f0008bb8:	eafffffe 	b	f0008bb8 <sched_rq_swap_queues+0x40>
f0008bbc:	e59f3028 	ldr	r3, [pc, #40]	; f0008bec <sched_rq_swap_queues+0x74>
f0008bc0:	e5933058 	ldr	r3, [r3, #88]	; 0x58
f0008bc4:	e50b3008 	str	r3, [fp, #-8]
f0008bc8:	e59f301c 	ldr	r3, [pc, #28]	; f0008bec <sched_rq_swap_queues+0x74>
f0008bcc:	e593205c 	ldr	r2, [r3, #92]	; 0x5c
f0008bd0:	e59f3014 	ldr	r3, [pc, #20]	; f0008bec <sched_rq_swap_queues+0x74>
f0008bd4:	e5832058 	str	r2, [r3, #88]	; 0x58
f0008bd8:	e59f300c 	ldr	r3, [pc, #12]	; f0008bec <sched_rq_swap_queues+0x74>
f0008bdc:	e51b2008 	ldr	r2, [fp, #-8]
f0008be0:	e583205c 	str	r2, [r3, #92]	; 0x5c
f0008be4:	e24bd004 	sub	sp, fp, #4
f0008be8:	e8bd8800 	pop	{fp, pc}
f0008bec:	f002d02c 	.word	0xf002d02c
f0008bf0:	f001e268 	.word	0xf001e268
f0008bf4:	f001e290 	.word	0xf001e290
f0008bf8:	f001e2c0 	.word	0xf001e2c0

f0008bfc <sched_rq_add_task>:
f0008bfc:	e92d4800 	push	{fp, lr}
f0008c00:	e28db004 	add	fp, sp, #4
f0008c04:	e24dd018 	sub	sp, sp, #24
f0008c08:	e50b0010 	str	r0, [fp, #-16]
f0008c0c:	e50b1014 	str	r1, [fp, #-20]
f0008c10:	e50b2018 	str	r2, [fp, #-24]
f0008c14:	e59f30c4 	ldr	r3, [pc, #196]	; f0008ce0 <sched_rq_add_task+0xe4>
f0008c18:	e50b3008 	str	r3, [fp, #-8]
f0008c1c:	e51b3010 	ldr	r3, [fp, #-16]
f0008c20:	e2833048 	add	r3, r3, #72	; 0x48
f0008c24:	e1a00003 	mov	r0, r3
f0008c28:	ebfffeae 	bl	f00086e8 <list_empty>
f0008c2c:	e1a03000 	mov	r3, r0
f0008c30:	e3530000 	cmp	r3, #0
f0008c34:	1a000005 	bne	f0008c50 <sched_rq_add_task+0x54>
f0008c38:	e59f00a4 	ldr	r0, [pc, #164]	; f0008ce4 <sched_rq_add_task+0xe8>
f0008c3c:	e59f10a4 	ldr	r1, [pc, #164]	; f0008ce8 <sched_rq_add_task+0xec>
f0008c40:	e59f20a4 	ldr	r2, [pc, #164]	; f0008cec <sched_rq_add_task+0xf0>
f0008c44:	e3a03098 	mov	r3, #152	; 0x98
f0008c48:	eb0034a7 	bl	f0015eec <printk>
f0008c4c:	eafffffe 	b	f0008c4c <sched_rq_add_task+0x50>
f0008c50:	e24b300c 	sub	r3, fp, #12
f0008c54:	e51b0008 	ldr	r0, [fp, #-8]
f0008c58:	e1a01003 	mov	r1, r3
f0008c5c:	ebfffef6 	bl	f000883c <sched_lock_runqueues>
f0008c60:	e51b3018 	ldr	r3, [fp, #-24]
f0008c64:	e3530000 	cmp	r3, #0
f0008c68:	0a000007 	beq	f0008c8c <sched_rq_add_task+0x90>
f0008c6c:	e51b3010 	ldr	r3, [fp, #-16]
f0008c70:	e2832048 	add	r2, r3, #72	; 0x48
f0008c74:	e51b3014 	ldr	r3, [fp, #-20]
f0008c78:	e2833008 	add	r3, r3, #8
f0008c7c:	e1a00002 	mov	r0, r2
f0008c80:	e1a01003 	mov	r1, r3
f0008c84:	ebfffe50 	bl	f00085cc <list_insert>
f0008c88:	ea000006 	b	f0008ca8 <sched_rq_add_task+0xac>
f0008c8c:	e51b3010 	ldr	r3, [fp, #-16]
f0008c90:	e2832048 	add	r2, r3, #72	; 0x48
f0008c94:	e51b3014 	ldr	r3, [fp, #-20]
f0008c98:	e2833008 	add	r3, r3, #8
f0008c9c:	e1a00002 	mov	r0, r2
f0008ca0:	e1a01003 	mov	r1, r3
f0008ca4:	ebfffe5f 	bl	f0008628 <list_insert_tail>
f0008ca8:	e51b3014 	ldr	r3, [fp, #-20]
f0008cac:	e5933010 	ldr	r3, [r3, #16]
f0008cb0:	e2832001 	add	r2, r3, #1
f0008cb4:	e51b3014 	ldr	r3, [fp, #-20]
f0008cb8:	e5832010 	str	r2, [r3, #16]
f0008cbc:	e51b3010 	ldr	r3, [fp, #-16]
f0008cc0:	e51b2014 	ldr	r2, [fp, #-20]
f0008cc4:	e5832050 	str	r2, [r3, #80]	; 0x50
f0008cc8:	e51b300c 	ldr	r3, [fp, #-12]
f0008ccc:	e51b0008 	ldr	r0, [fp, #-8]
f0008cd0:	e1a01003 	mov	r1, r3
f0008cd4:	ebfffef5 	bl	f00088b0 <sched_unlock_runqueues>
f0008cd8:	e24bd004 	sub	sp, fp, #4
f0008cdc:	e8bd8800 	pop	{fp, pc}
f0008ce0:	f002d02c 	.word	0xf002d02c
f0008ce4:	f001e268 	.word	0xf001e268
f0008ce8:	f001e290 	.word	0xf001e290
f0008cec:	f001e2d8 	.word	0xf001e2d8

f0008cf0 <sched_rq_remove_task>:
f0008cf0:	e92d4800 	push	{fp, lr}
f0008cf4:	e28db004 	add	fp, sp, #4
f0008cf8:	e24dd010 	sub	sp, sp, #16
f0008cfc:	e50b0010 	str	r0, [fp, #-16]
f0008d00:	e59f308c 	ldr	r3, [pc, #140]	; f0008d94 <sched_rq_remove_task+0xa4>
f0008d04:	e50b3008 	str	r3, [fp, #-8]
f0008d08:	e24b300c 	sub	r3, fp, #12
f0008d0c:	e51b0008 	ldr	r0, [fp, #-8]
f0008d10:	e1a01003 	mov	r1, r3
f0008d14:	ebfffec8 	bl	f000883c <sched_lock_runqueues>
f0008d18:	e51b3010 	ldr	r3, [fp, #-16]
f0008d1c:	e2833048 	add	r3, r3, #72	; 0x48
f0008d20:	e1a00003 	mov	r0, r3
f0008d24:	ebfffe6f 	bl	f00086e8 <list_empty>
f0008d28:	e1a03000 	mov	r3, r0
f0008d2c:	e3530000 	cmp	r3, #0
f0008d30:	0a000005 	beq	f0008d4c <sched_rq_remove_task+0x5c>
f0008d34:	e59f005c 	ldr	r0, [pc, #92]	; f0008d98 <sched_rq_remove_task+0xa8>
f0008d38:	e59f105c 	ldr	r1, [pc, #92]	; f0008d9c <sched_rq_remove_task+0xac>
f0008d3c:	e59f205c 	ldr	r2, [pc, #92]	; f0008da0 <sched_rq_remove_task+0xb0>
f0008d40:	e3a030b4 	mov	r3, #180	; 0xb4
f0008d44:	eb003468 	bl	f0015eec <printk>
f0008d48:	eafffffe 	b	f0008d48 <sched_rq_remove_task+0x58>
f0008d4c:	e51b3010 	ldr	r3, [fp, #-16]
f0008d50:	e2833048 	add	r3, r3, #72	; 0x48
f0008d54:	e1a00003 	mov	r0, r3
f0008d58:	ebfffe49 	bl	f0008684 <list_remove_init>
f0008d5c:	e51b3010 	ldr	r3, [fp, #-16]
f0008d60:	e5933050 	ldr	r3, [r3, #80]	; 0x50
f0008d64:	e5932010 	ldr	r2, [r3, #16]
f0008d68:	e2422001 	sub	r2, r2, #1
f0008d6c:	e5832010 	str	r2, [r3, #16]
f0008d70:	e51b3010 	ldr	r3, [fp, #-16]
f0008d74:	e3a02000 	mov	r2, #0
f0008d78:	e5832050 	str	r2, [r3, #80]	; 0x50
f0008d7c:	e51b300c 	ldr	r3, [fp, #-12]
f0008d80:	e51b0008 	ldr	r0, [fp, #-8]
f0008d84:	e1a01003 	mov	r1, r3
f0008d88:	ebfffec8 	bl	f00088b0 <sched_unlock_runqueues>
f0008d8c:	e24bd004 	sub	sp, fp, #4
f0008d90:	e8bd8800 	pop	{fp, pc}
f0008d94:	f002d02c 	.word	0xf002d02c
f0008d98:	f001e268 	.word	0xf001e268
f0008d9c:	f001e290 	.word	0xf001e290
f0008da0:	f001e300 	.word	0xf001e300

f0008da4 <sched_init_task>:
f0008da4:	e92d4800 	push	{fp, lr}
f0008da8:	e28db004 	add	fp, sp, #4
f0008dac:	e24dd008 	sub	sp, sp, #8
f0008db0:	e50b0008 	str	r0, [fp, #-8]
f0008db4:	e50b100c 	str	r1, [fp, #-12]
f0008db8:	e51b3008 	ldr	r3, [fp, #-8]
f0008dbc:	e2833048 	add	r3, r3, #72	; 0x48
f0008dc0:	e1a00003 	mov	r0, r3
f0008dc4:	ebfffdf3 	bl	f0008598 <link_init>
f0008dc8:	e51b3008 	ldr	r3, [fp, #-8]
f0008dcc:	e51b200c 	ldr	r2, [fp, #-12]
f0008dd0:	e58320a8 	str	r2, [r3, #168]	; 0xa8
f0008dd4:	e51b3008 	ldr	r3, [fp, #-8]
f0008dd8:	e3a02000 	mov	r2, #0
f0008ddc:	e583209c 	str	r2, [r3, #156]	; 0x9c
f0008de0:	e51b3008 	ldr	r3, [fp, #-8]
f0008de4:	e3a02000 	mov	r2, #0
f0008de8:	e5c32084 	strb	r2, [r3, #132]	; 0x84
f0008dec:	e51b3008 	ldr	r3, [fp, #-8]
f0008df0:	e3a02000 	mov	r2, #0
f0008df4:	e5832080 	str	r2, [r3, #128]	; 0x80
f0008df8:	e51b3008 	ldr	r3, [fp, #-8]
f0008dfc:	e5933060 	ldr	r3, [r3, #96]	; 0x60
f0008e00:	e3832004 	orr	r2, r3, #4
f0008e04:	e51b3008 	ldr	r3, [fp, #-8]
f0008e08:	e5832060 	str	r2, [r3, #96]	; 0x60
f0008e0c:	e24bd004 	sub	sp, fp, #4
f0008e10:	e8bd8800 	pop	{fp, pc}

f0008e14 <sched_resume_sync>:
f0008e14:	e92d4800 	push	{fp, lr}
f0008e18:	e28db004 	add	fp, sp, #4
f0008e1c:	e24dd008 	sub	sp, sp, #8
f0008e20:	e50b0008 	str	r0, [fp, #-8]
f0008e24:	ebfffe76 	bl	f0008804 <current_task>
f0008e28:	e1a02000 	mov	r2, r0
f0008e2c:	e51b3008 	ldr	r3, [fp, #-8]
f0008e30:	e1520003 	cmp	r2, r3
f0008e34:	1a000005 	bne	f0008e50 <sched_resume_sync+0x3c>
f0008e38:	e59f0040 	ldr	r0, [pc, #64]	; f0008e80 <sched_resume_sync+0x6c>
f0008e3c:	e59f1040 	ldr	r1, [pc, #64]	; f0008e84 <sched_resume_sync+0x70>
f0008e40:	e59f2040 	ldr	r2, [pc, #64]	; f0008e88 <sched_resume_sync+0x74>
f0008e44:	e3a030cb 	mov	r3, #203	; 0xcb
f0008e48:	eb003427 	bl	f0015eec <printk>
f0008e4c:	eafffffe 	b	f0008e4c <sched_resume_sync+0x38>
f0008e50:	e51b3008 	ldr	r3, [fp, #-8]
f0008e54:	e3a02002 	mov	r2, #2
f0008e58:	e5c32084 	strb	r2, [r3, #132]	; 0x84
f0008e5c:	e59f3028 	ldr	r3, [pc, #40]	; f0008e8c <sched_resume_sync+0x78>
f0008e60:	e5933058 	ldr	r3, [r3, #88]	; 0x58
f0008e64:	e51b0008 	ldr	r0, [fp, #-8]
f0008e68:	e1a01003 	mov	r1, r3
f0008e6c:	e3a02001 	mov	r2, #1
f0008e70:	ebffff61 	bl	f0008bfc <sched_rq_add_task>
f0008e74:	eb00014e 	bl	f00093b4 <schedule>
f0008e78:	e24bd004 	sub	sp, fp, #4
f0008e7c:	e8bd8800 	pop	{fp, pc}
f0008e80:	f001e268 	.word	0xf001e268
f0008e84:	f001e290 	.word	0xf001e290
f0008e88:	f001e2ec 	.word	0xf001e2ec
f0008e8c:	f002d02c 	.word	0xf002d02c

f0008e90 <sched_resume_async>:
f0008e90:	e92d4800 	push	{fp, lr}
f0008e94:	e28db004 	add	fp, sp, #4
f0008e98:	e24dd008 	sub	sp, sp, #8
f0008e9c:	e50b0008 	str	r0, [fp, #-8]
f0008ea0:	e51b3008 	ldr	r3, [fp, #-8]
f0008ea4:	e3a02002 	mov	r2, #2
f0008ea8:	e5c32084 	strb	r2, [r3, #132]	; 0x84
f0008eac:	e59f3018 	ldr	r3, [pc, #24]	; f0008ecc <sched_resume_async+0x3c>
f0008eb0:	e5933058 	ldr	r3, [r3, #88]	; 0x58
f0008eb4:	e51b0008 	ldr	r0, [fp, #-8]
f0008eb8:	e1a01003 	mov	r1, r3
f0008ebc:	e3a02001 	mov	r2, #1
f0008ec0:	ebffff4d 	bl	f0008bfc <sched_rq_add_task>
f0008ec4:	e24bd004 	sub	sp, fp, #4
f0008ec8:	e8bd8800 	pop	{fp, pc}
f0008ecc:	f002d02c 	.word	0xf002d02c

f0008ed0 <sched_prepare_sleep>:
f0008ed0:	e92d4800 	push	{fp, lr}
f0008ed4:	e28db004 	add	fp, sp, #4
f0008ed8:	ebfffeab 	bl	f000898c <preempt_disable>
f0008edc:	ebfffe48 	bl	f0008804 <current_task>
f0008ee0:	e1a03000 	mov	r3, r0
f0008ee4:	e1a00003 	mov	r0, r3
f0008ee8:	ebffff80 	bl	f0008cf0 <sched_rq_remove_task>
f0008eec:	ebfffe44 	bl	f0008804 <current_task>
f0008ef0:	e1a03000 	mov	r3, r0
f0008ef4:	e3a02001 	mov	r2, #1
f0008ef8:	e5c32084 	strb	r2, [r3, #132]	; 0x84
f0008efc:	ebfffe91 	bl	f0008948 <preempt_enable>
f0008f00:	e8bd8800 	pop	{fp, pc}

f0008f04 <sched_suspend_sync>:
f0008f04:	e92d4818 	push	{r3, r4, fp, lr}
f0008f08:	e28db00c 	add	fp, sp, #12
f0008f0c:	ebfffe9e 	bl	f000898c <preempt_disable>
f0008f10:	ebfffe3b 	bl	f0008804 <current_task>
f0008f14:	e1a03000 	mov	r3, r0
f0008f18:	e1a00003 	mov	r0, r3
f0008f1c:	ebffff73 	bl	f0008cf0 <sched_rq_remove_task>
f0008f20:	ebfffe37 	bl	f0008804 <current_task>
f0008f24:	e1a03000 	mov	r3, r0
f0008f28:	e3a02000 	mov	r2, #0
f0008f2c:	e5c32084 	strb	r2, [r3, #132]	; 0x84
f0008f30:	ebfffe33 	bl	f0008804 <current_task>
f0008f34:	e1a03000 	mov	r3, r0
f0008f38:	e5932060 	ldr	r2, [r3, #96]	; 0x60
f0008f3c:	e3c22002 	bic	r2, r2, #2
f0008f40:	e5832060 	str	r2, [r3, #96]	; 0x60
f0008f44:	ebfffe2e 	bl	f0008804 <current_task>
f0008f48:	e1a03000 	mov	r3, r0
f0008f4c:	e59340bc 	ldr	r4, [r3, #188]	; 0xbc
f0008f50:	ebfffe2b 	bl	f0008804 <current_task>
f0008f54:	e1a03000 	mov	r3, r0
f0008f58:	e1540003 	cmp	r4, r3
f0008f5c:	0a000005 	beq	f0008f78 <sched_suspend_sync+0x74>
f0008f60:	ebfffe27 	bl	f0008804 <current_task>
f0008f64:	e1a03000 	mov	r3, r0
f0008f68:	e28330f8 	add	r3, r3, #248	; 0xf8
f0008f6c:	e1a00003 	mov	r0, r3
f0008f70:	e3a01000 	mov	r1, #0
f0008f74:	eb003697 	bl	f00169d8 <wake_up>
f0008f78:	ebfffe72 	bl	f0008948 <preempt_enable>
f0008f7c:	eb00010c 	bl	f00093b4 <schedule>
f0008f80:	e8bd8818 	pop	{r3, r4, fp, pc}

f0008f84 <sched_suspend_async>:
f0008f84:	e92d4818 	push	{r3, r4, fp, lr}
f0008f88:	e28db00c 	add	fp, sp, #12
f0008f8c:	ebfffe7e 	bl	f000898c <preempt_disable>
f0008f90:	ebfffe1b 	bl	f0008804 <current_task>
f0008f94:	e1a03000 	mov	r3, r0
f0008f98:	e1a00003 	mov	r0, r3
f0008f9c:	ebffff53 	bl	f0008cf0 <sched_rq_remove_task>
f0008fa0:	ebfffe17 	bl	f0008804 <current_task>
f0008fa4:	e1a03000 	mov	r3, r0
f0008fa8:	e3a02000 	mov	r2, #0
f0008fac:	e5c32084 	strb	r2, [r3, #132]	; 0x84
f0008fb0:	ebfffe13 	bl	f0008804 <current_task>
f0008fb4:	e1a03000 	mov	r3, r0
f0008fb8:	e5932060 	ldr	r2, [r3, #96]	; 0x60
f0008fbc:	e3c22002 	bic	r2, r2, #2
f0008fc0:	e5832060 	str	r2, [r3, #96]	; 0x60
f0008fc4:	ebfffe0e 	bl	f0008804 <current_task>
f0008fc8:	e1a03000 	mov	r3, r0
f0008fcc:	e59340bc 	ldr	r4, [r3, #188]	; 0xbc
f0008fd0:	ebfffe0b 	bl	f0008804 <current_task>
f0008fd4:	e1a03000 	mov	r3, r0
f0008fd8:	e1540003 	cmp	r4, r3
f0008fdc:	0a000005 	beq	f0008ff8 <sched_suspend_async+0x74>
f0008fe0:	ebfffe07 	bl	f0008804 <current_task>
f0008fe4:	e1a03000 	mov	r3, r0
f0008fe8:	e28330f8 	add	r3, r3, #248	; 0xf8
f0008fec:	e1a00003 	mov	r0, r3
f0008ff0:	e3a01000 	mov	r1, #0
f0008ff4:	eb003677 	bl	f00169d8 <wake_up>
f0008ff8:	ebfffe52 	bl	f0008948 <preempt_enable>
f0008ffc:	ebfffe00 	bl	f0008804 <current_task>
f0009000:	e1a03000 	mov	r3, r0
f0009004:	e3a02001 	mov	r2, #1
f0009008:	e5832080 	str	r2, [r3, #128]	; 0x80
f000900c:	e8bd8818 	pop	{r3, r4, fp, pc}

f0009010 <context_switch>:
f0009010:	e92d4800 	push	{fp, lr}
f0009014:	e28db004 	add	fp, sp, #4
f0009018:	e24dd010 	sub	sp, sp, #16
f000901c:	e50b0010 	str	r0, [fp, #-16]
f0009020:	ebfffdf7 	bl	f0008804 <current_task>
f0009024:	e50b0008 	str	r0, [fp, #-8]
f0009028:	ebfffdfe 	bl	f0008828 <system_account_context_switch>
f000902c:	ebfffdf4 	bl	f0008804 <current_task>
f0009030:	e1a03000 	mov	r3, r0
f0009034:	e3530000 	cmp	r3, #0
f0009038:	1a000005 	bne	f0009054 <context_switch+0x44>
f000903c:	e59f00f8 	ldr	r0, [pc, #248]	; f000913c <context_switch+0x12c>
f0009040:	e59f10f8 	ldr	r1, [pc, #248]	; f0009140 <context_switch+0x130>
f0009044:	e59f20f8 	ldr	r2, [pc, #248]	; f0009144 <context_switch+0x134>
f0009048:	e3a03f47 	mov	r3, #284	; 0x11c
f000904c:	eb0033a6 	bl	f0015eec <printk>
f0009050:	eafffffe 	b	f0009050 <context_switch+0x40>
f0009054:	ebfffdea 	bl	f0008804 <current_task>
f0009058:	e1a03000 	mov	r3, r0
f000905c:	e59330b4 	ldr	r3, [r3, #180]	; 0xb4
f0009060:	e3530000 	cmp	r3, #0
f0009064:	1a000005 	bne	f0009080 <context_switch+0x70>
f0009068:	e59f00cc 	ldr	r0, [pc, #204]	; f000913c <context_switch+0x12c>
f000906c:	e59f10cc 	ldr	r1, [pc, #204]	; f0009140 <context_switch+0x130>
f0009070:	e59f20cc 	ldr	r2, [pc, #204]	; f0009144 <context_switch+0x134>
f0009074:	e59f30cc 	ldr	r3, [pc, #204]	; f0009148 <context_switch+0x138>
f0009078:	eb00339b 	bl	f0015eec <printk>
f000907c:	eafffffe 	b	f000907c <context_switch+0x6c>
f0009080:	e51b3010 	ldr	r3, [fp, #-16]
f0009084:	e3530000 	cmp	r3, #0
f0009088:	1a000005 	bne	f00090a4 <context_switch+0x94>
f000908c:	e59f00a8 	ldr	r0, [pc, #168]	; f000913c <context_switch+0x12c>
f0009090:	e59f10a8 	ldr	r1, [pc, #168]	; f0009140 <context_switch+0x130>
f0009094:	e59f20a8 	ldr	r2, [pc, #168]	; f0009144 <context_switch+0x134>
f0009098:	e59f30ac 	ldr	r3, [pc, #172]	; f000914c <context_switch+0x13c>
f000909c:	eb003392 	bl	f0015eec <printk>
f00090a0:	eafffffe 	b	f00090a0 <context_switch+0x90>
f00090a4:	e51b3010 	ldr	r3, [fp, #-16]
f00090a8:	e59330b4 	ldr	r3, [r3, #180]	; 0xb4
f00090ac:	e3530000 	cmp	r3, #0
f00090b0:	1a000005 	bne	f00090cc <context_switch+0xbc>
f00090b4:	e59f0080 	ldr	r0, [pc, #128]	; f000913c <context_switch+0x12c>
f00090b8:	e59f1080 	ldr	r1, [pc, #128]	; f0009140 <context_switch+0x130>
f00090bc:	e59f2080 	ldr	r2, [pc, #128]	; f0009144 <context_switch+0x134>
f00090c0:	e59f3088 	ldr	r3, [pc, #136]	; f0009150 <context_switch+0x140>
f00090c4:	eb003388 	bl	f0015eec <printk>
f00090c8:	eafffffe 	b	f00090c8 <context_switch+0xb8>
f00090cc:	e51b3010 	ldr	r3, [fp, #-16]
f00090d0:	e59330b4 	ldr	r3, [r3, #180]	; 0xb4
f00090d4:	e3530000 	cmp	r3, #0
f00090d8:	1a000005 	bne	f00090f4 <context_switch+0xe4>
f00090dc:	e59f0058 	ldr	r0, [pc, #88]	; f000913c <context_switch+0x12c>
f00090e0:	e59f1058 	ldr	r1, [pc, #88]	; f0009140 <context_switch+0x130>
f00090e4:	e59f2058 	ldr	r2, [pc, #88]	; f0009144 <context_switch+0x134>
f00090e8:	e3a03e12 	mov	r3, #288	; 0x120
f00090ec:	eb00337e 	bl	f0015eec <printk>
f00090f0:	eafffffe 	b	f00090f0 <context_switch+0xe0>
f00090f4:	ebfffdc2 	bl	f0008804 <current_task>
f00090f8:	e1a03000 	mov	r3, r0
f00090fc:	e59330b4 	ldr	r3, [r3, #180]	; 0xb4
f0009100:	e5932000 	ldr	r2, [r3]
f0009104:	e51b3010 	ldr	r3, [fp, #-16]
f0009108:	e59330b4 	ldr	r3, [r3, #180]	; 0xb4
f000910c:	e5933000 	ldr	r3, [r3]
f0009110:	e1520003 	cmp	r2, r3
f0009114:	0a000001 	beq	f0009120 <context_switch+0x110>
f0009118:	e51b0010 	ldr	r0, [fp, #-16]
f000911c:	eb002cec 	bl	f00144d4 <arch_space_switch>
f0009120:	e51b0010 	ldr	r0, [fp, #-16]
f0009124:	eb0007a6 	bl	f000afc4 <task_update_utcb>
f0009128:	e51b0008 	ldr	r0, [fp, #-8]
f000912c:	e51b1010 	ldr	r1, [fp, #-16]
f0009130:	eb006cdb 	bl	f00244a4 <arch_context_switch>
f0009134:	e24bd004 	sub	sp, fp, #4
f0009138:	e8bd8800 	pop	{fp, pc}
f000913c:	f001e268 	.word	0xf001e268
f0009140:	f001e290 	.word	0xf001e290
f0009144:	f001e338 	.word	0xf001e338
f0009148:	0000011d 	.word	0x0000011d
f000914c:	0000011e 	.word	0x0000011e
f0009150:	0000011f 	.word	0x0000011f

f0009154 <sched_recalc_ticks>:
f0009154:	e92d4800 	push	{fp, lr}
f0009158:	e28db004 	add	fp, sp, #4
f000915c:	e24dd008 	sub	sp, sp, #8
f0009160:	e50b0008 	str	r0, [fp, #-8]
f0009164:	e50b100c 	str	r1, [fp, #-12]
f0009168:	e51b3008 	ldr	r3, [fp, #-8]
f000916c:	e59320a8 	ldr	r2, [r3, #168]	; 0xa8
f0009170:	e51b300c 	ldr	r3, [fp, #-12]
f0009174:	e1520003 	cmp	r2, r3
f0009178:	da000005 	ble	f0009194 <sched_recalc_ticks+0x40>
f000917c:	e59f0084 	ldr	r0, [pc, #132]	; f0009208 <sched_recalc_ticks+0xb4>
f0009180:	e59f1084 	ldr	r1, [pc, #132]	; f000920c <sched_recalc_ticks+0xb8>
f0009184:	e59f2084 	ldr	r2, [pc, #132]	; f0009210 <sched_recalc_ticks+0xbc>
f0009188:	e59f3084 	ldr	r3, [pc, #132]	; f0009214 <sched_recalc_ticks+0xc0>
f000918c:	eb003356 	bl	f0015eec <printk>
f0009190:	eafffffe 	b	f0009190 <sched_recalc_ticks+0x3c>
f0009194:	e51b300c 	ldr	r3, [fp, #-12]
f0009198:	e3530000 	cmp	r3, #0
f000919c:	1a000005 	bne	f00091b8 <sched_recalc_ticks+0x64>
f00091a0:	e59f0060 	ldr	r0, [pc, #96]	; f0009208 <sched_recalc_ticks+0xb4>
f00091a4:	e59f1060 	ldr	r1, [pc, #96]	; f000920c <sched_recalc_ticks+0xb8>
f00091a8:	e59f2060 	ldr	r2, [pc, #96]	; f0009210 <sched_recalc_ticks+0xbc>
f00091ac:	e3a03f4d 	mov	r3, #308	; 0x134
f00091b0:	eb00334d 	bl	f0015eec <printk>
f00091b4:	eafffffe 	b	f00091b4 <sched_recalc_ticks+0x60>
f00091b8:	e51b3008 	ldr	r3, [fp, #-8]
f00091bc:	e59320a8 	ldr	r2, [r3, #168]	; 0xa8
f00091c0:	e1a03002 	mov	r3, r2
f00091c4:	e1a03283 	lsl	r3, r3, #5
f00091c8:	e0623003 	rsb	r3, r2, r3
f00091cc:	e1a03103 	lsl	r3, r3, #2
f00091d0:	e0833002 	add	r3, r3, r2
f00091d4:	e1a03183 	lsl	r3, r3, #3
f00091d8:	e1a00003 	mov	r0, r3
f00091dc:	e51b100c 	ldr	r1, [fp, #-12]
f00091e0:	eb0053a6 	bl	f001e080 <__aeabi_idiv>
f00091e4:	e1a03000 	mov	r3, r0
f00091e8:	e1a02003 	mov	r2, r3
f00091ec:	e51b3008 	ldr	r3, [fp, #-8]
f00091f0:	e58320a0 	str	r2, [r3, #160]	; 0xa0
f00091f4:	e51b3008 	ldr	r3, [fp, #-8]
f00091f8:	e59330a0 	ldr	r3, [r3, #160]	; 0xa0
f00091fc:	e1a00003 	mov	r0, r3
f0009200:	e24bd004 	sub	sp, fp, #4
f0009204:	e8bd8800 	pop	{fp, pc}
f0009208:	f001e268 	.word	0xf001e268
f000920c:	f001e290 	.word	0xf001e290
f0009210:	f001e318 	.word	0xf001e318
f0009214:	00000133 	.word	0x00000133

f0009218 <sched_select_next>:
f0009218:	e92d4800 	push	{fp, lr}
f000921c:	e28db004 	add	fp, sp, #4
f0009220:	e24dd010 	sub	sp, sp, #16
f0009224:	e59f30d4 	ldr	r3, [pc, #212]	; f0009300 <sched_select_next+0xe8>
f0009228:	e50b300c 	str	r3, [fp, #-12]
f000922c:	e3a03000 	mov	r3, #0
f0009230:	e50b3008 	str	r3, [fp, #-8]
f0009234:	e51b300c 	ldr	r3, [fp, #-12]
f0009238:	e5933000 	ldr	r3, [r3]
f000923c:	e2033001 	and	r3, r3, #1
f0009240:	e3530000 	cmp	r3, #0
f0009244:	0a000003 	beq	f0009258 <sched_select_next+0x40>
f0009248:	e51b300c 	ldr	r3, [fp, #-12]
f000924c:	e5933060 	ldr	r3, [r3, #96]	; 0x60
f0009250:	e50b3008 	str	r3, [fp, #-8]
f0009254:	ea000025 	b	f00092f0 <sched_select_next+0xd8>
f0009258:	e51b300c 	ldr	r3, [fp, #-12]
f000925c:	e5933058 	ldr	r3, [r3, #88]	; 0x58
f0009260:	e5933010 	ldr	r3, [r3, #16]
f0009264:	e3530000 	cmp	r3, #0
f0009268:	0a000007 	beq	f000928c <sched_select_next+0x74>
f000926c:	e51b300c 	ldr	r3, [fp, #-12]
f0009270:	e5933058 	ldr	r3, [r3, #88]	; 0x58
f0009274:	e5933008 	ldr	r3, [r3, #8]
f0009278:	e50b3010 	str	r3, [fp, #-16]
f000927c:	e51b3010 	ldr	r3, [fp, #-16]
f0009280:	e2433048 	sub	r3, r3, #72	; 0x48
f0009284:	e50b3008 	str	r3, [fp, #-8]
f0009288:	ea000018 	b	f00092f0 <sched_select_next+0xd8>
f000928c:	e51b300c 	ldr	r3, [fp, #-12]
f0009290:	e593305c 	ldr	r3, [r3, #92]	; 0x5c
f0009294:	e5933010 	ldr	r3, [r3, #16]
f0009298:	e3530000 	cmp	r3, #0
f000929c:	0a000008 	beq	f00092c4 <sched_select_next+0xac>
f00092a0:	ebfffe34 	bl	f0008b78 <sched_rq_swap_queues>
f00092a4:	e51b300c 	ldr	r3, [fp, #-12]
f00092a8:	e5933058 	ldr	r3, [r3, #88]	; 0x58
f00092ac:	e5933008 	ldr	r3, [r3, #8]
f00092b0:	e50b3014 	str	r3, [fp, #-20]
f00092b4:	e51b3014 	ldr	r3, [fp, #-20]
f00092b8:	e2433048 	sub	r3, r3, #72	; 0x48
f00092bc:	e50b3008 	str	r3, [fp, #-8]
f00092c0:	ea00000a 	b	f00092f0 <sched_select_next+0xd8>
f00092c4:	ebfffde4 	bl	f0008a5c <in_process_context>
f00092c8:	e1a03000 	mov	r3, r0
f00092cc:	e3530000 	cmp	r3, #0
f00092d0:	0a000003 	beq	f00092e4 <sched_select_next+0xcc>
f00092d4:	e51b300c 	ldr	r3, [fp, #-12]
f00092d8:	e5933060 	ldr	r3, [r3, #96]	; 0x60
f00092dc:	e50b3008 	str	r3, [fp, #-8]
f00092e0:	ea000002 	b	f00092f0 <sched_select_next+0xd8>
f00092e4:	ebfffd46 	bl	f0008804 <current_task>
f00092e8:	e50b0008 	str	r0, [fp, #-8]
f00092ec:	e1a00000 	nop			; (mov r0, r0)
f00092f0:	e51b3008 	ldr	r3, [fp, #-8]
f00092f4:	e1a00003 	mov	r0, r3
f00092f8:	e24bd004 	sub	sp, fp, #4
f00092fc:	e8bd8800 	pop	{fp, pc}
f0009300:	f002d02c 	.word	0xf002d02c

f0009304 <sched_prepare_next>:
f0009304:	e92d4800 	push	{fp, lr}
f0009308:	e28db004 	add	fp, sp, #4
f000930c:	e24dd008 	sub	sp, sp, #8
f0009310:	e50b0008 	str	r0, [fp, #-8]
f0009314:	e51b3008 	ldr	r3, [fp, #-8]
f0009318:	e5933060 	ldr	r3, [r3, #96]	; 0x60
f000931c:	e2033004 	and	r3, r3, #4
f0009320:	e3530000 	cmp	r3, #0
f0009324:	0a000004 	beq	f000933c <sched_prepare_next+0x38>
f0009328:	e51b3008 	ldr	r3, [fp, #-8]
f000932c:	e5933060 	ldr	r3, [r3, #96]	; 0x60
f0009330:	e3c32004 	bic	r2, r3, #4
f0009334:	e51b3008 	ldr	r3, [fp, #-8]
f0009338:	e5832060 	str	r2, [r3, #96]	; 0x60
f000933c:	e51b3008 	ldr	r3, [fp, #-8]
f0009340:	e593309c 	ldr	r3, [r3, #156]	; 0x9c
f0009344:	e3530000 	cmp	r3, #0
f0009348:	1a000008 	bne	f0009370 <sched_prepare_next+0x6c>
f000934c:	e59f305c 	ldr	r3, [pc, #92]	; f00093b0 <sched_prepare_next+0xac>
f0009350:	e5933064 	ldr	r3, [r3, #100]	; 0x64
f0009354:	e51b0008 	ldr	r0, [fp, #-8]
f0009358:	e1a01003 	mov	r1, r3
f000935c:	ebffff7c 	bl	f0009154 <sched_recalc_ticks>
f0009360:	e51b3008 	ldr	r3, [fp, #-8]
f0009364:	e59320a0 	ldr	r2, [r3, #160]	; 0xa0
f0009368:	e51b3008 	ldr	r3, [fp, #-8]
f000936c:	e583209c 	str	r2, [r3, #156]	; 0x9c
f0009370:	e59f3038 	ldr	r3, [pc, #56]	; f00093b0 <sched_prepare_next+0xac>
f0009374:	e5932060 	ldr	r2, [r3, #96]	; 0x60
f0009378:	e51b3008 	ldr	r3, [fp, #-8]
f000937c:	e1520003 	cmp	r2, r3
f0009380:	1a000005 	bne	f000939c <sched_prepare_next+0x98>
f0009384:	e59f3024 	ldr	r3, [pc, #36]	; f00093b0 <sched_prepare_next+0xac>
f0009388:	e5933058 	ldr	r3, [r3, #88]	; 0x58
f000938c:	e51b0008 	ldr	r0, [fp, #-8]
f0009390:	e1a01003 	mov	r1, r3
f0009394:	e3a02001 	mov	r2, #1
f0009398:	ebfffe17 	bl	f0008bfc <sched_rq_add_task>
f000939c:	e51b3008 	ldr	r3, [fp, #-8]
f00093a0:	e3a02064 	mov	r2, #100	; 0x64
f00093a4:	e58320a4 	str	r2, [r3, #164]	; 0xa4
f00093a8:	e24bd004 	sub	sp, fp, #4
f00093ac:	e8bd8800 	pop	{fp, pc}
f00093b0:	f002d02c 	.word	0xf002d02c

f00093b4 <schedule>:
f00093b4:	e92d4800 	push	{fp, lr}
f00093b8:	e28db004 	add	fp, sp, #4
f00093bc:	e24dd008 	sub	sp, sp, #8
f00093c0:	e59f3224 	ldr	r3, [pc, #548]	; f00095ec <schedule+0x238>
f00093c4:	e5933000 	ldr	r3, [r3]
f00093c8:	e3530000 	cmp	r3, #0
f00093cc:	0a000005 	beq	f00093e8 <schedule+0x34>
f00093d0:	e59f0218 	ldr	r0, [pc, #536]	; f00095f0 <schedule+0x23c>
f00093d4:	e59f1218 	ldr	r1, [pc, #536]	; f00095f4 <schedule+0x240>
f00093d8:	e59f2218 	ldr	r2, [pc, #536]	; f00095f8 <schedule+0x244>
f00093dc:	e3a03f6b 	mov	r3, #428	; 0x1ac
f00093e0:	eb0032c1 	bl	f0015eec <printk>
f00093e4:	eafffffe 	b	f00093e4 <schedule+0x30>
f00093e8:	ebfffd8a 	bl	f0008a18 <in_nested_irq_context>
f00093ec:	e1a03000 	mov	r3, r0
f00093f0:	e3530000 	cmp	r3, #0
f00093f4:	0a000005 	beq	f0009410 <schedule+0x5c>
f00093f8:	e59f01f0 	ldr	r0, [pc, #496]	; f00095f0 <schedule+0x23c>
f00093fc:	e59f11f0 	ldr	r1, [pc, #496]	; f00095f4 <schedule+0x240>
f0009400:	e59f21f0 	ldr	r2, [pc, #496]	; f00095f8 <schedule+0x244>
f0009404:	e59f31f0 	ldr	r3, [pc, #496]	; f00095fc <schedule+0x248>
f0009408:	eb0032b7 	bl	f0015eec <printk>
f000940c:	eafffffe 	b	f000940c <schedule+0x58>
f0009410:	ebfffcfb 	bl	f0008804 <current_task>
f0009414:	e1a03000 	mov	r3, r0
f0009418:	e593309c 	ldr	r3, [r3, #156]	; 0x9c
f000941c:	e3530ffa 	cmp	r3, #1000	; 0x3e8
f0009420:	9a000005 	bls	f000943c <schedule+0x88>
f0009424:	e59f01c4 	ldr	r0, [pc, #452]	; f00095f0 <schedule+0x23c>
f0009428:	e59f11c4 	ldr	r1, [pc, #452]	; f00095f4 <schedule+0x240>
f000942c:	e59f21c4 	ldr	r2, [pc, #452]	; f00095f8 <schedule+0x244>
f0009430:	e3a03e1b 	mov	r3, #432	; 0x1b0
f0009434:	eb0032ac 	bl	f0015eec <printk>
f0009438:	eafffffe 	b	f0009438 <schedule+0x84>
f000943c:	ebfffd52 	bl	f000898c <preempt_disable>
f0009440:	ebfffcef 	bl	f0008804 <current_task>
f0009444:	e1a03000 	mov	r3, r0
f0009448:	e3a02000 	mov	r2, #0
f000944c:	e5832080 	str	r2, [r3, #128]	; 0x80
f0009450:	ebfffceb 	bl	f0008804 <current_task>
f0009454:	e1a03000 	mov	r3, r0
f0009458:	e5d33084 	ldrb	r3, [r3, #132]	; 0x84
f000945c:	e3530002 	cmp	r3, #2
f0009460:	1a00001f 	bne	f00094e4 <schedule+0x130>
f0009464:	ebfffce6 	bl	f0008804 <current_task>
f0009468:	e1a03000 	mov	r3, r0
f000946c:	e1a00003 	mov	r0, r3
f0009470:	ebfffe1e 	bl	f0008cf0 <sched_rq_remove_task>
f0009474:	ebfffce2 	bl	f0008804 <current_task>
f0009478:	e1a02000 	mov	r2, r0
f000947c:	e59f317c 	ldr	r3, [pc, #380]	; f0009600 <schedule+0x24c>
f0009480:	e5933060 	ldr	r3, [r3, #96]	; 0x60
f0009484:	e1520003 	cmp	r2, r3
f0009488:	0a000015 	beq	f00094e4 <schedule+0x130>
f000948c:	ebfffcdc 	bl	f0008804 <current_task>
f0009490:	e1a03000 	mov	r3, r0
f0009494:	e593309c 	ldr	r3, [r3, #156]	; 0x9c
f0009498:	e3530000 	cmp	r3, #0
f000949c:	0a000008 	beq	f00094c4 <schedule+0x110>
f00094a0:	ebfffcd7 	bl	f0008804 <current_task>
f00094a4:	e1a02000 	mov	r2, r0
f00094a8:	e59f3150 	ldr	r3, [pc, #336]	; f0009600 <schedule+0x24c>
f00094ac:	e5933058 	ldr	r3, [r3, #88]	; 0x58
f00094b0:	e1a00002 	mov	r0, r2
f00094b4:	e1a01003 	mov	r1, r3
f00094b8:	e3a02000 	mov	r2, #0
f00094bc:	ebfffdce 	bl	f0008bfc <sched_rq_add_task>
f00094c0:	ea000007 	b	f00094e4 <schedule+0x130>
f00094c4:	ebfffcce 	bl	f0008804 <current_task>
f00094c8:	e1a02000 	mov	r2, r0
f00094cc:	e59f312c 	ldr	r3, [pc, #300]	; f0009600 <schedule+0x24c>
f00094d0:	e593305c 	ldr	r3, [r3, #92]	; 0x5c
f00094d4:	e1a00002 	mov	r0, r2
f00094d8:	e1a01003 	mov	r1, r3
f00094dc:	e3a02000 	mov	r2, #0
f00094e0:	ebfffdc5 	bl	f0008bfc <sched_rq_add_task>
f00094e4:	ebfffcc6 	bl	f0008804 <current_task>
f00094e8:	e1a03000 	mov	r3, r0
f00094ec:	e5933060 	ldr	r3, [r3, #96]	; 0x60
f00094f0:	e2033002 	and	r3, r3, #2
f00094f4:	e3530000 	cmp	r3, #0
f00094f8:	0a000009 	beq	f0009524 <schedule+0x170>
f00094fc:	ebfffcc0 	bl	f0008804 <current_task>
f0009500:	e1a03000 	mov	r3, r0
f0009504:	e5d33084 	ldrb	r3, [r3, #132]	; 0x84
f0009508:	e3530001 	cmp	r3, #1
f000950c:	1a000004 	bne	f0009524 <schedule+0x170>
f0009510:	ebfffcbb 	bl	f0008804 <current_task>
f0009514:	e1a03000 	mov	r3, r0
f0009518:	e1a00003 	mov	r0, r3
f000951c:	e3a01001 	mov	r1, #1
f0009520:	eb003588 	bl	f0016b48 <wake_up_task>
f0009524:	ebfffcb6 	bl	f0008804 <current_task>
f0009528:	e1a03000 	mov	r3, r0
f000952c:	e5933060 	ldr	r3, [r3, #96]	; 0x60
f0009530:	e2033002 	and	r3, r3, #2
f0009534:	e3530000 	cmp	r3, #0
f0009538:	0a000011 	beq	f0009584 <schedule+0x1d0>
f000953c:	ebfffcb0 	bl	f0008804 <current_task>
f0009540:	e1a03000 	mov	r3, r0
f0009544:	e5d33084 	ldrb	r3, [r3, #132]	; 0x84
f0009548:	e3530002 	cmp	r3, #2
f000954c:	1a00000c 	bne	f0009584 <schedule+0x1d0>
f0009550:	ebfffcab 	bl	f0008804 <current_task>
f0009554:	e1a03000 	mov	r3, r0
f0009558:	e5933000 	ldr	r3, [r3]
f000955c:	e203301f 	and	r3, r3, #31
f0009560:	e3530013 	cmp	r3, #19
f0009564:	0a000006 	beq	f0009584 <schedule+0x1d0>
f0009568:	ebfffca5 	bl	f0008804 <current_task>
f000956c:	e1a03000 	mov	r3, r0
f0009570:	e5933060 	ldr	r3, [r3, #96]	; 0x60
f0009574:	e2033002 	and	r3, r3, #2
f0009578:	e3530000 	cmp	r3, #0
f000957c:	0a000000 	beq	f0009584 <schedule+0x1d0>
f0009580:	ebfffe7f 	bl	f0008f84 <sched_suspend_async>
f0009584:	ebfffc9e 	bl	f0008804 <current_task>
f0009588:	e1a03000 	mov	r3, r0
f000958c:	e5933060 	ldr	r3, [r3, #96]	; 0x60
f0009590:	e2033008 	and	r3, r3, #8
f0009594:	e3530000 	cmp	r3, #0
f0009598:	0a000009 	beq	f00095c4 <schedule+0x210>
f000959c:	ebfffc98 	bl	f0008804 <current_task>
f00095a0:	e1a03000 	mov	r3, r0
f00095a4:	e5932060 	ldr	r2, [r3, #96]	; 0x60
f00095a8:	e3c22008 	bic	r2, r2, #8
f00095ac:	e5832060 	str	r2, [r3, #96]	; 0x60
f00095b0:	e59f3048 	ldr	r3, [pc, #72]	; f0009600 <schedule+0x24c>
f00095b4:	e5933000 	ldr	r3, [r3]
f00095b8:	e3832001 	orr	r2, r3, #1
f00095bc:	e59f303c 	ldr	r3, [pc, #60]	; f0009600 <schedule+0x24c>
f00095c0:	e5832000 	str	r2, [r3]
f00095c4:	ebffff13 	bl	f0009218 <sched_select_next>
f00095c8:	e50b0008 	str	r0, [fp, #-8]
f00095cc:	e51b0008 	ldr	r0, [fp, #-8]
f00095d0:	ebffff4b 	bl	f0009304 <sched_prepare_next>
f00095d4:	ebfffc58 	bl	f000873c <disable_irqs>
f00095d8:	ebfffcda 	bl	f0008948 <preempt_enable>
f00095dc:	e51b0008 	ldr	r0, [fp, #-8]
f00095e0:	ebfffe8a 	bl	f0009010 <context_switch>
f00095e4:	e24bd004 	sub	sp, fp, #4
f00095e8:	e8bd8800 	pop	{fp, pc}
f00095ec:	f002d000 	.word	0xf002d000
f00095f0:	f001e268 	.word	0xf001e268
f00095f4:	f001e290 	.word	0xf001e290
f00095f8:	f001e32c 	.word	0xf001e32c
f00095fc:	000001ad 	.word	0x000001ad
f0009600:	f002d02c 	.word	0xf002d02c

f0009604 <scheduler_start>:
f0009604:	e92d4800 	push	{fp, lr}
f0009608:	e28db004 	add	fp, sp, #4
f000960c:	eb005204 	bl	f001de24 <platform_timer_start>
f0009610:	ebfffc7b 	bl	f0008804 <current_task>
f0009614:	e1a03000 	mov	r3, r0
f0009618:	e1a00003 	mov	r0, r3
f000961c:	eb002dac 	bl	f0014cd4 <switch_to_user>
f0009620:	e8bd8800 	pop	{fp, pc}

f0009624 <current_task>:
f0009624:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f0009628:	e28db000 	add	fp, sp, #0
f000962c:	e1a0300d 	mov	r3, sp
f0009630:	e3c33eff 	bic	r3, r3, #4080	; 0xff0
f0009634:	e3c3300f 	bic	r3, r3, #15
f0009638:	e1a00003 	mov	r0, r3
f000963c:	e24bd000 	sub	sp, fp, #0
f0009640:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0009644:	e12fff1e 	bx	lr

f0009648 <in_kernel>:
f0009648:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f000964c:	e28db000 	add	fp, sp, #0
f0009650:	e59f3024 	ldr	r3, [pc, #36]	; f000967c <in_kernel+0x34>
f0009654:	e5933000 	ldr	r3, [r3]
f0009658:	e203301f 	and	r3, r3, #31
f000965c:	e3530013 	cmp	r3, #19
f0009660:	13a03000 	movne	r3, #0
f0009664:	03a03001 	moveq	r3, #1
f0009668:	e20330ff 	and	r3, r3, #255	; 0xff
f000966c:	e1a00003 	mov	r0, r3
f0009670:	e24bd000 	sub	sp, fp, #0
f0009674:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0009678:	e12fff1e 	bx	lr
f000967c:	f002432c 	.word	0xf002432c

f0009680 <increase_jiffies>:
f0009680:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f0009684:	e28db000 	add	fp, sp, #0
f0009688:	e59f3018 	ldr	r3, [pc, #24]	; f00096a8 <increase_jiffies+0x28>
f000968c:	e5933000 	ldr	r3, [r3]
f0009690:	e2832001 	add	r2, r3, #1
f0009694:	e59f300c 	ldr	r3, [pc, #12]	; f00096a8 <increase_jiffies+0x28>
f0009698:	e5832000 	str	r2, [r3]
f000969c:	e24bd000 	sub	sp, fp, #0
f00096a0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f00096a4:	e12fff1e 	bx	lr
f00096a8:	f002d008 	.word	0xf002d008

f00096ac <update_system_time>:
f00096ac:	e92d0810 	push	{r4, fp}
f00096b0:	e28db004 	add	fp, sp, #4
f00096b4:	e59f3070 	ldr	r3, [pc, #112]	; f000972c <update_system_time+0x80>
f00096b8:	e5933000 	ldr	r3, [r3]
f00096bc:	e3530000 	cmp	r3, #0
f00096c0:	0a000002 	beq	f00096d0 <update_system_time+0x24>
f00096c4:	e59f3060 	ldr	r3, [pc, #96]	; f000972c <update_system_time+0x80>
f00096c8:	e3a02000 	mov	r2, #0
f00096cc:	e5832000 	str	r2, [r3]
f00096d0:	e59f3054 	ldr	r3, [pc, #84]	; f000972c <update_system_time+0x80>
f00096d4:	e5933004 	ldr	r3, [r3, #4]
f00096d8:	e2832001 	add	r2, r3, #1
f00096dc:	e59f3048 	ldr	r3, [pc, #72]	; f000972c <update_system_time+0x80>
f00096e0:	e5832004 	str	r2, [r3, #4]
f00096e4:	e59f3040 	ldr	r3, [pc, #64]	; f000972c <update_system_time+0x80>
f00096e8:	e5933004 	ldr	r3, [r3, #4]
f00096ec:	e3530ffa 	cmp	r3, #1000	; 0x3e8
f00096f0:	1a00000a 	bne	f0009720 <update_system_time+0x74>
f00096f4:	e59f3030 	ldr	r3, [pc, #48]	; f000972c <update_system_time+0x80>
f00096f8:	e3a02000 	mov	r2, #0
f00096fc:	e5832004 	str	r2, [r3, #4]
f0009700:	e59f3024 	ldr	r3, [pc, #36]	; f000972c <update_system_time+0x80>
f0009704:	e2834008 	add	r4, r3, #8
f0009708:	e8940018 	ldm	r4, {r3, r4}
f000970c:	e2933001 	adds	r3, r3, #1
f0009710:	e2a44000 	adc	r4, r4, #0
f0009714:	e59f2010 	ldr	r2, [pc, #16]	; f000972c <update_system_time+0x80>
f0009718:	e5823008 	str	r3, [r2, #8]
f000971c:	e582400c 	str	r4, [r2, #12]
f0009720:	e24bd004 	sub	sp, fp, #4
f0009724:	e8bd0810 	pop	{r4, fp}
f0009728:	e12fff1e 	bx	lr
f000972c:	f002d010 	.word	0xf002d010

f0009730 <sys_time>:
f0009730:	e92d4810 	push	{r4, fp, lr}
f0009734:	e28db008 	add	fp, sp, #8
f0009738:	e24dd014 	sub	sp, sp, #20
f000973c:	e50b0018 	str	r0, [fp, #-24]
f0009740:	e50b101c 	str	r1, [fp, #-28]
f0009744:	e3a03014 	mov	r3, #20
f0009748:	e50b3010 	str	r3, [fp, #-16]
f000974c:	e51b3018 	ldr	r3, [fp, #-24]
f0009750:	e1a00003 	mov	r0, r3
f0009754:	e3a01008 	mov	r1, #8
f0009758:	e3a02001 	mov	r2, #1
f000975c:	e3a03001 	mov	r3, #1
f0009760:	eb000862 	bl	f000b8f0 <check_access>
f0009764:	e50b0014 	str	r0, [fp, #-20]
f0009768:	e51b3014 	ldr	r3, [fp, #-20]
f000976c:	e3530000 	cmp	r3, #0
f0009770:	aa000001 	bge	f000977c <sys_time+0x4c>
f0009774:	e51b3014 	ldr	r3, [fp, #-20]
f0009778:	ea000030 	b	f0009840 <sys_time+0x110>
f000977c:	e51b301c 	ldr	r3, [fp, #-28]
f0009780:	e3530000 	cmp	r3, #0
f0009784:	1a00002c 	bne	f000983c <sys_time+0x10c>
f0009788:	ea000021 	b	f0009814 <sys_time+0xe4>
f000978c:	e59f30b8 	ldr	r3, [pc, #184]	; f000984c <sys_time+0x11c>
f0009790:	e3a02001 	mov	r2, #1
f0009794:	e5832000 	str	r2, [r3]
f0009798:	e59f30ac 	ldr	r3, [pc, #172]	; f000984c <sys_time+0x11c>
f000979c:	e2834008 	add	r4, r3, #8
f00097a0:	e8940018 	ldm	r4, {r3, r4}
f00097a4:	e1a02003 	mov	r2, r3
f00097a8:	e51b3018 	ldr	r3, [fp, #-24]
f00097ac:	e5832000 	str	r2, [r3]
f00097b0:	e59f3094 	ldr	r3, [pc, #148]	; f000984c <sys_time+0x11c>
f00097b4:	e5931004 	ldr	r1, [r3, #4]
f00097b8:	e1a02001 	mov	r2, r1
f00097bc:	e1a02282 	lsl	r2, r2, #5
f00097c0:	e0612002 	rsb	r2, r1, r2
f00097c4:	e1a03302 	lsl	r3, r2, #6
f00097c8:	e0623003 	rsb	r3, r2, r3
f00097cc:	e1a03183 	lsl	r3, r3, #3
f00097d0:	e0833001 	add	r3, r3, r1
f00097d4:	e1a03303 	lsl	r3, r3, #6
f00097d8:	e1a02003 	mov	r2, r3
f00097dc:	e59f306c 	ldr	r3, [pc, #108]	; f0009850 <sys_time+0x120>
f00097e0:	e0831392 	umull	r1, r3, r2, r3
f00097e4:	e1a03323 	lsr	r3, r3, #6
f00097e8:	e1a02003 	mov	r2, r3
f00097ec:	e51b3018 	ldr	r3, [fp, #-24]
f00097f0:	e5832004 	str	r2, [r3, #4]
f00097f4:	e51b3010 	ldr	r3, [fp, #-16]
f00097f8:	e2433001 	sub	r3, r3, #1
f00097fc:	e50b3010 	str	r3, [fp, #-16]
f0009800:	e59f3044 	ldr	r3, [pc, #68]	; f000984c <sys_time+0x11c>
f0009804:	e5933000 	ldr	r3, [r3]
f0009808:	e3530000 	cmp	r3, #0
f000980c:	0a000000 	beq	f0009814 <sys_time+0xe4>
f0009810:	ea000002 	b	f0009820 <sys_time+0xf0>
f0009814:	e51b3010 	ldr	r3, [fp, #-16]
f0009818:	e3530000 	cmp	r3, #0
f000981c:	caffffda 	bgt	f000978c <sys_time+0x5c>
f0009820:	e51b3010 	ldr	r3, [fp, #-16]
f0009824:	e3530000 	cmp	r3, #0
f0009828:	1a000001 	bne	f0009834 <sys_time+0x104>
f000982c:	e3e0300f 	mvn	r3, #15
f0009830:	ea000002 	b	f0009840 <sys_time+0x110>
f0009834:	e3a03000 	mov	r3, #0
f0009838:	ea000000 	b	f0009840 <sys_time+0x110>
f000983c:	e3e03025 	mvn	r3, #37	; 0x25
f0009840:	e1a00003 	mov	r0, r3
f0009844:	e24bd008 	sub	sp, fp, #8
f0009848:	e8bd8810 	pop	{r4, fp, pc}
f000984c:	f002d010 	.word	0xf002d010
f0009850:	10624dd3 	.word	0x10624dd3

f0009854 <update_process_times>:
f0009854:	e92d4800 	push	{fp, lr}
f0009858:	e28db004 	add	fp, sp, #4
f000985c:	e24dd008 	sub	sp, sp, #8
f0009860:	ebffff6f 	bl	f0009624 <current_task>
f0009864:	e50b0008 	str	r0, [fp, #-8]
f0009868:	e51b3008 	ldr	r3, [fp, #-8]
f000986c:	e593309c 	ldr	r3, [r3, #156]	; 0x9c
f0009870:	e3530000 	cmp	r3, #0
f0009874:	1a00000e 	bne	f00098b4 <update_process_times+0x60>
f0009878:	ebfffc66 	bl	f0008a18 <in_nested_irq_context>
f000987c:	e1a03000 	mov	r3, r0
f0009880:	e3530000 	cmp	r3, #0
f0009884:	1a000003 	bne	f0009898 <update_process_times+0x44>
f0009888:	ebfffc18 	bl	f00088f0 <preemptive>
f000988c:	e1a03000 	mov	r3, r0
f0009890:	e3530000 	cmp	r3, #0
f0009894:	1a000000 	bne	f000989c <update_process_times+0x48>
f0009898:	ea00002e 	b	f0009958 <update_process_times+0x104>
f000989c:	e59f00bc 	ldr	r0, [pc, #188]	; f0009960 <update_process_times+0x10c>
f00098a0:	e59f10bc 	ldr	r1, [pc, #188]	; f0009964 <update_process_times+0x110>
f00098a4:	e59f20bc 	ldr	r2, [pc, #188]	; f0009968 <update_process_times+0x114>
f00098a8:	e3a03079 	mov	r3, #121	; 0x79
f00098ac:	eb00318e 	bl	f0015eec <printk>
f00098b0:	eafffffe 	b	f00098b0 <update_process_times+0x5c>
f00098b4:	ebffff63 	bl	f0009648 <in_kernel>
f00098b8:	e1a03000 	mov	r3, r0
f00098bc:	e3530000 	cmp	r3, #0
f00098c0:	0a000005 	beq	f00098dc <update_process_times+0x88>
f00098c4:	e51b3008 	ldr	r3, [fp, #-8]
f00098c8:	e5933094 	ldr	r3, [r3, #148]	; 0x94
f00098cc:	e2832001 	add	r2, r3, #1
f00098d0:	e51b3008 	ldr	r3, [fp, #-8]
f00098d4:	e5832094 	str	r2, [r3, #148]	; 0x94
f00098d8:	ea000004 	b	f00098f0 <update_process_times+0x9c>
f00098dc:	e51b3008 	ldr	r3, [fp, #-8]
f00098e0:	e5933098 	ldr	r3, [r3, #152]	; 0x98
f00098e4:	e2832001 	add	r2, r3, #1
f00098e8:	e51b3008 	ldr	r3, [fp, #-8]
f00098ec:	e5832098 	str	r2, [r3, #152]	; 0x98
f00098f0:	e51b3008 	ldr	r3, [fp, #-8]
f00098f4:	e593309c 	ldr	r3, [r3, #156]	; 0x9c
f00098f8:	e2432001 	sub	r2, r3, #1
f00098fc:	e51b3008 	ldr	r3, [fp, #-8]
f0009900:	e583209c 	str	r2, [r3, #156]	; 0x9c
f0009904:	e51b3008 	ldr	r3, [fp, #-8]
f0009908:	e59330a4 	ldr	r3, [r3, #164]	; 0xa4
f000990c:	e2432001 	sub	r2, r3, #1
f0009910:	e51b3008 	ldr	r3, [fp, #-8]
f0009914:	e58320a4 	str	r2, [r3, #164]	; 0xa4
f0009918:	e51b3008 	ldr	r3, [fp, #-8]
f000991c:	e593309c 	ldr	r3, [r3, #156]	; 0x9c
f0009920:	e3530000 	cmp	r3, #0
f0009924:	1a000003 	bne	f0009938 <update_process_times+0xe4>
f0009928:	ebffff3d 	bl	f0009624 <current_task>
f000992c:	e1a03000 	mov	r3, r0
f0009930:	e3a02001 	mov	r2, #1
f0009934:	e5832080 	str	r2, [r3, #128]	; 0x80
f0009938:	e51b3008 	ldr	r3, [fp, #-8]
f000993c:	e59330a4 	ldr	r3, [r3, #164]	; 0xa4
f0009940:	e3530000 	cmp	r3, #0
f0009944:	1a000003 	bne	f0009958 <update_process_times+0x104>
f0009948:	ebffff35 	bl	f0009624 <current_task>
f000994c:	e1a03000 	mov	r3, r0
f0009950:	e3a02001 	mov	r2, #1
f0009954:	e5832080 	str	r2, [r3, #128]	; 0x80
f0009958:	e24bd004 	sub	sp, fp, #4
f000995c:	e8bd8800 	pop	{fp, pc}
f0009960:	f001e348 	.word	0xf001e348
f0009964:	f001e370 	.word	0xf001e370
f0009968:	f001e384 	.word	0xf001e384

f000996c <do_timer_irq>:
f000996c:	e92d4800 	push	{fp, lr}
f0009970:	e28db004 	add	fp, sp, #4
f0009974:	ebffff41 	bl	f0009680 <increase_jiffies>
f0009978:	ebffffb5 	bl	f0009854 <update_process_times>
f000997c:	ebffff4a 	bl	f00096ac <update_system_time>
f0009980:	e3a03000 	mov	r3, #0
f0009984:	e1a00003 	mov	r0, r3
f0009988:	e8bd8800 	pop	{fp, pc}

f000998c <secondary_timer_irq>:
f000998c:	e92d4800 	push	{fp, lr}
f0009990:	e28db004 	add	fp, sp, #4
f0009994:	ebffffae 	bl	f0009854 <update_process_times>
f0009998:	e3a03000 	mov	r3, #0
f000999c:	e1a00003 	mov	r0, r3
f00099a0:	e8bd8800 	pop	{fp, pc}

f00099a4 <link_init>:
f00099a4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f00099a8:	e28db000 	add	fp, sp, #0
f00099ac:	e24dd00c 	sub	sp, sp, #12
f00099b0:	e50b0008 	str	r0, [fp, #-8]
f00099b4:	e51b3008 	ldr	r3, [fp, #-8]
f00099b8:	e51b2008 	ldr	r2, [fp, #-8]
f00099bc:	e5832000 	str	r2, [r3]
f00099c0:	e51b3008 	ldr	r3, [fp, #-8]
f00099c4:	e51b2008 	ldr	r2, [fp, #-8]
f00099c8:	e5832004 	str	r2, [r3, #4]
f00099cc:	e24bd000 	sub	sp, fp, #0
f00099d0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f00099d4:	e12fff1e 	bx	lr

f00099d8 <list_insert>:
f00099d8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f00099dc:	e28db000 	add	fp, sp, #0
f00099e0:	e24dd014 	sub	sp, sp, #20
f00099e4:	e50b0010 	str	r0, [fp, #-16]
f00099e8:	e50b1014 	str	r1, [fp, #-20]
f00099ec:	e51b3014 	ldr	r3, [fp, #-20]
f00099f0:	e5933000 	ldr	r3, [r3]
f00099f4:	e50b3008 	str	r3, [fp, #-8]
f00099f8:	e51b3010 	ldr	r3, [fp, #-16]
f00099fc:	e51b2008 	ldr	r2, [fp, #-8]
f0009a00:	e5832000 	str	r2, [r3]
f0009a04:	e51b3008 	ldr	r3, [fp, #-8]
f0009a08:	e51b2010 	ldr	r2, [fp, #-16]
f0009a0c:	e5832004 	str	r2, [r3, #4]
f0009a10:	e51b3014 	ldr	r3, [fp, #-20]
f0009a14:	e51b2010 	ldr	r2, [fp, #-16]
f0009a18:	e5832000 	str	r2, [r3]
f0009a1c:	e51b3010 	ldr	r3, [fp, #-16]
f0009a20:	e51b2014 	ldr	r2, [fp, #-20]
f0009a24:	e5832004 	str	r2, [r3, #4]
f0009a28:	e24bd000 	sub	sp, fp, #0
f0009a2c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0009a30:	e12fff1e 	bx	lr

f0009a34 <list_remove>:
f0009a34:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f0009a38:	e28db000 	add	fp, sp, #0
f0009a3c:	e24dd014 	sub	sp, sp, #20
f0009a40:	e50b0010 	str	r0, [fp, #-16]
f0009a44:	e51b3010 	ldr	r3, [fp, #-16]
f0009a48:	e5933004 	ldr	r3, [r3, #4]
f0009a4c:	e50b3008 	str	r3, [fp, #-8]
f0009a50:	e51b3010 	ldr	r3, [fp, #-16]
f0009a54:	e5933000 	ldr	r3, [r3]
f0009a58:	e50b300c 	str	r3, [fp, #-12]
f0009a5c:	e51b3008 	ldr	r3, [fp, #-8]
f0009a60:	e51b200c 	ldr	r2, [fp, #-12]
f0009a64:	e5832000 	str	r2, [r3]
f0009a68:	e51b300c 	ldr	r3, [fp, #-12]
f0009a6c:	e51b2008 	ldr	r2, [fp, #-8]
f0009a70:	e5832004 	str	r2, [r3, #4]
f0009a74:	e51b3010 	ldr	r3, [fp, #-16]
f0009a78:	e59f2018 	ldr	r2, [pc, #24]	; f0009a98 <list_remove+0x64>
f0009a7c:	e5832000 	str	r2, [r3]
f0009a80:	e51b3010 	ldr	r3, [fp, #-16]
f0009a84:	e59f200c 	ldr	r2, [pc, #12]	; f0009a98 <list_remove+0x64>
f0009a88:	e5832004 	str	r2, [r3, #4]
f0009a8c:	e24bd000 	sub	sp, fp, #0
f0009a90:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0009a94:	e12fff1e 	bx	lr
f0009a98:	deadcccc 	.word	0xdeadcccc

f0009a9c <list_remove_init>:
f0009a9c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f0009aa0:	e28db000 	add	fp, sp, #0
f0009aa4:	e24dd014 	sub	sp, sp, #20
f0009aa8:	e50b0010 	str	r0, [fp, #-16]
f0009aac:	e51b3010 	ldr	r3, [fp, #-16]
f0009ab0:	e5933004 	ldr	r3, [r3, #4]
f0009ab4:	e50b3008 	str	r3, [fp, #-8]
f0009ab8:	e51b3010 	ldr	r3, [fp, #-16]
f0009abc:	e5933000 	ldr	r3, [r3]
f0009ac0:	e50b300c 	str	r3, [fp, #-12]
f0009ac4:	e51b3008 	ldr	r3, [fp, #-8]
f0009ac8:	e51b200c 	ldr	r2, [fp, #-12]
f0009acc:	e5832000 	str	r2, [r3]
f0009ad0:	e51b300c 	ldr	r3, [fp, #-12]
f0009ad4:	e51b2008 	ldr	r2, [fp, #-8]
f0009ad8:	e5832004 	str	r2, [r3, #4]
f0009adc:	e51b3010 	ldr	r3, [fp, #-16]
f0009ae0:	e51b2010 	ldr	r2, [fp, #-16]
f0009ae4:	e5832000 	str	r2, [r3]
f0009ae8:	e51b3010 	ldr	r3, [fp, #-16]
f0009aec:	e51b2010 	ldr	r2, [fp, #-16]
f0009af0:	e5832004 	str	r2, [r3, #4]
f0009af4:	e24bd000 	sub	sp, fp, #0
f0009af8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0009afc:	e12fff1e 	bx	lr

f0009b00 <list_detach>:
f0009b00:	e92d4800 	push	{fp, lr}
f0009b04:	e28db004 	add	fp, sp, #4
f0009b08:	e24dd010 	sub	sp, sp, #16
f0009b0c:	e50b0010 	str	r0, [fp, #-16]
f0009b10:	e51b3010 	ldr	r3, [fp, #-16]
f0009b14:	e5933000 	ldr	r3, [r3]
f0009b18:	e50b3008 	str	r3, [fp, #-8]
f0009b1c:	e51b0010 	ldr	r0, [fp, #-16]
f0009b20:	ebffffdd 	bl	f0009a9c <list_remove_init>
f0009b24:	e51b3008 	ldr	r3, [fp, #-8]
f0009b28:	e1a00003 	mov	r0, r3
f0009b2c:	e24bd004 	sub	sp, fp, #4
f0009b30:	e8bd8800 	pop	{fp, pc}

f0009b34 <list_empty>:
f0009b34:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f0009b38:	e28db000 	add	fp, sp, #0
f0009b3c:	e24dd00c 	sub	sp, sp, #12
f0009b40:	e50b0008 	str	r0, [fp, #-8]
f0009b44:	e51b3008 	ldr	r3, [fp, #-8]
f0009b48:	e5932004 	ldr	r2, [r3, #4]
f0009b4c:	e51b3008 	ldr	r3, [fp, #-8]
f0009b50:	e1520003 	cmp	r2, r3
f0009b54:	1a000006 	bne	f0009b74 <list_empty+0x40>
f0009b58:	e51b3008 	ldr	r3, [fp, #-8]
f0009b5c:	e5932000 	ldr	r2, [r3]
f0009b60:	e51b3008 	ldr	r3, [fp, #-8]
f0009b64:	e1520003 	cmp	r2, r3
f0009b68:	1a000001 	bne	f0009b74 <list_empty+0x40>
f0009b6c:	e3a03001 	mov	r3, #1
f0009b70:	ea000000 	b	f0009b78 <list_empty+0x44>
f0009b74:	e3a03000 	mov	r3, #0
f0009b78:	e1a00003 	mov	r0, r3
f0009b7c:	e24bd000 	sub	sp, fp, #0
f0009b80:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0009b84:	e12fff1e 	bx	lr

f0009b88 <spin_lock_init>:
f0009b88:	e92d4800 	push	{fp, lr}
f0009b8c:	e28db004 	add	fp, sp, #4
f0009b90:	e24dd008 	sub	sp, sp, #8
f0009b94:	e50b0008 	str	r0, [fp, #-8]
f0009b98:	e51b0008 	ldr	r0, [fp, #-8]
f0009b9c:	e3a01000 	mov	r1, #0
f0009ba0:	e3a02004 	mov	r2, #4
f0009ba4:	eb0030fb 	bl	f0015f98 <memset>
f0009ba8:	e24bd004 	sub	sp, fp, #4
f0009bac:	e8bd8800 	pop	{fp, pc}

f0009bb0 <spin_lock>:
f0009bb0:	e92d4800 	push	{fp, lr}
f0009bb4:	e28db004 	add	fp, sp, #4
f0009bb8:	e24dd008 	sub	sp, sp, #8
f0009bbc:	e50b0008 	str	r0, [fp, #-8]
f0009bc0:	ebfffb71 	bl	f000898c <preempt_disable>
f0009bc4:	e24bd004 	sub	sp, fp, #4
f0009bc8:	e8bd8800 	pop	{fp, pc}

f0009bcc <spin_unlock>:
f0009bcc:	e92d4800 	push	{fp, lr}
f0009bd0:	e28db004 	add	fp, sp, #4
f0009bd4:	e24dd008 	sub	sp, sp, #8
f0009bd8:	e50b0008 	str	r0, [fp, #-8]
f0009bdc:	ebfffb59 	bl	f0008948 <preempt_enable>
f0009be0:	e24bd004 	sub	sp, fp, #4
f0009be4:	e8bd8800 	pop	{fp, pc}

f0009be8 <waitqueue_head_init>:
f0009be8:	e92d4800 	push	{fp, lr}
f0009bec:	e28db004 	add	fp, sp, #4
f0009bf0:	e24dd008 	sub	sp, sp, #8
f0009bf4:	e50b0008 	str	r0, [fp, #-8]
f0009bf8:	e51b0008 	ldr	r0, [fp, #-8]
f0009bfc:	e3a01000 	mov	r1, #0
f0009c00:	e3a02010 	mov	r2, #16
f0009c04:	eb0030e3 	bl	f0015f98 <memset>
f0009c08:	e51b3008 	ldr	r3, [fp, #-8]
f0009c0c:	e2833008 	add	r3, r3, #8
f0009c10:	e1a00003 	mov	r0, r3
f0009c14:	ebffff62 	bl	f00099a4 <link_init>
f0009c18:	e24bd004 	sub	sp, fp, #4
f0009c1c:	e8bd8800 	pop	{fp, pc}

f0009c20 <mutex_init>:
f0009c20:	e92d4800 	push	{fp, lr}
f0009c24:	e28db004 	add	fp, sp, #4
f0009c28:	e24dd008 	sub	sp, sp, #8
f0009c2c:	e50b0008 	str	r0, [fp, #-8]
f0009c30:	e51b0008 	ldr	r0, [fp, #-8]
f0009c34:	e3a01000 	mov	r1, #0
f0009c38:	e3a02014 	mov	r2, #20
f0009c3c:	eb0030d5 	bl	f0015f98 <memset>
f0009c40:	e51b3008 	ldr	r3, [fp, #-8]
f0009c44:	e1a00003 	mov	r0, r3
f0009c48:	ebffffe6 	bl	f0009be8 <waitqueue_head_init>
f0009c4c:	e24bd004 	sub	sp, fp, #4
f0009c50:	e8bd8800 	pop	{fp, pc}

f0009c54 <current_task>:
f0009c54:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f0009c58:	e28db000 	add	fp, sp, #0
f0009c5c:	e1a0300d 	mov	r3, sp
f0009c60:	e3c33eff 	bic	r3, r3, #4080	; 0xff0
f0009c64:	e3c3300f 	bic	r3, r3, #15
f0009c68:	e1a00003 	mov	r0, r3
f0009c6c:	e24bd000 	sub	sp, fp, #0
f0009c70:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0009c74:	e12fff1e 	bx	lr

f0009c78 <cap_list_detach>:
f0009c78:	e92d4800 	push	{fp, lr}
f0009c7c:	e28db004 	add	fp, sp, #4
f0009c80:	e24dd010 	sub	sp, sp, #16
f0009c84:	e50b0010 	str	r0, [fp, #-16]
f0009c88:	e51b3010 	ldr	r3, [fp, #-16]
f0009c8c:	e5933000 	ldr	r3, [r3]
f0009c90:	e3530000 	cmp	r3, #0
f0009c94:	1a000001 	bne	f0009ca0 <cap_list_detach+0x28>
f0009c98:	e3a03000 	mov	r3, #0
f0009c9c:	ea00000b 	b	f0009cd0 <cap_list_detach+0x58>
f0009ca0:	e51b3010 	ldr	r3, [fp, #-16]
f0009ca4:	e2833004 	add	r3, r3, #4
f0009ca8:	e1a00003 	mov	r0, r3
f0009cac:	ebffff93 	bl	f0009b00 <list_detach>
f0009cb0:	e50b0008 	str	r0, [fp, #-8]
f0009cb4:	e51b3010 	ldr	r3, [fp, #-16]
f0009cb8:	e3a02000 	mov	r2, #0
f0009cbc:	e5832000 	str	r2, [r3]
f0009cc0:	e51b3008 	ldr	r3, [fp, #-8]
f0009cc4:	e50b300c 	str	r3, [fp, #-12]
f0009cc8:	e51b300c 	ldr	r3, [fp, #-12]
f0009ccc:	e1a00000 	nop			; (mov r0, r0)
f0009cd0:	e1a00003 	mov	r0, r3
f0009cd4:	e24bd004 	sub	sp, fp, #4
f0009cd8:	e8bd8800 	pop	{fp, pc}

f0009cdc <cap_list_attach>:
f0009cdc:	e92d4800 	push	{fp, lr}
f0009ce0:	e28db004 	add	fp, sp, #4
f0009ce4:	e24dd010 	sub	sp, sp, #16
f0009ce8:	e50b0010 	str	r0, [fp, #-16]
f0009cec:	e50b1014 	str	r1, [fp, #-20]
f0009cf0:	e51b3014 	ldr	r3, [fp, #-20]
f0009cf4:	e2832004 	add	r2, r3, #4
f0009cf8:	e51b3010 	ldr	r3, [fp, #-16]
f0009cfc:	e1a00002 	mov	r0, r2
f0009d00:	e1a01003 	mov	r1, r3
f0009d04:	ebffff33 	bl	f00099d8 <list_insert>
f0009d08:	e51b3014 	ldr	r3, [fp, #-20]
f0009d0c:	e5933004 	ldr	r3, [r3, #4]
f0009d10:	e50b3008 	str	r3, [fp, #-8]
f0009d14:	e51b3008 	ldr	r3, [fp, #-8]
f0009d18:	e50b3010 	str	r3, [fp, #-16]
f0009d1c:	ea000009 	b	f0009d48 <cap_list_attach+0x6c>
f0009d20:	e51b3014 	ldr	r3, [fp, #-20]
f0009d24:	e5933000 	ldr	r3, [r3]
f0009d28:	e2832001 	add	r2, r3, #1
f0009d2c:	e51b3014 	ldr	r3, [fp, #-20]
f0009d30:	e5832000 	str	r2, [r3]
f0009d34:	e51b3010 	ldr	r3, [fp, #-16]
f0009d38:	e5933000 	ldr	r3, [r3]
f0009d3c:	e50b300c 	str	r3, [fp, #-12]
f0009d40:	e51b300c 	ldr	r3, [fp, #-12]
f0009d44:	e50b3010 	str	r3, [fp, #-16]
f0009d48:	e51b2010 	ldr	r2, [fp, #-16]
f0009d4c:	e51b3014 	ldr	r3, [fp, #-20]
f0009d50:	e2833004 	add	r3, r3, #4
f0009d54:	e1520003 	cmp	r2, r3
f0009d58:	1afffff0 	bne	f0009d20 <cap_list_attach+0x44>
f0009d5c:	e24bd004 	sub	sp, fp, #4
f0009d60:	e8bd8800 	pop	{fp, pc}

f0009d64 <cap_list_move>:
f0009d64:	e92d4800 	push	{fp, lr}
f0009d68:	e28db004 	add	fp, sp, #4
f0009d6c:	e24dd010 	sub	sp, sp, #16
f0009d70:	e50b0010 	str	r0, [fp, #-16]
f0009d74:	e50b1014 	str	r1, [fp, #-20]
f0009d78:	e51b3014 	ldr	r3, [fp, #-20]
f0009d7c:	e5933000 	ldr	r3, [r3]
f0009d80:	e3530000 	cmp	r3, #0
f0009d84:	1a000000 	bne	f0009d8c <cap_list_move+0x28>
f0009d88:	ea000005 	b	f0009da4 <cap_list_move+0x40>
f0009d8c:	e51b0014 	ldr	r0, [fp, #-20]
f0009d90:	ebffffb8 	bl	f0009c78 <cap_list_detach>
f0009d94:	e50b0008 	str	r0, [fp, #-8]
f0009d98:	e51b0008 	ldr	r0, [fp, #-8]
f0009d9c:	e51b1010 	ldr	r1, [fp, #-16]
f0009da0:	ebffffcd 	bl	f0009cdc <cap_list_attach>
f0009da4:	e24bd004 	sub	sp, fp, #4
f0009da8:	e8bd8800 	pop	{fp, pc}

f0009dac <tid_to_cid>:
f0009dac:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f0009db0:	e28db000 	add	fp, sp, #0
f0009db4:	e24dd00c 	sub	sp, sp, #12
f0009db8:	e50b0008 	str	r0, [fp, #-8]
f0009dbc:	e51b3008 	ldr	r3, [fp, #-8]
f0009dc0:	e1a03c23 	lsr	r3, r3, #24
f0009dc4:	e1a00003 	mov	r0, r3
f0009dc8:	e24bd000 	sub	sp, fp, #0
f0009dcc:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0009dd0:	e12fff1e 	bx	lr

f0009dd4 <set_task_ids>:
f0009dd4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f0009dd8:	e28db000 	add	fp, sp, #0
f0009ddc:	e24dd00c 	sub	sp, sp, #12
f0009de0:	e50b0008 	str	r0, [fp, #-8]
f0009de4:	e50b100c 	str	r1, [fp, #-12]
f0009de8:	e51b300c 	ldr	r3, [fp, #-12]
f0009dec:	e5932000 	ldr	r2, [r3]
f0009df0:	e51b3008 	ldr	r3, [fp, #-8]
f0009df4:	e5832054 	str	r2, [r3, #84]	; 0x54
f0009df8:	e51b300c 	ldr	r3, [fp, #-12]
f0009dfc:	e5932008 	ldr	r2, [r3, #8]
f0009e00:	e51b3008 	ldr	r3, [fp, #-8]
f0009e04:	e5832058 	str	r2, [r3, #88]	; 0x58
f0009e08:	e24bd000 	sub	sp, fp, #0
f0009e0c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0009e10:	e12fff1e 	bx	lr

f0009e14 <init_ktcb_list>:
f0009e14:	e92d4800 	push	{fp, lr}
f0009e18:	e28db004 	add	fp, sp, #4
f0009e1c:	e24dd008 	sub	sp, sp, #8
f0009e20:	e50b0008 	str	r0, [fp, #-8]
f0009e24:	e51b0008 	ldr	r0, [fp, #-8]
f0009e28:	e3a01000 	mov	r1, #0
f0009e2c:	e3a02010 	mov	r2, #16
f0009e30:	eb003058 	bl	f0015f98 <memset>
f0009e34:	e51b3008 	ldr	r3, [fp, #-8]
f0009e38:	e2833008 	add	r3, r3, #8
f0009e3c:	e1a00003 	mov	r0, r3
f0009e40:	ebffff50 	bl	f0009b88 <spin_lock_init>
f0009e44:	e51b3008 	ldr	r3, [fp, #-8]
f0009e48:	e1a00003 	mov	r0, r3
f0009e4c:	ebfffed4 	bl	f00099a4 <link_init>
f0009e50:	e24bd004 	sub	sp, fp, #4
f0009e54:	e8bd8800 	pop	{fp, pc}

f0009e58 <tcb_init>:
f0009e58:	e92d4800 	push	{fp, lr}
f0009e5c:	e28db004 	add	fp, sp, #4
f0009e60:	e24dd008 	sub	sp, sp, #8
f0009e64:	e50b0008 	str	r0, [fp, #-8]
f0009e68:	e51b3008 	ldr	r3, [fp, #-8]
f0009e6c:	e2833088 	add	r3, r3, #136	; 0x88
f0009e70:	e1a00003 	mov	r0, r3
f0009e74:	ebfffeca 	bl	f00099a4 <link_init>
f0009e78:	e51b3008 	ldr	r3, [fp, #-8]
f0009e7c:	e2833068 	add	r3, r3, #104	; 0x68
f0009e80:	e1a00003 	mov	r0, r3
f0009e84:	ebffff65 	bl	f0009c20 <mutex_init>
f0009e88:	e51b3008 	ldr	r3, [fp, #-8]
f0009e8c:	e283307c 	add	r3, r3, #124	; 0x7c
f0009e90:	e1a00003 	mov	r0, r3
f0009e94:	ebffff3b 	bl	f0009b88 <spin_lock_init>
f0009e98:	e51b0008 	ldr	r0, [fp, #-8]
f0009e9c:	e3a01004 	mov	r1, #4
f0009ea0:	ebfffbbf 	bl	f0008da4 <sched_init_task>
f0009ea4:	e51b3008 	ldr	r3, [fp, #-8]
f0009ea8:	e2833f42 	add	r3, r3, #264	; 0x108
f0009eac:	e1a00003 	mov	r0, r3
f0009eb0:	ebffff34 	bl	f0009b88 <spin_lock_init>
f0009eb4:	e51b3008 	ldr	r3, [fp, #-8]
f0009eb8:	e28330d4 	add	r3, r3, #212	; 0xd4
f0009ebc:	e1a00003 	mov	r0, r3
f0009ec0:	ebffff48 	bl	f0009be8 <waitqueue_head_init>
f0009ec4:	e51b3008 	ldr	r3, [fp, #-8]
f0009ec8:	e28330c4 	add	r3, r3, #196	; 0xc4
f0009ecc:	e1a00003 	mov	r0, r3
f0009ed0:	ebffff44 	bl	f0009be8 <waitqueue_head_init>
f0009ed4:	e51b3008 	ldr	r3, [fp, #-8]
f0009ed8:	e28330f8 	add	r3, r3, #248	; 0xf8
f0009edc:	e1a00003 	mov	r0, r3
f0009ee0:	ebffff40 	bl	f0009be8 <waitqueue_head_init>
f0009ee4:	e24bd004 	sub	sp, fp, #4
f0009ee8:	e8bd8800 	pop	{fp, pc}

f0009eec <tcb_alloc_init>:
f0009eec:	e92d4800 	push	{fp, lr}
f0009ef0:	e28db004 	add	fp, sp, #4
f0009ef4:	e24dd018 	sub	sp, sp, #24
f0009ef8:	e50b0018 	str	r0, [fp, #-24]
f0009efc:	ebffff54 	bl	f0009c54 <current_task>
f0009f00:	e1a03000 	mov	r3, r0
f0009f04:	e59330b4 	ldr	r3, [r3, #180]	; 0xb4
f0009f08:	e2833014 	add	r3, r3, #20
f0009f0c:	e1a00003 	mov	r0, r3
f0009f10:	eb0007c0 	bl	f000be18 <ktcb_cap_alloc>
f0009f14:	e50b0008 	str	r0, [fp, #-8]
f0009f18:	e51b3008 	ldr	r3, [fp, #-8]
f0009f1c:	e3530000 	cmp	r3, #0
f0009f20:	1a000001 	bne	f0009f2c <tcb_alloc_init+0x40>
f0009f24:	e3a03000 	mov	r3, #0
f0009f28:	ea000013 	b	f0009f7c <tcb_alloc_init+0x90>
f0009f2c:	e59f0054 	ldr	r0, [pc, #84]	; f0009f88 <tcb_alloc_init+0x9c>
f0009f30:	eb0034dc 	bl	f00172a8 <id_new>
f0009f34:	e1a03000 	mov	r3, r0
f0009f38:	e50b3014 	str	r3, [fp, #-20]
f0009f3c:	e51b2014 	ldr	r2, [fp, #-20]
f0009f40:	e51b3018 	ldr	r3, [fp, #-24]
f0009f44:	e1a03c03 	lsl	r3, r3, #24
f0009f48:	e1823003 	orr	r3, r2, r3
f0009f4c:	e50b3014 	str	r3, [fp, #-20]
f0009f50:	e3e03000 	mvn	r3, #0
f0009f54:	e50b300c 	str	r3, [fp, #-12]
f0009f58:	e3e03000 	mvn	r3, #0
f0009f5c:	e50b3010 	str	r3, [fp, #-16]
f0009f60:	e24b3014 	sub	r3, fp, #20
f0009f64:	e51b0008 	ldr	r0, [fp, #-8]
f0009f68:	e1a01003 	mov	r1, r3
f0009f6c:	ebffff98 	bl	f0009dd4 <set_task_ids>
f0009f70:	e51b0008 	ldr	r0, [fp, #-8]
f0009f74:	ebffffb7 	bl	f0009e58 <tcb_init>
f0009f78:	e51b3008 	ldr	r3, [fp, #-8]
f0009f7c:	e1a00003 	mov	r0, r3
f0009f80:	e24bd004 	sub	sp, fp, #4
f0009f84:	e8bd8800 	pop	{fp, pc}
f0009f88:	f002e0a8 	.word	0xf002e0a8

f0009f8c <tcb_delete_pager>:
f0009f8c:	e92d4810 	push	{r4, fp, lr}
f0009f90:	e28db008 	add	fp, sp, #8
f0009f94:	e24dd014 	sub	sp, sp, #20
f0009f98:	e50b0018 	str	r0, [fp, #-24]
f0009f9c:	e51b3018 	ldr	r3, [fp, #-24]
f0009fa0:	e59330b8 	ldr	r3, [r3, #184]	; 0xb8
f0009fa4:	e59330ac 	ldr	r3, [r3, #172]	; 0xac
f0009fa8:	e2833018 	add	r3, r3, #24
f0009fac:	e50b3010 	str	r3, [fp, #-16]
f0009fb0:	e51b3018 	ldr	r3, [fp, #-24]
f0009fb4:	e1a03a03 	lsl	r3, r3, #20
f0009fb8:	e1a03a23 	lsr	r3, r3, #20
f0009fbc:	e3530000 	cmp	r3, #0
f0009fc0:	0a000005 	beq	f0009fdc <tcb_delete_pager+0x50>
f0009fc4:	e59f0318 	ldr	r0, [pc, #792]	; f000a2e4 <tcb_delete_pager+0x358>
f0009fc8:	e59f1318 	ldr	r1, [pc, #792]	; f000a2e8 <tcb_delete_pager+0x35c>
f0009fcc:	e59f2318 	ldr	r2, [pc, #792]	; f000a2ec <tcb_delete_pager+0x360>
f0009fd0:	e3a0304d 	mov	r3, #77	; 0x4d
f0009fd4:	eb002fc4 	bl	f0015eec <printk>
f0009fd8:	eafffffe 	b	f0009fd8 <tcb_delete_pager+0x4c>
f0009fdc:	e51b3018 	ldr	r3, [fp, #-24]
f0009fe0:	e59330f8 	ldr	r3, [r3, #248]	; 0xf8
f0009fe4:	e3530000 	cmp	r3, #0
f0009fe8:	da000005 	ble	f000a004 <tcb_delete_pager+0x78>
f0009fec:	e59f02f0 	ldr	r0, [pc, #752]	; f000a2e4 <tcb_delete_pager+0x358>
f0009ff0:	e59f12f0 	ldr	r1, [pc, #752]	; f000a2e8 <tcb_delete_pager+0x35c>
f0009ff4:	e59f22f0 	ldr	r2, [pc, #752]	; f000a2ec <tcb_delete_pager+0x360>
f0009ff8:	e3a0304e 	mov	r3, #78	; 0x4e
f0009ffc:	eb002fba 	bl	f0015eec <printk>
f000a000:	eafffffe 	b	f000a000 <tcb_delete_pager+0x74>
f000a004:	e51b3018 	ldr	r3, [fp, #-24]
f000a008:	e59330d4 	ldr	r3, [r3, #212]	; 0xd4
f000a00c:	e3530000 	cmp	r3, #0
f000a010:	da000005 	ble	f000a02c <tcb_delete_pager+0xa0>
f000a014:	e59f02c8 	ldr	r0, [pc, #712]	; f000a2e4 <tcb_delete_pager+0x358>
f000a018:	e59f12c8 	ldr	r1, [pc, #712]	; f000a2e8 <tcb_delete_pager+0x35c>
f000a01c:	e59f22c8 	ldr	r2, [pc, #712]	; f000a2ec <tcb_delete_pager+0x360>
f000a020:	e3a0304f 	mov	r3, #79	; 0x4f
f000a024:	eb002fb0 	bl	f0015eec <printk>
f000a028:	eafffffe 	b	f000a028 <tcb_delete_pager+0x9c>
f000a02c:	e51b3018 	ldr	r3, [fp, #-24]
f000a030:	e59330c4 	ldr	r3, [r3, #196]	; 0xc4
f000a034:	e3530000 	cmp	r3, #0
f000a038:	da000005 	ble	f000a054 <tcb_delete_pager+0xc8>
f000a03c:	e59f02a0 	ldr	r0, [pc, #672]	; f000a2e4 <tcb_delete_pager+0x358>
f000a040:	e59f12a0 	ldr	r1, [pc, #672]	; f000a2e8 <tcb_delete_pager+0x35c>
f000a044:	e59f22a0 	ldr	r2, [pc, #672]	; f000a2ec <tcb_delete_pager+0x360>
f000a048:	e3a03050 	mov	r3, #80	; 0x50
f000a04c:	eb002fa6 	bl	f0015eec <printk>
f000a050:	eafffffe 	b	f000a050 <tcb_delete_pager+0xc4>
f000a054:	e51b3018 	ldr	r3, [fp, #-24]
f000a058:	e593405c 	ldr	r4, [r3, #92]	; 0x5c
f000a05c:	ebfffefc 	bl	f0009c54 <current_task>
f000a060:	e1a03000 	mov	r3, r0
f000a064:	e593305c 	ldr	r3, [r3, #92]	; 0x5c
f000a068:	e1540003 	cmp	r4, r3
f000a06c:	0a000005 	beq	f000a088 <tcb_delete_pager+0xfc>
f000a070:	e59f026c 	ldr	r0, [pc, #620]	; f000a2e4 <tcb_delete_pager+0x358>
f000a074:	e59f126c 	ldr	r1, [pc, #620]	; f000a2e8 <tcb_delete_pager+0x35c>
f000a078:	e59f226c 	ldr	r2, [pc, #620]	; f000a2ec <tcb_delete_pager+0x360>
f000a07c:	e3a03051 	mov	r3, #81	; 0x51
f000a080:	eb002f99 	bl	f0015eec <printk>
f000a084:	eafffffe 	b	f000a084 <tcb_delete_pager+0xf8>
f000a088:	e51b3018 	ldr	r3, [fp, #-24]
f000a08c:	e5d33084 	ldrb	r3, [r3, #132]	; 0x84
f000a090:	e3530000 	cmp	r3, #0
f000a094:	0a000005 	beq	f000a0b0 <tcb_delete_pager+0x124>
f000a098:	e59f0244 	ldr	r0, [pc, #580]	; f000a2e4 <tcb_delete_pager+0x358>
f000a09c:	e59f1244 	ldr	r1, [pc, #580]	; f000a2e8 <tcb_delete_pager+0x35c>
f000a0a0:	e59f2244 	ldr	r2, [pc, #580]	; f000a2ec <tcb_delete_pager+0x360>
f000a0a4:	e3a03052 	mov	r3, #82	; 0x52
f000a0a8:	eb002f8f 	bl	f0015eec <printk>
f000a0ac:	eafffffe 	b	f000a0ac <tcb_delete_pager+0x120>
f000a0b0:	e51b3018 	ldr	r3, [fp, #-24]
f000a0b4:	e2833048 	add	r3, r3, #72	; 0x48
f000a0b8:	e1a00003 	mov	r0, r3
f000a0bc:	ebfffe9c 	bl	f0009b34 <list_empty>
f000a0c0:	e1a03000 	mov	r3, r0
f000a0c4:	e3530000 	cmp	r3, #0
f000a0c8:	1a000005 	bne	f000a0e4 <tcb_delete_pager+0x158>
f000a0cc:	e59f0210 	ldr	r0, [pc, #528]	; f000a2e4 <tcb_delete_pager+0x358>
f000a0d0:	e59f1210 	ldr	r1, [pc, #528]	; f000a2e8 <tcb_delete_pager+0x35c>
f000a0d4:	e59f2210 	ldr	r2, [pc, #528]	; f000a2ec <tcb_delete_pager+0x360>
f000a0d8:	e3a03053 	mov	r3, #83	; 0x53
f000a0dc:	eb002f82 	bl	f0015eec <printk>
f000a0e0:	eafffffe 	b	f000a0e0 <tcb_delete_pager+0x154>
f000a0e4:	e51b3018 	ldr	r3, [fp, #-24]
f000a0e8:	e5933050 	ldr	r3, [r3, #80]	; 0x50
f000a0ec:	e3530000 	cmp	r3, #0
f000a0f0:	0a000005 	beq	f000a10c <tcb_delete_pager+0x180>
f000a0f4:	e59f01e8 	ldr	r0, [pc, #488]	; f000a2e4 <tcb_delete_pager+0x358>
f000a0f8:	e59f11e8 	ldr	r1, [pc, #488]	; f000a2e8 <tcb_delete_pager+0x35c>
f000a0fc:	e59f21e8 	ldr	r2, [pc, #488]	; f000a2ec <tcb_delete_pager+0x360>
f000a100:	e3a03054 	mov	r3, #84	; 0x54
f000a104:	eb002f78 	bl	f0015eec <printk>
f000a108:	eafffffe 	b	f000a108 <tcb_delete_pager+0x17c>
f000a10c:	ebfffed0 	bl	f0009c54 <current_task>
f000a110:	e1a02000 	mov	r2, r0
f000a114:	e51b3018 	ldr	r3, [fp, #-24]
f000a118:	e1520003 	cmp	r2, r3
f000a11c:	1a000005 	bne	f000a138 <tcb_delete_pager+0x1ac>
f000a120:	e59f01bc 	ldr	r0, [pc, #444]	; f000a2e4 <tcb_delete_pager+0x358>
f000a124:	e59f11bc 	ldr	r1, [pc, #444]	; f000a2e8 <tcb_delete_pager+0x35c>
f000a128:	e59f21bc 	ldr	r2, [pc, #444]	; f000a2ec <tcb_delete_pager+0x360>
f000a12c:	e3a03055 	mov	r3, #85	; 0x55
f000a130:	eb002f6d 	bl	f0015eec <printk>
f000a134:	eafffffe 	b	f000a134 <tcb_delete_pager+0x1a8>
f000a138:	e51b3018 	ldr	r3, [fp, #-24]
f000a13c:	e59330ac 	ldr	r3, [r3, #172]	; 0xac
f000a140:	e3530000 	cmp	r3, #0
f000a144:	0a000005 	beq	f000a160 <tcb_delete_pager+0x1d4>
f000a148:	e59f0194 	ldr	r0, [pc, #404]	; f000a2e4 <tcb_delete_pager+0x358>
f000a14c:	e59f1194 	ldr	r1, [pc, #404]	; f000a2e8 <tcb_delete_pager+0x35c>
f000a150:	e59f2194 	ldr	r2, [pc, #404]	; f000a2ec <tcb_delete_pager+0x360>
f000a154:	e3a03056 	mov	r3, #86	; 0x56
f000a158:	eb002f63 	bl	f0015eec <printk>
f000a15c:	eafffffe 	b	f000a15c <tcb_delete_pager+0x1d0>
f000a160:	e51b3018 	ldr	r3, [fp, #-24]
f000a164:	e593310c 	ldr	r3, [r3, #268]	; 0x10c
f000a168:	e3530000 	cmp	r3, #0
f000a16c:	0a000005 	beq	f000a188 <tcb_delete_pager+0x1fc>
f000a170:	e59f016c 	ldr	r0, [pc, #364]	; f000a2e4 <tcb_delete_pager+0x358>
f000a174:	e59f116c 	ldr	r1, [pc, #364]	; f000a2e8 <tcb_delete_pager+0x35c>
f000a178:	e59f216c 	ldr	r2, [pc, #364]	; f000a2ec <tcb_delete_pager+0x360>
f000a17c:	e3a03057 	mov	r3, #87	; 0x57
f000a180:	eb002f59 	bl	f0015eec <printk>
f000a184:	eafffffe 	b	f000a184 <tcb_delete_pager+0x1f8>
f000a188:	e51b3018 	ldr	r3, [fp, #-24]
f000a18c:	e5933110 	ldr	r3, [r3, #272]	; 0x110
f000a190:	e3530000 	cmp	r3, #0
f000a194:	0a000005 	beq	f000a1b0 <tcb_delete_pager+0x224>
f000a198:	e59f0144 	ldr	r0, [pc, #324]	; f000a2e4 <tcb_delete_pager+0x358>
f000a19c:	e59f1144 	ldr	r1, [pc, #324]	; f000a2e8 <tcb_delete_pager+0x35c>
f000a1a0:	e59f2144 	ldr	r2, [pc, #324]	; f000a2ec <tcb_delete_pager+0x360>
f000a1a4:	e3a03058 	mov	r3, #88	; 0x58
f000a1a8:	eb002f4f 	bl	f0015eec <printk>
f000a1ac:	eafffffe 	b	f000a1ac <tcb_delete_pager+0x220>
f000a1b0:	e51b3018 	ldr	r3, [fp, #-24]
f000a1b4:	e59330c0 	ldr	r3, [r3, #192]	; 0xc0
f000a1b8:	e3530000 	cmp	r3, #0
f000a1bc:	0a000005 	beq	f000a1d8 <tcb_delete_pager+0x24c>
f000a1c0:	e59f011c 	ldr	r0, [pc, #284]	; f000a2e4 <tcb_delete_pager+0x358>
f000a1c4:	e59f111c 	ldr	r1, [pc, #284]	; f000a2e8 <tcb_delete_pager+0x35c>
f000a1c8:	e59f211c 	ldr	r2, [pc, #284]	; f000a2ec <tcb_delete_pager+0x360>
f000a1cc:	e3a03059 	mov	r3, #89	; 0x59
f000a1d0:	eb002f45 	bl	f0015eec <printk>
f000a1d4:	eafffffe 	b	f000a1d4 <tcb_delete_pager+0x248>
f000a1d8:	e51b3018 	ldr	r3, [fp, #-24]
f000a1dc:	e59330b8 	ldr	r3, [r3, #184]	; 0xb8
f000a1e0:	e2833018 	add	r3, r3, #24
f000a1e4:	e1a00003 	mov	r0, r3
f000a1e8:	ebfffe70 	bl	f0009bb0 <spin_lock>
f000a1ec:	e51b3018 	ldr	r3, [fp, #-24]
f000a1f0:	e59330b4 	ldr	r3, [r3, #180]	; 0xb4
f000a1f4:	e283300c 	add	r3, r3, #12
f000a1f8:	e1a00003 	mov	r0, r3
f000a1fc:	ebfffe6b 	bl	f0009bb0 <spin_lock>
f000a200:	e51b3018 	ldr	r3, [fp, #-24]
f000a204:	e59330b4 	ldr	r3, [r3, #180]	; 0xb4
f000a208:	e5932020 	ldr	r2, [r3, #32]
f000a20c:	e2422001 	sub	r2, r2, #1
f000a210:	e5832020 	str	r2, [r3, #32]
f000a214:	e5933020 	ldr	r3, [r3, #32]
f000a218:	e3530000 	cmp	r3, #0
f000a21c:	0a000005 	beq	f000a238 <tcb_delete_pager+0x2ac>
f000a220:	e59f00bc 	ldr	r0, [pc, #188]	; f000a2e4 <tcb_delete_pager+0x358>
f000a224:	e59f10bc 	ldr	r1, [pc, #188]	; f000a2e8 <tcb_delete_pager+0x35c>
f000a228:	e59f20bc 	ldr	r2, [pc, #188]	; f000a2ec <tcb_delete_pager+0x360>
f000a22c:	e3a03065 	mov	r3, #101	; 0x65
f000a230:	eb002f2d 	bl	f0015eec <printk>
f000a234:	eafffffe 	b	f000a234 <tcb_delete_pager+0x2a8>
f000a238:	e51b3018 	ldr	r3, [fp, #-24]
f000a23c:	e59320b4 	ldr	r2, [r3, #180]	; 0xb4
f000a240:	e51b3018 	ldr	r3, [fp, #-24]
f000a244:	e59330b8 	ldr	r3, [r3, #184]	; 0xb8
f000a248:	e1a00002 	mov	r0, r2
f000a24c:	e1a01003 	mov	r1, r3
f000a250:	eb0004bc 	bl	f000b548 <address_space_remove>
f000a254:	e51b3018 	ldr	r3, [fp, #-24]
f000a258:	e59330b4 	ldr	r3, [r3, #180]	; 0xb4
f000a25c:	e2833014 	add	r3, r3, #20
f000a260:	e51b0010 	ldr	r0, [fp, #-16]
f000a264:	e1a01003 	mov	r1, r3
f000a268:	ebfffebd 	bl	f0009d64 <cap_list_move>
f000a26c:	e51b3018 	ldr	r3, [fp, #-24]
f000a270:	e59330b4 	ldr	r3, [r3, #180]	; 0xb4
f000a274:	e283300c 	add	r3, r3, #12
f000a278:	e1a00003 	mov	r0, r3
f000a27c:	ebfffe52 	bl	f0009bcc <spin_unlock>
f000a280:	e51b3018 	ldr	r3, [fp, #-24]
f000a284:	e59330b8 	ldr	r3, [r3, #184]	; 0xb8
f000a288:	e2833018 	add	r3, r3, #24
f000a28c:	e1a00003 	mov	r0, r3
f000a290:	ebfffe4d 	bl	f0009bcc <spin_unlock>
f000a294:	e51b3018 	ldr	r3, [fp, #-24]
f000a298:	e59330b4 	ldr	r3, [r3, #180]	; 0xb4
f000a29c:	e1a00003 	mov	r0, r3
f000a2a0:	e51b1010 	ldr	r1, [fp, #-16]
f000a2a4:	eb0004d1 	bl	f000b5f0 <address_space_delete>
f000a2a8:	e51b3018 	ldr	r3, [fp, #-24]
f000a2ac:	e5933054 	ldr	r3, [r3, #84]	; 0x54
f000a2b0:	e3c324ff 	bic	r2, r3, #-16777216	; 0xff000000
f000a2b4:	e51b3018 	ldr	r3, [fp, #-24]
f000a2b8:	e5832054 	str	r2, [r3, #84]	; 0x54
f000a2bc:	e51b3018 	ldr	r3, [fp, #-24]
f000a2c0:	e5933054 	ldr	r3, [r3, #84]	; 0x54
f000a2c4:	e59f0024 	ldr	r0, [pc, #36]	; f000a2f0 <tcb_delete_pager+0x364>
f000a2c8:	e1a01003 	mov	r1, r3
f000a2cc:	eb003418 	bl	f0017334 <id_del>
f000a2d0:	e51b0018 	ldr	r0, [fp, #-24]
f000a2d4:	e51b1010 	ldr	r1, [fp, #-16]
f000a2d8:	eb00077f 	bl	f000c0dc <ktcb_cap_free>
f000a2dc:	e24bd008 	sub	sp, fp, #8
f000a2e0:	e8bd8810 	pop	{r4, fp, pc}
f000a2e4:	f001e39c 	.word	0xf001e39c
f000a2e8:	f001e3c4 	.word	0xf001e3c4
f000a2ec:	f001e40c 	.word	0xf001e40c
f000a2f0:	f002e0a8 	.word	0xf002e0a8

f000a2f4 <tcb_delete>:
f000a2f4:	e92d4810 	push	{r4, fp, lr}
f000a2f8:	e28db008 	add	fp, sp, #8
f000a2fc:	e24dd014 	sub	sp, sp, #20
f000a300:	e50b0018 	str	r0, [fp, #-24]
f000a304:	e51b3018 	ldr	r3, [fp, #-24]
f000a308:	e59330bc 	ldr	r3, [r3, #188]	; 0xbc
f000a30c:	e50b3010 	str	r3, [fp, #-16]
f000a310:	e51b3018 	ldr	r3, [fp, #-24]
f000a314:	e1a03a03 	lsl	r3, r3, #20
f000a318:	e1a03a23 	lsr	r3, r3, #20
f000a31c:	e3530000 	cmp	r3, #0
f000a320:	0a000005 	beq	f000a33c <tcb_delete+0x48>
f000a324:	e59f03d8 	ldr	r0, [pc, #984]	; f000a704 <tcb_delete+0x410>
f000a328:	e59f13d8 	ldr	r1, [pc, #984]	; f000a708 <tcb_delete+0x414>
f000a32c:	e59f23d8 	ldr	r2, [pc, #984]	; f000a70c <tcb_delete+0x418>
f000a330:	e3a0307f 	mov	r3, #127	; 0x7f
f000a334:	eb002eec 	bl	f0015eec <printk>
f000a338:	eafffffe 	b	f000a338 <tcb_delete+0x44>
f000a33c:	e51b3018 	ldr	r3, [fp, #-24]
f000a340:	e59330f8 	ldr	r3, [r3, #248]	; 0xf8
f000a344:	e3530000 	cmp	r3, #0
f000a348:	da000005 	ble	f000a364 <tcb_delete+0x70>
f000a34c:	e59f03b0 	ldr	r0, [pc, #944]	; f000a704 <tcb_delete+0x410>
f000a350:	e59f13b0 	ldr	r1, [pc, #944]	; f000a708 <tcb_delete+0x414>
f000a354:	e59f23b0 	ldr	r2, [pc, #944]	; f000a70c <tcb_delete+0x418>
f000a358:	e3a03080 	mov	r3, #128	; 0x80
f000a35c:	eb002ee2 	bl	f0015eec <printk>
f000a360:	eafffffe 	b	f000a360 <tcb_delete+0x6c>
f000a364:	e51b3018 	ldr	r3, [fp, #-24]
f000a368:	e59330d4 	ldr	r3, [r3, #212]	; 0xd4
f000a36c:	e3530000 	cmp	r3, #0
f000a370:	da000005 	ble	f000a38c <tcb_delete+0x98>
f000a374:	e59f0388 	ldr	r0, [pc, #904]	; f000a704 <tcb_delete+0x410>
f000a378:	e59f1388 	ldr	r1, [pc, #904]	; f000a708 <tcb_delete+0x414>
f000a37c:	e59f2388 	ldr	r2, [pc, #904]	; f000a70c <tcb_delete+0x418>
f000a380:	e3a03081 	mov	r3, #129	; 0x81
f000a384:	eb002ed8 	bl	f0015eec <printk>
f000a388:	eafffffe 	b	f000a388 <tcb_delete+0x94>
f000a38c:	e51b3018 	ldr	r3, [fp, #-24]
f000a390:	e59330c4 	ldr	r3, [r3, #196]	; 0xc4
f000a394:	e3530000 	cmp	r3, #0
f000a398:	da000005 	ble	f000a3b4 <tcb_delete+0xc0>
f000a39c:	e59f0360 	ldr	r0, [pc, #864]	; f000a704 <tcb_delete+0x410>
f000a3a0:	e59f1360 	ldr	r1, [pc, #864]	; f000a708 <tcb_delete+0x414>
f000a3a4:	e59f2360 	ldr	r2, [pc, #864]	; f000a70c <tcb_delete+0x418>
f000a3a8:	e3a03082 	mov	r3, #130	; 0x82
f000a3ac:	eb002ece 	bl	f0015eec <printk>
f000a3b0:	eafffffe 	b	f000a3b0 <tcb_delete+0xbc>
f000a3b4:	e51b3018 	ldr	r3, [fp, #-24]
f000a3b8:	e593405c 	ldr	r4, [r3, #92]	; 0x5c
f000a3bc:	ebfffe24 	bl	f0009c54 <current_task>
f000a3c0:	e1a03000 	mov	r3, r0
f000a3c4:	e593305c 	ldr	r3, [r3, #92]	; 0x5c
f000a3c8:	e1540003 	cmp	r4, r3
f000a3cc:	0a000005 	beq	f000a3e8 <tcb_delete+0xf4>
f000a3d0:	e59f032c 	ldr	r0, [pc, #812]	; f000a704 <tcb_delete+0x410>
f000a3d4:	e59f132c 	ldr	r1, [pc, #812]	; f000a708 <tcb_delete+0x414>
f000a3d8:	e59f232c 	ldr	r2, [pc, #812]	; f000a70c <tcb_delete+0x418>
f000a3dc:	e3a03083 	mov	r3, #131	; 0x83
f000a3e0:	eb002ec1 	bl	f0015eec <printk>
f000a3e4:	eafffffe 	b	f000a3e4 <tcb_delete+0xf0>
f000a3e8:	e51b3018 	ldr	r3, [fp, #-24]
f000a3ec:	e5d33084 	ldrb	r3, [r3, #132]	; 0x84
f000a3f0:	e3530000 	cmp	r3, #0
f000a3f4:	0a000005 	beq	f000a410 <tcb_delete+0x11c>
f000a3f8:	e59f0304 	ldr	r0, [pc, #772]	; f000a704 <tcb_delete+0x410>
f000a3fc:	e59f1304 	ldr	r1, [pc, #772]	; f000a708 <tcb_delete+0x414>
f000a400:	e59f2304 	ldr	r2, [pc, #772]	; f000a70c <tcb_delete+0x418>
f000a404:	e3a03084 	mov	r3, #132	; 0x84
f000a408:	eb002eb7 	bl	f0015eec <printk>
f000a40c:	eafffffe 	b	f000a40c <tcb_delete+0x118>
f000a410:	e51b3018 	ldr	r3, [fp, #-24]
f000a414:	e2833048 	add	r3, r3, #72	; 0x48
f000a418:	e1a00003 	mov	r0, r3
f000a41c:	ebfffdc4 	bl	f0009b34 <list_empty>
f000a420:	e1a03000 	mov	r3, r0
f000a424:	e3530000 	cmp	r3, #0
f000a428:	1a000005 	bne	f000a444 <tcb_delete+0x150>
f000a42c:	e59f02d0 	ldr	r0, [pc, #720]	; f000a704 <tcb_delete+0x410>
f000a430:	e59f12d0 	ldr	r1, [pc, #720]	; f000a708 <tcb_delete+0x414>
f000a434:	e59f22d0 	ldr	r2, [pc, #720]	; f000a70c <tcb_delete+0x418>
f000a438:	e3a03085 	mov	r3, #133	; 0x85
f000a43c:	eb002eaa 	bl	f0015eec <printk>
f000a440:	eafffffe 	b	f000a440 <tcb_delete+0x14c>
f000a444:	e51b3018 	ldr	r3, [fp, #-24]
f000a448:	e5933050 	ldr	r3, [r3, #80]	; 0x50
f000a44c:	e3530000 	cmp	r3, #0
f000a450:	0a000005 	beq	f000a46c <tcb_delete+0x178>
f000a454:	e59f02a8 	ldr	r0, [pc, #680]	; f000a704 <tcb_delete+0x410>
f000a458:	e59f12a8 	ldr	r1, [pc, #680]	; f000a708 <tcb_delete+0x414>
f000a45c:	e59f22a8 	ldr	r2, [pc, #680]	; f000a70c <tcb_delete+0x418>
f000a460:	e3a03086 	mov	r3, #134	; 0x86
f000a464:	eb002ea0 	bl	f0015eec <printk>
f000a468:	eafffffe 	b	f000a468 <tcb_delete+0x174>
f000a46c:	ebfffdf8 	bl	f0009c54 <current_task>
f000a470:	e1a02000 	mov	r2, r0
f000a474:	e51b3018 	ldr	r3, [fp, #-24]
f000a478:	e1520003 	cmp	r2, r3
f000a47c:	1a000005 	bne	f000a498 <tcb_delete+0x1a4>
f000a480:	e59f027c 	ldr	r0, [pc, #636]	; f000a704 <tcb_delete+0x410>
f000a484:	e59f127c 	ldr	r1, [pc, #636]	; f000a708 <tcb_delete+0x414>
f000a488:	e59f227c 	ldr	r2, [pc, #636]	; f000a70c <tcb_delete+0x418>
f000a48c:	e3a03087 	mov	r3, #135	; 0x87
f000a490:	eb002e95 	bl	f0015eec <printk>
f000a494:	eafffffe 	b	f000a494 <tcb_delete+0x1a0>
f000a498:	e51b3018 	ldr	r3, [fp, #-24]
f000a49c:	e59330ac 	ldr	r3, [r3, #172]	; 0xac
f000a4a0:	e3530000 	cmp	r3, #0
f000a4a4:	0a000005 	beq	f000a4c0 <tcb_delete+0x1cc>
f000a4a8:	e59f0254 	ldr	r0, [pc, #596]	; f000a704 <tcb_delete+0x410>
f000a4ac:	e59f1254 	ldr	r1, [pc, #596]	; f000a708 <tcb_delete+0x414>
f000a4b0:	e59f2254 	ldr	r2, [pc, #596]	; f000a70c <tcb_delete+0x418>
f000a4b4:	e3a03088 	mov	r3, #136	; 0x88
f000a4b8:	eb002e8b 	bl	f0015eec <printk>
f000a4bc:	eafffffe 	b	f000a4bc <tcb_delete+0x1c8>
f000a4c0:	e51b3018 	ldr	r3, [fp, #-24]
f000a4c4:	e593310c 	ldr	r3, [r3, #268]	; 0x10c
f000a4c8:	e3530000 	cmp	r3, #0
f000a4cc:	0a000005 	beq	f000a4e8 <tcb_delete+0x1f4>
f000a4d0:	e59f022c 	ldr	r0, [pc, #556]	; f000a704 <tcb_delete+0x410>
f000a4d4:	e59f122c 	ldr	r1, [pc, #556]	; f000a708 <tcb_delete+0x414>
f000a4d8:	e59f222c 	ldr	r2, [pc, #556]	; f000a70c <tcb_delete+0x418>
f000a4dc:	e3a03089 	mov	r3, #137	; 0x89
f000a4e0:	eb002e81 	bl	f0015eec <printk>
f000a4e4:	eafffffe 	b	f000a4e4 <tcb_delete+0x1f0>
f000a4e8:	e51b3018 	ldr	r3, [fp, #-24]
f000a4ec:	e5933110 	ldr	r3, [r3, #272]	; 0x110
f000a4f0:	e3530000 	cmp	r3, #0
f000a4f4:	0a000005 	beq	f000a510 <tcb_delete+0x21c>
f000a4f8:	e59f0204 	ldr	r0, [pc, #516]	; f000a704 <tcb_delete+0x410>
f000a4fc:	e59f1204 	ldr	r1, [pc, #516]	; f000a708 <tcb_delete+0x414>
f000a500:	e59f2204 	ldr	r2, [pc, #516]	; f000a70c <tcb_delete+0x418>
f000a504:	e3a0308a 	mov	r3, #138	; 0x8a
f000a508:	eb002e77 	bl	f0015eec <printk>
f000a50c:	eafffffe 	b	f000a50c <tcb_delete+0x218>
f000a510:	e51b3018 	ldr	r3, [fp, #-24]
f000a514:	e59330c0 	ldr	r3, [r3, #192]	; 0xc0
f000a518:	e3530000 	cmp	r3, #0
f000a51c:	0a000005 	beq	f000a538 <tcb_delete+0x244>
f000a520:	e59f01dc 	ldr	r0, [pc, #476]	; f000a704 <tcb_delete+0x410>
f000a524:	e59f11dc 	ldr	r1, [pc, #476]	; f000a708 <tcb_delete+0x414>
f000a528:	e59f21dc 	ldr	r2, [pc, #476]	; f000a70c <tcb_delete+0x418>
f000a52c:	e3a0308b 	mov	r3, #139	; 0x8b
f000a530:	eb002e6d 	bl	f0015eec <printk>
f000a534:	eafffffe 	b	f000a534 <tcb_delete+0x240>
f000a538:	e51b3018 	ldr	r3, [fp, #-24]
f000a53c:	e59330b8 	ldr	r3, [r3, #184]	; 0xb8
f000a540:	e2833018 	add	r3, r3, #24
f000a544:	e1a00003 	mov	r0, r3
f000a548:	ebfffd98 	bl	f0009bb0 <spin_lock>
f000a54c:	e51b3018 	ldr	r3, [fp, #-24]
f000a550:	e59330b4 	ldr	r3, [r3, #180]	; 0xb4
f000a554:	e283300c 	add	r3, r3, #12
f000a558:	e1a00003 	mov	r0, r3
f000a55c:	ebfffd93 	bl	f0009bb0 <spin_lock>
f000a560:	e51b3018 	ldr	r3, [fp, #-24]
f000a564:	e59330b4 	ldr	r3, [r3, #180]	; 0xb4
f000a568:	e5932020 	ldr	r2, [r3, #32]
f000a56c:	e2422001 	sub	r2, r2, #1
f000a570:	e5832020 	str	r2, [r3, #32]
f000a574:	e5933020 	ldr	r3, [r3, #32]
f000a578:	e3530000 	cmp	r3, #0
f000a57c:	aa000005 	bge	f000a598 <tcb_delete+0x2a4>
f000a580:	e59f017c 	ldr	r0, [pc, #380]	; f000a704 <tcb_delete+0x410>
f000a584:	e59f117c 	ldr	r1, [pc, #380]	; f000a708 <tcb_delete+0x414>
f000a588:	e59f217c 	ldr	r2, [pc, #380]	; f000a70c <tcb_delete+0x418>
f000a58c:	e3a03097 	mov	r3, #151	; 0x97
f000a590:	eb002e55 	bl	f0015eec <printk>
f000a594:	eafffffe 	b	f000a594 <tcb_delete+0x2a0>
f000a598:	e51b3018 	ldr	r3, [fp, #-24]
f000a59c:	e59330b4 	ldr	r3, [r3, #180]	; 0xb4
f000a5a0:	e5933020 	ldr	r3, [r3, #32]
f000a5a4:	e3530000 	cmp	r3, #0
f000a5a8:	1a00001a 	bne	f000a618 <tcb_delete+0x324>
f000a5ac:	e51b3018 	ldr	r3, [fp, #-24]
f000a5b0:	e59320b4 	ldr	r2, [r3, #180]	; 0xb4
f000a5b4:	e51b3018 	ldr	r3, [fp, #-24]
f000a5b8:	e59330b8 	ldr	r3, [r3, #184]	; 0xb8
f000a5bc:	e1a00002 	mov	r0, r2
f000a5c0:	e1a01003 	mov	r1, r3
f000a5c4:	eb0003df 	bl	f000b548 <address_space_remove>
f000a5c8:	e51b3018 	ldr	r3, [fp, #-24]
f000a5cc:	e59330b4 	ldr	r3, [r3, #180]	; 0xb4
f000a5d0:	e283300c 	add	r3, r3, #12
f000a5d4:	e1a00003 	mov	r0, r3
f000a5d8:	ebfffd7b 	bl	f0009bcc <spin_unlock>
f000a5dc:	e51b3018 	ldr	r3, [fp, #-24]
f000a5e0:	e59330b8 	ldr	r3, [r3, #184]	; 0xb8
f000a5e4:	e2833018 	add	r3, r3, #24
f000a5e8:	e1a00003 	mov	r0, r3
f000a5ec:	ebfffd76 	bl	f0009bcc <spin_unlock>
f000a5f0:	e51b3018 	ldr	r3, [fp, #-24]
f000a5f4:	e59320b4 	ldr	r2, [r3, #180]	; 0xb4
f000a5f8:	e51b3018 	ldr	r3, [fp, #-24]
f000a5fc:	e59330bc 	ldr	r3, [r3, #188]	; 0xbc
f000a600:	e59330b4 	ldr	r3, [r3, #180]	; 0xb4
f000a604:	e2833014 	add	r3, r3, #20
f000a608:	e1a00002 	mov	r0, r2
f000a60c:	e1a01003 	mov	r1, r3
f000a610:	eb0003f6 	bl	f000b5f0 <address_space_delete>
f000a614:	ea000009 	b	f000a640 <tcb_delete+0x34c>
f000a618:	e51b3018 	ldr	r3, [fp, #-24]
f000a61c:	e59330b4 	ldr	r3, [r3, #180]	; 0xb4
f000a620:	e283300c 	add	r3, r3, #12
f000a624:	e1a00003 	mov	r0, r3
f000a628:	ebfffd67 	bl	f0009bcc <spin_unlock>
f000a62c:	e51b3018 	ldr	r3, [fp, #-24]
f000a630:	e59330b8 	ldr	r3, [r3, #184]	; 0xb8
f000a634:	e2833018 	add	r3, r3, #24
f000a638:	e1a00003 	mov	r0, r3
f000a63c:	ebfffd62 	bl	f0009bcc <spin_unlock>
f000a640:	e51b3018 	ldr	r3, [fp, #-24]
f000a644:	e5933054 	ldr	r3, [r3, #84]	; 0x54
f000a648:	e3c324ff 	bic	r2, r3, #-16777216	; 0xff000000
f000a64c:	e51b3018 	ldr	r3, [fp, #-24]
f000a650:	e5832054 	str	r2, [r3, #84]	; 0x54
f000a654:	e51b3018 	ldr	r3, [fp, #-24]
f000a658:	e5933054 	ldr	r3, [r3, #84]	; 0x54
f000a65c:	e59f00ac 	ldr	r0, [pc, #172]	; f000a710 <tcb_delete+0x41c>
f000a660:	e1a01003 	mov	r1, r3
f000a664:	eb003332 	bl	f0017334 <id_del>
f000a668:	e51b3018 	ldr	r3, [fp, #-24]
f000a66c:	e59330bc 	ldr	r3, [r3, #188]	; 0xbc
f000a670:	e59330b4 	ldr	r3, [r3, #180]	; 0xb4
f000a674:	e2833014 	add	r3, r3, #20
f000a678:	e51b0018 	ldr	r0, [fp, #-24]
f000a67c:	e1a01003 	mov	r1, r3
f000a680:	eb000695 	bl	f000c0dc <ktcb_cap_free>
f000a684:	e51b3010 	ldr	r3, [fp, #-16]
f000a688:	e283307c 	add	r3, r3, #124	; 0x7c
f000a68c:	e1a00003 	mov	r0, r3
f000a690:	ebfffd46 	bl	f0009bb0 <spin_lock>
f000a694:	e51b3010 	ldr	r3, [fp, #-16]
f000a698:	e59330c0 	ldr	r3, [r3, #192]	; 0xc0
f000a69c:	e2431001 	sub	r1, r3, #1
f000a6a0:	e51b2010 	ldr	r2, [fp, #-16]
f000a6a4:	e58210c0 	str	r1, [r2, #192]	; 0xc0
f000a6a8:	e3530000 	cmp	r3, #0
f000a6ac:	aa000005 	bge	f000a6c8 <tcb_delete+0x3d4>
f000a6b0:	e59f004c 	ldr	r0, [pc, #76]	; f000a704 <tcb_delete+0x410>
f000a6b4:	e59f104c 	ldr	r1, [pc, #76]	; f000a708 <tcb_delete+0x414>
f000a6b8:	e59f204c 	ldr	r2, [pc, #76]	; f000a70c <tcb_delete+0x418>
f000a6bc:	e3a030b0 	mov	r3, #176	; 0xb0
f000a6c0:	eb002e09 	bl	f0015eec <printk>
f000a6c4:	eafffffe 	b	f000a6c4 <tcb_delete+0x3d0>
f000a6c8:	e51b3010 	ldr	r3, [fp, #-16]
f000a6cc:	e283307c 	add	r3, r3, #124	; 0x7c
f000a6d0:	e1a00003 	mov	r0, r3
f000a6d4:	ebfffd3c 	bl	f0009bcc <spin_unlock>
f000a6d8:	e51b3010 	ldr	r3, [fp, #-16]
f000a6dc:	e59330c0 	ldr	r3, [r3, #192]	; 0xc0
f000a6e0:	e3530000 	cmp	r3, #0
f000a6e4:	1a000004 	bne	f000a6fc <tcb_delete+0x408>
f000a6e8:	e51b3010 	ldr	r3, [fp, #-16]
f000a6ec:	e28330f8 	add	r3, r3, #248	; 0xf8
f000a6f0:	e1a00003 	mov	r0, r3
f000a6f4:	e3a01000 	mov	r1, #0
f000a6f8:	eb0030b6 	bl	f00169d8 <wake_up>
f000a6fc:	e24bd008 	sub	sp, fp, #8
f000a700:	e8bd8810 	pop	{r4, fp, pc}
f000a704:	f001e39c 	.word	0xf001e39c
f000a708:	f001e3c4 	.word	0xf001e3c4
f000a70c:	f001e420 	.word	0xf001e420
f000a710:	f002e0a8 	.word	0xf002e0a8

f000a714 <tcb_find_by_space>:
f000a714:	e92d4810 	push	{r4, fp, lr}
f000a718:	e28db008 	add	fp, sp, #8
f000a71c:	e24dd01c 	sub	sp, sp, #28
f000a720:	e50b0020 	str	r0, [fp, #-32]
f000a724:	ebfffd4a 	bl	f0009c54 <current_task>
f000a728:	e1a03000 	mov	r3, r0
f000a72c:	e59330b8 	ldr	r3, [r3, #184]	; 0xb8
f000a730:	e2833068 	add	r3, r3, #104	; 0x68
f000a734:	e1a00003 	mov	r0, r3
f000a738:	ebfffd1c 	bl	f0009bb0 <spin_lock>
f000a73c:	ebfffd44 	bl	f0009c54 <current_task>
f000a740:	e1a03000 	mov	r3, r0
f000a744:	e59330b8 	ldr	r3, [r3, #184]	; 0xb8
f000a748:	e5933060 	ldr	r3, [r3, #96]	; 0x60
f000a74c:	e50b3014 	str	r3, [fp, #-20]
f000a750:	e51b3014 	ldr	r3, [fp, #-20]
f000a754:	e2433088 	sub	r3, r3, #136	; 0x88
f000a758:	e50b3010 	str	r3, [fp, #-16]
f000a75c:	ea000013 	b	f000a7b0 <tcb_find_by_space+0x9c>
f000a760:	e51b3010 	ldr	r3, [fp, #-16]
f000a764:	e59330b4 	ldr	r3, [r3, #180]	; 0xb4
f000a768:	e5932000 	ldr	r2, [r3]
f000a76c:	e51b3020 	ldr	r3, [fp, #-32]
f000a770:	e1520003 	cmp	r2, r3
f000a774:	1a000007 	bne	f000a798 <tcb_find_by_space+0x84>
f000a778:	ebfffd35 	bl	f0009c54 <current_task>
f000a77c:	e1a03000 	mov	r3, r0
f000a780:	e59330b8 	ldr	r3, [r3, #184]	; 0xb8
f000a784:	e2833068 	add	r3, r3, #104	; 0x68
f000a788:	e1a00003 	mov	r0, r3
f000a78c:	ebfffd0e 	bl	f0009bcc <spin_unlock>
f000a790:	e51b3010 	ldr	r3, [fp, #-16]
f000a794:	ea000014 	b	f000a7ec <tcb_find_by_space+0xd8>
f000a798:	e51b3010 	ldr	r3, [fp, #-16]
f000a79c:	e5933088 	ldr	r3, [r3, #136]	; 0x88
f000a7a0:	e50b3018 	str	r3, [fp, #-24]
f000a7a4:	e51b3018 	ldr	r3, [fp, #-24]
f000a7a8:	e2433088 	sub	r3, r3, #136	; 0x88
f000a7ac:	e50b3010 	str	r3, [fp, #-16]
f000a7b0:	e51b3010 	ldr	r3, [fp, #-16]
f000a7b4:	e2834088 	add	r4, r3, #136	; 0x88
f000a7b8:	ebfffd25 	bl	f0009c54 <current_task>
f000a7bc:	e1a03000 	mov	r3, r0
f000a7c0:	e59330b8 	ldr	r3, [r3, #184]	; 0xb8
f000a7c4:	e2833060 	add	r3, r3, #96	; 0x60
f000a7c8:	e1540003 	cmp	r4, r3
f000a7cc:	1affffe3 	bne	f000a760 <tcb_find_by_space+0x4c>
f000a7d0:	ebfffd1f 	bl	f0009c54 <current_task>
f000a7d4:	e1a03000 	mov	r3, r0
f000a7d8:	e59330b8 	ldr	r3, [r3, #184]	; 0xb8
f000a7dc:	e2833068 	add	r3, r3, #104	; 0x68
f000a7e0:	e1a00003 	mov	r0, r3
f000a7e4:	ebfffcf8 	bl	f0009bcc <spin_unlock>
f000a7e8:	e3a03000 	mov	r3, #0
f000a7ec:	e1a00003 	mov	r0, r3
f000a7f0:	e24bd008 	sub	sp, fp, #8
f000a7f4:	e8bd8810 	pop	{r4, fp, pc}

f000a7f8 <container_find_tcb>:
f000a7f8:	e92d4800 	push	{fp, lr}
f000a7fc:	e28db004 	add	fp, sp, #4
f000a800:	e24dd018 	sub	sp, sp, #24
f000a804:	e50b0018 	str	r0, [fp, #-24]
f000a808:	e50b101c 	str	r1, [fp, #-28]
f000a80c:	e51b3018 	ldr	r3, [fp, #-24]
f000a810:	e2833068 	add	r3, r3, #104	; 0x68
f000a814:	e1a00003 	mov	r0, r3
f000a818:	ebfffce4 	bl	f0009bb0 <spin_lock>
f000a81c:	e51b3018 	ldr	r3, [fp, #-24]
f000a820:	e5933060 	ldr	r3, [r3, #96]	; 0x60
f000a824:	e50b300c 	str	r3, [fp, #-12]
f000a828:	e51b300c 	ldr	r3, [fp, #-12]
f000a82c:	e2433088 	sub	r3, r3, #136	; 0x88
f000a830:	e50b3008 	str	r3, [fp, #-8]
f000a834:	ea000010 	b	f000a87c <container_find_tcb+0x84>
f000a838:	e51b3008 	ldr	r3, [fp, #-8]
f000a83c:	e5932054 	ldr	r2, [r3, #84]	; 0x54
f000a840:	e51b301c 	ldr	r3, [fp, #-28]
f000a844:	e1520003 	cmp	r2, r3
f000a848:	1a000005 	bne	f000a864 <container_find_tcb+0x6c>
f000a84c:	e51b3018 	ldr	r3, [fp, #-24]
f000a850:	e2833068 	add	r3, r3, #104	; 0x68
f000a854:	e1a00003 	mov	r0, r3
f000a858:	ebfffcdb 	bl	f0009bcc <spin_unlock>
f000a85c:	e51b3008 	ldr	r3, [fp, #-8]
f000a860:	ea000010 	b	f000a8a8 <container_find_tcb+0xb0>
f000a864:	e51b3008 	ldr	r3, [fp, #-8]
f000a868:	e5933088 	ldr	r3, [r3, #136]	; 0x88
f000a86c:	e50b3010 	str	r3, [fp, #-16]
f000a870:	e51b3010 	ldr	r3, [fp, #-16]
f000a874:	e2433088 	sub	r3, r3, #136	; 0x88
f000a878:	e50b3008 	str	r3, [fp, #-8]
f000a87c:	e51b3008 	ldr	r3, [fp, #-8]
f000a880:	e2832088 	add	r2, r3, #136	; 0x88
f000a884:	e51b3018 	ldr	r3, [fp, #-24]
f000a888:	e2833060 	add	r3, r3, #96	; 0x60
f000a88c:	e1520003 	cmp	r2, r3
f000a890:	1affffe8 	bne	f000a838 <container_find_tcb+0x40>
f000a894:	e51b3018 	ldr	r3, [fp, #-24]
f000a898:	e2833068 	add	r3, r3, #104	; 0x68
f000a89c:	e1a00003 	mov	r0, r3
f000a8a0:	ebfffcc9 	bl	f0009bcc <spin_unlock>
f000a8a4:	e3a03000 	mov	r3, #0
f000a8a8:	e1a00003 	mov	r0, r3
f000a8ac:	e24bd004 	sub	sp, fp, #4
f000a8b0:	e8bd8800 	pop	{fp, pc}

f000a8b4 <container_find_lock_tcb>:
f000a8b4:	e92d4800 	push	{fp, lr}
f000a8b8:	e28db004 	add	fp, sp, #4
f000a8bc:	e24dd018 	sub	sp, sp, #24
f000a8c0:	e50b0018 	str	r0, [fp, #-24]
f000a8c4:	e50b101c 	str	r1, [fp, #-28]
f000a8c8:	e51b3018 	ldr	r3, [fp, #-24]
f000a8cc:	e2833068 	add	r3, r3, #104	; 0x68
f000a8d0:	e1a00003 	mov	r0, r3
f000a8d4:	ebfffcb5 	bl	f0009bb0 <spin_lock>
f000a8d8:	e51b3018 	ldr	r3, [fp, #-24]
f000a8dc:	e5933060 	ldr	r3, [r3, #96]	; 0x60
f000a8e0:	e50b300c 	str	r3, [fp, #-12]
f000a8e4:	e51b300c 	ldr	r3, [fp, #-12]
f000a8e8:	e2433088 	sub	r3, r3, #136	; 0x88
f000a8ec:	e50b3008 	str	r3, [fp, #-8]
f000a8f0:	ea000014 	b	f000a948 <container_find_lock_tcb+0x94>
f000a8f4:	e51b3008 	ldr	r3, [fp, #-8]
f000a8f8:	e5932054 	ldr	r2, [r3, #84]	; 0x54
f000a8fc:	e51b301c 	ldr	r3, [fp, #-28]
f000a900:	e1520003 	cmp	r2, r3
f000a904:	1a000009 	bne	f000a930 <container_find_lock_tcb+0x7c>
f000a908:	e51b3008 	ldr	r3, [fp, #-8]
f000a90c:	e283307c 	add	r3, r3, #124	; 0x7c
f000a910:	e1a00003 	mov	r0, r3
f000a914:	ebfffca5 	bl	f0009bb0 <spin_lock>
f000a918:	e51b3018 	ldr	r3, [fp, #-24]
f000a91c:	e2833068 	add	r3, r3, #104	; 0x68
f000a920:	e1a00003 	mov	r0, r3
f000a924:	ebfffca8 	bl	f0009bcc <spin_unlock>
f000a928:	e51b3008 	ldr	r3, [fp, #-8]
f000a92c:	ea000010 	b	f000a974 <container_find_lock_tcb+0xc0>
f000a930:	e51b3008 	ldr	r3, [fp, #-8]
f000a934:	e5933088 	ldr	r3, [r3, #136]	; 0x88
f000a938:	e50b3010 	str	r3, [fp, #-16]
f000a93c:	e51b3010 	ldr	r3, [fp, #-16]
f000a940:	e2433088 	sub	r3, r3, #136	; 0x88
f000a944:	e50b3008 	str	r3, [fp, #-8]
f000a948:	e51b3008 	ldr	r3, [fp, #-8]
f000a94c:	e2832088 	add	r2, r3, #136	; 0x88
f000a950:	e51b3018 	ldr	r3, [fp, #-24]
f000a954:	e2833060 	add	r3, r3, #96	; 0x60
f000a958:	e1520003 	cmp	r2, r3
f000a95c:	1affffe4 	bne	f000a8f4 <container_find_lock_tcb+0x40>
f000a960:	e51b3018 	ldr	r3, [fp, #-24]
f000a964:	e2833068 	add	r3, r3, #104	; 0x68
f000a968:	e1a00003 	mov	r0, r3
f000a96c:	ebfffc96 	bl	f0009bcc <spin_unlock>
f000a970:	e3a03000 	mov	r3, #0
f000a974:	e1a00003 	mov	r0, r3
f000a978:	e24bd004 	sub	sp, fp, #4
f000a97c:	e8bd8800 	pop	{fp, pc}

f000a980 <tcb_find>:
f000a980:	e92d4810 	push	{r4, fp, lr}
f000a984:	e28db008 	add	fp, sp, #8
f000a988:	e24dd014 	sub	sp, sp, #20
f000a98c:	e50b0018 	str	r0, [fp, #-24]
f000a990:	ebfffcaf 	bl	f0009c54 <current_task>
f000a994:	e1a03000 	mov	r3, r0
f000a998:	e5932054 	ldr	r2, [r3, #84]	; 0x54
f000a99c:	e51b3018 	ldr	r3, [fp, #-24]
f000a9a0:	e1520003 	cmp	r2, r3
f000a9a4:	1a000002 	bne	f000a9b4 <tcb_find+0x34>
f000a9a8:	ebfffca9 	bl	f0009c54 <current_task>
f000a9ac:	e1a03000 	mov	r3, r0
f000a9b0:	ea000020 	b	f000aa38 <tcb_find+0xb8>
f000a9b4:	e51b0018 	ldr	r0, [fp, #-24]
f000a9b8:	ebfffcfb 	bl	f0009dac <tid_to_cid>
f000a9bc:	e1a04000 	mov	r4, r0
f000a9c0:	ebfffca3 	bl	f0009c54 <current_task>
f000a9c4:	e1a03000 	mov	r3, r0
f000a9c8:	e59330b8 	ldr	r3, [r3, #184]	; 0xb8
f000a9cc:	e5933000 	ldr	r3, [r3]
f000a9d0:	e1540003 	cmp	r4, r3
f000a9d4:	1a000007 	bne	f000a9f8 <tcb_find+0x78>
f000a9d8:	ebfffc9d 	bl	f0009c54 <current_task>
f000a9dc:	e1a03000 	mov	r3, r0
f000a9e0:	e59330b8 	ldr	r3, [r3, #184]	; 0xb8
f000a9e4:	e1a00003 	mov	r0, r3
f000a9e8:	e51b1018 	ldr	r1, [fp, #-24]
f000a9ec:	ebffff81 	bl	f000a7f8 <container_find_tcb>
f000a9f0:	e1a03000 	mov	r3, r0
f000a9f4:	ea00000f 	b	f000aa38 <tcb_find+0xb8>
f000a9f8:	e51b0018 	ldr	r0, [fp, #-24]
f000a9fc:	ebfffcea 	bl	f0009dac <tid_to_cid>
f000aa00:	e1a03000 	mov	r3, r0
f000aa04:	e59f0038 	ldr	r0, [pc, #56]	; f000aa44 <tcb_find+0xc4>
f000aa08:	e1a01003 	mov	r1, r3
f000aa0c:	eb000c65 	bl	f000dba8 <container_find>
f000aa10:	e50b0010 	str	r0, [fp, #-16]
f000aa14:	e51b3010 	ldr	r3, [fp, #-16]
f000aa18:	e3530000 	cmp	r3, #0
f000aa1c:	1a000001 	bne	f000aa28 <tcb_find+0xa8>
f000aa20:	e3a03000 	mov	r3, #0
f000aa24:	ea000003 	b	f000aa38 <tcb_find+0xb8>
f000aa28:	e51b0010 	ldr	r0, [fp, #-16]
f000aa2c:	e51b1018 	ldr	r1, [fp, #-24]
f000aa30:	ebffff70 	bl	f000a7f8 <container_find_tcb>
f000aa34:	e1a03000 	mov	r3, r0
f000aa38:	e1a00003 	mov	r0, r3
f000aa3c:	e24bd008 	sub	sp, fp, #8
f000aa40:	e8bd8810 	pop	{r4, fp, pc}
f000aa44:	f002d0a0 	.word	0xf002d0a0

f000aa48 <tcb_find_lock>:
f000aa48:	e92d4810 	push	{r4, fp, lr}
f000aa4c:	e28db008 	add	fp, sp, #8
f000aa50:	e24dd014 	sub	sp, sp, #20
f000aa54:	e50b0018 	str	r0, [fp, #-24]
f000aa58:	ebfffc7d 	bl	f0009c54 <current_task>
f000aa5c:	e1a03000 	mov	r3, r0
f000aa60:	e5932054 	ldr	r2, [r3, #84]	; 0x54
f000aa64:	e51b3018 	ldr	r3, [fp, #-24]
f000aa68:	e1520003 	cmp	r2, r3
f000aa6c:	1a000007 	bne	f000aa90 <tcb_find_lock+0x48>
f000aa70:	ebfffc77 	bl	f0009c54 <current_task>
f000aa74:	e1a03000 	mov	r3, r0
f000aa78:	e283307c 	add	r3, r3, #124	; 0x7c
f000aa7c:	e1a00003 	mov	r0, r3
f000aa80:	ebfffc4a 	bl	f0009bb0 <spin_lock>
f000aa84:	ebfffc72 	bl	f0009c54 <current_task>
f000aa88:	e1a03000 	mov	r3, r0
f000aa8c:	ea000020 	b	f000ab14 <tcb_find_lock+0xcc>
f000aa90:	e51b0018 	ldr	r0, [fp, #-24]
f000aa94:	ebfffcc4 	bl	f0009dac <tid_to_cid>
f000aa98:	e1a04000 	mov	r4, r0
f000aa9c:	ebfffc6c 	bl	f0009c54 <current_task>
f000aaa0:	e1a03000 	mov	r3, r0
f000aaa4:	e59330b8 	ldr	r3, [r3, #184]	; 0xb8
f000aaa8:	e5933000 	ldr	r3, [r3]
f000aaac:	e1540003 	cmp	r4, r3
f000aab0:	1a000007 	bne	f000aad4 <tcb_find_lock+0x8c>
f000aab4:	ebfffc66 	bl	f0009c54 <current_task>
f000aab8:	e1a03000 	mov	r3, r0
f000aabc:	e59330b8 	ldr	r3, [r3, #184]	; 0xb8
f000aac0:	e1a00003 	mov	r0, r3
f000aac4:	e51b1018 	ldr	r1, [fp, #-24]
f000aac8:	ebffff79 	bl	f000a8b4 <container_find_lock_tcb>
f000aacc:	e1a03000 	mov	r3, r0
f000aad0:	ea00000f 	b	f000ab14 <tcb_find_lock+0xcc>
f000aad4:	e51b0018 	ldr	r0, [fp, #-24]
f000aad8:	ebfffcb3 	bl	f0009dac <tid_to_cid>
f000aadc:	e1a03000 	mov	r3, r0
f000aae0:	e59f0038 	ldr	r0, [pc, #56]	; f000ab20 <tcb_find_lock+0xd8>
f000aae4:	e1a01003 	mov	r1, r3
f000aae8:	eb000c2e 	bl	f000dba8 <container_find>
f000aaec:	e50b0010 	str	r0, [fp, #-16]
f000aaf0:	e51b3010 	ldr	r3, [fp, #-16]
f000aaf4:	e3530000 	cmp	r3, #0
f000aaf8:	1a000001 	bne	f000ab04 <tcb_find_lock+0xbc>
f000aafc:	e3a03000 	mov	r3, #0
f000ab00:	ea000003 	b	f000ab14 <tcb_find_lock+0xcc>
f000ab04:	e51b0010 	ldr	r0, [fp, #-16]
f000ab08:	e51b1018 	ldr	r1, [fp, #-24]
f000ab0c:	ebffff68 	bl	f000a8b4 <container_find_lock_tcb>
f000ab10:	e1a03000 	mov	r3, r0
f000ab14:	e1a00003 	mov	r0, r3
f000ab18:	e24bd008 	sub	sp, fp, #8
f000ab1c:	e8bd8810 	pop	{r4, fp, pc}
f000ab20:	f002d0a0 	.word	0xf002d0a0

f000ab24 <ktcb_list_add>:
f000ab24:	e92d4800 	push	{fp, lr}
f000ab28:	e28db004 	add	fp, sp, #4
f000ab2c:	e24dd008 	sub	sp, sp, #8
f000ab30:	e50b0008 	str	r0, [fp, #-8]
f000ab34:	e50b100c 	str	r1, [fp, #-12]
f000ab38:	e51b300c 	ldr	r3, [fp, #-12]
f000ab3c:	e2833008 	add	r3, r3, #8
f000ab40:	e1a00003 	mov	r0, r3
f000ab44:	ebfffc19 	bl	f0009bb0 <spin_lock>
f000ab48:	e51b3008 	ldr	r3, [fp, #-8]
f000ab4c:	e2833088 	add	r3, r3, #136	; 0x88
f000ab50:	e1a00003 	mov	r0, r3
f000ab54:	ebfffbf6 	bl	f0009b34 <list_empty>
f000ab58:	e1a03000 	mov	r3, r0
f000ab5c:	e3530000 	cmp	r3, #0
f000ab60:	1a000005 	bne	f000ab7c <ktcb_list_add+0x58>
f000ab64:	e59f007c 	ldr	r0, [pc, #124]	; f000abe8 <ktcb_list_add+0xc4>
f000ab68:	e59f107c 	ldr	r1, [pc, #124]	; f000abec <ktcb_list_add+0xc8>
f000ab6c:	e59f207c 	ldr	r2, [pc, #124]	; f000abf0 <ktcb_list_add+0xcc>
f000ab70:	e59f307c 	ldr	r3, [pc, #124]	; f000abf4 <ktcb_list_add+0xd0>
f000ab74:	eb002cdc 	bl	f0015eec <printk>
f000ab78:	eafffffe 	b	f000ab78 <ktcb_list_add+0x54>
f000ab7c:	e51b300c 	ldr	r3, [fp, #-12]
f000ab80:	e593300c 	ldr	r3, [r3, #12]
f000ab84:	e2832001 	add	r2, r3, #1
f000ab88:	e51b300c 	ldr	r3, [fp, #-12]
f000ab8c:	e583200c 	str	r2, [r3, #12]
f000ab90:	e51b300c 	ldr	r3, [fp, #-12]
f000ab94:	e593300c 	ldr	r3, [r3, #12]
f000ab98:	e3530000 	cmp	r3, #0
f000ab9c:	1a000005 	bne	f000abb8 <ktcb_list_add+0x94>
f000aba0:	e59f0040 	ldr	r0, [pc, #64]	; f000abe8 <ktcb_list_add+0xc4>
f000aba4:	e59f1040 	ldr	r1, [pc, #64]	; f000abec <ktcb_list_add+0xc8>
f000aba8:	e59f2040 	ldr	r2, [pc, #64]	; f000abf0 <ktcb_list_add+0xcc>
f000abac:	e59f3044 	ldr	r3, [pc, #68]	; f000abf8 <ktcb_list_add+0xd4>
f000abb0:	eb002ccd 	bl	f0015eec <printk>
f000abb4:	eafffffe 	b	f000abb4 <ktcb_list_add+0x90>
f000abb8:	e51b3008 	ldr	r3, [fp, #-8]
f000abbc:	e2832088 	add	r2, r3, #136	; 0x88
f000abc0:	e51b300c 	ldr	r3, [fp, #-12]
f000abc4:	e1a00002 	mov	r0, r2
f000abc8:	e1a01003 	mov	r1, r3
f000abcc:	ebfffb81 	bl	f00099d8 <list_insert>
f000abd0:	e51b300c 	ldr	r3, [fp, #-12]
f000abd4:	e2833008 	add	r3, r3, #8
f000abd8:	e1a00003 	mov	r0, r3
f000abdc:	ebfffbfa 	bl	f0009bcc <spin_unlock>
f000abe0:	e24bd004 	sub	sp, fp, #4
f000abe4:	e8bd8800 	pop	{fp, pc}
f000abe8:	f001e39c 	.word	0xf001e39c
f000abec:	f001e3c4 	.word	0xf001e3c4
f000abf0:	f001e42c 	.word	0xf001e42c
f000abf4:	00000116 	.word	0x00000116
f000abf8:	00000117 	.word	0x00000117

f000abfc <tcb_add>:
f000abfc:	e92d4800 	push	{fp, lr}
f000ac00:	e28db004 	add	fp, sp, #4
f000ac04:	e24dd010 	sub	sp, sp, #16
f000ac08:	e50b0010 	str	r0, [fp, #-16]
f000ac0c:	e51b3010 	ldr	r3, [fp, #-16]
f000ac10:	e59330b8 	ldr	r3, [r3, #184]	; 0xb8
f000ac14:	e50b3008 	str	r3, [fp, #-8]
f000ac18:	e51b3008 	ldr	r3, [fp, #-8]
f000ac1c:	e2833068 	add	r3, r3, #104	; 0x68
f000ac20:	e1a00003 	mov	r0, r3
f000ac24:	ebfffbe1 	bl	f0009bb0 <spin_lock>
f000ac28:	e51b3010 	ldr	r3, [fp, #-16]
f000ac2c:	e2833088 	add	r3, r3, #136	; 0x88
f000ac30:	e1a00003 	mov	r0, r3
f000ac34:	ebfffbbe 	bl	f0009b34 <list_empty>
f000ac38:	e1a03000 	mov	r3, r0
f000ac3c:	e3530000 	cmp	r3, #0
f000ac40:	1a000005 	bne	f000ac5c <tcb_add+0x60>
f000ac44:	e59f0080 	ldr	r0, [pc, #128]	; f000accc <tcb_add+0xd0>
f000ac48:	e59f1080 	ldr	r1, [pc, #128]	; f000acd0 <tcb_add+0xd4>
f000ac4c:	e59f2080 	ldr	r2, [pc, #128]	; f000acd4 <tcb_add+0xd8>
f000ac50:	e59f3080 	ldr	r3, [pc, #128]	; f000acd8 <tcb_add+0xdc>
f000ac54:	eb002ca4 	bl	f0015eec <printk>
f000ac58:	eafffffe 	b	f000ac58 <tcb_add+0x5c>
f000ac5c:	e51b3008 	ldr	r3, [fp, #-8]
f000ac60:	e593306c 	ldr	r3, [r3, #108]	; 0x6c
f000ac64:	e2832001 	add	r2, r3, #1
f000ac68:	e51b3008 	ldr	r3, [fp, #-8]
f000ac6c:	e583206c 	str	r2, [r3, #108]	; 0x6c
f000ac70:	e51b3008 	ldr	r3, [fp, #-8]
f000ac74:	e593306c 	ldr	r3, [r3, #108]	; 0x6c
f000ac78:	e3530000 	cmp	r3, #0
f000ac7c:	1a000005 	bne	f000ac98 <tcb_add+0x9c>
f000ac80:	e59f0044 	ldr	r0, [pc, #68]	; f000accc <tcb_add+0xd0>
f000ac84:	e59f1044 	ldr	r1, [pc, #68]	; f000acd0 <tcb_add+0xd4>
f000ac88:	e59f2044 	ldr	r2, [pc, #68]	; f000acd4 <tcb_add+0xd8>
f000ac8c:	e59f3048 	ldr	r3, [pc, #72]	; f000acdc <tcb_add+0xe0>
f000ac90:	eb002c95 	bl	f0015eec <printk>
f000ac94:	eafffffe 	b	f000ac94 <tcb_add+0x98>
f000ac98:	e51b3010 	ldr	r3, [fp, #-16]
f000ac9c:	e2832088 	add	r2, r3, #136	; 0x88
f000aca0:	e51b3008 	ldr	r3, [fp, #-8]
f000aca4:	e2833060 	add	r3, r3, #96	; 0x60
f000aca8:	e1a00002 	mov	r0, r2
f000acac:	e1a01003 	mov	r1, r3
f000acb0:	ebfffb48 	bl	f00099d8 <list_insert>
f000acb4:	e51b3008 	ldr	r3, [fp, #-8]
f000acb8:	e2833068 	add	r3, r3, #104	; 0x68
f000acbc:	e1a00003 	mov	r0, r3
f000acc0:	ebfffbc1 	bl	f0009bcc <spin_unlock>
f000acc4:	e24bd004 	sub	sp, fp, #4
f000acc8:	e8bd8800 	pop	{fp, pc}
f000accc:	f001e39c 	.word	0xf001e39c
f000acd0:	f001e3c4 	.word	0xf001e3c4
f000acd4:	f001e43c 	.word	0xf001e43c
f000acd8:	00000121 	.word	0x00000121
f000acdc:	00000122 	.word	0x00000122

f000ace0 <tcb_delete_zombies>:
f000ace0:	e92d4800 	push	{fp, lr}
f000ace4:	e28db004 	add	fp, sp, #4
f000ace8:	e24dd018 	sub	sp, sp, #24
f000acec:	e59f3108 	ldr	r3, [pc, #264]	; f000adfc <tcb_delete_zombies+0x11c>
f000acf0:	e50b3010 	str	r3, [fp, #-16]
f000acf4:	e51b3010 	ldr	r3, [fp, #-16]
f000acf8:	e2833008 	add	r3, r3, #8
f000acfc:	e1a00003 	mov	r0, r3
f000ad00:	ebfffbaa 	bl	f0009bb0 <spin_lock>
f000ad04:	e51b3010 	ldr	r3, [fp, #-16]
f000ad08:	e5933000 	ldr	r3, [r3]
f000ad0c:	e50b3014 	str	r3, [fp, #-20]
f000ad10:	e51b3014 	ldr	r3, [fp, #-20]
f000ad14:	e2433088 	sub	r3, r3, #136	; 0x88
f000ad18:	e50b3008 	str	r3, [fp, #-8]
f000ad1c:	e51b3008 	ldr	r3, [fp, #-8]
f000ad20:	e5933088 	ldr	r3, [r3, #136]	; 0x88
f000ad24:	e50b3018 	str	r3, [fp, #-24]
f000ad28:	e51b3018 	ldr	r3, [fp, #-24]
f000ad2c:	e2433088 	sub	r3, r3, #136	; 0x88
f000ad30:	e50b300c 	str	r3, [fp, #-12]
f000ad34:	ea000025 	b	f000add0 <tcb_delete_zombies+0xf0>
f000ad38:	e51b3008 	ldr	r3, [fp, #-8]
f000ad3c:	e283307c 	add	r3, r3, #124	; 0x7c
f000ad40:	e1a00003 	mov	r0, r3
f000ad44:	ebfffb99 	bl	f0009bb0 <spin_lock>
f000ad48:	e51b3008 	ldr	r3, [fp, #-8]
f000ad4c:	e2833088 	add	r3, r3, #136	; 0x88
f000ad50:	e1a00003 	mov	r0, r3
f000ad54:	ebfffb36 	bl	f0009a34 <list_remove>
f000ad58:	e51b3008 	ldr	r3, [fp, #-8]
f000ad5c:	e283307c 	add	r3, r3, #124	; 0x7c
f000ad60:	e1a00003 	mov	r0, r3
f000ad64:	ebfffb98 	bl	f0009bcc <spin_unlock>
f000ad68:	e51b3010 	ldr	r3, [fp, #-16]
f000ad6c:	e2833008 	add	r3, r3, #8
f000ad70:	e1a00003 	mov	r0, r3
f000ad74:	ebfffb94 	bl	f0009bcc <spin_unlock>
f000ad78:	e51b3008 	ldr	r3, [fp, #-8]
f000ad7c:	e59320bc 	ldr	r2, [r3, #188]	; 0xbc
f000ad80:	e51b3008 	ldr	r3, [fp, #-8]
f000ad84:	e1520003 	cmp	r2, r3
f000ad88:	1a000002 	bne	f000ad98 <tcb_delete_zombies+0xb8>
f000ad8c:	e51b0008 	ldr	r0, [fp, #-8]
f000ad90:	ebfffc7d 	bl	f0009f8c <tcb_delete_pager>
f000ad94:	ea000001 	b	f000ada0 <tcb_delete_zombies+0xc0>
f000ad98:	e51b0008 	ldr	r0, [fp, #-8]
f000ad9c:	ebfffd54 	bl	f000a2f4 <tcb_delete>
f000ada0:	e51b3010 	ldr	r3, [fp, #-16]
f000ada4:	e2833008 	add	r3, r3, #8
f000ada8:	e1a00003 	mov	r0, r3
f000adac:	ebfffb7f 	bl	f0009bb0 <spin_lock>
f000adb0:	e51b300c 	ldr	r3, [fp, #-12]
f000adb4:	e50b3008 	str	r3, [fp, #-8]
f000adb8:	e51b300c 	ldr	r3, [fp, #-12]
f000adbc:	e5933088 	ldr	r3, [r3, #136]	; 0x88
f000adc0:	e50b301c 	str	r3, [fp, #-28]
f000adc4:	e51b301c 	ldr	r3, [fp, #-28]
f000adc8:	e2433088 	sub	r3, r3, #136	; 0x88
f000adcc:	e50b300c 	str	r3, [fp, #-12]
f000add0:	e51b3008 	ldr	r3, [fp, #-8]
f000add4:	e2832088 	add	r2, r3, #136	; 0x88
f000add8:	e51b3010 	ldr	r3, [fp, #-16]
f000addc:	e1520003 	cmp	r2, r3
f000ade0:	1affffd4 	bne	f000ad38 <tcb_delete_zombies+0x58>
f000ade4:	e51b3010 	ldr	r3, [fp, #-16]
f000ade8:	e2833008 	add	r3, r3, #8
f000adec:	e1a00003 	mov	r0, r3
f000adf0:	ebfffb75 	bl	f0009bcc <spin_unlock>
f000adf4:	e24bd004 	sub	sp, fp, #4
f000adf8:	e8bd8800 	pop	{fp, pc}
f000adfc:	f0033130 	.word	0xf0033130

f000ae00 <tcb_remove>:
f000ae00:	e92d4800 	push	{fp, lr}
f000ae04:	e28db004 	add	fp, sp, #4
f000ae08:	e24dd008 	sub	sp, sp, #8
f000ae0c:	e50b0008 	str	r0, [fp, #-8]
f000ae10:	ebfffb8f 	bl	f0009c54 <current_task>
f000ae14:	e1a03000 	mov	r3, r0
f000ae18:	e59330b8 	ldr	r3, [r3, #184]	; 0xb8
f000ae1c:	e2833068 	add	r3, r3, #104	; 0x68
f000ae20:	e1a00003 	mov	r0, r3
f000ae24:	ebfffb61 	bl	f0009bb0 <spin_lock>
f000ae28:	e51b3008 	ldr	r3, [fp, #-8]
f000ae2c:	e2833088 	add	r3, r3, #136	; 0x88
f000ae30:	e1a00003 	mov	r0, r3
f000ae34:	ebfffb3e 	bl	f0009b34 <list_empty>
f000ae38:	e1a03000 	mov	r3, r0
f000ae3c:	e3530000 	cmp	r3, #0
f000ae40:	0a000005 	beq	f000ae5c <tcb_remove+0x5c>
f000ae44:	e59f009c 	ldr	r0, [pc, #156]	; f000aee8 <tcb_remove+0xe8>
f000ae48:	e59f109c 	ldr	r1, [pc, #156]	; f000aeec <tcb_remove+0xec>
f000ae4c:	e59f209c 	ldr	r2, [pc, #156]	; f000aef0 <tcb_remove+0xf0>
f000ae50:	e3a03f56 	mov	r3, #344	; 0x158
f000ae54:	eb002c24 	bl	f0015eec <printk>
f000ae58:	eafffffe 	b	f000ae58 <tcb_remove+0x58>
f000ae5c:	ebfffb7c 	bl	f0009c54 <current_task>
f000ae60:	e1a03000 	mov	r3, r0
f000ae64:	e59330b8 	ldr	r3, [r3, #184]	; 0xb8
f000ae68:	e593206c 	ldr	r2, [r3, #108]	; 0x6c
f000ae6c:	e2422001 	sub	r2, r2, #1
f000ae70:	e583206c 	str	r2, [r3, #108]	; 0x6c
f000ae74:	e593306c 	ldr	r3, [r3, #108]	; 0x6c
f000ae78:	e3530000 	cmp	r3, #0
f000ae7c:	aa000005 	bge	f000ae98 <tcb_remove+0x98>
f000ae80:	e59f0060 	ldr	r0, [pc, #96]	; f000aee8 <tcb_remove+0xe8>
f000ae84:	e59f1060 	ldr	r1, [pc, #96]	; f000aeec <tcb_remove+0xec>
f000ae88:	e59f2060 	ldr	r2, [pc, #96]	; f000aef0 <tcb_remove+0xf0>
f000ae8c:	e59f3060 	ldr	r3, [pc, #96]	; f000aef4 <tcb_remove+0xf4>
f000ae90:	eb002c15 	bl	f0015eec <printk>
f000ae94:	eafffffe 	b	f000ae94 <tcb_remove+0x94>
f000ae98:	e51b3008 	ldr	r3, [fp, #-8]
f000ae9c:	e283307c 	add	r3, r3, #124	; 0x7c
f000aea0:	e1a00003 	mov	r0, r3
f000aea4:	ebfffb41 	bl	f0009bb0 <spin_lock>
f000aea8:	e51b3008 	ldr	r3, [fp, #-8]
f000aeac:	e2833088 	add	r3, r3, #136	; 0x88
f000aeb0:	e1a00003 	mov	r0, r3
f000aeb4:	ebfffaf8 	bl	f0009a9c <list_remove_init>
f000aeb8:	ebfffb65 	bl	f0009c54 <current_task>
f000aebc:	e1a03000 	mov	r3, r0
f000aec0:	e59330b8 	ldr	r3, [r3, #184]	; 0xb8
f000aec4:	e2833068 	add	r3, r3, #104	; 0x68
f000aec8:	e1a00003 	mov	r0, r3
f000aecc:	ebfffb3e 	bl	f0009bcc <spin_unlock>
f000aed0:	e51b3008 	ldr	r3, [fp, #-8]
f000aed4:	e283307c 	add	r3, r3, #124	; 0x7c
f000aed8:	e1a00003 	mov	r0, r3
f000aedc:	ebfffb3a 	bl	f0009bcc <spin_unlock>
f000aee0:	e24bd004 	sub	sp, fp, #4
f000aee4:	e8bd8800 	pop	{fp, pc}
f000aee8:	f001e39c 	.word	0xf001e39c
f000aeec:	f001e3c4 	.word	0xf001e3c4
f000aef0:	f001e444 	.word	0xf001e444
f000aef4:	00000159 	.word	0x00000159

f000aef8 <ktcb_list_remove>:
f000aef8:	e92d4800 	push	{fp, lr}
f000aefc:	e28db004 	add	fp, sp, #4
f000af00:	e24dd008 	sub	sp, sp, #8
f000af04:	e50b0008 	str	r0, [fp, #-8]
f000af08:	e50b100c 	str	r1, [fp, #-12]
f000af0c:	e51b300c 	ldr	r3, [fp, #-12]
f000af10:	e2833008 	add	r3, r3, #8
f000af14:	e1a00003 	mov	r0, r3
f000af18:	ebfffb24 	bl	f0009bb0 <spin_lock>
f000af1c:	e51b3008 	ldr	r3, [fp, #-8]
f000af20:	e2833088 	add	r3, r3, #136	; 0x88
f000af24:	e1a00003 	mov	r0, r3
f000af28:	ebfffb01 	bl	f0009b34 <list_empty>
f000af2c:	e1a03000 	mov	r3, r0
f000af30:	e3530000 	cmp	r3, #0
f000af34:	0a000005 	beq	f000af50 <ktcb_list_remove+0x58>
f000af38:	e59f0074 	ldr	r0, [pc, #116]	; f000afb4 <ktcb_list_remove+0xbc>
f000af3c:	e59f1074 	ldr	r1, [pc, #116]	; f000afb8 <ktcb_list_remove+0xc0>
f000af40:	e59f2074 	ldr	r2, [pc, #116]	; f000afbc <ktcb_list_remove+0xc4>
f000af44:	e3a03f59 	mov	r3, #356	; 0x164
f000af48:	eb002be7 	bl	f0015eec <printk>
f000af4c:	eafffffe 	b	f000af4c <ktcb_list_remove+0x54>
f000af50:	e51b300c 	ldr	r3, [fp, #-12]
f000af54:	e593300c 	ldr	r3, [r3, #12]
f000af58:	e2432001 	sub	r2, r3, #1
f000af5c:	e51b300c 	ldr	r3, [fp, #-12]
f000af60:	e583200c 	str	r2, [r3, #12]
f000af64:	e51b300c 	ldr	r3, [fp, #-12]
f000af68:	e593300c 	ldr	r3, [r3, #12]
f000af6c:	e3530000 	cmp	r3, #0
f000af70:	aa000005 	bge	f000af8c <ktcb_list_remove+0x94>
f000af74:	e59f0038 	ldr	r0, [pc, #56]	; f000afb4 <ktcb_list_remove+0xbc>
f000af78:	e59f1038 	ldr	r1, [pc, #56]	; f000afb8 <ktcb_list_remove+0xc0>
f000af7c:	e59f2038 	ldr	r2, [pc, #56]	; f000afbc <ktcb_list_remove+0xc4>
f000af80:	e59f3038 	ldr	r3, [pc, #56]	; f000afc0 <ktcb_list_remove+0xc8>
f000af84:	eb002bd8 	bl	f0015eec <printk>
f000af88:	eafffffe 	b	f000af88 <ktcb_list_remove+0x90>
f000af8c:	e51b3008 	ldr	r3, [fp, #-8]
f000af90:	e2833088 	add	r3, r3, #136	; 0x88
f000af94:	e1a00003 	mov	r0, r3
f000af98:	ebfffaa5 	bl	f0009a34 <list_remove>
f000af9c:	e51b300c 	ldr	r3, [fp, #-12]
f000afa0:	e2833008 	add	r3, r3, #8
f000afa4:	e1a00003 	mov	r0, r3
f000afa8:	ebfffb07 	bl	f0009bcc <spin_unlock>
f000afac:	e24bd004 	sub	sp, fp, #4
f000afb0:	e8bd8800 	pop	{fp, pc}
f000afb4:	f001e39c 	.word	0xf001e39c
f000afb8:	f001e3c4 	.word	0xf001e3c4
f000afbc:	f001e450 	.word	0xf001e450
f000afc0:	00000165 	.word	0x00000165

f000afc4 <task_update_utcb>:
f000afc4:	e92d4800 	push	{fp, lr}
f000afc8:	e28db004 	add	fp, sp, #4
f000afcc:	e24dd008 	sub	sp, sp, #8
f000afd0:	e50b0008 	str	r0, [fp, #-8]
f000afd4:	e51b3008 	ldr	r3, [fp, #-8]
f000afd8:	e5933090 	ldr	r3, [r3, #144]	; 0x90
f000afdc:	e1a00003 	mov	r0, r3
f000afe0:	eb002522 	bl	f0014470 <arch_update_utcb>
f000afe4:	e24bd004 	sub	sp, fp, #4
f000afe8:	e8bd8800 	pop	{fp, pc}

f000afec <tcb_check_and_lazy_map_utcb>:
f000afec:	e92d4810 	push	{r4, fp, lr}
f000aff0:	e28db008 	add	fp, sp, #8
f000aff4:	e24dd01c 	sub	sp, sp, #28
f000aff8:	e50b0018 	str	r0, [fp, #-24]
f000affc:	e50b101c 	str	r1, [fp, #-28]
f000b000:	e51b3018 	ldr	r3, [fp, #-24]
f000b004:	e5933090 	ldr	r3, [r3, #144]	; 0x90
f000b008:	e3530000 	cmp	r3, #0
f000b00c:	1a000001 	bne	f000b018 <tcb_check_and_lazy_map_utcb+0x2c>
f000b010:	e3e03086 	mvn	r3, #134	; 0x86
f000b014:	ea00005c 	b	f000b18c <tcb_check_and_lazy_map_utcb+0x1a0>
f000b018:	ebfffb0d 	bl	f0009c54 <current_task>
f000b01c:	e1a02000 	mov	r2, r0
f000b020:	e51b3018 	ldr	r3, [fp, #-24]
f000b024:	e1520003 	cmp	r2, r3
f000b028:	1a00000e 	bne	f000b068 <tcb_check_and_lazy_map_utcb+0x7c>
f000b02c:	e51b3018 	ldr	r3, [fp, #-24]
f000b030:	e5933090 	ldr	r3, [r3, #144]	; 0x90
f000b034:	e1a00003 	mov	r0, r3
f000b038:	e3a01c01 	mov	r1, #256	; 0x100
f000b03c:	e3a02003 	mov	r2, #3
f000b040:	e51b301c 	ldr	r3, [fp, #-28]
f000b044:	eb000229 	bl	f000b8f0 <check_access>
f000b048:	e50b0010 	str	r0, [fp, #-16]
f000b04c:	e51b3010 	ldr	r3, [fp, #-16]
f000b050:	e3530000 	cmp	r3, #0
f000b054:	aa000001 	bge	f000b060 <tcb_check_and_lazy_map_utcb+0x74>
f000b058:	e3e0300d 	mvn	r3, #13
f000b05c:	ea00004a 	b	f000b18c <tcb_check_and_lazy_map_utcb+0x1a0>
f000b060:	e3a03000 	mov	r3, #0
f000b064:	ea000048 	b	f000b18c <tcb_check_and_lazy_map_utcb+0x1a0>
f000b068:	e51b3018 	ldr	r3, [fp, #-24]
f000b06c:	e5933090 	ldr	r3, [r3, #144]	; 0x90
f000b070:	e51b2018 	ldr	r2, [fp, #-24]
f000b074:	e58d2000 	str	r2, [sp]
f000b078:	e1a00003 	mov	r0, r3
f000b07c:	e3a01c01 	mov	r1, #256	; 0x100
f000b080:	e3a02003 	mov	r2, #3
f000b084:	e3a03000 	mov	r3, #0
f000b088:	eb0001de 	bl	f000b808 <check_access_task>
f000b08c:	e50b0010 	str	r0, [fp, #-16]
f000b090:	e51b3010 	ldr	r3, [fp, #-16]
f000b094:	e3530000 	cmp	r3, #0
f000b098:	aa000001 	bge	f000b0a4 <tcb_check_and_lazy_map_utcb+0xb8>
f000b09c:	e3e0300d 	mvn	r3, #13
f000b0a0:	ea000039 	b	f000b18c <tcb_check_and_lazy_map_utcb+0x1a0>
f000b0a4:	e51b3018 	ldr	r3, [fp, #-24]
f000b0a8:	e59330b4 	ldr	r3, [r3, #180]	; 0xb4
f000b0ac:	e5932010 	ldr	r2, [r3, #16]
f000b0b0:	e51b3018 	ldr	r3, [fp, #-24]
f000b0b4:	e5933090 	ldr	r3, [r3, #144]	; 0x90
f000b0b8:	e1a00002 	mov	r0, r2
f000b0bc:	e1a01003 	mov	r1, r3
f000b0c0:	eb001f11 	bl	f0012d0c <virt_to_phys_by_pgd>
f000b0c4:	e50b0014 	str	r0, [fp, #-20]
f000b0c8:	ebfffae1 	bl	f0009c54 <current_task>
f000b0cc:	e1a03000 	mov	r3, r0
f000b0d0:	e59330b4 	ldr	r3, [r3, #180]	; 0xb4
f000b0d4:	e5932010 	ldr	r2, [r3, #16]
f000b0d8:	e51b3018 	ldr	r3, [fp, #-24]
f000b0dc:	e5933090 	ldr	r3, [r3, #144]	; 0x90
f000b0e0:	e1a00002 	mov	r0, r2
f000b0e4:	e1a01003 	mov	r1, r3
f000b0e8:	eb001f07 	bl	f0012d0c <virt_to_phys_by_pgd>
f000b0ec:	e1a03000 	mov	r3, r0
f000b0f0:	e51b2014 	ldr	r2, [fp, #-20]
f000b0f4:	e1520003 	cmp	r2, r3
f000b0f8:	0a000019 	beq	f000b164 <tcb_check_and_lazy_map_utcb+0x178>
f000b0fc:	e51b3018 	ldr	r3, [fp, #-24]
f000b100:	e5933090 	ldr	r3, [r3, #144]	; 0x90
f000b104:	e3c34eff 	bic	r4, r3, #4080	; 0xff0
f000b108:	e3c4400f 	bic	r4, r4, #15
f000b10c:	ebfffad0 	bl	f0009c54 <current_task>
f000b110:	e1a03000 	mov	r3, r0
f000b114:	e59320b4 	ldr	r2, [r3, #180]	; 0xb4
f000b118:	e51b3018 	ldr	r3, [fp, #-24]
f000b11c:	e59330b4 	ldr	r3, [r3, #180]	; 0xb4
f000b120:	e2833014 	add	r3, r3, #20
f000b124:	e58d2000 	str	r2, [sp]
f000b128:	e58d3004 	str	r3, [sp, #4]
f000b12c:	e51b0014 	ldr	r0, [fp, #-20]
f000b130:	e1a01004 	mov	r1, r4
f000b134:	e3a02a01 	mov	r2, #4096	; 0x1000
f000b138:	e3a03003 	mov	r3, #3
f000b13c:	eb001f26 	bl	f0012ddc <add_mapping_use_cap>
f000b140:	e50b0010 	str	r0, [fp, #-16]
f000b144:	e51b3010 	ldr	r3, [fp, #-16]
f000b148:	e3530000 	cmp	r3, #0
f000b14c:	aa000004 	bge	f000b164 <tcb_check_and_lazy_map_utcb+0x178>
f000b150:	e59f0040 	ldr	r0, [pc, #64]	; f000b198 <tcb_check_and_lazy_map_utcb+0x1ac>
f000b154:	e51b1010 	ldr	r1, [fp, #-16]
f000b158:	eb002b63 	bl	f0015eec <printk>
f000b15c:	e51b3010 	ldr	r3, [fp, #-16]
f000b160:	ea000009 	b	f000b18c <tcb_check_and_lazy_map_utcb+0x1a0>
f000b164:	e51b3014 	ldr	r3, [fp, #-20]
f000b168:	e3530000 	cmp	r3, #0
f000b16c:	1a000005 	bne	f000b188 <tcb_check_and_lazy_map_utcb+0x19c>
f000b170:	e59f0024 	ldr	r0, [pc, #36]	; f000b19c <tcb_check_and_lazy_map_utcb+0x1b0>
f000b174:	e59f1024 	ldr	r1, [pc, #36]	; f000b1a0 <tcb_check_and_lazy_map_utcb+0x1b4>
f000b178:	e59f2024 	ldr	r2, [pc, #36]	; f000b1a4 <tcb_check_and_lazy_map_utcb+0x1b8>
f000b17c:	e59f3024 	ldr	r3, [pc, #36]	; f000b1a8 <tcb_check_and_lazy_map_utcb+0x1bc>
f000b180:	eb002b59 	bl	f0015eec <printk>
f000b184:	eafffffe 	b	f000b184 <tcb_check_and_lazy_map_utcb+0x198>
f000b188:	e3a03000 	mov	r3, #0
f000b18c:	e1a00003 	mov	r0, r3
f000b190:	e24bd008 	sub	sp, fp, #8
f000b194:	e8bd8810 	pop	{r4, fp, pc}
f000b198:	f001e3d8 	.word	0xf001e3d8
f000b19c:	f001e39c 	.word	0xf001e39c
f000b1a0:	f001e3c4 	.word	0xf001e3c4
f000b1a4:	f001e464 	.word	0xf001e464
f000b1a8:	000001c5 	.word	0x000001c5

f000b1ac <spin_lock_init>:
f000b1ac:	e92d4800 	push	{fp, lr}
f000b1b0:	e28db004 	add	fp, sp, #4
f000b1b4:	e24dd008 	sub	sp, sp, #8
f000b1b8:	e50b0008 	str	r0, [fp, #-8]
f000b1bc:	e51b0008 	ldr	r0, [fp, #-8]
f000b1c0:	e3a01000 	mov	r1, #0
f000b1c4:	e3a02004 	mov	r2, #4
f000b1c8:	eb002b72 	bl	f0015f98 <memset>
f000b1cc:	e24bd004 	sub	sp, fp, #4
f000b1d0:	e8bd8800 	pop	{fp, pc}

f000b1d4 <link_init>:
f000b1d4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f000b1d8:	e28db000 	add	fp, sp, #0
f000b1dc:	e24dd00c 	sub	sp, sp, #12
f000b1e0:	e50b0008 	str	r0, [fp, #-8]
f000b1e4:	e51b3008 	ldr	r3, [fp, #-8]
f000b1e8:	e51b2008 	ldr	r2, [fp, #-8]
f000b1ec:	e5832000 	str	r2, [r3]
f000b1f0:	e51b3008 	ldr	r3, [fp, #-8]
f000b1f4:	e51b2008 	ldr	r2, [fp, #-8]
f000b1f8:	e5832004 	str	r2, [r3, #4]
f000b1fc:	e24bd000 	sub	sp, fp, #0
f000b200:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f000b204:	e12fff1e 	bx	lr

f000b208 <list_insert>:
f000b208:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f000b20c:	e28db000 	add	fp, sp, #0
f000b210:	e24dd014 	sub	sp, sp, #20
f000b214:	e50b0010 	str	r0, [fp, #-16]
f000b218:	e50b1014 	str	r1, [fp, #-20]
f000b21c:	e51b3014 	ldr	r3, [fp, #-20]
f000b220:	e5933000 	ldr	r3, [r3]
f000b224:	e50b3008 	str	r3, [fp, #-8]
f000b228:	e51b3010 	ldr	r3, [fp, #-16]
f000b22c:	e51b2008 	ldr	r2, [fp, #-8]
f000b230:	e5832000 	str	r2, [r3]
f000b234:	e51b3008 	ldr	r3, [fp, #-8]
f000b238:	e51b2010 	ldr	r2, [fp, #-16]
f000b23c:	e5832004 	str	r2, [r3, #4]
f000b240:	e51b3014 	ldr	r3, [fp, #-20]
f000b244:	e51b2010 	ldr	r2, [fp, #-16]
f000b248:	e5832000 	str	r2, [r3]
f000b24c:	e51b3010 	ldr	r3, [fp, #-16]
f000b250:	e51b2014 	ldr	r2, [fp, #-20]
f000b254:	e5832004 	str	r2, [r3, #4]
f000b258:	e24bd000 	sub	sp, fp, #0
f000b25c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f000b260:	e12fff1e 	bx	lr

f000b264 <list_remove_init>:
f000b264:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f000b268:	e28db000 	add	fp, sp, #0
f000b26c:	e24dd014 	sub	sp, sp, #20
f000b270:	e50b0010 	str	r0, [fp, #-16]
f000b274:	e51b3010 	ldr	r3, [fp, #-16]
f000b278:	e5933004 	ldr	r3, [r3, #4]
f000b27c:	e50b3008 	str	r3, [fp, #-8]
f000b280:	e51b3010 	ldr	r3, [fp, #-16]
f000b284:	e5933000 	ldr	r3, [r3]
f000b288:	e50b300c 	str	r3, [fp, #-12]
f000b28c:	e51b3008 	ldr	r3, [fp, #-8]
f000b290:	e51b200c 	ldr	r2, [fp, #-12]
f000b294:	e5832000 	str	r2, [r3]
f000b298:	e51b300c 	ldr	r3, [fp, #-12]
f000b29c:	e51b2008 	ldr	r2, [fp, #-8]
f000b2a0:	e5832004 	str	r2, [r3, #4]
f000b2a4:	e51b3010 	ldr	r3, [fp, #-16]
f000b2a8:	e51b2010 	ldr	r2, [fp, #-16]
f000b2ac:	e5832000 	str	r2, [r3]
f000b2b0:	e51b3010 	ldr	r3, [fp, #-16]
f000b2b4:	e51b2010 	ldr	r2, [fp, #-16]
f000b2b8:	e5832004 	str	r2, [r3, #4]
f000b2bc:	e24bd000 	sub	sp, fp, #0
f000b2c0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f000b2c4:	e12fff1e 	bx	lr

f000b2c8 <list_empty>:
f000b2c8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f000b2cc:	e28db000 	add	fp, sp, #0
f000b2d0:	e24dd00c 	sub	sp, sp, #12
f000b2d4:	e50b0008 	str	r0, [fp, #-8]
f000b2d8:	e51b3008 	ldr	r3, [fp, #-8]
f000b2dc:	e5932004 	ldr	r2, [r3, #4]
f000b2e0:	e51b3008 	ldr	r3, [fp, #-8]
f000b2e4:	e1520003 	cmp	r2, r3
f000b2e8:	1a000006 	bne	f000b308 <list_empty+0x40>
f000b2ec:	e51b3008 	ldr	r3, [fp, #-8]
f000b2f0:	e5932000 	ldr	r2, [r3]
f000b2f4:	e51b3008 	ldr	r3, [fp, #-8]
f000b2f8:	e1520003 	cmp	r2, r3
f000b2fc:	1a000001 	bne	f000b308 <list_empty+0x40>
f000b300:	e3a03001 	mov	r3, #1
f000b304:	ea000000 	b	f000b30c <list_empty+0x44>
f000b308:	e3a03000 	mov	r3, #0
f000b30c:	e1a00003 	mov	r0, r3
f000b310:	e24bd000 	sub	sp, fp, #0
f000b314:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f000b318:	e12fff1e 	bx	lr

f000b31c <cap_list_init>:
f000b31c:	e92d4800 	push	{fp, lr}
f000b320:	e28db004 	add	fp, sp, #4
f000b324:	e24dd008 	sub	sp, sp, #8
f000b328:	e50b0008 	str	r0, [fp, #-8]
f000b32c:	e51b3008 	ldr	r3, [fp, #-8]
f000b330:	e3a02000 	mov	r2, #0
f000b334:	e5832000 	str	r2, [r3]
f000b338:	e51b3008 	ldr	r3, [fp, #-8]
f000b33c:	e2833004 	add	r3, r3, #4
f000b340:	e1a00003 	mov	r0, r3
f000b344:	ebffffa2 	bl	f000b1d4 <link_init>
f000b348:	e24bd004 	sub	sp, fp, #4
f000b34c:	e8bd8800 	pop	{fp, pc}

f000b350 <current_task>:
f000b350:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f000b354:	e28db000 	add	fp, sp, #0
f000b358:	e1a0300d 	mov	r3, sp
f000b35c:	e3c33eff 	bic	r3, r3, #4080	; 0xff0
f000b360:	e3c3300f 	bic	r3, r3, #15
f000b364:	e1a00003 	mov	r0, r3
f000b368:	e24bd000 	sub	sp, fp, #0
f000b36c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f000b370:	e12fff1e 	bx	lr

f000b374 <init_address_space_list>:
f000b374:	e92d4800 	push	{fp, lr}
f000b378:	e28db004 	add	fp, sp, #4
f000b37c:	e24dd008 	sub	sp, sp, #8
f000b380:	e50b0008 	str	r0, [fp, #-8]
f000b384:	e51b0008 	ldr	r0, [fp, #-8]
f000b388:	e3a01000 	mov	r1, #0
f000b38c:	e3a02010 	mov	r2, #16
f000b390:	eb002b00 	bl	f0015f98 <memset>
f000b394:	e51b3008 	ldr	r3, [fp, #-8]
f000b398:	e1a00003 	mov	r0, r3
f000b39c:	ebffff8c 	bl	f000b1d4 <link_init>
f000b3a0:	e51b3008 	ldr	r3, [fp, #-8]
f000b3a4:	e2833008 	add	r3, r3, #8
f000b3a8:	e1a00003 	mov	r0, r3
f000b3ac:	ebffff7e 	bl	f000b1ac <spin_lock_init>
f000b3b0:	e24bd004 	sub	sp, fp, #4
f000b3b4:	e8bd8800 	pop	{fp, pc}

f000b3b8 <address_space_attach>:
f000b3b8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f000b3bc:	e28db000 	add	fp, sp, #0
f000b3c0:	e24dd00c 	sub	sp, sp, #12
f000b3c4:	e50b0008 	str	r0, [fp, #-8]
f000b3c8:	e50b100c 	str	r1, [fp, #-12]
f000b3cc:	e51b3008 	ldr	r3, [fp, #-8]
f000b3d0:	e51b200c 	ldr	r2, [fp, #-12]
f000b3d4:	e58320b4 	str	r2, [r3, #180]	; 0xb4
f000b3d8:	e51b300c 	ldr	r3, [fp, #-12]
f000b3dc:	e5933020 	ldr	r3, [r3, #32]
f000b3e0:	e2832001 	add	r2, r3, #1
f000b3e4:	e51b300c 	ldr	r3, [fp, #-12]
f000b3e8:	e5832020 	str	r2, [r3, #32]
f000b3ec:	e24bd000 	sub	sp, fp, #0
f000b3f0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f000b3f4:	e12fff1e 	bx	lr

f000b3f8 <address_space_find>:
f000b3f8:	e92d4810 	push	{r4, fp, lr}
f000b3fc:	e28db008 	add	fp, sp, #8
f000b400:	e24dd01c 	sub	sp, sp, #28
f000b404:	e50b0020 	str	r0, [fp, #-32]
f000b408:	ebffffd0 	bl	f000b350 <current_task>
f000b40c:	e1a03000 	mov	r3, r0
f000b410:	e59330b8 	ldr	r3, [r3, #184]	; 0xb8
f000b414:	e5933010 	ldr	r3, [r3, #16]
f000b418:	e50b3014 	str	r3, [fp, #-20]
f000b41c:	e51b3014 	ldr	r3, [fp, #-20]
f000b420:	e2433004 	sub	r3, r3, #4
f000b424:	e50b3010 	str	r3, [fp, #-16]
f000b428:	ea00000c 	b	f000b460 <address_space_find+0x68>
f000b42c:	e51b3010 	ldr	r3, [fp, #-16]
f000b430:	e5932000 	ldr	r2, [r3]
f000b434:	e51b3020 	ldr	r3, [fp, #-32]
f000b438:	e1520003 	cmp	r2, r3
f000b43c:	1a000001 	bne	f000b448 <address_space_find+0x50>
f000b440:	e51b3010 	ldr	r3, [fp, #-16]
f000b444:	ea00000e 	b	f000b484 <address_space_find+0x8c>
f000b448:	e51b3010 	ldr	r3, [fp, #-16]
f000b44c:	e5933004 	ldr	r3, [r3, #4]
f000b450:	e50b3018 	str	r3, [fp, #-24]
f000b454:	e51b3018 	ldr	r3, [fp, #-24]
f000b458:	e2433004 	sub	r3, r3, #4
f000b45c:	e50b3010 	str	r3, [fp, #-16]
f000b460:	e51b3010 	ldr	r3, [fp, #-16]
f000b464:	e2834004 	add	r4, r3, #4
f000b468:	ebffffb8 	bl	f000b350 <current_task>
f000b46c:	e1a03000 	mov	r3, r0
f000b470:	e59330b8 	ldr	r3, [r3, #184]	; 0xb8
f000b474:	e2833010 	add	r3, r3, #16
f000b478:	e1540003 	cmp	r4, r3
f000b47c:	1affffea 	bne	f000b42c <address_space_find+0x34>
f000b480:	e3a03000 	mov	r3, #0
f000b484:	e1a00003 	mov	r0, r3
f000b488:	e24bd008 	sub	sp, fp, #8
f000b48c:	e8bd8810 	pop	{r4, fp, pc}

f000b490 <address_space_add>:
f000b490:	e92d4810 	push	{r4, fp, lr}
f000b494:	e28db008 	add	fp, sp, #8
f000b498:	e24dd00c 	sub	sp, sp, #12
f000b49c:	e50b0010 	str	r0, [fp, #-16]
f000b4a0:	e51b3010 	ldr	r3, [fp, #-16]
f000b4a4:	e2833004 	add	r3, r3, #4
f000b4a8:	e1a00003 	mov	r0, r3
f000b4ac:	ebffff85 	bl	f000b2c8 <list_empty>
f000b4b0:	e1a03000 	mov	r3, r0
f000b4b4:	e3530000 	cmp	r3, #0
f000b4b8:	1a000005 	bne	f000b4d4 <address_space_add+0x44>
f000b4bc:	e59f0078 	ldr	r0, [pc, #120]	; f000b53c <address_space_add+0xac>
f000b4c0:	e59f1078 	ldr	r1, [pc, #120]	; f000b540 <address_space_add+0xb0>
f000b4c4:	e59f2078 	ldr	r2, [pc, #120]	; f000b544 <address_space_add+0xb4>
f000b4c8:	e3a0302d 	mov	r3, #45	; 0x2d
f000b4cc:	eb002a86 	bl	f0015eec <printk>
f000b4d0:	eafffffe 	b	f000b4d0 <address_space_add+0x40>
f000b4d4:	e51b3010 	ldr	r3, [fp, #-16]
f000b4d8:	e2834004 	add	r4, r3, #4
f000b4dc:	ebffff9b 	bl	f000b350 <current_task>
f000b4e0:	e1a03000 	mov	r3, r0
f000b4e4:	e59330b8 	ldr	r3, [r3, #184]	; 0xb8
f000b4e8:	e2833010 	add	r3, r3, #16
f000b4ec:	e1a00004 	mov	r0, r4
f000b4f0:	e1a01003 	mov	r1, r3
f000b4f4:	ebffff43 	bl	f000b208 <list_insert>
f000b4f8:	ebffff94 	bl	f000b350 <current_task>
f000b4fc:	e1a03000 	mov	r3, r0
f000b500:	e59330b8 	ldr	r3, [r3, #184]	; 0xb8
f000b504:	e593201c 	ldr	r2, [r3, #28]
f000b508:	e2822001 	add	r2, r2, #1
f000b50c:	e583201c 	str	r2, [r3, #28]
f000b510:	e593301c 	ldr	r3, [r3, #28]
f000b514:	e3530000 	cmp	r3, #0
f000b518:	1a000005 	bne	f000b534 <address_space_add+0xa4>
f000b51c:	e59f0018 	ldr	r0, [pc, #24]	; f000b53c <address_space_add+0xac>
f000b520:	e59f1018 	ldr	r1, [pc, #24]	; f000b540 <address_space_add+0xb0>
f000b524:	e59f2018 	ldr	r2, [pc, #24]	; f000b544 <address_space_add+0xb4>
f000b528:	e3a0302f 	mov	r3, #47	; 0x2f
f000b52c:	eb002a6e 	bl	f0015eec <printk>
f000b530:	eafffffe 	b	f000b530 <address_space_add+0xa0>
f000b534:	e24bd008 	sub	sp, fp, #8
f000b538:	e8bd8810 	pop	{r4, fp, pc}
f000b53c:	f001e480 	.word	0xf001e480
f000b540:	f001e4a8 	.word	0xf001e4a8
f000b544:	f001e4bc 	.word	0xf001e4bc

f000b548 <address_space_remove>:
f000b548:	e92d4800 	push	{fp, lr}
f000b54c:	e28db004 	add	fp, sp, #4
f000b550:	e24dd008 	sub	sp, sp, #8
f000b554:	e50b0008 	str	r0, [fp, #-8]
f000b558:	e50b100c 	str	r1, [fp, #-12]
f000b55c:	e51b3008 	ldr	r3, [fp, #-8]
f000b560:	e2833004 	add	r3, r3, #4
f000b564:	e1a00003 	mov	r0, r3
f000b568:	ebffff56 	bl	f000b2c8 <list_empty>
f000b56c:	e1a03000 	mov	r3, r0
f000b570:	e3530000 	cmp	r3, #0
f000b574:	0a000005 	beq	f000b590 <address_space_remove+0x48>
f000b578:	e59f0064 	ldr	r0, [pc, #100]	; f000b5e4 <address_space_remove+0x9c>
f000b57c:	e59f1064 	ldr	r1, [pc, #100]	; f000b5e8 <address_space_remove+0xa0>
f000b580:	e59f2064 	ldr	r2, [pc, #100]	; f000b5ec <address_space_remove+0xa4>
f000b584:	e3a03034 	mov	r3, #52	; 0x34
f000b588:	eb002a57 	bl	f0015eec <printk>
f000b58c:	eafffffe 	b	f000b58c <address_space_remove+0x44>
f000b590:	e51b300c 	ldr	r3, [fp, #-12]
f000b594:	e593301c 	ldr	r3, [r3, #28]
f000b598:	e2432001 	sub	r2, r3, #1
f000b59c:	e51b300c 	ldr	r3, [fp, #-12]
f000b5a0:	e583201c 	str	r2, [r3, #28]
f000b5a4:	e51b300c 	ldr	r3, [fp, #-12]
f000b5a8:	e593301c 	ldr	r3, [r3, #28]
f000b5ac:	e3530000 	cmp	r3, #0
f000b5b0:	aa000005 	bge	f000b5cc <address_space_remove+0x84>
f000b5b4:	e59f0028 	ldr	r0, [pc, #40]	; f000b5e4 <address_space_remove+0x9c>
f000b5b8:	e59f1028 	ldr	r1, [pc, #40]	; f000b5e8 <address_space_remove+0xa0>
f000b5bc:	e59f2028 	ldr	r2, [pc, #40]	; f000b5ec <address_space_remove+0xa4>
f000b5c0:	e3a03035 	mov	r3, #53	; 0x35
f000b5c4:	eb002a48 	bl	f0015eec <printk>
f000b5c8:	eafffffe 	b	f000b5c8 <address_space_remove+0x80>
f000b5cc:	e51b3008 	ldr	r3, [fp, #-8]
f000b5d0:	e2833004 	add	r3, r3, #4
f000b5d4:	e1a00003 	mov	r0, r3
f000b5d8:	ebffff21 	bl	f000b264 <list_remove_init>
f000b5dc:	e24bd004 	sub	sp, fp, #4
f000b5e0:	e8bd8800 	pop	{fp, pc}
f000b5e4:	f001e480 	.word	0xf001e480
f000b5e8:	f001e4a8 	.word	0xf001e4a8
f000b5ec:	f001e4d0 	.word	0xf001e4d0

f000b5f0 <address_space_delete>:
f000b5f0:	e92d4800 	push	{fp, lr}
f000b5f4:	e28db004 	add	fp, sp, #4
f000b5f8:	e24dd008 	sub	sp, sp, #8
f000b5fc:	e50b0008 	str	r0, [fp, #-8]
f000b600:	e50b100c 	str	r1, [fp, #-12]
f000b604:	e51b3008 	ldr	r3, [fp, #-8]
f000b608:	e5933020 	ldr	r3, [r3, #32]
f000b60c:	e3530000 	cmp	r3, #0
f000b610:	0a000005 	beq	f000b62c <address_space_delete+0x3c>
f000b614:	e59f00a0 	ldr	r0, [pc, #160]	; f000b6bc <address_space_delete+0xcc>
f000b618:	e59f10a0 	ldr	r1, [pc, #160]	; f000b6c0 <address_space_delete+0xd0>
f000b61c:	e59f20a0 	ldr	r2, [pc, #160]	; f000b6c4 <address_space_delete+0xd4>
f000b620:	e3a0303d 	mov	r3, #61	; 0x3d
f000b624:	eb002a30 	bl	f0015eec <printk>
f000b628:	eafffffe 	b	f000b628 <address_space_delete+0x38>
f000b62c:	e51b3008 	ldr	r3, [fp, #-8]
f000b630:	e2833018 	add	r3, r3, #24
f000b634:	e1a00003 	mov	r0, r3
f000b638:	ebffff22 	bl	f000b2c8 <list_empty>
f000b63c:	e1a03000 	mov	r3, r0
f000b640:	e3530000 	cmp	r3, #0
f000b644:	1a000005 	bne	f000b660 <address_space_delete+0x70>
f000b648:	e59f006c 	ldr	r0, [pc, #108]	; f000b6bc <address_space_delete+0xcc>
f000b64c:	e59f106c 	ldr	r1, [pc, #108]	; f000b6c0 <address_space_delete+0xd0>
f000b650:	e59f206c 	ldr	r2, [pc, #108]	; f000b6c4 <address_space_delete+0xd4>
f000b654:	e3a0303e 	mov	r3, #62	; 0x3e
f000b658:	eb002a23 	bl	f0015eec <printk>
f000b65c:	eafffffe 	b	f000b65c <address_space_delete+0x6c>
f000b660:	e51b3008 	ldr	r3, [fp, #-8]
f000b664:	e5933014 	ldr	r3, [r3, #20]
f000b668:	e3530000 	cmp	r3, #0
f000b66c:	0a000005 	beq	f000b688 <address_space_delete+0x98>
f000b670:	e59f0044 	ldr	r0, [pc, #68]	; f000b6bc <address_space_delete+0xcc>
f000b674:	e59f1044 	ldr	r1, [pc, #68]	; f000b6c0 <address_space_delete+0xd0>
f000b678:	e59f2044 	ldr	r2, [pc, #68]	; f000b6c4 <address_space_delete+0xd4>
f000b67c:	e3a0303f 	mov	r3, #63	; 0x3f
f000b680:	eb002a19 	bl	f0015eec <printk>
f000b684:	eafffffe 	b	f000b684 <address_space_delete+0x94>
f000b688:	e51b0008 	ldr	r0, [fp, #-8]
f000b68c:	e51b100c 	ldr	r1, [fp, #-12]
f000b690:	eb001fe3 	bl	f0013624 <delete_page_tables>
f000b694:	e51b3008 	ldr	r3, [fp, #-8]
f000b698:	e5933000 	ldr	r3, [r3]
f000b69c:	e59f0024 	ldr	r0, [pc, #36]	; f000b6c8 <address_space_delete+0xd8>
f000b6a0:	e1a01003 	mov	r1, r3
f000b6a4:	eb002f22 	bl	f0017334 <id_del>
f000b6a8:	e51b0008 	ldr	r0, [fp, #-8]
f000b6ac:	e51b100c 	ldr	r1, [fp, #-12]
f000b6b0:	eb00025e 	bl	f000c030 <space_cap_free>
f000b6b4:	e24bd004 	sub	sp, fp, #4
f000b6b8:	e8bd8800 	pop	{fp, pc}
f000b6bc:	f001e480 	.word	0xf001e480
f000b6c0:	f001e4a8 	.word	0xf001e4a8
f000b6c4:	f001e4e8 	.word	0xf001e4e8
f000b6c8:	f002d0a4 	.word	0xf002d0a4

f000b6cc <address_space_create>:
f000b6cc:	e92d4800 	push	{fp, lr}
f000b6d0:	e28db004 	add	fp, sp, #4
f000b6d4:	e24dd018 	sub	sp, sp, #24
f000b6d8:	e50b0018 	str	r0, [fp, #-24]
f000b6dc:	ebffff1b 	bl	f000b350 <current_task>
f000b6e0:	e1a03000 	mov	r3, r0
f000b6e4:	e59330b4 	ldr	r3, [r3, #180]	; 0xb4
f000b6e8:	e2833014 	add	r3, r3, #20
f000b6ec:	e1a00003 	mov	r0, r3
f000b6f0:	eb0001a8 	bl	f000bd98 <space_cap_alloc>
f000b6f4:	e50b0008 	str	r0, [fp, #-8]
f000b6f8:	e51b3008 	ldr	r3, [fp, #-8]
f000b6fc:	e3530000 	cmp	r3, #0
f000b700:	1a000001 	bne	f000b70c <address_space_create+0x40>
f000b704:	e3e0300b 	mvn	r3, #11
f000b708:	ea00003a 	b	f000b7f8 <address_space_create+0x12c>
f000b70c:	eb000175 	bl	f000bce8 <pgd_alloc>
f000b710:	e50b000c 	str	r0, [fp, #-12]
f000b714:	e51b300c 	ldr	r3, [fp, #-12]
f000b718:	e3530000 	cmp	r3, #0
f000b71c:	1a000008 	bne	f000b744 <address_space_create+0x78>
f000b720:	ebffff0a 	bl	f000b350 <current_task>
f000b724:	e1a03000 	mov	r3, r0
f000b728:	e59330b4 	ldr	r3, [r3, #180]	; 0xb4
f000b72c:	e2833014 	add	r3, r3, #20
f000b730:	e51b0008 	ldr	r0, [fp, #-8]
f000b734:	e1a01003 	mov	r1, r3
f000b738:	eb00023c 	bl	f000c030 <space_cap_free>
f000b73c:	e3e0300b 	mvn	r3, #11
f000b740:	ea00002c 	b	f000b7f8 <address_space_create+0x12c>
f000b744:	e51b3008 	ldr	r3, [fp, #-8]
f000b748:	e2833004 	add	r3, r3, #4
f000b74c:	e1a00003 	mov	r0, r3
f000b750:	ebfffe9f 	bl	f000b1d4 <link_init>
f000b754:	e51b3008 	ldr	r3, [fp, #-8]
f000b758:	e2833014 	add	r3, r3, #20
f000b75c:	e1a00003 	mov	r0, r3
f000b760:	ebfffeed 	bl	f000b31c <cap_list_init>
f000b764:	e51b3008 	ldr	r3, [fp, #-8]
f000b768:	e283300c 	add	r3, r3, #12
f000b76c:	e1a00003 	mov	r0, r3
f000b770:	ebfffe8d 	bl	f000b1ac <spin_lock_init>
f000b774:	e51b3008 	ldr	r3, [fp, #-8]
f000b778:	e51b200c 	ldr	r2, [fp, #-12]
f000b77c:	e5832010 	str	r2, [r3, #16]
f000b780:	e51b000c 	ldr	r0, [fp, #-12]
f000b784:	eb00230b 	bl	f00143b8 <arch_copy_pgd_kernel_entries>
f000b788:	e59f0074 	ldr	r0, [pc, #116]	; f000b804 <address_space_create+0x138>
f000b78c:	eb002ec5 	bl	f00172a8 <id_new>
f000b790:	e1a03000 	mov	r3, r0
f000b794:	e1a02003 	mov	r2, r3
f000b798:	e51b3008 	ldr	r3, [fp, #-8]
f000b79c:	e5832000 	str	r2, [r3]
f000b7a0:	e51b3018 	ldr	r3, [fp, #-24]
f000b7a4:	e3530000 	cmp	r3, #0
f000b7a8:	0a000011 	beq	f000b7f4 <address_space_create+0x128>
f000b7ac:	e51b0008 	ldr	r0, [fp, #-8]
f000b7b0:	e51b1018 	ldr	r1, [fp, #-24]
f000b7b4:	eb001faa 	bl	f0013664 <copy_user_tables>
f000b7b8:	e50b0010 	str	r0, [fp, #-16]
f000b7bc:	e51b3010 	ldr	r3, [fp, #-16]
f000b7c0:	e3530000 	cmp	r3, #0
f000b7c4:	aa00000a 	bge	f000b7f4 <address_space_create+0x128>
f000b7c8:	e51b000c 	ldr	r0, [fp, #-12]
f000b7cc:	eb0001d2 	bl	f000bf1c <pgd_free>
f000b7d0:	ebfffede 	bl	f000b350 <current_task>
f000b7d4:	e1a03000 	mov	r3, r0
f000b7d8:	e59330b4 	ldr	r3, [r3, #180]	; 0xb4
f000b7dc:	e2833014 	add	r3, r3, #20
f000b7e0:	e51b0008 	ldr	r0, [fp, #-8]
f000b7e4:	e1a01003 	mov	r1, r3
f000b7e8:	eb000210 	bl	f000c030 <space_cap_free>
f000b7ec:	e51b3010 	ldr	r3, [fp, #-16]
f000b7f0:	ea000000 	b	f000b7f8 <address_space_create+0x12c>
f000b7f4:	e51b3008 	ldr	r3, [fp, #-8]
f000b7f8:	e1a00003 	mov	r0, r3
f000b7fc:	e24bd004 	sub	sp, fp, #4
f000b800:	e8bd8800 	pop	{fp, pc}
f000b804:	f002d0a4 	.word	0xf002d0a4

f000b808 <check_access_task>:
f000b808:	e92d4800 	push	{fp, lr}
f000b80c:	e28db004 	add	fp, sp, #4
f000b810:	e24dd020 	sub	sp, sp, #32
f000b814:	e50b0018 	str	r0, [fp, #-24]
f000b818:	e50b101c 	str	r1, [fp, #-28]
f000b81c:	e50b2020 	str	r2, [fp, #-32]
f000b820:	e50b3024 	str	r3, [fp, #-36]	; 0x24
f000b824:	e51b3018 	ldr	r3, [fp, #-24]
f000b828:	e3c33eff 	bic	r3, r3, #4080	; 0xff0
f000b82c:	e3c3300f 	bic	r3, r3, #15
f000b830:	e50b3008 	str	r3, [fp, #-8]
f000b834:	e51b2018 	ldr	r2, [fp, #-24]
f000b838:	e51b301c 	ldr	r3, [fp, #-28]
f000b83c:	e0823003 	add	r3, r2, r3
f000b840:	e2833eff 	add	r3, r3, #4080	; 0xff0
f000b844:	e283300f 	add	r3, r3, #15
f000b848:	e3c33eff 	bic	r3, r3, #4080	; 0xff0
f000b84c:	e3c3300f 	bic	r3, r3, #15
f000b850:	e50b300c 	str	r3, [fp, #-12]
f000b854:	e51b200c 	ldr	r2, [fp, #-12]
f000b858:	e51b3008 	ldr	r3, [fp, #-8]
f000b85c:	e0633002 	rsb	r3, r3, r2
f000b860:	e50b3010 	str	r3, [fp, #-16]
f000b864:	e59b3004 	ldr	r3, [fp, #4]
f000b868:	e59330b4 	ldr	r3, [r3, #180]	; 0xb4
f000b86c:	e5933010 	ldr	r3, [r3, #16]
f000b870:	e51b0008 	ldr	r0, [fp, #-8]
f000b874:	e51b1010 	ldr	r1, [fp, #-16]
f000b878:	e51b2020 	ldr	r2, [fp, #-32]
f000b87c:	eb001eb8 	bl	f0013364 <check_mapping_pgd>
f000b880:	e1a03000 	mov	r3, r0
f000b884:	e3530000 	cmp	r3, #0
f000b888:	1a000014 	bne	f000b8e0 <check_access_task+0xd8>
f000b88c:	e51b3024 	ldr	r3, [fp, #-36]	; 0x24
f000b890:	e3530000 	cmp	r3, #0
f000b894:	0a00000f 	beq	f000b8d8 <check_access_task+0xd0>
f000b898:	ebfffeac 	bl	f000b350 <current_task>
f000b89c:	e1a02000 	mov	r2, r0
f000b8a0:	e59b3004 	ldr	r3, [fp, #4]
f000b8a4:	e1520003 	cmp	r2, r3
f000b8a8:	1a00000a 	bne	f000b8d8 <check_access_task+0xd0>
f000b8ac:	e51b0008 	ldr	r0, [fp, #-8]
f000b8b0:	e51b1010 	ldr	r1, [fp, #-16]
f000b8b4:	e51b2020 	ldr	r2, [fp, #-32]
f000b8b8:	eb001b90 	bl	f0012700 <pager_pagein_request>
f000b8bc:	e50b0014 	str	r0, [fp, #-20]
f000b8c0:	e51b3014 	ldr	r3, [fp, #-20]
f000b8c4:	e3530000 	cmp	r3, #0
f000b8c8:	aa000001 	bge	f000b8d4 <check_access_task+0xcc>
f000b8cc:	e51b3014 	ldr	r3, [fp, #-20]
f000b8d0:	ea000003 	b	f000b8e4 <check_access_task+0xdc>
f000b8d4:	ea000001 	b	f000b8e0 <check_access_task+0xd8>
f000b8d8:	e3e0300d 	mvn	r3, #13
f000b8dc:	ea000000 	b	f000b8e4 <check_access_task+0xdc>
f000b8e0:	e3a03000 	mov	r3, #0
f000b8e4:	e1a00003 	mov	r0, r3
f000b8e8:	e24bd004 	sub	sp, fp, #4
f000b8ec:	e8bd8800 	pop	{fp, pc}

f000b8f0 <check_access>:
f000b8f0:	e92d4800 	push	{fp, lr}
f000b8f4:	e28db004 	add	fp, sp, #4
f000b8f8:	e24dd018 	sub	sp, sp, #24
f000b8fc:	e50b0008 	str	r0, [fp, #-8]
f000b900:	e50b100c 	str	r1, [fp, #-12]
f000b904:	e50b2010 	str	r2, [fp, #-16]
f000b908:	e50b3014 	str	r3, [fp, #-20]
f000b90c:	ebfffe8f 	bl	f000b350 <current_task>
f000b910:	e1a03000 	mov	r3, r0
f000b914:	e58d3000 	str	r3, [sp]
f000b918:	e51b0008 	ldr	r0, [fp, #-8]
f000b91c:	e51b100c 	ldr	r1, [fp, #-12]
f000b920:	e51b2010 	ldr	r2, [fp, #-16]
f000b924:	e51b3014 	ldr	r3, [fp, #-20]
f000b928:	ebffffb6 	bl	f000b808 <check_access_task>
f000b92c:	e1a03000 	mov	r3, r0
f000b930:	e1a00003 	mov	r0, r3
f000b934:	e24bd004 	sub	sp, fp, #4
f000b938:	e8bd8800 	pop	{fp, pc}

f000b93c <alloc_bootmem>:
f000b93c:	e92d4800 	push	{fp, lr}
f000b940:	e28db004 	add	fp, sp, #4
f000b944:	e24dd010 	sub	sp, sp, #16
f000b948:	e50b0010 	str	r0, [fp, #-16]
f000b94c:	e50b1014 	str	r1, [fp, #-20]
f000b950:	e51b3014 	ldr	r3, [fp, #-20]
f000b954:	e3530000 	cmp	r3, #0
f000b958:	0a000011 	beq	f000b9a4 <alloc_bootmem+0x68>
f000b95c:	e51b3014 	ldr	r3, [fp, #-20]
f000b960:	e2432001 	sub	r2, r3, #1
f000b964:	e59f30e8 	ldr	r3, [pc, #232]	; f000ba54 <alloc_bootmem+0x118>
f000b968:	e5933000 	ldr	r3, [r3]
f000b96c:	e0023003 	and	r3, r2, r3
f000b970:	e3530000 	cmp	r3, #0
f000b974:	0a000018 	beq	f000b9dc <alloc_bootmem+0xa0>
f000b978:	e51b2014 	ldr	r2, [fp, #-20]
f000b97c:	e59f30d0 	ldr	r3, [pc, #208]	; f000ba54 <alloc_bootmem+0x118>
f000b980:	e5933000 	ldr	r3, [r3]
f000b984:	e0823003 	add	r3, r2, r3
f000b988:	e2432001 	sub	r2, r3, #1
f000b98c:	e51b3014 	ldr	r3, [fp, #-20]
f000b990:	e2633000 	rsb	r3, r3, #0
f000b994:	e0022003 	and	r2, r2, r3
f000b998:	e59f30b4 	ldr	r3, [pc, #180]	; f000ba54 <alloc_bootmem+0x118>
f000b99c:	e5832000 	str	r2, [r3]
f000b9a0:	ea00000d 	b	f000b9dc <alloc_bootmem+0xa0>
f000b9a4:	e51b3010 	ldr	r3, [fp, #-16]
f000b9a8:	e3530003 	cmp	r3, #3
f000b9ac:	da00000a 	ble	f000b9dc <alloc_bootmem+0xa0>
f000b9b0:	e59f309c 	ldr	r3, [pc, #156]	; f000ba54 <alloc_bootmem+0x118>
f000b9b4:	e5933000 	ldr	r3, [r3]
f000b9b8:	e2033003 	and	r3, r3, #3
f000b9bc:	e3530000 	cmp	r3, #0
f000b9c0:	0a000005 	beq	f000b9dc <alloc_bootmem+0xa0>
f000b9c4:	e59f3088 	ldr	r3, [pc, #136]	; f000ba54 <alloc_bootmem+0x118>
f000b9c8:	e5933000 	ldr	r3, [r3]
f000b9cc:	e2833003 	add	r3, r3, #3
f000b9d0:	e3c32003 	bic	r2, r3, #3
f000b9d4:	e59f3078 	ldr	r3, [pc, #120]	; f000ba54 <alloc_bootmem+0x118>
f000b9d8:	e5832000 	str	r2, [r3]
f000b9dc:	e59f3070 	ldr	r3, [pc, #112]	; f000ba54 <alloc_bootmem+0x118>
f000b9e0:	e5933000 	ldr	r3, [r3]
f000b9e4:	e50b3008 	str	r3, [fp, #-8]
f000b9e8:	e51b0008 	ldr	r0, [fp, #-8]
f000b9ec:	e3a01000 	mov	r1, #0
f000b9f0:	e51b2010 	ldr	r2, [fp, #-16]
f000b9f4:	eb002967 	bl	f0015f98 <memset>
f000b9f8:	e59f3054 	ldr	r3, [pc, #84]	; f000ba54 <alloc_bootmem+0x118>
f000b9fc:	e5932000 	ldr	r2, [r3]
f000ba00:	e51b3010 	ldr	r3, [fp, #-16]
f000ba04:	e0822003 	add	r2, r2, r3
f000ba08:	e59f3044 	ldr	r3, [pc, #68]	; f000ba54 <alloc_bootmem+0x118>
f000ba0c:	e5832000 	str	r2, [r3]
f000ba10:	e59f303c 	ldr	r3, [pc, #60]	; f000ba54 <alloc_bootmem+0x118>
f000ba14:	e5932000 	ldr	r2, [r3]
f000ba18:	e59f3038 	ldr	r3, [pc, #56]	; f000ba58 <alloc_bootmem+0x11c>
f000ba1c:	e1520003 	cmp	r2, r3
f000ba20:	3a000007 	bcc	f000ba44 <alloc_bootmem+0x108>
f000ba24:	e59f0030 	ldr	r0, [pc, #48]	; f000ba5c <alloc_bootmem+0x120>
f000ba28:	eb00292f 	bl	f0015eec <printk>
f000ba2c:	e59f002c 	ldr	r0, [pc, #44]	; f000ba60 <alloc_bootmem+0x124>
f000ba30:	e59f102c 	ldr	r1, [pc, #44]	; f000ba64 <alloc_bootmem+0x128>
f000ba34:	e59f202c 	ldr	r2, [pc, #44]	; f000ba68 <alloc_bootmem+0x12c>
f000ba38:	e3a03034 	mov	r3, #52	; 0x34
f000ba3c:	eb00292a 	bl	f0015eec <printk>
f000ba40:	eafffffe 	b	f000ba40 <alloc_bootmem+0x104>
f000ba44:	e51b3008 	ldr	r3, [fp, #-8]
f000ba48:	e1a00003 	mov	r0, r3
f000ba4c:	e24bd004 	sub	sp, fp, #4
f000ba50:	e8bd8800 	pop	{fp, pc}
f000ba54:	f0020008 	.word	0xf0020008
f000ba58:	f0038000 	.word	0xf0038000
f000ba5c:	f001e500 	.word	0xf001e500
f000ba60:	f001e524 	.word	0xf001e524
f000ba64:	f001e54c 	.word	0xf001e54c
f000ba68:	f001e564 	.word	0xf001e564

f000ba6c <alloc_boot_pmd>:
f000ba6c:	e92d4800 	push	{fp, lr}
f000ba70:	e28db004 	add	fp, sp, #4
f000ba74:	e3a00b01 	mov	r0, #1024	; 0x400
f000ba78:	e3a01b01 	mov	r1, #1024	; 0x400
f000ba7c:	ebffffae 	bl	f000b93c <alloc_bootmem>
f000ba80:	e1a03000 	mov	r3, r0
f000ba84:	e1a00003 	mov	r0, r3
f000ba88:	e8bd8800 	pop	{fp, pc}

f000ba8c <link_init>:
f000ba8c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f000ba90:	e28db000 	add	fp, sp, #0
f000ba94:	e24dd00c 	sub	sp, sp, #12
f000ba98:	e50b0008 	str	r0, [fp, #-8]
f000ba9c:	e51b3008 	ldr	r3, [fp, #-8]
f000baa0:	e51b2008 	ldr	r2, [fp, #-8]
f000baa4:	e5832000 	str	r2, [r3]
f000baa8:	e51b3008 	ldr	r3, [fp, #-8]
f000baac:	e51b2008 	ldr	r2, [fp, #-8]
f000bab0:	e5832004 	str	r2, [r3, #4]
f000bab4:	e24bd000 	sub	sp, fp, #0
f000bab8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f000babc:	e12fff1e 	bx	lr

f000bac0 <list_insert>:
f000bac0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f000bac4:	e28db000 	add	fp, sp, #0
f000bac8:	e24dd014 	sub	sp, sp, #20
f000bacc:	e50b0010 	str	r0, [fp, #-16]
f000bad0:	e50b1014 	str	r1, [fp, #-20]
f000bad4:	e51b3014 	ldr	r3, [fp, #-20]
f000bad8:	e5933000 	ldr	r3, [r3]
f000badc:	e50b3008 	str	r3, [fp, #-8]
f000bae0:	e51b3010 	ldr	r3, [fp, #-16]
f000bae4:	e51b2008 	ldr	r2, [fp, #-8]
f000bae8:	e5832000 	str	r2, [r3]
f000baec:	e51b3008 	ldr	r3, [fp, #-8]
f000baf0:	e51b2010 	ldr	r2, [fp, #-16]
f000baf4:	e5832004 	str	r2, [r3, #4]
f000baf8:	e51b3014 	ldr	r3, [fp, #-20]
f000bafc:	e51b2010 	ldr	r2, [fp, #-16]
f000bb00:	e5832000 	str	r2, [r3]
f000bb04:	e51b3010 	ldr	r3, [fp, #-16]
f000bb08:	e51b2014 	ldr	r2, [fp, #-20]
f000bb0c:	e5832004 	str	r2, [r3, #4]
f000bb10:	e24bd000 	sub	sp, fp, #0
f000bb14:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f000bb18:	e12fff1e 	bx	lr

f000bb1c <list_remove>:
f000bb1c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f000bb20:	e28db000 	add	fp, sp, #0
f000bb24:	e24dd014 	sub	sp, sp, #20
f000bb28:	e50b0010 	str	r0, [fp, #-16]
f000bb2c:	e51b3010 	ldr	r3, [fp, #-16]
f000bb30:	e5933004 	ldr	r3, [r3, #4]
f000bb34:	e50b3008 	str	r3, [fp, #-8]
f000bb38:	e51b3010 	ldr	r3, [fp, #-16]
f000bb3c:	e5933000 	ldr	r3, [r3]
f000bb40:	e50b300c 	str	r3, [fp, #-12]
f000bb44:	e51b3008 	ldr	r3, [fp, #-8]
f000bb48:	e51b200c 	ldr	r2, [fp, #-12]
f000bb4c:	e5832000 	str	r2, [r3]
f000bb50:	e51b300c 	ldr	r3, [fp, #-12]
f000bb54:	e51b2008 	ldr	r2, [fp, #-8]
f000bb58:	e5832004 	str	r2, [r3, #4]
f000bb5c:	e51b3010 	ldr	r3, [fp, #-16]
f000bb60:	e59f2018 	ldr	r2, [pc, #24]	; f000bb80 <list_remove+0x64>
f000bb64:	e5832000 	str	r2, [r3]
f000bb68:	e51b3010 	ldr	r3, [fp, #-16]
f000bb6c:	e59f200c 	ldr	r2, [pc, #12]	; f000bb80 <list_remove+0x64>
f000bb70:	e5832004 	str	r2, [r3, #4]
f000bb74:	e24bd000 	sub	sp, fp, #0
f000bb78:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f000bb7c:	e12fff1e 	bx	lr
f000bb80:	deadcccc 	.word	0xdeadcccc

f000bb84 <cap_list_init>:
f000bb84:	e92d4800 	push	{fp, lr}
f000bb88:	e28db004 	add	fp, sp, #4
f000bb8c:	e24dd008 	sub	sp, sp, #8
f000bb90:	e50b0008 	str	r0, [fp, #-8]
f000bb94:	e51b3008 	ldr	r3, [fp, #-8]
f000bb98:	e3a02000 	mov	r2, #0
f000bb9c:	e5832000 	str	r2, [r3]
f000bba0:	e51b3008 	ldr	r3, [fp, #-8]
f000bba4:	e2833004 	add	r3, r3, #4
f000bba8:	e1a00003 	mov	r0, r3
f000bbac:	ebffffb6 	bl	f000ba8c <link_init>
f000bbb0:	e24bd004 	sub	sp, fp, #4
f000bbb4:	e8bd8800 	pop	{fp, pc}

f000bbb8 <cap_list_insert>:
f000bbb8:	e92d4800 	push	{fp, lr}
f000bbbc:	e28db004 	add	fp, sp, #4
f000bbc0:	e24dd008 	sub	sp, sp, #8
f000bbc4:	e50b0008 	str	r0, [fp, #-8]
f000bbc8:	e50b100c 	str	r1, [fp, #-12]
f000bbcc:	e51b2008 	ldr	r2, [fp, #-8]
f000bbd0:	e51b300c 	ldr	r3, [fp, #-12]
f000bbd4:	e2833004 	add	r3, r3, #4
f000bbd8:	e1a00002 	mov	r0, r2
f000bbdc:	e1a01003 	mov	r1, r3
f000bbe0:	ebffffb6 	bl	f000bac0 <list_insert>
f000bbe4:	e51b300c 	ldr	r3, [fp, #-12]
f000bbe8:	e5933000 	ldr	r3, [r3]
f000bbec:	e2832001 	add	r2, r3, #1
f000bbf0:	e51b300c 	ldr	r3, [fp, #-12]
f000bbf4:	e5832000 	str	r2, [r3]
f000bbf8:	e24bd004 	sub	sp, fp, #4
f000bbfc:	e8bd8800 	pop	{fp, pc}

f000bc00 <spin_lock_init>:
f000bc00:	e92d4800 	push	{fp, lr}
f000bc04:	e28db004 	add	fp, sp, #4
f000bc08:	e24dd008 	sub	sp, sp, #8
f000bc0c:	e50b0008 	str	r0, [fp, #-8]
f000bc10:	e51b0008 	ldr	r0, [fp, #-8]
f000bc14:	e3a01000 	mov	r1, #0
f000bc18:	e3a02004 	mov	r2, #4
f000bc1c:	eb0028dd 	bl	f0015f98 <memset>
f000bc20:	e24bd004 	sub	sp, fp, #4
f000bc24:	e8bd8800 	pop	{fp, pc}

f000bc28 <container_head_init>:
f000bc28:	e92d4800 	push	{fp, lr}
f000bc2c:	e28db004 	add	fp, sp, #4
f000bc30:	e24dd008 	sub	sp, sp, #8
f000bc34:	e50b0008 	str	r0, [fp, #-8]
f000bc38:	e51b3008 	ldr	r3, [fp, #-8]
f000bc3c:	e3a02000 	mov	r2, #0
f000bc40:	e5832000 	str	r2, [r3]
f000bc44:	e51b3008 	ldr	r3, [fp, #-8]
f000bc48:	e2833004 	add	r3, r3, #4
f000bc4c:	e1a00003 	mov	r0, r3
f000bc50:	ebffff8d 	bl	f000ba8c <link_init>
f000bc54:	e51b3008 	ldr	r3, [fp, #-8]
f000bc58:	e283300c 	add	r3, r3, #12
f000bc5c:	e1a00003 	mov	r0, r3
f000bc60:	ebffffe6 	bl	f000bc00 <spin_lock_init>
f000bc64:	e24bd004 	sub	sp, fp, #4
f000bc68:	e8bd8800 	pop	{fp, pc}

f000bc6c <current_task>:
f000bc6c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f000bc70:	e28db000 	add	fp, sp, #0
f000bc74:	e1a0300d 	mov	r3, sp
f000bc78:	e3c33eff 	bic	r3, r3, #4080	; 0xff0
f000bc7c:	e3c3300f 	bic	r3, r3, #15
f000bc80:	e1a00003 	mov	r0, r3
f000bc84:	e24bd000 	sub	sp, fp, #0
f000bc88:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f000bc8c:	e12fff1e 	bx	lr

f000bc90 <set_intersection>:
f000bc90:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f000bc94:	e28db000 	add	fp, sp, #0
f000bc98:	e24dd014 	sub	sp, sp, #20
f000bc9c:	e50b0008 	str	r0, [fp, #-8]
f000bca0:	e50b100c 	str	r1, [fp, #-12]
f000bca4:	e50b2010 	str	r2, [fp, #-16]
f000bca8:	e50b3014 	str	r3, [fp, #-20]
f000bcac:	e51b200c 	ldr	r2, [fp, #-12]
f000bcb0:	e51b3010 	ldr	r3, [fp, #-16]
f000bcb4:	e1520003 	cmp	r2, r3
f000bcb8:	9a000003 	bls	f000bccc <set_intersection+0x3c>
f000bcbc:	e51b2008 	ldr	r2, [fp, #-8]
f000bcc0:	e51b3014 	ldr	r3, [fp, #-20]
f000bcc4:	e1520003 	cmp	r2, r3
f000bcc8:	3a000001 	bcc	f000bcd4 <set_intersection+0x44>
f000bccc:	e3a03000 	mov	r3, #0
f000bcd0:	ea000000 	b	f000bcd8 <set_intersection+0x48>
f000bcd4:	e3a03001 	mov	r3, #1
f000bcd8:	e1a00003 	mov	r0, r3
f000bcdc:	e24bd000 	sub	sp, fp, #0
f000bce0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f000bce4:	e12fff1e 	bx	lr

f000bce8 <pgd_alloc>:
f000bce8:	e92d4800 	push	{fp, lr}
f000bcec:	e28db004 	add	fp, sp, #4
f000bcf0:	e59f2018 	ldr	r2, [pc, #24]	; f000bd10 <pgd_alloc+0x28>
f000bcf4:	e59f3018 	ldr	r3, [pc, #24]	; f000bd14 <pgd_alloc+0x2c>
f000bcf8:	e7923003 	ldr	r3, [r2, r3]
f000bcfc:	e1a00003 	mov	r0, r3
f000bd00:	eb002dee 	bl	f00174c0 <mem_cache_zalloc>
f000bd04:	e1a03000 	mov	r3, r0
f000bd08:	e1a00003 	mov	r0, r3
f000bd0c:	e8bd8800 	pop	{fp, pc}
f000bd10:	f002d0a0 	.word	0xf002d0a0
f000bd14:	00006074 	.word	0x00006074

f000bd18 <pmd_cap_alloc>:
f000bd18:	e92d4800 	push	{fp, lr}
f000bd1c:	e28db004 	add	fp, sp, #4
f000bd20:	e24dd010 	sub	sp, sp, #16
f000bd24:	e50b0010 	str	r0, [fp, #-16]
f000bd28:	e51b0010 	ldr	r0, [fp, #-16]
f000bd2c:	e3a01502 	mov	r1, #8388608	; 0x800000
f000bd30:	eb0009e3 	bl	f000e4c4 <cap_list_find_by_rtype>
f000bd34:	e50b0008 	str	r0, [fp, #-8]
f000bd38:	e51b3008 	ldr	r3, [fp, #-8]
f000bd3c:	e3530000 	cmp	r3, #0
f000bd40:	1a000001 	bne	f000bd4c <pmd_cap_alloc+0x34>
f000bd44:	e3a03000 	mov	r3, #0
f000bd48:	ea00000d 	b	f000bd84 <pmd_cap_alloc+0x6c>
f000bd4c:	e51b0008 	ldr	r0, [fp, #-8]
f000bd50:	e3a01001 	mov	r1, #1
f000bd54:	eb0009b0 	bl	f000e41c <capability_consume>
f000bd58:	e1a03000 	mov	r3, r0
f000bd5c:	e3530000 	cmp	r3, #0
f000bd60:	aa000001 	bge	f000bd6c <pmd_cap_alloc+0x54>
f000bd64:	e3a03000 	mov	r3, #0
f000bd68:	ea000005 	b	f000bd84 <pmd_cap_alloc+0x6c>
f000bd6c:	e59f201c 	ldr	r2, [pc, #28]	; f000bd90 <pmd_cap_alloc+0x78>
f000bd70:	e59f301c 	ldr	r3, [pc, #28]	; f000bd94 <pmd_cap_alloc+0x7c>
f000bd74:	e7923003 	ldr	r3, [r2, r3]
f000bd78:	e1a00003 	mov	r0, r3
f000bd7c:	eb002dcf 	bl	f00174c0 <mem_cache_zalloc>
f000bd80:	e1a03000 	mov	r3, r0
f000bd84:	e1a00003 	mov	r0, r3
f000bd88:	e24bd004 	sub	sp, fp, #4
f000bd8c:	e8bd8800 	pop	{fp, pc}
f000bd90:	f002d0a0 	.word	0xf002d0a0
f000bd94:	00006078 	.word	0x00006078

f000bd98 <space_cap_alloc>:
f000bd98:	e92d4800 	push	{fp, lr}
f000bd9c:	e28db004 	add	fp, sp, #4
f000bda0:	e24dd010 	sub	sp, sp, #16
f000bda4:	e50b0010 	str	r0, [fp, #-16]
f000bda8:	e51b0010 	ldr	r0, [fp, #-16]
f000bdac:	e3a01602 	mov	r1, #2097152	; 0x200000
f000bdb0:	eb0009c3 	bl	f000e4c4 <cap_list_find_by_rtype>
f000bdb4:	e50b0008 	str	r0, [fp, #-8]
f000bdb8:	e51b3008 	ldr	r3, [fp, #-8]
f000bdbc:	e3530000 	cmp	r3, #0
f000bdc0:	1a000001 	bne	f000bdcc <space_cap_alloc+0x34>
f000bdc4:	e3a03000 	mov	r3, #0
f000bdc8:	ea00000d 	b	f000be04 <space_cap_alloc+0x6c>
f000bdcc:	e51b0008 	ldr	r0, [fp, #-8]
f000bdd0:	e3a01001 	mov	r1, #1
f000bdd4:	eb000990 	bl	f000e41c <capability_consume>
f000bdd8:	e1a03000 	mov	r3, r0
f000bddc:	e3530000 	cmp	r3, #0
f000bde0:	aa000001 	bge	f000bdec <space_cap_alloc+0x54>
f000bde4:	e3a03000 	mov	r3, #0
f000bde8:	ea000005 	b	f000be04 <space_cap_alloc+0x6c>
f000bdec:	e59f201c 	ldr	r2, [pc, #28]	; f000be10 <space_cap_alloc+0x78>
f000bdf0:	e59f301c 	ldr	r3, [pc, #28]	; f000be14 <space_cap_alloc+0x7c>
f000bdf4:	e7923003 	ldr	r3, [r2, r3]
f000bdf8:	e1a00003 	mov	r0, r3
f000bdfc:	eb002daf 	bl	f00174c0 <mem_cache_zalloc>
f000be00:	e1a03000 	mov	r3, r0
f000be04:	e1a00003 	mov	r0, r3
f000be08:	e24bd004 	sub	sp, fp, #4
f000be0c:	e8bd8800 	pop	{fp, pc}
f000be10:	f002d0a0 	.word	0xf002d0a0
f000be14:	00006080 	.word	0x00006080

f000be18 <ktcb_cap_alloc>:
f000be18:	e92d4800 	push	{fp, lr}
f000be1c:	e28db004 	add	fp, sp, #4
f000be20:	e24dd010 	sub	sp, sp, #16
f000be24:	e50b0010 	str	r0, [fp, #-16]
f000be28:	e51b0010 	ldr	r0, [fp, #-16]
f000be2c:	e3a01601 	mov	r1, #1048576	; 0x100000
f000be30:	eb0009a3 	bl	f000e4c4 <cap_list_find_by_rtype>
f000be34:	e50b0008 	str	r0, [fp, #-8]
f000be38:	e51b3008 	ldr	r3, [fp, #-8]
f000be3c:	e3530000 	cmp	r3, #0
f000be40:	1a000001 	bne	f000be4c <ktcb_cap_alloc+0x34>
f000be44:	e3a03000 	mov	r3, #0
f000be48:	ea00000d 	b	f000be84 <ktcb_cap_alloc+0x6c>
f000be4c:	e51b0008 	ldr	r0, [fp, #-8]
f000be50:	e3a01001 	mov	r1, #1
f000be54:	eb000970 	bl	f000e41c <capability_consume>
f000be58:	e1a03000 	mov	r3, r0
f000be5c:	e3530000 	cmp	r3, #0
f000be60:	aa000001 	bge	f000be6c <ktcb_cap_alloc+0x54>
f000be64:	e3a03000 	mov	r3, #0
f000be68:	ea000005 	b	f000be84 <ktcb_cap_alloc+0x6c>
f000be6c:	e59f201c 	ldr	r2, [pc, #28]	; f000be90 <ktcb_cap_alloc+0x78>
f000be70:	e59f301c 	ldr	r3, [pc, #28]	; f000be94 <ktcb_cap_alloc+0x7c>
f000be74:	e7923003 	ldr	r3, [r2, r3]
f000be78:	e1a00003 	mov	r0, r3
f000be7c:	eb002d8f 	bl	f00174c0 <mem_cache_zalloc>
f000be80:	e1a03000 	mov	r3, r0
f000be84:	e1a00003 	mov	r0, r3
f000be88:	e24bd004 	sub	sp, fp, #4
f000be8c:	e8bd8800 	pop	{fp, pc}
f000be90:	f002d0a0 	.word	0xf002d0a0
f000be94:	0000607c 	.word	0x0000607c

f000be98 <mutex_cap_alloc>:
f000be98:	e92d4800 	push	{fp, lr}
f000be9c:	e28db004 	add	fp, sp, #4
f000bea0:	e24dd008 	sub	sp, sp, #8
f000bea4:	ebffff70 	bl	f000bc6c <current_task>
f000bea8:	e1a03000 	mov	r3, r0
f000beac:	e1a00003 	mov	r0, r3
f000beb0:	e3a01501 	mov	r1, #4194304	; 0x400000
f000beb4:	eb0009a5 	bl	f000e550 <cap_find_by_rtype>
f000beb8:	e50b0008 	str	r0, [fp, #-8]
f000bebc:	e51b3008 	ldr	r3, [fp, #-8]
f000bec0:	e3530000 	cmp	r3, #0
f000bec4:	1a000001 	bne	f000bed0 <mutex_cap_alloc+0x38>
f000bec8:	e3a03000 	mov	r3, #0
f000becc:	ea00000d 	b	f000bf08 <mutex_cap_alloc+0x70>
f000bed0:	e51b0008 	ldr	r0, [fp, #-8]
f000bed4:	e3a01001 	mov	r1, #1
f000bed8:	eb00094f 	bl	f000e41c <capability_consume>
f000bedc:	e1a03000 	mov	r3, r0
f000bee0:	e3530000 	cmp	r3, #0
f000bee4:	aa000001 	bge	f000bef0 <mutex_cap_alloc+0x58>
f000bee8:	e3a03000 	mov	r3, #0
f000beec:	ea000005 	b	f000bf08 <mutex_cap_alloc+0x70>
f000bef0:	e59f201c 	ldr	r2, [pc, #28]	; f000bf14 <mutex_cap_alloc+0x7c>
f000bef4:	e59f301c 	ldr	r3, [pc, #28]	; f000bf18 <mutex_cap_alloc+0x80>
f000bef8:	e7923003 	ldr	r3, [r2, r3]
f000befc:	e1a00003 	mov	r0, r3
f000bf00:	eb002d6e 	bl	f00174c0 <mem_cache_zalloc>
f000bf04:	e1a03000 	mov	r3, r0
f000bf08:	e1a00003 	mov	r0, r3
f000bf0c:	e24bd004 	sub	sp, fp, #4
f000bf10:	e8bd8800 	pop	{fp, pc}
f000bf14:	f002d0a0 	.word	0xf002d0a0
f000bf18:	00006084 	.word	0x00006084

f000bf1c <pgd_free>:
f000bf1c:	e92d4800 	push	{fp, lr}
f000bf20:	e28db004 	add	fp, sp, #4
f000bf24:	e24dd008 	sub	sp, sp, #8
f000bf28:	e50b0008 	str	r0, [fp, #-8]
f000bf2c:	e59f203c 	ldr	r2, [pc, #60]	; f000bf70 <pgd_free+0x54>
f000bf30:	e59f303c 	ldr	r3, [pc, #60]	; f000bf74 <pgd_free+0x58>
f000bf34:	e7923003 	ldr	r3, [r2, r3]
f000bf38:	e1a00003 	mov	r0, r3
f000bf3c:	e51b1008 	ldr	r1, [fp, #-8]
f000bf40:	eb002dad 	bl	f00175fc <mem_cache_free>
f000bf44:	e1a03000 	mov	r3, r0
f000bf48:	e3530000 	cmp	r3, #0
f000bf4c:	aa000005 	bge	f000bf68 <pgd_free+0x4c>
f000bf50:	e59f0020 	ldr	r0, [pc, #32]	; f000bf78 <pgd_free+0x5c>
f000bf54:	e59f1020 	ldr	r1, [pc, #32]	; f000bf7c <pgd_free+0x60>
f000bf58:	e59f2020 	ldr	r2, [pc, #32]	; f000bf80 <pgd_free+0x64>
f000bf5c:	e3a03056 	mov	r3, #86	; 0x56
f000bf60:	eb0027e1 	bl	f0015eec <printk>
f000bf64:	eafffffe 	b	f000bf64 <pgd_free+0x48>
f000bf68:	e24bd004 	sub	sp, fp, #4
f000bf6c:	e8bd8800 	pop	{fp, pc}
f000bf70:	f002d0a0 	.word	0xf002d0a0
f000bf74:	00006074 	.word	0x00006074
f000bf78:	f001e574 	.word	0xf001e574
f000bf7c:	f001e59c 	.word	0xf001e59c
f000bf80:	f001e6f4 	.word	0xf001e6f4

f000bf84 <pmd_cap_free>:
f000bf84:	e92d4800 	push	{fp, lr}
f000bf88:	e28db004 	add	fp, sp, #4
f000bf8c:	e24dd010 	sub	sp, sp, #16
f000bf90:	e50b0010 	str	r0, [fp, #-16]
f000bf94:	e50b1014 	str	r1, [fp, #-20]
f000bf98:	e51b0014 	ldr	r0, [fp, #-20]
f000bf9c:	e3a01502 	mov	r1, #8388608	; 0x800000
f000bfa0:	eb000947 	bl	f000e4c4 <cap_list_find_by_rtype>
f000bfa4:	e50b0008 	str	r0, [fp, #-8]
f000bfa8:	e51b3008 	ldr	r3, [fp, #-8]
f000bfac:	e3530000 	cmp	r3, #0
f000bfb0:	1a000005 	bne	f000bfcc <pmd_cap_free+0x48>
f000bfb4:	e59f0060 	ldr	r0, [pc, #96]	; f000c01c <pmd_cap_free+0x98>
f000bfb8:	e59f1060 	ldr	r1, [pc, #96]	; f000c020 <pmd_cap_free+0x9c>
f000bfbc:	e59f2060 	ldr	r2, [pc, #96]	; f000c024 <pmd_cap_free+0xa0>
f000bfc0:	e3a0305e 	mov	r3, #94	; 0x5e
f000bfc4:	eb0027c8 	bl	f0015eec <printk>
f000bfc8:	eafffffe 	b	f000bfc8 <pmd_cap_free+0x44>
f000bfcc:	e51b0008 	ldr	r0, [fp, #-8]
f000bfd0:	e3a01001 	mov	r1, #1
f000bfd4:	eb00092a 	bl	f000e484 <capability_free>
f000bfd8:	e59f2048 	ldr	r2, [pc, #72]	; f000c028 <pmd_cap_free+0xa4>
f000bfdc:	e59f3048 	ldr	r3, [pc, #72]	; f000c02c <pmd_cap_free+0xa8>
f000bfe0:	e7923003 	ldr	r3, [r2, r3]
f000bfe4:	e1a00003 	mov	r0, r3
f000bfe8:	e51b1010 	ldr	r1, [fp, #-16]
f000bfec:	eb002d82 	bl	f00175fc <mem_cache_free>
f000bff0:	e1a03000 	mov	r3, r0
f000bff4:	e3530000 	cmp	r3, #0
f000bff8:	aa000005 	bge	f000c014 <pmd_cap_free+0x90>
f000bffc:	e59f0018 	ldr	r0, [pc, #24]	; f000c01c <pmd_cap_free+0x98>
f000c000:	e59f1018 	ldr	r1, [pc, #24]	; f000c020 <pmd_cap_free+0x9c>
f000c004:	e59f2018 	ldr	r2, [pc, #24]	; f000c024 <pmd_cap_free+0xa0>
f000c008:	e3a03061 	mov	r3, #97	; 0x61
f000c00c:	eb0027b6 	bl	f0015eec <printk>
f000c010:	eafffffe 	b	f000c010 <pmd_cap_free+0x8c>
f000c014:	e24bd004 	sub	sp, fp, #4
f000c018:	e8bd8800 	pop	{fp, pc}
f000c01c:	f001e574 	.word	0xf001e574
f000c020:	f001e59c 	.word	0xf001e59c
f000c024:	f001e700 	.word	0xf001e700
f000c028:	f002d0a0 	.word	0xf002d0a0
f000c02c:	00006078 	.word	0x00006078

f000c030 <space_cap_free>:
f000c030:	e92d4800 	push	{fp, lr}
f000c034:	e28db004 	add	fp, sp, #4
f000c038:	e24dd010 	sub	sp, sp, #16
f000c03c:	e50b0010 	str	r0, [fp, #-16]
f000c040:	e50b1014 	str	r1, [fp, #-20]
f000c044:	e51b0014 	ldr	r0, [fp, #-20]
f000c048:	e3a01602 	mov	r1, #2097152	; 0x200000
f000c04c:	eb00091c 	bl	f000e4c4 <cap_list_find_by_rtype>
f000c050:	e50b0008 	str	r0, [fp, #-8]
f000c054:	e51b3008 	ldr	r3, [fp, #-8]
f000c058:	e3530000 	cmp	r3, #0
f000c05c:	1a000005 	bne	f000c078 <space_cap_free+0x48>
f000c060:	e59f0060 	ldr	r0, [pc, #96]	; f000c0c8 <space_cap_free+0x98>
f000c064:	e59f1060 	ldr	r1, [pc, #96]	; f000c0cc <space_cap_free+0x9c>
f000c068:	e59f2060 	ldr	r2, [pc, #96]	; f000c0d0 <space_cap_free+0xa0>
f000c06c:	e3a03069 	mov	r3, #105	; 0x69
f000c070:	eb00279d 	bl	f0015eec <printk>
f000c074:	eafffffe 	b	f000c074 <space_cap_free+0x44>
f000c078:	e51b0008 	ldr	r0, [fp, #-8]
f000c07c:	e3a01001 	mov	r1, #1
f000c080:	eb0008ff 	bl	f000e484 <capability_free>
f000c084:	e59f2048 	ldr	r2, [pc, #72]	; f000c0d4 <space_cap_free+0xa4>
f000c088:	e59f3048 	ldr	r3, [pc, #72]	; f000c0d8 <space_cap_free+0xa8>
f000c08c:	e7923003 	ldr	r3, [r2, r3]
f000c090:	e1a00003 	mov	r0, r3
f000c094:	e51b1010 	ldr	r1, [fp, #-16]
f000c098:	eb002d57 	bl	f00175fc <mem_cache_free>
f000c09c:	e1a03000 	mov	r3, r0
f000c0a0:	e3530000 	cmp	r3, #0
f000c0a4:	aa000005 	bge	f000c0c0 <space_cap_free+0x90>
f000c0a8:	e59f0018 	ldr	r0, [pc, #24]	; f000c0c8 <space_cap_free+0x98>
f000c0ac:	e59f1018 	ldr	r1, [pc, #24]	; f000c0cc <space_cap_free+0x9c>
f000c0b0:	e59f2018 	ldr	r2, [pc, #24]	; f000c0d0 <space_cap_free+0xa0>
f000c0b4:	e3a0306c 	mov	r3, #108	; 0x6c
f000c0b8:	eb00278b 	bl	f0015eec <printk>
f000c0bc:	eafffffe 	b	f000c0bc <space_cap_free+0x8c>
f000c0c0:	e24bd004 	sub	sp, fp, #4
f000c0c4:	e8bd8800 	pop	{fp, pc}
f000c0c8:	f001e574 	.word	0xf001e574
f000c0cc:	f001e59c 	.word	0xf001e59c
f000c0d0:	f001e710 	.word	0xf001e710
f000c0d4:	f002d0a0 	.word	0xf002d0a0
f000c0d8:	00006080 	.word	0x00006080

f000c0dc <ktcb_cap_free>:
f000c0dc:	e92d4800 	push	{fp, lr}
f000c0e0:	e28db004 	add	fp, sp, #4
f000c0e4:	e24dd010 	sub	sp, sp, #16
f000c0e8:	e50b0010 	str	r0, [fp, #-16]
f000c0ec:	e50b1014 	str	r1, [fp, #-20]
f000c0f0:	e51b0014 	ldr	r0, [fp, #-20]
f000c0f4:	e3a01601 	mov	r1, #1048576	; 0x100000
f000c0f8:	eb0008f1 	bl	f000e4c4 <cap_list_find_by_rtype>
f000c0fc:	e50b0008 	str	r0, [fp, #-8]
f000c100:	e51b3008 	ldr	r3, [fp, #-8]
f000c104:	e3530000 	cmp	r3, #0
f000c108:	1a000005 	bne	f000c124 <ktcb_cap_free+0x48>
f000c10c:	e59f0060 	ldr	r0, [pc, #96]	; f000c174 <ktcb_cap_free+0x98>
f000c110:	e59f1060 	ldr	r1, [pc, #96]	; f000c178 <ktcb_cap_free+0x9c>
f000c114:	e59f2060 	ldr	r2, [pc, #96]	; f000c17c <ktcb_cap_free+0xa0>
f000c118:	e3a0307a 	mov	r3, #122	; 0x7a
f000c11c:	eb002772 	bl	f0015eec <printk>
f000c120:	eafffffe 	b	f000c120 <ktcb_cap_free+0x44>
f000c124:	e51b0008 	ldr	r0, [fp, #-8]
f000c128:	e3a01001 	mov	r1, #1
f000c12c:	eb0008d4 	bl	f000e484 <capability_free>
f000c130:	e59f2048 	ldr	r2, [pc, #72]	; f000c180 <ktcb_cap_free+0xa4>
f000c134:	e59f3048 	ldr	r3, [pc, #72]	; f000c184 <ktcb_cap_free+0xa8>
f000c138:	e7923003 	ldr	r3, [r2, r3]
f000c13c:	e1a00003 	mov	r0, r3
f000c140:	e51b1010 	ldr	r1, [fp, #-16]
f000c144:	eb002d2c 	bl	f00175fc <mem_cache_free>
f000c148:	e1a03000 	mov	r3, r0
f000c14c:	e3530000 	cmp	r3, #0
f000c150:	aa000005 	bge	f000c16c <ktcb_cap_free+0x90>
f000c154:	e59f0018 	ldr	r0, [pc, #24]	; f000c174 <ktcb_cap_free+0x98>
f000c158:	e59f1018 	ldr	r1, [pc, #24]	; f000c178 <ktcb_cap_free+0x9c>
f000c15c:	e59f2018 	ldr	r2, [pc, #24]	; f000c17c <ktcb_cap_free+0xa0>
f000c160:	e3a0307d 	mov	r3, #125	; 0x7d
f000c164:	eb002760 	bl	f0015eec <printk>
f000c168:	eafffffe 	b	f000c168 <ktcb_cap_free+0x8c>
f000c16c:	e24bd004 	sub	sp, fp, #4
f000c170:	e8bd8800 	pop	{fp, pc}
f000c174:	f001e574 	.word	0xf001e574
f000c178:	f001e59c 	.word	0xf001e59c
f000c17c:	f001e720 	.word	0xf001e720
f000c180:	f002d0a0 	.word	0xf002d0a0
f000c184:	0000607c 	.word	0x0000607c

f000c188 <mutex_cap_free>:
f000c188:	e92d4800 	push	{fp, lr}
f000c18c:	e28db004 	add	fp, sp, #4
f000c190:	e24dd010 	sub	sp, sp, #16
f000c194:	e50b0010 	str	r0, [fp, #-16]
f000c198:	ebfffeb3 	bl	f000bc6c <current_task>
f000c19c:	e1a03000 	mov	r3, r0
f000c1a0:	e1a00003 	mov	r0, r3
f000c1a4:	e3a01501 	mov	r1, #4194304	; 0x400000
f000c1a8:	eb0008e8 	bl	f000e550 <cap_find_by_rtype>
f000c1ac:	e50b0008 	str	r0, [fp, #-8]
f000c1b0:	e51b3008 	ldr	r3, [fp, #-8]
f000c1b4:	e3530000 	cmp	r3, #0
f000c1b8:	1a000005 	bne	f000c1d4 <mutex_cap_free+0x4c>
f000c1bc:	e59f0060 	ldr	r0, [pc, #96]	; f000c224 <mutex_cap_free+0x9c>
f000c1c0:	e59f1060 	ldr	r1, [pc, #96]	; f000c228 <mutex_cap_free+0xa0>
f000c1c4:	e59f2060 	ldr	r2, [pc, #96]	; f000c22c <mutex_cap_free+0xa4>
f000c1c8:	e3a03085 	mov	r3, #133	; 0x85
f000c1cc:	eb002746 	bl	f0015eec <printk>
f000c1d0:	eafffffe 	b	f000c1d0 <mutex_cap_free+0x48>
f000c1d4:	e51b0008 	ldr	r0, [fp, #-8]
f000c1d8:	e3a01001 	mov	r1, #1
f000c1dc:	eb0008a8 	bl	f000e484 <capability_free>
f000c1e0:	e59f2048 	ldr	r2, [pc, #72]	; f000c230 <mutex_cap_free+0xa8>
f000c1e4:	e59f3048 	ldr	r3, [pc, #72]	; f000c234 <mutex_cap_free+0xac>
f000c1e8:	e7923003 	ldr	r3, [r2, r3]
f000c1ec:	e1a00003 	mov	r0, r3
f000c1f0:	e51b1010 	ldr	r1, [fp, #-16]
f000c1f4:	eb002d00 	bl	f00175fc <mem_cache_free>
f000c1f8:	e1a03000 	mov	r3, r0
f000c1fc:	e3530000 	cmp	r3, #0
f000c200:	aa000005 	bge	f000c21c <mutex_cap_free+0x94>
f000c204:	e59f0018 	ldr	r0, [pc, #24]	; f000c224 <mutex_cap_free+0x9c>
f000c208:	e59f1018 	ldr	r1, [pc, #24]	; f000c228 <mutex_cap_free+0xa0>
f000c20c:	e59f2018 	ldr	r2, [pc, #24]	; f000c22c <mutex_cap_free+0xa4>
f000c210:	e3a03088 	mov	r3, #136	; 0x88
f000c214:	eb002734 	bl	f0015eec <printk>
f000c218:	eafffffe 	b	f000c218 <mutex_cap_free+0x90>
f000c21c:	e24bd004 	sub	sp, fp, #4
f000c220:	e8bd8800 	pop	{fp, pc}
f000c224:	f001e574 	.word	0xf001e574
f000c228:	f001e59c 	.word	0xf001e59c
f000c22c:	f001e730 	.word	0xf001e730
f000c230:	f002d0a0 	.word	0xf002d0a0
f000c234:	00006084 	.word	0x00006084

f000c238 <memcap_split>:
f000c238:	e92d4800 	push	{fp, lr}
f000c23c:	e28db004 	add	fp, sp, #4
f000c240:	e24dd018 	sub	sp, sp, #24
f000c244:	e50b0010 	str	r0, [fp, #-16]
f000c248:	e50b1014 	str	r1, [fp, #-20]
f000c24c:	e50b2018 	str	r2, [fp, #-24]
f000c250:	e50b301c 	str	r3, [fp, #-28]
f000c254:	e3a0002c 	mov	r0, #44	; 0x2c
f000c258:	e3a01000 	mov	r1, #0
f000c25c:	ebfffdb6 	bl	f000b93c <alloc_bootmem>
f000c260:	e50b0008 	str	r0, [fp, #-8]
f000c264:	e51b3010 	ldr	r3, [fp, #-16]
f000c268:	e593201c 	ldr	r2, [r3, #28]
f000c26c:	e51b3018 	ldr	r3, [fp, #-24]
f000c270:	e1520003 	cmp	r2, r3
f000c274:	2a000004 	bcs	f000c28c <memcap_split+0x54>
f000c278:	e51b3010 	ldr	r3, [fp, #-16]
f000c27c:	e5932020 	ldr	r2, [r3, #32]
f000c280:	e51b301c 	ldr	r3, [fp, #-28]
f000c284:	e1520003 	cmp	r2, r3
f000c288:	8a000005 	bhi	f000c2a4 <memcap_split+0x6c>
f000c28c:	e59f0064 	ldr	r0, [pc, #100]	; f000c2f8 <memcap_split+0xc0>
f000c290:	e59f1064 	ldr	r1, [pc, #100]	; f000c2fc <memcap_split+0xc4>
f000c294:	e59f2064 	ldr	r2, [pc, #100]	; f000c300 <memcap_split+0xc8>
f000c298:	e3a0309c 	mov	r3, #156	; 0x9c
f000c29c:	eb002712 	bl	f0015eec <printk>
f000c2a0:	eafffffe 	b	f000c2a0 <memcap_split+0x68>
f000c2a4:	e51b3010 	ldr	r3, [fp, #-16]
f000c2a8:	e5932020 	ldr	r2, [r3, #32]
f000c2ac:	e51b3008 	ldr	r3, [fp, #-8]
f000c2b0:	e5832020 	str	r2, [r3, #32]
f000c2b4:	e51b3008 	ldr	r3, [fp, #-8]
f000c2b8:	e51b201c 	ldr	r2, [fp, #-28]
f000c2bc:	e583201c 	str	r2, [r3, #28]
f000c2c0:	e51b3010 	ldr	r3, [fp, #-16]
f000c2c4:	e51b2018 	ldr	r2, [fp, #-24]
f000c2c8:	e5832020 	str	r2, [r3, #32]
f000c2cc:	e51b3010 	ldr	r3, [fp, #-16]
f000c2d0:	e5932018 	ldr	r2, [r3, #24]
f000c2d4:	e51b3008 	ldr	r3, [fp, #-8]
f000c2d8:	e5832018 	str	r2, [r3, #24]
f000c2dc:	e51b0008 	ldr	r0, [fp, #-8]
f000c2e0:	e51b1014 	ldr	r1, [fp, #-20]
f000c2e4:	ebfffe33 	bl	f000bbb8 <cap_list_insert>
f000c2e8:	e3a03000 	mov	r3, #0
f000c2ec:	e1a00003 	mov	r0, r3
f000c2f0:	e24bd004 	sub	sp, fp, #4
f000c2f4:	e8bd8800 	pop	{fp, pc}
f000c2f8:	f001e574 	.word	0xf001e574
f000c2fc:	f001e59c 	.word	0xf001e59c
f000c300:	f001e740 	.word	0xf001e740

f000c304 <memcap_shrink>:
f000c304:	e92d4800 	push	{fp, lr}
f000c308:	e28db004 	add	fp, sp, #4
f000c30c:	e24dd010 	sub	sp, sp, #16
f000c310:	e50b0008 	str	r0, [fp, #-8]
f000c314:	e50b100c 	str	r1, [fp, #-12]
f000c318:	e50b2010 	str	r2, [fp, #-16]
f000c31c:	e50b3014 	str	r3, [fp, #-20]
f000c320:	e51b3008 	ldr	r3, [fp, #-8]
f000c324:	e593201c 	ldr	r2, [r3, #28]
f000c328:	e51b3010 	ldr	r3, [fp, #-16]
f000c32c:	e1520003 	cmp	r2, r3
f000c330:	2a00000e 	bcs	f000c370 <memcap_shrink+0x6c>
f000c334:	e51b3008 	ldr	r3, [fp, #-8]
f000c338:	e5932020 	ldr	r2, [r3, #32]
f000c33c:	e51b3010 	ldr	r3, [fp, #-16]
f000c340:	e1520003 	cmp	r2, r3
f000c344:	8a000005 	bhi	f000c360 <memcap_shrink+0x5c>
f000c348:	e59f0098 	ldr	r0, [pc, #152]	; f000c3e8 <memcap_shrink+0xe4>
f000c34c:	e59f1098 	ldr	r1, [pc, #152]	; f000c3ec <memcap_shrink+0xe8>
f000c350:	e59f2098 	ldr	r2, [pc, #152]	; f000c3f0 <memcap_shrink+0xec>
f000c354:	e3a030b0 	mov	r3, #176	; 0xb0
f000c358:	eb0026e3 	bl	f0015eec <printk>
f000c35c:	eafffffe 	b	f000c35c <memcap_shrink+0x58>
f000c360:	e51b3008 	ldr	r3, [fp, #-8]
f000c364:	e51b2010 	ldr	r2, [fp, #-16]
f000c368:	e5832020 	str	r2, [r3, #32]
f000c36c:	ea000019 	b	f000c3d8 <memcap_shrink+0xd4>
f000c370:	e51b3008 	ldr	r3, [fp, #-8]
f000c374:	e5932020 	ldr	r2, [r3, #32]
f000c378:	e51b3014 	ldr	r3, [fp, #-20]
f000c37c:	e1520003 	cmp	r2, r3
f000c380:	9a00000e 	bls	f000c3c0 <memcap_shrink+0xbc>
f000c384:	e51b3008 	ldr	r3, [fp, #-8]
f000c388:	e593201c 	ldr	r2, [r3, #28]
f000c38c:	e51b3014 	ldr	r3, [fp, #-20]
f000c390:	e1520003 	cmp	r2, r3
f000c394:	3a000005 	bcc	f000c3b0 <memcap_shrink+0xac>
f000c398:	e59f0048 	ldr	r0, [pc, #72]	; f000c3e8 <memcap_shrink+0xe4>
f000c39c:	e59f1048 	ldr	r1, [pc, #72]	; f000c3ec <memcap_shrink+0xe8>
f000c3a0:	e59f2048 	ldr	r2, [pc, #72]	; f000c3f0 <memcap_shrink+0xec>
f000c3a4:	e3a030b5 	mov	r3, #181	; 0xb5
f000c3a8:	eb0026cf 	bl	f0015eec <printk>
f000c3ac:	eafffffe 	b	f000c3ac <memcap_shrink+0xa8>
f000c3b0:	e51b3008 	ldr	r3, [fp, #-8]
f000c3b4:	e51b2014 	ldr	r2, [fp, #-20]
f000c3b8:	e583201c 	str	r2, [r3, #28]
f000c3bc:	ea000005 	b	f000c3d8 <memcap_shrink+0xd4>
f000c3c0:	e59f0020 	ldr	r0, [pc, #32]	; f000c3e8 <memcap_shrink+0xe4>
f000c3c4:	e59f1020 	ldr	r1, [pc, #32]	; f000c3ec <memcap_shrink+0xe8>
f000c3c8:	e59f2020 	ldr	r2, [pc, #32]	; f000c3f0 <memcap_shrink+0xec>
f000c3cc:	e3a030b8 	mov	r3, #184	; 0xb8
f000c3d0:	eb0026c5 	bl	f0015eec <printk>
f000c3d4:	eafffffe 	b	f000c3d4 <memcap_shrink+0xd0>
f000c3d8:	e3a03000 	mov	r3, #0
f000c3dc:	e1a00003 	mov	r0, r3
f000c3e0:	e24bd004 	sub	sp, fp, #4
f000c3e4:	e8bd8800 	pop	{fp, pc}
f000c3e8:	f001e574 	.word	0xf001e574
f000c3ec:	f001e59c 	.word	0xf001e59c
f000c3f0:	f001e750 	.word	0xf001e750

f000c3f4 <memcap_unmap_range>:
f000c3f4:	e92d4800 	push	{fp, lr}
f000c3f8:	e28db004 	add	fp, sp, #4
f000c3fc:	e24dd010 	sub	sp, sp, #16
f000c400:	e50b0008 	str	r0, [fp, #-8]
f000c404:	e50b100c 	str	r1, [fp, #-12]
f000c408:	e50b2010 	str	r2, [fp, #-16]
f000c40c:	e50b3014 	str	r3, [fp, #-20]
f000c410:	e51b3008 	ldr	r3, [fp, #-8]
f000c414:	e593201c 	ldr	r2, [r3, #28]
f000c418:	e51b3010 	ldr	r3, [fp, #-16]
f000c41c:	e1520003 	cmp	r2, r3
f000c420:	2a00000b 	bcs	f000c454 <memcap_unmap_range+0x60>
f000c424:	e51b3008 	ldr	r3, [fp, #-8]
f000c428:	e5932020 	ldr	r2, [r3, #32]
f000c42c:	e51b3014 	ldr	r3, [fp, #-20]
f000c430:	e1520003 	cmp	r2, r3
f000c434:	9a000006 	bls	f000c454 <memcap_unmap_range+0x60>
f000c438:	e51b0008 	ldr	r0, [fp, #-8]
f000c43c:	e51b100c 	ldr	r1, [fp, #-12]
f000c440:	e51b2010 	ldr	r2, [fp, #-16]
f000c444:	e51b3014 	ldr	r3, [fp, #-20]
f000c448:	ebffff7a 	bl	f000c238 <memcap_split>
f000c44c:	e1a03000 	mov	r3, r0
f000c450:	ea00002f 	b	f000c514 <memcap_unmap_range+0x120>
f000c454:	e51b3008 	ldr	r3, [fp, #-8]
f000c458:	e593201c 	ldr	r2, [r3, #28]
f000c45c:	e51b3010 	ldr	r3, [fp, #-16]
f000c460:	e1520003 	cmp	r2, r3
f000c464:	3a000004 	bcc	f000c47c <memcap_unmap_range+0x88>
f000c468:	e51b3008 	ldr	r3, [fp, #-8]
f000c46c:	e5932020 	ldr	r2, [r3, #32]
f000c470:	e51b3014 	ldr	r3, [fp, #-20]
f000c474:	e1520003 	cmp	r2, r3
f000c478:	8a000009 	bhi	f000c4a4 <memcap_unmap_range+0xb0>
f000c47c:	e51b3008 	ldr	r3, [fp, #-8]
f000c480:	e593201c 	ldr	r2, [r3, #28]
f000c484:	e51b3010 	ldr	r3, [fp, #-16]
f000c488:	e1520003 	cmp	r2, r3
f000c48c:	2a00000b 	bcs	f000c4c0 <memcap_unmap_range+0xcc>
f000c490:	e51b3008 	ldr	r3, [fp, #-8]
f000c494:	e5932020 	ldr	r2, [r3, #32]
f000c498:	e51b3014 	ldr	r3, [fp, #-20]
f000c49c:	e1520003 	cmp	r2, r3
f000c4a0:	8a000006 	bhi	f000c4c0 <memcap_unmap_range+0xcc>
f000c4a4:	e51b0008 	ldr	r0, [fp, #-8]
f000c4a8:	e51b100c 	ldr	r1, [fp, #-12]
f000c4ac:	e51b2010 	ldr	r2, [fp, #-16]
f000c4b0:	e51b3014 	ldr	r3, [fp, #-20]
f000c4b4:	ebffff92 	bl	f000c304 <memcap_shrink>
f000c4b8:	e1a03000 	mov	r3, r0
f000c4bc:	ea000014 	b	f000c514 <memcap_unmap_range+0x120>
f000c4c0:	e51b3008 	ldr	r3, [fp, #-8]
f000c4c4:	e593201c 	ldr	r2, [r3, #28]
f000c4c8:	e51b3010 	ldr	r3, [fp, #-16]
f000c4cc:	e1520003 	cmp	r2, r3
f000c4d0:	3a000009 	bcc	f000c4fc <memcap_unmap_range+0x108>
f000c4d4:	e51b3008 	ldr	r3, [fp, #-8]
f000c4d8:	e5932020 	ldr	r2, [r3, #32]
f000c4dc:	e51b3014 	ldr	r3, [fp, #-20]
f000c4e0:	e1520003 	cmp	r2, r3
f000c4e4:	8a000004 	bhi	f000c4fc <memcap_unmap_range+0x108>
f000c4e8:	e51b3008 	ldr	r3, [fp, #-8]
f000c4ec:	e1a00003 	mov	r0, r3
f000c4f0:	ebfffd89 	bl	f000bb1c <list_remove>
f000c4f4:	e3a03000 	mov	r3, #0
f000c4f8:	ea000005 	b	f000c514 <memcap_unmap_range+0x120>
f000c4fc:	e59f001c 	ldr	r0, [pc, #28]	; f000c520 <memcap_unmap_range+0x12c>
f000c500:	e59f101c 	ldr	r1, [pc, #28]	; f000c524 <memcap_unmap_range+0x130>
f000c504:	e59f201c 	ldr	r2, [pc, #28]	; f000c528 <memcap_unmap_range+0x134>
f000c508:	e3a030d2 	mov	r3, #210	; 0xd2
f000c50c:	eb002676 	bl	f0015eec <printk>
f000c510:	eafffffe 	b	f000c510 <memcap_unmap_range+0x11c>
f000c514:	e1a00003 	mov	r0, r3
f000c518:	e24bd004 	sub	sp, fp, #4
f000c51c:	e8bd8800 	pop	{fp, pc}
f000c520:	f001e574 	.word	0xf001e574
f000c524:	f001e59c 	.word	0xf001e59c
f000c528:	f001e760 	.word	0xf001e760

f000c52c <memcap_unmap>:
f000c52c:	e92d4800 	push	{fp, lr}
f000c530:	e28db004 	add	fp, sp, #4
f000c534:	e24dd040 	sub	sp, sp, #64	; 0x40
f000c538:	e50b0030 	str	r0, [fp, #-48]	; 0x30
f000c53c:	e50b1034 	str	r1, [fp, #-52]	; 0x34
f000c540:	e50b2038 	str	r2, [fp, #-56]	; 0x38
f000c544:	e50b303c 	str	r3, [fp, #-60]	; 0x3c
f000c548:	e51b3030 	ldr	r3, [fp, #-48]	; 0x30
f000c54c:	e3530000 	cmp	r3, #0
f000c550:	0a000023 	beq	f000c5e4 <memcap_unmap+0xb8>
f000c554:	e51b3030 	ldr	r3, [fp, #-48]	; 0x30
f000c558:	e5933004 	ldr	r3, [r3, #4]
f000c55c:	e50b3014 	str	r3, [fp, #-20]
f000c560:	e51b3014 	ldr	r3, [fp, #-20]
f000c564:	e50b3008 	str	r3, [fp, #-8]
f000c568:	e51b3008 	ldr	r3, [fp, #-8]
f000c56c:	e5933000 	ldr	r3, [r3]
f000c570:	e50b3018 	str	r3, [fp, #-24]
f000c574:	e51b3018 	ldr	r3, [fp, #-24]
f000c578:	e50b300c 	str	r3, [fp, #-12]
f000c57c:	ea000013 	b	f000c5d0 <memcap_unmap+0xa4>
f000c580:	e51b3008 	ldr	r3, [fp, #-8]
f000c584:	e593201c 	ldr	r2, [r3, #28]
f000c588:	e51b3008 	ldr	r3, [fp, #-8]
f000c58c:	e5933020 	ldr	r3, [r3, #32]
f000c590:	e51b0038 	ldr	r0, [fp, #-56]	; 0x38
f000c594:	e51b103c 	ldr	r1, [fp, #-60]	; 0x3c
f000c598:	ebfffdbc 	bl	f000bc90 <set_intersection>
f000c59c:	e1a03000 	mov	r3, r0
f000c5a0:	e3530000 	cmp	r3, #0
f000c5a4:	0a000002 	beq	f000c5b4 <memcap_unmap+0x88>
f000c5a8:	e3e03000 	mvn	r3, #0
f000c5ac:	e50b3010 	str	r3, [fp, #-16]
f000c5b0:	ea00003a 	b	f000c6a0 <memcap_unmap+0x174>
f000c5b4:	e51b300c 	ldr	r3, [fp, #-12]
f000c5b8:	e50b3008 	str	r3, [fp, #-8]
f000c5bc:	e51b300c 	ldr	r3, [fp, #-12]
f000c5c0:	e5933000 	ldr	r3, [r3]
f000c5c4:	e50b301c 	str	r3, [fp, #-28]
f000c5c8:	e51b301c 	ldr	r3, [fp, #-28]
f000c5cc:	e50b300c 	str	r3, [fp, #-12]
f000c5d0:	e51b2008 	ldr	r2, [fp, #-8]
f000c5d4:	e51b3030 	ldr	r3, [fp, #-48]	; 0x30
f000c5d8:	e2833004 	add	r3, r3, #4
f000c5dc:	e1520003 	cmp	r2, r3
f000c5e0:	1affffe6 	bne	f000c580 <memcap_unmap+0x54>
f000c5e4:	e51b3034 	ldr	r3, [fp, #-52]	; 0x34
f000c5e8:	e5933004 	ldr	r3, [r3, #4]
f000c5ec:	e50b3020 	str	r3, [fp, #-32]
f000c5f0:	e51b3020 	ldr	r3, [fp, #-32]
f000c5f4:	e50b3008 	str	r3, [fp, #-8]
f000c5f8:	e51b3008 	ldr	r3, [fp, #-8]
f000c5fc:	e5933000 	ldr	r3, [r3]
f000c600:	e50b3024 	str	r3, [fp, #-36]	; 0x24
f000c604:	e51b3024 	ldr	r3, [fp, #-36]	; 0x24
f000c608:	e50b300c 	str	r3, [fp, #-12]
f000c60c:	ea00001c 	b	f000c684 <memcap_unmap+0x158>
f000c610:	e51b3008 	ldr	r3, [fp, #-8]
f000c614:	e593201c 	ldr	r2, [r3, #28]
f000c618:	e51b3008 	ldr	r3, [fp, #-8]
f000c61c:	e5933020 	ldr	r3, [r3, #32]
f000c620:	e51b0038 	ldr	r0, [fp, #-56]	; 0x38
f000c624:	e51b103c 	ldr	r1, [fp, #-60]	; 0x3c
f000c628:	ebfffd98 	bl	f000bc90 <set_intersection>
f000c62c:	e1a03000 	mov	r3, r0
f000c630:	e3530000 	cmp	r3, #0
f000c634:	0a00000b 	beq	f000c668 <memcap_unmap+0x13c>
f000c638:	e51b0008 	ldr	r0, [fp, #-8]
f000c63c:	e51b1034 	ldr	r1, [fp, #-52]	; 0x34
f000c640:	e51b2038 	ldr	r2, [fp, #-56]	; 0x38
f000c644:	e51b303c 	ldr	r3, [fp, #-60]	; 0x3c
f000c648:	ebffff69 	bl	f000c3f4 <memcap_unmap_range>
f000c64c:	e50b0010 	str	r0, [fp, #-16]
f000c650:	e51b3010 	ldr	r3, [fp, #-16]
f000c654:	e3530000 	cmp	r3, #0
f000c658:	0a000000 	beq	f000c660 <memcap_unmap+0x134>
f000c65c:	ea00000f 	b	f000c6a0 <memcap_unmap+0x174>
f000c660:	e3a03000 	mov	r3, #0
f000c664:	ea000032 	b	f000c734 <memcap_unmap+0x208>
f000c668:	e51b300c 	ldr	r3, [fp, #-12]
f000c66c:	e50b3008 	str	r3, [fp, #-8]
f000c670:	e51b300c 	ldr	r3, [fp, #-12]
f000c674:	e5933000 	ldr	r3, [r3]
f000c678:	e50b3028 	str	r3, [fp, #-40]	; 0x28
f000c67c:	e51b3028 	ldr	r3, [fp, #-40]	; 0x28
f000c680:	e50b300c 	str	r3, [fp, #-12]
f000c684:	e51b2008 	ldr	r2, [fp, #-8]
f000c688:	e51b3034 	ldr	r3, [fp, #-52]	; 0x34
f000c68c:	e2833004 	add	r3, r3, #4
f000c690:	e1520003 	cmp	r2, r3
f000c694:	1affffdd 	bne	f000c610 <memcap_unmap+0xe4>
f000c698:	e3e03010 	mvn	r3, #16
f000c69c:	ea000024 	b	f000c734 <memcap_unmap+0x208>
f000c6a0:	e51b3010 	ldr	r3, [fp, #-16]
f000c6a4:	e373000c 	cmn	r3, #12
f000c6a8:	1a000003 	bne	f000c6bc <memcap_unmap+0x190>
f000c6ac:	e59f008c 	ldr	r0, [pc, #140]	; f000c740 <memcap_unmap+0x214>
f000c6b0:	e59f108c 	ldr	r1, [pc, #140]	; f000c744 <memcap_unmap+0x218>
f000c6b4:	eb00260c 	bl	f0015eec <printk>
f000c6b8:	ea000017 	b	f000c71c <memcap_unmap+0x1f0>
f000c6bc:	e51b3010 	ldr	r3, [fp, #-16]
f000c6c0:	e3730001 	cmn	r3, #1
f000c6c4:	1a000014 	bne	f000c71c <memcap_unmap+0x1f0>
f000c6c8:	e51b3008 	ldr	r3, [fp, #-8]
f000c6cc:	e5933014 	ldr	r3, [r3, #20]
f000c6d0:	e1a03803 	lsl	r3, r3, #16
f000c6d4:	e1a03823 	lsr	r3, r3, #16
f000c6d8:	e3530008 	cmp	r3, #8
f000c6dc:	1a000001 	bne	f000c6e8 <memcap_unmap+0x1bc>
f000c6e0:	e59f3060 	ldr	r3, [pc, #96]	; f000c748 <memcap_unmap+0x21c>
f000c6e4:	ea000000 	b	f000c6ec <memcap_unmap+0x1c0>
f000c6e8:	e59f305c 	ldr	r3, [pc, #92]	; f000c74c <memcap_unmap+0x220>
f000c6ec:	e51b2008 	ldr	r2, [fp, #-8]
f000c6f0:	e592201c 	ldr	r2, [r2, #28]
f000c6f4:	e1a0c602 	lsl	ip, r2, #12
f000c6f8:	e51b2008 	ldr	r2, [fp, #-8]
f000c6fc:	e5922020 	ldr	r2, [r2, #32]
f000c700:	e1a02602 	lsl	r2, r2, #12
f000c704:	e58d2000 	str	r2, [sp]
f000c708:	e59f0040 	ldr	r0, [pc, #64]	; f000c750 <memcap_unmap+0x224>
f000c70c:	e59f1030 	ldr	r1, [pc, #48]	; f000c744 <memcap_unmap+0x218>
f000c710:	e1a02003 	mov	r2, r3
f000c714:	e1a0300c 	mov	r3, ip
f000c718:	eb0025f3 	bl	f0015eec <printk>
f000c71c:	e59f0030 	ldr	r0, [pc, #48]	; f000c754 <memcap_unmap+0x228>
f000c720:	e59f1030 	ldr	r1, [pc, #48]	; f000c758 <memcap_unmap+0x22c>
f000c724:	e59f2030 	ldr	r2, [pc, #48]	; f000c75c <memcap_unmap+0x230>
f000c728:	e59f3030 	ldr	r3, [pc, #48]	; f000c760 <memcap_unmap+0x234>
f000c72c:	eb0025ee 	bl	f0015eec <printk>
f000c730:	eafffffe 	b	f000c730 <memcap_unmap+0x204>
f000c734:	e1a00003 	mov	r0, r3
f000c738:	e24bd004 	sub	sp, fp, #4
f000c73c:	e8bd8800 	pop	{fp, pc}
f000c740:	f001e5b4 	.word	0xf001e5b4
f000c744:	f001e5f0 	.word	0xf001e5f0
f000c748:	f001e5f8 	.word	0xf001e5f8
f000c74c:	f001e600 	.word	0xf001e600
f000c750:	f001e60c 	.word	0xf001e60c
f000c754:	f001e574 	.word	0xf001e574
f000c758:	f001e59c 	.word	0xf001e59c
f000c75c:	f001e774 	.word	0xf001e774
f000c760:	0000010f 	.word	0x0000010f

f000c764 <copy_cap_info>:
f000c764:	e92d4800 	push	{fp, lr}
f000c768:	e28db004 	add	fp, sp, #4
f000c76c:	e24dd020 	sub	sp, sp, #32
f000c770:	e50b0018 	str	r0, [fp, #-24]
f000c774:	e50b101c 	str	r1, [fp, #-28]
f000c778:	e50b2020 	str	r2, [fp, #-32]
f000c77c:	e3a03000 	mov	r3, #0
f000c780:	e50b3008 	str	r3, [fp, #-8]
f000c784:	ea000026 	b	f000c824 <copy_cap_info+0xc0>
f000c788:	e51b3008 	ldr	r3, [fp, #-8]
f000c78c:	e1a03283 	lsl	r3, r3, #5
f000c790:	e51b201c 	ldr	r2, [fp, #-28]
f000c794:	e0823003 	add	r3, r2, r3
f000c798:	e50b300c 	str	r3, [fp, #-12]
f000c79c:	e3a0002c 	mov	r0, #44	; 0x2c
f000c7a0:	e3a01000 	mov	r1, #0
f000c7a4:	ebfffc64 	bl	f000b93c <alloc_bootmem>
f000c7a8:	e50b0010 	str	r0, [fp, #-16]
f000c7ac:	e51b300c 	ldr	r3, [fp, #-12]
f000c7b0:	e5932000 	ldr	r2, [r3]
f000c7b4:	e51b3010 	ldr	r3, [fp, #-16]
f000c7b8:	e5832010 	str	r2, [r3, #16]
f000c7bc:	e51b300c 	ldr	r3, [fp, #-12]
f000c7c0:	e5932004 	ldr	r2, [r3, #4]
f000c7c4:	e51b3010 	ldr	r3, [fp, #-16]
f000c7c8:	e5832014 	str	r2, [r3, #20]
f000c7cc:	e51b300c 	ldr	r3, [fp, #-12]
f000c7d0:	e5932008 	ldr	r2, [r3, #8]
f000c7d4:	e51b3010 	ldr	r3, [fp, #-16]
f000c7d8:	e5832018 	str	r2, [r3, #24]
f000c7dc:	e51b300c 	ldr	r3, [fp, #-12]
f000c7e0:	e593200c 	ldr	r2, [r3, #12]
f000c7e4:	e51b3010 	ldr	r3, [fp, #-16]
f000c7e8:	e583201c 	str	r2, [r3, #28]
f000c7ec:	e51b300c 	ldr	r3, [fp, #-12]
f000c7f0:	e5932010 	ldr	r2, [r3, #16]
f000c7f4:	e51b3010 	ldr	r3, [fp, #-16]
f000c7f8:	e5832020 	str	r2, [r3, #32]
f000c7fc:	e51b300c 	ldr	r3, [fp, #-12]
f000c800:	e5932014 	ldr	r2, [r3, #20]
f000c804:	e51b3010 	ldr	r3, [fp, #-16]
f000c808:	e5832024 	str	r2, [r3, #36]	; 0x24
f000c80c:	e51b0010 	ldr	r0, [fp, #-16]
f000c810:	e51b1018 	ldr	r1, [fp, #-24]
f000c814:	ebfffce7 	bl	f000bbb8 <cap_list_insert>
f000c818:	e51b3008 	ldr	r3, [fp, #-8]
f000c81c:	e2833001 	add	r3, r3, #1
f000c820:	e50b3008 	str	r3, [fp, #-8]
f000c824:	e51b2008 	ldr	r2, [fp, #-8]
f000c828:	e51b3020 	ldr	r3, [fp, #-32]
f000c82c:	e1520003 	cmp	r2, r3
f000c830:	baffffd4 	blt	f000c788 <copy_cap_info+0x24>
f000c834:	e24bd004 	sub	sp, fp, #4
f000c838:	e8bd8800 	pop	{fp, pc}

f000c83c <copy_pager_info>:
f000c83c:	e92d4800 	push	{fp, lr}
f000c840:	e28db004 	add	fp, sp, #4
f000c844:	e24dd008 	sub	sp, sp, #8
f000c848:	e50b0008 	str	r0, [fp, #-8]
f000c84c:	e50b100c 	str	r1, [fp, #-12]
f000c850:	e51b300c 	ldr	r3, [fp, #-12]
f000c854:	e593200c 	ldr	r2, [r3, #12]
f000c858:	e51b3008 	ldr	r3, [fp, #-8]
f000c85c:	e583200c 	str	r2, [r3, #12]
f000c860:	e51b300c 	ldr	r3, [fp, #-12]
f000c864:	e5933000 	ldr	r3, [r3]
f000c868:	e1a02603 	lsl	r2, r3, #12
f000c86c:	e51b3008 	ldr	r3, [fp, #-8]
f000c870:	e5832004 	str	r2, [r3, #4]
f000c874:	e51b300c 	ldr	r3, [fp, #-12]
f000c878:	e5933004 	ldr	r3, [r3, #4]
f000c87c:	e1a02603 	lsl	r2, r3, #12
f000c880:	e51b3008 	ldr	r3, [fp, #-8]
f000c884:	e5832008 	str	r2, [r3, #8]
f000c888:	e51b300c 	ldr	r3, [fp, #-12]
f000c88c:	e5933008 	ldr	r3, [r3, #8]
f000c890:	e1a02603 	lsl	r2, r3, #12
f000c894:	e51b3008 	ldr	r3, [fp, #-8]
f000c898:	e5832014 	str	r2, [r3, #20]
f000c89c:	e51b300c 	ldr	r3, [fp, #-12]
f000c8a0:	e5932014 	ldr	r2, [r3, #20]
f000c8a4:	e51b3008 	ldr	r3, [fp, #-8]
f000c8a8:	e5832024 	str	r2, [r3, #36]	; 0x24
f000c8ac:	e51b300c 	ldr	r3, [fp, #-12]
f000c8b0:	e5932018 	ldr	r2, [r3, #24]
f000c8b4:	e51b3008 	ldr	r3, [fp, #-8]
f000c8b8:	e5832028 	str	r2, [r3, #40]	; 0x28
f000c8bc:	e51b300c 	ldr	r3, [fp, #-12]
f000c8c0:	e593201c 	ldr	r2, [r3, #28]
f000c8c4:	e51b3008 	ldr	r3, [fp, #-8]
f000c8c8:	e583202c 	str	r2, [r3, #44]	; 0x2c
f000c8cc:	e51b300c 	ldr	r3, [fp, #-12]
f000c8d0:	e5932020 	ldr	r2, [r3, #32]
f000c8d4:	e51b3008 	ldr	r3, [fp, #-8]
f000c8d8:	e5832030 	str	r2, [r3, #48]	; 0x30
f000c8dc:	e51b3008 	ldr	r3, [fp, #-8]
f000c8e0:	e2831018 	add	r1, r3, #24
f000c8e4:	e51b300c 	ldr	r3, [fp, #-12]
f000c8e8:	e2832028 	add	r2, r3, #40	; 0x28
f000c8ec:	e51b300c 	ldr	r3, [fp, #-12]
f000c8f0:	e5933024 	ldr	r3, [r3, #36]	; 0x24
f000c8f4:	e1a00001 	mov	r0, r1
f000c8f8:	e1a01002 	mov	r1, r2
f000c8fc:	e1a02003 	mov	r2, r3
f000c900:	ebffff97 	bl	f000c764 <copy_cap_info>
f000c904:	e3a03000 	mov	r3, #0
f000c908:	e1a00003 	mov	r0, r3
f000c90c:	e24bd004 	sub	sp, fp, #4
f000c910:	e8bd8800 	pop	{fp, pc}

f000c914 <copy_container_info>:
f000c914:	e92d4800 	push	{fp, lr}
f000c918:	e28db004 	add	fp, sp, #4
f000c91c:	e24dd010 	sub	sp, sp, #16
f000c920:	e50b0010 	str	r0, [fp, #-16]
f000c924:	e50b1014 	str	r1, [fp, #-20]
f000c928:	e51b3010 	ldr	r3, [fp, #-16]
f000c92c:	e2832020 	add	r2, r3, #32
f000c930:	e51b3014 	ldr	r3, [fp, #-20]
f000c934:	e1a00002 	mov	r0, r2
f000c938:	e1a01003 	mov	r1, r3
f000c93c:	e3a02040 	mov	r2, #64	; 0x40
f000c940:	eb0025d5 	bl	f001609c <strncpy>
f000c944:	e51b3014 	ldr	r3, [fp, #-20]
f000c948:	e5932040 	ldr	r2, [r3, #64]	; 0x40
f000c94c:	e51b3010 	ldr	r3, [fp, #-16]
f000c950:	e5832004 	str	r2, [r3, #4]
f000c954:	e51b3010 	ldr	r3, [fp, #-16]
f000c958:	e28310a0 	add	r1, r3, #160	; 0xa0
f000c95c:	e51b3014 	ldr	r3, [fp, #-20]
f000c960:	e2832048 	add	r2, r3, #72	; 0x48
f000c964:	e51b3014 	ldr	r3, [fp, #-20]
f000c968:	e5933044 	ldr	r3, [r3, #68]	; 0x44
f000c96c:	e1a00001 	mov	r0, r1
f000c970:	e1a01002 	mov	r1, r2
f000c974:	e1a02003 	mov	r2, r3
f000c978:	ebffff79 	bl	f000c764 <copy_cap_info>
f000c97c:	e3a03000 	mov	r3, #0
f000c980:	e50b3008 	str	r3, [fp, #-8]
f000c984:	ea000019 	b	f000c9f0 <copy_container_info+0xdc>
f000c988:	e51b3010 	ldr	r3, [fp, #-16]
f000c98c:	e59310ac 	ldr	r1, [r3, #172]	; 0xac
f000c990:	e51b2008 	ldr	r2, [fp, #-8]
f000c994:	e1a03002 	mov	r3, r2
f000c998:	e1a03083 	lsl	r3, r3, #1
f000c99c:	e0833002 	add	r3, r3, r2
f000c9a0:	e1a03103 	lsl	r3, r3, #2
f000c9a4:	e0833002 	add	r3, r3, r2
f000c9a8:	e1a03103 	lsl	r3, r3, #2
f000c9ac:	e0811003 	add	r1, r1, r3
f000c9b0:	e51b2008 	ldr	r2, [fp, #-8]
f000c9b4:	e1a03002 	mov	r3, r2
f000c9b8:	e1a03103 	lsl	r3, r3, #2
f000c9bc:	e0833002 	add	r3, r3, r2
f000c9c0:	e1a02203 	lsl	r2, r3, #4
f000c9c4:	e0833002 	add	r3, r3, r2
f000c9c8:	e1a03183 	lsl	r3, r3, #3
f000c9cc:	e28330e8 	add	r3, r3, #232	; 0xe8
f000c9d0:	e51b2014 	ldr	r2, [fp, #-20]
f000c9d4:	e0823003 	add	r3, r2, r3
f000c9d8:	e1a00001 	mov	r0, r1
f000c9dc:	e1a01003 	mov	r1, r3
f000c9e0:	ebffff95 	bl	f000c83c <copy_pager_info>
f000c9e4:	e51b3008 	ldr	r3, [fp, #-8]
f000c9e8:	e2833001 	add	r3, r3, #1
f000c9ec:	e50b3008 	str	r3, [fp, #-8]
f000c9f0:	e51b3010 	ldr	r3, [fp, #-16]
f000c9f4:	e5932004 	ldr	r2, [r3, #4]
f000c9f8:	e51b3008 	ldr	r3, [fp, #-8]
f000c9fc:	e1520003 	cmp	r2, r3
f000ca00:	caffffe0 	bgt	f000c988 <copy_container_info+0x74>
f000ca04:	e3a03000 	mov	r3, #0
f000ca08:	e1a00003 	mov	r0, r3
f000ca0c:	e24bd004 	sub	sp, fp, #4
f000ca10:	e8bd8800 	pop	{fp, pc}

f000ca14 <init_resource_cache>:
f000ca14:	e92d4830 	push	{r4, r5, fp, lr}
f000ca18:	e28db00c 	add	fp, sp, #12
f000ca1c:	e24dd030 	sub	sp, sp, #48	; 0x30
f000ca20:	e50b0028 	str	r0, [fp, #-40]	; 0x28
f000ca24:	e50b102c 	str	r1, [fp, #-44]	; 0x2c
f000ca28:	e50b2030 	str	r2, [fp, #-48]	; 0x30
f000ca2c:	e50b3034 	str	r3, [fp, #-52]	; 0x34
f000ca30:	e51b2030 	ldr	r2, [fp, #-48]	; 0x30
f000ca34:	e59f31a4 	ldr	r3, [pc, #420]	; f000cbe0 <init_resource_cache+0x1cc>
f000ca38:	e7923003 	ldr	r3, [r2, r3]
f000ca3c:	e50b3014 	str	r3, [fp, #-20]
f000ca40:	e51b3014 	ldr	r3, [fp, #-20]
f000ca44:	e50b3010 	str	r3, [fp, #-16]
f000ca48:	ea00005a 	b	f000cbb8 <init_resource_cache+0x1a4>
f000ca4c:	e51b3010 	ldr	r3, [fp, #-16]
f000ca50:	e593301c 	ldr	r3, [r3, #28]
f000ca54:	e1a03603 	lsl	r3, r3, #12
f000ca58:	e1a00003 	mov	r0, r3
f000ca5c:	e51b102c 	ldr	r1, [fp, #-44]	; 0x2c
f000ca60:	e51b2028 	ldr	r2, [fp, #-40]	; 0x28
f000ca64:	e51b3034 	ldr	r3, [fp, #-52]	; 0x34
f000ca68:	eb002b46 	bl	f0017788 <mem_cache_bufsize>
f000ca6c:	e1a03000 	mov	r3, r0
f000ca70:	e50b3018 	str	r3, [fp, #-24]
f000ca74:	e51b3010 	ldr	r3, [fp, #-16]
f000ca78:	e5932020 	ldr	r2, [r3, #32]
f000ca7c:	e51b3010 	ldr	r3, [fp, #-16]
f000ca80:	e593301c 	ldr	r3, [r3, #28]
f000ca84:	e0633002 	rsb	r3, r3, r2
f000ca88:	e1a02603 	lsl	r2, r3, #12
f000ca8c:	e51b3018 	ldr	r3, [fp, #-24]
f000ca90:	e1520003 	cmp	r2, r3
f000ca94:	3a000042 	bcc	f000cba4 <init_resource_cache+0x190>
f000ca98:	e51b3010 	ldr	r3, [fp, #-16]
f000ca9c:	e593301c 	ldr	r3, [r3, #28]
f000caa0:	e1a03603 	lsl	r3, r3, #12
f000caa4:	e283320f 	add	r3, r3, #-268435456	; 0xf0000000
f000caa8:	e50b301c 	str	r3, [fp, #-28]
f000caac:	e51b2030 	ldr	r2, [fp, #-48]	; 0x30
f000cab0:	e59f312c 	ldr	r3, [pc, #300]	; f000cbe4 <init_resource_cache+0x1d0>
f000cab4:	e7923003 	ldr	r3, [r2, r3]
f000cab8:	e3530000 	cmp	r3, #0
f000cabc:	1a00000d 	bne	f000caf8 <init_resource_cache+0xe4>
f000cac0:	e51b3010 	ldr	r3, [fp, #-16]
f000cac4:	e593301c 	ldr	r3, [r3, #28]
f000cac8:	e1a02603 	lsl	r2, r3, #12
f000cacc:	e51b3018 	ldr	r3, [fp, #-24]
f000cad0:	e2833eff 	add	r3, r3, #4080	; 0xff0
f000cad4:	e283300f 	add	r3, r3, #15
f000cad8:	e3c33eff 	bic	r3, r3, #4080	; 0xff0
f000cadc:	e3c3300f 	bic	r3, r3, #15
f000cae0:	e1a00002 	mov	r0, r2
f000cae4:	e51b101c 	ldr	r1, [fp, #-28]
f000cae8:	e1a02003 	mov	r2, r3
f000caec:	e3a03003 	mov	r3, #3
f000caf0:	eb00199b 	bl	f0013164 <add_boot_mapping>
f000caf4:	ea000010 	b	f000cb3c <init_resource_cache+0x128>
f000caf8:	e51b3010 	ldr	r3, [fp, #-16]
f000cafc:	e593301c 	ldr	r3, [r3, #28]
f000cb00:	e1a05603 	lsl	r5, r3, #12
f000cb04:	e51b3018 	ldr	r3, [fp, #-24]
f000cb08:	e2833eff 	add	r3, r3, #4080	; 0xff0
f000cb0c:	e283300f 	add	r3, r3, #15
f000cb10:	e3c34eff 	bic	r4, r3, #4080	; 0xff0
f000cb14:	e3c4400f 	bic	r4, r4, #15
f000cb18:	ebfffc53 	bl	f000bc6c <current_task>
f000cb1c:	e1a03000 	mov	r3, r0
f000cb20:	e59330b4 	ldr	r3, [r3, #180]	; 0xb4
f000cb24:	e58d3000 	str	r3, [sp]
f000cb28:	e1a00005 	mov	r0, r5
f000cb2c:	e51b101c 	ldr	r1, [fp, #-28]
f000cb30:	e1a02004 	mov	r2, r4
f000cb34:	e3a03003 	mov	r3, #3
f000cb38:	eb001916 	bl	f0012f98 <add_mapping_space>
f000cb3c:	e51b3030 	ldr	r3, [fp, #-48]	; 0x30
f000cb40:	e2833a06 	add	r3, r3, #24576	; 0x6000
f000cb44:	e2833038 	add	r3, r3, #56	; 0x38
f000cb48:	e51b2010 	ldr	r2, [fp, #-16]
f000cb4c:	e592e01c 	ldr	lr, [r2, #28]
f000cb50:	e51b2010 	ldr	r2, [fp, #-16]
f000cb54:	e592101c 	ldr	r1, [r2, #28]
f000cb58:	e51b2018 	ldr	r2, [fp, #-24]
f000cb5c:	e2822eff 	add	r2, r2, #4080	; 0xff0
f000cb60:	e282200f 	add	r2, r2, #15
f000cb64:	e1a02622 	lsr	r2, r2, #12
f000cb68:	e081c002 	add	ip, r1, r2
f000cb6c:	e51b0010 	ldr	r0, [fp, #-16]
f000cb70:	e1a01003 	mov	r1, r3
f000cb74:	e1a0200e 	mov	r2, lr
f000cb78:	e1a0300c 	mov	r3, ip
f000cb7c:	ebfffe1c 	bl	f000c3f4 <memcap_unmap_range>
f000cb80:	e51b101c 	ldr	r1, [fp, #-28]
f000cb84:	e51b2018 	ldr	r2, [fp, #-24]
f000cb88:	e51b3034 	ldr	r3, [fp, #-52]	; 0x34
f000cb8c:	e1a00001 	mov	r0, r1
f000cb90:	e1a01002 	mov	r1, r2
f000cb94:	e51b202c 	ldr	r2, [fp, #-44]	; 0x2c
f000cb98:	eb002b32 	bl	f0017868 <mem_cache_init>
f000cb9c:	e1a03000 	mov	r3, r0
f000cba0:	ea00000b 	b	f000cbd4 <init_resource_cache+0x1c0>
f000cba4:	e51b3010 	ldr	r3, [fp, #-16]
f000cba8:	e5933000 	ldr	r3, [r3]
f000cbac:	e50b3020 	str	r3, [fp, #-32]
f000cbb0:	e51b3020 	ldr	r3, [fp, #-32]
f000cbb4:	e50b3010 	str	r3, [fp, #-16]
f000cbb8:	e51b2010 	ldr	r2, [fp, #-16]
f000cbbc:	e51b3030 	ldr	r3, [fp, #-48]	; 0x30
f000cbc0:	e2833a06 	add	r3, r3, #24576	; 0x6000
f000cbc4:	e283303c 	add	r3, r3, #60	; 0x3c
f000cbc8:	e1520003 	cmp	r2, r3
f000cbcc:	1affff9e 	bne	f000ca4c <init_resource_cache+0x38>
f000cbd0:	e3a03000 	mov	r3, #0
f000cbd4:	e1a00003 	mov	r0, r3
f000cbd8:	e24bd00c 	sub	sp, fp, #12
f000cbdc:	e8bd8830 	pop	{r4, r5, fp, pc}
f000cbe0:	0000603c 	.word	0x0000603c
f000cbe4:	00006078 	.word	0x00006078

f000cbe8 <init_resource_allocators>:
f000cbe8:	e92d4800 	push	{fp, lr}
f000cbec:	e28db004 	add	fp, sp, #4
f000cbf0:	e24dd008 	sub	sp, sp, #8
f000cbf4:	e50b0008 	str	r0, [fp, #-8]
f000cbf8:	e50b100c 	str	r1, [fp, #-12]
f000cbfc:	e51b3008 	ldr	r3, [fp, #-8]
f000cc00:	e593300c 	ldr	r3, [r3, #12]
f000cc04:	e1a00003 	mov	r0, r3
f000cc08:	e3a01901 	mov	r1, #16384	; 0x4000
f000cc0c:	e51b200c 	ldr	r2, [fp, #-12]
f000cc10:	e3a03001 	mov	r3, #1
f000cc14:	ebffff7e 	bl	f000ca14 <init_resource_cache>
f000cc18:	e1a01000 	mov	r1, r0
f000cc1c:	e51b200c 	ldr	r2, [fp, #-12]
f000cc20:	e59f30b8 	ldr	r3, [pc, #184]	; f000cce0 <init_resource_allocators+0xf8>
f000cc24:	e7821003 	str	r1, [r2, r3]
f000cc28:	e51b3008 	ldr	r3, [fp, #-8]
f000cc2c:	e593300c 	ldr	r3, [r3, #12]
f000cc30:	e1a00003 	mov	r0, r3
f000cc34:	e3a01024 	mov	r1, #36	; 0x24
f000cc38:	e51b200c 	ldr	r2, [fp, #-12]
f000cc3c:	e3a03000 	mov	r3, #0
f000cc40:	ebffff73 	bl	f000ca14 <init_resource_cache>
f000cc44:	e1a01000 	mov	r1, r0
f000cc48:	e51b200c 	ldr	r2, [fp, #-12]
f000cc4c:	e59f3090 	ldr	r3, [pc, #144]	; f000cce4 <init_resource_allocators+0xfc>
f000cc50:	e7821003 	str	r1, [r2, r3]
f000cc54:	e51b3008 	ldr	r3, [fp, #-8]
f000cc58:	e5933008 	ldr	r3, [r3, #8]
f000cc5c:	e1a00003 	mov	r0, r3
f000cc60:	e3a01a01 	mov	r1, #4096	; 0x1000
f000cc64:	e51b200c 	ldr	r2, [fp, #-12]
f000cc68:	e3a03001 	mov	r3, #1
f000cc6c:	ebffff68 	bl	f000ca14 <init_resource_cache>
f000cc70:	e1a01000 	mov	r1, r0
f000cc74:	e51b200c 	ldr	r2, [fp, #-12]
f000cc78:	e59f3068 	ldr	r3, [pc, #104]	; f000cce8 <init_resource_allocators+0x100>
f000cc7c:	e7821003 	str	r1, [r2, r3]
f000cc80:	e51b3008 	ldr	r3, [fp, #-8]
f000cc84:	e5933014 	ldr	r3, [r3, #20]
f000cc88:	e1a00003 	mov	r0, r3
f000cc8c:	e3a01030 	mov	r1, #48	; 0x30
f000cc90:	e51b200c 	ldr	r2, [fp, #-12]
f000cc94:	e3a03000 	mov	r3, #0
f000cc98:	ebffff5d 	bl	f000ca14 <init_resource_cache>
f000cc9c:	e1a01000 	mov	r1, r0
f000cca0:	e51b200c 	ldr	r2, [fp, #-12]
f000cca4:	e59f3040 	ldr	r3, [pc, #64]	; f000ccec <init_resource_allocators+0x104>
f000cca8:	e7821003 	str	r1, [r2, r3]
f000ccac:	e51b3008 	ldr	r3, [fp, #-8]
f000ccb0:	e5933010 	ldr	r3, [r3, #16]
f000ccb4:	e1a00003 	mov	r0, r3
f000ccb8:	e3a01b01 	mov	r1, #1024	; 0x400
f000ccbc:	e51b200c 	ldr	r2, [fp, #-12]
f000ccc0:	e3a03001 	mov	r3, #1
f000ccc4:	ebffff52 	bl	f000ca14 <init_resource_cache>
f000ccc8:	e1a01000 	mov	r1, r0
f000cccc:	e51b200c 	ldr	r2, [fp, #-12]
f000ccd0:	e59f3018 	ldr	r3, [pc, #24]	; f000ccf0 <init_resource_allocators+0x108>
f000ccd4:	e7821003 	str	r1, [r2, r3]
f000ccd8:	e24bd004 	sub	sp, fp, #4
f000ccdc:	e8bd8800 	pop	{fp, pc}
f000cce0:	00006074 	.word	0x00006074
f000cce4:	00006080 	.word	0x00006080
f000cce8:	0000607c 	.word	0x0000607c
f000ccec:	00006084 	.word	0x00006084
f000ccf0:	00006078 	.word	0x00006078

f000ccf4 <process_cap_info>:
f000ccf4:	e92d4800 	push	{fp, lr}
f000ccf8:	e28db004 	add	fp, sp, #4
f000ccfc:	e24dd018 	sub	sp, sp, #24
f000cd00:	e50b0010 	str	r0, [fp, #-16]
f000cd04:	e50b1014 	str	r1, [fp, #-20]
f000cd08:	e50b2018 	str	r2, [fp, #-24]
f000cd0c:	e3a03000 	mov	r3, #0
f000cd10:	e50b3008 	str	r3, [fp, #-8]
f000cd14:	e51b3010 	ldr	r3, [fp, #-16]
f000cd18:	e5933004 	ldr	r3, [r3, #4]
f000cd1c:	e1a03823 	lsr	r3, r3, #16
f000cd20:	e1a03803 	lsl	r3, r3, #16
f000cd24:	e3530602 	cmp	r3, #2097152	; 0x200000
f000cd28:	0a000013 	beq	f000cd7c <process_cap_info+0x88>
f000cd2c:	e3530602 	cmp	r3, #2097152	; 0x200000
f000cd30:	8a000002 	bhi	f000cd40 <process_cap_info+0x4c>
f000cd34:	e3530601 	cmp	r3, #1048576	; 0x100000
f000cd38:	0a000005 	beq	f000cd54 <process_cap_info+0x60>
f000cd3c:	ea00002c 	b	f000cdf4 <process_cap_info+0x100>
f000cd40:	e3530501 	cmp	r3, #4194304	; 0x400000
f000cd44:	0a000016 	beq	f000cda4 <process_cap_info+0xb0>
f000cd48:	e3530502 	cmp	r3, #8388608	; 0x800000
f000cd4c:	0a00001e 	beq	f000cdcc <process_cap_info+0xd8>
f000cd50:	ea000027 	b	f000cdf4 <process_cap_info+0x100>
f000cd54:	e51b3014 	ldr	r3, [fp, #-20]
f000cd58:	e5933008 	ldr	r3, [r3, #8]
f000cd5c:	e1a02003 	mov	r2, r3
f000cd60:	e51b3010 	ldr	r3, [fp, #-16]
f000cd64:	e5933014 	ldr	r3, [r3, #20]
f000cd68:	e0823003 	add	r3, r2, r3
f000cd6c:	e1a02003 	mov	r2, r3
f000cd70:	e51b3014 	ldr	r3, [fp, #-20]
f000cd74:	e5832008 	str	r2, [r3, #8]
f000cd78:	ea00001d 	b	f000cdf4 <process_cap_info+0x100>
f000cd7c:	e51b3014 	ldr	r3, [fp, #-20]
f000cd80:	e593300c 	ldr	r3, [r3, #12]
f000cd84:	e1a02003 	mov	r2, r3
f000cd88:	e51b3010 	ldr	r3, [fp, #-16]
f000cd8c:	e5933014 	ldr	r3, [r3, #20]
f000cd90:	e0823003 	add	r3, r2, r3
f000cd94:	e1a02003 	mov	r2, r3
f000cd98:	e51b3014 	ldr	r3, [fp, #-20]
f000cd9c:	e583200c 	str	r2, [r3, #12]
f000cda0:	ea000013 	b	f000cdf4 <process_cap_info+0x100>
f000cda4:	e51b3014 	ldr	r3, [fp, #-20]
f000cda8:	e5933014 	ldr	r3, [r3, #20]
f000cdac:	e1a02003 	mov	r2, r3
f000cdb0:	e51b3010 	ldr	r3, [fp, #-16]
f000cdb4:	e5933014 	ldr	r3, [r3, #20]
f000cdb8:	e0823003 	add	r3, r2, r3
f000cdbc:	e1a02003 	mov	r2, r3
f000cdc0:	e51b3014 	ldr	r3, [fp, #-20]
f000cdc4:	e5832014 	str	r2, [r3, #20]
f000cdc8:	ea000009 	b	f000cdf4 <process_cap_info+0x100>
f000cdcc:	e51b3014 	ldr	r3, [fp, #-20]
f000cdd0:	e5933010 	ldr	r3, [r3, #16]
f000cdd4:	e1a02003 	mov	r2, r3
f000cdd8:	e51b3010 	ldr	r3, [fp, #-16]
f000cddc:	e5933014 	ldr	r3, [r3, #20]
f000cde0:	e0823003 	add	r3, r2, r3
f000cde4:	e1a02003 	mov	r2, r3
f000cde8:	e51b3014 	ldr	r3, [fp, #-20]
f000cdec:	e5832010 	str	r2, [r3, #16]
f000cdf0:	e1a00000 	nop			; (mov r0, r0)
f000cdf4:	e51b3010 	ldr	r3, [fp, #-16]
f000cdf8:	e5933004 	ldr	r3, [r3, #4]
f000cdfc:	e1a03803 	lsl	r3, r3, #16
f000ce00:	e1a03823 	lsr	r3, r3, #16
f000ce04:	e3530008 	cmp	r3, #8
f000ce08:	1a00000f 	bne	f000ce4c <process_cap_info+0x158>
f000ce0c:	e51b3018 	ldr	r3, [fp, #-24]
f000ce10:	e2832a06 	add	r2, r3, #24576	; 0x6000
f000ce14:	e2822044 	add	r2, r2, #68	; 0x44
f000ce18:	e51b3018 	ldr	r3, [fp, #-24]
f000ce1c:	e2833a06 	add	r3, r3, #24576	; 0x6000
f000ce20:	e2833050 	add	r3, r3, #80	; 0x50
f000ce24:	e51b1010 	ldr	r1, [fp, #-16]
f000ce28:	e591e00c 	ldr	lr, [r1, #12]
f000ce2c:	e51b1010 	ldr	r1, [fp, #-16]
f000ce30:	e591c010 	ldr	ip, [r1, #16]
f000ce34:	e1a00002 	mov	r0, r2
f000ce38:	e1a01003 	mov	r1, r3
f000ce3c:	e1a0200e 	mov	r2, lr
f000ce40:	e1a0300c 	mov	r3, ip
f000ce44:	ebfffdb8 	bl	f000c52c <memcap_unmap>
f000ce48:	ea00003a 	b	f000cf38 <process_cap_info+0x244>
f000ce4c:	e51b3010 	ldr	r3, [fp, #-16]
f000ce50:	e5933004 	ldr	r3, [r3, #4]
f000ce54:	e1a03803 	lsl	r3, r3, #16
f000ce58:	e1a03823 	lsr	r3, r3, #16
f000ce5c:	e3530004 	cmp	r3, #4
f000ce60:	1a000034 	bne	f000cf38 <process_cap_info+0x244>
f000ce64:	e51b3018 	ldr	r3, [fp, #-24]
f000ce68:	e2832a06 	add	r2, r3, #24576	; 0x6000
f000ce6c:	e282202c 	add	r2, r2, #44	; 0x2c
f000ce70:	e51b3018 	ldr	r3, [fp, #-24]
f000ce74:	e2833a06 	add	r3, r3, #24576	; 0x6000
f000ce78:	e2833038 	add	r3, r3, #56	; 0x38
f000ce7c:	e51b1010 	ldr	r1, [fp, #-16]
f000ce80:	e591e00c 	ldr	lr, [r1, #12]
f000ce84:	e51b1010 	ldr	r1, [fp, #-16]
f000ce88:	e591c010 	ldr	ip, [r1, #16]
f000ce8c:	e1a00002 	mov	r0, r2
f000ce90:	e1a01003 	mov	r1, r3
f000ce94:	e1a0200e 	mov	r2, lr
f000ce98:	e1a0300c 	mov	r3, ip
f000ce9c:	ebfffda2 	bl	f000c52c <memcap_unmap>
f000cea0:	e50b0008 	str	r0, [fp, #-8]
f000cea4:	e51b3008 	ldr	r3, [fp, #-8]
f000cea8:	e3730011 	cmn	r3, #17
f000ceac:	1a000021 	bne	f000cf38 <process_cap_info+0x244>
f000ceb0:	e51b3018 	ldr	r3, [fp, #-24]
f000ceb4:	e2832a06 	add	r2, r3, #24576	; 0x6000
f000ceb8:	e282205c 	add	r2, r2, #92	; 0x5c
f000cebc:	e51b3018 	ldr	r3, [fp, #-24]
f000cec0:	e2833a06 	add	r3, r3, #24576	; 0x6000
f000cec4:	e2833068 	add	r3, r3, #104	; 0x68
f000cec8:	e51b1010 	ldr	r1, [fp, #-16]
f000cecc:	e591e00c 	ldr	lr, [r1, #12]
f000ced0:	e51b1010 	ldr	r1, [fp, #-16]
f000ced4:	e591c010 	ldr	ip, [r1, #16]
f000ced8:	e1a00002 	mov	r0, r2
f000cedc:	e1a01003 	mov	r1, r3
f000cee0:	e1a0200e 	mov	r2, lr
f000cee4:	e1a0300c 	mov	r3, ip
f000cee8:	ebfffd8f 	bl	f000c52c <memcap_unmap>
f000ceec:	e50b0008 	str	r0, [fp, #-8]
f000cef0:	e51b3008 	ldr	r3, [fp, #-8]
f000cef4:	e3730011 	cmn	r3, #17
f000cef8:	1a00000e 	bne	f000cf38 <process_cap_info+0x244>
f000cefc:	e51b3010 	ldr	r3, [fp, #-16]
f000cf00:	e593300c 	ldr	r3, [r3, #12]
f000cf04:	e1a02603 	lsl	r2, r3, #12
f000cf08:	e51b3010 	ldr	r3, [fp, #-16]
f000cf0c:	e5933010 	ldr	r3, [r3, #16]
f000cf10:	e1a03603 	lsl	r3, r3, #12
f000cf14:	e59f002c 	ldr	r0, [pc, #44]	; f000cf48 <process_cap_info+0x254>
f000cf18:	e59f102c 	ldr	r1, [pc, #44]	; f000cf4c <process_cap_info+0x258>
f000cf1c:	eb0023f2 	bl	f0015eec <printk>
f000cf20:	e59f0028 	ldr	r0, [pc, #40]	; f000cf50 <process_cap_info+0x25c>
f000cf24:	e59f1028 	ldr	r1, [pc, #40]	; f000cf54 <process_cap_info+0x260>
f000cf28:	e59f2028 	ldr	r2, [pc, #40]	; f000cf58 <process_cap_info+0x264>
f000cf2c:	e59f3028 	ldr	r3, [pc, #40]	; f000cf5c <process_cap_info+0x268>
f000cf30:	eb0023ed 	bl	f0015eec <printk>
f000cf34:	eafffffe 	b	f000cf34 <process_cap_info+0x240>
f000cf38:	e51b3008 	ldr	r3, [fp, #-8]
f000cf3c:	e1a00003 	mov	r0, r3
f000cf40:	e24bd004 	sub	sp, fp, #4
f000cf44:	e8bd8800 	pop	{fp, pc}
f000cf48:	f001e670 	.word	0xf001e670
f000cf4c:	f001e5f0 	.word	0xf001e5f0
f000cf50:	f001e574 	.word	0xf001e574
f000cf54:	f001e59c 	.word	0xf001e59c
f000cf58:	f001e784 	.word	0xf001e784
f000cf5c:	000001e1 	.word	0x000001e1

f000cf60 <kernel_setup_physmem>:
f000cf60:	e92d4800 	push	{fp, lr}
f000cf64:	e28db004 	add	fp, sp, #4
f000cf68:	e24dd010 	sub	sp, sp, #16
f000cf6c:	e50b0010 	str	r0, [fp, #-16]
f000cf70:	e50b1014 	str	r1, [fp, #-20]
f000cf74:	e3a03000 	mov	r3, #0
f000cf78:	e50b3008 	str	r3, [fp, #-8]
f000cf7c:	ea00004f 	b	f000d0c0 <kernel_setup_physmem+0x160>
f000cf80:	e3a0002c 	mov	r0, #44	; 0x2c
f000cf84:	e3a01000 	mov	r1, #0
f000cf88:	ebfffa6b 	bl	f000b93c <alloc_bootmem>
f000cf8c:	e50b000c 	str	r0, [fp, #-12]
f000cf90:	e51b0014 	ldr	r0, [fp, #-20]
f000cf94:	e51b2008 	ldr	r2, [fp, #-8]
f000cf98:	e3a01004 	mov	r1, #4
f000cf9c:	e1a03002 	mov	r3, r2
f000cfa0:	e1a03083 	lsl	r3, r3, #1
f000cfa4:	e0833002 	add	r3, r3, r2
f000cfa8:	e1a03103 	lsl	r3, r3, #2
f000cfac:	e0803003 	add	r3, r0, r3
f000cfb0:	e0833001 	add	r3, r3, r1
f000cfb4:	e5933000 	ldr	r3, [r3]
f000cfb8:	e1a02623 	lsr	r2, r3, #12
f000cfbc:	e51b300c 	ldr	r3, [fp, #-12]
f000cfc0:	e583201c 	str	r2, [r3, #28]
f000cfc4:	e51b0014 	ldr	r0, [fp, #-20]
f000cfc8:	e51b2008 	ldr	r2, [fp, #-8]
f000cfcc:	e3a01008 	mov	r1, #8
f000cfd0:	e1a03002 	mov	r3, r2
f000cfd4:	e1a03083 	lsl	r3, r3, #1
f000cfd8:	e0833002 	add	r3, r3, r2
f000cfdc:	e1a03103 	lsl	r3, r3, #2
f000cfe0:	e0803003 	add	r3, r0, r3
f000cfe4:	e0833001 	add	r3, r3, r1
f000cfe8:	e5933000 	ldr	r3, [r3]
f000cfec:	e1a02623 	lsr	r2, r3, #12
f000cff0:	e51b300c 	ldr	r3, [fp, #-12]
f000cff4:	e5832020 	str	r2, [r3, #32]
f000cff8:	e51b300c 	ldr	r3, [fp, #-12]
f000cffc:	e1a00003 	mov	r0, r3
f000d000:	ebfffaa1 	bl	f000ba8c <link_init>
f000d004:	e51b0014 	ldr	r0, [fp, #-20]
f000d008:	e51b2008 	ldr	r2, [fp, #-8]
f000d00c:	e3a0100c 	mov	r1, #12
f000d010:	e1a03002 	mov	r3, r2
f000d014:	e1a03083 	lsl	r3, r3, #1
f000d018:	e0833002 	add	r3, r3, r2
f000d01c:	e1a03103 	lsl	r3, r3, #2
f000d020:	e0803003 	add	r3, r0, r3
f000d024:	e0833001 	add	r3, r3, r1
f000d028:	e5933000 	ldr	r3, [r3]
f000d02c:	e3530000 	cmp	r3, #0
f000d030:	1a000006 	bne	f000d050 <kernel_setup_physmem+0xf0>
f000d034:	e51b3010 	ldr	r3, [fp, #-16]
f000d038:	e2833a06 	add	r3, r3, #24576	; 0x6000
f000d03c:	e2833038 	add	r3, r3, #56	; 0x38
f000d040:	e51b000c 	ldr	r0, [fp, #-12]
f000d044:	e1a01003 	mov	r1, r3
f000d048:	ebfffada 	bl	f000bbb8 <cap_list_insert>
f000d04c:	ea000018 	b	f000d0b4 <kernel_setup_physmem+0x154>
f000d050:	e51b0014 	ldr	r0, [fp, #-20]
f000d054:	e51b2008 	ldr	r2, [fp, #-8]
f000d058:	e3a0100c 	mov	r1, #12
f000d05c:	e1a03002 	mov	r3, r2
f000d060:	e1a03083 	lsl	r3, r3, #1
f000d064:	e0833002 	add	r3, r3, r2
f000d068:	e1a03103 	lsl	r3, r3, #2
f000d06c:	e0803003 	add	r3, r0, r3
f000d070:	e0833001 	add	r3, r3, r1
f000d074:	e5933000 	ldr	r3, [r3]
f000d078:	e3530001 	cmp	r3, #1
f000d07c:	1a000006 	bne	f000d09c <kernel_setup_physmem+0x13c>
f000d080:	e51b3010 	ldr	r3, [fp, #-16]
f000d084:	e2833a06 	add	r3, r3, #24576	; 0x6000
f000d088:	e2833068 	add	r3, r3, #104	; 0x68
f000d08c:	e51b000c 	ldr	r0, [fp, #-12]
f000d090:	e1a01003 	mov	r1, r3
f000d094:	ebfffac7 	bl	f000bbb8 <cap_list_insert>
f000d098:	ea000005 	b	f000d0b4 <kernel_setup_physmem+0x154>
f000d09c:	e59f0038 	ldr	r0, [pc, #56]	; f000d0dc <kernel_setup_physmem+0x17c>
f000d0a0:	e59f1038 	ldr	r1, [pc, #56]	; f000d0e0 <kernel_setup_physmem+0x180>
f000d0a4:	e59f2038 	ldr	r2, [pc, #56]	; f000d0e4 <kernel_setup_physmem+0x184>
f000d0a8:	e3a03c02 	mov	r3, #512	; 0x200
f000d0ac:	eb00238e 	bl	f0015eec <printk>
f000d0b0:	eafffffe 	b	f000d0b0 <kernel_setup_physmem+0x150>
f000d0b4:	e51b3008 	ldr	r3, [fp, #-8]
f000d0b8:	e2833001 	add	r3, r3, #1
f000d0bc:	e50b3008 	str	r3, [fp, #-8]
f000d0c0:	e51b3014 	ldr	r3, [fp, #-20]
f000d0c4:	e5932000 	ldr	r2, [r3]
f000d0c8:	e51b3008 	ldr	r3, [fp, #-8]
f000d0cc:	e1520003 	cmp	r2, r3
f000d0d0:	caffffaa 	bgt	f000cf80 <kernel_setup_physmem+0x20>
f000d0d4:	e24bd004 	sub	sp, fp, #4
f000d0d8:	e8bd8800 	pop	{fp, pc}
f000d0dc:	f001e574 	.word	0xf001e574
f000d0e0:	f001e59c 	.word	0xf001e59c
f000d0e4:	f001e798 	.word	0xf001e798

f000d0e8 <init_system_resources>:
f000d0e8:	e92d4810 	push	{r4, fp, lr}
f000d0ec:	e28db008 	add	fp, sp, #8
f000d0f0:	e24dd054 	sub	sp, sp, #84	; 0x54
f000d0f4:	e50b0058 	str	r0, [fp, #-88]	; 0x58
f000d0f8:	e51b3058 	ldr	r3, [fp, #-88]	; 0x58
f000d0fc:	e59f25ac 	ldr	r2, [pc, #1452]	; f000d6b0 <init_system_resources+0x5c8>
f000d100:	e5832008 	str	r2, [r3, #8]
f000d104:	e51b2058 	ldr	r2, [fp, #-88]	; 0x58
f000d108:	e59f35a4 	ldr	r3, [pc, #1444]	; f000d6b4 <init_system_resources+0x5cc>
f000d10c:	e59f159c 	ldr	r1, [pc, #1436]	; f000d6b0 <init_system_resources+0x5c8>
f000d110:	e7821003 	str	r1, [r2, r3]
f000d114:	e51b2058 	ldr	r2, [fp, #-88]	; 0x58
f000d118:	e59f3598 	ldr	r3, [pc, #1432]	; f000d6b8 <init_system_resources+0x5d0>
f000d11c:	e59f158c 	ldr	r1, [pc, #1420]	; f000d6b0 <init_system_resources+0x5c8>
f000d120:	e7821003 	str	r1, [r2, r3]
f000d124:	e51b2058 	ldr	r2, [fp, #-88]	; 0x58
f000d128:	e59f358c 	ldr	r3, [pc, #1420]	; f000d6bc <init_system_resources+0x5d4>
f000d12c:	e59f157c 	ldr	r1, [pc, #1404]	; f000d6b0 <init_system_resources+0x5c8>
f000d130:	e7821003 	str	r1, [r2, r3]
f000d134:	e51b2058 	ldr	r2, [fp, #-88]	; 0x58
f000d138:	e59f3580 	ldr	r3, [pc, #1408]	; f000d6c0 <init_system_resources+0x5d8>
f000d13c:	e59f156c 	ldr	r1, [pc, #1388]	; f000d6b0 <init_system_resources+0x5c8>
f000d140:	e7821003 	str	r1, [r2, r3]
f000d144:	e51b2058 	ldr	r2, [fp, #-88]	; 0x58
f000d148:	e59f3574 	ldr	r3, [pc, #1396]	; f000d6c4 <init_system_resources+0x5dc>
f000d14c:	e59f155c 	ldr	r1, [pc, #1372]	; f000d6b0 <init_system_resources+0x5c8>
f000d150:	e7821003 	str	r1, [r2, r3]
f000d154:	e51b3058 	ldr	r3, [fp, #-88]	; 0x58
f000d158:	e2833a06 	add	r3, r3, #24576	; 0x6000
f000d15c:	e283301c 	add	r3, r3, #28
f000d160:	e1a00003 	mov	r0, r3
f000d164:	ebfffaaf 	bl	f000bc28 <container_head_init>
f000d168:	e51b3058 	ldr	r3, [fp, #-88]	; 0x58
f000d16c:	e2833a06 	add	r3, r3, #24576	; 0x6000
f000d170:	e283302c 	add	r3, r3, #44	; 0x2c
f000d174:	e1a00003 	mov	r0, r3
f000d178:	ebfffa81 	bl	f000bb84 <cap_list_init>
f000d17c:	e51b3058 	ldr	r3, [fp, #-88]	; 0x58
f000d180:	e2833a06 	add	r3, r3, #24576	; 0x6000
f000d184:	e2833038 	add	r3, r3, #56	; 0x38
f000d188:	e1a00003 	mov	r0, r3
f000d18c:	ebfffa7c 	bl	f000bb84 <cap_list_init>
f000d190:	e51b3058 	ldr	r3, [fp, #-88]	; 0x58
f000d194:	e2833a06 	add	r3, r3, #24576	; 0x6000
f000d198:	e283305c 	add	r3, r3, #92	; 0x5c
f000d19c:	e1a00003 	mov	r0, r3
f000d1a0:	ebfffa77 	bl	f000bb84 <cap_list_init>
f000d1a4:	e51b3058 	ldr	r3, [fp, #-88]	; 0x58
f000d1a8:	e2833a06 	add	r3, r3, #24576	; 0x6000
f000d1ac:	e2833068 	add	r3, r3, #104	; 0x68
f000d1b0:	e1a00003 	mov	r0, r3
f000d1b4:	ebfffa72 	bl	f000bb84 <cap_list_init>
f000d1b8:	e51b3058 	ldr	r3, [fp, #-88]	; 0x58
f000d1bc:	e2833a06 	add	r3, r3, #24576	; 0x6000
f000d1c0:	e2833044 	add	r3, r3, #68	; 0x44
f000d1c4:	e1a00003 	mov	r0, r3
f000d1c8:	ebfffa6d 	bl	f000bb84 <cap_list_init>
f000d1cc:	e51b3058 	ldr	r3, [fp, #-88]	; 0x58
f000d1d0:	e2833a06 	add	r3, r3, #24576	; 0x6000
f000d1d4:	e2833050 	add	r3, r3, #80	; 0x50
f000d1d8:	e1a00003 	mov	r0, r3
f000d1dc:	ebfffa68 	bl	f000bb84 <cap_list_init>
f000d1e0:	e51b3058 	ldr	r3, [fp, #-88]	; 0x58
f000d1e4:	e2833a06 	add	r3, r3, #24576	; 0x6000
f000d1e8:	e28330a4 	add	r3, r3, #164	; 0xa4
f000d1ec:	e1a00003 	mov	r0, r3
f000d1f0:	ebfffa25 	bl	f000ba8c <link_init>
f000d1f4:	e51b3058 	ldr	r3, [fp, #-88]	; 0x58
f000d1f8:	e2833a06 	add	r3, r3, #24576	; 0x6000
f000d1fc:	e28330b4 	add	r3, r3, #180	; 0xb4
f000d200:	e1a00003 	mov	r0, r3
f000d204:	ebfffa5e 	bl	f000bb84 <cap_list_init>
f000d208:	e51b3058 	ldr	r3, [fp, #-88]	; 0x58
f000d20c:	e2833a06 	add	r3, r3, #24576	; 0x6000
f000d210:	e28330ac 	add	r3, r3, #172	; 0xac
f000d214:	e1a00003 	mov	r0, r3
f000d218:	ebfffa78 	bl	f000bc00 <spin_lock_init>
f000d21c:	e51b0058 	ldr	r0, [fp, #-88]	; 0x58
f000d220:	e59f14a0 	ldr	r1, [pc, #1184]	; f000d6c8 <init_system_resources+0x5e0>
f000d224:	ebffff4d 	bl	f000cf60 <kernel_setup_physmem>
f000d228:	e3a0002c 	mov	r0, #44	; 0x2c
f000d22c:	e3a01000 	mov	r1, #0
f000d230:	ebfff9c1 	bl	f000b93c <alloc_bootmem>
f000d234:	e50b0028 	str	r0, [fp, #-40]	; 0x28
f000d238:	e51b3028 	ldr	r3, [fp, #-40]	; 0x28
f000d23c:	e3a02000 	mov	r2, #0
f000d240:	e583201c 	str	r2, [r3, #28]
f000d244:	e51b3028 	ldr	r3, [fp, #-40]	; 0x28
f000d248:	e59f247c 	ldr	r2, [pc, #1148]	; f000d6cc <init_system_resources+0x5e4>
f000d24c:	e5832020 	str	r2, [r3, #32]
f000d250:	e51b3028 	ldr	r3, [fp, #-40]	; 0x28
f000d254:	e1a00003 	mov	r0, r3
f000d258:	ebfffa0b 	bl	f000ba8c <link_init>
f000d25c:	e51b3058 	ldr	r3, [fp, #-88]	; 0x58
f000d260:	e2833a06 	add	r3, r3, #24576	; 0x6000
f000d264:	e2833050 	add	r3, r3, #80	; 0x50
f000d268:	e51b0028 	ldr	r0, [fp, #-40]	; 0x28
f000d26c:	e1a01003 	mov	r1, r3
f000d270:	ebfffa50 	bl	f000bbb8 <cap_list_insert>
f000d274:	e3a0002c 	mov	r0, #44	; 0x2c
f000d278:	e3a01000 	mov	r1, #0
f000d27c:	ebfff9ae 	bl	f000b93c <alloc_bootmem>
f000d280:	e50b002c 	str	r0, [fp, #-44]	; 0x2c
f000d284:	e59f3444 	ldr	r3, [pc, #1092]	; f000d6d0 <init_system_resources+0x5e8>
f000d288:	e2833201 	add	r3, r3, #268435456	; 0x10000000
f000d28c:	e1a02623 	lsr	r2, r3, #12
f000d290:	e51b302c 	ldr	r3, [fp, #-44]	; 0x2c
f000d294:	e583201c 	str	r2, [r3, #28]
f000d298:	e59f3434 	ldr	r3, [pc, #1076]	; f000d6d4 <init_system_resources+0x5ec>
f000d29c:	e2833201 	add	r3, r3, #268435456	; 0x10000000
f000d2a0:	e1a02623 	lsr	r2, r3, #12
f000d2a4:	e51b302c 	ldr	r3, [fp, #-44]	; 0x2c
f000d2a8:	e5832020 	str	r2, [r3, #32]
f000d2ac:	e51b302c 	ldr	r3, [fp, #-44]	; 0x2c
f000d2b0:	e1a00003 	mov	r0, r3
f000d2b4:	ebfff9f4 	bl	f000ba8c <link_init>
f000d2b8:	e51b3058 	ldr	r3, [fp, #-88]	; 0x58
f000d2bc:	e2833a06 	add	r3, r3, #24576	; 0x6000
f000d2c0:	e283302c 	add	r3, r3, #44	; 0x2c
f000d2c4:	e51b002c 	ldr	r0, [fp, #-44]	; 0x2c
f000d2c8:	e1a01003 	mov	r1, r3
f000d2cc:	ebfffa39 	bl	f000bbb8 <cap_list_insert>
f000d2d0:	e51b3058 	ldr	r3, [fp, #-88]	; 0x58
f000d2d4:	e2833a06 	add	r3, r3, #24576	; 0x6000
f000d2d8:	e2833038 	add	r3, r3, #56	; 0x38
f000d2dc:	e51b202c 	ldr	r2, [fp, #-44]	; 0x2c
f000d2e0:	e592201c 	ldr	r2, [r2, #28]
f000d2e4:	e51b102c 	ldr	r1, [fp, #-44]	; 0x2c
f000d2e8:	e591c020 	ldr	ip, [r1, #32]
f000d2ec:	e3a00000 	mov	r0, #0
f000d2f0:	e1a01003 	mov	r1, r3
f000d2f4:	e1a0300c 	mov	r3, ip
f000d2f8:	ebfffc8b 	bl	f000c52c <memcap_unmap>
f000d2fc:	e24b3050 	sub	r3, fp, #80	; 0x50
f000d300:	e1a00003 	mov	r0, r3
f000d304:	e3a01000 	mov	r1, #0
f000d308:	e3a02018 	mov	r2, #24
f000d30c:	eb002321 	bl	f0015f98 <memset>
f000d310:	e3a03001 	mov	r3, #1
f000d314:	e50b3050 	str	r3, [fp, #-80]	; 0x50
f000d318:	e3a03000 	mov	r3, #0
f000d31c:	e50b3010 	str	r3, [fp, #-16]
f000d320:	ea00008d 	b	f000d55c <init_system_resources+0x474>
f000d324:	e51b104c 	ldr	r1, [fp, #-76]	; 0x4c
f000d328:	e59fc3a8 	ldr	ip, [pc, #936]	; f000d6d8 <init_system_resources+0x5f0>
f000d32c:	e51b2010 	ldr	r2, [fp, #-16]
f000d330:	e3a00044 	mov	r0, #68	; 0x44
f000d334:	e1a03002 	mov	r3, r2
f000d338:	e1a03183 	lsl	r3, r3, #3
f000d33c:	e0623003 	rsb	r3, r2, r3
f000d340:	e1a03183 	lsl	r3, r3, #3
f000d344:	e0833002 	add	r3, r3, r2
f000d348:	e1a03203 	lsl	r3, r3, #4
f000d34c:	e08c3003 	add	r3, ip, r3
f000d350:	e0833000 	add	r3, r3, r0
f000d354:	e5933000 	ldr	r3, [r3]
f000d358:	e0813003 	add	r3, r1, r3
f000d35c:	e50b304c 	str	r3, [fp, #-76]	; 0x4c
f000d360:	e3a03000 	mov	r3, #0
f000d364:	e50b3014 	str	r3, [fp, #-20]
f000d368:	ea000015 	b	f000d3c4 <init_system_resources+0x2dc>
f000d36c:	e51b3014 	ldr	r3, [fp, #-20]
f000d370:	e1a01283 	lsl	r1, r3, #5
f000d374:	e51b2010 	ldr	r2, [fp, #-16]
f000d378:	e1a03002 	mov	r3, r2
f000d37c:	e1a03183 	lsl	r3, r3, #3
f000d380:	e0623003 	rsb	r3, r2, r3
f000d384:	e1a03183 	lsl	r3, r3, #3
f000d388:	e0833002 	add	r3, r3, r2
f000d38c:	e1a03203 	lsl	r3, r3, #4
f000d390:	e0813003 	add	r3, r1, r3
f000d394:	e2832048 	add	r2, r3, #72	; 0x48
f000d398:	e59f3338 	ldr	r3, [pc, #824]	; f000d6d8 <init_system_resources+0x5f0>
f000d39c:	e0823003 	add	r3, r2, r3
f000d3a0:	e50b3030 	str	r3, [fp, #-48]	; 0x30
f000d3a4:	e24b3050 	sub	r3, fp, #80	; 0x50
f000d3a8:	e51b0030 	ldr	r0, [fp, #-48]	; 0x30
f000d3ac:	e1a01003 	mov	r1, r3
f000d3b0:	e51b2058 	ldr	r2, [fp, #-88]	; 0x58
f000d3b4:	ebfffe4e 	bl	f000ccf4 <process_cap_info>
f000d3b8:	e51b3014 	ldr	r3, [fp, #-20]
f000d3bc:	e2833001 	add	r3, r3, #1
f000d3c0:	e50b3014 	str	r3, [fp, #-20]
f000d3c4:	e59f030c 	ldr	r0, [pc, #780]	; f000d6d8 <init_system_resources+0x5f0>
f000d3c8:	e51b2010 	ldr	r2, [fp, #-16]
f000d3cc:	e3a01044 	mov	r1, #68	; 0x44
f000d3d0:	e1a03002 	mov	r3, r2
f000d3d4:	e1a03183 	lsl	r3, r3, #3
f000d3d8:	e0623003 	rsb	r3, r2, r3
f000d3dc:	e1a03183 	lsl	r3, r3, #3
f000d3e0:	e0833002 	add	r3, r3, r2
f000d3e4:	e1a03203 	lsl	r3, r3, #4
f000d3e8:	e0803003 	add	r3, r0, r3
f000d3ec:	e0833001 	add	r3, r3, r1
f000d3f0:	e5932000 	ldr	r2, [r3]
f000d3f4:	e51b3014 	ldr	r3, [fp, #-20]
f000d3f8:	e1520003 	cmp	r2, r3
f000d3fc:	caffffda 	bgt	f000d36c <init_system_resources+0x284>
f000d400:	e3a03000 	mov	r3, #0
f000d404:	e50b3018 	str	r3, [fp, #-24]
f000d408:	ea000041 	b	f000d514 <init_system_resources+0x42c>
f000d40c:	e59fc2c4 	ldr	ip, [pc, #708]	; f000d6d8 <init_system_resources+0x5f0>
f000d410:	e51b3018 	ldr	r3, [fp, #-24]
f000d414:	e51b1010 	ldr	r1, [fp, #-16]
f000d418:	e3a00f43 	mov	r0, #268	; 0x10c
f000d41c:	e1a02003 	mov	r2, r3
f000d420:	e1a02102 	lsl	r2, r2, #2
f000d424:	e0822003 	add	r2, r2, r3
f000d428:	e1a03202 	lsl	r3, r2, #4
f000d42c:	e0822003 	add	r2, r2, r3
f000d430:	e1a03182 	lsl	r3, r2, #3
f000d434:	e1a02003 	mov	r2, r3
f000d438:	e1a03001 	mov	r3, r1
f000d43c:	e1a03183 	lsl	r3, r3, #3
f000d440:	e0613003 	rsb	r3, r1, r3
f000d444:	e1a03183 	lsl	r3, r3, #3
f000d448:	e0833001 	add	r3, r3, r1
f000d44c:	e1a03203 	lsl	r3, r3, #4
f000d450:	e0823003 	add	r3, r2, r3
f000d454:	e08c3003 	add	r3, ip, r3
f000d458:	e0833000 	add	r3, r3, r0
f000d45c:	e5933000 	ldr	r3, [r3]
f000d460:	e50b3034 	str	r3, [fp, #-52]	; 0x34
f000d464:	e51b204c 	ldr	r2, [fp, #-76]	; 0x4c
f000d468:	e51b3034 	ldr	r3, [fp, #-52]	; 0x34
f000d46c:	e0823003 	add	r3, r2, r3
f000d470:	e50b304c 	str	r3, [fp, #-76]	; 0x4c
f000d474:	e3a03000 	mov	r3, #0
f000d478:	e50b301c 	str	r3, [fp, #-28]
f000d47c:	ea00001d 	b	f000d4f8 <init_system_resources+0x410>
f000d480:	e51b301c 	ldr	r3, [fp, #-28]
f000d484:	e1a01283 	lsl	r1, r3, #5
f000d488:	e51b2018 	ldr	r2, [fp, #-24]
f000d48c:	e1a03002 	mov	r3, r2
f000d490:	e1a03103 	lsl	r3, r3, #2
f000d494:	e0833002 	add	r3, r3, r2
f000d498:	e1a02203 	lsl	r2, r3, #4
f000d49c:	e0833002 	add	r3, r3, r2
f000d4a0:	e1a03183 	lsl	r3, r3, #3
f000d4a4:	e0811003 	add	r1, r1, r3
f000d4a8:	e51b2010 	ldr	r2, [fp, #-16]
f000d4ac:	e1a03002 	mov	r3, r2
f000d4b0:	e1a03183 	lsl	r3, r3, #3
f000d4b4:	e0623003 	rsb	r3, r2, r3
f000d4b8:	e1a03183 	lsl	r3, r3, #3
f000d4bc:	e0833002 	add	r3, r3, r2
f000d4c0:	e1a03203 	lsl	r3, r3, #4
f000d4c4:	e0813003 	add	r3, r1, r3
f000d4c8:	e2832e11 	add	r2, r3, #272	; 0x110
f000d4cc:	e59f3204 	ldr	r3, [pc, #516]	; f000d6d8 <init_system_resources+0x5f0>
f000d4d0:	e0823003 	add	r3, r2, r3
f000d4d4:	e50b3030 	str	r3, [fp, #-48]	; 0x30
f000d4d8:	e24b3050 	sub	r3, fp, #80	; 0x50
f000d4dc:	e51b0030 	ldr	r0, [fp, #-48]	; 0x30
f000d4e0:	e1a01003 	mov	r1, r3
f000d4e4:	e51b2058 	ldr	r2, [fp, #-88]	; 0x58
f000d4e8:	ebfffe01 	bl	f000ccf4 <process_cap_info>
f000d4ec:	e51b301c 	ldr	r3, [fp, #-28]
f000d4f0:	e2833001 	add	r3, r3, #1
f000d4f4:	e50b301c 	str	r3, [fp, #-28]
f000d4f8:	e51b201c 	ldr	r2, [fp, #-28]
f000d4fc:	e51b3034 	ldr	r3, [fp, #-52]	; 0x34
f000d500:	e1520003 	cmp	r2, r3
f000d504:	baffffdd 	blt	f000d480 <init_system_resources+0x398>
f000d508:	e51b3018 	ldr	r3, [fp, #-24]
f000d50c:	e2833001 	add	r3, r3, #1
f000d510:	e50b3018 	str	r3, [fp, #-24]
f000d514:	e59f01bc 	ldr	r0, [pc, #444]	; f000d6d8 <init_system_resources+0x5f0>
f000d518:	e51b2010 	ldr	r2, [fp, #-16]
f000d51c:	e3a01040 	mov	r1, #64	; 0x40
f000d520:	e1a03002 	mov	r3, r2
f000d524:	e1a03183 	lsl	r3, r3, #3
f000d528:	e0623003 	rsb	r3, r2, r3
f000d52c:	e1a03183 	lsl	r3, r3, #3
f000d530:	e0833002 	add	r3, r3, r2
f000d534:	e1a03203 	lsl	r3, r3, #4
f000d538:	e0803003 	add	r3, r0, r3
f000d53c:	e0833001 	add	r3, r3, r1
f000d540:	e5932000 	ldr	r2, [r3]
f000d544:	e51b3018 	ldr	r3, [fp, #-24]
f000d548:	e1520003 	cmp	r2, r3
f000d54c:	caffffae 	bgt	f000d40c <init_system_resources+0x324>
f000d550:	e51b3010 	ldr	r3, [fp, #-16]
f000d554:	e2833001 	add	r3, r3, #1
f000d558:	e50b3010 	str	r3, [fp, #-16]
f000d55c:	e51b2050 	ldr	r2, [fp, #-80]	; 0x50
f000d560:	e51b3010 	ldr	r3, [fp, #-16]
f000d564:	e1520003 	cmp	r2, r3
f000d568:	caffff6d 	bgt	f000d324 <init_system_resources+0x23c>
f000d56c:	e24b3050 	sub	r3, fp, #80	; 0x50
f000d570:	e1a00003 	mov	r0, r3
f000d574:	e51b1058 	ldr	r1, [fp, #-88]	; 0x58
f000d578:	ebfffd9a 	bl	f000cbe8 <init_resource_allocators>
f000d57c:	e51b3058 	ldr	r3, [fp, #-88]	; 0x58
f000d580:	e2833a03 	add	r3, r3, #12288	; 0x3000
f000d584:	e2833010 	add	r3, r3, #16
f000d588:	e51b2050 	ldr	r2, [fp, #-80]	; 0x50
f000d58c:	e2822001 	add	r2, r2, #1
f000d590:	e1a00003 	mov	r0, r3
f000d594:	e1a01002 	mov	r1, r2
f000d598:	eb002786 	bl	f00173b8 <id_get>
f000d59c:	e1a03000 	mov	r3, r0
f000d5a0:	e1a02003 	mov	r2, r3
f000d5a4:	e51b3058 	ldr	r3, [fp, #-88]	; 0x58
f000d5a8:	e5832000 	str	r2, [r3]
f000d5ac:	ebfff9ae 	bl	f000bc6c <current_task>
f000d5b0:	e1a04000 	mov	r4, r0
f000d5b4:	e51b3058 	ldr	r3, [fp, #-88]	; 0x58
f000d5b8:	e2833a01 	add	r3, r3, #4096	; 0x1000
f000d5bc:	e2833008 	add	r3, r3, #8
f000d5c0:	e1a00003 	mov	r0, r3
f000d5c4:	eb002737 	bl	f00172a8 <id_new>
f000d5c8:	e1a03000 	mov	r3, r0
f000d5cc:	e5843054 	str	r3, [r4, #84]	; 0x54
f000d5d0:	ebfff9a5 	bl	f000bc6c <current_task>
f000d5d4:	e1a03000 	mov	r3, r0
f000d5d8:	e59340b4 	ldr	r4, [r3, #180]	; 0xb4
f000d5dc:	e51b3058 	ldr	r3, [fp, #-88]	; 0x58
f000d5e0:	e2833004 	add	r3, r3, #4
f000d5e4:	e1a00003 	mov	r0, r3
f000d5e8:	eb00272e 	bl	f00172a8 <id_new>
f000d5ec:	e1a03000 	mov	r3, r0
f000d5f0:	e5843000 	str	r3, [r4]
f000d5f4:	e3a03000 	mov	r3, #0
f000d5f8:	e50b3020 	str	r3, [fp, #-32]
f000d5fc:	ea000007 	b	f000d620 <init_system_resources+0x538>
f000d600:	e51b3058 	ldr	r3, [fp, #-88]	; 0x58
f000d604:	e2833a06 	add	r3, r3, #24576	; 0x6000
f000d608:	e2833090 	add	r3, r3, #144	; 0x90
f000d60c:	e1a00003 	mov	r0, r3
f000d610:	ebfff1ff 	bl	f0009e14 <init_ktcb_list>
f000d614:	e51b3020 	ldr	r3, [fp, #-32]
f000d618:	e2833001 	add	r3, r3, #1
f000d61c:	e50b3020 	str	r3, [fp, #-32]
f000d620:	e51b3020 	ldr	r3, [fp, #-32]
f000d624:	e3530000 	cmp	r3, #0
f000d628:	dafffff4 	ble	f000d600 <init_system_resources+0x518>
f000d62c:	e3a03000 	mov	r3, #0
f000d630:	e50b3024 	str	r3, [fp, #-36]	; 0x24
f000d634:	ea000013 	b	f000d688 <init_system_resources+0x5a0>
f000d638:	eb0000f7 	bl	f000da1c <container_alloc_init>
f000d63c:	e50b0038 	str	r0, [fp, #-56]	; 0x38
f000d640:	e51b2024 	ldr	r2, [fp, #-36]	; 0x24
f000d644:	e1a03002 	mov	r3, r2
f000d648:	e1a03183 	lsl	r3, r3, #3
f000d64c:	e0623003 	rsb	r3, r2, r3
f000d650:	e1a03183 	lsl	r3, r3, #3
f000d654:	e0833002 	add	r3, r3, r2
f000d658:	e1a03203 	lsl	r3, r3, #4
f000d65c:	e59f2074 	ldr	r2, [pc, #116]	; f000d6d8 <init_system_resources+0x5f0>
f000d660:	e0833002 	add	r3, r3, r2
f000d664:	e51b0038 	ldr	r0, [fp, #-56]	; 0x38
f000d668:	e1a01003 	mov	r1, r3
f000d66c:	ebfffca8 	bl	f000c914 <copy_container_info>
f000d670:	e51b0038 	ldr	r0, [fp, #-56]	; 0x38
f000d674:	e51b1058 	ldr	r1, [fp, #-88]	; 0x58
f000d678:	eb000129 	bl	f000db24 <kres_insert_container>
f000d67c:	e51b3024 	ldr	r3, [fp, #-36]	; 0x24
f000d680:	e2833001 	add	r3, r3, #1
f000d684:	e50b3024 	str	r3, [fp, #-36]	; 0x24
f000d688:	e51b2050 	ldr	r2, [fp, #-80]	; 0x50
f000d68c:	e51b3024 	ldr	r3, [fp, #-36]	; 0x24
f000d690:	e1520003 	cmp	r2, r3
f000d694:	caffffe7 	bgt	f000d638 <init_system_resources+0x550>
f000d698:	e51b0058 	ldr	r0, [fp, #-88]	; 0x58
f000d69c:	eb0002f5 	bl	f000e278 <container_init_pagers>
f000d6a0:	e3a03000 	mov	r3, #0
f000d6a4:	e1a00003 	mov	r0, r3
f000d6a8:	e24bd008 	sub	sp, fp, #8
f000d6ac:	e8bd8810 	pop	{r4, fp, pc}
f000d6b0:	000003ff 	.word	0x000003ff
f000d6b4:	0000100c 	.word	0x0000100c
f000d6b8:	00002010 	.word	0x00002010
f000d6bc:	00003014 	.word	0x00003014
f000d6c0:	00004018 	.word	0x00004018
f000d6c4:	0000501c 	.word	0x0000501c
f000d6c8:	f002000c 	.word	0xf002000c
f000d6cc:	000fffff 	.word	0x000fffff
f000d6d0:	f0008000 	.word	0xf0008000
f000d6d4:	f0038390 	.word	0xf0038390
f000d6d8:	f0038000 	.word	0xf0038000

f000d6dc <link_init>:
f000d6dc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f000d6e0:	e28db000 	add	fp, sp, #0
f000d6e4:	e24dd00c 	sub	sp, sp, #12
f000d6e8:	e50b0008 	str	r0, [fp, #-8]
f000d6ec:	e51b3008 	ldr	r3, [fp, #-8]
f000d6f0:	e51b2008 	ldr	r2, [fp, #-8]
f000d6f4:	e5832000 	str	r2, [r3]
f000d6f8:	e51b3008 	ldr	r3, [fp, #-8]
f000d6fc:	e51b2008 	ldr	r2, [fp, #-8]
f000d700:	e5832004 	str	r2, [r3, #4]
f000d704:	e24bd000 	sub	sp, fp, #0
f000d708:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f000d70c:	e12fff1e 	bx	lr

f000d710 <list_insert>:
f000d710:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f000d714:	e28db000 	add	fp, sp, #0
f000d718:	e24dd014 	sub	sp, sp, #20
f000d71c:	e50b0010 	str	r0, [fp, #-16]
f000d720:	e50b1014 	str	r1, [fp, #-20]
f000d724:	e51b3014 	ldr	r3, [fp, #-20]
f000d728:	e5933000 	ldr	r3, [r3]
f000d72c:	e50b3008 	str	r3, [fp, #-8]
f000d730:	e51b3010 	ldr	r3, [fp, #-16]
f000d734:	e51b2008 	ldr	r2, [fp, #-8]
f000d738:	e5832000 	str	r2, [r3]
f000d73c:	e51b3008 	ldr	r3, [fp, #-8]
f000d740:	e51b2010 	ldr	r2, [fp, #-16]
f000d744:	e5832004 	str	r2, [r3, #4]
f000d748:	e51b3014 	ldr	r3, [fp, #-20]
f000d74c:	e51b2010 	ldr	r2, [fp, #-16]
f000d750:	e5832000 	str	r2, [r3]
f000d754:	e51b3010 	ldr	r3, [fp, #-16]
f000d758:	e51b2014 	ldr	r2, [fp, #-20]
f000d75c:	e5832004 	str	r2, [r3, #4]
f000d760:	e24bd000 	sub	sp, fp, #0
f000d764:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f000d768:	e12fff1e 	bx	lr

f000d76c <list_remove_init>:
f000d76c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f000d770:	e28db000 	add	fp, sp, #0
f000d774:	e24dd014 	sub	sp, sp, #20
f000d778:	e50b0010 	str	r0, [fp, #-16]
f000d77c:	e51b3010 	ldr	r3, [fp, #-16]
f000d780:	e5933004 	ldr	r3, [r3, #4]
f000d784:	e50b3008 	str	r3, [fp, #-8]
f000d788:	e51b3010 	ldr	r3, [fp, #-16]
f000d78c:	e5933000 	ldr	r3, [r3]
f000d790:	e50b300c 	str	r3, [fp, #-12]
f000d794:	e51b3008 	ldr	r3, [fp, #-8]
f000d798:	e51b200c 	ldr	r2, [fp, #-12]
f000d79c:	e5832000 	str	r2, [r3]
f000d7a0:	e51b300c 	ldr	r3, [fp, #-12]
f000d7a4:	e51b2008 	ldr	r2, [fp, #-8]
f000d7a8:	e5832004 	str	r2, [r3, #4]
f000d7ac:	e51b3010 	ldr	r3, [fp, #-16]
f000d7b0:	e51b2010 	ldr	r2, [fp, #-16]
f000d7b4:	e5832000 	str	r2, [r3]
f000d7b8:	e51b3010 	ldr	r3, [fp, #-16]
f000d7bc:	e51b2010 	ldr	r2, [fp, #-16]
f000d7c0:	e5832004 	str	r2, [r3, #4]
f000d7c4:	e24bd000 	sub	sp, fp, #0
f000d7c8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f000d7cc:	e12fff1e 	bx	lr

f000d7d0 <list_detach>:
f000d7d0:	e92d4800 	push	{fp, lr}
f000d7d4:	e28db004 	add	fp, sp, #4
f000d7d8:	e24dd010 	sub	sp, sp, #16
f000d7dc:	e50b0010 	str	r0, [fp, #-16]
f000d7e0:	e51b3010 	ldr	r3, [fp, #-16]
f000d7e4:	e5933000 	ldr	r3, [r3]
f000d7e8:	e50b3008 	str	r3, [fp, #-8]
f000d7ec:	e51b0010 	ldr	r0, [fp, #-16]
f000d7f0:	ebffffdd 	bl	f000d76c <list_remove_init>
f000d7f4:	e51b3008 	ldr	r3, [fp, #-8]
f000d7f8:	e1a00003 	mov	r0, r3
f000d7fc:	e24bd004 	sub	sp, fp, #4
f000d800:	e8bd8800 	pop	{fp, pc}

f000d804 <list_empty>:
f000d804:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f000d808:	e28db000 	add	fp, sp, #0
f000d80c:	e24dd00c 	sub	sp, sp, #12
f000d810:	e50b0008 	str	r0, [fp, #-8]
f000d814:	e51b3008 	ldr	r3, [fp, #-8]
f000d818:	e5932004 	ldr	r2, [r3, #4]
f000d81c:	e51b3008 	ldr	r3, [fp, #-8]
f000d820:	e1520003 	cmp	r2, r3
f000d824:	1a000006 	bne	f000d844 <list_empty+0x40>
f000d828:	e51b3008 	ldr	r3, [fp, #-8]
f000d82c:	e5932000 	ldr	r2, [r3]
f000d830:	e51b3008 	ldr	r3, [fp, #-8]
f000d834:	e1520003 	cmp	r2, r3
f000d838:	1a000001 	bne	f000d844 <list_empty+0x40>
f000d83c:	e3a03001 	mov	r3, #1
f000d840:	ea000000 	b	f000d848 <list_empty+0x44>
f000d844:	e3a03000 	mov	r3, #0
f000d848:	e1a00003 	mov	r0, r3
f000d84c:	e24bd000 	sub	sp, fp, #0
f000d850:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f000d854:	e12fff1e 	bx	lr

f000d858 <spin_lock>:
f000d858:	e92d4800 	push	{fp, lr}
f000d85c:	e28db004 	add	fp, sp, #4
f000d860:	e24dd008 	sub	sp, sp, #8
f000d864:	e50b0008 	str	r0, [fp, #-8]
f000d868:	ebffec47 	bl	f000898c <preempt_disable>
f000d86c:	e24bd004 	sub	sp, fp, #4
f000d870:	e8bd8800 	pop	{fp, pc}

f000d874 <spin_unlock>:
f000d874:	e92d4800 	push	{fp, lr}
f000d878:	e28db004 	add	fp, sp, #4
f000d87c:	e24dd008 	sub	sp, sp, #8
f000d880:	e50b0008 	str	r0, [fp, #-8]
f000d884:	ebffec2f 	bl	f0008948 <preempt_enable>
f000d888:	e24bd004 	sub	sp, fp, #4
f000d88c:	e8bd8800 	pop	{fp, pc}

f000d890 <cap_list_init>:
f000d890:	e92d4800 	push	{fp, lr}
f000d894:	e28db004 	add	fp, sp, #4
f000d898:	e24dd008 	sub	sp, sp, #8
f000d89c:	e50b0008 	str	r0, [fp, #-8]
f000d8a0:	e51b3008 	ldr	r3, [fp, #-8]
f000d8a4:	e3a02000 	mov	r2, #0
f000d8a8:	e5832000 	str	r2, [r3]
f000d8ac:	e51b3008 	ldr	r3, [fp, #-8]
f000d8b0:	e2833004 	add	r3, r3, #4
f000d8b4:	e1a00003 	mov	r0, r3
f000d8b8:	ebffff87 	bl	f000d6dc <link_init>
f000d8bc:	e24bd004 	sub	sp, fp, #4
f000d8c0:	e8bd8800 	pop	{fp, pc}

f000d8c4 <cap_list_detach>:
f000d8c4:	e92d4800 	push	{fp, lr}
f000d8c8:	e28db004 	add	fp, sp, #4
f000d8cc:	e24dd010 	sub	sp, sp, #16
f000d8d0:	e50b0010 	str	r0, [fp, #-16]
f000d8d4:	e51b3010 	ldr	r3, [fp, #-16]
f000d8d8:	e5933000 	ldr	r3, [r3]
f000d8dc:	e3530000 	cmp	r3, #0
f000d8e0:	1a000001 	bne	f000d8ec <cap_list_detach+0x28>
f000d8e4:	e3a03000 	mov	r3, #0
f000d8e8:	ea00000b 	b	f000d91c <cap_list_detach+0x58>
f000d8ec:	e51b3010 	ldr	r3, [fp, #-16]
f000d8f0:	e2833004 	add	r3, r3, #4
f000d8f4:	e1a00003 	mov	r0, r3
f000d8f8:	ebffffb4 	bl	f000d7d0 <list_detach>
f000d8fc:	e50b0008 	str	r0, [fp, #-8]
f000d900:	e51b3010 	ldr	r3, [fp, #-16]
f000d904:	e3a02000 	mov	r2, #0
f000d908:	e5832000 	str	r2, [r3]
f000d90c:	e51b3008 	ldr	r3, [fp, #-8]
f000d910:	e50b300c 	str	r3, [fp, #-12]
f000d914:	e51b300c 	ldr	r3, [fp, #-12]
f000d918:	e1a00000 	nop			; (mov r0, r0)
f000d91c:	e1a00003 	mov	r0, r3
f000d920:	e24bd004 	sub	sp, fp, #4
f000d924:	e8bd8800 	pop	{fp, pc}

f000d928 <cap_list_attach>:
f000d928:	e92d4800 	push	{fp, lr}
f000d92c:	e28db004 	add	fp, sp, #4
f000d930:	e24dd010 	sub	sp, sp, #16
f000d934:	e50b0010 	str	r0, [fp, #-16]
f000d938:	e50b1014 	str	r1, [fp, #-20]
f000d93c:	e51b3014 	ldr	r3, [fp, #-20]
f000d940:	e2832004 	add	r2, r3, #4
f000d944:	e51b3010 	ldr	r3, [fp, #-16]
f000d948:	e1a00002 	mov	r0, r2
f000d94c:	e1a01003 	mov	r1, r3
f000d950:	ebffff6e 	bl	f000d710 <list_insert>
f000d954:	e51b3014 	ldr	r3, [fp, #-20]
f000d958:	e5933004 	ldr	r3, [r3, #4]
f000d95c:	e50b3008 	str	r3, [fp, #-8]
f000d960:	e51b3008 	ldr	r3, [fp, #-8]
f000d964:	e50b3010 	str	r3, [fp, #-16]
f000d968:	ea000009 	b	f000d994 <cap_list_attach+0x6c>
f000d96c:	e51b3014 	ldr	r3, [fp, #-20]
f000d970:	e5933000 	ldr	r3, [r3]
f000d974:	e2832001 	add	r2, r3, #1
f000d978:	e51b3014 	ldr	r3, [fp, #-20]
f000d97c:	e5832000 	str	r2, [r3]
f000d980:	e51b3010 	ldr	r3, [fp, #-16]
f000d984:	e5933000 	ldr	r3, [r3]
f000d988:	e50b300c 	str	r3, [fp, #-12]
f000d98c:	e51b300c 	ldr	r3, [fp, #-12]
f000d990:	e50b3010 	str	r3, [fp, #-16]
f000d994:	e51b2010 	ldr	r2, [fp, #-16]
f000d998:	e51b3014 	ldr	r3, [fp, #-20]
f000d99c:	e2833004 	add	r3, r3, #4
f000d9a0:	e1520003 	cmp	r2, r3
f000d9a4:	1afffff0 	bne	f000d96c <cap_list_attach+0x44>
f000d9a8:	e24bd004 	sub	sp, fp, #4
f000d9ac:	e8bd8800 	pop	{fp, pc}

f000d9b0 <cap_list_move>:
f000d9b0:	e92d4800 	push	{fp, lr}
f000d9b4:	e28db004 	add	fp, sp, #4
f000d9b8:	e24dd010 	sub	sp, sp, #16
f000d9bc:	e50b0010 	str	r0, [fp, #-16]
f000d9c0:	e50b1014 	str	r1, [fp, #-20]
f000d9c4:	e51b3014 	ldr	r3, [fp, #-20]
f000d9c8:	e5933000 	ldr	r3, [r3]
f000d9cc:	e3530000 	cmp	r3, #0
f000d9d0:	1a000000 	bne	f000d9d8 <cap_list_move+0x28>
f000d9d4:	ea000005 	b	f000d9f0 <cap_list_move+0x40>
f000d9d8:	e51b0014 	ldr	r0, [fp, #-20]
f000d9dc:	ebffffb8 	bl	f000d8c4 <cap_list_detach>
f000d9e0:	e50b0008 	str	r0, [fp, #-8]
f000d9e4:	e51b0008 	ldr	r0, [fp, #-8]
f000d9e8:	e51b1010 	ldr	r1, [fp, #-16]
f000d9ec:	ebffffcd 	bl	f000d928 <cap_list_attach>
f000d9f0:	e24bd004 	sub	sp, fp, #4
f000d9f4:	e8bd8800 	pop	{fp, pc}

f000d9f8 <current_task>:
f000d9f8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f000d9fc:	e28db000 	add	fp, sp, #0
f000da00:	e1a0300d 	mov	r3, sp
f000da04:	e3c33eff 	bic	r3, r3, #4080	; 0xff0
f000da08:	e3c3300f 	bic	r3, r3, #15
f000da0c:	e1a00003 	mov	r0, r3
f000da10:	e24bd000 	sub	sp, fp, #0
f000da14:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f000da18:	e12fff1e 	bx	lr

f000da1c <container_alloc_init>:
f000da1c:	e92d4800 	push	{fp, lr}
f000da20:	e28db004 	add	fp, sp, #4
f000da24:	e24dd008 	sub	sp, sp, #8
f000da28:	e3a000b0 	mov	r0, #176	; 0xb0
f000da2c:	e3a01000 	mov	r1, #0
f000da30:	ebfff7c1 	bl	f000b93c <alloc_bootmem>
f000da34:	e50b000c 	str	r0, [fp, #-12]
f000da38:	e59f00e0 	ldr	r0, [pc, #224]	; f000db20 <container_alloc_init+0x104>
f000da3c:	eb002619 	bl	f00172a8 <id_new>
f000da40:	e1a03000 	mov	r3, r0
f000da44:	e1a02003 	mov	r2, r3
f000da48:	e51b300c 	ldr	r3, [fp, #-12]
f000da4c:	e5832000 	str	r2, [r3]
f000da50:	e51b300c 	ldr	r3, [fp, #-12]
f000da54:	e2833070 	add	r3, r3, #112	; 0x70
f000da58:	e1a00003 	mov	r0, r3
f000da5c:	ebffff1e 	bl	f000d6dc <link_init>
f000da60:	e51b300c 	ldr	r3, [fp, #-12]
f000da64:	e2833010 	add	r3, r3, #16
f000da68:	e1a00003 	mov	r0, r3
f000da6c:	ebfff640 	bl	f000b374 <init_address_space_list>
f000da70:	e51b300c 	ldr	r3, [fp, #-12]
f000da74:	e2833060 	add	r3, r3, #96	; 0x60
f000da78:	e1a00003 	mov	r0, r3
f000da7c:	ebfff0e4 	bl	f0009e14 <init_ktcb_list>
f000da80:	e51b300c 	ldr	r3, [fp, #-12]
f000da84:	e2833080 	add	r3, r3, #128	; 0x80
f000da88:	e1a00003 	mov	r0, r3
f000da8c:	eb003626 	bl	f001b32c <init_mutex_queue_head>
f000da90:	e51b300c 	ldr	r3, [fp, #-12]
f000da94:	e28330a0 	add	r3, r3, #160	; 0xa0
f000da98:	e1a00003 	mov	r0, r3
f000da9c:	ebffff7b 	bl	f000d890 <cap_list_init>
f000daa0:	e3a00034 	mov	r0, #52	; 0x34
f000daa4:	e3a01000 	mov	r1, #0
f000daa8:	ebfff7a3 	bl	f000b93c <alloc_bootmem>
f000daac:	e1a02000 	mov	r2, r0
f000dab0:	e51b300c 	ldr	r3, [fp, #-12]
f000dab4:	e58320ac 	str	r2, [r3, #172]	; 0xac
f000dab8:	e3a03000 	mov	r3, #0
f000dabc:	e50b3008 	str	r3, [fp, #-8]
f000dac0:	ea00000f 	b	f000db04 <container_alloc_init+0xe8>
f000dac4:	e51b300c 	ldr	r3, [fp, #-12]
f000dac8:	e59310ac 	ldr	r1, [r3, #172]	; 0xac
f000dacc:	e51b2008 	ldr	r2, [fp, #-8]
f000dad0:	e1a03002 	mov	r3, r2
f000dad4:	e1a03083 	lsl	r3, r3, #1
f000dad8:	e0833002 	add	r3, r3, r2
f000dadc:	e1a03103 	lsl	r3, r3, #2
f000dae0:	e0833002 	add	r3, r3, r2
f000dae4:	e1a03103 	lsl	r3, r3, #2
f000dae8:	e0813003 	add	r3, r1, r3
f000daec:	e2833018 	add	r3, r3, #24
f000daf0:	e1a00003 	mov	r0, r3
f000daf4:	ebffff65 	bl	f000d890 <cap_list_init>
f000daf8:	e51b3008 	ldr	r3, [fp, #-8]
f000dafc:	e2833001 	add	r3, r3, #1
f000db00:	e50b3008 	str	r3, [fp, #-8]
f000db04:	e51b3008 	ldr	r3, [fp, #-8]
f000db08:	e3530000 	cmp	r3, #0
f000db0c:	daffffec 	ble	f000dac4 <container_alloc_init+0xa8>
f000db10:	e51b300c 	ldr	r3, [fp, #-12]
f000db14:	e1a00003 	mov	r0, r3
f000db18:	e24bd004 	sub	sp, fp, #4
f000db1c:	e8bd8800 	pop	{fp, pc}
f000db20:	f00300b0 	.word	0xf00300b0

f000db24 <kres_insert_container>:
f000db24:	e92d4800 	push	{fp, lr}
f000db28:	e28db004 	add	fp, sp, #4
f000db2c:	e24dd008 	sub	sp, sp, #8
f000db30:	e50b0008 	str	r0, [fp, #-8]
f000db34:	e50b100c 	str	r1, [fp, #-12]
f000db38:	e51b300c 	ldr	r3, [fp, #-12]
f000db3c:	e2833a06 	add	r3, r3, #24576	; 0x6000
f000db40:	e2833028 	add	r3, r3, #40	; 0x28
f000db44:	e1a00003 	mov	r0, r3
f000db48:	ebffff42 	bl	f000d858 <spin_lock>
f000db4c:	e51b3008 	ldr	r3, [fp, #-8]
f000db50:	e2832008 	add	r2, r3, #8
f000db54:	e51b300c 	ldr	r3, [fp, #-12]
f000db58:	e2833a06 	add	r3, r3, #24576	; 0x6000
f000db5c:	e2833020 	add	r3, r3, #32
f000db60:	e1a00002 	mov	r0, r2
f000db64:	e1a01003 	mov	r1, r3
f000db68:	ebfffee8 	bl	f000d710 <list_insert>
f000db6c:	e51b200c 	ldr	r2, [fp, #-12]
f000db70:	e59f302c 	ldr	r3, [pc, #44]	; f000dba4 <kres_insert_container+0x80>
f000db74:	e7923003 	ldr	r3, [r2, r3]
f000db78:	e2831001 	add	r1, r3, #1
f000db7c:	e51b200c 	ldr	r2, [fp, #-12]
f000db80:	e59f301c 	ldr	r3, [pc, #28]	; f000dba4 <kres_insert_container+0x80>
f000db84:	e7821003 	str	r1, [r2, r3]
f000db88:	e51b300c 	ldr	r3, [fp, #-12]
f000db8c:	e2833a06 	add	r3, r3, #24576	; 0x6000
f000db90:	e2833028 	add	r3, r3, #40	; 0x28
f000db94:	e1a00003 	mov	r0, r3
f000db98:	ebffff35 	bl	f000d874 <spin_unlock>
f000db9c:	e24bd004 	sub	sp, fp, #4
f000dba0:	e8bd8800 	pop	{fp, pc}
f000dba4:	0000601c 	.word	0x0000601c

f000dba8 <container_find>:
f000dba8:	e92d4800 	push	{fp, lr}
f000dbac:	e28db004 	add	fp, sp, #4
f000dbb0:	e24dd018 	sub	sp, sp, #24
f000dbb4:	e50b0018 	str	r0, [fp, #-24]
f000dbb8:	e50b101c 	str	r1, [fp, #-28]
f000dbbc:	e51b3018 	ldr	r3, [fp, #-24]
f000dbc0:	e2833a06 	add	r3, r3, #24576	; 0x6000
f000dbc4:	e2833028 	add	r3, r3, #40	; 0x28
f000dbc8:	e1a00003 	mov	r0, r3
f000dbcc:	ebffff21 	bl	f000d858 <spin_lock>
f000dbd0:	e51b2018 	ldr	r2, [fp, #-24]
f000dbd4:	e59f309c 	ldr	r3, [pc, #156]	; f000dc78 <container_find+0xd0>
f000dbd8:	e7923003 	ldr	r3, [r2, r3]
f000dbdc:	e50b300c 	str	r3, [fp, #-12]
f000dbe0:	e51b300c 	ldr	r3, [fp, #-12]
f000dbe4:	e2433008 	sub	r3, r3, #8
f000dbe8:	e50b3008 	str	r3, [fp, #-8]
f000dbec:	ea000011 	b	f000dc38 <container_find+0x90>
f000dbf0:	e51b3008 	ldr	r3, [fp, #-8]
f000dbf4:	e5932000 	ldr	r2, [r3]
f000dbf8:	e51b301c 	ldr	r3, [fp, #-28]
f000dbfc:	e1520003 	cmp	r2, r3
f000dc00:	1a000006 	bne	f000dc20 <container_find+0x78>
f000dc04:	e51b3018 	ldr	r3, [fp, #-24]
f000dc08:	e2833a06 	add	r3, r3, #24576	; 0x6000
f000dc0c:	e2833028 	add	r3, r3, #40	; 0x28
f000dc10:	e1a00003 	mov	r0, r3
f000dc14:	ebffff16 	bl	f000d874 <spin_unlock>
f000dc18:	e51b3008 	ldr	r3, [fp, #-8]
f000dc1c:	ea000012 	b	f000dc6c <container_find+0xc4>
f000dc20:	e51b3008 	ldr	r3, [fp, #-8]
f000dc24:	e5933008 	ldr	r3, [r3, #8]
f000dc28:	e50b3010 	str	r3, [fp, #-16]
f000dc2c:	e51b3010 	ldr	r3, [fp, #-16]
f000dc30:	e2433008 	sub	r3, r3, #8
f000dc34:	e50b3008 	str	r3, [fp, #-8]
f000dc38:	e51b3008 	ldr	r3, [fp, #-8]
f000dc3c:	e2832008 	add	r2, r3, #8
f000dc40:	e51b3018 	ldr	r3, [fp, #-24]
f000dc44:	e2833a06 	add	r3, r3, #24576	; 0x6000
f000dc48:	e2833020 	add	r3, r3, #32
f000dc4c:	e1520003 	cmp	r2, r3
f000dc50:	1affffe6 	bne	f000dbf0 <container_find+0x48>
f000dc54:	e51b3018 	ldr	r3, [fp, #-24]
f000dc58:	e2833a06 	add	r3, r3, #24576	; 0x6000
f000dc5c:	e2833028 	add	r3, r3, #40	; 0x28
f000dc60:	e1a00003 	mov	r0, r3
f000dc64:	ebffff02 	bl	f000d874 <spin_unlock>
f000dc68:	e3a03000 	mov	r3, #0
f000dc6c:	e1a00003 	mov	r0, r3
f000dc70:	e24bd004 	sub	sp, fp, #4
f000dc74:	e8bd8800 	pop	{fp, pc}
f000dc78:	00006020 	.word	0x00006020

f000dc7c <map_pager_sections>:
f000dc7c:	e92d4800 	push	{fp, lr}
f000dc80:	e28db004 	add	fp, sp, #4
f000dc84:	e24dd028 	sub	sp, sp, #40	; 0x28
f000dc88:	e50b0010 	str	r0, [fp, #-16]
f000dc8c:	e50b1014 	str	r1, [fp, #-20]
f000dc90:	e50b2018 	str	r2, [fp, #-24]
f000dc94:	e3a03000 	mov	r3, #0
f000dc98:	e50b3008 	str	r3, [fp, #-8]
f000dc9c:	e3a03000 	mov	r3, #0
f000dca0:	e50b300c 	str	r3, [fp, #-12]
f000dca4:	e51b3010 	ldr	r3, [fp, #-16]
f000dca8:	e5933030 	ldr	r3, [r3, #48]	; 0x30
f000dcac:	e2833eff 	add	r3, r3, #4080	; 0xff0
f000dcb0:	e283300f 	add	r3, r3, #15
f000dcb4:	e3c33eff 	bic	r3, r3, #4080	; 0xff0
f000dcb8:	e3c3300f 	bic	r3, r3, #15
f000dcbc:	e51b2010 	ldr	r2, [fp, #-16]
f000dcc0:	e592202c 	ldr	r2, [r2, #44]	; 0x2c
f000dcc4:	e0623003 	rsb	r3, r2, r3
f000dcc8:	e50b3008 	str	r3, [fp, #-8]
f000dccc:	e51b3008 	ldr	r3, [fp, #-8]
f000dcd0:	e3530a01 	cmp	r3, #4096	; 0x1000
f000dcd4:	3a000023 	bcc	f000dd68 <map_pager_sections+0xec>
f000dcd8:	e51b3010 	ldr	r3, [fp, #-16]
f000dcdc:	e593202c 	ldr	r2, [r3, #44]	; 0x2c
f000dce0:	e51b3010 	ldr	r3, [fp, #-16]
f000dce4:	e5933008 	ldr	r3, [r3, #8]
f000dce8:	e0632002 	rsb	r2, r3, r2
f000dcec:	e51b3010 	ldr	r3, [fp, #-16]
f000dcf0:	e5933004 	ldr	r3, [r3, #4]
f000dcf4:	e0823003 	add	r3, r2, r3
f000dcf8:	e51b2010 	ldr	r2, [fp, #-16]
f000dcfc:	e592102c 	ldr	r1, [r2, #44]	; 0x2c
f000dd00:	e51b2014 	ldr	r2, [fp, #-20]
f000dd04:	e2822020 	add	r2, r2, #32
f000dd08:	e58d1000 	str	r1, [sp]
f000dd0c:	e58d2004 	str	r2, [sp, #4]
f000dd10:	e59f01c8 	ldr	r0, [pc, #456]	; f000dee0 <map_pager_sections+0x264>
f000dd14:	e59f11c8 	ldr	r1, [pc, #456]	; f000dee4 <map_pager_sections+0x268>
f000dd18:	e51b2008 	ldr	r2, [fp, #-8]
f000dd1c:	eb002072 	bl	f0015eec <printk>
f000dd20:	e51b3010 	ldr	r3, [fp, #-16]
f000dd24:	e593202c 	ldr	r2, [r3, #44]	; 0x2c
f000dd28:	e51b3010 	ldr	r3, [fp, #-16]
f000dd2c:	e5933008 	ldr	r3, [r3, #8]
f000dd30:	e0632002 	rsb	r2, r3, r2
f000dd34:	e51b3010 	ldr	r3, [fp, #-16]
f000dd38:	e5933004 	ldr	r3, [r3, #4]
f000dd3c:	e0822003 	add	r2, r2, r3
f000dd40:	e51b3010 	ldr	r3, [fp, #-16]
f000dd44:	e593302c 	ldr	r3, [r3, #44]	; 0x2c
f000dd48:	e51b1018 	ldr	r1, [fp, #-24]
f000dd4c:	e59110b4 	ldr	r1, [r1, #180]	; 0xb4
f000dd50:	e58d1000 	str	r1, [sp]
f000dd54:	e1a00002 	mov	r0, r2
f000dd58:	e1a01003 	mov	r1, r3
f000dd5c:	e51b2008 	ldr	r2, [fp, #-8]
f000dd60:	e3a03008 	mov	r3, #8
f000dd64:	eb00148b 	bl	f0012f98 <add_mapping_space>
f000dd68:	e51b3010 	ldr	r3, [fp, #-16]
f000dd6c:	e5933028 	ldr	r3, [r3, #40]	; 0x28
f000dd70:	e2833eff 	add	r3, r3, #4080	; 0xff0
f000dd74:	e283300f 	add	r3, r3, #15
f000dd78:	e3c33eff 	bic	r3, r3, #4080	; 0xff0
f000dd7c:	e3c3300f 	bic	r3, r3, #15
f000dd80:	e51b2010 	ldr	r2, [fp, #-16]
f000dd84:	e5922024 	ldr	r2, [r2, #36]	; 0x24
f000dd88:	e0623003 	rsb	r3, r2, r3
f000dd8c:	e50b300c 	str	r3, [fp, #-12]
f000dd90:	e51b300c 	ldr	r3, [fp, #-12]
f000dd94:	e3530a01 	cmp	r3, #4096	; 0x1000
f000dd98:	3a000023 	bcc	f000de2c <map_pager_sections+0x1b0>
f000dd9c:	e51b3010 	ldr	r3, [fp, #-16]
f000dda0:	e5932024 	ldr	r2, [r3, #36]	; 0x24
f000dda4:	e51b3010 	ldr	r3, [fp, #-16]
f000dda8:	e5933008 	ldr	r3, [r3, #8]
f000ddac:	e0632002 	rsb	r2, r3, r2
f000ddb0:	e51b3010 	ldr	r3, [fp, #-16]
f000ddb4:	e5933004 	ldr	r3, [r3, #4]
f000ddb8:	e0823003 	add	r3, r2, r3
f000ddbc:	e51b2010 	ldr	r2, [fp, #-16]
f000ddc0:	e5921024 	ldr	r1, [r2, #36]	; 0x24
f000ddc4:	e51b2014 	ldr	r2, [fp, #-20]
f000ddc8:	e2822020 	add	r2, r2, #32
f000ddcc:	e58d1000 	str	r1, [sp]
f000ddd0:	e58d2004 	str	r2, [sp, #4]
f000ddd4:	e59f010c 	ldr	r0, [pc, #268]	; f000dee8 <map_pager_sections+0x26c>
f000ddd8:	e59f1104 	ldr	r1, [pc, #260]	; f000dee4 <map_pager_sections+0x268>
f000dddc:	e51b200c 	ldr	r2, [fp, #-12]
f000dde0:	eb002041 	bl	f0015eec <printk>
f000dde4:	e51b3010 	ldr	r3, [fp, #-16]
f000dde8:	e5932024 	ldr	r2, [r3, #36]	; 0x24
f000ddec:	e51b3010 	ldr	r3, [fp, #-16]
f000ddf0:	e5933008 	ldr	r3, [r3, #8]
f000ddf4:	e0632002 	rsb	r2, r3, r2
f000ddf8:	e51b3010 	ldr	r3, [fp, #-16]
f000ddfc:	e5933004 	ldr	r3, [r3, #4]
f000de00:	e0822003 	add	r2, r2, r3
f000de04:	e51b3010 	ldr	r3, [fp, #-16]
f000de08:	e5933024 	ldr	r3, [r3, #36]	; 0x24
f000de0c:	e51b1018 	ldr	r1, [fp, #-24]
f000de10:	e59110b4 	ldr	r1, [r1, #180]	; 0xb4
f000de14:	e58d1000 	str	r1, [sp]
f000de18:	e1a00002 	mov	r0, r2
f000de1c:	e1a01003 	mov	r1, r3
f000de20:	e51b200c 	ldr	r2, [fp, #-12]
f000de24:	e3a03001 	mov	r3, #1
f000de28:	eb00145a 	bl	f0012f98 <add_mapping_space>
f000de2c:	e51b3008 	ldr	r3, [fp, #-8]
f000de30:	e3530000 	cmp	r3, #0
f000de34:	1a000027 	bne	f000ded8 <map_pager_sections+0x25c>
f000de38:	e51b300c 	ldr	r3, [fp, #-12]
f000de3c:	e3530000 	cmp	r3, #0
f000de40:	1a000024 	bne	f000ded8 <map_pager_sections+0x25c>
f000de44:	e51b3010 	ldr	r3, [fp, #-16]
f000de48:	e5932014 	ldr	r2, [r3, #20]
f000de4c:	e51b3010 	ldr	r3, [fp, #-16]
f000de50:	e5933014 	ldr	r3, [r3, #20]
f000de54:	e2833eff 	add	r3, r3, #4080	; 0xff0
f000de58:	e283300f 	add	r3, r3, #15
f000de5c:	e1a03623 	lsr	r3, r3, #12
f000de60:	e51b1010 	ldr	r1, [fp, #-16]
f000de64:	e591c004 	ldr	ip, [r1, #4]
f000de68:	e51b1010 	ldr	r1, [fp, #-16]
f000de6c:	e5910008 	ldr	r0, [r1, #8]
f000de70:	e51b1014 	ldr	r1, [fp, #-20]
f000de74:	e2811020 	add	r1, r1, #32
f000de78:	e58dc000 	str	ip, [sp]
f000de7c:	e58d0004 	str	r0, [sp, #4]
f000de80:	e58d1008 	str	r1, [sp, #8]
f000de84:	e59f0060 	ldr	r0, [pc, #96]	; f000deec <map_pager_sections+0x270>
f000de88:	e59f1054 	ldr	r1, [pc, #84]	; f000dee4 <map_pager_sections+0x268>
f000de8c:	eb002016 	bl	f0015eec <printk>
f000de90:	e51b3010 	ldr	r3, [fp, #-16]
f000de94:	e5931004 	ldr	r1, [r3, #4]
f000de98:	e51b3010 	ldr	r3, [fp, #-16]
f000de9c:	e5932008 	ldr	r2, [r3, #8]
f000dea0:	e51b3010 	ldr	r3, [fp, #-16]
f000dea4:	e5933014 	ldr	r3, [r3, #20]
f000dea8:	e2833eff 	add	r3, r3, #4080	; 0xff0
f000deac:	e283300f 	add	r3, r3, #15
f000deb0:	e3c33eff 	bic	r3, r3, #4080	; 0xff0
f000deb4:	e3c3300f 	bic	r3, r3, #15
f000deb8:	e51b0018 	ldr	r0, [fp, #-24]
f000debc:	e59000b4 	ldr	r0, [r0, #180]	; 0xb4
f000dec0:	e58d0000 	str	r0, [sp]
f000dec4:	e1a00001 	mov	r0, r1
f000dec8:	e1a01002 	mov	r1, r2
f000decc:	e1a02003 	mov	r2, r3
f000ded0:	e3a03006 	mov	r3, #6
f000ded4:	eb00142f 	bl	f0012f98 <add_mapping_space>
f000ded8:	e24bd004 	sub	sp, fp, #4
f000dedc:	e8bd8800 	pop	{fp, pc}
f000dee0:	f001e7b0 	.word	0xf001e7b0
f000dee4:	f001e7fc 	.word	0xf001e7fc
f000dee8:	f001e804 	.word	0xf001e804
f000deec:	f001e850 	.word	0xf001e850

f000def0 <init_pager>:
f000def0:	e92d4810 	push	{r4, fp, lr}
f000def4:	e28db008 	add	fp, sp, #8
f000def8:	e24dd014 	sub	sp, sp, #20
f000defc:	e50b0018 	str	r0, [fp, #-24]
f000df00:	e50b101c 	str	r1, [fp, #-28]
f000df04:	ebfffebb 	bl	f000d9f8 <current_task>
f000df08:	e1a03000 	mov	r3, r0
f000df0c:	e59330b4 	ldr	r3, [r3, #180]	; 0xb4
f000df10:	e2832014 	add	r2, r3, #20
f000df14:	e51b3018 	ldr	r3, [fp, #-24]
f000df18:	e2833018 	add	r3, r3, #24
f000df1c:	e1a00002 	mov	r0, r2
f000df20:	e1a01003 	mov	r1, r3
f000df24:	ebfffea1 	bl	f000d9b0 <cap_list_move>
f000df28:	ebfffeb2 	bl	f000d9f8 <current_task>
f000df2c:	e1a03000 	mov	r3, r0
f000df30:	e51b201c 	ldr	r2, [fp, #-28]
f000df34:	e58320b8 	str	r2, [r3, #184]	; 0xb8
f000df38:	e51b301c 	ldr	r3, [fp, #-28]
f000df3c:	e5933000 	ldr	r3, [r3]
f000df40:	e1a00003 	mov	r0, r3
f000df44:	ebffefe8 	bl	f0009eec <tcb_alloc_init>
f000df48:	e50b0010 	str	r0, [fp, #-16]
f000df4c:	e3a00000 	mov	r0, #0
f000df50:	ebfff5dd 	bl	f000b6cc <address_space_create>
f000df54:	e50b0014 	str	r0, [fp, #-20]
f000df58:	e51b0010 	ldr	r0, [fp, #-16]
f000df5c:	e51b1014 	ldr	r1, [fp, #-20]
f000df60:	ebfff514 	bl	f000b3b8 <address_space_attach>
f000df64:	e51b3018 	ldr	r3, [fp, #-24]
f000df68:	e593300c 	ldr	r3, [r3, #12]
f000df6c:	e51b0010 	ldr	r0, [fp, #-16]
f000df70:	e1a01003 	mov	r1, r3
f000df74:	eb000883 	bl	f0010188 <task_init_registers>
f000df78:	e51b3010 	ldr	r3, [fp, #-16]
f000df7c:	e51b2010 	ldr	r2, [fp, #-16]
f000df80:	e58320bc 	str	r2, [r3, #188]	; 0xbc
f000df84:	e51b3010 	ldr	r3, [fp, #-16]
f000df88:	e5932054 	ldr	r2, [r3, #84]	; 0x54
f000df8c:	e51b3010 	ldr	r3, [fp, #-16]
f000df90:	e5832058 	str	r2, [r3, #88]	; 0x58
f000df94:	e51b3010 	ldr	r3, [fp, #-16]
f000df98:	e51b201c 	ldr	r2, [fp, #-28]
f000df9c:	e58320b8 	str	r2, [r3, #184]	; 0xb8
f000dfa0:	e51b0010 	ldr	r0, [fp, #-16]
f000dfa4:	eb002d10 	bl	f00193ec <thread_setup_affinity>
f000dfa8:	e51b3010 	ldr	r3, [fp, #-16]
f000dfac:	e59330b4 	ldr	r3, [r3, #180]	; 0xb4
f000dfb0:	e1a00003 	mov	r0, r3
f000dfb4:	ebfff535 	bl	f000b490 <address_space_add>
f000dfb8:	e51b0018 	ldr	r0, [fp, #-24]
f000dfbc:	e51b101c 	ldr	r1, [fp, #-28]
f000dfc0:	e51b2010 	ldr	r2, [fp, #-16]
f000dfc4:	ebffff2c 	bl	f000dc7c <map_pager_sections>
f000dfc8:	e51b3010 	ldr	r3, [fp, #-16]
f000dfcc:	e59330b4 	ldr	r3, [r3, #180]	; 0xb4
f000dfd0:	e2834014 	add	r4, r3, #20
f000dfd4:	ebfffe87 	bl	f000d9f8 <current_task>
f000dfd8:	e1a03000 	mov	r3, r0
f000dfdc:	e59330b4 	ldr	r3, [r3, #180]	; 0xb4
f000dfe0:	e2833014 	add	r3, r3, #20
f000dfe4:	e1a00004 	mov	r0, r4
f000dfe8:	e1a01003 	mov	r1, r3
f000dfec:	ebfffe6f 	bl	f000d9b0 <cap_list_move>
f000dff0:	e51b0010 	ldr	r0, [fp, #-16]
f000dff4:	e3a01008 	mov	r1, #8
f000dff8:	ebffeb69 	bl	f0008da4 <sched_init_task>
f000dffc:	e51b3010 	ldr	r3, [fp, #-16]
f000e000:	e3a02001 	mov	r2, #1
f000e004:	e583209c 	str	r2, [r3, #156]	; 0x9c
f000e008:	e51b0010 	ldr	r0, [fp, #-16]
f000e00c:	ebffeb9f 	bl	f0008e90 <sched_resume_async>
f000e010:	e51b0010 	ldr	r0, [fp, #-16]
f000e014:	ebfff2f8 	bl	f000abfc <tcb_add>
f000e018:	e3a03000 	mov	r3, #0
f000e01c:	e1a00003 	mov	r0, r3
f000e020:	e24bd008 	sub	sp, fp, #8
f000e024:	e8bd8810 	pop	{r4, fp, pc}

f000e028 <update_dynamic_capids>:
f000e028:	e92d4800 	push	{fp, lr}
f000e02c:	e28db004 	add	fp, sp, #4
f000e030:	e24dd038 	sub	sp, sp, #56	; 0x38
f000e034:	e50b0038 	str	r0, [fp, #-56]	; 0x38
f000e038:	e51b2038 	ldr	r2, [fp, #-56]	; 0x38
f000e03c:	e59f3218 	ldr	r3, [pc, #536]	; f000e25c <update_dynamic_capids+0x234>
f000e040:	e7923003 	ldr	r3, [r2, r3]
f000e044:	e50b3014 	str	r3, [fp, #-20]
f000e048:	e51b3014 	ldr	r3, [fp, #-20]
f000e04c:	e2433008 	sub	r3, r3, #8
f000e050:	e50b300c 	str	r3, [fp, #-12]
f000e054:	ea000075 	b	f000e230 <update_dynamic_capids+0x208>
f000e058:	e51b300c 	ldr	r3, [fp, #-12]
f000e05c:	e5933060 	ldr	r3, [r3, #96]	; 0x60
f000e060:	e50b3018 	str	r3, [fp, #-24]
f000e064:	e51b3018 	ldr	r3, [fp, #-24]
f000e068:	e2433088 	sub	r3, r3, #136	; 0x88
f000e06c:	e50b3008 	str	r3, [fp, #-8]
f000e070:	ea000062 	b	f000e200 <update_dynamic_capids+0x1d8>
f000e074:	e51b3008 	ldr	r3, [fp, #-8]
f000e078:	e59330b4 	ldr	r3, [r3, #180]	; 0xb4
f000e07c:	e5933018 	ldr	r3, [r3, #24]
f000e080:	e50b301c 	str	r3, [fp, #-28]
f000e084:	e51b301c 	ldr	r3, [fp, #-28]
f000e088:	e50b3010 	str	r3, [fp, #-16]
f000e08c:	ea00004f 	b	f000e1d0 <update_dynamic_capids+0x1a8>
f000e090:	e51b3008 	ldr	r3, [fp, #-8]
f000e094:	e5932054 	ldr	r2, [r3, #84]	; 0x54
f000e098:	e51b3010 	ldr	r3, [fp, #-16]
f000e09c:	e583200c 	str	r2, [r3, #12]
f000e0a0:	e51b3010 	ldr	r3, [fp, #-16]
f000e0a4:	e5933014 	ldr	r3, [r3, #20]
f000e0a8:	e1a03803 	lsl	r3, r3, #16
f000e0ac:	e1a03823 	lsr	r3, r3, #16
f000e0b0:	e3530080 	cmp	r3, #128	; 0x80
f000e0b4:	1a000002 	bne	f000e0c4 <update_dynamic_capids+0x9c>
f000e0b8:	e51b3010 	ldr	r3, [fp, #-16]
f000e0bc:	e3e02000 	mvn	r2, #0
f000e0c0:	e5832010 	str	r2, [r3, #16]
f000e0c4:	e51b3010 	ldr	r3, [fp, #-16]
f000e0c8:	e5933014 	ldr	r3, [r3, #20]
f000e0cc:	e1a03823 	lsr	r3, r3, #16
f000e0d0:	e1a03803 	lsl	r3, r3, #16
f000e0d4:	e3530802 	cmp	r3, #131072	; 0x20000
f000e0d8:	1a000004 	bne	f000e0f0 <update_dynamic_capids+0xc8>
f000e0dc:	e51b3008 	ldr	r3, [fp, #-8]
f000e0e0:	e59330b4 	ldr	r3, [r3, #180]	; 0xb4
f000e0e4:	e5932000 	ldr	r2, [r3]
f000e0e8:	e51b3010 	ldr	r3, [fp, #-16]
f000e0ec:	e5832010 	str	r2, [r3, #16]
f000e0f0:	e51b3010 	ldr	r3, [fp, #-16]
f000e0f4:	e5933014 	ldr	r3, [r3, #20]
f000e0f8:	e1a03823 	lsr	r3, r3, #16
f000e0fc:	e1a03803 	lsl	r3, r3, #16
f000e100:	e3530801 	cmp	r3, #65536	; 0x10000
f000e104:	1a00002c 	bne	f000e1bc <update_dynamic_capids+0x194>
f000e108:	e51b3010 	ldr	r3, [fp, #-16]
f000e10c:	e5933010 	ldr	r3, [r3, #16]
f000e110:	e51b0038 	ldr	r0, [fp, #-56]	; 0x38
f000e114:	e1a01003 	mov	r1, r3
f000e118:	ebfffea2 	bl	f000dba8 <container_find>
f000e11c:	e50b0020 	str	r0, [fp, #-32]
f000e120:	e51b3020 	ldr	r3, [fp, #-32]
f000e124:	e3530000 	cmp	r3, #0
f000e128:	1a000007 	bne	f000e14c <update_dynamic_capids+0x124>
f000e12c:	e59f012c 	ldr	r0, [pc, #300]	; f000e260 <update_dynamic_capids+0x238>
f000e130:	eb001f6d 	bl	f0015eec <printk>
f000e134:	e59f0128 	ldr	r0, [pc, #296]	; f000e264 <update_dynamic_capids+0x23c>
f000e138:	e59f1128 	ldr	r1, [pc, #296]	; f000e268 <update_dynamic_capids+0x240>
f000e13c:	e59f2128 	ldr	r2, [pc, #296]	; f000e26c <update_dynamic_capids+0x244>
f000e140:	e3a030fd 	mov	r3, #253	; 0xfd
f000e144:	eb001f68 	bl	f0015eec <printk>
f000e148:	eafffffe 	b	f000e148 <update_dynamic_capids+0x120>
f000e14c:	e51b3020 	ldr	r3, [fp, #-32]
f000e150:	e2833060 	add	r3, r3, #96	; 0x60
f000e154:	e1a00003 	mov	r0, r3
f000e158:	ebfffda9 	bl	f000d804 <list_empty>
f000e15c:	e1a03000 	mov	r3, r0
f000e160:	e3530000 	cmp	r3, #0
f000e164:	0a00000a 	beq	f000e194 <update_dynamic_capids+0x16c>
f000e168:	e51b3020 	ldr	r3, [fp, #-32]
f000e16c:	e5933000 	ldr	r3, [r3]
f000e170:	e59f00f8 	ldr	r0, [pc, #248]	; f000e270 <update_dynamic_capids+0x248>
f000e174:	e1a01003 	mov	r1, r3
f000e178:	eb001f5b 	bl	f0015eec <printk>
f000e17c:	e59f00e0 	ldr	r0, [pc, #224]	; f000e264 <update_dynamic_capids+0x23c>
f000e180:	e59f10e0 	ldr	r1, [pc, #224]	; f000e268 <update_dynamic_capids+0x240>
f000e184:	e59f20e0 	ldr	r2, [pc, #224]	; f000e26c <update_dynamic_capids+0x244>
f000e188:	e59f30e4 	ldr	r3, [pc, #228]	; f000e274 <update_dynamic_capids+0x24c>
f000e18c:	eb001f56 	bl	f0015eec <printk>
f000e190:	eafffffe 	b	f000e190 <update_dynamic_capids+0x168>
f000e194:	e51b3020 	ldr	r3, [fp, #-32]
f000e198:	e5933060 	ldr	r3, [r3, #96]	; 0x60
f000e19c:	e50b3024 	str	r3, [fp, #-36]	; 0x24
f000e1a0:	e51b3024 	ldr	r3, [fp, #-36]	; 0x24
f000e1a4:	e2433088 	sub	r3, r3, #136	; 0x88
f000e1a8:	e50b3028 	str	r3, [fp, #-40]	; 0x28
f000e1ac:	e51b3028 	ldr	r3, [fp, #-40]	; 0x28
f000e1b0:	e5932054 	ldr	r2, [r3, #84]	; 0x54
f000e1b4:	e51b3010 	ldr	r3, [fp, #-16]
f000e1b8:	e5832010 	str	r2, [r3, #16]
f000e1bc:	e51b3010 	ldr	r3, [fp, #-16]
f000e1c0:	e5933000 	ldr	r3, [r3]
f000e1c4:	e50b302c 	str	r3, [fp, #-44]	; 0x2c
f000e1c8:	e51b302c 	ldr	r3, [fp, #-44]	; 0x2c
f000e1cc:	e50b3010 	str	r3, [fp, #-16]
f000e1d0:	e51b2010 	ldr	r2, [fp, #-16]
f000e1d4:	e51b3008 	ldr	r3, [fp, #-8]
f000e1d8:	e59330b4 	ldr	r3, [r3, #180]	; 0xb4
f000e1dc:	e2833018 	add	r3, r3, #24
f000e1e0:	e1520003 	cmp	r2, r3
f000e1e4:	1affffa9 	bne	f000e090 <update_dynamic_capids+0x68>
f000e1e8:	e51b3008 	ldr	r3, [fp, #-8]
f000e1ec:	e5933088 	ldr	r3, [r3, #136]	; 0x88
f000e1f0:	e50b3030 	str	r3, [fp, #-48]	; 0x30
f000e1f4:	e51b3030 	ldr	r3, [fp, #-48]	; 0x30
f000e1f8:	e2433088 	sub	r3, r3, #136	; 0x88
f000e1fc:	e50b3008 	str	r3, [fp, #-8]
f000e200:	e51b3008 	ldr	r3, [fp, #-8]
f000e204:	e2832088 	add	r2, r3, #136	; 0x88
f000e208:	e51b300c 	ldr	r3, [fp, #-12]
f000e20c:	e2833060 	add	r3, r3, #96	; 0x60
f000e210:	e1520003 	cmp	r2, r3
f000e214:	1affff96 	bne	f000e074 <update_dynamic_capids+0x4c>
f000e218:	e51b300c 	ldr	r3, [fp, #-12]
f000e21c:	e5933008 	ldr	r3, [r3, #8]
f000e220:	e50b3034 	str	r3, [fp, #-52]	; 0x34
f000e224:	e51b3034 	ldr	r3, [fp, #-52]	; 0x34
f000e228:	e2433008 	sub	r3, r3, #8
f000e22c:	e50b300c 	str	r3, [fp, #-12]
f000e230:	e51b300c 	ldr	r3, [fp, #-12]
f000e234:	e2832008 	add	r2, r3, #8
f000e238:	e51b3038 	ldr	r3, [fp, #-56]	; 0x38
f000e23c:	e2833a06 	add	r3, r3, #24576	; 0x6000
f000e240:	e2833020 	add	r3, r3, #32
f000e244:	e1520003 	cmp	r2, r3
f000e248:	1affff82 	bne	f000e058 <update_dynamic_capids+0x30>
f000e24c:	e3a03000 	mov	r3, #0
f000e250:	e1a00003 	mov	r0, r3
f000e254:	e24bd004 	sub	sp, fp, #4
f000e258:	e8bd8800 	pop	{fp, pc}
f000e25c:	00006020 	.word	0x00006020
f000e260:	f001e890 	.word	0xf001e890
f000e264:	f001e8d0 	.word	0xf001e8d0
f000e268:	f001e8f8 	.word	0xf001e8f8
f000e26c:	f001e940 	.word	0xf001e940
f000e270:	f001e910 	.word	0xf001e910
f000e274:	00000107 	.word	0x00000107

f000e278 <container_init_pagers>:
f000e278:	e92d4800 	push	{fp, lr}
f000e27c:	e28db004 	add	fp, sp, #4
f000e280:	e24dd020 	sub	sp, sp, #32
f000e284:	e50b0020 	str	r0, [fp, #-32]
f000e288:	e51b2020 	ldr	r2, [fp, #-32]
f000e28c:	e59f30c4 	ldr	r3, [pc, #196]	; f000e358 <container_init_pagers+0xe0>
f000e290:	e7923003 	ldr	r3, [r2, r3]
f000e294:	e50b3010 	str	r3, [fp, #-16]
f000e298:	e51b3010 	ldr	r3, [fp, #-16]
f000e29c:	e2433008 	sub	r3, r3, #8
f000e2a0:	e50b3008 	str	r3, [fp, #-8]
f000e2a4:	ea00001e 	b	f000e324 <container_init_pagers+0xac>
f000e2a8:	e3a03000 	mov	r3, #0
f000e2ac:	e50b300c 	str	r3, [fp, #-12]
f000e2b0:	ea000010 	b	f000e2f8 <container_init_pagers+0x80>
f000e2b4:	e51b3008 	ldr	r3, [fp, #-8]
f000e2b8:	e59310ac 	ldr	r1, [r3, #172]	; 0xac
f000e2bc:	e51b200c 	ldr	r2, [fp, #-12]
f000e2c0:	e1a03002 	mov	r3, r2
f000e2c4:	e1a03083 	lsl	r3, r3, #1
f000e2c8:	e0833002 	add	r3, r3, r2
f000e2cc:	e1a03103 	lsl	r3, r3, #2
f000e2d0:	e0833002 	add	r3, r3, r2
f000e2d4:	e1a03103 	lsl	r3, r3, #2
f000e2d8:	e0813003 	add	r3, r1, r3
f000e2dc:	e50b3014 	str	r3, [fp, #-20]
f000e2e0:	e51b0014 	ldr	r0, [fp, #-20]
f000e2e4:	e51b1008 	ldr	r1, [fp, #-8]
f000e2e8:	ebffff00 	bl	f000def0 <init_pager>
f000e2ec:	e51b300c 	ldr	r3, [fp, #-12]
f000e2f0:	e2833001 	add	r3, r3, #1
f000e2f4:	e50b300c 	str	r3, [fp, #-12]
f000e2f8:	e51b3008 	ldr	r3, [fp, #-8]
f000e2fc:	e5932004 	ldr	r2, [r3, #4]
f000e300:	e51b300c 	ldr	r3, [fp, #-12]
f000e304:	e1520003 	cmp	r2, r3
f000e308:	caffffe9 	bgt	f000e2b4 <container_init_pagers+0x3c>
f000e30c:	e51b3008 	ldr	r3, [fp, #-8]
f000e310:	e5933008 	ldr	r3, [r3, #8]
f000e314:	e50b3018 	str	r3, [fp, #-24]
f000e318:	e51b3018 	ldr	r3, [fp, #-24]
f000e31c:	e2433008 	sub	r3, r3, #8
f000e320:	e50b3008 	str	r3, [fp, #-8]
f000e324:	e51b3008 	ldr	r3, [fp, #-8]
f000e328:	e2832008 	add	r2, r3, #8
f000e32c:	e51b3020 	ldr	r3, [fp, #-32]
f000e330:	e2833a06 	add	r3, r3, #24576	; 0x6000
f000e334:	e2833020 	add	r3, r3, #32
f000e338:	e1520003 	cmp	r2, r3
f000e33c:	1affffd9 	bne	f000e2a8 <container_init_pagers+0x30>
f000e340:	e51b0020 	ldr	r0, [fp, #-32]
f000e344:	ebffff37 	bl	f000e028 <update_dynamic_capids>
f000e348:	e3a03000 	mov	r3, #0
f000e34c:	e1a00003 	mov	r0, r3
f000e350:	e24bd004 	sub	sp, fp, #4
f000e354:	e8bd8800 	pop	{fp, pc}
f000e358:	00006020 	.word	0x00006020

f000e35c <link_init>:
f000e35c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f000e360:	e28db000 	add	fp, sp, #0
f000e364:	e24dd00c 	sub	sp, sp, #12
f000e368:	e50b0008 	str	r0, [fp, #-8]
f000e36c:	e51b3008 	ldr	r3, [fp, #-8]
f000e370:	e51b2008 	ldr	r2, [fp, #-8]
f000e374:	e5832000 	str	r2, [r3]
f000e378:	e51b3008 	ldr	r3, [fp, #-8]
f000e37c:	e51b2008 	ldr	r2, [fp, #-8]
f000e380:	e5832004 	str	r2, [r3, #4]
f000e384:	e24bd000 	sub	sp, fp, #0
f000e388:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f000e38c:	e12fff1e 	bx	lr

f000e390 <current_task>:
f000e390:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f000e394:	e28db000 	add	fp, sp, #0
f000e398:	e1a0300d 	mov	r3, sp
f000e39c:	e3c33eff 	bic	r3, r3, #4080	; 0xff0
f000e3a0:	e3c3300f 	bic	r3, r3, #15
f000e3a4:	e1a00003 	mov	r0, r3
f000e3a8:	e24bd000 	sub	sp, fp, #0
f000e3ac:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f000e3b0:	e12fff1e 	bx	lr

f000e3b4 <ipc_flags_get_type>:
f000e3b4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f000e3b8:	e28db000 	add	fp, sp, #0
f000e3bc:	e24dd00c 	sub	sp, sp, #12
f000e3c0:	e50b0008 	str	r0, [fp, #-8]
f000e3c4:	e51b3008 	ldr	r3, [fp, #-8]
f000e3c8:	e203300f 	and	r3, r3, #15
f000e3cc:	e1a00003 	mov	r0, r3
f000e3d0:	e24bd000 	sub	sp, fp, #0
f000e3d4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f000e3d8:	e12fff1e 	bx	lr

f000e3dc <capability_init>:
f000e3dc:	e92d4800 	push	{fp, lr}
f000e3e0:	e28db004 	add	fp, sp, #4
f000e3e4:	e24dd008 	sub	sp, sp, #8
f000e3e8:	e50b0008 	str	r0, [fp, #-8]
f000e3ec:	e59f0024 	ldr	r0, [pc, #36]	; f000e418 <capability_init+0x3c>
f000e3f0:	eb0023ac 	bl	f00172a8 <id_new>
f000e3f4:	e1a03000 	mov	r3, r0
f000e3f8:	e1a02003 	mov	r2, r3
f000e3fc:	e51b3008 	ldr	r3, [fp, #-8]
f000e400:	e5832008 	str	r2, [r3, #8]
f000e404:	e51b3008 	ldr	r3, [fp, #-8]
f000e408:	e1a00003 	mov	r0, r3
f000e40c:	ebffffd2 	bl	f000e35c <link_init>
f000e410:	e24bd004 	sub	sp, fp, #4
f000e414:	e8bd8800 	pop	{fp, pc}
f000e418:	f00320b8 	.word	0xf00320b8

f000e41c <capability_consume>:
f000e41c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f000e420:	e28db000 	add	fp, sp, #0
f000e424:	e24dd00c 	sub	sp, sp, #12
f000e428:	e50b0008 	str	r0, [fp, #-8]
f000e42c:	e50b100c 	str	r1, [fp, #-12]
f000e430:	e51b3008 	ldr	r3, [fp, #-8]
f000e434:	e5932024 	ldr	r2, [r3, #36]	; 0x24
f000e438:	e51b3008 	ldr	r3, [fp, #-8]
f000e43c:	e5931028 	ldr	r1, [r3, #40]	; 0x28
f000e440:	e51b300c 	ldr	r3, [fp, #-12]
f000e444:	e0813003 	add	r3, r1, r3
f000e448:	e1520003 	cmp	r2, r3
f000e44c:	2a000001 	bcs	f000e458 <capability_consume+0x3c>
f000e450:	e3e03085 	mvn	r3, #133	; 0x85
f000e454:	ea000006 	b	f000e474 <capability_consume+0x58>
f000e458:	e51b3008 	ldr	r3, [fp, #-8]
f000e45c:	e5932028 	ldr	r2, [r3, #40]	; 0x28
f000e460:	e51b300c 	ldr	r3, [fp, #-12]
f000e464:	e0822003 	add	r2, r2, r3
f000e468:	e51b3008 	ldr	r3, [fp, #-8]
f000e46c:	e5832028 	str	r2, [r3, #40]	; 0x28
f000e470:	e3a03000 	mov	r3, #0
f000e474:	e1a00003 	mov	r0, r3
f000e478:	e24bd000 	sub	sp, fp, #0
f000e47c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f000e480:	e12fff1e 	bx	lr

f000e484 <capability_free>:
f000e484:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f000e488:	e28db000 	add	fp, sp, #0
f000e48c:	e24dd00c 	sub	sp, sp, #12
f000e490:	e50b0008 	str	r0, [fp, #-8]
f000e494:	e50b100c 	str	r1, [fp, #-12]
f000e498:	e51b3008 	ldr	r3, [fp, #-8]
f000e49c:	e5932028 	ldr	r2, [r3, #40]	; 0x28
f000e4a0:	e51b300c 	ldr	r3, [fp, #-12]
f000e4a4:	e0632002 	rsb	r2, r3, r2
f000e4a8:	e51b3008 	ldr	r3, [fp, #-8]
f000e4ac:	e5832028 	str	r2, [r3, #40]	; 0x28
f000e4b0:	e3a03000 	mov	r3, #0
f000e4b4:	e1a00003 	mov	r0, r3
f000e4b8:	e24bd000 	sub	sp, fp, #0
f000e4bc:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f000e4c0:	e12fff1e 	bx	lr

f000e4c4 <cap_list_find_by_rtype>:
f000e4c4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f000e4c8:	e28db000 	add	fp, sp, #0
f000e4cc:	e24dd01c 	sub	sp, sp, #28
f000e4d0:	e50b0018 	str	r0, [fp, #-24]
f000e4d4:	e50b101c 	str	r1, [fp, #-28]
f000e4d8:	e51b3018 	ldr	r3, [fp, #-24]
f000e4dc:	e5933004 	ldr	r3, [r3, #4]
f000e4e0:	e50b300c 	str	r3, [fp, #-12]
f000e4e4:	e51b300c 	ldr	r3, [fp, #-12]
f000e4e8:	e50b3008 	str	r3, [fp, #-8]
f000e4ec:	ea00000d 	b	f000e528 <cap_list_find_by_rtype+0x64>
f000e4f0:	e51b3008 	ldr	r3, [fp, #-8]
f000e4f4:	e5933014 	ldr	r3, [r3, #20]
f000e4f8:	e1a03823 	lsr	r3, r3, #16
f000e4fc:	e1a03803 	lsl	r3, r3, #16
f000e500:	e51b201c 	ldr	r2, [fp, #-28]
f000e504:	e1530002 	cmp	r3, r2
f000e508:	1a000001 	bne	f000e514 <cap_list_find_by_rtype+0x50>
f000e50c:	e51b3008 	ldr	r3, [fp, #-8]
f000e510:	ea00000a 	b	f000e540 <cap_list_find_by_rtype+0x7c>
f000e514:	e51b3008 	ldr	r3, [fp, #-8]
f000e518:	e5933000 	ldr	r3, [r3]
f000e51c:	e50b3010 	str	r3, [fp, #-16]
f000e520:	e51b3010 	ldr	r3, [fp, #-16]
f000e524:	e50b3008 	str	r3, [fp, #-8]
f000e528:	e51b2008 	ldr	r2, [fp, #-8]
f000e52c:	e51b3018 	ldr	r3, [fp, #-24]
f000e530:	e2833004 	add	r3, r3, #4
f000e534:	e1520003 	cmp	r2, r3
f000e538:	1affffec 	bne	f000e4f0 <cap_list_find_by_rtype+0x2c>
f000e53c:	e3a03000 	mov	r3, #0
f000e540:	e1a00003 	mov	r0, r3
f000e544:	e24bd000 	sub	sp, fp, #0
f000e548:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f000e54c:	e12fff1e 	bx	lr

f000e550 <cap_find_by_rtype>:
f000e550:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f000e554:	e28db000 	add	fp, sp, #0
f000e558:	e24dd024 	sub	sp, sp, #36	; 0x24
f000e55c:	e50b0020 	str	r0, [fp, #-32]
f000e560:	e50b1024 	str	r1, [fp, #-36]	; 0x24
f000e564:	e51b3020 	ldr	r3, [fp, #-32]
f000e568:	e59330b4 	ldr	r3, [r3, #180]	; 0xb4
f000e56c:	e5933018 	ldr	r3, [r3, #24]
f000e570:	e50b300c 	str	r3, [fp, #-12]
f000e574:	e51b300c 	ldr	r3, [fp, #-12]
f000e578:	e50b3008 	str	r3, [fp, #-8]
f000e57c:	ea00000d 	b	f000e5b8 <cap_find_by_rtype+0x68>
f000e580:	e51b3008 	ldr	r3, [fp, #-8]
f000e584:	e5933014 	ldr	r3, [r3, #20]
f000e588:	e1a03823 	lsr	r3, r3, #16
f000e58c:	e1a03803 	lsl	r3, r3, #16
f000e590:	e51b2024 	ldr	r2, [fp, #-36]	; 0x24
f000e594:	e1530002 	cmp	r3, r2
f000e598:	1a000001 	bne	f000e5a4 <cap_find_by_rtype+0x54>
f000e59c:	e51b3008 	ldr	r3, [fp, #-8]
f000e5a0:	ea000026 	b	f000e640 <cap_find_by_rtype+0xf0>
f000e5a4:	e51b3008 	ldr	r3, [fp, #-8]
f000e5a8:	e5933000 	ldr	r3, [r3]
f000e5ac:	e50b3010 	str	r3, [fp, #-16]
f000e5b0:	e51b3010 	ldr	r3, [fp, #-16]
f000e5b4:	e50b3008 	str	r3, [fp, #-8]
f000e5b8:	e51b2008 	ldr	r2, [fp, #-8]
f000e5bc:	e51b3020 	ldr	r3, [fp, #-32]
f000e5c0:	e59330b4 	ldr	r3, [r3, #180]	; 0xb4
f000e5c4:	e2833018 	add	r3, r3, #24
f000e5c8:	e1520003 	cmp	r2, r3
f000e5cc:	1affffeb 	bne	f000e580 <cap_find_by_rtype+0x30>
f000e5d0:	e51b3020 	ldr	r3, [fp, #-32]
f000e5d4:	e59330b8 	ldr	r3, [r3, #184]	; 0xb8
f000e5d8:	e59330a4 	ldr	r3, [r3, #164]	; 0xa4
f000e5dc:	e50b3014 	str	r3, [fp, #-20]
f000e5e0:	e51b3014 	ldr	r3, [fp, #-20]
f000e5e4:	e50b3008 	str	r3, [fp, #-8]
f000e5e8:	ea00000d 	b	f000e624 <cap_find_by_rtype+0xd4>
f000e5ec:	e51b3008 	ldr	r3, [fp, #-8]
f000e5f0:	e5933014 	ldr	r3, [r3, #20]
f000e5f4:	e1a03823 	lsr	r3, r3, #16
f000e5f8:	e1a03803 	lsl	r3, r3, #16
f000e5fc:	e51b2024 	ldr	r2, [fp, #-36]	; 0x24
f000e600:	e1530002 	cmp	r3, r2
f000e604:	1a000001 	bne	f000e610 <cap_find_by_rtype+0xc0>
f000e608:	e51b3008 	ldr	r3, [fp, #-8]
f000e60c:	ea00000b 	b	f000e640 <cap_find_by_rtype+0xf0>
f000e610:	e51b3008 	ldr	r3, [fp, #-8]
f000e614:	e5933000 	ldr	r3, [r3]
f000e618:	e50b3018 	str	r3, [fp, #-24]
f000e61c:	e51b3018 	ldr	r3, [fp, #-24]
f000e620:	e50b3008 	str	r3, [fp, #-8]
f000e624:	e51b2008 	ldr	r2, [fp, #-8]
f000e628:	e51b3020 	ldr	r3, [fp, #-32]
f000e62c:	e59330b8 	ldr	r3, [r3, #184]	; 0xb8
f000e630:	e28330a4 	add	r3, r3, #164	; 0xa4
f000e634:	e1520003 	cmp	r2, r3
f000e638:	1affffeb 	bne	f000e5ec <cap_find_by_rtype+0x9c>
f000e63c:	e3a03000 	mov	r3, #0
f000e640:	e1a00003 	mov	r0, r3
f000e644:	e24bd000 	sub	sp, fp, #0
f000e648:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f000e64c:	e12fff1e 	bx	lr

f000e650 <cap_count>:
f000e650:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f000e654:	e28db000 	add	fp, sp, #0
f000e658:	e24dd00c 	sub	sp, sp, #12
f000e65c:	e50b0008 	str	r0, [fp, #-8]
f000e660:	e51b3008 	ldr	r3, [fp, #-8]
f000e664:	e59330b4 	ldr	r3, [r3, #180]	; 0xb4
f000e668:	e5932014 	ldr	r2, [r3, #20]
f000e66c:	e51b3008 	ldr	r3, [fp, #-8]
f000e670:	e59330b8 	ldr	r3, [r3, #184]	; 0xb8
f000e674:	e59330a0 	ldr	r3, [r3, #160]	; 0xa0
f000e678:	e0823003 	add	r3, r2, r3
f000e67c:	e1a00003 	mov	r0, r3
f000e680:	e24bd000 	sub	sp, fp, #0
f000e684:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f000e688:	e12fff1e 	bx	lr

f000e68c <cap_find>:
f000e68c:	e92d4800 	push	{fp, lr}
f000e690:	e28db004 	add	fp, sp, #4
f000e694:	e24dd028 	sub	sp, sp, #40	; 0x28
f000e698:	e50b0020 	str	r0, [fp, #-32]
f000e69c:	e50b1024 	str	r1, [fp, #-36]	; 0x24
f000e6a0:	e50b2028 	str	r2, [fp, #-40]	; 0x28
f000e6a4:	e50b302c 	str	r3, [fp, #-44]	; 0x2c
f000e6a8:	e51b3020 	ldr	r3, [fp, #-32]
f000e6ac:	e59330b4 	ldr	r3, [r3, #180]	; 0xb4
f000e6b0:	e5933018 	ldr	r3, [r3, #24]
f000e6b4:	e50b300c 	str	r3, [fp, #-12]
f000e6b8:	e51b300c 	ldr	r3, [fp, #-12]
f000e6bc:	e50b3008 	str	r3, [fp, #-8]
f000e6c0:	ea000015 	b	f000e71c <cap_find+0x90>
f000e6c4:	e51b3008 	ldr	r3, [fp, #-8]
f000e6c8:	e5933014 	ldr	r3, [r3, #20]
f000e6cc:	e1a03803 	lsl	r3, r3, #16
f000e6d0:	e1a03823 	lsr	r3, r3, #16
f000e6d4:	e51b202c 	ldr	r2, [fp, #-44]	; 0x2c
f000e6d8:	e1530002 	cmp	r3, r2
f000e6dc:	1a000009 	bne	f000e708 <cap_find+0x7c>
f000e6e0:	e51b3024 	ldr	r3, [fp, #-36]	; 0x24
f000e6e4:	e51b0008 	ldr	r0, [fp, #-8]
f000e6e8:	e51b1028 	ldr	r1, [fp, #-40]	; 0x28
f000e6ec:	e12fff33 	blx	r3
f000e6f0:	e50b0010 	str	r0, [fp, #-16]
f000e6f4:	e51b3010 	ldr	r3, [fp, #-16]
f000e6f8:	e3530000 	cmp	r3, #0
f000e6fc:	0a000001 	beq	f000e708 <cap_find+0x7c>
f000e700:	e51b3010 	ldr	r3, [fp, #-16]
f000e704:	ea00002e 	b	f000e7c4 <cap_find+0x138>
f000e708:	e51b3008 	ldr	r3, [fp, #-8]
f000e70c:	e5933000 	ldr	r3, [r3]
f000e710:	e50b3014 	str	r3, [fp, #-20]
f000e714:	e51b3014 	ldr	r3, [fp, #-20]
f000e718:	e50b3008 	str	r3, [fp, #-8]
f000e71c:	e51b2008 	ldr	r2, [fp, #-8]
f000e720:	e51b3020 	ldr	r3, [fp, #-32]
f000e724:	e59330b4 	ldr	r3, [r3, #180]	; 0xb4
f000e728:	e2833018 	add	r3, r3, #24
f000e72c:	e1520003 	cmp	r2, r3
f000e730:	1affffe3 	bne	f000e6c4 <cap_find+0x38>
f000e734:	e51b3020 	ldr	r3, [fp, #-32]
f000e738:	e59330b8 	ldr	r3, [r3, #184]	; 0xb8
f000e73c:	e59330a4 	ldr	r3, [r3, #164]	; 0xa4
f000e740:	e50b3018 	str	r3, [fp, #-24]
f000e744:	e51b3018 	ldr	r3, [fp, #-24]
f000e748:	e50b3008 	str	r3, [fp, #-8]
f000e74c:	ea000015 	b	f000e7a8 <cap_find+0x11c>
f000e750:	e51b3008 	ldr	r3, [fp, #-8]
f000e754:	e5933014 	ldr	r3, [r3, #20]
f000e758:	e1a03803 	lsl	r3, r3, #16
f000e75c:	e1a03823 	lsr	r3, r3, #16
f000e760:	e51b202c 	ldr	r2, [fp, #-44]	; 0x2c
f000e764:	e1530002 	cmp	r3, r2
f000e768:	1a000009 	bne	f000e794 <cap_find+0x108>
f000e76c:	e51b3024 	ldr	r3, [fp, #-36]	; 0x24
f000e770:	e51b0008 	ldr	r0, [fp, #-8]
f000e774:	e51b1028 	ldr	r1, [fp, #-40]	; 0x28
f000e778:	e12fff33 	blx	r3
f000e77c:	e50b0010 	str	r0, [fp, #-16]
f000e780:	e51b3010 	ldr	r3, [fp, #-16]
f000e784:	e3530000 	cmp	r3, #0
f000e788:	0a000001 	beq	f000e794 <cap_find+0x108>
f000e78c:	e51b3010 	ldr	r3, [fp, #-16]
f000e790:	ea00000b 	b	f000e7c4 <cap_find+0x138>
f000e794:	e51b3008 	ldr	r3, [fp, #-8]
f000e798:	e5933000 	ldr	r3, [r3]
f000e79c:	e50b301c 	str	r3, [fp, #-28]
f000e7a0:	e51b301c 	ldr	r3, [fp, #-28]
f000e7a4:	e50b3008 	str	r3, [fp, #-8]
f000e7a8:	e51b2008 	ldr	r2, [fp, #-8]
f000e7ac:	e51b3020 	ldr	r3, [fp, #-32]
f000e7b0:	e59330b8 	ldr	r3, [r3, #184]	; 0xb8
f000e7b4:	e28330a4 	add	r3, r3, #164	; 0xa4
f000e7b8:	e1520003 	cmp	r2, r3
f000e7bc:	1affffe3 	bne	f000e750 <cap_find+0xc4>
f000e7c0:	e3a03000 	mov	r3, #0
f000e7c4:	e1a00003 	mov	r0, r3
f000e7c8:	e24bd004 	sub	sp, fp, #4
f000e7cc:	e8bd8800 	pop	{fp, pc}

f000e7d0 <cap_match_ipc>:
f000e7d0:	e92d4800 	push	{fp, lr}
f000e7d4:	e28db004 	add	fp, sp, #4
f000e7d8:	e24dd010 	sub	sp, sp, #16
f000e7dc:	e50b0010 	str	r0, [fp, #-16]
f000e7e0:	e50b1014 	str	r1, [fp, #-20]
f000e7e4:	e51b3014 	ldr	r3, [fp, #-20]
f000e7e8:	e50b3008 	str	r3, [fp, #-8]
f000e7ec:	e51b3008 	ldr	r3, [fp, #-8]
f000e7f0:	e5933000 	ldr	r3, [r3]
f000e7f4:	e50b300c 	str	r3, [fp, #-12]
f000e7f8:	e51b3008 	ldr	r3, [fp, #-8]
f000e7fc:	e5933008 	ldr	r3, [r3, #8]
f000e800:	e3530001 	cmp	r3, #1
f000e804:	0a00000c 	beq	f000e83c <cap_match_ipc+0x6c>
f000e808:	e3530001 	cmp	r3, #1
f000e80c:	3a000002 	bcc	f000e81c <cap_match_ipc+0x4c>
f000e810:	e3530002 	cmp	r3, #2
f000e814:	0a000010 	beq	f000e85c <cap_match_ipc+0x8c>
f000e818:	ea000017 	b	f000e87c <cap_match_ipc+0xac>
f000e81c:	e51b3010 	ldr	r3, [fp, #-16]
f000e820:	e5933018 	ldr	r3, [r3, #24]
f000e824:	e2033004 	and	r3, r3, #4
f000e828:	e3530000 	cmp	r3, #0
f000e82c:	1a000001 	bne	f000e838 <cap_match_ipc+0x68>
f000e830:	e3a03000 	mov	r3, #0
f000e834:	ea00004c 	b	f000e96c <cap_match_ipc+0x19c>
f000e838:	ea000011 	b	f000e884 <cap_match_ipc+0xb4>
f000e83c:	e51b3010 	ldr	r3, [fp, #-16]
f000e840:	e5933018 	ldr	r3, [r3, #24]
f000e844:	e2033008 	and	r3, r3, #8
f000e848:	e3530000 	cmp	r3, #0
f000e84c:	1a000001 	bne	f000e858 <cap_match_ipc+0x88>
f000e850:	e3a03000 	mov	r3, #0
f000e854:	ea000044 	b	f000e96c <cap_match_ipc+0x19c>
f000e858:	ea000009 	b	f000e884 <cap_match_ipc+0xb4>
f000e85c:	e51b3010 	ldr	r3, [fp, #-16]
f000e860:	e5933018 	ldr	r3, [r3, #24]
f000e864:	e2033010 	and	r3, r3, #16
f000e868:	e3530000 	cmp	r3, #0
f000e86c:	1a000001 	bne	f000e878 <cap_match_ipc+0xa8>
f000e870:	e3a03000 	mov	r3, #0
f000e874:	ea00003c 	b	f000e96c <cap_match_ipc+0x19c>
f000e878:	ea000001 	b	f000e884 <cap_match_ipc+0xb4>
f000e87c:	e3a03000 	mov	r3, #0
f000e880:	ea000039 	b	f000e96c <cap_match_ipc+0x19c>
f000e884:	e51b3008 	ldr	r3, [fp, #-8]
f000e888:	e5933004 	ldr	r3, [r3, #4]
f000e88c:	e2033001 	and	r3, r3, #1
f000e890:	e3530000 	cmp	r3, #0
f000e894:	0a000006 	beq	f000e8b4 <cap_match_ipc+0xe4>
f000e898:	e51b3010 	ldr	r3, [fp, #-16]
f000e89c:	e5933018 	ldr	r3, [r3, #24]
f000e8a0:	e2033001 	and	r3, r3, #1
f000e8a4:	e3530000 	cmp	r3, #0
f000e8a8:	1a000001 	bne	f000e8b4 <cap_match_ipc+0xe4>
f000e8ac:	e3a03000 	mov	r3, #0
f000e8b0:	ea00002d 	b	f000e96c <cap_match_ipc+0x19c>
f000e8b4:	e51b3010 	ldr	r3, [fp, #-16]
f000e8b8:	e5933014 	ldr	r3, [r3, #20]
f000e8bc:	e1a03823 	lsr	r3, r3, #16
f000e8c0:	e1a03803 	lsl	r3, r3, #16
f000e8c4:	e3530802 	cmp	r3, #131072	; 0x20000
f000e8c8:	0a00000c 	beq	f000e900 <cap_match_ipc+0x130>
f000e8cc:	e3530701 	cmp	r3, #262144	; 0x40000
f000e8d0:	0a000014 	beq	f000e928 <cap_match_ipc+0x158>
f000e8d4:	e3530801 	cmp	r3, #65536	; 0x10000
f000e8d8:	1a00001c 	bne	f000e950 <cap_match_ipc+0x180>
f000e8dc:	e51b300c 	ldr	r3, [fp, #-12]
f000e8e0:	e5932054 	ldr	r2, [r3, #84]	; 0x54
f000e8e4:	e51b3010 	ldr	r3, [fp, #-16]
f000e8e8:	e5933010 	ldr	r3, [r3, #16]
f000e8ec:	e1520003 	cmp	r2, r3
f000e8f0:	0a000001 	beq	f000e8fc <cap_match_ipc+0x12c>
f000e8f4:	e3a03000 	mov	r3, #0
f000e8f8:	ea00001b 	b	f000e96c <cap_match_ipc+0x19c>
f000e8fc:	ea000019 	b	f000e968 <cap_match_ipc+0x198>
f000e900:	e51b300c 	ldr	r3, [fp, #-12]
f000e904:	e59330b4 	ldr	r3, [r3, #180]	; 0xb4
f000e908:	e5932000 	ldr	r2, [r3]
f000e90c:	e51b3010 	ldr	r3, [fp, #-16]
f000e910:	e5933010 	ldr	r3, [r3, #16]
f000e914:	e1520003 	cmp	r2, r3
f000e918:	0a000001 	beq	f000e924 <cap_match_ipc+0x154>
f000e91c:	e3a03000 	mov	r3, #0
f000e920:	ea000011 	b	f000e96c <cap_match_ipc+0x19c>
f000e924:	ea00000f 	b	f000e968 <cap_match_ipc+0x198>
f000e928:	e51b300c 	ldr	r3, [fp, #-12]
f000e92c:	e59330b8 	ldr	r3, [r3, #184]	; 0xb8
f000e930:	e5932000 	ldr	r2, [r3]
f000e934:	e51b3010 	ldr	r3, [fp, #-16]
f000e938:	e5933010 	ldr	r3, [r3, #16]
f000e93c:	e1520003 	cmp	r2, r3
f000e940:	0a000001 	beq	f000e94c <cap_match_ipc+0x17c>
f000e944:	e3a03000 	mov	r3, #0
f000e948:	ea000007 	b	f000e96c <cap_match_ipc+0x19c>
f000e94c:	ea000005 	b	f000e968 <cap_match_ipc+0x198>
f000e950:	e59f0020 	ldr	r0, [pc, #32]	; f000e978 <cap_match_ipc+0x1a8>
f000e954:	e59f1020 	ldr	r1, [pc, #32]	; f000e97c <cap_match_ipc+0x1ac>
f000e958:	e59f2020 	ldr	r2, [pc, #32]	; f000e980 <cap_match_ipc+0x1b0>
f000e95c:	e3a030cb 	mov	r3, #203	; 0xcb
f000e960:	eb001d61 	bl	f0015eec <printk>
f000e964:	eafffffe 	b	f000e964 <cap_match_ipc+0x194>
f000e968:	e51b3010 	ldr	r3, [fp, #-16]
f000e96c:	e1a00003 	mov	r0, r3
f000e970:	e24bd004 	sub	sp, fp, #4
f000e974:	e8bd8800 	pop	{fp, pc}
f000e978:	f001e958 	.word	0xf001e958
f000e97c:	f001e980 	.word	0xf001e980
f000e980:	f001e99c 	.word	0xf001e99c

f000e984 <cap_match_exregs>:
f000e984:	e92d4800 	push	{fp, lr}
f000e988:	e28db004 	add	fp, sp, #4
f000e98c:	e24dd018 	sub	sp, sp, #24
f000e990:	e50b0018 	str	r0, [fp, #-24]
f000e994:	e50b101c 	str	r1, [fp, #-28]
f000e998:	e51b301c 	ldr	r3, [fp, #-28]
f000e99c:	e50b3008 	str	r3, [fp, #-8]
f000e9a0:	e51b3008 	ldr	r3, [fp, #-8]
f000e9a4:	e5933000 	ldr	r3, [r3]
f000e9a8:	e50b300c 	str	r3, [fp, #-12]
f000e9ac:	e51b3008 	ldr	r3, [fp, #-8]
f000e9b0:	e5933004 	ldr	r3, [r3, #4]
f000e9b4:	e50b3010 	str	r3, [fp, #-16]
f000e9b8:	e51b300c 	ldr	r3, [fp, #-12]
f000e9bc:	e5932040 	ldr	r2, [r3, #64]	; 0x40
f000e9c0:	e59f31b0 	ldr	r3, [pc, #432]	; f000eb78 <cap_match_exregs+0x1f4>
f000e9c4:	e0023003 	and	r3, r2, r3
f000e9c8:	e3530000 	cmp	r3, #0
f000e9cc:	0a000006 	beq	f000e9ec <cap_match_exregs+0x68>
f000e9d0:	e51b3018 	ldr	r3, [fp, #-24]
f000e9d4:	e5933018 	ldr	r3, [r3, #24]
f000e9d8:	e2033010 	and	r3, r3, #16
f000e9dc:	e3530000 	cmp	r3, #0
f000e9e0:	1a000001 	bne	f000e9ec <cap_match_exregs+0x68>
f000e9e4:	e3a03000 	mov	r3, #0
f000e9e8:	ea00005f 	b	f000eb6c <cap_match_exregs+0x1e8>
f000e9ec:	e51b300c 	ldr	r3, [fp, #-12]
f000e9f0:	e5933040 	ldr	r3, [r3, #64]	; 0x40
f000e9f4:	e2033a02 	and	r3, r3, #8192	; 0x2000
f000e9f8:	e3530000 	cmp	r3, #0
f000e9fc:	0a000006 	beq	f000ea1c <cap_match_exregs+0x98>
f000ea00:	e51b3018 	ldr	r3, [fp, #-24]
f000ea04:	e5933018 	ldr	r3, [r3, #24]
f000ea08:	e2033004 	and	r3, r3, #4
f000ea0c:	e3530000 	cmp	r3, #0
f000ea10:	1a000001 	bne	f000ea1c <cap_match_exregs+0x98>
f000ea14:	e3a03000 	mov	r3, #0
f000ea18:	ea000053 	b	f000eb6c <cap_match_exregs+0x1e8>
f000ea1c:	e51b300c 	ldr	r3, [fp, #-12]
f000ea20:	e5933040 	ldr	r3, [r3, #64]	; 0x40
f000ea24:	e2033902 	and	r3, r3, #32768	; 0x8000
f000ea28:	e3530000 	cmp	r3, #0
f000ea2c:	0a000006 	beq	f000ea4c <cap_match_exregs+0xc8>
f000ea30:	e51b3018 	ldr	r3, [fp, #-24]
f000ea34:	e5933018 	ldr	r3, [r3, #24]
f000ea38:	e2033008 	and	r3, r3, #8
f000ea3c:	e3530000 	cmp	r3, #0
f000ea40:	1a000001 	bne	f000ea4c <cap_match_exregs+0xc8>
f000ea44:	e3a03000 	mov	r3, #0
f000ea48:	ea000047 	b	f000eb6c <cap_match_exregs+0x1e8>
f000ea4c:	e51b3008 	ldr	r3, [fp, #-8]
f000ea50:	e5933000 	ldr	r3, [r3]
f000ea54:	e5933040 	ldr	r3, [r3, #64]	; 0x40
f000ea58:	e2033002 	and	r3, r3, #2
f000ea5c:	e3530000 	cmp	r3, #0
f000ea60:	0a000006 	beq	f000ea80 <cap_match_exregs+0xfc>
f000ea64:	e51b3018 	ldr	r3, [fp, #-24]
f000ea68:	e5933018 	ldr	r3, [r3, #24]
f000ea6c:	e2033002 	and	r3, r3, #2
f000ea70:	e3530000 	cmp	r3, #0
f000ea74:	1a000001 	bne	f000ea80 <cap_match_exregs+0xfc>
f000ea78:	e3a03000 	mov	r3, #0
f000ea7c:	ea00003a 	b	f000eb6c <cap_match_exregs+0x1e8>
f000ea80:	e51b3008 	ldr	r3, [fp, #-8]
f000ea84:	e5933000 	ldr	r3, [r3]
f000ea88:	e5933040 	ldr	r3, [r3, #64]	; 0x40
f000ea8c:	e2033001 	and	r3, r3, #1
f000ea90:	e3530000 	cmp	r3, #0
f000ea94:	0a000006 	beq	f000eab4 <cap_match_exregs+0x130>
f000ea98:	e51b3018 	ldr	r3, [fp, #-24]
f000ea9c:	e5933018 	ldr	r3, [r3, #24]
f000eaa0:	e2033001 	and	r3, r3, #1
f000eaa4:	e3530000 	cmp	r3, #0
f000eaa8:	1a000001 	bne	f000eab4 <cap_match_exregs+0x130>
f000eaac:	e3a03000 	mov	r3, #0
f000eab0:	ea00002d 	b	f000eb6c <cap_match_exregs+0x1e8>
f000eab4:	e51b3018 	ldr	r3, [fp, #-24]
f000eab8:	e5933014 	ldr	r3, [r3, #20]
f000eabc:	e1a03823 	lsr	r3, r3, #16
f000eac0:	e1a03803 	lsl	r3, r3, #16
f000eac4:	e3530802 	cmp	r3, #131072	; 0x20000
f000eac8:	0a00000c 	beq	f000eb00 <cap_match_exregs+0x17c>
f000eacc:	e3530701 	cmp	r3, #262144	; 0x40000
f000ead0:	0a000014 	beq	f000eb28 <cap_match_exregs+0x1a4>
f000ead4:	e3530801 	cmp	r3, #65536	; 0x10000
f000ead8:	1a00001c 	bne	f000eb50 <cap_match_exregs+0x1cc>
f000eadc:	e51b3010 	ldr	r3, [fp, #-16]
f000eae0:	e5932054 	ldr	r2, [r3, #84]	; 0x54
f000eae4:	e51b3018 	ldr	r3, [fp, #-24]
f000eae8:	e5933010 	ldr	r3, [r3, #16]
f000eaec:	e1520003 	cmp	r2, r3
f000eaf0:	0a000001 	beq	f000eafc <cap_match_exregs+0x178>
f000eaf4:	e3a03000 	mov	r3, #0
f000eaf8:	ea00001b 	b	f000eb6c <cap_match_exregs+0x1e8>
f000eafc:	ea000019 	b	f000eb68 <cap_match_exregs+0x1e4>
f000eb00:	e51b3010 	ldr	r3, [fp, #-16]
f000eb04:	e59330b4 	ldr	r3, [r3, #180]	; 0xb4
f000eb08:	e5932000 	ldr	r2, [r3]
f000eb0c:	e51b3018 	ldr	r3, [fp, #-24]
f000eb10:	e5933010 	ldr	r3, [r3, #16]
f000eb14:	e1520003 	cmp	r2, r3
f000eb18:	0a000001 	beq	f000eb24 <cap_match_exregs+0x1a0>
f000eb1c:	e3a03000 	mov	r3, #0
f000eb20:	ea000011 	b	f000eb6c <cap_match_exregs+0x1e8>
f000eb24:	ea00000f 	b	f000eb68 <cap_match_exregs+0x1e4>
f000eb28:	e51b3010 	ldr	r3, [fp, #-16]
f000eb2c:	e59330b8 	ldr	r3, [r3, #184]	; 0xb8
f000eb30:	e5932000 	ldr	r2, [r3]
f000eb34:	e51b3018 	ldr	r3, [fp, #-24]
f000eb38:	e5933010 	ldr	r3, [r3, #16]
f000eb3c:	e1520003 	cmp	r2, r3
f000eb40:	0a000001 	beq	f000eb4c <cap_match_exregs+0x1c8>
f000eb44:	e3a03000 	mov	r3, #0
f000eb48:	ea000007 	b	f000eb6c <cap_match_exregs+0x1e8>
f000eb4c:	ea000005 	b	f000eb68 <cap_match_exregs+0x1e4>
f000eb50:	e59f0024 	ldr	r0, [pc, #36]	; f000eb7c <cap_match_exregs+0x1f8>
f000eb54:	e59f1024 	ldr	r1, [pc, #36]	; f000eb80 <cap_match_exregs+0x1fc>
f000eb58:	e59f2024 	ldr	r2, [pc, #36]	; f000eb84 <cap_match_exregs+0x200>
f000eb5c:	e59f3024 	ldr	r3, [pc, #36]	; f000eb88 <cap_match_exregs+0x204>
f000eb60:	eb001ce1 	bl	f0015eec <printk>
f000eb64:	eafffffe 	b	f000eb64 <cap_match_exregs+0x1e0>
f000eb68:	e51b3018 	ldr	r3, [fp, #-24]
f000eb6c:	e1a00003 	mov	r0, r3
f000eb70:	e24bd004 	sub	sp, fp, #4
f000eb74:	e8bd8800 	pop	{fp, pc}
f000eb78:	00005fff 	.word	0x00005fff
f000eb7c:	f001e958 	.word	0xf001e958
f000eb80:	f001e980 	.word	0xf001e980
f000eb84:	f001e9ac 	.word	0xf001e9ac
f000eb88:	00000103 	.word	0x00000103

f000eb8c <cap_match_thread>:
f000eb8c:	e92d4810 	push	{r4, fp, lr}
f000eb90:	e28db008 	add	fp, sp, #8
f000eb94:	e24dd01c 	sub	sp, sp, #28
f000eb98:	e50b0020 	str	r0, [fp, #-32]
f000eb9c:	e50b1024 	str	r1, [fp, #-36]	; 0x24
f000eba0:	e51b3024 	ldr	r3, [fp, #-36]	; 0x24
f000eba4:	e50b3010 	str	r3, [fp, #-16]
f000eba8:	e51b3010 	ldr	r3, [fp, #-16]
f000ebac:	e5933000 	ldr	r3, [r3]
f000ebb0:	e50b3014 	str	r3, [fp, #-20]
f000ebb4:	e51b3010 	ldr	r3, [fp, #-16]
f000ebb8:	e5933004 	ldr	r3, [r3, #4]
f000ebbc:	e203320f 	and	r3, r3, #-268435456	; 0xf0000000
f000ebc0:	e50b3018 	str	r3, [fp, #-24]
f000ebc4:	e51b3018 	ldr	r3, [fp, #-24]
f000ebc8:	e3530202 	cmp	r3, #536870912	; 0x20000000
f000ebcc:	0a00001d 	beq	f000ec48 <cap_match_thread+0xbc>
f000ebd0:	e3530202 	cmp	r3, #536870912	; 0x20000000
f000ebd4:	8a000004 	bhi	f000ebec <cap_match_thread+0x60>
f000ebd8:	e3530000 	cmp	r3, #0
f000ebdc:	0a000009 	beq	f000ec08 <cap_match_thread+0x7c>
f000ebe0:	e3530201 	cmp	r3, #268435456	; 0x10000000
f000ebe4:	0a00001f 	beq	f000ec68 <cap_match_thread+0xdc>
f000ebe8:	ea000036 	b	f000ecc8 <cap_match_thread+0x13c>
f000ebec:	e3530101 	cmp	r3, #1073741824	; 0x40000000
f000ebf0:	0a000024 	beq	f000ec88 <cap_match_thread+0xfc>
f000ebf4:	e3530205 	cmp	r3, #1342177280	; 0x50000000
f000ebf8:	0a00002a 	beq	f000eca8 <cap_match_thread+0x11c>
f000ebfc:	e3530203 	cmp	r3, #805306368	; 0x30000000
f000ec00:	0a000008 	beq	f000ec28 <cap_match_thread+0x9c>
f000ec04:	ea00002f 	b	f000ecc8 <cap_match_thread+0x13c>
f000ec08:	e51b3020 	ldr	r3, [fp, #-32]
f000ec0c:	e5933018 	ldr	r3, [r3, #24]
f000ec10:	e2033001 	and	r3, r3, #1
f000ec14:	e3530000 	cmp	r3, #0
f000ec18:	1a000001 	bne	f000ec24 <cap_match_thread+0x98>
f000ec1c:	e3a03000 	mov	r3, #0
f000ec20:	ea000087 	b	f000ee44 <cap_match_thread+0x2b8>
f000ec24:	ea000029 	b	f000ecd0 <cap_match_thread+0x144>
f000ec28:	e51b3020 	ldr	r3, [fp, #-32]
f000ec2c:	e5933018 	ldr	r3, [r3, #24]
f000ec30:	e2033002 	and	r3, r3, #2
f000ec34:	e3530000 	cmp	r3, #0
f000ec38:	1a000001 	bne	f000ec44 <cap_match_thread+0xb8>
f000ec3c:	e3a03000 	mov	r3, #0
f000ec40:	ea00007f 	b	f000ee44 <cap_match_thread+0x2b8>
f000ec44:	ea000021 	b	f000ecd0 <cap_match_thread+0x144>
f000ec48:	e51b3020 	ldr	r3, [fp, #-32]
f000ec4c:	e5933018 	ldr	r3, [r3, #24]
f000ec50:	e2033008 	and	r3, r3, #8
f000ec54:	e3530000 	cmp	r3, #0
f000ec58:	1a000001 	bne	f000ec64 <cap_match_thread+0xd8>
f000ec5c:	e3a03000 	mov	r3, #0
f000ec60:	ea000077 	b	f000ee44 <cap_match_thread+0x2b8>
f000ec64:	ea000019 	b	f000ecd0 <cap_match_thread+0x144>
f000ec68:	e51b3020 	ldr	r3, [fp, #-32]
f000ec6c:	e5933018 	ldr	r3, [r3, #24]
f000ec70:	e2033004 	and	r3, r3, #4
f000ec74:	e3530000 	cmp	r3, #0
f000ec78:	1a000001 	bne	f000ec84 <cap_match_thread+0xf8>
f000ec7c:	e3a03000 	mov	r3, #0
f000ec80:	ea00006f 	b	f000ee44 <cap_match_thread+0x2b8>
f000ec84:	ea000011 	b	f000ecd0 <cap_match_thread+0x144>
f000ec88:	e51b3020 	ldr	r3, [fp, #-32]
f000ec8c:	e5933018 	ldr	r3, [r3, #24]
f000ec90:	e2033010 	and	r3, r3, #16
f000ec94:	e3530000 	cmp	r3, #0
f000ec98:	1a000001 	bne	f000eca4 <cap_match_thread+0x118>
f000ec9c:	e3a03000 	mov	r3, #0
f000eca0:	ea000067 	b	f000ee44 <cap_match_thread+0x2b8>
f000eca4:	ea000009 	b	f000ecd0 <cap_match_thread+0x144>
f000eca8:	e51b3020 	ldr	r3, [fp, #-32]
f000ecac:	e5933018 	ldr	r3, [r3, #24]
f000ecb0:	e2033020 	and	r3, r3, #32
f000ecb4:	e3530000 	cmp	r3, #0
f000ecb8:	1a000001 	bne	f000ecc4 <cap_match_thread+0x138>
f000ecbc:	e3a03000 	mov	r3, #0
f000ecc0:	ea00005f 	b	f000ee44 <cap_match_thread+0x2b8>
f000ecc4:	ea000001 	b	f000ecd0 <cap_match_thread+0x144>
f000ecc8:	e3a03000 	mov	r3, #0
f000eccc:	ea00005c 	b	f000ee44 <cap_match_thread+0x2b8>
f000ecd0:	e51b3014 	ldr	r3, [fp, #-20]
f000ecd4:	e3530000 	cmp	r3, #0
f000ecd8:	1a000008 	bne	f000ed00 <cap_match_thread+0x174>
f000ecdc:	e51b3018 	ldr	r3, [fp, #-24]
f000ece0:	e3530000 	cmp	r3, #0
f000ece4:	0a000005 	beq	f000ed00 <cap_match_thread+0x174>
f000ece8:	e59f0160 	ldr	r0, [pc, #352]	; f000ee50 <cap_match_thread+0x2c4>
f000ecec:	e59f1160 	ldr	r1, [pc, #352]	; f000ee54 <cap_match_thread+0x2c8>
f000ecf0:	e59f2160 	ldr	r2, [pc, #352]	; f000ee58 <cap_match_thread+0x2cc>
f000ecf4:	e3a03f56 	mov	r3, #344	; 0x158
f000ecf8:	eb001c7b 	bl	f0015eec <printk>
f000ecfc:	eafffffe 	b	f000ecfc <cap_match_thread+0x170>
f000ed00:	e51b3014 	ldr	r3, [fp, #-20]
f000ed04:	e3530000 	cmp	r3, #0
f000ed08:	0a000008 	beq	f000ed30 <cap_match_thread+0x1a4>
f000ed0c:	e51b3018 	ldr	r3, [fp, #-24]
f000ed10:	e3530000 	cmp	r3, #0
f000ed14:	1a000005 	bne	f000ed30 <cap_match_thread+0x1a4>
f000ed18:	e59f0130 	ldr	r0, [pc, #304]	; f000ee50 <cap_match_thread+0x2c4>
f000ed1c:	e59f1130 	ldr	r1, [pc, #304]	; f000ee54 <cap_match_thread+0x2c8>
f000ed20:	e59f2130 	ldr	r2, [pc, #304]	; f000ee58 <cap_match_thread+0x2cc>
f000ed24:	e59f3130 	ldr	r3, [pc, #304]	; f000ee5c <cap_match_thread+0x2d0>
f000ed28:	eb001c6f 	bl	f0015eec <printk>
f000ed2c:	eafffffe 	b	f000ed2c <cap_match_thread+0x1a0>
f000ed30:	e51b3018 	ldr	r3, [fp, #-24]
f000ed34:	e3530000 	cmp	r3, #0
f000ed38:	1a000013 	bne	f000ed8c <cap_match_thread+0x200>
f000ed3c:	e51b3020 	ldr	r3, [fp, #-32]
f000ed40:	e5933014 	ldr	r3, [r3, #20]
f000ed44:	e1a03823 	lsr	r3, r3, #16
f000ed48:	e1a03803 	lsl	r3, r3, #16
f000ed4c:	e3530701 	cmp	r3, #262144	; 0x40000
f000ed50:	0a000001 	beq	f000ed5c <cap_match_thread+0x1d0>
f000ed54:	e3a03000 	mov	r3, #0
f000ed58:	ea000039 	b	f000ee44 <cap_match_thread+0x2b8>
f000ed5c:	e51b3020 	ldr	r3, [fp, #-32]
f000ed60:	e5934010 	ldr	r4, [r3, #16]
f000ed64:	ebfffd89 	bl	f000e390 <current_task>
f000ed68:	e1a03000 	mov	r3, r0
f000ed6c:	e59330b8 	ldr	r3, [r3, #184]	; 0xb8
f000ed70:	e5933000 	ldr	r3, [r3]
f000ed74:	e1540003 	cmp	r4, r3
f000ed78:	0a000001 	beq	f000ed84 <cap_match_thread+0x1f8>
f000ed7c:	e3a03000 	mov	r3, #0
f000ed80:	ea00002f 	b	f000ee44 <cap_match_thread+0x2b8>
f000ed84:	e51b3020 	ldr	r3, [fp, #-32]
f000ed88:	ea00002d 	b	f000ee44 <cap_match_thread+0x2b8>
f000ed8c:	e51b3020 	ldr	r3, [fp, #-32]
f000ed90:	e5933014 	ldr	r3, [r3, #20]
f000ed94:	e1a03823 	lsr	r3, r3, #16
f000ed98:	e1a03803 	lsl	r3, r3, #16
f000ed9c:	e3530802 	cmp	r3, #131072	; 0x20000
f000eda0:	0a00000c 	beq	f000edd8 <cap_match_thread+0x24c>
f000eda4:	e3530701 	cmp	r3, #262144	; 0x40000
f000eda8:	0a000014 	beq	f000ee00 <cap_match_thread+0x274>
f000edac:	e3530801 	cmp	r3, #65536	; 0x10000
f000edb0:	1a00001c 	bne	f000ee28 <cap_match_thread+0x29c>
f000edb4:	e51b3014 	ldr	r3, [fp, #-20]
f000edb8:	e5932054 	ldr	r2, [r3, #84]	; 0x54
f000edbc:	e51b3020 	ldr	r3, [fp, #-32]
f000edc0:	e5933010 	ldr	r3, [r3, #16]
f000edc4:	e1520003 	cmp	r2, r3
f000edc8:	0a000001 	beq	f000edd4 <cap_match_thread+0x248>
f000edcc:	e3a03000 	mov	r3, #0
f000edd0:	ea00001b 	b	f000ee44 <cap_match_thread+0x2b8>
f000edd4:	ea000019 	b	f000ee40 <cap_match_thread+0x2b4>
f000edd8:	e51b3014 	ldr	r3, [fp, #-20]
f000eddc:	e59330b4 	ldr	r3, [r3, #180]	; 0xb4
f000ede0:	e5932000 	ldr	r2, [r3]
f000ede4:	e51b3020 	ldr	r3, [fp, #-32]
f000ede8:	e5933010 	ldr	r3, [r3, #16]
f000edec:	e1520003 	cmp	r2, r3
f000edf0:	0a000001 	beq	f000edfc <cap_match_thread+0x270>
f000edf4:	e3a03000 	mov	r3, #0
f000edf8:	ea000011 	b	f000ee44 <cap_match_thread+0x2b8>
f000edfc:	ea00000f 	b	f000ee40 <cap_match_thread+0x2b4>
f000ee00:	e51b3014 	ldr	r3, [fp, #-20]
f000ee04:	e59330b8 	ldr	r3, [r3, #184]	; 0xb8
f000ee08:	e5932000 	ldr	r2, [r3]
f000ee0c:	e51b3020 	ldr	r3, [fp, #-32]
f000ee10:	e5933010 	ldr	r3, [r3, #16]
f000ee14:	e1520003 	cmp	r2, r3
f000ee18:	0a000001 	beq	f000ee24 <cap_match_thread+0x298>
f000ee1c:	e3a03000 	mov	r3, #0
f000ee20:	ea000007 	b	f000ee44 <cap_match_thread+0x2b8>
f000ee24:	ea000005 	b	f000ee40 <cap_match_thread+0x2b4>
f000ee28:	e59f0020 	ldr	r0, [pc, #32]	; f000ee50 <cap_match_thread+0x2c4>
f000ee2c:	e59f1020 	ldr	r1, [pc, #32]	; f000ee54 <cap_match_thread+0x2c8>
f000ee30:	e59f2020 	ldr	r2, [pc, #32]	; f000ee58 <cap_match_thread+0x2cc>
f000ee34:	e59f3024 	ldr	r3, [pc, #36]	; f000ee60 <cap_match_thread+0x2d4>
f000ee38:	eb001c2b 	bl	f0015eec <printk>
f000ee3c:	eafffffe 	b	f000ee3c <cap_match_thread+0x2b0>
f000ee40:	e51b3020 	ldr	r3, [fp, #-32]
f000ee44:	e1a00003 	mov	r0, r3
f000ee48:	e24bd008 	sub	sp, fp, #8
f000ee4c:	e8bd8810 	pop	{r4, fp, pc}
f000ee50:	f001e958 	.word	0xf001e958
f000ee54:	f001e980 	.word	0xf001e980
f000ee58:	f001e9c0 	.word	0xf001e9c0
f000ee5c:	00000159 	.word	0x00000159
f000ee60:	00000181 	.word	0x00000181

f000ee64 <cap_match_mem>:
f000ee64:	e92d4870 	push	{r4, r5, r6, fp, lr}
f000ee68:	e28db010 	add	fp, sp, #16
f000ee6c:	e24dd034 	sub	sp, sp, #52	; 0x34
f000ee70:	e50b0040 	str	r0, [fp, #-64]	; 0x40
f000ee74:	e50b1044 	str	r1, [fp, #-68]	; 0x44
f000ee78:	e51b3044 	ldr	r3, [fp, #-68]	; 0x44
f000ee7c:	e50b301c 	str	r3, [fp, #-28]
f000ee80:	e51b301c 	ldr	r3, [fp, #-28]
f000ee84:	e5933000 	ldr	r3, [r3]
f000ee88:	e50b3020 	str	r3, [fp, #-32]
f000ee8c:	e51b3040 	ldr	r3, [fp, #-64]	; 0x40
f000ee90:	e5933014 	ldr	r3, [r3, #20]
f000ee94:	e1a03803 	lsl	r3, r3, #16
f000ee98:	e1a03823 	lsr	r3, r3, #16
f000ee9c:	e3530004 	cmp	r3, #4
f000eea0:	1a000004 	bne	f000eeb8 <cap_match_mem+0x54>
f000eea4:	e51b301c 	ldr	r3, [fp, #-28]
f000eea8:	e5933004 	ldr	r3, [r3, #4]
f000eeac:	e1a03623 	lsr	r3, r3, #12
f000eeb0:	e50b3018 	str	r3, [fp, #-24]
f000eeb4:	ea000003 	b	f000eec8 <cap_match_mem+0x64>
f000eeb8:	e51b301c 	ldr	r3, [fp, #-28]
f000eebc:	e5933008 	ldr	r3, [r3, #8]
f000eec0:	e1a03623 	lsr	r3, r3, #12
f000eec4:	e50b3018 	str	r3, [fp, #-24]
f000eec8:	e51b3040 	ldr	r3, [fp, #-64]	; 0x40
f000eecc:	e593301c 	ldr	r3, [r3, #28]
f000eed0:	e3a04000 	mov	r4, #0
f000eed4:	e50b302c 	str	r3, [fp, #-44]	; 0x2c
f000eed8:	e50b4028 	str	r4, [fp, #-40]	; 0x28
f000eedc:	e51b3018 	ldr	r3, [fp, #-24]
f000eee0:	e3a04000 	mov	r4, #0
f000eee4:	e50b3034 	str	r3, [fp, #-52]	; 0x34
f000eee8:	e50b4030 	str	r4, [fp, #-48]	; 0x30
f000eeec:	e24b202c 	sub	r2, fp, #44	; 0x2c
f000eef0:	e8920006 	ldm	r2, {r1, r2}
f000eef4:	e24b4034 	sub	r4, fp, #52	; 0x34
f000eef8:	e8940018 	ldm	r4, {r3, r4}
f000eefc:	e1520004 	cmp	r2, r4
f000ef00:	01510003 	cmpeq	r1, r3
f000ef04:	8a00000e 	bhi	f000ef44 <cap_match_mem+0xe0>
f000ef08:	e51b3040 	ldr	r3, [fp, #-64]	; 0x40
f000ef0c:	e5933020 	ldr	r3, [r3, #32]
f000ef10:	e1a01003 	mov	r1, r3
f000ef14:	e3a02000 	mov	r2, #0
f000ef18:	e51b301c 	ldr	r3, [fp, #-28]
f000ef1c:	e593300c 	ldr	r3, [r3, #12]
f000ef20:	e1a05003 	mov	r5, r3
f000ef24:	e3a06000 	mov	r6, #0
f000ef28:	e24b4034 	sub	r4, fp, #52	; 0x34
f000ef2c:	e8940018 	ldm	r4, {r3, r4}
f000ef30:	e0933005 	adds	r3, r3, r5
f000ef34:	e0a44006 	adc	r4, r4, r6
f000ef38:	e1520004 	cmp	r2, r4
f000ef3c:	01510003 	cmpeq	r1, r3
f000ef40:	2a000001 	bcs	f000ef4c <cap_match_mem+0xe8>
f000ef44:	e3a03000 	mov	r3, #0
f000ef48:	ea000083 	b	f000f15c <cap_match_mem+0x2f8>
f000ef4c:	e51b301c 	ldr	r3, [fp, #-28]
f000ef50:	e5933010 	ldr	r3, [r3, #16]
f000ef54:	e2433001 	sub	r3, r3, #1
f000ef58:	e3530009 	cmp	r3, #9
f000ef5c:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
f000ef60:	ea00004d 	b	f000f09c <cap_match_mem+0x238>
f000ef64:	f000ef8c 	.word	0xf000ef8c
f000ef68:	f000efec 	.word	0xf000efec
f000ef6c:	f000f09c 	.word	0xf000f09c
f000ef70:	f000f04c 	.word	0xf000f04c
f000ef74:	f000f09c 	.word	0xf000f09c
f000ef78:	f000efbc 	.word	0xf000efbc
f000ef7c:	f000f09c 	.word	0xf000f09c
f000ef80:	f000f01c 	.word	0xf000f01c
f000ef84:	f000f09c 	.word	0xf000f09c
f000ef88:	f000f07c 	.word	0xf000f07c
f000ef8c:	e3a0300b 	mov	r3, #11
f000ef90:	e50b3038 	str	r3, [fp, #-56]	; 0x38
f000ef94:	e51b3040 	ldr	r3, [fp, #-64]	; 0x40
f000ef98:	e5932018 	ldr	r2, [r3, #24]
f000ef9c:	e51b3038 	ldr	r3, [fp, #-56]	; 0x38
f000efa0:	e0022003 	and	r2, r2, r3
f000efa4:	e51b3038 	ldr	r3, [fp, #-56]	; 0x38
f000efa8:	e1520003 	cmp	r2, r3
f000efac:	0a000001 	beq	f000efb8 <cap_match_mem+0x154>
f000efb0:	e3a03000 	mov	r3, #0
f000efb4:	ea000068 	b	f000f15c <cap_match_mem+0x2f8>
f000efb8:	ea000039 	b	f000f0a4 <cap_match_mem+0x240>
f000efbc:	e3a0300f 	mov	r3, #15
f000efc0:	e50b3038 	str	r3, [fp, #-56]	; 0x38
f000efc4:	e51b3040 	ldr	r3, [fp, #-64]	; 0x40
f000efc8:	e5932018 	ldr	r2, [r3, #24]
f000efcc:	e51b3038 	ldr	r3, [fp, #-56]	; 0x38
f000efd0:	e0022003 	and	r2, r2, r3
f000efd4:	e51b3038 	ldr	r3, [fp, #-56]	; 0x38
f000efd8:	e1520003 	cmp	r2, r3
f000efdc:	0a000001 	beq	f000efe8 <cap_match_mem+0x184>
f000efe0:	e3a03000 	mov	r3, #0
f000efe4:	ea00005c 	b	f000f15c <cap_match_mem+0x2f8>
f000efe8:	ea00002d 	b	f000f0a4 <cap_match_mem+0x240>
f000efec:	e3a03009 	mov	r3, #9
f000eff0:	e50b3038 	str	r3, [fp, #-56]	; 0x38
f000eff4:	e51b3040 	ldr	r3, [fp, #-64]	; 0x40
f000eff8:	e5932018 	ldr	r2, [r3, #24]
f000effc:	e51b3038 	ldr	r3, [fp, #-56]	; 0x38
f000f000:	e0022003 	and	r2, r2, r3
f000f004:	e51b3038 	ldr	r3, [fp, #-56]	; 0x38
f000f008:	e1520003 	cmp	r2, r3
f000f00c:	0a000001 	beq	f000f018 <cap_match_mem+0x1b4>
f000f010:	e3a03000 	mov	r3, #0
f000f014:	ea000050 	b	f000f15c <cap_match_mem+0x2f8>
f000f018:	ea000021 	b	f000f0a4 <cap_match_mem+0x240>
f000f01c:	e3a0300d 	mov	r3, #13
f000f020:	e50b3038 	str	r3, [fp, #-56]	; 0x38
f000f024:	e51b3040 	ldr	r3, [fp, #-64]	; 0x40
f000f028:	e5932018 	ldr	r2, [r3, #24]
f000f02c:	e51b3038 	ldr	r3, [fp, #-56]	; 0x38
f000f030:	e0022003 	and	r2, r2, r3
f000f034:	e51b3038 	ldr	r3, [fp, #-56]	; 0x38
f000f038:	e1520003 	cmp	r2, r3
f000f03c:	0a000001 	beq	f000f048 <cap_match_mem+0x1e4>
f000f040:	e3a03000 	mov	r3, #0
f000f044:	ea000044 	b	f000f15c <cap_match_mem+0x2f8>
f000f048:	ea000015 	b	f000f0a4 <cap_match_mem+0x240>
f000f04c:	e3a03013 	mov	r3, #19
f000f050:	e50b3038 	str	r3, [fp, #-56]	; 0x38
f000f054:	e51b3040 	ldr	r3, [fp, #-64]	; 0x40
f000f058:	e5932018 	ldr	r2, [r3, #24]
f000f05c:	e51b3038 	ldr	r3, [fp, #-56]	; 0x38
f000f060:	e0022003 	and	r2, r2, r3
f000f064:	e51b3038 	ldr	r3, [fp, #-56]	; 0x38
f000f068:	e1520003 	cmp	r2, r3
f000f06c:	0a000001 	beq	f000f078 <cap_match_mem+0x214>
f000f070:	e3a03000 	mov	r3, #0
f000f074:	ea000038 	b	f000f15c <cap_match_mem+0x2f8>
f000f078:	ea000009 	b	f000f0a4 <cap_match_mem+0x240>
f000f07c:	e51b3040 	ldr	r3, [fp, #-64]	; 0x40
f000f080:	e5933018 	ldr	r3, [r3, #24]
f000f084:	e2033020 	and	r3, r3, #32
f000f088:	e3530000 	cmp	r3, #0
f000f08c:	1a000001 	bne	f000f098 <cap_match_mem+0x234>
f000f090:	e3a03000 	mov	r3, #0
f000f094:	ea000030 	b	f000f15c <cap_match_mem+0x2f8>
f000f098:	ea000001 	b	f000f0a4 <cap_match_mem+0x240>
f000f09c:	e3a03000 	mov	r3, #0
f000f0a0:	ea00002d 	b	f000f15c <cap_match_mem+0x2f8>
f000f0a4:	e51b3040 	ldr	r3, [fp, #-64]	; 0x40
f000f0a8:	e5933014 	ldr	r3, [r3, #20]
f000f0ac:	e1a03823 	lsr	r3, r3, #16
f000f0b0:	e1a03803 	lsl	r3, r3, #16
f000f0b4:	e3530802 	cmp	r3, #131072	; 0x20000
f000f0b8:	0a00000c 	beq	f000f0f0 <cap_match_mem+0x28c>
f000f0bc:	e3530701 	cmp	r3, #262144	; 0x40000
f000f0c0:	0a000014 	beq	f000f118 <cap_match_mem+0x2b4>
f000f0c4:	e3530801 	cmp	r3, #65536	; 0x10000
f000f0c8:	1a00001c 	bne	f000f140 <cap_match_mem+0x2dc>
f000f0cc:	e51b3020 	ldr	r3, [fp, #-32]
f000f0d0:	e5932054 	ldr	r2, [r3, #84]	; 0x54
f000f0d4:	e51b3040 	ldr	r3, [fp, #-64]	; 0x40
f000f0d8:	e5933010 	ldr	r3, [r3, #16]
f000f0dc:	e1520003 	cmp	r2, r3
f000f0e0:	0a000001 	beq	f000f0ec <cap_match_mem+0x288>
f000f0e4:	e3a03000 	mov	r3, #0
f000f0e8:	ea00001b 	b	f000f15c <cap_match_mem+0x2f8>
f000f0ec:	ea000019 	b	f000f158 <cap_match_mem+0x2f4>
f000f0f0:	e51b3020 	ldr	r3, [fp, #-32]
f000f0f4:	e59330b4 	ldr	r3, [r3, #180]	; 0xb4
f000f0f8:	e5932000 	ldr	r2, [r3]
f000f0fc:	e51b3040 	ldr	r3, [fp, #-64]	; 0x40
f000f100:	e5933010 	ldr	r3, [r3, #16]
f000f104:	e1520003 	cmp	r2, r3
f000f108:	0a000001 	beq	f000f114 <cap_match_mem+0x2b0>
f000f10c:	e3a03000 	mov	r3, #0
f000f110:	ea000011 	b	f000f15c <cap_match_mem+0x2f8>
f000f114:	ea00000f 	b	f000f158 <cap_match_mem+0x2f4>
f000f118:	e51b3020 	ldr	r3, [fp, #-32]
f000f11c:	e59330b8 	ldr	r3, [r3, #184]	; 0xb8
f000f120:	e5932000 	ldr	r2, [r3]
f000f124:	e51b3040 	ldr	r3, [fp, #-64]	; 0x40
f000f128:	e5933010 	ldr	r3, [r3, #16]
f000f12c:	e1520003 	cmp	r2, r3
f000f130:	0a000001 	beq	f000f13c <cap_match_mem+0x2d8>
f000f134:	e3a03000 	mov	r3, #0
f000f138:	ea000007 	b	f000f15c <cap_match_mem+0x2f8>
f000f13c:	ea000005 	b	f000f158 <cap_match_mem+0x2f4>
f000f140:	e59f0020 	ldr	r0, [pc, #32]	; f000f168 <cap_match_mem+0x304>
f000f144:	e59f1020 	ldr	r1, [pc, #32]	; f000f16c <cap_match_mem+0x308>
f000f148:	e59f2020 	ldr	r2, [pc, #32]	; f000f170 <cap_match_mem+0x30c>
f000f14c:	e59f3020 	ldr	r3, [pc, #32]	; f000f174 <cap_match_mem+0x310>
f000f150:	eb001b65 	bl	f0015eec <printk>
f000f154:	eafffffe 	b	f000f154 <cap_match_mem+0x2f0>
f000f158:	e51b3040 	ldr	r3, [fp, #-64]	; 0x40
f000f15c:	e1a00003 	mov	r0, r3
f000f160:	e24bd010 	sub	sp, fp, #16
f000f164:	e8bd8870 	pop	{r4, r5, r6, fp, pc}
f000f168:	f001e958 	.word	0xf001e958
f000f16c:	f001e980 	.word	0xf001e980
f000f170:	f001e9d4 	.word	0xf001e9d4
f000f174:	000001dd 	.word	0x000001dd

f000f178 <cap_match_irqctrl>:
f000f178:	e92d4800 	push	{fp, lr}
f000f17c:	e28db004 	add	fp, sp, #4
f000f180:	e24dd010 	sub	sp, sp, #16
f000f184:	e50b0010 	str	r0, [fp, #-16]
f000f188:	e50b1014 	str	r1, [fp, #-20]
f000f18c:	e51b3014 	ldr	r3, [fp, #-20]
f000f190:	e50b3008 	str	r3, [fp, #-8]
f000f194:	e51b3008 	ldr	r3, [fp, #-8]
f000f198:	e5933000 	ldr	r3, [r3]
f000f19c:	e50b300c 	str	r3, [fp, #-12]
f000f1a0:	e51b3008 	ldr	r3, [fp, #-8]
f000f1a4:	e5933004 	ldr	r3, [r3, #4]
f000f1a8:	e3530000 	cmp	r3, #0
f000f1ac:	0a000002 	beq	f000f1bc <cap_match_irqctrl+0x44>
f000f1b0:	e3530002 	cmp	r3, #2
f000f1b4:	0a000008 	beq	f000f1dc <cap_match_irqctrl+0x64>
f000f1b8:	ea00000f 	b	f000f1fc <cap_match_irqctrl+0x84>
f000f1bc:	e51b3010 	ldr	r3, [fp, #-16]
f000f1c0:	e5933018 	ldr	r3, [r3, #24]
f000f1c4:	e2033080 	and	r3, r3, #128	; 0x80
f000f1c8:	e3530000 	cmp	r3, #0
f000f1cc:	1a000001 	bne	f000f1d8 <cap_match_irqctrl+0x60>
f000f1d0:	e3a03000 	mov	r3, #0
f000f1d4:	ea000046 	b	f000f2f4 <cap_match_irqctrl+0x17c>
f000f1d8:	ea000009 	b	f000f204 <cap_match_irqctrl+0x8c>
f000f1dc:	e51b3010 	ldr	r3, [fp, #-16]
f000f1e0:	e5933018 	ldr	r3, [r3, #24]
f000f1e4:	e2033c01 	and	r3, r3, #256	; 0x100
f000f1e8:	e3530000 	cmp	r3, #0
f000f1ec:	1a000001 	bne	f000f1f8 <cap_match_irqctrl+0x80>
f000f1f0:	e3a03000 	mov	r3, #0
f000f1f4:	ea00003e 	b	f000f2f4 <cap_match_irqctrl+0x17c>
f000f1f8:	ea000001 	b	f000f204 <cap_match_irqctrl+0x8c>
f000f1fc:	e3a03000 	mov	r3, #0
f000f200:	ea00003b 	b	f000f2f4 <cap_match_irqctrl+0x17c>
f000f204:	e51b3008 	ldr	r3, [fp, #-8]
f000f208:	e593200c 	ldr	r2, [r3, #12]
f000f20c:	e51b3010 	ldr	r3, [fp, #-16]
f000f210:	e593301c 	ldr	r3, [r3, #28]
f000f214:	e1520003 	cmp	r2, r3
f000f218:	2a000007 	bcs	f000f23c <cap_match_irqctrl+0xc4>
f000f21c:	e51b3008 	ldr	r3, [fp, #-8]
f000f220:	e593200c 	ldr	r2, [r3, #12]
f000f224:	e51b3010 	ldr	r3, [fp, #-16]
f000f228:	e5933020 	ldr	r3, [r3, #32]
f000f22c:	e1520003 	cmp	r2, r3
f000f230:	9a000001 	bls	f000f23c <cap_match_irqctrl+0xc4>
f000f234:	e3a03000 	mov	r3, #0
f000f238:	ea00002d 	b	f000f2f4 <cap_match_irqctrl+0x17c>
f000f23c:	e51b3010 	ldr	r3, [fp, #-16]
f000f240:	e5933014 	ldr	r3, [r3, #20]
f000f244:	e1a03823 	lsr	r3, r3, #16
f000f248:	e1a03803 	lsl	r3, r3, #16
f000f24c:	e3530802 	cmp	r3, #131072	; 0x20000
f000f250:	0a00000c 	beq	f000f288 <cap_match_irqctrl+0x110>
f000f254:	e3530701 	cmp	r3, #262144	; 0x40000
f000f258:	0a000014 	beq	f000f2b0 <cap_match_irqctrl+0x138>
f000f25c:	e3530801 	cmp	r3, #65536	; 0x10000
f000f260:	1a00001c 	bne	f000f2d8 <cap_match_irqctrl+0x160>
f000f264:	e51b300c 	ldr	r3, [fp, #-12]
f000f268:	e5932054 	ldr	r2, [r3, #84]	; 0x54
f000f26c:	e51b3010 	ldr	r3, [fp, #-16]
f000f270:	e5933010 	ldr	r3, [r3, #16]
f000f274:	e1520003 	cmp	r2, r3
f000f278:	0a000001 	beq	f000f284 <cap_match_irqctrl+0x10c>
f000f27c:	e3a03000 	mov	r3, #0
f000f280:	ea00001b 	b	f000f2f4 <cap_match_irqctrl+0x17c>
f000f284:	ea000019 	b	f000f2f0 <cap_match_irqctrl+0x178>
f000f288:	e51b300c 	ldr	r3, [fp, #-12]
f000f28c:	e59330b4 	ldr	r3, [r3, #180]	; 0xb4
f000f290:	e5932000 	ldr	r2, [r3]
f000f294:	e51b3010 	ldr	r3, [fp, #-16]
f000f298:	e5933010 	ldr	r3, [r3, #16]
f000f29c:	e1520003 	cmp	r2, r3
f000f2a0:	0a000001 	beq	f000f2ac <cap_match_irqctrl+0x134>
f000f2a4:	e3a03000 	mov	r3, #0
f000f2a8:	ea000011 	b	f000f2f4 <cap_match_irqctrl+0x17c>
f000f2ac:	ea00000f 	b	f000f2f0 <cap_match_irqctrl+0x178>
f000f2b0:	e51b300c 	ldr	r3, [fp, #-12]
f000f2b4:	e59330b8 	ldr	r3, [r3, #184]	; 0xb8
f000f2b8:	e5932000 	ldr	r2, [r3]
f000f2bc:	e51b3010 	ldr	r3, [fp, #-16]
f000f2c0:	e5933010 	ldr	r3, [r3, #16]
f000f2c4:	e1520003 	cmp	r2, r3
f000f2c8:	0a000001 	beq	f000f2d4 <cap_match_irqctrl+0x15c>
f000f2cc:	e3a03000 	mov	r3, #0
f000f2d0:	ea000007 	b	f000f2f4 <cap_match_irqctrl+0x17c>
f000f2d4:	ea000005 	b	f000f2f0 <cap_match_irqctrl+0x178>
f000f2d8:	e59f0020 	ldr	r0, [pc, #32]	; f000f300 <cap_match_irqctrl+0x188>
f000f2dc:	e59f1020 	ldr	r1, [pc, #32]	; f000f304 <cap_match_irqctrl+0x18c>
f000f2e0:	e59f2020 	ldr	r2, [pc, #32]	; f000f308 <cap_match_irqctrl+0x190>
f000f2e4:	e59f3020 	ldr	r3, [pc, #32]	; f000f30c <cap_match_irqctrl+0x194>
f000f2e8:	eb001aff 	bl	f0015eec <printk>
f000f2ec:	eafffffe 	b	f000f2ec <cap_match_irqctrl+0x174>
f000f2f0:	e51b3010 	ldr	r3, [fp, #-16]
f000f2f4:	e1a00003 	mov	r0, r3
f000f2f8:	e24bd004 	sub	sp, fp, #4
f000f2fc:	e8bd8800 	pop	{fp, pc}
f000f300:	f001e958 	.word	0xf001e958
f000f304:	f001e980 	.word	0xf001e980
f000f308:	f001e9e4 	.word	0xf001e9e4
f000f30c:	0000021a 	.word	0x0000021a

f000f310 <cap_match_cache>:
f000f310:	e92d0810 	push	{r4, fp}
f000f314:	e28db004 	add	fp, sp, #4
f000f318:	e24dd030 	sub	sp, sp, #48	; 0x30
f000f31c:	e50b0030 	str	r0, [fp, #-48]	; 0x30
f000f320:	e50b1034 	str	r1, [fp, #-52]	; 0x34
f000f324:	e51b3034 	ldr	r3, [fp, #-52]	; 0x34
f000f328:	e50b3008 	str	r3, [fp, #-8]
f000f32c:	e51b3008 	ldr	r3, [fp, #-8]
f000f330:	e5933000 	ldr	r3, [r3]
f000f334:	e1a03623 	lsr	r3, r3, #12
f000f338:	e50b300c 	str	r3, [fp, #-12]
f000f33c:	e51b3030 	ldr	r3, [fp, #-48]	; 0x30
f000f340:	e593301c 	ldr	r3, [r3, #28]
f000f344:	e3a04000 	mov	r4, #0
f000f348:	e50b3014 	str	r3, [fp, #-20]
f000f34c:	e50b4010 	str	r4, [fp, #-16]
f000f350:	e51b3030 	ldr	r3, [fp, #-48]	; 0x30
f000f354:	e5933020 	ldr	r3, [r3, #32]
f000f358:	e3a04000 	mov	r4, #0
f000f35c:	e50b301c 	str	r3, [fp, #-28]
f000f360:	e50b4018 	str	r4, [fp, #-24]
f000f364:	e51b300c 	ldr	r3, [fp, #-12]
f000f368:	e3a04000 	mov	r4, #0
f000f36c:	e50b3024 	str	r3, [fp, #-36]	; 0x24
f000f370:	e50b4020 	str	r4, [fp, #-32]
f000f374:	e24b2014 	sub	r2, fp, #20
f000f378:	e8920006 	ldm	r2, {r1, r2}
f000f37c:	e24b4024 	sub	r4, fp, #36	; 0x24
f000f380:	e8940018 	ldm	r4, {r3, r4}
f000f384:	e1520004 	cmp	r2, r4
f000f388:	01510003 	cmpeq	r1, r3
f000f38c:	8a00000c 	bhi	f000f3c4 <cap_match_cache+0xb4>
f000f390:	e51b3008 	ldr	r3, [fp, #-8]
f000f394:	e5933004 	ldr	r3, [r3, #4]
f000f398:	e1a01003 	mov	r1, r3
f000f39c:	e3a02000 	mov	r2, #0
f000f3a0:	e24b4024 	sub	r4, fp, #36	; 0x24
f000f3a4:	e8940018 	ldm	r4, {r3, r4}
f000f3a8:	e0911003 	adds	r1, r1, r3
f000f3ac:	e0a22004 	adc	r2, r2, r4
f000f3b0:	e24b401c 	sub	r4, fp, #28
f000f3b4:	e8940018 	ldm	r4, {r3, r4}
f000f3b8:	e1520004 	cmp	r2, r4
f000f3bc:	01510003 	cmpeq	r1, r3
f000f3c0:	9a000001 	bls	f000f3cc <cap_match_cache+0xbc>
f000f3c4:	e3a03000 	mov	r3, #0
f000f3c8:	ea000029 	b	f000f474 <cap_match_cache+0x164>
f000f3cc:	e51b3008 	ldr	r3, [fp, #-8]
f000f3d0:	e5933008 	ldr	r3, [r3, #8]
f000f3d4:	e3530030 	cmp	r3, #48	; 0x30
f000f3d8:	0a000016 	beq	f000f438 <cap_match_cache+0x128>
f000f3dc:	e3530030 	cmp	r3, #48	; 0x30
f000f3e0:	8a000004 	bhi	f000f3f8 <cap_match_cache+0xe8>
f000f3e4:	e3530010 	cmp	r3, #16
f000f3e8:	0a000006 	beq	f000f408 <cap_match_cache+0xf8>
f000f3ec:	e3530020 	cmp	r3, #32
f000f3f0:	0a000004 	beq	f000f408 <cap_match_cache+0xf8>
f000f3f4:	ea00001b 	b	f000f468 <cap_match_cache+0x158>
f000f3f8:	e3530040 	cmp	r3, #64	; 0x40
f000f3fc:	0a00000d 	beq	f000f438 <cap_match_cache+0x128>
f000f400:	e3530050 	cmp	r3, #80	; 0x50
f000f404:	1a000017 	bne	f000f468 <cap_match_cache+0x158>
f000f408:	e3a03080 	mov	r3, #128	; 0x80
f000f40c:	e50b3028 	str	r3, [fp, #-40]	; 0x28
f000f410:	e51b3030 	ldr	r3, [fp, #-48]	; 0x30
f000f414:	e5932018 	ldr	r2, [r3, #24]
f000f418:	e51b3028 	ldr	r3, [fp, #-40]	; 0x28
f000f41c:	e0022003 	and	r2, r2, r3
f000f420:	e51b3028 	ldr	r3, [fp, #-40]	; 0x28
f000f424:	e1520003 	cmp	r2, r3
f000f428:	0a000001 	beq	f000f434 <cap_match_cache+0x124>
f000f42c:	e3a03000 	mov	r3, #0
f000f430:	ea00000f 	b	f000f474 <cap_match_cache+0x164>
f000f434:	ea00000d 	b	f000f470 <cap_match_cache+0x160>
f000f438:	e3a03c01 	mov	r3, #256	; 0x100
f000f43c:	e50b3028 	str	r3, [fp, #-40]	; 0x28
f000f440:	e51b3030 	ldr	r3, [fp, #-48]	; 0x30
f000f444:	e5932018 	ldr	r2, [r3, #24]
f000f448:	e51b3028 	ldr	r3, [fp, #-40]	; 0x28
f000f44c:	e0022003 	and	r2, r2, r3
f000f450:	e51b3028 	ldr	r3, [fp, #-40]	; 0x28
f000f454:	e1520003 	cmp	r2, r3
f000f458:	0a000001 	beq	f000f464 <cap_match_cache+0x154>
f000f45c:	e3a03000 	mov	r3, #0
f000f460:	ea000003 	b	f000f474 <cap_match_cache+0x164>
f000f464:	ea000001 	b	f000f470 <cap_match_cache+0x160>
f000f468:	e3a03000 	mov	r3, #0
f000f46c:	ea000000 	b	f000f474 <cap_match_cache+0x164>
f000f470:	e51b3030 	ldr	r3, [fp, #-48]	; 0x30
f000f474:	e1a00003 	mov	r0, r3
f000f478:	e24bd004 	sub	sp, fp, #4
f000f47c:	e8bd0810 	pop	{r4, fp}
f000f480:	e12fff1e 	bx	lr

f000f484 <cap_map_check>:
f000f484:	e92d4800 	push	{fp, lr}
f000f488:	e28db004 	add	fp, sp, #4
f000f48c:	e24dd030 	sub	sp, sp, #48	; 0x30
f000f490:	e50b0028 	str	r0, [fp, #-40]	; 0x28
f000f494:	e50b102c 	str	r1, [fp, #-44]	; 0x2c
f000f498:	e50b2030 	str	r2, [fp, #-48]	; 0x30
f000f49c:	e50b3034 	str	r3, [fp, #-52]	; 0x34
f000f4a0:	e51b3028 	ldr	r3, [fp, #-40]	; 0x28
f000f4a4:	e50b3020 	str	r3, [fp, #-32]
f000f4a8:	e51b302c 	ldr	r3, [fp, #-44]	; 0x2c
f000f4ac:	e50b301c 	str	r3, [fp, #-28]
f000f4b0:	e51b3030 	ldr	r3, [fp, #-48]	; 0x30
f000f4b4:	e50b3018 	str	r3, [fp, #-24]
f000f4b8:	e51b3034 	ldr	r3, [fp, #-52]	; 0x34
f000f4bc:	e50b3014 	str	r3, [fp, #-20]
f000f4c0:	e59b3004 	ldr	r3, [fp, #4]
f000f4c4:	e50b3010 	str	r3, [fp, #-16]
f000f4c8:	ebfffbb0 	bl	f000e390 <current_task>
f000f4cc:	e1a02000 	mov	r2, r0
f000f4d0:	e24b3020 	sub	r3, fp, #32
f000f4d4:	e1a00002 	mov	r0, r2
f000f4d8:	e59f1068 	ldr	r1, [pc, #104]	; f000f548 <cap_map_check+0xc4>
f000f4dc:	e1a02003 	mov	r2, r3
f000f4e0:	e3a03004 	mov	r3, #4
f000f4e4:	ebfffc68 	bl	f000e68c <cap_find>
f000f4e8:	e50b0008 	str	r0, [fp, #-8]
f000f4ec:	e51b3008 	ldr	r3, [fp, #-8]
f000f4f0:	e3530000 	cmp	r3, #0
f000f4f4:	1a000001 	bne	f000f500 <cap_map_check+0x7c>
f000f4f8:	e3e03085 	mvn	r3, #133	; 0x85
f000f4fc:	ea00000e 	b	f000f53c <cap_map_check+0xb8>
f000f500:	ebfffba2 	bl	f000e390 <current_task>
f000f504:	e1a02000 	mov	r2, r0
f000f508:	e24b3020 	sub	r3, fp, #32
f000f50c:	e1a00002 	mov	r0, r2
f000f510:	e59f1030 	ldr	r1, [pc, #48]	; f000f548 <cap_map_check+0xc4>
f000f514:	e1a02003 	mov	r2, r3
f000f518:	e3a03008 	mov	r3, #8
f000f51c:	ebfffc5a 	bl	f000e68c <cap_find>
f000f520:	e50b000c 	str	r0, [fp, #-12]
f000f524:	e51b300c 	ldr	r3, [fp, #-12]
f000f528:	e3530000 	cmp	r3, #0
f000f52c:	1a000001 	bne	f000f538 <cap_map_check+0xb4>
f000f530:	e3e03085 	mvn	r3, #133	; 0x85
f000f534:	ea000000 	b	f000f53c <cap_map_check+0xb8>
f000f538:	e3a03000 	mov	r3, #0
f000f53c:	e1a00003 	mov	r0, r3
f000f540:	e24bd004 	sub	sp, fp, #4
f000f544:	e8bd8800 	pop	{fp, pc}
f000f548:	f000ee64 	.word	0xf000ee64

f000f54c <cap_unmap_check>:
f000f54c:	e92d4800 	push	{fp, lr}
f000f550:	e28db004 	add	fp, sp, #4
f000f554:	e24dd028 	sub	sp, sp, #40	; 0x28
f000f558:	e50b0020 	str	r0, [fp, #-32]
f000f55c:	e50b1024 	str	r1, [fp, #-36]	; 0x24
f000f560:	e50b2028 	str	r2, [fp, #-40]	; 0x28
f000f564:	e24b301c 	sub	r3, fp, #28
f000f568:	e3a02000 	mov	r2, #0
f000f56c:	e5832000 	str	r2, [r3]
f000f570:	e2833004 	add	r3, r3, #4
f000f574:	e3a02000 	mov	r2, #0
f000f578:	e5832000 	str	r2, [r3]
f000f57c:	e2833004 	add	r3, r3, #4
f000f580:	e3a02000 	mov	r2, #0
f000f584:	e5832000 	str	r2, [r3]
f000f588:	e2833004 	add	r3, r3, #4
f000f58c:	e3a02000 	mov	r2, #0
f000f590:	e5832000 	str	r2, [r3]
f000f594:	e2833004 	add	r3, r3, #4
f000f598:	e3a02000 	mov	r2, #0
f000f59c:	e5832000 	str	r2, [r3]
f000f5a0:	e2833004 	add	r3, r3, #4
f000f5a4:	e51b3020 	ldr	r3, [fp, #-32]
f000f5a8:	e50b301c 	str	r3, [fp, #-28]
f000f5ac:	e51b3024 	ldr	r3, [fp, #-36]	; 0x24
f000f5b0:	e50b3014 	str	r3, [fp, #-20]
f000f5b4:	e51b3028 	ldr	r3, [fp, #-40]	; 0x28
f000f5b8:	e50b3010 	str	r3, [fp, #-16]
f000f5bc:	e3a0300a 	mov	r3, #10
f000f5c0:	e50b300c 	str	r3, [fp, #-12]
f000f5c4:	ebfffb71 	bl	f000e390 <current_task>
f000f5c8:	e1a02000 	mov	r2, r0
f000f5cc:	e24b301c 	sub	r3, fp, #28
f000f5d0:	e1a00002 	mov	r0, r2
f000f5d4:	e59f1030 	ldr	r1, [pc, #48]	; f000f60c <cap_unmap_check+0xc0>
f000f5d8:	e1a02003 	mov	r2, r3
f000f5dc:	e3a03008 	mov	r3, #8
f000f5e0:	ebfffc29 	bl	f000e68c <cap_find>
f000f5e4:	e50b0008 	str	r0, [fp, #-8]
f000f5e8:	e51b3008 	ldr	r3, [fp, #-8]
f000f5ec:	e3530000 	cmp	r3, #0
f000f5f0:	1a000001 	bne	f000f5fc <cap_unmap_check+0xb0>
f000f5f4:	e3e03085 	mvn	r3, #133	; 0x85
f000f5f8:	ea000000 	b	f000f600 <cap_unmap_check+0xb4>
f000f5fc:	e3a03000 	mov	r3, #0
f000f600:	e1a00003 	mov	r0, r3
f000f604:	e24bd004 	sub	sp, fp, #4
f000f608:	e8bd8800 	pop	{fp, pc}
f000f60c:	f000ee64 	.word	0xf000ee64

f000f610 <cap_ipc_check>:
f000f610:	e92d4800 	push	{fp, lr}
f000f614:	e28db004 	add	fp, sp, #4
f000f618:	e24dd020 	sub	sp, sp, #32
f000f61c:	e50b0018 	str	r0, [fp, #-24]
f000f620:	e50b101c 	str	r1, [fp, #-28]
f000f624:	e50b2020 	str	r2, [fp, #-32]
f000f628:	e50b3024 	str	r3, [fp, #-36]	; 0x24
f000f62c:	e51b3024 	ldr	r3, [fp, #-36]	; 0x24
f000f630:	e3530001 	cmp	r3, #1
f000f634:	0a000004 	beq	f000f64c <cap_ipc_check+0x3c>
f000f638:	e51b3024 	ldr	r3, [fp, #-36]	; 0x24
f000f63c:	e3530003 	cmp	r3, #3
f000f640:	0a000001 	beq	f000f64c <cap_ipc_check+0x3c>
f000f644:	e3a03000 	mov	r3, #0
f000f648:	ea00001d 	b	f000f6c4 <cap_ipc_check+0xb4>
f000f64c:	e51b0018 	ldr	r0, [fp, #-24]
f000f650:	ebffecca 	bl	f000a980 <tcb_find>
f000f654:	e50b0008 	str	r0, [fp, #-8]
f000f658:	e51b3008 	ldr	r3, [fp, #-8]
f000f65c:	e3530000 	cmp	r3, #0
f000f660:	1a000001 	bne	f000f66c <cap_ipc_check+0x5c>
f000f664:	e3e03002 	mvn	r3, #2
f000f668:	ea000015 	b	f000f6c4 <cap_ipc_check+0xb4>
f000f66c:	e51b0020 	ldr	r0, [fp, #-32]
f000f670:	ebfffb4f 	bl	f000e3b4 <ipc_flags_get_type>
f000f674:	e1a03000 	mov	r3, r0
f000f678:	e50b300c 	str	r3, [fp, #-12]
f000f67c:	e51b3024 	ldr	r3, [fp, #-36]	; 0x24
f000f680:	e50b3010 	str	r3, [fp, #-16]
f000f684:	e51b3008 	ldr	r3, [fp, #-8]
f000f688:	e50b3014 	str	r3, [fp, #-20]
f000f68c:	ebfffb3f 	bl	f000e390 <current_task>
f000f690:	e1a02000 	mov	r2, r0
f000f694:	e24b3014 	sub	r3, fp, #20
f000f698:	e1a00002 	mov	r0, r2
f000f69c:	e59f102c 	ldr	r1, [pc, #44]	; f000f6d0 <cap_ipc_check+0xc0>
f000f6a0:	e1a02003 	mov	r2, r3
f000f6a4:	e3a03010 	mov	r3, #16
f000f6a8:	ebfffbf7 	bl	f000e68c <cap_find>
f000f6ac:	e1a03000 	mov	r3, r0
f000f6b0:	e3530000 	cmp	r3, #0
f000f6b4:	1a000001 	bne	f000f6c0 <cap_ipc_check+0xb0>
f000f6b8:	e3e03085 	mvn	r3, #133	; 0x85
f000f6bc:	ea000000 	b	f000f6c4 <cap_ipc_check+0xb4>
f000f6c0:	e3a03000 	mov	r3, #0
f000f6c4:	e1a00003 	mov	r0, r3
f000f6c8:	e24bd004 	sub	sp, fp, #4
f000f6cc:	e8bd8800 	pop	{fp, pc}
f000f6d0:	f000e7d0 	.word	0xf000e7d0

f000f6d4 <cap_exregs_check>:
f000f6d4:	e92d4800 	push	{fp, lr}
f000f6d8:	e28db004 	add	fp, sp, #4
f000f6dc:	e24dd010 	sub	sp, sp, #16
f000f6e0:	e50b0010 	str	r0, [fp, #-16]
f000f6e4:	e50b1014 	str	r1, [fp, #-20]
f000f6e8:	e51b3014 	ldr	r3, [fp, #-20]
f000f6ec:	e50b300c 	str	r3, [fp, #-12]
f000f6f0:	e51b3010 	ldr	r3, [fp, #-16]
f000f6f4:	e50b3008 	str	r3, [fp, #-8]
f000f6f8:	ebfffb24 	bl	f000e390 <current_task>
f000f6fc:	e1a02000 	mov	r2, r0
f000f700:	e24b300c 	sub	r3, fp, #12
f000f704:	e1a00002 	mov	r0, r2
f000f708:	e59f102c 	ldr	r1, [pc, #44]	; f000f73c <cap_exregs_check+0x68>
f000f70c:	e1a02003 	mov	r2, r3
f000f710:	e3a03002 	mov	r3, #2
f000f714:	ebfffbdc 	bl	f000e68c <cap_find>
f000f718:	e1a03000 	mov	r3, r0
f000f71c:	e3530000 	cmp	r3, #0
f000f720:	1a000001 	bne	f000f72c <cap_exregs_check+0x58>
f000f724:	e3e03085 	mvn	r3, #133	; 0x85
f000f728:	ea000000 	b	f000f730 <cap_exregs_check+0x5c>
f000f72c:	e3a03000 	mov	r3, #0
f000f730:	e1a00003 	mov	r0, r3
f000f734:	e24bd004 	sub	sp, fp, #4
f000f738:	e8bd8800 	pop	{fp, pc}
f000f73c:	f000e984 	.word	0xf000e984

f000f740 <cap_thread_check>:
f000f740:	e92d4800 	push	{fp, lr}
f000f744:	e28db004 	add	fp, sp, #4
f000f748:	e24dd020 	sub	sp, sp, #32
f000f74c:	e50b0018 	str	r0, [fp, #-24]
f000f750:	e50b101c 	str	r1, [fp, #-28]
f000f754:	e50b2020 	str	r2, [fp, #-32]
f000f758:	e51b3018 	ldr	r3, [fp, #-24]
f000f75c:	e50b3010 	str	r3, [fp, #-16]
f000f760:	e51b301c 	ldr	r3, [fp, #-28]
f000f764:	e50b300c 	str	r3, [fp, #-12]
f000f768:	e51b3020 	ldr	r3, [fp, #-32]
f000f76c:	e50b3008 	str	r3, [fp, #-8]
f000f770:	ebfffb06 	bl	f000e390 <current_task>
f000f774:	e1a02000 	mov	r2, r0
f000f778:	e24b3010 	sub	r3, fp, #16
f000f77c:	e1a00002 	mov	r0, r2
f000f780:	e59f102c 	ldr	r1, [pc, #44]	; f000f7b4 <cap_thread_check+0x74>
f000f784:	e1a02003 	mov	r2, r3
f000f788:	e3a03001 	mov	r3, #1
f000f78c:	ebfffbbe 	bl	f000e68c <cap_find>
f000f790:	e1a03000 	mov	r3, r0
f000f794:	e3530000 	cmp	r3, #0
f000f798:	1a000001 	bne	f000f7a4 <cap_thread_check+0x64>
f000f79c:	e3e03085 	mvn	r3, #133	; 0x85
f000f7a0:	ea000000 	b	f000f7a8 <cap_thread_check+0x68>
f000f7a4:	e3a03000 	mov	r3, #0
f000f7a8:	e1a00003 	mov	r0, r3
f000f7ac:	e24bd004 	sub	sp, fp, #4
f000f7b0:	e8bd8800 	pop	{fp, pc}
f000f7b4:	f000eb8c 	.word	0xf000eb8c

f000f7b8 <cap_irq_check>:
f000f7b8:	e92d4800 	push	{fp, lr}
f000f7bc:	e28db004 	add	fp, sp, #4
f000f7c0:	e24dd020 	sub	sp, sp, #32
f000f7c4:	e50b0018 	str	r0, [fp, #-24]
f000f7c8:	e50b101c 	str	r1, [fp, #-28]
f000f7cc:	e50b2020 	str	r2, [fp, #-32]
f000f7d0:	e50b3024 	str	r3, [fp, #-36]	; 0x24
f000f7d4:	e51b3018 	ldr	r3, [fp, #-24]
f000f7d8:	e50b3014 	str	r3, [fp, #-20]
f000f7dc:	e51b301c 	ldr	r3, [fp, #-28]
f000f7e0:	e50b3010 	str	r3, [fp, #-16]
f000f7e4:	e51b3020 	ldr	r3, [fp, #-32]
f000f7e8:	e50b300c 	str	r3, [fp, #-12]
f000f7ec:	e51b3024 	ldr	r3, [fp, #-36]	; 0x24
f000f7f0:	e50b3008 	str	r3, [fp, #-8]
f000f7f4:	ebfffae5 	bl	f000e390 <current_task>
f000f7f8:	e1a02000 	mov	r2, r0
f000f7fc:	e24b3014 	sub	r3, fp, #20
f000f800:	e1a00002 	mov	r0, r2
f000f804:	e59f102c 	ldr	r1, [pc, #44]	; f000f838 <cap_irq_check+0x80>
f000f808:	e1a02003 	mov	r2, r3
f000f80c:	e3a03020 	mov	r3, #32
f000f810:	ebfffb9d 	bl	f000e68c <cap_find>
f000f814:	e1a03000 	mov	r3, r0
f000f818:	e3530000 	cmp	r3, #0
f000f81c:	1a000001 	bne	f000f828 <cap_irq_check+0x70>
f000f820:	e3e03085 	mvn	r3, #133	; 0x85
f000f824:	ea000000 	b	f000f82c <cap_irq_check+0x74>
f000f828:	e3a03000 	mov	r3, #0
f000f82c:	e1a00003 	mov	r0, r3
f000f830:	e24bd004 	sub	sp, fp, #4
f000f834:	e8bd8800 	pop	{fp, pc}
f000f838:	f000f178 	.word	0xf000f178

f000f83c <cap_cache_check>:
f000f83c:	e92d4800 	push	{fp, lr}
f000f840:	e28db004 	add	fp, sp, #4
f000f844:	e24dd020 	sub	sp, sp, #32
f000f848:	e50b0018 	str	r0, [fp, #-24]
f000f84c:	e50b101c 	str	r1, [fp, #-28]
f000f850:	e50b2020 	str	r2, [fp, #-32]
f000f854:	e51b3018 	ldr	r3, [fp, #-24]
f000f858:	e50b3014 	str	r3, [fp, #-20]
f000f85c:	e51b301c 	ldr	r3, [fp, #-28]
f000f860:	e1a02623 	lsr	r2, r3, #12
f000f864:	e51b3018 	ldr	r3, [fp, #-24]
f000f868:	e1a03623 	lsr	r3, r3, #12
f000f86c:	e0633002 	rsb	r3, r3, r2
f000f870:	e50b3010 	str	r3, [fp, #-16]
f000f874:	e51b3020 	ldr	r3, [fp, #-32]
f000f878:	e50b300c 	str	r3, [fp, #-12]
f000f87c:	ebfffac3 	bl	f000e390 <current_task>
f000f880:	e1a02000 	mov	r2, r0
f000f884:	e24b3014 	sub	r3, fp, #20
f000f888:	e1a00002 	mov	r0, r2
f000f88c:	e59f1030 	ldr	r1, [pc, #48]	; f000f8c4 <cap_cache_check+0x88>
f000f890:	e1a02003 	mov	r2, r3
f000f894:	e3a03008 	mov	r3, #8
f000f898:	ebfffb7b 	bl	f000e68c <cap_find>
f000f89c:	e50b0008 	str	r0, [fp, #-8]
f000f8a0:	e51b3008 	ldr	r3, [fp, #-8]
f000f8a4:	e3530000 	cmp	r3, #0
f000f8a8:	1a000001 	bne	f000f8b4 <cap_cache_check+0x78>
f000f8ac:	e3e03085 	mvn	r3, #133	; 0x85
f000f8b0:	ea000000 	b	f000f8b8 <cap_cache_check+0x7c>
f000f8b4:	e3a03000 	mov	r3, #0
f000f8b8:	e1a00003 	mov	r0, r3
f000f8bc:	e24bd004 	sub	sp, fp, #4
f000f8c0:	e8bd8800 	pop	{fp, pc}
f000f8c4:	f000f310 	.word	0xf000f310

f000f8c8 <link_init>:
f000f8c8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f000f8cc:	e28db000 	add	fp, sp, #0
f000f8d0:	e24dd00c 	sub	sp, sp, #12
f000f8d4:	e50b0008 	str	r0, [fp, #-8]
f000f8d8:	e51b3008 	ldr	r3, [fp, #-8]
f000f8dc:	e51b2008 	ldr	r2, [fp, #-8]
f000f8e0:	e5832000 	str	r2, [r3]
f000f8e4:	e51b3008 	ldr	r3, [fp, #-8]
f000f8e8:	e51b2008 	ldr	r2, [fp, #-8]
f000f8ec:	e5832004 	str	r2, [r3, #4]
f000f8f0:	e24bd000 	sub	sp, fp, #0
f000f8f4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f000f8f8:	e12fff1e 	bx	lr

f000f8fc <cap_list_init>:
f000f8fc:	e92d4800 	push	{fp, lr}
f000f900:	e28db004 	add	fp, sp, #4
f000f904:	e24dd008 	sub	sp, sp, #8
f000f908:	e50b0008 	str	r0, [fp, #-8]
f000f90c:	e51b3008 	ldr	r3, [fp, #-8]
f000f910:	e3a02000 	mov	r2, #0
f000f914:	e5832000 	str	r2, [r3]
f000f918:	e51b3008 	ldr	r3, [fp, #-8]
f000f91c:	e2833004 	add	r3, r3, #4
f000f920:	e1a00003 	mov	r0, r3
f000f924:	ebffffe7 	bl	f000f8c8 <link_init>
f000f928:	e24bd004 	sub	sp, fp, #4
f000f92c:	e8bd8800 	pop	{fp, pc}

f000f930 <current_task>:
f000f930:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f000f934:	e28db000 	add	fp, sp, #0
f000f938:	e1a0300d 	mov	r3, sp
f000f93c:	e3c33eff 	bic	r3, r3, #4080	; 0xff0
f000f940:	e3c3300f 	bic	r3, r3, #15
f000f944:	e1a00003 	mov	r0, r3
f000f948:	e24bd000 	sub	sp, fp, #0
f000f94c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f000f950:	e12fff1e 	bx	lr

f000f954 <setup_idle_task>:
f000f954:	e92d4800 	push	{fp, lr}
f000f958:	e28db004 	add	fp, sp, #4
f000f95c:	ebfffff3 	bl	f000f930 <current_task>
f000f960:	e1a03000 	mov	r3, r0
f000f964:	e1a00003 	mov	r0, r3
f000f968:	e3a01000 	mov	r1, #0
f000f96c:	e3a02f46 	mov	r2, #280	; 0x118
f000f970:	eb001988 	bl	f0015f98 <memset>
f000f974:	ebffffed 	bl	f000f930 <current_task>
f000f978:	e1a03000 	mov	r3, r0
f000f97c:	e59f2064 	ldr	r2, [pc, #100]	; f000f9e8 <setup_idle_task+0x94>
f000f980:	e58320b4 	str	r2, [r3, #180]	; 0xb4
f000f984:	ebffffe9 	bl	f000f930 <current_task>
f000f988:	e1a03000 	mov	r3, r0
f000f98c:	e59330b4 	ldr	r3, [r3, #180]	; 0xb4
f000f990:	e59f2054 	ldr	r2, [pc, #84]	; f000f9ec <setup_idle_task+0x98>
f000f994:	e5832010 	str	r2, [r3, #16]
f000f998:	ebffffe4 	bl	f000f930 <current_task>
f000f99c:	e1a03000 	mov	r3, r0
f000f9a0:	e59330b4 	ldr	r3, [r3, #180]	; 0xb4
f000f9a4:	e2833014 	add	r3, r3, #20
f000f9a8:	e1a00003 	mov	r0, r3
f000f9ac:	ebffffd2 	bl	f000f8fc <cap_list_init>
f000f9b0:	ebffffde 	bl	f000f930 <current_task>
f000f9b4:	e1a03000 	mov	r3, r0
f000f9b8:	e1a00003 	mov	r0, r3
f000f9bc:	e3a01004 	mov	r1, #4
f000f9c0:	ebffe4f7 	bl	f0008da4 <sched_init_task>
f000f9c4:	ebffffd9 	bl	f000f930 <current_task>
f000f9c8:	e1a03000 	mov	r3, r0
f000f9cc:	e3a02000 	mov	r2, #0
f000f9d0:	e58320bc 	str	r2, [r3, #188]	; 0xbc
f000f9d4:	ebffffd5 	bl	f000f930 <current_task>
f000f9d8:	e1a03000 	mov	r3, r0
f000f9dc:	e3e02000 	mvn	r2, #0
f000f9e0:	e5832058 	str	r2, [r3, #88]	; 0x58
f000f9e4:	e8bd8800 	pop	{fp, pc}
f000f9e8:	f0033140 	.word	0xf0033140
f000f9ec:	f0028000 	.word	0xf0028000

f000f9f0 <secondary_idle_task_init>:
f000f9f0:	e92d4818 	push	{r3, r4, fp, lr}
f000f9f4:	e28db00c 	add	fp, sp, #12
f000f9f8:	ebffffcc 	bl	f000f930 <current_task>
f000f9fc:	e1a03000 	mov	r3, r0
f000fa00:	e59f2084 	ldr	r2, [pc, #132]	; f000fa8c <secondary_idle_task_init+0x9c>
f000fa04:	e58320b4 	str	r2, [r3, #180]	; 0xb4
f000fa08:	ebffffc8 	bl	f000f930 <current_task>
f000fa0c:	e1a03000 	mov	r3, r0
f000fa10:	e59330b4 	ldr	r3, [r3, #180]	; 0xb4
f000fa14:	e59f2074 	ldr	r2, [pc, #116]	; f000fa90 <secondary_idle_task_init+0xa0>
f000fa18:	e5832010 	str	r2, [r3, #16]
f000fa1c:	ebffffc3 	bl	f000f930 <current_task>
f000fa20:	e1a04000 	mov	r4, r0
f000fa24:	e59f0068 	ldr	r0, [pc, #104]	; f000fa94 <secondary_idle_task_init+0xa4>
f000fa28:	eb001e1e 	bl	f00172a8 <id_new>
f000fa2c:	e1a03000 	mov	r3, r0
f000fa30:	e5843054 	str	r3, [r4, #84]	; 0x54
f000fa34:	ebffffbd 	bl	f000f930 <current_task>
f000fa38:	e1a03000 	mov	r3, r0
f000fa3c:	e3a02000 	mov	r2, #0
f000fa40:	e583205c 	str	r2, [r3, #92]	; 0x5c
f000fa44:	ebffffb9 	bl	f000f930 <current_task>
f000fa48:	e1a03000 	mov	r3, r0
f000fa4c:	e3a02000 	mov	r2, #0
f000fa50:	e58320bc 	str	r2, [r3, #188]	; 0xbc
f000fa54:	ebffffb5 	bl	f000f930 <current_task>
f000fa58:	e1a03000 	mov	r3, r0
f000fa5c:	e3e02000 	mvn	r2, #0
f000fa60:	e5832058 	str	r2, [r3, #88]	; 0x58
f000fa64:	ebffffb1 	bl	f000f930 <current_task>
f000fa68:	e1a03000 	mov	r3, r0
f000fa6c:	e1a00003 	mov	r0, r3
f000fa70:	e3a01004 	mov	r1, #4
f000fa74:	ebffe4ca 	bl	f0008da4 <sched_init_task>
f000fa78:	ebffffac 	bl	f000f930 <current_task>
f000fa7c:	e1a03000 	mov	r3, r0
f000fa80:	e1a00003 	mov	r0, r3
f000fa84:	ebffe501 	bl	f0008e90 <sched_resume_async>
f000fa88:	e8bd8818 	pop	{r3, r4, fp, pc}
f000fa8c:	f0033140 	.word	0xf0033140
f000fa90:	f0028000 	.word	0xf0028000
f000fa94:	f002e0a8 	.word	0xf002e0a8

f000fa98 <cpu_startup>:
f000fa98:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f000fa9c:	e28db000 	add	fp, sp, #0
f000faa0:	e24bd000 	sub	sp, fp, #0
f000faa4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f000faa8:	e12fff1e 	bx	lr

f000faac <smp_start_cores>:
f000faac:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f000fab0:	e28db000 	add	fp, sp, #0
f000fab4:	e24bd000 	sub	sp, fp, #0
f000fab8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f000fabc:	e12fff1e 	bx	lr

f000fac0 <current_task>:
f000fac0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f000fac4:	e28db000 	add	fp, sp, #0
f000fac8:	e1a0300d 	mov	r3, sp
f000facc:	e3c33eff 	bic	r3, r3, #4080	; 0xff0
f000fad0:	e3c3300f 	bic	r3, r3, #15
f000fad4:	e1a00003 	mov	r0, r3
f000fad8:	e24bd000 	sub	sp, fp, #0
f000fadc:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f000fae0:	e12fff1e 	bx	lr

f000fae4 <perfmon_init>:
f000fae4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f000fae8:	e28db000 	add	fp, sp, #0
f000faec:	e24bd000 	sub	sp, fp, #0
f000faf0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f000faf4:	e12fff1e 	bx	lr

f000faf8 <print_sections>:
f000faf8:	e92d4800 	push	{fp, lr}
f000fafc:	e28db004 	add	fp, sp, #4
f000fb00:	e59f0264 	ldr	r0, [pc, #612]	; f000fd6c <print_sections+0x274>
f000fb04:	eb0037de 	bl	f001da84 <print_early>
f000fb08:	e59f3260 	ldr	r3, [pc, #608]	; f000fd70 <print_sections+0x278>
f000fb0c:	e1a00003 	mov	r0, r3
f000fb10:	eb003808 	bl	f001db38 <printhex8>
f000fb14:	e59f0258 	ldr	r0, [pc, #600]	; f000fd74 <print_sections+0x27c>
f000fb18:	eb0037d9 	bl	f001da84 <print_early>
f000fb1c:	e59f0254 	ldr	r0, [pc, #596]	; f000fd78 <print_sections+0x280>
f000fb20:	eb0037d7 	bl	f001da84 <print_early>
f000fb24:	e59f3250 	ldr	r3, [pc, #592]	; f000fd7c <print_sections+0x284>
f000fb28:	e1a00003 	mov	r0, r3
f000fb2c:	eb003801 	bl	f001db38 <printhex8>
f000fb30:	e59f023c 	ldr	r0, [pc, #572]	; f000fd74 <print_sections+0x27c>
f000fb34:	eb0037d2 	bl	f001da84 <print_early>
f000fb38:	e59f0240 	ldr	r0, [pc, #576]	; f000fd80 <print_sections+0x288>
f000fb3c:	eb0037d0 	bl	f001da84 <print_early>
f000fb40:	e59f323c 	ldr	r3, [pc, #572]	; f000fd84 <print_sections+0x28c>
f000fb44:	e1a00003 	mov	r0, r3
f000fb48:	eb0037fa 	bl	f001db38 <printhex8>
f000fb4c:	e59f0220 	ldr	r0, [pc, #544]	; f000fd74 <print_sections+0x27c>
f000fb50:	eb0037cb 	bl	f001da84 <print_early>
f000fb54:	e59f022c 	ldr	r0, [pc, #556]	; f000fd88 <print_sections+0x290>
f000fb58:	eb0037c9 	bl	f001da84 <print_early>
f000fb5c:	e59f3228 	ldr	r3, [pc, #552]	; f000fd8c <print_sections+0x294>
f000fb60:	e1a00003 	mov	r0, r3
f000fb64:	eb0037f3 	bl	f001db38 <printhex8>
f000fb68:	e59f0204 	ldr	r0, [pc, #516]	; f000fd74 <print_sections+0x27c>
f000fb6c:	eb0037c4 	bl	f001da84 <print_early>
f000fb70:	e59f0218 	ldr	r0, [pc, #536]	; f000fd90 <print_sections+0x298>
f000fb74:	eb0037c2 	bl	f001da84 <print_early>
f000fb78:	e59f3214 	ldr	r3, [pc, #532]	; f000fd94 <print_sections+0x29c>
f000fb7c:	e1a00003 	mov	r0, r3
f000fb80:	eb0037ec 	bl	f001db38 <printhex8>
f000fb84:	e59f01e8 	ldr	r0, [pc, #488]	; f000fd74 <print_sections+0x27c>
f000fb88:	eb0037bd 	bl	f001da84 <print_early>
f000fb8c:	e59f0204 	ldr	r0, [pc, #516]	; f000fd98 <print_sections+0x2a0>
f000fb90:	eb0037bb 	bl	f001da84 <print_early>
f000fb94:	e59f3200 	ldr	r3, [pc, #512]	; f000fd9c <print_sections+0x2a4>
f000fb98:	e1a00003 	mov	r0, r3
f000fb9c:	eb0037e5 	bl	f001db38 <printhex8>
f000fba0:	e59f01cc 	ldr	r0, [pc, #460]	; f000fd74 <print_sections+0x27c>
f000fba4:	eb0037b6 	bl	f001da84 <print_early>
f000fba8:	e59f01f0 	ldr	r0, [pc, #496]	; f000fda0 <print_sections+0x2a8>
f000fbac:	eb0037b4 	bl	f001da84 <print_early>
f000fbb0:	e59f31ec 	ldr	r3, [pc, #492]	; f000fda4 <print_sections+0x2ac>
f000fbb4:	e1a00003 	mov	r0, r3
f000fbb8:	eb0037de 	bl	f001db38 <printhex8>
f000fbbc:	e59f01b0 	ldr	r0, [pc, #432]	; f000fd74 <print_sections+0x27c>
f000fbc0:	eb0037af 	bl	f001da84 <print_early>
f000fbc4:	e59f01dc 	ldr	r0, [pc, #476]	; f000fda8 <print_sections+0x2b0>
f000fbc8:	eb0037ad 	bl	f001da84 <print_early>
f000fbcc:	e59f31d8 	ldr	r3, [pc, #472]	; f000fdac <print_sections+0x2b4>
f000fbd0:	e1a00003 	mov	r0, r3
f000fbd4:	eb0037d7 	bl	f001db38 <printhex8>
f000fbd8:	e59f0194 	ldr	r0, [pc, #404]	; f000fd74 <print_sections+0x27c>
f000fbdc:	eb0037a8 	bl	f001da84 <print_early>
f000fbe0:	e59f01c8 	ldr	r0, [pc, #456]	; f000fdb0 <print_sections+0x2b8>
f000fbe4:	eb0037a6 	bl	f001da84 <print_early>
f000fbe8:	e59f31c4 	ldr	r3, [pc, #452]	; f000fdb4 <print_sections+0x2bc>
f000fbec:	e1a00003 	mov	r0, r3
f000fbf0:	eb0037d0 	bl	f001db38 <printhex8>
f000fbf4:	e59f0178 	ldr	r0, [pc, #376]	; f000fd74 <print_sections+0x27c>
f000fbf8:	eb0037a1 	bl	f001da84 <print_early>
f000fbfc:	e59f01b4 	ldr	r0, [pc, #436]	; f000fdb8 <print_sections+0x2c0>
f000fc00:	eb00379f 	bl	f001da84 <print_early>
f000fc04:	e59f31b0 	ldr	r3, [pc, #432]	; f000fdbc <print_sections+0x2c4>
f000fc08:	e1a00003 	mov	r0, r3
f000fc0c:	eb0037c9 	bl	f001db38 <printhex8>
f000fc10:	e59f015c 	ldr	r0, [pc, #348]	; f000fd74 <print_sections+0x27c>
f000fc14:	eb00379a 	bl	f001da84 <print_early>
f000fc18:	e59f01a0 	ldr	r0, [pc, #416]	; f000fdc0 <print_sections+0x2c8>
f000fc1c:	eb003798 	bl	f001da84 <print_early>
f000fc20:	e59f319c 	ldr	r3, [pc, #412]	; f000fdc4 <print_sections+0x2cc>
f000fc24:	e1a00003 	mov	r0, r3
f000fc28:	eb0037c2 	bl	f001db38 <printhex8>
f000fc2c:	e59f0140 	ldr	r0, [pc, #320]	; f000fd74 <print_sections+0x27c>
f000fc30:	eb003793 	bl	f001da84 <print_early>
f000fc34:	e59f018c 	ldr	r0, [pc, #396]	; f000fdc8 <print_sections+0x2d0>
f000fc38:	eb003791 	bl	f001da84 <print_early>
f000fc3c:	e59f3188 	ldr	r3, [pc, #392]	; f000fdcc <print_sections+0x2d4>
f000fc40:	e1a00003 	mov	r0, r3
f000fc44:	eb0037bb 	bl	f001db38 <printhex8>
f000fc48:	e59f0124 	ldr	r0, [pc, #292]	; f000fd74 <print_sections+0x27c>
f000fc4c:	eb00378c 	bl	f001da84 <print_early>
f000fc50:	e59f0178 	ldr	r0, [pc, #376]	; f000fdd0 <print_sections+0x2d8>
f000fc54:	eb00378a 	bl	f001da84 <print_early>
f000fc58:	e59f3174 	ldr	r3, [pc, #372]	; f000fdd4 <print_sections+0x2dc>
f000fc5c:	e1a00003 	mov	r0, r3
f000fc60:	eb0037b4 	bl	f001db38 <printhex8>
f000fc64:	e59f0108 	ldr	r0, [pc, #264]	; f000fd74 <print_sections+0x27c>
f000fc68:	eb003785 	bl	f001da84 <print_early>
f000fc6c:	e59f0164 	ldr	r0, [pc, #356]	; f000fdd8 <print_sections+0x2e0>
f000fc70:	eb003783 	bl	f001da84 <print_early>
f000fc74:	e59f3160 	ldr	r3, [pc, #352]	; f000fddc <print_sections+0x2e4>
f000fc78:	e1a00003 	mov	r0, r3
f000fc7c:	eb0037ad 	bl	f001db38 <printhex8>
f000fc80:	e59f00ec 	ldr	r0, [pc, #236]	; f000fd74 <print_sections+0x27c>
f000fc84:	eb00377e 	bl	f001da84 <print_early>
f000fc88:	e59f0140 	ldr	r0, [pc, #320]	; f000fdd0 <print_sections+0x2d8>
f000fc8c:	eb00377c 	bl	f001da84 <print_early>
f000fc90:	e59f313c 	ldr	r3, [pc, #316]	; f000fdd4 <print_sections+0x2dc>
f000fc94:	e1a00003 	mov	r0, r3
f000fc98:	eb0037a6 	bl	f001db38 <printhex8>
f000fc9c:	e59f00d0 	ldr	r0, [pc, #208]	; f000fd74 <print_sections+0x27c>
f000fca0:	eb003777 	bl	f001da84 <print_early>
f000fca4:	e59f012c 	ldr	r0, [pc, #300]	; f000fdd8 <print_sections+0x2e0>
f000fca8:	eb003775 	bl	f001da84 <print_early>
f000fcac:	e59f3128 	ldr	r3, [pc, #296]	; f000fddc <print_sections+0x2e4>
f000fcb0:	e1a00003 	mov	r0, r3
f000fcb4:	eb00379f 	bl	f001db38 <printhex8>
f000fcb8:	e59f00b4 	ldr	r0, [pc, #180]	; f000fd74 <print_sections+0x27c>
f000fcbc:	eb003770 	bl	f001da84 <print_early>
f000fcc0:	e59f0118 	ldr	r0, [pc, #280]	; f000fde0 <print_sections+0x2e8>
f000fcc4:	eb00376e 	bl	f001da84 <print_early>
f000fcc8:	e59f3114 	ldr	r3, [pc, #276]	; f000fde4 <print_sections+0x2ec>
f000fccc:	e1a00003 	mov	r0, r3
f000fcd0:	eb003798 	bl	f001db38 <printhex8>
f000fcd4:	e59f0098 	ldr	r0, [pc, #152]	; f000fd74 <print_sections+0x27c>
f000fcd8:	eb003769 	bl	f001da84 <print_early>
f000fcdc:	e59f0104 	ldr	r0, [pc, #260]	; f000fde8 <print_sections+0x2f0>
f000fce0:	eb003767 	bl	f001da84 <print_early>
f000fce4:	e59f3100 	ldr	r3, [pc, #256]	; f000fdec <print_sections+0x2f4>
f000fce8:	e1a00003 	mov	r0, r3
f000fcec:	eb003791 	bl	f001db38 <printhex8>
f000fcf0:	e59f007c 	ldr	r0, [pc, #124]	; f000fd74 <print_sections+0x27c>
f000fcf4:	eb003762 	bl	f001da84 <print_early>
f000fcf8:	e59f00f0 	ldr	r0, [pc, #240]	; f000fdf0 <print_sections+0x2f8>
f000fcfc:	eb003760 	bl	f001da84 <print_early>
f000fd00:	e59f30ec 	ldr	r3, [pc, #236]	; f000fdf4 <print_sections+0x2fc>
f000fd04:	e1a00003 	mov	r0, r3
f000fd08:	eb00378a 	bl	f001db38 <printhex8>
f000fd0c:	e59f0060 	ldr	r0, [pc, #96]	; f000fd74 <print_sections+0x27c>
f000fd10:	eb00375b 	bl	f001da84 <print_early>
f000fd14:	e59f00dc 	ldr	r0, [pc, #220]	; f000fdf8 <print_sections+0x300>
f000fd18:	eb003759 	bl	f001da84 <print_early>
f000fd1c:	e59f30d8 	ldr	r3, [pc, #216]	; f000fdfc <print_sections+0x304>
f000fd20:	e1a00003 	mov	r0, r3
f000fd24:	eb003783 	bl	f001db38 <printhex8>
f000fd28:	e59f0044 	ldr	r0, [pc, #68]	; f000fd74 <print_sections+0x27c>
f000fd2c:	eb003754 	bl	f001da84 <print_early>
f000fd30:	e59f00c8 	ldr	r0, [pc, #200]	; f000fe00 <print_sections+0x308>
f000fd34:	eb003752 	bl	f001da84 <print_early>
f000fd38:	e59f30c4 	ldr	r3, [pc, #196]	; f000fe04 <print_sections+0x30c>
f000fd3c:	e1a00003 	mov	r0, r3
f000fd40:	eb00377c 	bl	f001db38 <printhex8>
f000fd44:	e59f0028 	ldr	r0, [pc, #40]	; f000fd74 <print_sections+0x27c>
f000fd48:	eb00374d 	bl	f001da84 <print_early>
f000fd4c:	e59f00b4 	ldr	r0, [pc, #180]	; f000fe08 <print_sections+0x310>
f000fd50:	eb00374b 	bl	f001da84 <print_early>
f000fd54:	e59f30b0 	ldr	r3, [pc, #176]	; f000fe0c <print_sections+0x314>
f000fd58:	e1a00003 	mov	r0, r3
f000fd5c:	eb003775 	bl	f001db38 <printhex8>
f000fd60:	e59f000c 	ldr	r0, [pc, #12]	; f000fd74 <print_sections+0x27c>
f000fd64:	eb003746 	bl	f001da84 <print_early>
f000fd68:	e8bd8800 	pop	{fp, pc}
f000fd6c:	f001e9f8 	.word	0xf001e9f8
f000fd70:	f0008000 	.word	0xf0008000
f000fd74:	f001ea08 	.word	0xf001ea08
f000fd78:	f001ea0c 	.word	0xf001ea0c
f000fd7c:	f0008000 	.word	0xf0008000
f000fd80:	f001ea1c 	.word	0xf001ea1c
f000fd84:	f001e1cc 	.word	0xf001e1cc
f000fd88:	f001ea28 	.word	0xf001ea28
f000fd8c:	f0020000 	.word	0xf0020000
f000fd90:	f001ea38 	.word	0xf001ea38
f000fd94:	f002d000 	.word	0xf002d000
f000fd98:	f001ea44 	.word	0xf001ea44
f000fd9c:	f0024000 	.word	0xf0024000
f000fda0:	f001ea58 	.word	0xf001ea58
f000fda4:	f0024000 	.word	0xf0024000
f000fda8:	f001ea6c 	.word	0xf001ea6c
f000fdac:	f0025000 	.word	0xf0025000
f000fdb0:	f001ea7c 	.word	0xf001ea7c
f000fdb4:	f0025000 	.word	0xf0025000
f000fdb8:	f001ea8c 	.word	0xf001ea8c
f000fdbc:	f0026000 	.word	0xf0026000
f000fdc0:	f001ea98 	.word	0xf001ea98
f000fdc4:	f0026000 	.word	0xf0026000
f000fdc8:	f001eaac 	.word	0xf001eaac
f000fdcc:	f0027000 	.word	0xf0027000
f000fdd0:	f001eabc 	.word	0xf001eabc
f000fdd4:	f002c000 	.word	0xf002c000
f000fdd8:	f001ead0 	.word	0xf001ead0
f000fddc:	f002d000 	.word	0xf002d000
f000fde0:	f001eae4 	.word	0xf001eae4
f000fde4:	f0027000 	.word	0xf0027000
f000fde8:	f001eaf8 	.word	0xf001eaf8
f000fdec:	f002c000 	.word	0xf002c000
f000fdf0:	f001eb08 	.word	0xf001eb08
f000fdf4:	f0038390 	.word	0xf0038390
f000fdf8:	f001eb18 	.word	0xf001eb18
f000fdfc:	f0034000 	.word	0xf0034000
f000fe00:	f001eb28 	.word	0xf001eb28
f000fe04:	f0038390 	.word	0xf0038390
f000fe08:	f001eb34 	.word	0xf001eb34
f000fe0c:	f0038390 	.word	0xf0038390

f000fe10 <kip_init>:
f000fe10:	e92d4800 	push	{fp, lr}
f000fe14:	e28db004 	add	fp, sp, #4
f000fe18:	e59f012c 	ldr	r0, [pc, #300]	; f000ff4c <kip_init+0x13c>
f000fe1c:	e3a01000 	mov	r1, #0
f000fe20:	e3a02a01 	mov	r2, #4096	; 0x1000
f000fe24:	eb00185b 	bl	f0015f98 <memset>
f000fe28:	e59f011c 	ldr	r0, [pc, #284]	; f000ff4c <kip_init+0x13c>
f000fe2c:	e59f111c 	ldr	r1, [pc, #284]	; f000ff50 <kip_init+0x140>
f000fe30:	e3a02004 	mov	r2, #4
f000fe34:	eb001865 	bl	f0015fd0 <memcpy>
f000fe38:	e59f310c 	ldr	r3, [pc, #268]	; f000ff4c <kip_init+0x13c>
f000fe3c:	e3e02044 	mvn	r2, #68	; 0x44
f000fe40:	e5c32007 	strb	r2, [r3, #7]
f000fe44:	e59f3100 	ldr	r3, [pc, #256]	; f000ff4c <kip_init+0x13c>
f000fe48:	e3a02001 	mov	r2, #1
f000fe4c:	e5c32006 	strb	r2, [r3, #6]
f000fe50:	e59f30f4 	ldr	r3, [pc, #244]	; f000ff4c <kip_init+0x13c>
f000fe54:	e3a02000 	mov	r2, #0
f000fe58:	e5c32008 	strb	r2, [r3, #8]
f000fe5c:	e3a02000 	mov	r2, #0
f000fe60:	e5c32009 	strb	r2, [r3, #9]
f000fe64:	e3a02000 	mov	r2, #0
f000fe68:	e5c3200a 	strb	r2, [r3, #10]
f000fe6c:	e3a02000 	mov	r2, #0
f000fe70:	e5c3200b 	strb	r2, [r3, #11]
f000fe74:	e59f20d0 	ldr	r2, [pc, #208]	; f000ff4c <kip_init+0x13c>
f000fe78:	e3a03000 	mov	r3, #0
f000fe7c:	e1e03003 	mvn	r3, r3
f000fe80:	e2033044 	and	r3, r3, #68	; 0x44
f000fe84:	e1e03003 	mvn	r3, r3
f000fe88:	e5c23060 	strb	r3, [r2, #96]	; 0x60
f000fe8c:	e3a03000 	mov	r3, #0
f000fe90:	e383300b 	orr	r3, r3, #11
f000fe94:	e5c23061 	strb	r3, [r2, #97]	; 0x61
f000fe98:	e3a03000 	mov	r3, #0
f000fe9c:	e5c23062 	strb	r3, [r2, #98]	; 0x62
f000fea0:	e3a03000 	mov	r3, #0
f000fea4:	e5c23063 	strb	r3, [r2, #99]	; 0x63
f000fea8:	e59f309c 	ldr	r3, [pc, #156]	; f000ff4c <kip_init+0x13c>
f000feac:	e3a02000 	mov	r2, #0
f000feb0:	e5c32058 	strb	r2, [r3, #88]	; 0x58
f000feb4:	e3a02000 	mov	r2, #0
f000feb8:	e5c32059 	strb	r2, [r3, #89]	; 0x59
f000febc:	e3a02000 	mov	r2, #0
f000fec0:	e5c3205a 	strb	r2, [r3, #90]	; 0x5a
f000fec4:	e3a02000 	mov	r2, #0
f000fec8:	e5c3205b 	strb	r2, [r3, #91]	; 0x5b
f000fecc:	e59f3078 	ldr	r3, [pc, #120]	; f000ff4c <kip_init+0x13c>
f000fed0:	e3a02000 	mov	r2, #0
f000fed4:	e3822002 	orr	r2, r2, #2
f000fed8:	e5c3205c 	strb	r2, [r3, #92]	; 0x5c
f000fedc:	e3a02000 	mov	r2, #0
f000fee0:	e5c3205d 	strb	r2, [r3, #93]	; 0x5d
f000fee4:	e3a02000 	mov	r2, #0
f000fee8:	e5c3205e 	strb	r2, [r3, #94]	; 0x5e
f000feec:	e3a02000 	mov	r2, #0
f000fef0:	e5c3205f 	strb	r2, [r3, #95]	; 0x5f
f000fef4:	e59f0058 	ldr	r0, [pc, #88]	; f000ff54 <kip_init+0x144>
f000fef8:	e59f1058 	ldr	r1, [pc, #88]	; f000ff58 <kip_init+0x148>
f000fefc:	e3a0200c 	mov	r2, #12
f000ff00:	eb001865 	bl	f001609c <strncpy>
f000ff04:	e59f0050 	ldr	r0, [pc, #80]	; f000ff5c <kip_init+0x14c>
f000ff08:	e59f1050 	ldr	r1, [pc, #80]	; f000ff60 <kip_init+0x150>
f000ff0c:	e3a02009 	mov	r2, #9
f000ff10:	eb001861 	bl	f001609c <strncpy>
f000ff14:	eb0000d2 	bl	f0010264 <kip_init_syscalls>
f000ff18:	e59f302c 	ldr	r3, [pc, #44]	; f000ff4c <kip_init+0x13c>
f000ff1c:	e2833201 	add	r3, r3, #268435456	; 0x10000000
f000ff20:	e1a00003 	mov	r0, r3
f000ff24:	e3a014ff 	mov	r1, #-16777216	; 0xff000000
f000ff28:	e3a02a01 	mov	r2, #4096	; 0x1000
f000ff2c:	e3a03002 	mov	r3, #2
f000ff30:	eb000c8b 	bl	f0013164 <add_boot_mapping>
f000ff34:	e59f0028 	ldr	r0, [pc, #40]	; f000ff64 <kip_init+0x154>
f000ff38:	e59f1028 	ldr	r1, [pc, #40]	; f000ff68 <kip_init+0x158>
f000ff3c:	e59f2010 	ldr	r2, [pc, #16]	; f000ff54 <kip_init+0x144>
f000ff40:	e59f3014 	ldr	r3, [pc, #20]	; f000ff5c <kip_init+0x14c>
f000ff44:	eb0017e8 	bl	f0015eec <printk>
f000ff48:	e8bd8800 	pop	{fp, pc}
f000ff4c:	f0025000 	.word	0xf0025000
f000ff50:	f001eb3c 	.word	0xf001eb3c
f000ff54:	f0025064 	.word	0xf0025064
f000ff58:	f001eb44 	.word	0xf001eb44
f000ff5c:	f0025070 	.word	0xf0025070
f000ff60:	f001eb50 	.word	0xf001eb50
f000ff64:	f001eb5c 	.word	0xf001eb5c
f000ff68:	f001eb78 	.word	0xf001eb78

f000ff6c <vectors_init>:
f000ff6c:	e92d4800 	push	{fp, lr}
f000ff70:	e28db004 	add	fp, sp, #4
f000ff74:	e24dd008 	sub	sp, sp, #8
f000ff78:	e59f202c 	ldr	r2, [pc, #44]	; f000ffac <vectors_init+0x40>
f000ff7c:	e59f302c 	ldr	r3, [pc, #44]	; f000ffb0 <vectors_init+0x44>
f000ff80:	e0633002 	rsb	r3, r3, r2
f000ff84:	e50b3008 	str	r3, [fp, #-8]
f000ff88:	e59f3020 	ldr	r3, [pc, #32]	; f000ffb0 <vectors_init+0x44>
f000ff8c:	e2833201 	add	r3, r3, #268435456	; 0x10000000
f000ff90:	e1a00003 	mov	r0, r3
f000ff94:	e59f1018 	ldr	r1, [pc, #24]	; f000ffb4 <vectors_init+0x48>
f000ff98:	e51b2008 	ldr	r2, [fp, #-8]
f000ff9c:	e3a03007 	mov	r3, #7
f000ffa0:	eb000c6f 	bl	f0013164 <add_boot_mapping>
f000ffa4:	e24bd004 	sub	sp, fp, #4
f000ffa8:	e8bd8800 	pop	{fp, pc}
f000ffac:	f0025000 	.word	0xf0025000
f000ffb0:	f0024000 	.word	0xf0024000
f000ffb4:	ffff0000 	.word	0xffff0000

f000ffb8 <remove_initial_mapping>:
f000ffb8:	e92d4800 	push	{fp, lr}
f000ffbc:	e28db004 	add	fp, sp, #4
f000ffc0:	e59f300c 	ldr	r3, [pc, #12]	; f000ffd4 <remove_initial_mapping+0x1c>
f000ffc4:	e2833201 	add	r3, r3, #268435456	; 0x10000000
f000ffc8:	e1a00003 	mov	r0, r3
f000ffcc:	eb000ed0 	bl	f0013b14 <remove_section_mapping>
f000ffd0:	e8bd8800 	pop	{fp, pc}
f000ffd4:	f0008000 	.word	0xf0008000

f000ffd8 <init_finalize>:
f000ffd8:	e92d4800 	push	{fp, lr}
f000ffdc:	e28db004 	add	fp, sp, #4
f000ffe0:	eb00378f 	bl	f001de24 <platform_timer_start>
f000ffe4:	ebfffeb5 	bl	f000fac0 <current_task>
f000ffe8:	e1a03000 	mov	r3, r0
f000ffec:	e1a00003 	mov	r0, r3
f000fff0:	ebffe3a6 	bl	f0008e90 <sched_resume_async>
f000fff4:	eb001148 	bl	f001451c <idle_task>
f000fff8:	e8bd8800 	pop	{fp, pc}

f000fffc <start_kernel>:
f000fffc:	e92d4800 	push	{fp, lr}
f0010000:	e28db004 	add	fp, sp, #4
f0010004:	e59f009c 	ldr	r0, [pc, #156]	; f00100a8 <start_kernel+0xac>
f0010008:	eb00369d 	bl	f001da84 <print_early>
f001000c:	ebfffea1 	bl	f000fa98 <cpu_startup>
f0010010:	eb001340 	bl	f0014d18 <init_kernel_mappings>
f0010014:	e59f0090 	ldr	r0, [pc, #144]	; f00100ac <start_kernel+0xb0>
f0010018:	eb003699 	bl	f001da84 <print_early>
f001001c:	eb00135a 	bl	f0014d8c <start_virtual_memory>
f0010020:	ebfffe4b 	bl	f000f954 <setup_idle_task>
f0010024:	eb003785 	bl	f001de40 <platform_init>
f0010028:	e59f0080 	ldr	r0, [pc, #128]	; f00100b0 <start_kernel+0xb4>
f001002c:	e59f1080 	ldr	r1, [pc, #128]	; f00100b4 <start_kernel+0xb8>
f0010030:	eb0017ad 	bl	f0015eec <printk>
f0010034:	eb00130d 	bl	f0014c70 <system_identify>
f0010038:	ebffe2a3 	bl	f0008acc <sched_init>
f001003c:	ebffffca 	bl	f000ff6c <vectors_init>
f0010040:	ebfffe99 	bl	f000faac <smp_start_cores>
f0010044:	ebffffdb 	bl	f000ffb8 <remove_initial_mapping>
f0010048:	e59f3068 	ldr	r3, [pc, #104]	; f00100b8 <start_kernel+0xbc>
f001004c:	e3c33eff 	bic	r3, r3, #4080	; 0xff0
f0010050:	e3c3300f 	bic	r3, r3, #15
f0010054:	e1a02003 	mov	r2, r3
f0010058:	e59f305c 	ldr	r3, [pc, #92]	; f00100bc <start_kernel+0xc0>
f001005c:	e2833eff 	add	r3, r3, #4080	; 0xff0
f0010060:	e283300f 	add	r3, r3, #15
f0010064:	e3c33eff 	bic	r3, r3, #4080	; 0xff0
f0010068:	e3c3300f 	bic	r3, r3, #15
f001006c:	e1a00002 	mov	r0, r2
f0010070:	e1a01003 	mov	r1, r3
f0010074:	eb000dde 	bl	f00137f4 <remap_as_pages>
f0010078:	ebffff64 	bl	f000fe10 <kip_init>
f001007c:	eb000349 	bl	f0010da8 <syscall_init>
f0010080:	ebfffe97 	bl	f000fae4 <perfmon_init>
f0010084:	e59f0034 	ldr	r0, [pc, #52]	; f00100c0 <start_kernel+0xc4>
f0010088:	ebfff416 	bl	f000d0e8 <init_system_resources>
f001008c:	ebffffd1 	bl	f000ffd8 <init_finalize>
f0010090:	e59f002c 	ldr	r0, [pc, #44]	; f00100c4 <start_kernel+0xc8>
f0010094:	e59f102c 	ldr	r1, [pc, #44]	; f00100c8 <start_kernel+0xcc>
f0010098:	e59f202c 	ldr	r2, [pc, #44]	; f00100cc <start_kernel+0xd0>
f001009c:	e3a030d1 	mov	r3, #209	; 0xd1
f00100a0:	eb001791 	bl	f0015eec <printk>
f00100a4:	eafffffe 	b	f00100a4 <start_kernel+0xa8>
f00100a8:	f001eb80 	.word	0xf001eb80
f00100ac:	f001eb9c 	.word	0xf001eb9c
f00100b0:	f001ebc0 	.word	0xf001ebc0
f00100b4:	f001eb78 	.word	0xf001eb78
f00100b8:	f0008000 	.word	0xf0008000
f00100bc:	f0038390 	.word	0xf0038390
f00100c0:	f002d0a0 	.word	0xf002d0a0
f00100c4:	f001ebe0 	.word	0xf001ebe0
f00100c8:	f001ec08 	.word	0xf001ec08
f00100cc:	f001ec1c 	.word	0xf001ec1c

f00100d0 <space_flags_to_ptflags>:
f00100d0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f00100d4:	e28db000 	add	fp, sp, #0
f00100d8:	e24dd00c 	sub	sp, sp, #12
f00100dc:	e50b0008 	str	r0, [fp, #-8]
f00100e0:	e51b3008 	ldr	r3, [fp, #-8]
f00100e4:	e3530009 	cmp	r3, #9
f00100e8:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
f00100ec:	ea00001d 	b	f0010168 <space_flags_to_ptflags+0x98>
f00100f0:	f0010118 	.word	0xf0010118
f00100f4:	f0010120 	.word	0xf0010120
f00100f8:	f0010128 	.word	0xf0010128
f00100fc:	f0010130 	.word	0xf0010130
f0010100:	f0010138 	.word	0xf0010138
f0010104:	f0010140 	.word	0xf0010140
f0010108:	f0010148 	.word	0xf0010148
f001010c:	f0010150 	.word	0xf0010150
f0010110:	f0010158 	.word	0xf0010158
f0010114:	f0010160 	.word	0xf0010160
f0010118:	e3a03000 	mov	r3, #0
f001011c:	ea000012 	b	f001016c <space_flags_to_ptflags+0x9c>
f0010120:	e59f3054 	ldr	r3, [pc, #84]	; f001017c <space_flags_to_ptflags+0xac>
f0010124:	ea000010 	b	f001016c <space_flags_to_ptflags+0x9c>
f0010128:	e59f3050 	ldr	r3, [pc, #80]	; f0010180 <space_flags_to_ptflags+0xb0>
f001012c:	ea00000e 	b	f001016c <space_flags_to_ptflags+0x9c>
f0010130:	e59f304c 	ldr	r3, [pc, #76]	; f0010184 <space_flags_to_ptflags+0xb4>
f0010134:	ea00000c 	b	f001016c <space_flags_to_ptflags+0x9c>
f0010138:	e3a03eff 	mov	r3, #4080	; 0xff0
f001013c:	ea00000a 	b	f001016c <space_flags_to_ptflags+0x9c>
f0010140:	e3a03e55 	mov	r3, #1360	; 0x550
f0010144:	ea000008 	b	f001016c <space_flags_to_ptflags+0x9c>
f0010148:	e59f302c 	ldr	r3, [pc, #44]	; f001017c <space_flags_to_ptflags+0xac>
f001014c:	ea000006 	b	f001016c <space_flags_to_ptflags+0x9c>
f0010150:	e59f302c 	ldr	r3, [pc, #44]	; f0010184 <space_flags_to_ptflags+0xb4>
f0010154:	ea000004 	b	f001016c <space_flags_to_ptflags+0x9c>
f0010158:	e59f3020 	ldr	r3, [pc, #32]	; f0010180 <space_flags_to_ptflags+0xb0>
f001015c:	ea000002 	b	f001016c <space_flags_to_ptflags+0x9c>
f0010160:	e59f301c 	ldr	r3, [pc, #28]	; f0010184 <space_flags_to_ptflags+0xb4>
f0010164:	ea000000 	b	f001016c <space_flags_to_ptflags+0x9c>
f0010168:	e3a03102 	mov	r3, #-2147483648	; 0x80000000
f001016c:	e1a00003 	mov	r0, r3
f0010170:	e24bd000 	sub	sp, fp, #0
f0010174:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0010178:	e12fff1e 	bx	lr
f001017c:	00000ffc 	.word	0x00000ffc
f0010180:	00000aac 	.word	0x00000aac
f0010184:	0000055c 	.word	0x0000055c

f0010188 <task_init_registers>:
f0010188:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f001018c:	e28db000 	add	fp, sp, #0
f0010190:	e24dd00c 	sub	sp, sp, #12
f0010194:	e50b0008 	str	r0, [fp, #-8]
f0010198:	e50b100c 	str	r1, [fp, #-12]
f001019c:	e51b3008 	ldr	r3, [fp, #-8]
f00101a0:	e51b200c 	ldr	r2, [fp, #-12]
f00101a4:	e5832040 	str	r2, [r3, #64]	; 0x40
f00101a8:	e51b3008 	ldr	r3, [fp, #-8]
f00101ac:	e3a02010 	mov	r2, #16
f00101b0:	e5832000 	str	r2, [r3]
f00101b4:	e24bd000 	sub	sp, fp, #0
f00101b8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f00101bc:	e12fff1e 	bx	lr

f00101c0 <copy_pgd_kernel_entries>:
f00101c0:	e92d4800 	push	{fp, lr}
f00101c4:	e28db004 	add	fp, sp, #4
f00101c8:	e24dd008 	sub	sp, sp, #8
f00101cc:	e50b0008 	str	r0, [fp, #-8]
f00101d0:	e51b0008 	ldr	r0, [fp, #-8]
f00101d4:	eb001077 	bl	f00143b8 <arch_copy_pgd_kernel_entries>
f00101d8:	e24bd004 	sub	sp, fp, #4
f00101dc:	e8bd8800 	pop	{fp, pc}

f00101e0 <current_task>:
f00101e0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f00101e4:	e28db000 	add	fp, sp, #0
f00101e8:	e1a0300d 	mov	r3, sp
f00101ec:	e3c33eff 	bic	r3, r3, #4080	; 0xff0
f00101f0:	e3c3300f 	bic	r3, r3, #15
f00101f4:	e1a00003 	mov	r0, r3
f00101f8:	e24bd000 	sub	sp, fp, #0
f00101fc:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0010200:	e12fff1e 	bx	lr

f0010204 <system_account_syscall>:
f0010204:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f0010208:	e28db000 	add	fp, sp, #0
f001020c:	e24bd000 	sub	sp, fp, #0
f0010210:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0010214:	e12fff1e 	bx	lr

f0010218 <system_account_syscall_type>:
f0010218:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f001021c:	e28db000 	add	fp, sp, #0
f0010220:	e24dd00c 	sub	sp, sp, #12
f0010224:	e50b0008 	str	r0, [fp, #-8]
f0010228:	e24bd000 	sub	sp, fp, #0
f001022c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0010230:	e12fff1e 	bx	lr

f0010234 <system_measure_syscall_start>:
f0010234:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f0010238:	e28db000 	add	fp, sp, #0
f001023c:	e24bd000 	sub	sp, fp, #0
f0010240:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0010244:	e12fff1e 	bx	lr

f0010248 <system_measure_syscall_end>:
f0010248:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f001024c:	e28db000 	add	fp, sp, #0
f0010250:	e24dd00c 	sub	sp, sp, #12
f0010254:	e50b0008 	str	r0, [fp, #-8]
f0010258:	e24bd000 	sub	sp, fp, #0
f001025c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0010260:	e12fff1e 	bx	lr

f0010264 <kip_init_syscalls>:
f0010264:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f0010268:	e28db000 	add	fp, sp, #0
f001026c:	e59f32d0 	ldr	r3, [pc, #720]	; f0010544 <kip_init_syscalls+0x2e0>
f0010270:	e3a02000 	mov	r2, #0
f0010274:	e3822018 	orr	r2, r2, #24
f0010278:	e5c32014 	strb	r2, [r3, #20]
f001027c:	e3a02000 	mov	r2, #0
f0010280:	e1e02e02 	mvn	r2, r2, lsl #28
f0010284:	e1e02e22 	mvn	r2, r2, lsr #28
f0010288:	e5c32015 	strb	r2, [r3, #21]
f001028c:	e3e02000 	mvn	r2, #0
f0010290:	e5c32016 	strb	r2, [r3, #22]
f0010294:	e3e02000 	mvn	r2, #0
f0010298:	e5c32017 	strb	r2, [r3, #23]
f001029c:	e59f32a0 	ldr	r3, [pc, #672]	; f0010544 <kip_init_syscalls+0x2e0>
f00102a0:	e3a02000 	mov	r2, #0
f00102a4:	e3822008 	orr	r2, r2, #8
f00102a8:	e5c32018 	strb	r2, [r3, #24]
f00102ac:	e3a02000 	mov	r2, #0
f00102b0:	e1e02e02 	mvn	r2, r2, lsl #28
f00102b4:	e1e02e22 	mvn	r2, r2, lsr #28
f00102b8:	e5c32019 	strb	r2, [r3, #25]
f00102bc:	e3e02000 	mvn	r2, #0
f00102c0:	e5c3201a 	strb	r2, [r3, #26]
f00102c4:	e3e02000 	mvn	r2, #0
f00102c8:	e5c3201b 	strb	r2, [r3, #27]
f00102cc:	e59f3270 	ldr	r3, [pc, #624]	; f0010544 <kip_init_syscalls+0x2e0>
f00102d0:	e3a02000 	mov	r2, #0
f00102d4:	e382201c 	orr	r2, r2, #28
f00102d8:	e5c3201c 	strb	r2, [r3, #28]
f00102dc:	e3a02000 	mov	r2, #0
f00102e0:	e1e02e02 	mvn	r2, r2, lsl #28
f00102e4:	e1e02e22 	mvn	r2, r2, lsr #28
f00102e8:	e5c3201d 	strb	r2, [r3, #29]
f00102ec:	e3e02000 	mvn	r2, #0
f00102f0:	e5c3201e 	strb	r2, [r3, #30]
f00102f4:	e3e02000 	mvn	r2, #0
f00102f8:	e5c3201f 	strb	r2, [r3, #31]
f00102fc:	e59f3240 	ldr	r3, [pc, #576]	; f0010544 <kip_init_syscalls+0x2e0>
f0010300:	e3a02000 	mov	r2, #0
f0010304:	e3822020 	orr	r2, r2, #32
f0010308:	e5c32020 	strb	r2, [r3, #32]
f001030c:	e3a02000 	mov	r2, #0
f0010310:	e1e02e02 	mvn	r2, r2, lsl #28
f0010314:	e1e02e22 	mvn	r2, r2, lsr #28
f0010318:	e5c32021 	strb	r2, [r3, #33]	; 0x21
f001031c:	e3e02000 	mvn	r2, #0
f0010320:	e5c32022 	strb	r2, [r3, #34]	; 0x22
f0010324:	e3e02000 	mvn	r2, #0
f0010328:	e5c32023 	strb	r2, [r3, #35]	; 0x23
f001032c:	e59f3210 	ldr	r3, [pc, #528]	; f0010544 <kip_init_syscalls+0x2e0>
f0010330:	e3a02000 	mov	r2, #0
f0010334:	e5c32024 	strb	r2, [r3, #36]	; 0x24
f0010338:	e3a02000 	mov	r2, #0
f001033c:	e1e02e02 	mvn	r2, r2, lsl #28
f0010340:	e1e02e22 	mvn	r2, r2, lsr #28
f0010344:	e5c32025 	strb	r2, [r3, #37]	; 0x25
f0010348:	e3e02000 	mvn	r2, #0
f001034c:	e5c32026 	strb	r2, [r3, #38]	; 0x26
f0010350:	e3e02000 	mvn	r2, #0
f0010354:	e5c32027 	strb	r2, [r3, #39]	; 0x27
f0010358:	e59f31e4 	ldr	r3, [pc, #484]	; f0010544 <kip_init_syscalls+0x2e0>
f001035c:	e3a02000 	mov	r2, #0
f0010360:	e3822028 	orr	r2, r2, #40	; 0x28
f0010364:	e5c32028 	strb	r2, [r3, #40]	; 0x28
f0010368:	e3a02000 	mov	r2, #0
f001036c:	e1e02e02 	mvn	r2, r2, lsl #28
f0010370:	e1e02e22 	mvn	r2, r2, lsr #28
f0010374:	e5c32029 	strb	r2, [r3, #41]	; 0x29
f0010378:	e3e02000 	mvn	r2, #0
f001037c:	e5c3202a 	strb	r2, [r3, #42]	; 0x2a
f0010380:	e3e02000 	mvn	r2, #0
f0010384:	e5c3202b 	strb	r2, [r3, #43]	; 0x2b
f0010388:	e59f31b4 	ldr	r3, [pc, #436]	; f0010544 <kip_init_syscalls+0x2e0>
f001038c:	e3a02000 	mov	r2, #0
f0010390:	e3822014 	orr	r2, r2, #20
f0010394:	e5c3202c 	strb	r2, [r3, #44]	; 0x2c
f0010398:	e3a02000 	mov	r2, #0
f001039c:	e1e02e02 	mvn	r2, r2, lsl #28
f00103a0:	e1e02e22 	mvn	r2, r2, lsr #28
f00103a4:	e5c3202d 	strb	r2, [r3, #45]	; 0x2d
f00103a8:	e3e02000 	mvn	r2, #0
f00103ac:	e5c3202e 	strb	r2, [r3, #46]	; 0x2e
f00103b0:	e3e02000 	mvn	r2, #0
f00103b4:	e5c3202f 	strb	r2, [r3, #47]	; 0x2f
f00103b8:	e59f3184 	ldr	r3, [pc, #388]	; f0010544 <kip_init_syscalls+0x2e0>
f00103bc:	e3a02000 	mov	r2, #0
f00103c0:	e382200c 	orr	r2, r2, #12
f00103c4:	e5c32030 	strb	r2, [r3, #48]	; 0x30
f00103c8:	e3a02000 	mov	r2, #0
f00103cc:	e1e02e02 	mvn	r2, r2, lsl #28
f00103d0:	e1e02e22 	mvn	r2, r2, lsr #28
f00103d4:	e5c32031 	strb	r2, [r3, #49]	; 0x31
f00103d8:	e3e02000 	mvn	r2, #0
f00103dc:	e5c32032 	strb	r2, [r3, #50]	; 0x32
f00103e0:	e3e02000 	mvn	r2, #0
f00103e4:	e5c32033 	strb	r2, [r3, #51]	; 0x33
f00103e8:	e59f3154 	ldr	r3, [pc, #340]	; f0010544 <kip_init_syscalls+0x2e0>
f00103ec:	e3a02000 	mov	r2, #0
f00103f0:	e3822004 	orr	r2, r2, #4
f00103f4:	e5c32034 	strb	r2, [r3, #52]	; 0x34
f00103f8:	e3a02000 	mov	r2, #0
f00103fc:	e1e02e02 	mvn	r2, r2, lsl #28
f0010400:	e1e02e22 	mvn	r2, r2, lsr #28
f0010404:	e5c32035 	strb	r2, [r3, #53]	; 0x35
f0010408:	e3e02000 	mvn	r2, #0
f001040c:	e5c32036 	strb	r2, [r3, #54]	; 0x36
f0010410:	e3e02000 	mvn	r2, #0
f0010414:	e5c32037 	strb	r2, [r3, #55]	; 0x37
f0010418:	e59f3124 	ldr	r3, [pc, #292]	; f0010544 <kip_init_syscalls+0x2e0>
f001041c:	e3a02000 	mov	r2, #0
f0010420:	e3822010 	orr	r2, r2, #16
f0010424:	e5c32038 	strb	r2, [r3, #56]	; 0x38
f0010428:	e3a02000 	mov	r2, #0
f001042c:	e1e02e02 	mvn	r2, r2, lsl #28
f0010430:	e1e02e22 	mvn	r2, r2, lsr #28
f0010434:	e5c32039 	strb	r2, [r3, #57]	; 0x39
f0010438:	e3e02000 	mvn	r2, #0
f001043c:	e5c3203a 	strb	r2, [r3, #58]	; 0x3a
f0010440:	e3e02000 	mvn	r2, #0
f0010444:	e5c3203b 	strb	r2, [r3, #59]	; 0x3b
f0010448:	e59f30f4 	ldr	r3, [pc, #244]	; f0010544 <kip_init_syscalls+0x2e0>
f001044c:	e3a02000 	mov	r2, #0
f0010450:	e3822024 	orr	r2, r2, #36	; 0x24
f0010454:	e5c3203c 	strb	r2, [r3, #60]	; 0x3c
f0010458:	e3a02000 	mov	r2, #0
f001045c:	e1e02e02 	mvn	r2, r2, lsl #28
f0010460:	e1e02e22 	mvn	r2, r2, lsr #28
f0010464:	e5c3203d 	strb	r2, [r3, #61]	; 0x3d
f0010468:	e3e02000 	mvn	r2, #0
f001046c:	e5c3203e 	strb	r2, [r3, #62]	; 0x3e
f0010470:	e3e02000 	mvn	r2, #0
f0010474:	e5c3203f 	strb	r2, [r3, #63]	; 0x3f
f0010478:	e59f30c4 	ldr	r3, [pc, #196]	; f0010544 <kip_init_syscalls+0x2e0>
f001047c:	e3a02000 	mov	r2, #0
f0010480:	e382202c 	orr	r2, r2, #44	; 0x2c
f0010484:	e5c3200c 	strb	r2, [r3, #12]
f0010488:	e3a02000 	mov	r2, #0
f001048c:	e1e02e02 	mvn	r2, r2, lsl #28
f0010490:	e1e02e22 	mvn	r2, r2, lsr #28
f0010494:	e5c3200d 	strb	r2, [r3, #13]
f0010498:	e3e02000 	mvn	r2, #0
f001049c:	e5c3200e 	strb	r2, [r3, #14]
f00104a0:	e3e02000 	mvn	r2, #0
f00104a4:	e5c3200f 	strb	r2, [r3, #15]
f00104a8:	e59f3094 	ldr	r3, [pc, #148]	; f0010544 <kip_init_syscalls+0x2e0>
f00104ac:	e3a02000 	mov	r2, #0
f00104b0:	e3822030 	orr	r2, r2, #48	; 0x30
f00104b4:	e5c32010 	strb	r2, [r3, #16]
f00104b8:	e3a02000 	mov	r2, #0
f00104bc:	e1e02e02 	mvn	r2, r2, lsl #28
f00104c0:	e1e02e22 	mvn	r2, r2, lsr #28
f00104c4:	e5c32011 	strb	r2, [r3, #17]
f00104c8:	e3e02000 	mvn	r2, #0
f00104cc:	e5c32012 	strb	r2, [r3, #18]
f00104d0:	e3e02000 	mvn	r2, #0
f00104d4:	e5c32013 	strb	r2, [r3, #19]
f00104d8:	e59f3064 	ldr	r3, [pc, #100]	; f0010544 <kip_init_syscalls+0x2e0>
f00104dc:	e3a02000 	mov	r2, #0
f00104e0:	e3822034 	orr	r2, r2, #52	; 0x34
f00104e4:	e5c32040 	strb	r2, [r3, #64]	; 0x40
f00104e8:	e3a02000 	mov	r2, #0
f00104ec:	e1e02e02 	mvn	r2, r2, lsl #28
f00104f0:	e1e02e22 	mvn	r2, r2, lsr #28
f00104f4:	e5c32041 	strb	r2, [r3, #65]	; 0x41
f00104f8:	e3e02000 	mvn	r2, #0
f00104fc:	e5c32042 	strb	r2, [r3, #66]	; 0x42
f0010500:	e3e02000 	mvn	r2, #0
f0010504:	e5c32043 	strb	r2, [r3, #67]	; 0x43
f0010508:	e59f3034 	ldr	r3, [pc, #52]	; f0010544 <kip_init_syscalls+0x2e0>
f001050c:	e3a02000 	mov	r2, #0
f0010510:	e3822038 	orr	r2, r2, #56	; 0x38
f0010514:	e5c32044 	strb	r2, [r3, #68]	; 0x44
f0010518:	e3a02000 	mov	r2, #0
f001051c:	e1e02e02 	mvn	r2, r2, lsl #28
f0010520:	e1e02e22 	mvn	r2, r2, lsr #28
f0010524:	e5c32045 	strb	r2, [r3, #69]	; 0x45
f0010528:	e3e02000 	mvn	r2, #0
f001052c:	e5c32046 	strb	r2, [r3, #70]	; 0x46
f0010530:	e3e02000 	mvn	r2, #0
f0010534:	e5c32047 	strb	r2, [r3, #71]	; 0x47
f0010538:	e24bd000 	sub	sp, fp, #0
f001053c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0010540:	e12fff1e 	bx	lr
f0010544:	f0025000 	.word	0xf0025000

f0010548 <arch_sys_ipc>:
f0010548:	e92d4800 	push	{fp, lr}
f001054c:	e28db004 	add	fp, sp, #4
f0010550:	e24dd008 	sub	sp, sp, #8
f0010554:	e50b0008 	str	r0, [fp, #-8]
f0010558:	e51b3008 	ldr	r3, [fp, #-8]
f001055c:	e5d32004 	ldrb	r2, [r3, #4]
f0010560:	e5d31005 	ldrb	r1, [r3, #5]
f0010564:	e1a01401 	lsl	r1, r1, #8
f0010568:	e1812002 	orr	r2, r1, r2
f001056c:	e5d31006 	ldrb	r1, [r3, #6]
f0010570:	e1a01801 	lsl	r1, r1, #16
f0010574:	e1812002 	orr	r2, r1, r2
f0010578:	e5d33007 	ldrb	r3, [r3, #7]
f001057c:	e1a03c03 	lsl	r3, r3, #24
f0010580:	e1833002 	orr	r3, r3, r2
f0010584:	e1a01003 	mov	r1, r3
f0010588:	e51b3008 	ldr	r3, [fp, #-8]
f001058c:	e5d32008 	ldrb	r2, [r3, #8]
f0010590:	e5d30009 	ldrb	r0, [r3, #9]
f0010594:	e1a00400 	lsl	r0, r0, #8
f0010598:	e1802002 	orr	r2, r0, r2
f001059c:	e5d3000a 	ldrb	r0, [r3, #10]
f00105a0:	e1a00800 	lsl	r0, r0, #16
f00105a4:	e1802002 	orr	r2, r0, r2
f00105a8:	e5d3300b 	ldrb	r3, [r3, #11]
f00105ac:	e1a03c03 	lsl	r3, r3, #24
f00105b0:	e1833002 	orr	r3, r3, r2
f00105b4:	e1a02003 	mov	r2, r3
f00105b8:	e51b3008 	ldr	r3, [fp, #-8]
f00105bc:	e5d3000c 	ldrb	r0, [r3, #12]
f00105c0:	e5d3c00d 	ldrb	ip, [r3, #13]
f00105c4:	e1a0c40c 	lsl	ip, ip, #8
f00105c8:	e18c0000 	orr	r0, ip, r0
f00105cc:	e5d3c00e 	ldrb	ip, [r3, #14]
f00105d0:	e1a0c80c 	lsl	ip, ip, #16
f00105d4:	e18c0000 	orr	r0, ip, r0
f00105d8:	e5d3300f 	ldrb	r3, [r3, #15]
f00105dc:	e1a03c03 	lsl	r3, r3, #24
f00105e0:	e1833000 	orr	r3, r3, r0
f00105e4:	e1a00001 	mov	r0, r1
f00105e8:	e1a01002 	mov	r1, r2
f00105ec:	e1a02003 	mov	r2, r3
f00105f0:	eb0029d3 	bl	f001ad44 <sys_ipc>
f00105f4:	e1a03000 	mov	r3, r0
f00105f8:	e1a00003 	mov	r0, r3
f00105fc:	e24bd004 	sub	sp, fp, #4
f0010600:	e8bd8800 	pop	{fp, pc}

f0010604 <arch_sys_thread_switch>:
f0010604:	e92d4800 	push	{fp, lr}
f0010608:	e28db004 	add	fp, sp, #4
f001060c:	e24dd008 	sub	sp, sp, #8
f0010610:	e50b0008 	str	r0, [fp, #-8]
f0010614:	eb001f25 	bl	f00182b0 <sys_thread_switch>
f0010618:	e1a03000 	mov	r3, r0
f001061c:	e1a00003 	mov	r0, r3
f0010620:	e24bd004 	sub	sp, fp, #4
f0010624:	e8bd8800 	pop	{fp, pc}

f0010628 <arch_sys_thread_control>:
f0010628:	e92d4800 	push	{fp, lr}
f001062c:	e28db004 	add	fp, sp, #4
f0010630:	e24dd008 	sub	sp, sp, #8
f0010634:	e50b0008 	str	r0, [fp, #-8]
f0010638:	e51b3008 	ldr	r3, [fp, #-8]
f001063c:	e5d32004 	ldrb	r2, [r3, #4]
f0010640:	e5d31005 	ldrb	r1, [r3, #5]
f0010644:	e1a01401 	lsl	r1, r1, #8
f0010648:	e1812002 	orr	r2, r1, r2
f001064c:	e5d31006 	ldrb	r1, [r3, #6]
f0010650:	e1a01801 	lsl	r1, r1, #16
f0010654:	e1812002 	orr	r2, r1, r2
f0010658:	e5d33007 	ldrb	r3, [r3, #7]
f001065c:	e1a03c03 	lsl	r3, r3, #24
f0010660:	e1833002 	orr	r3, r3, r2
f0010664:	e1a02003 	mov	r2, r3
f0010668:	e51b3008 	ldr	r3, [fp, #-8]
f001066c:	e5d31008 	ldrb	r1, [r3, #8]
f0010670:	e5d30009 	ldrb	r0, [r3, #9]
f0010674:	e1a00400 	lsl	r0, r0, #8
f0010678:	e1801001 	orr	r1, r0, r1
f001067c:	e5d3000a 	ldrb	r0, [r3, #10]
f0010680:	e1a00800 	lsl	r0, r0, #16
f0010684:	e1801001 	orr	r1, r0, r1
f0010688:	e5d3300b 	ldrb	r3, [r3, #11]
f001068c:	e1a03c03 	lsl	r3, r3, #24
f0010690:	e1833001 	orr	r3, r3, r1
f0010694:	e1a00002 	mov	r0, r2
f0010698:	e1a01003 	mov	r1, r3
f001069c:	eb0024b2 	bl	f001996c <sys_thread_control>
f00106a0:	e1a03000 	mov	r3, r0
f00106a4:	e1a00003 	mov	r0, r3
f00106a8:	e24bd004 	sub	sp, fp, #4
f00106ac:	e8bd8800 	pop	{fp, pc}

f00106b0 <arch_sys_exchange_registers>:
f00106b0:	e92d4800 	push	{fp, lr}
f00106b4:	e28db004 	add	fp, sp, #4
f00106b8:	e24dd008 	sub	sp, sp, #8
f00106bc:	e50b0008 	str	r0, [fp, #-8]
f00106c0:	e51b3008 	ldr	r3, [fp, #-8]
f00106c4:	e5d32004 	ldrb	r2, [r3, #4]
f00106c8:	e5d31005 	ldrb	r1, [r3, #5]
f00106cc:	e1a01401 	lsl	r1, r1, #8
f00106d0:	e1812002 	orr	r2, r1, r2
f00106d4:	e5d31006 	ldrb	r1, [r3, #6]
f00106d8:	e1a01801 	lsl	r1, r1, #16
f00106dc:	e1812002 	orr	r2, r1, r2
f00106e0:	e5d33007 	ldrb	r3, [r3, #7]
f00106e4:	e1a03c03 	lsl	r3, r3, #24
f00106e8:	e1833002 	orr	r3, r3, r2
f00106ec:	e1a02003 	mov	r2, r3
f00106f0:	e51b3008 	ldr	r3, [fp, #-8]
f00106f4:	e5d31008 	ldrb	r1, [r3, #8]
f00106f8:	e5d30009 	ldrb	r0, [r3, #9]
f00106fc:	e1a00400 	lsl	r0, r0, #8
f0010700:	e1801001 	orr	r1, r0, r1
f0010704:	e5d3000a 	ldrb	r0, [r3, #10]
f0010708:	e1a00800 	lsl	r0, r0, #16
f001070c:	e1801001 	orr	r1, r0, r1
f0010710:	e5d3300b 	ldrb	r3, [r3, #11]
f0010714:	e1a03c03 	lsl	r3, r3, #24
f0010718:	e1833001 	orr	r3, r3, r1
f001071c:	e1a00002 	mov	r0, r2
f0010720:	e1a01003 	mov	r1, r3
f0010724:	eb0030b8 	bl	f001ca0c <sys_exchange_registers>
f0010728:	e1a03000 	mov	r3, r0
f001072c:	e1a00003 	mov	r0, r3
f0010730:	e24bd004 	sub	sp, fp, #4
f0010734:	e8bd8800 	pop	{fp, pc}

f0010738 <arch_sys_schedule>:
f0010738:	e92d4800 	push	{fp, lr}
f001073c:	e28db004 	add	fp, sp, #4
f0010740:	e24dd008 	sub	sp, sp, #8
f0010744:	e50b0008 	str	r0, [fp, #-8]
f0010748:	eb001dac 	bl	f0017e00 <sys_schedule>
f001074c:	e1a03000 	mov	r3, r0
f0010750:	e1a00003 	mov	r0, r3
f0010754:	e24bd004 	sub	sp, fp, #4
f0010758:	e8bd8800 	pop	{fp, pc}

f001075c <arch_sys_getid>:
f001075c:	e92d4800 	push	{fp, lr}
f0010760:	e28db004 	add	fp, sp, #4
f0010764:	e24dd008 	sub	sp, sp, #8
f0010768:	e50b0008 	str	r0, [fp, #-8]
f001076c:	e51b3008 	ldr	r3, [fp, #-8]
f0010770:	e5d32004 	ldrb	r2, [r3, #4]
f0010774:	e5d31005 	ldrb	r1, [r3, #5]
f0010778:	e1a01401 	lsl	r1, r1, #8
f001077c:	e1812002 	orr	r2, r1, r2
f0010780:	e5d31006 	ldrb	r1, [r3, #6]
f0010784:	e1a01801 	lsl	r1, r1, #16
f0010788:	e1812002 	orr	r2, r1, r2
f001078c:	e5d33007 	ldrb	r3, [r3, #7]
f0010790:	e1a03c03 	lsl	r3, r3, #24
f0010794:	e1833002 	orr	r3, r3, r2
f0010798:	e1a00003 	mov	r0, r3
f001079c:	eb001da5 	bl	f0017e38 <sys_getid>
f00107a0:	e1a03000 	mov	r3, r0
f00107a4:	e1a00003 	mov	r0, r3
f00107a8:	e24bd004 	sub	sp, fp, #4
f00107ac:	e8bd8800 	pop	{fp, pc}

f00107b0 <arch_sys_unmap>:
f00107b0:	e92d4800 	push	{fp, lr}
f00107b4:	e28db004 	add	fp, sp, #4
f00107b8:	e24dd008 	sub	sp, sp, #8
f00107bc:	e50b0008 	str	r0, [fp, #-8]
f00107c0:	e51b3008 	ldr	r3, [fp, #-8]
f00107c4:	e5d32004 	ldrb	r2, [r3, #4]
f00107c8:	e5d31005 	ldrb	r1, [r3, #5]
f00107cc:	e1a01401 	lsl	r1, r1, #8
f00107d0:	e1812002 	orr	r2, r1, r2
f00107d4:	e5d31006 	ldrb	r1, [r3, #6]
f00107d8:	e1a01801 	lsl	r1, r1, #16
f00107dc:	e1812002 	orr	r2, r1, r2
f00107e0:	e5d33007 	ldrb	r3, [r3, #7]
f00107e4:	e1a03c03 	lsl	r3, r3, #24
f00107e8:	e1833002 	orr	r3, r3, r2
f00107ec:	e1a01003 	mov	r1, r3
f00107f0:	e51b3008 	ldr	r3, [fp, #-8]
f00107f4:	e5d32008 	ldrb	r2, [r3, #8]
f00107f8:	e5d30009 	ldrb	r0, [r3, #9]
f00107fc:	e1a00400 	lsl	r0, r0, #8
f0010800:	e1802002 	orr	r2, r0, r2
f0010804:	e5d3000a 	ldrb	r0, [r3, #10]
f0010808:	e1a00800 	lsl	r0, r0, #16
f001080c:	e1802002 	orr	r2, r0, r2
f0010810:	e5d3300b 	ldrb	r3, [r3, #11]
f0010814:	e1a03c03 	lsl	r3, r3, #24
f0010818:	e1833002 	orr	r3, r3, r2
f001081c:	e1a02003 	mov	r2, r3
f0010820:	e51b3008 	ldr	r3, [fp, #-8]
f0010824:	e5d3000c 	ldrb	r0, [r3, #12]
f0010828:	e5d3c00d 	ldrb	ip, [r3, #13]
f001082c:	e1a0c40c 	lsl	ip, ip, #8
f0010830:	e18c0000 	orr	r0, ip, r0
f0010834:	e5d3c00e 	ldrb	ip, [r3, #14]
f0010838:	e1a0c80c 	lsl	ip, ip, #16
f001083c:	e18c0000 	orr	r0, ip, r0
f0010840:	e5d3300f 	ldrb	r3, [r3, #15]
f0010844:	e1a03c03 	lsl	r3, r3, #24
f0010848:	e1833000 	orr	r3, r3, r0
f001084c:	e1a00001 	mov	r0, r1
f0010850:	e1a01002 	mov	r1, r2
f0010854:	e1a02003 	mov	r2, r3
f0010858:	eb0029fb 	bl	f001b04c <sys_unmap>
f001085c:	e1a03000 	mov	r3, r0
f0010860:	e1a00003 	mov	r0, r3
f0010864:	e24bd004 	sub	sp, fp, #4
f0010868:	e8bd8800 	pop	{fp, pc}

f001086c <arch_sys_irq_control>:
f001086c:	e92d4800 	push	{fp, lr}
f0010870:	e28db004 	add	fp, sp, #4
f0010874:	e24dd008 	sub	sp, sp, #8
f0010878:	e50b0008 	str	r0, [fp, #-8]
f001087c:	e51b3008 	ldr	r3, [fp, #-8]
f0010880:	e5d32004 	ldrb	r2, [r3, #4]
f0010884:	e5d31005 	ldrb	r1, [r3, #5]
f0010888:	e1a01401 	lsl	r1, r1, #8
f001088c:	e1812002 	orr	r2, r1, r2
f0010890:	e5d31006 	ldrb	r1, [r3, #6]
f0010894:	e1a01801 	lsl	r1, r1, #16
f0010898:	e1812002 	orr	r2, r1, r2
f001089c:	e5d33007 	ldrb	r3, [r3, #7]
f00108a0:	e1a03c03 	lsl	r3, r3, #24
f00108a4:	e1833002 	orr	r3, r3, r2
f00108a8:	e1a01003 	mov	r1, r3
f00108ac:	e51b3008 	ldr	r3, [fp, #-8]
f00108b0:	e5d32008 	ldrb	r2, [r3, #8]
f00108b4:	e5d30009 	ldrb	r0, [r3, #9]
f00108b8:	e1a00400 	lsl	r0, r0, #8
f00108bc:	e1802002 	orr	r2, r0, r2
f00108c0:	e5d3000a 	ldrb	r0, [r3, #10]
f00108c4:	e1a00800 	lsl	r0, r0, #16
f00108c8:	e1802002 	orr	r2, r0, r2
f00108cc:	e5d3300b 	ldrb	r3, [r3, #11]
f00108d0:	e1a03c03 	lsl	r3, r3, #24
f00108d4:	e1833002 	orr	r3, r3, r2
f00108d8:	e1a02003 	mov	r2, r3
f00108dc:	e51b3008 	ldr	r3, [fp, #-8]
f00108e0:	e5d3000c 	ldrb	r0, [r3, #12]
f00108e4:	e5d3c00d 	ldrb	ip, [r3, #13]
f00108e8:	e1a0c40c 	lsl	ip, ip, #8
f00108ec:	e18c0000 	orr	r0, ip, r0
f00108f0:	e5d3c00e 	ldrb	ip, [r3, #14]
f00108f4:	e1a0c80c 	lsl	ip, ip, #16
f00108f8:	e18c0000 	orr	r0, ip, r0
f00108fc:	e5d3300f 	ldrb	r3, [r3, #15]
f0010900:	e1a03c03 	lsl	r3, r3, #24
f0010904:	e1833000 	orr	r3, r3, r0
f0010908:	e1a00001 	mov	r0, r1
f001090c:	e1a01002 	mov	r1, r2
f0010910:	e1a02003 	mov	r2, r3
f0010914:	eb0031b4 	bl	f001cfec <sys_irq_control>
f0010918:	e1a03000 	mov	r3, r0
f001091c:	e1a00003 	mov	r0, r3
f0010920:	e24bd004 	sub	sp, fp, #4
f0010924:	e8bd8800 	pop	{fp, pc}

f0010928 <arch_sys_ipc_control>:
f0010928:	e92d4800 	push	{fp, lr}
f001092c:	e28db004 	add	fp, sp, #4
f0010930:	e24dd008 	sub	sp, sp, #8
f0010934:	e50b0008 	str	r0, [fp, #-8]
f0010938:	eb0025f1 	bl	f001a104 <sys_ipc_control>
f001093c:	e1a03000 	mov	r3, r0
f0010940:	e1a00003 	mov	r0, r3
f0010944:	e24bd004 	sub	sp, fp, #4
f0010948:	e8bd8800 	pop	{fp, pc}

f001094c <arch_sys_map>:
f001094c:	e92d4810 	push	{r4, fp, lr}
f0010950:	e28db008 	add	fp, sp, #8
f0010954:	e24dd014 	sub	sp, sp, #20
f0010958:	e50b0010 	str	r0, [fp, #-16]
f001095c:	e51b3010 	ldr	r3, [fp, #-16]
f0010960:	e5d32004 	ldrb	r2, [r3, #4]
f0010964:	e5d31005 	ldrb	r1, [r3, #5]
f0010968:	e1a01401 	lsl	r1, r1, #8
f001096c:	e1812002 	orr	r2, r1, r2
f0010970:	e5d31006 	ldrb	r1, [r3, #6]
f0010974:	e1a01801 	lsl	r1, r1, #16
f0010978:	e1812002 	orr	r2, r1, r2
f001097c:	e5d33007 	ldrb	r3, [r3, #7]
f0010980:	e1a03c03 	lsl	r3, r3, #24
f0010984:	e1833002 	orr	r3, r3, r2
f0010988:	e1a00003 	mov	r0, r3
f001098c:	e51b3010 	ldr	r3, [fp, #-16]
f0010990:	e5d32008 	ldrb	r2, [r3, #8]
f0010994:	e5d31009 	ldrb	r1, [r3, #9]
f0010998:	e1a01401 	lsl	r1, r1, #8
f001099c:	e1812002 	orr	r2, r1, r2
f00109a0:	e5d3100a 	ldrb	r1, [r3, #10]
f00109a4:	e1a01801 	lsl	r1, r1, #16
f00109a8:	e1812002 	orr	r2, r1, r2
f00109ac:	e5d3300b 	ldrb	r3, [r3, #11]
f00109b0:	e1a03c03 	lsl	r3, r3, #24
f00109b4:	e1833002 	orr	r3, r3, r2
f00109b8:	e1a01003 	mov	r1, r3
f00109bc:	e51b3010 	ldr	r3, [fp, #-16]
f00109c0:	e5d3200c 	ldrb	r2, [r3, #12]
f00109c4:	e5d3c00d 	ldrb	ip, [r3, #13]
f00109c8:	e1a0c40c 	lsl	ip, ip, #8
f00109cc:	e18c2002 	orr	r2, ip, r2
f00109d0:	e5d3c00e 	ldrb	ip, [r3, #14]
f00109d4:	e1a0c80c 	lsl	ip, ip, #16
f00109d8:	e18c2002 	orr	r2, ip, r2
f00109dc:	e5d3300f 	ldrb	r3, [r3, #15]
f00109e0:	e1a03c03 	lsl	r3, r3, #24
f00109e4:	e1833002 	orr	r3, r3, r2
f00109e8:	e1a02003 	mov	r2, r3
f00109ec:	e51b3010 	ldr	r3, [fp, #-16]
f00109f0:	e5d3c010 	ldrb	ip, [r3, #16]
f00109f4:	e5d3e011 	ldrb	lr, [r3, #17]
f00109f8:	e1a0e40e 	lsl	lr, lr, #8
f00109fc:	e18ec00c 	orr	ip, lr, ip
f0010a00:	e5d3e012 	ldrb	lr, [r3, #18]
f0010a04:	e1a0e80e 	lsl	lr, lr, #16
f0010a08:	e18ec00c 	orr	ip, lr, ip
f0010a0c:	e5d33013 	ldrb	r3, [r3, #19]
f0010a10:	e1a03c03 	lsl	r3, r3, #24
f0010a14:	e183300c 	orr	r3, r3, ip
f0010a18:	e1a0c003 	mov	ip, r3
f0010a1c:	e51b3010 	ldr	r3, [fp, #-16]
f0010a20:	e5d3e014 	ldrb	lr, [r3, #20]
f0010a24:	e5d34015 	ldrb	r4, [r3, #21]
f0010a28:	e1a04404 	lsl	r4, r4, #8
f0010a2c:	e184e00e 	orr	lr, r4, lr
f0010a30:	e5d34016 	ldrb	r4, [r3, #22]
f0010a34:	e1a04804 	lsl	r4, r4, #16
f0010a38:	e184e00e 	orr	lr, r4, lr
f0010a3c:	e5d33017 	ldrb	r3, [r3, #23]
f0010a40:	e1a03c03 	lsl	r3, r3, #24
f0010a44:	e183300e 	orr	r3, r3, lr
f0010a48:	e58d3000 	str	r3, [sp]
f0010a4c:	e1a0300c 	mov	r3, ip
f0010a50:	eb002941 	bl	f001af5c <sys_map>
f0010a54:	e1a03000 	mov	r3, r0
f0010a58:	e1a00003 	mov	r0, r3
f0010a5c:	e24bd008 	sub	sp, fp, #8
f0010a60:	e8bd8810 	pop	{r4, fp, pc}

f0010a64 <arch_sys_capability_control>:
f0010a64:	e92d4800 	push	{fp, lr}
f0010a68:	e28db004 	add	fp, sp, #4
f0010a6c:	e24dd008 	sub	sp, sp, #8
f0010a70:	e50b0008 	str	r0, [fp, #-8]
f0010a74:	e51b3008 	ldr	r3, [fp, #-8]
f0010a78:	e5d32004 	ldrb	r2, [r3, #4]
f0010a7c:	e5d31005 	ldrb	r1, [r3, #5]
f0010a80:	e1a01401 	lsl	r1, r1, #8
f0010a84:	e1812002 	orr	r2, r1, r2
f0010a88:	e5d31006 	ldrb	r1, [r3, #6]
f0010a8c:	e1a01801 	lsl	r1, r1, #16
f0010a90:	e1812002 	orr	r2, r1, r2
f0010a94:	e5d33007 	ldrb	r3, [r3, #7]
f0010a98:	e1a03c03 	lsl	r3, r3, #24
f0010a9c:	e1833002 	orr	r3, r3, r2
f0010aa0:	e1a01003 	mov	r1, r3
f0010aa4:	e51b3008 	ldr	r3, [fp, #-8]
f0010aa8:	e5d32008 	ldrb	r2, [r3, #8]
f0010aac:	e5d30009 	ldrb	r0, [r3, #9]
f0010ab0:	e1a00400 	lsl	r0, r0, #8
f0010ab4:	e1802002 	orr	r2, r0, r2
f0010ab8:	e5d3000a 	ldrb	r0, [r3, #10]
f0010abc:	e1a00800 	lsl	r0, r0, #16
f0010ac0:	e1802002 	orr	r2, r0, r2
f0010ac4:	e5d3300b 	ldrb	r3, [r3, #11]
f0010ac8:	e1a03c03 	lsl	r3, r3, #24
f0010acc:	e1833002 	orr	r3, r3, r2
f0010ad0:	e1a02003 	mov	r2, r3
f0010ad4:	e51b3008 	ldr	r3, [fp, #-8]
f0010ad8:	e5d3000c 	ldrb	r0, [r3, #12]
f0010adc:	e5d3c00d 	ldrb	ip, [r3, #13]
f0010ae0:	e1a0c40c 	lsl	ip, ip, #8
f0010ae4:	e18c0000 	orr	r0, ip, r0
f0010ae8:	e5d3c00e 	ldrb	ip, [r3, #14]
f0010aec:	e1a0c80c 	lsl	ip, ip, #16
f0010af0:	e18c0000 	orr	r0, ip, r0
f0010af4:	e5d3300f 	ldrb	r3, [r3, #15]
f0010af8:	e1a03c03 	lsl	r3, r3, #24
f0010afc:	e1833000 	orr	r3, r3, r0
f0010b00:	e1a00001 	mov	r0, r1
f0010b04:	e1a01002 	mov	r1, r2
f0010b08:	e1a02003 	mov	r2, r3
f0010b0c:	eb002c57 	bl	f001bc70 <sys_capability_control>
f0010b10:	e1a03000 	mov	r3, r0
f0010b14:	e1a00003 	mov	r0, r3
f0010b18:	e24bd004 	sub	sp, fp, #4
f0010b1c:	e8bd8800 	pop	{fp, pc}

f0010b20 <arch_sys_container_control>:
f0010b20:	e92d4800 	push	{fp, lr}
f0010b24:	e28db004 	add	fp, sp, #4
f0010b28:	e24dd008 	sub	sp, sp, #8
f0010b2c:	e50b0008 	str	r0, [fp, #-8]
f0010b30:	e51b3008 	ldr	r3, [fp, #-8]
f0010b34:	e5d32004 	ldrb	r2, [r3, #4]
f0010b38:	e5d31005 	ldrb	r1, [r3, #5]
f0010b3c:	e1a01401 	lsl	r1, r1, #8
f0010b40:	e1812002 	orr	r2, r1, r2
f0010b44:	e5d31006 	ldrb	r1, [r3, #6]
f0010b48:	e1a01801 	lsl	r1, r1, #16
f0010b4c:	e1812002 	orr	r2, r1, r2
f0010b50:	e5d33007 	ldrb	r3, [r3, #7]
f0010b54:	e1a03c03 	lsl	r3, r3, #24
f0010b58:	e1833002 	orr	r3, r3, r2
f0010b5c:	e1a01003 	mov	r1, r3
f0010b60:	e51b3008 	ldr	r3, [fp, #-8]
f0010b64:	e5d32008 	ldrb	r2, [r3, #8]
f0010b68:	e5d30009 	ldrb	r0, [r3, #9]
f0010b6c:	e1a00400 	lsl	r0, r0, #8
f0010b70:	e1802002 	orr	r2, r0, r2
f0010b74:	e5d3000a 	ldrb	r0, [r3, #10]
f0010b78:	e1a00800 	lsl	r0, r0, #16
f0010b7c:	e1802002 	orr	r2, r0, r2
f0010b80:	e5d3300b 	ldrb	r3, [r3, #11]
f0010b84:	e1a03c03 	lsl	r3, r3, #24
f0010b88:	e1833002 	orr	r3, r3, r2
f0010b8c:	e1a02003 	mov	r2, r3
f0010b90:	e51b3008 	ldr	r3, [fp, #-8]
f0010b94:	e5d3000c 	ldrb	r0, [r3, #12]
f0010b98:	e5d3c00d 	ldrb	ip, [r3, #13]
f0010b9c:	e1a0c40c 	lsl	ip, ip, #8
f0010ba0:	e18c0000 	orr	r0, ip, r0
f0010ba4:	e5d3c00e 	ldrb	ip, [r3, #14]
f0010ba8:	e1a0c80c 	lsl	ip, ip, #16
f0010bac:	e18c0000 	orr	r0, ip, r0
f0010bb0:	e5d3300f 	ldrb	r3, [r3, #15]
f0010bb4:	e1a03c03 	lsl	r3, r3, #24
f0010bb8:	e1833000 	orr	r3, r3, r0
f0010bbc:	e1a00001 	mov	r0, r1
f0010bc0:	e1a01002 	mov	r1, r2
f0010bc4:	e1a02003 	mov	r2, r3
f0010bc8:	eb001cbd 	bl	f0017ec4 <sys_container_control>
f0010bcc:	e1a03000 	mov	r3, r0
f0010bd0:	e1a00003 	mov	r0, r3
f0010bd4:	e24bd004 	sub	sp, fp, #4
f0010bd8:	e8bd8800 	pop	{fp, pc}

f0010bdc <arch_sys_time>:
f0010bdc:	e92d4800 	push	{fp, lr}
f0010be0:	e28db004 	add	fp, sp, #4
f0010be4:	e24dd008 	sub	sp, sp, #8
f0010be8:	e50b0008 	str	r0, [fp, #-8]
f0010bec:	e51b3008 	ldr	r3, [fp, #-8]
f0010bf0:	e5d32004 	ldrb	r2, [r3, #4]
f0010bf4:	e5d31005 	ldrb	r1, [r3, #5]
f0010bf8:	e1a01401 	lsl	r1, r1, #8
f0010bfc:	e1812002 	orr	r2, r1, r2
f0010c00:	e5d31006 	ldrb	r1, [r3, #6]
f0010c04:	e1a01801 	lsl	r1, r1, #16
f0010c08:	e1812002 	orr	r2, r1, r2
f0010c0c:	e5d33007 	ldrb	r3, [r3, #7]
f0010c10:	e1a03c03 	lsl	r3, r3, #24
f0010c14:	e1833002 	orr	r3, r3, r2
f0010c18:	e1a02003 	mov	r2, r3
f0010c1c:	e51b3008 	ldr	r3, [fp, #-8]
f0010c20:	e5d31008 	ldrb	r1, [r3, #8]
f0010c24:	e5d30009 	ldrb	r0, [r3, #9]
f0010c28:	e1a00400 	lsl	r0, r0, #8
f0010c2c:	e1801001 	orr	r1, r0, r1
f0010c30:	e5d3000a 	ldrb	r0, [r3, #10]
f0010c34:	e1a00800 	lsl	r0, r0, #16
f0010c38:	e1801001 	orr	r1, r0, r1
f0010c3c:	e5d3300b 	ldrb	r3, [r3, #11]
f0010c40:	e1a03c03 	lsl	r3, r3, #24
f0010c44:	e1833001 	orr	r3, r3, r1
f0010c48:	e1a00002 	mov	r0, r2
f0010c4c:	e1a01003 	mov	r1, r3
f0010c50:	ebffe2b6 	bl	f0009730 <sys_time>
f0010c54:	e1a03000 	mov	r3, r0
f0010c58:	e1a00003 	mov	r0, r3
f0010c5c:	e24bd004 	sub	sp, fp, #4
f0010c60:	e8bd8800 	pop	{fp, pc}

f0010c64 <arch_sys_mutex_control>:
f0010c64:	e92d4800 	push	{fp, lr}
f0010c68:	e28db004 	add	fp, sp, #4
f0010c6c:	e24dd008 	sub	sp, sp, #8
f0010c70:	e50b0008 	str	r0, [fp, #-8]
f0010c74:	e51b3008 	ldr	r3, [fp, #-8]
f0010c78:	e5d32004 	ldrb	r2, [r3, #4]
f0010c7c:	e5d31005 	ldrb	r1, [r3, #5]
f0010c80:	e1a01401 	lsl	r1, r1, #8
f0010c84:	e1812002 	orr	r2, r1, r2
f0010c88:	e5d31006 	ldrb	r1, [r3, #6]
f0010c8c:	e1a01801 	lsl	r1, r1, #16
f0010c90:	e1812002 	orr	r2, r1, r2
f0010c94:	e5d33007 	ldrb	r3, [r3, #7]
f0010c98:	e1a03c03 	lsl	r3, r3, #24
f0010c9c:	e1833002 	orr	r3, r3, r2
f0010ca0:	e1a02003 	mov	r2, r3
f0010ca4:	e51b3008 	ldr	r3, [fp, #-8]
f0010ca8:	e5d31008 	ldrb	r1, [r3, #8]
f0010cac:	e5d30009 	ldrb	r0, [r3, #9]
f0010cb0:	e1a00400 	lsl	r0, r0, #8
f0010cb4:	e1801001 	orr	r1, r0, r1
f0010cb8:	e5d3000a 	ldrb	r0, [r3, #10]
f0010cbc:	e1a00800 	lsl	r0, r0, #16
f0010cc0:	e1801001 	orr	r1, r0, r1
f0010cc4:	e5d3300b 	ldrb	r3, [r3, #11]
f0010cc8:	e1a03c03 	lsl	r3, r3, #24
f0010ccc:	e1833001 	orr	r3, r3, r1
f0010cd0:	e1a00002 	mov	r0, r2
f0010cd4:	e1a01003 	mov	r1, r3
f0010cd8:	eb002b3f 	bl	f001b9dc <sys_mutex_control>
f0010cdc:	e1a03000 	mov	r3, r0
f0010ce0:	e1a00003 	mov	r0, r3
f0010ce4:	e24bd004 	sub	sp, fp, #4
f0010ce8:	e8bd8800 	pop	{fp, pc}

f0010cec <arch_sys_cache_control>:
f0010cec:	e92d4800 	push	{fp, lr}
f0010cf0:	e28db004 	add	fp, sp, #4
f0010cf4:	e24dd008 	sub	sp, sp, #8
f0010cf8:	e50b0008 	str	r0, [fp, #-8]
f0010cfc:	e51b3008 	ldr	r3, [fp, #-8]
f0010d00:	e5d32004 	ldrb	r2, [r3, #4]
f0010d04:	e5d31005 	ldrb	r1, [r3, #5]
f0010d08:	e1a01401 	lsl	r1, r1, #8
f0010d0c:	e1812002 	orr	r2, r1, r2
f0010d10:	e5d31006 	ldrb	r1, [r3, #6]
f0010d14:	e1a01801 	lsl	r1, r1, #16
f0010d18:	e1812002 	orr	r2, r1, r2
f0010d1c:	e5d33007 	ldrb	r3, [r3, #7]
f0010d20:	e1a03c03 	lsl	r3, r3, #24
f0010d24:	e1833002 	orr	r3, r3, r2
f0010d28:	e1a01003 	mov	r1, r3
f0010d2c:	e51b3008 	ldr	r3, [fp, #-8]
f0010d30:	e5d32008 	ldrb	r2, [r3, #8]
f0010d34:	e5d30009 	ldrb	r0, [r3, #9]
f0010d38:	e1a00400 	lsl	r0, r0, #8
f0010d3c:	e1802002 	orr	r2, r0, r2
f0010d40:	e5d3000a 	ldrb	r0, [r3, #10]
f0010d44:	e1a00800 	lsl	r0, r0, #16
f0010d48:	e1802002 	orr	r2, r0, r2
f0010d4c:	e5d3300b 	ldrb	r3, [r3, #11]
f0010d50:	e1a03c03 	lsl	r3, r3, #24
f0010d54:	e1833002 	orr	r3, r3, r2
f0010d58:	e1a02003 	mov	r2, r3
f0010d5c:	e51b3008 	ldr	r3, [fp, #-8]
f0010d60:	e5d3000c 	ldrb	r0, [r3, #12]
f0010d64:	e5d3c00d 	ldrb	ip, [r3, #13]
f0010d68:	e1a0c40c 	lsl	ip, ip, #8
f0010d6c:	e18c0000 	orr	r0, ip, r0
f0010d70:	e5d3c00e 	ldrb	ip, [r3, #14]
f0010d74:	e1a0c80c 	lsl	ip, ip, #16
f0010d78:	e18c0000 	orr	r0, ip, r0
f0010d7c:	e5d3300f 	ldrb	r3, [r3, #15]
f0010d80:	e1a03c03 	lsl	r3, r3, #24
f0010d84:	e1833000 	orr	r3, r3, r0
f0010d88:	e1a00001 	mov	r0, r1
f0010d8c:	e1a01002 	mov	r1, r2
f0010d90:	e1a02003 	mov	r2, r3
f0010d94:	eb0030bc 	bl	f001d08c <sys_cache_control>
f0010d98:	e1a03000 	mov	r3, r0
f0010d9c:	e1a00003 	mov	r0, r3
f0010da0:	e24bd004 	sub	sp, fp, #4
f0010da4:	e8bd8800 	pop	{fp, pc}

f0010da8 <syscall_init>:
f0010da8:	e92d4800 	push	{fp, lr}
f0010dac:	e28db004 	add	fp, sp, #4
f0010db0:	e59f30cc 	ldr	r3, [pc, #204]	; f0010e84 <syscall_init+0xdc>
f0010db4:	e59f20cc 	ldr	r2, [pc, #204]	; f0010e88 <syscall_init+0xe0>
f0010db8:	e5832000 	str	r2, [r3]
f0010dbc:	e59f30c0 	ldr	r3, [pc, #192]	; f0010e84 <syscall_init+0xdc>
f0010dc0:	e59f20c4 	ldr	r2, [pc, #196]	; f0010e8c <syscall_init+0xe4>
f0010dc4:	e5832004 	str	r2, [r3, #4]
f0010dc8:	e59f30b4 	ldr	r3, [pc, #180]	; f0010e84 <syscall_init+0xdc>
f0010dcc:	e59f20bc 	ldr	r2, [pc, #188]	; f0010e90 <syscall_init+0xe8>
f0010dd0:	e5832008 	str	r2, [r3, #8]
f0010dd4:	e59f30a8 	ldr	r3, [pc, #168]	; f0010e84 <syscall_init+0xdc>
f0010dd8:	e59f20b4 	ldr	r2, [pc, #180]	; f0010e94 <syscall_init+0xec>
f0010ddc:	e583200c 	str	r2, [r3, #12]
f0010de0:	e59f309c 	ldr	r3, [pc, #156]	; f0010e84 <syscall_init+0xdc>
f0010de4:	e59f20ac 	ldr	r2, [pc, #172]	; f0010e98 <syscall_init+0xf0>
f0010de8:	e5832010 	str	r2, [r3, #16]
f0010dec:	e59f3090 	ldr	r3, [pc, #144]	; f0010e84 <syscall_init+0xdc>
f0010df0:	e59f20a4 	ldr	r2, [pc, #164]	; f0010e9c <syscall_init+0xf4>
f0010df4:	e5832024 	str	r2, [r3, #36]	; 0x24
f0010df8:	e59f3084 	ldr	r3, [pc, #132]	; f0010e84 <syscall_init+0xdc>
f0010dfc:	e59f209c 	ldr	r2, [pc, #156]	; f0010ea0 <syscall_init+0xf8>
f0010e00:	e5832014 	str	r2, [r3, #20]
f0010e04:	e59f3078 	ldr	r3, [pc, #120]	; f0010e84 <syscall_init+0xdc>
f0010e08:	e59f2094 	ldr	r2, [pc, #148]	; f0010ea4 <syscall_init+0xfc>
f0010e0c:	e5832018 	str	r2, [r3, #24]
f0010e10:	e59f306c 	ldr	r3, [pc, #108]	; f0010e84 <syscall_init+0xdc>
f0010e14:	e59f208c 	ldr	r2, [pc, #140]	; f0010ea8 <syscall_init+0x100>
f0010e18:	e583201c 	str	r2, [r3, #28]
f0010e1c:	e59f3060 	ldr	r3, [pc, #96]	; f0010e84 <syscall_init+0xdc>
f0010e20:	e59f2084 	ldr	r2, [pc, #132]	; f0010eac <syscall_init+0x104>
f0010e24:	e5832020 	str	r2, [r3, #32]
f0010e28:	e59f3054 	ldr	r3, [pc, #84]	; f0010e84 <syscall_init+0xdc>
f0010e2c:	e59f207c 	ldr	r2, [pc, #124]	; f0010eb0 <syscall_init+0x108>
f0010e30:	e5832028 	str	r2, [r3, #40]	; 0x28
f0010e34:	e59f3048 	ldr	r3, [pc, #72]	; f0010e84 <syscall_init+0xdc>
f0010e38:	e59f2074 	ldr	r2, [pc, #116]	; f0010eb4 <syscall_init+0x10c>
f0010e3c:	e583202c 	str	r2, [r3, #44]	; 0x2c
f0010e40:	e59f303c 	ldr	r3, [pc, #60]	; f0010e84 <syscall_init+0xdc>
f0010e44:	e59f206c 	ldr	r2, [pc, #108]	; f0010eb8 <syscall_init+0x110>
f0010e48:	e5832030 	str	r2, [r3, #48]	; 0x30
f0010e4c:	e59f3030 	ldr	r3, [pc, #48]	; f0010e84 <syscall_init+0xdc>
f0010e50:	e59f2064 	ldr	r2, [pc, #100]	; f0010ebc <syscall_init+0x114>
f0010e54:	e5832034 	str	r2, [r3, #52]	; 0x34
f0010e58:	e59f3024 	ldr	r3, [pc, #36]	; f0010e84 <syscall_init+0xdc>
f0010e5c:	e59f205c 	ldr	r2, [pc, #92]	; f0010ec0 <syscall_init+0x118>
f0010e60:	e5832038 	str	r2, [r3, #56]	; 0x38
f0010e64:	e59f3058 	ldr	r3, [pc, #88]	; f0010ec4 <syscall_init+0x11c>
f0010e68:	e2833201 	add	r3, r3, #268435456	; 0x10000000
f0010e6c:	e1a00003 	mov	r0, r3
f0010e70:	e59f1050 	ldr	r1, [pc, #80]	; f0010ec8 <syscall_init+0x120>
f0010e74:	e3a02a01 	mov	r2, #4096	; 0x1000
f0010e78:	e3a03008 	mov	r3, #8
f0010e7c:	eb0008b8 	bl	f0013164 <add_boot_mapping>
f0010e80:	e8bd8800 	pop	{fp, pc}
f0010e84:	f0033168 	.word	0xf0033168
f0010e88:	f0010548 	.word	0xf0010548
f0010e8c:	f0010604 	.word	0xf0010604
f0010e90:	f0010628 	.word	0xf0010628
f0010e94:	f00106b0 	.word	0xf00106b0
f0010e98:	f0010738 	.word	0xf0010738
f0010e9c:	f001075c 	.word	0xf001075c
f0010ea0:	f00107b0 	.word	0xf00107b0
f0010ea4:	f001086c 	.word	0xf001086c
f0010ea8:	f0010928 	.word	0xf0010928
f0010eac:	f001094c 	.word	0xf001094c
f0010eb0:	f0010a64 	.word	0xf0010a64
f0010eb4:	f0010b20 	.word	0xf0010b20
f0010eb8:	f0010bdc 	.word	0xf0010bdc
f0010ebc:	f0010c64 	.word	0xf0010c64
f0010ec0:	f0010cec 	.word	0xf0010cec
f0010ec4:	f0026000 	.word	0xf0026000
f0010ec8:	fffff000 	.word	0xfffff000

f0010ecc <syscall>:
f0010ecc:	e92d4800 	push	{fp, lr}
f0010ed0:	e28db004 	add	fp, sp, #4
f0010ed4:	e24dd010 	sub	sp, sp, #16
f0010ed8:	e50b0010 	str	r0, [fp, #-16]
f0010edc:	e50b1014 	str	r1, [fp, #-20]
f0010ee0:	e3a03000 	mov	r3, #0
f0010ee4:	e50b3008 	str	r3, [fp, #-8]
f0010ee8:	e51b3014 	ldr	r3, [fp, #-20]
f0010eec:	e3c33eff 	bic	r3, r3, #4080	; 0xff0
f0010ef0:	e3c3300f 	bic	r3, r3, #15
f0010ef4:	e3730a01 	cmn	r3, #4096	; 0x1000
f0010ef8:	1a000020 	bne	f0010f80 <syscall+0xb4>
f0010efc:	e51b3014 	ldr	r3, [fp, #-20]
f0010f00:	e20330ff 	and	r3, r3, #255	; 0xff
f0010f04:	e3530038 	cmp	r3, #56	; 0x38
f0010f08:	8a000014 	bhi	f0010f60 <syscall+0x94>
f0010f0c:	ebfffcbc 	bl	f0010204 <system_account_syscall>
f0010f10:	e51b0014 	ldr	r0, [fp, #-20]
f0010f14:	ebfffcbf 	bl	f0010218 <system_account_syscall_type>
f0010f18:	ebfffcc5 	bl	f0010234 <system_measure_syscall_start>
f0010f1c:	e51b3014 	ldr	r3, [fp, #-20]
f0010f20:	e20330ff 	and	r3, r3, #255	; 0xff
f0010f24:	e1a02123 	lsr	r2, r3, #2
f0010f28:	e59f30a4 	ldr	r3, [pc, #164]	; f0010fd4 <syscall+0x108>
f0010f2c:	e7933102 	ldr	r3, [r3, r2, lsl #2]
f0010f30:	e51b0010 	ldr	r0, [fp, #-16]
f0010f34:	e12fff33 	blx	r3
f0010f38:	e50b0008 	str	r0, [fp, #-8]
f0010f3c:	e51b0014 	ldr	r0, [fp, #-20]
f0010f40:	ebfffcc0 	bl	f0010248 <system_measure_syscall_end>
f0010f44:	ebfffca5 	bl	f00101e0 <current_task>
f0010f48:	e1a03000 	mov	r3, r0
f0010f4c:	e5933060 	ldr	r3, [r3, #96]	; 0x60
f0010f50:	e2033002 	and	r3, r3, #2
f0010f54:	e3530000 	cmp	r3, #0
f0010f58:	0a000019 	beq	f0010fc4 <syscall+0xf8>
f0010f5c:	ea00000c 	b	f0010f94 <syscall+0xc8>
f0010f60:	e51b3014 	ldr	r3, [fp, #-20]
f0010f64:	e5933000 	ldr	r3, [r3]
f0010f68:	e59f0068 	ldr	r0, [pc, #104]	; f0010fd8 <syscall+0x10c>
f0010f6c:	e51b1014 	ldr	r1, [fp, #-20]
f0010f70:	e1a02003 	mov	r2, r3
f0010f74:	eb0013dc 	bl	f0015eec <printk>
f0010f78:	e3e03025 	mvn	r3, #37	; 0x25
f0010f7c:	ea000011 	b	f0010fc8 <syscall+0xfc>
f0010f80:	e59f0054 	ldr	r0, [pc, #84]	; f0010fdc <syscall+0x110>
f0010f84:	e51b1014 	ldr	r1, [fp, #-20]
f0010f88:	eb0013d7 	bl	f0015eec <printk>
f0010f8c:	e3e03025 	mvn	r3, #37	; 0x25
f0010f90:	ea00000c 	b	f0010fc8 <syscall+0xfc>
f0010f94:	ebfffc91 	bl	f00101e0 <current_task>
f0010f98:	e1a03000 	mov	r3, r0
f0010f9c:	e59330ac 	ldr	r3, [r3, #172]	; 0xac
f0010fa0:	e3530000 	cmp	r3, #0
f0010fa4:	0a000005 	beq	f0010fc0 <syscall+0xf4>
f0010fa8:	e59f0030 	ldr	r0, [pc, #48]	; f0010fe0 <syscall+0x114>
f0010fac:	e59f1030 	ldr	r1, [pc, #48]	; f0010fe4 <syscall+0x118>
f0010fb0:	e59f2030 	ldr	r2, [pc, #48]	; f0010fe8 <syscall+0x11c>
f0010fb4:	e3a030c5 	mov	r3, #197	; 0xc5
f0010fb8:	eb0013cb 	bl	f0015eec <printk>
f0010fbc:	eafffffe 	b	f0010fbc <syscall+0xf0>
f0010fc0:	ebffdfcf 	bl	f0008f04 <sched_suspend_sync>
f0010fc4:	e51b3008 	ldr	r3, [fp, #-8]
f0010fc8:	e1a00003 	mov	r0, r3
f0010fcc:	e24bd004 	sub	sp, fp, #4
f0010fd0:	e8bd8800 	pop	{fp, pc}
f0010fd4:	f0033168 	.word	0xf0033168
f0010fd8:	f001ec2c 	.word	0xf001ec2c
f0010fdc:	f001ec68 	.word	0xf001ec68
f0010fe0:	f001eca8 	.word	0xf001eca8
f0010fe4:	f001ecd0 	.word	0xf001ecd0
f0010fe8:	f001ece8 	.word	0xf001ece8

f0010fec <invalidate_cache>:
f0010fec:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f0010ff0:	e28db000 	add	fp, sp, #0
f0010ff4:	e24bd000 	sub	sp, fp, #0
f0010ff8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0010ffc:	e12fff1e 	bx	lr

f0011000 <invalidate_icache>:
f0011000:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f0011004:	e28db000 	add	fp, sp, #0
f0011008:	e24bd000 	sub	sp, fp, #0
f001100c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0011010:	e12fff1e 	bx	lr

f0011014 <invalidate_dcache>:
f0011014:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f0011018:	e28db000 	add	fp, sp, #0
f001101c:	e24bd000 	sub	sp, fp, #0
f0011020:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0011024:	e12fff1e 	bx	lr

f0011028 <clean_dcache>:
f0011028:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f001102c:	e28db000 	add	fp, sp, #0
f0011030:	e24bd000 	sub	sp, fp, #0
f0011034:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0011038:	e12fff1e 	bx	lr

f001103c <clean_invalidate_dcache>:
f001103c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f0011040:	e28db000 	add	fp, sp, #0
f0011044:	e24bd000 	sub	sp, fp, #0
f0011048:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f001104c:	e12fff1e 	bx	lr

f0011050 <clean_invalidate_cache>:
f0011050:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f0011054:	e28db000 	add	fp, sp, #0
f0011058:	e24bd000 	sub	sp, fp, #0
f001105c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0011060:	e12fff1e 	bx	lr

f0011064 <drain_writebuffer>:
f0011064:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f0011068:	e28db000 	add	fp, sp, #0
f001106c:	e24bd000 	sub	sp, fp, #0
f0011070:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0011074:	e12fff1e 	bx	lr

f0011078 <invalidate_tlb>:
f0011078:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f001107c:	e28db000 	add	fp, sp, #0
f0011080:	e24bd000 	sub	sp, fp, #0
f0011084:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0011088:	e12fff1e 	bx	lr

f001108c <invalidate_itlb>:
f001108c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f0011090:	e28db000 	add	fp, sp, #0
f0011094:	e24bd000 	sub	sp, fp, #0
f0011098:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f001109c:	e12fff1e 	bx	lr

f00110a0 <invalidate_dtlb>:
f00110a0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f00110a4:	e28db000 	add	fp, sp, #0
f00110a8:	e24bd000 	sub	sp, fp, #0
f00110ac:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f00110b0:	e12fff1e 	bx	lr
	...

f0012000 <disable_irqs>:
f0012000:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f0012004:	e28db000 	add	fp, sp, #0
f0012008:	e10f0000 	mrs	r0, CPSR
f001200c:	e3800080 	orr	r0, r0, #128	; 0x80
f0012010:	e129f000 	msr	CPSR_fc, r0
f0012014:	e24bd000 	sub	sp, fp, #0
f0012018:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f001201c:	e12fff1e 	bx	lr

f0012020 <current_task>:
f0012020:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f0012024:	e28db000 	add	fp, sp, #0
f0012028:	e1a0300d 	mov	r3, sp
f001202c:	e3c33eff 	bic	r3, r3, #4080	; 0xff0
f0012030:	e3c3300f 	bic	r3, r3, #15
f0012034:	e1a00003 	mov	r0, r3
f0012038:	e24bd000 	sub	sp, fp, #0
f001203c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0012040:	e12fff1e 	bx	lr

f0012044 <system_account_dabort>:
f0012044:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f0012048:	e28db000 	add	fp, sp, #0
f001204c:	e24bd000 	sub	sp, fp, #0
f0012050:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0012054:	e12fff1e 	bx	lr

f0012058 <system_account_pabort>:
f0012058:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f001205c:	e28db000 	add	fp, sp, #0
f0012060:	e24bd000 	sub	sp, fp, #0
f0012064:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0012068:	e12fff1e 	bx	lr

f001206c <system_account_undef_abort>:
f001206c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f0012070:	e28db000 	add	fp, sp, #0
f0012074:	e24bd000 	sub	sp, fp, #0
f0012078:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f001207c:	e12fff1e 	bx	lr

f0012080 <is_user_mode>:
f0012080:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f0012084:	e28db000 	add	fp, sp, #0
f0012088:	e24dd00c 	sub	sp, sp, #12
f001208c:	e50b0008 	str	r0, [fp, #-8]
f0012090:	e51b3008 	ldr	r3, [fp, #-8]
f0012094:	e203301f 	and	r3, r3, #31
f0012098:	e3530010 	cmp	r3, #16
f001209c:	13a03000 	movne	r3, #0
f00120a0:	03a03001 	moveq	r3, #1
f00120a4:	e20330ff 	and	r3, r3, #255	; 0xff
f00120a8:	e1a00003 	mov	r0, r3
f00120ac:	e24bd000 	sub	sp, fp, #0
f00120b0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f00120b4:	e12fff1e 	bx	lr

f00120b8 <tcb_set_ipc_flags>:
f00120b8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f00120bc:	e28db000 	add	fp, sp, #0
f00120c0:	e24dd00c 	sub	sp, sp, #12
f00120c4:	e50b0008 	str	r0, [fp, #-8]
f00120c8:	e50b100c 	str	r1, [fp, #-12]
f00120cc:	e51b3008 	ldr	r3, [fp, #-8]
f00120d0:	e51b200c 	ldr	r2, [fp, #-12]
f00120d4:	e5832064 	str	r2, [r3, #100]	; 0x64
f00120d8:	e24bd000 	sub	sp, fp, #0
f00120dc:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f00120e0:	e12fff1e 	bx	lr

f00120e4 <tcb_get_ipc_flags>:
f00120e4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f00120e8:	e28db000 	add	fp, sp, #0
f00120ec:	e24dd00c 	sub	sp, sp, #12
f00120f0:	e50b0008 	str	r0, [fp, #-8]
f00120f4:	e51b3008 	ldr	r3, [fp, #-8]
f00120f8:	e5933064 	ldr	r3, [r3, #100]	; 0x64
f00120fc:	e1a00003 	mov	r0, r3
f0012100:	e24bd000 	sub	sp, fp, #0
f0012104:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0012108:	e12fff1e 	bx	lr

f001210c <abort_die>:
f001210c:	e92d4800 	push	{fp, lr}
f0012110:	e28db004 	add	fp, sp, #4
f0012114:	ebffffb9 	bl	f0012000 <disable_irqs>
f0012118:	e59f0014 	ldr	r0, [pc, #20]	; f0012134 <abort_die+0x28>
f001211c:	eb002e58 	bl	f001da84 <print_early>
f0012120:	e59f0010 	ldr	r0, [pc, #16]	; f0012138 <abort_die+0x2c>
f0012124:	eb002e56 	bl	f001da84 <print_early>
f0012128:	e59f000c 	ldr	r0, [pc, #12]	; f001213c <abort_die+0x30>
f001212c:	eb002e54 	bl	f001da84 <print_early>
f0012130:	eafffffe 	b	f0012130 <abort_die+0x24>
f0012134:	f001ecf0 	.word	0xf001ecf0
f0012138:	f001ed0c 	.word	0xf001ed0c
f001213c:	f001ed1c 	.word	0xf001ed1c

f0012140 <ipc_save_state>:
f0012140:	e92d4800 	push	{fp, lr}
f0012144:	e28db004 	add	fp, sp, #4
f0012148:	e24dd010 	sub	sp, sp, #16
f001214c:	e50b0010 	str	r0, [fp, #-16]
f0012150:	ebffffb2 	bl	f0012020 <current_task>
f0012154:	e1a03000 	mov	r3, r0
f0012158:	e5933044 	ldr	r3, [r3, #68]	; 0x44
f001215c:	e2833010 	add	r3, r3, #16
f0012160:	e50b300c 	str	r3, [fp, #-12]
f0012164:	e51b300c 	ldr	r3, [fp, #-12]
f0012168:	e3530000 	cmp	r3, #0
f001216c:	1a000005 	bne	f0012188 <ipc_save_state+0x48>
f0012170:	e59f0078 	ldr	r0, [pc, #120]	; f00121f0 <ipc_save_state+0xb0>
f0012174:	e59f1078 	ldr	r1, [pc, #120]	; f00121f4 <ipc_save_state+0xb4>
f0012178:	e59f2078 	ldr	r2, [pc, #120]	; f00121f8 <ipc_save_state+0xb8>
f001217c:	e3a0302e 	mov	r3, #46	; 0x2e
f0012180:	eb000f59 	bl	f0015eec <printk>
f0012184:	eafffffe 	b	f0012184 <ipc_save_state+0x44>
f0012188:	e3a03000 	mov	r3, #0
f001218c:	e50b3008 	str	r3, [fp, #-8]
f0012190:	ea00000a 	b	f00121c0 <ipc_save_state+0x80>
f0012194:	e51b3008 	ldr	r3, [fp, #-8]
f0012198:	e1a03103 	lsl	r3, r3, #2
f001219c:	e51b200c 	ldr	r2, [fp, #-12]
f00121a0:	e0823003 	add	r3, r2, r3
f00121a4:	e5931000 	ldr	r1, [r3]
f00121a8:	e51b3010 	ldr	r3, [fp, #-16]
f00121ac:	e51b2008 	ldr	r2, [fp, #-8]
f00121b0:	e7831102 	str	r1, [r3, r2, lsl #2]
f00121b4:	e51b3008 	ldr	r3, [fp, #-8]
f00121b8:	e2833001 	add	r3, r3, #1
f00121bc:	e50b3008 	str	r3, [fp, #-8]
f00121c0:	e51b3008 	ldr	r3, [fp, #-8]
f00121c4:	e3530005 	cmp	r3, #5
f00121c8:	dafffff1 	ble	f0012194 <ipc_save_state+0x54>
f00121cc:	ebffff93 	bl	f0012020 <current_task>
f00121d0:	e1a03000 	mov	r3, r0
f00121d4:	e1a00003 	mov	r0, r3
f00121d8:	ebffffc1 	bl	f00120e4 <tcb_get_ipc_flags>
f00121dc:	e1a02000 	mov	r2, r0
f00121e0:	e51b3010 	ldr	r3, [fp, #-16]
f00121e4:	e5832018 	str	r2, [r3, #24]
f00121e8:	e24bd004 	sub	sp, fp, #4
f00121ec:	e8bd8800 	pop	{fp, pc}
f00121f0:	f001ed30 	.word	0xf001ed30
f00121f4:	f001ed58 	.word	0xf001ed58
f00121f8:	f001eef8 	.word	0xf001eef8

f00121fc <ipc_restore_state>:
f00121fc:	e92d4800 	push	{fp, lr}
f0012200:	e28db004 	add	fp, sp, #4
f0012204:	e24dd010 	sub	sp, sp, #16
f0012208:	e50b0010 	str	r0, [fp, #-16]
f001220c:	ebffff83 	bl	f0012020 <current_task>
f0012210:	e1a03000 	mov	r3, r0
f0012214:	e5933044 	ldr	r3, [r3, #68]	; 0x44
f0012218:	e2833010 	add	r3, r3, #16
f001221c:	e50b300c 	str	r3, [fp, #-12]
f0012220:	e51b300c 	ldr	r3, [fp, #-12]
f0012224:	e3530000 	cmp	r3, #0
f0012228:	1a000005 	bne	f0012244 <ipc_restore_state+0x48>
f001222c:	e59f0078 	ldr	r0, [pc, #120]	; f00122ac <ipc_restore_state+0xb0>
f0012230:	e59f1078 	ldr	r1, [pc, #120]	; f00122b0 <ipc_restore_state+0xb4>
f0012234:	e59f2078 	ldr	r2, [pc, #120]	; f00122b4 <ipc_restore_state+0xb8>
f0012238:	e3a0303c 	mov	r3, #60	; 0x3c
f001223c:	eb000f2a 	bl	f0015eec <printk>
f0012240:	eafffffe 	b	f0012240 <ipc_restore_state+0x44>
f0012244:	e3a03000 	mov	r3, #0
f0012248:	e50b3008 	str	r3, [fp, #-8]
f001224c:	ea00000a 	b	f001227c <ipc_restore_state+0x80>
f0012250:	e51b3008 	ldr	r3, [fp, #-8]
f0012254:	e1a03103 	lsl	r3, r3, #2
f0012258:	e51b200c 	ldr	r2, [fp, #-12]
f001225c:	e0823003 	add	r3, r2, r3
f0012260:	e51b2010 	ldr	r2, [fp, #-16]
f0012264:	e51b1008 	ldr	r1, [fp, #-8]
f0012268:	e7922101 	ldr	r2, [r2, r1, lsl #2]
f001226c:	e5832000 	str	r2, [r3]
f0012270:	e51b3008 	ldr	r3, [fp, #-8]
f0012274:	e2833001 	add	r3, r3, #1
f0012278:	e50b3008 	str	r3, [fp, #-8]
f001227c:	e51b3008 	ldr	r3, [fp, #-8]
f0012280:	e3530005 	cmp	r3, #5
f0012284:	dafffff1 	ble	f0012250 <ipc_restore_state+0x54>
f0012288:	ebffff64 	bl	f0012020 <current_task>
f001228c:	e1a02000 	mov	r2, r0
f0012290:	e51b3010 	ldr	r3, [fp, #-16]
f0012294:	e5933018 	ldr	r3, [r3, #24]
f0012298:	e1a00002 	mov	r0, r2
f001229c:	e1a01003 	mov	r1, r3
f00122a0:	ebffff84 	bl	f00120b8 <tcb_set_ipc_flags>
f00122a4:	e24bd004 	sub	sp, fp, #4
f00122a8:	e8bd8800 	pop	{fp, pc}
f00122ac:	f001ed30 	.word	0xf001ed30
f00122b0:	f001ed58 	.word	0xf001ed58
f00122b4:	f001ef08 	.word	0xf001ef08

f00122b8 <fault_ipc_to_pager>:
f00122b8:	e92d4810 	push	{r4, fp, lr}
f00122bc:	e28db008 	add	fp, sp, #8
f00122c0:	e24dd044 	sub	sp, sp, #68	; 0x44
f00122c4:	e50b0030 	str	r0, [fp, #-48]	; 0x30
f00122c8:	e50b1034 	str	r1, [fp, #-52]	; 0x34
f00122cc:	e50b2038 	str	r2, [fp, #-56]	; 0x38
f00122d0:	e50b303c 	str	r3, [fp, #-60]	; 0x3c
f00122d4:	e24b302c 	sub	r3, fp, #44	; 0x2c
f00122d8:	e3a02000 	mov	r2, #0
f00122dc:	e5832000 	str	r2, [r3]
f00122e0:	e2833004 	add	r3, r3, #4
f00122e4:	e3a02000 	mov	r2, #0
f00122e8:	e5832000 	str	r2, [r3]
f00122ec:	e2833004 	add	r3, r3, #4
f00122f0:	e3a02000 	mov	r2, #0
f00122f4:	e5832000 	str	r2, [r3]
f00122f8:	e2833004 	add	r3, r3, #4
f00122fc:	e3a02000 	mov	r2, #0
f0012300:	e5832000 	str	r2, [r3]
f0012304:	e2833004 	add	r3, r3, #4
f0012308:	e3a02000 	mov	r2, #0
f001230c:	e5832000 	str	r2, [r3]
f0012310:	e2833004 	add	r3, r3, #4
f0012314:	e3a02000 	mov	r2, #0
f0012318:	e5832000 	str	r2, [r3]
f001231c:	e2833004 	add	r3, r3, #4
f0012320:	e51b303c 	ldr	r3, [fp, #-60]	; 0x3c
f0012324:	e50b302c 	str	r3, [fp, #-44]	; 0x2c
f0012328:	ebffff3c 	bl	f0012020 <current_task>
f001232c:	e1a03000 	mov	r3, r0
f0012330:	e5933054 	ldr	r3, [r3, #84]	; 0x54
f0012334:	e50b3028 	str	r3, [fp, #-40]	; 0x28
f0012338:	e24b302c 	sub	r3, fp, #44	; 0x2c
f001233c:	e2833008 	add	r3, r3, #8
f0012340:	e50b3010 	str	r3, [fp, #-16]
f0012344:	e51b3010 	ldr	r3, [fp, #-16]
f0012348:	e55b2030 	ldrb	r2, [fp, #-48]	; 0x30
f001234c:	e3a01000 	mov	r1, #0
f0012350:	e1812002 	orr	r2, r1, r2
f0012354:	e5c32000 	strb	r2, [r3]
f0012358:	e55b202f 	ldrb	r2, [fp, #-47]	; 0x2f
f001235c:	e3a01000 	mov	r1, #0
f0012360:	e1812002 	orr	r2, r1, r2
f0012364:	e5c32001 	strb	r2, [r3, #1]
f0012368:	e55b202e 	ldrb	r2, [fp, #-46]	; 0x2e
f001236c:	e3a01000 	mov	r1, #0
f0012370:	e1812002 	orr	r2, r1, r2
f0012374:	e5c32002 	strb	r2, [r3, #2]
f0012378:	e55b202d 	ldrb	r2, [fp, #-45]	; 0x2d
f001237c:	e3a01000 	mov	r1, #0
f0012380:	e1812002 	orr	r2, r1, r2
f0012384:	e5c32003 	strb	r2, [r3, #3]
f0012388:	e51b3010 	ldr	r3, [fp, #-16]
f001238c:	e55b2034 	ldrb	r2, [fp, #-52]	; 0x34
f0012390:	e3a01000 	mov	r1, #0
f0012394:	e1812002 	orr	r2, r1, r2
f0012398:	e5c32004 	strb	r2, [r3, #4]
f001239c:	e55b2033 	ldrb	r2, [fp, #-51]	; 0x33
f00123a0:	e3a01000 	mov	r1, #0
f00123a4:	e1812002 	orr	r2, r1, r2
f00123a8:	e5c32005 	strb	r2, [r3, #5]
f00123ac:	e55b2032 	ldrb	r2, [fp, #-50]	; 0x32
f00123b0:	e3a01000 	mov	r1, #0
f00123b4:	e1812002 	orr	r2, r1, r2
f00123b8:	e5c32006 	strb	r2, [r3, #6]
f00123bc:	e55b2031 	ldrb	r2, [fp, #-49]	; 0x31
f00123c0:	e3a01000 	mov	r1, #0
f00123c4:	e1812002 	orr	r2, r1, r2
f00123c8:	e5c32007 	strb	r2, [r3, #7]
f00123cc:	e51b3010 	ldr	r3, [fp, #-16]
f00123d0:	e55b2038 	ldrb	r2, [fp, #-56]	; 0x38
f00123d4:	e3a01000 	mov	r1, #0
f00123d8:	e1812002 	orr	r2, r1, r2
f00123dc:	e5c32008 	strb	r2, [r3, #8]
f00123e0:	e55b2037 	ldrb	r2, [fp, #-55]	; 0x37
f00123e4:	e3a01000 	mov	r1, #0
f00123e8:	e1812002 	orr	r2, r1, r2
f00123ec:	e5c32009 	strb	r2, [r3, #9]
f00123f0:	e55b2036 	ldrb	r2, [fp, #-54]	; 0x36
f00123f4:	e3a01000 	mov	r1, #0
f00123f8:	e1812002 	orr	r2, r1, r2
f00123fc:	e5c3200a 	strb	r2, [r3, #10]
f0012400:	e55b2035 	ldrb	r2, [fp, #-53]	; 0x35
f0012404:	e3a01000 	mov	r1, #0
f0012408:	e1812002 	orr	r2, r1, r2
f001240c:	e5c3200b 	strb	r2, [r3, #11]
f0012410:	e51b3034 	ldr	r3, [fp, #-52]	; 0x34
f0012414:	e2033c01 	and	r3, r3, #256	; 0x100
f0012418:	e3530000 	cmp	r3, #0
f001241c:	0a000016 	beq	f001247c <fault_ipc_to_pager+0x1c4>
f0012420:	e51b0030 	ldr	r0, [fp, #-48]	; 0x30
f0012424:	eb00021a 	bl	f0012c94 <virt_to_pte>
f0012428:	e1a02000 	mov	r2, r0
f001242c:	e51b3010 	ldr	r3, [fp, #-16]
f0012430:	e20210ff 	and	r1, r2, #255	; 0xff
f0012434:	e3a00000 	mov	r0, #0
f0012438:	e1801001 	orr	r1, r0, r1
f001243c:	e5c3100c 	strb	r1, [r3, #12]
f0012440:	e1a01422 	lsr	r1, r2, #8
f0012444:	e20110ff 	and	r1, r1, #255	; 0xff
f0012448:	e3a00000 	mov	r0, #0
f001244c:	e1801001 	orr	r1, r0, r1
f0012450:	e5c3100d 	strb	r1, [r3, #13]
f0012454:	e1a01822 	lsr	r1, r2, #16
f0012458:	e20110ff 	and	r1, r1, #255	; 0xff
f001245c:	e3a00000 	mov	r0, #0
f0012460:	e1801001 	orr	r1, r0, r1
f0012464:	e5c3100e 	strb	r1, [r3, #14]
f0012468:	e1a02c22 	lsr	r2, r2, #24
f001246c:	e3a01000 	mov	r1, #0
f0012470:	e1812002 	orr	r2, r1, r2
f0012474:	e5c3200f 	strb	r2, [r3, #15]
f0012478:	ea000015 	b	f00124d4 <fault_ipc_to_pager+0x21c>
f001247c:	e51b0038 	ldr	r0, [fp, #-56]	; 0x38
f0012480:	eb000203 	bl	f0012c94 <virt_to_pte>
f0012484:	e1a02000 	mov	r2, r0
f0012488:	e51b3010 	ldr	r3, [fp, #-16]
f001248c:	e20210ff 	and	r1, r2, #255	; 0xff
f0012490:	e3a00000 	mov	r0, #0
f0012494:	e1801001 	orr	r1, r0, r1
f0012498:	e5c3100c 	strb	r1, [r3, #12]
f001249c:	e1a01422 	lsr	r1, r2, #8
f00124a0:	e20110ff 	and	r1, r1, #255	; 0xff
f00124a4:	e3a00000 	mov	r0, #0
f00124a8:	e1801001 	orr	r1, r0, r1
f00124ac:	e5c3100d 	strb	r1, [r3, #13]
f00124b0:	e1a01822 	lsr	r1, r2, #16
f00124b4:	e20110ff 	and	r1, r1, #255	; 0xff
f00124b8:	e3a00000 	mov	r0, #0
f00124bc:	e1801001 	orr	r1, r0, r1
f00124c0:	e5c3100e 	strb	r1, [r3, #14]
f00124c4:	e1a02c22 	lsr	r2, r2, #24
f00124c8:	e3a01000 	mov	r1, #0
f00124cc:	e1812002 	orr	r2, r1, r2
f00124d0:	e5c3200f 	strb	r2, [r3, #15]
f00124d4:	ebfffed1 	bl	f0012020 <current_task>
f00124d8:	e1a03000 	mov	r3, r0
f00124dc:	e24b202c 	sub	r2, fp, #44	; 0x2c
f00124e0:	e2422010 	sub	r2, r2, #16
f00124e4:	e5832044 	str	r2, [r3, #68]	; 0x44
f00124e8:	ebfffecc 	bl	f0012020 <current_task>
f00124ec:	e1a03000 	mov	r3, r0
f00124f0:	e1a00003 	mov	r0, r3
f00124f4:	e3a01000 	mov	r1, #0
f00124f8:	ebfffeee 	bl	f00120b8 <tcb_set_ipc_flags>
f00124fc:	ebfffec7 	bl	f0012020 <current_task>
f0012500:	e1a04000 	mov	r4, r0
f0012504:	ebfffec5 	bl	f0012020 <current_task>
f0012508:	e1a03000 	mov	r3, r0
f001250c:	e59330bc 	ldr	r3, [r3, #188]	; 0xbc
f0012510:	e1540003 	cmp	r4, r3
f0012514:	1a00003c 	bne	f001260c <fault_ipc_to_pager+0x354>
f0012518:	ebfffec0 	bl	f0012020 <current_task>
f001251c:	e1a03000 	mov	r3, r0
f0012520:	e5931054 	ldr	r1, [r3, #84]	; 0x54
f0012524:	e51b3010 	ldr	r3, [fp, #-16]
f0012528:	e5d32004 	ldrb	r2, [r3, #4]
f001252c:	e5d30005 	ldrb	r0, [r3, #5]
f0012530:	e1a00400 	lsl	r0, r0, #8
f0012534:	e1802002 	orr	r2, r0, r2
f0012538:	e5d30006 	ldrb	r0, [r3, #6]
f001253c:	e1a00800 	lsl	r0, r0, #16
f0012540:	e1802002 	orr	r2, r0, r2
f0012544:	e5d33007 	ldrb	r3, [r3, #7]
f0012548:	e1a03c03 	lsl	r3, r3, #24
f001254c:	e1833002 	orr	r3, r3, r2
f0012550:	e1a02003 	mov	r2, r3
f0012554:	e51b3010 	ldr	r3, [fp, #-16]
f0012558:	e5d30008 	ldrb	r0, [r3, #8]
f001255c:	e5d3c009 	ldrb	ip, [r3, #9]
f0012560:	e1a0c40c 	lsl	ip, ip, #8
f0012564:	e18c0000 	orr	r0, ip, r0
f0012568:	e5d3c00a 	ldrb	ip, [r3, #10]
f001256c:	e1a0c80c 	lsl	ip, ip, #16
f0012570:	e18c0000 	orr	r0, ip, r0
f0012574:	e5d3300b 	ldrb	r3, [r3, #11]
f0012578:	e1a03c03 	lsl	r3, r3, #24
f001257c:	e1833000 	orr	r3, r3, r0
f0012580:	e1a0c003 	mov	ip, r3
f0012584:	e51b3010 	ldr	r3, [fp, #-16]
f0012588:	e5d30000 	ldrb	r0, [r3]
f001258c:	e5d3e001 	ldrb	lr, [r3, #1]
f0012590:	e1a0e40e 	lsl	lr, lr, #8
f0012594:	e18e0000 	orr	r0, lr, r0
f0012598:	e5d3e002 	ldrb	lr, [r3, #2]
f001259c:	e1a0e80e 	lsl	lr, lr, #16
f00125a0:	e18e0000 	orr	r0, lr, r0
f00125a4:	e5d33003 	ldrb	r3, [r3, #3]
f00125a8:	e1a03c03 	lsl	r3, r3, #24
f00125ac:	e1833000 	orr	r3, r3, r0
f00125b0:	e1a00003 	mov	r0, r3
f00125b4:	e51b3010 	ldr	r3, [fp, #-16]
f00125b8:	e5d3e00c 	ldrb	lr, [r3, #12]
f00125bc:	e5d3400d 	ldrb	r4, [r3, #13]
f00125c0:	e1a04404 	lsl	r4, r4, #8
f00125c4:	e184e00e 	orr	lr, r4, lr
f00125c8:	e5d3400e 	ldrb	r4, [r3, #14]
f00125cc:	e1a04804 	lsl	r4, r4, #16
f00125d0:	e184e00e 	orr	lr, r4, lr
f00125d4:	e5d3300f 	ldrb	r3, [r3, #15]
f00125d8:	e1a03c03 	lsl	r3, r3, #24
f00125dc:	e183300e 	orr	r3, r3, lr
f00125e0:	e58d0000 	str	r0, [sp]
f00125e4:	e58d3004 	str	r3, [sp, #4]
f00125e8:	e3a03000 	mov	r3, #0
f00125ec:	e58d3008 	str	r3, [sp, #8]
f00125f0:	e59f00f0 	ldr	r0, [pc, #240]	; f00126e8 <fault_ipc_to_pager+0x430>
f00125f4:	e1a0300c 	mov	r3, ip
f00125f8:	eb000e3b 	bl	f0015eec <printk>
f00125fc:	ebfffe87 	bl	f0012020 <current_task>
f0012600:	e1a03000 	mov	r3, r0
f0012604:	e1a00003 	mov	r0, r3
f0012608:	eb001947 	bl	f0018b2c <thread_destroy>
f001260c:	ebfffe83 	bl	f0012020 <current_task>
f0012610:	e1a03000 	mov	r3, r0
f0012614:	e59330bc 	ldr	r3, [r3, #188]	; 0xbc
f0012618:	e5934054 	ldr	r4, [r3, #84]	; 0x54
f001261c:	ebfffe7f 	bl	f0012020 <current_task>
f0012620:	e1a03000 	mov	r3, r0
f0012624:	e59330bc 	ldr	r3, [r3, #188]	; 0xbc
f0012628:	e5933054 	ldr	r3, [r3, #84]	; 0x54
f001262c:	e1a00004 	mov	r0, r4
f0012630:	e1a01003 	mov	r1, r3
f0012634:	e3a02000 	mov	r2, #0
f0012638:	eb002030 	bl	f001a700 <ipc_sendrecv>
f001263c:	e50b0014 	str	r0, [fp, #-20]
f0012640:	e51b3014 	ldr	r3, [fp, #-20]
f0012644:	e3530000 	cmp	r3, #0
f0012648:	aa000022 	bge	f00126d8 <fault_ipc_to_pager+0x420>
f001264c:	ebfffe73 	bl	f0012020 <current_task>
f0012650:	e1a03000 	mov	r3, r0
f0012654:	e59330ac 	ldr	r3, [r3, #172]	; 0xac
f0012658:	e3530000 	cmp	r3, #0
f001265c:	0a000005 	beq	f0012678 <fault_ipc_to_pager+0x3c0>
f0012660:	e59f0084 	ldr	r0, [pc, #132]	; f00126ec <fault_ipc_to_pager+0x434>
f0012664:	e59f1084 	ldr	r1, [pc, #132]	; f00126f0 <fault_ipc_to_pager+0x438>
f0012668:	e59f2084 	ldr	r2, [pc, #132]	; f00126f4 <fault_ipc_to_pager+0x43c>
f001266c:	e3a03083 	mov	r3, #131	; 0x83
f0012670:	eb000e1d 	bl	f0015eec <printk>
f0012674:	eafffffe 	b	f0012674 <fault_ipc_to_pager+0x3bc>
f0012678:	e51b3014 	ldr	r3, [fp, #-20]
f001267c:	e3730004 	cmn	r3, #4
f0012680:	1a000007 	bne	f00126a4 <fault_ipc_to_pager+0x3ec>
f0012684:	ebfffe65 	bl	f0012020 <current_task>
f0012688:	e1a03000 	mov	r3, r0
f001268c:	e5933054 	ldr	r3, [r3, #84]	; 0x54
f0012690:	e59f0060 	ldr	r0, [pc, #96]	; f00126f8 <fault_ipc_to_pager+0x440>
f0012694:	e1a01003 	mov	r1, r3
f0012698:	eb000e13 	bl	f0015eec <printk>
f001269c:	e51b3014 	ldr	r3, [fp, #-20]
f00126a0:	ea00000d 	b	f00126dc <fault_ipc_to_pager+0x424>
f00126a4:	ebfffe5d 	bl	f0012020 <current_task>
f00126a8:	e1a03000 	mov	r3, r0
f00126ac:	e5933054 	ldr	r3, [r3, #84]	; 0x54
f00126b0:	e59f0044 	ldr	r0, [pc, #68]	; f00126fc <fault_ipc_to_pager+0x444>
f00126b4:	e1a01003 	mov	r1, r3
f00126b8:	e51b2014 	ldr	r2, [fp, #-20]
f00126bc:	eb000e0a 	bl	f0015eec <printk>
f00126c0:	ebfffe56 	bl	f0012020 <current_task>
f00126c4:	e1a03000 	mov	r3, r0
f00126c8:	e5932060 	ldr	r2, [r3, #96]	; 0x60
f00126cc:	e3822002 	orr	r2, r2, #2
f00126d0:	e5832060 	str	r2, [r3, #96]	; 0x60
f00126d4:	ebffda0a 	bl	f0008f04 <sched_suspend_sync>
f00126d8:	e3a03000 	mov	r3, #0
f00126dc:	e1a00003 	mov	r0, r3
f00126e0:	e24bd008 	sub	sp, fp, #8
f00126e4:	e8bd8810 	pop	{r4, fp, pc}
f00126e8:	f001ed78 	.word	0xf001ed78
f00126ec:	f001ed30 	.word	0xf001ed30
f00126f0:	f001ed58 	.word	0xf001ed58
f00126f4:	f001ef1c 	.word	0xf001ef1c
f00126f8:	f001edd0 	.word	0xf001edd0
f00126fc:	f001ee0c 	.word	0xf001ee0c

f0012700 <pager_pagein_request>:
f0012700:	e92d4800 	push	{fp, lr}
f0012704:	e28db004 	add	fp, sp, #4
f0012708:	e24dd040 	sub	sp, sp, #64	; 0x40
f001270c:	e50b0038 	str	r0, [fp, #-56]	; 0x38
f0012710:	e50b103c 	str	r1, [fp, #-60]	; 0x3c
f0012714:	e50b2040 	str	r2, [fp, #-64]	; 0x40
f0012718:	e3a03000 	mov	r3, #0
f001271c:	e50b300c 	str	r3, [fp, #-12]
f0012720:	e51b303c 	ldr	r3, [fp, #-60]	; 0x3c
f0012724:	e2833eff 	add	r3, r3, #4080	; 0xff0
f0012728:	e283300f 	add	r3, r3, #15
f001272c:	e1a03623 	lsr	r3, r3, #12
f0012730:	e50b3010 	str	r3, [fp, #-16]
f0012734:	e51b300c 	ldr	r3, [fp, #-12]
f0012738:	e3c33c01 	bic	r3, r3, #256	; 0x100
f001273c:	e50b300c 	str	r3, [fp, #-12]
f0012740:	e24b3030 	sub	r3, fp, #48	; 0x30
f0012744:	e1a00003 	mov	r0, r3
f0012748:	ebfffe7c 	bl	f0012140 <ipc_save_state>
f001274c:	e3a03000 	mov	r3, #0
f0012750:	e50b3008 	str	r3, [fp, #-8]
f0012754:	ea000012 	b	f00127a4 <pager_pagein_request+0xa4>
f0012758:	e51b3008 	ldr	r3, [fp, #-8]
f001275c:	e1a03603 	lsl	r3, r3, #12
f0012760:	e1a02003 	mov	r2, r3
f0012764:	e51b3038 	ldr	r3, [fp, #-56]	; 0x38
f0012768:	e0823003 	add	r3, r2, r3
f001276c:	e3a00000 	mov	r0, #0
f0012770:	e51b100c 	ldr	r1, [fp, #-12]
f0012774:	e1a02003 	mov	r2, r3
f0012778:	e3a03000 	mov	r3, #0
f001277c:	ebfffecd 	bl	f00122b8 <fault_ipc_to_pager>
f0012780:	e50b0014 	str	r0, [fp, #-20]
f0012784:	e51b3014 	ldr	r3, [fp, #-20]
f0012788:	e3530000 	cmp	r3, #0
f001278c:	aa000001 	bge	f0012798 <pager_pagein_request+0x98>
f0012790:	e51b3014 	ldr	r3, [fp, #-20]
f0012794:	ea00000a 	b	f00127c4 <pager_pagein_request+0xc4>
f0012798:	e51b3008 	ldr	r3, [fp, #-8]
f001279c:	e2833001 	add	r3, r3, #1
f00127a0:	e50b3008 	str	r3, [fp, #-8]
f00127a4:	e51b2008 	ldr	r2, [fp, #-8]
f00127a8:	e51b3010 	ldr	r3, [fp, #-16]
f00127ac:	e1520003 	cmp	r2, r3
f00127b0:	3affffe8 	bcc	f0012758 <pager_pagein_request+0x58>
f00127b4:	e24b3030 	sub	r3, fp, #48	; 0x30
f00127b8:	e1a00003 	mov	r0, r3
f00127bc:	ebfffe8e 	bl	f00121fc <ipc_restore_state>
f00127c0:	e3a03000 	mov	r3, #0
f00127c4:	e1a00003 	mov	r0, r3
f00127c8:	e24bd004 	sub	sp, fp, #4
f00127cc:	e8bd8800 	pop	{fp, pc}

f00127d0 <data_abort_handler>:
f00127d0:	e92d4800 	push	{fp, lr}
f00127d4:	e28db004 	add	fp, sp, #4
f00127d8:	e24dd018 	sub	sp, sp, #24
f00127dc:	e50b0010 	str	r0, [fp, #-16]
f00127e0:	e50b1014 	str	r1, [fp, #-20]
f00127e4:	e50b2018 	str	r2, [fp, #-24]
f00127e8:	e50b301c 	str	r3, [fp, #-28]
f00127ec:	ebfffe14 	bl	f0012044 <system_account_dabort>
f00127f0:	e51b3014 	ldr	r3, [fp, #-20]
f00127f4:	e3c33c01 	bic	r3, r3, #256	; 0x100
f00127f8:	e50b3014 	str	r3, [fp, #-20]
f00127fc:	e51b0010 	ldr	r0, [fp, #-16]
f0012800:	e51b1014 	ldr	r1, [fp, #-20]
f0012804:	e51b2018 	ldr	r2, [fp, #-24]
f0012808:	e51b301c 	ldr	r3, [fp, #-28]
f001280c:	eb00075b 	bl	f0014580 <check_abort_type>
f0012810:	e50b0008 	str	r0, [fp, #-8]
f0012814:	e51b3008 	ldr	r3, [fp, #-8]
f0012818:	e3530000 	cmp	r3, #0
f001281c:	aa00000e 	bge	f001285c <data_abort_handler+0x8c>
f0012820:	e1a00000 	nop			; (mov r0, r0)
f0012824:	e59f00ac 	ldr	r0, [pc, #172]	; f00128d8 <data_abort_handler+0x108>
f0012828:	eb002c95 	bl	f001da84 <print_early>
f001282c:	e51b0018 	ldr	r0, [fp, #-24]
f0012830:	eb002cc0 	bl	f001db38 <printhex8>
f0012834:	e59f00a0 	ldr	r0, [pc, #160]	; f00128dc <data_abort_handler+0x10c>
f0012838:	eb002c91 	bl	f001da84 <print_early>
f001283c:	e59f009c 	ldr	r0, [pc, #156]	; f00128e0 <data_abort_handler+0x110>
f0012840:	eb002c8f 	bl	f001da84 <print_early>
f0012844:	e51b0010 	ldr	r0, [fp, #-16]
f0012848:	eb002cba 	bl	f001db38 <printhex8>
f001284c:	e59f0088 	ldr	r0, [pc, #136]	; f00128dc <data_abort_handler+0x10c>
f0012850:	eb002c8b 	bl	f001da84 <print_early>
f0012854:	ebfffe2c 	bl	f001210c <abort_die>
f0012858:	ea00001c 	b	f00128d0 <data_abort_handler+0x100>
f001285c:	e51b3008 	ldr	r3, [fp, #-8]
f0012860:	e3530001 	cmp	r3, #1
f0012864:	1a000000 	bne	f001286c <data_abort_handler+0x9c>
f0012868:	ea000018 	b	f00128d0 <data_abort_handler+0x100>
f001286c:	e51b0010 	ldr	r0, [fp, #-16]
f0012870:	e51b1014 	ldr	r1, [fp, #-20]
f0012874:	e51b2018 	ldr	r2, [fp, #-24]
f0012878:	e3a03000 	mov	r3, #0
f001287c:	ebfffe8d 	bl	f00122b8 <fault_ipc_to_pager>
f0012880:	ebfffde6 	bl	f0012020 <current_task>
f0012884:	e1a03000 	mov	r3, r0
f0012888:	e5933060 	ldr	r3, [r3, #96]	; 0x60
f001288c:	e2033002 	and	r3, r3, #2
f0012890:	e3530000 	cmp	r3, #0
f0012894:	0a00000c 	beq	f00128cc <data_abort_handler+0xfc>
f0012898:	ebfffde0 	bl	f0012020 <current_task>
f001289c:	e1a03000 	mov	r3, r0
f00128a0:	e59330ac 	ldr	r3, [r3, #172]	; 0xac
f00128a4:	e3530000 	cmp	r3, #0
f00128a8:	0a000005 	beq	f00128c4 <data_abort_handler+0xf4>
f00128ac:	e59f0030 	ldr	r0, [pc, #48]	; f00128e4 <data_abort_handler+0x114>
f00128b0:	e59f1030 	ldr	r1, [pc, #48]	; f00128e8 <data_abort_handler+0x118>
f00128b4:	e59f2030 	ldr	r2, [pc, #48]	; f00128ec <data_abort_handler+0x11c>
f00128b8:	e3a030e2 	mov	r3, #226	; 0xe2
f00128bc:	eb000d8a 	bl	f0015eec <printk>
f00128c0:	eafffffe 	b	f00128c0 <data_abort_handler+0xf0>
f00128c4:	ebffd98e 	bl	f0008f04 <sched_suspend_sync>
f00128c8:	eaffffff 	b	f00128cc <data_abort_handler+0xfc>
f00128cc:	e1a00000 	nop			; (mov r0, r0)
f00128d0:	e24bd004 	sub	sp, fp, #4
f00128d4:	e8bd8800 	pop	{fp, pc}
f00128d8:	f001ee70 	.word	0xf001ee70
f00128dc:	f001ee78 	.word	0xf001ee78
f00128e0:	f001ee7c 	.word	0xf001ee7c
f00128e4:	f001ed30 	.word	0xf001ed30
f00128e8:	f001ed58 	.word	0xf001ed58
f00128ec:	f001ef30 	.word	0xf001ef30

f00128f0 <prefetch_abort_handler>:
f00128f0:	e92d4800 	push	{fp, lr}
f00128f4:	e28db004 	add	fp, sp, #4
f00128f8:	e24dd018 	sub	sp, sp, #24
f00128fc:	e50b0010 	str	r0, [fp, #-16]
f0012900:	e50b1014 	str	r1, [fp, #-20]
f0012904:	e50b2018 	str	r2, [fp, #-24]
f0012908:	e50b301c 	str	r3, [fp, #-28]
f001290c:	ebfffdd1 	bl	f0012058 <system_account_pabort>
f0012910:	e51b3014 	ldr	r3, [fp, #-20]
f0012914:	e3c33c01 	bic	r3, r3, #256	; 0x100
f0012918:	e50b3014 	str	r3, [fp, #-20]
f001291c:	e51b3014 	ldr	r3, [fp, #-20]
f0012920:	e3833c01 	orr	r3, r3, #256	; 0x100
f0012924:	e50b3014 	str	r3, [fp, #-20]
f0012928:	e3a00000 	mov	r0, #0
f001292c:	e51b1014 	ldr	r1, [fp, #-20]
f0012930:	e51b2018 	ldr	r2, [fp, #-24]
f0012934:	e51b301c 	ldr	r3, [fp, #-28]
f0012938:	eb000710 	bl	f0014580 <check_abort_type>
f001293c:	e50b0008 	str	r0, [fp, #-8]
f0012940:	e51b3008 	ldr	r3, [fp, #-8]
f0012944:	e3530000 	cmp	r3, #0
f0012948:	aa000008 	bge	f0012970 <prefetch_abort_handler+0x80>
f001294c:	e1a00000 	nop			; (mov r0, r0)
f0012950:	e59f0094 	ldr	r0, [pc, #148]	; f00129ec <prefetch_abort_handler+0xfc>
f0012954:	eb002c4a 	bl	f001da84 <print_early>
f0012958:	e51b0018 	ldr	r0, [fp, #-24]
f001295c:	eb002c75 	bl	f001db38 <printhex8>
f0012960:	e59f0088 	ldr	r0, [pc, #136]	; f00129f0 <prefetch_abort_handler+0x100>
f0012964:	eb002c46 	bl	f001da84 <print_early>
f0012968:	ebfffde7 	bl	f001210c <abort_die>
f001296c:	ea00001c 	b	f00129e4 <prefetch_abort_handler+0xf4>
f0012970:	e51b3008 	ldr	r3, [fp, #-8]
f0012974:	e3530001 	cmp	r3, #1
f0012978:	1a000000 	bne	f0012980 <prefetch_abort_handler+0x90>
f001297c:	ea000018 	b	f00129e4 <prefetch_abort_handler+0xf4>
f0012980:	e51b0010 	ldr	r0, [fp, #-16]
f0012984:	e51b1014 	ldr	r1, [fp, #-20]
f0012988:	e51b2018 	ldr	r2, [fp, #-24]
f001298c:	e3a03000 	mov	r3, #0
f0012990:	ebfffe48 	bl	f00122b8 <fault_ipc_to_pager>
f0012994:	ebfffda1 	bl	f0012020 <current_task>
f0012998:	e1a03000 	mov	r3, r0
f001299c:	e5933060 	ldr	r3, [r3, #96]	; 0x60
f00129a0:	e2033002 	and	r3, r3, #2
f00129a4:	e3530000 	cmp	r3, #0
f00129a8:	0a00000c 	beq	f00129e0 <prefetch_abort_handler+0xf0>
f00129ac:	ebfffd9b 	bl	f0012020 <current_task>
f00129b0:	e1a03000 	mov	r3, r0
f00129b4:	e59330ac 	ldr	r3, [r3, #172]	; 0xac
f00129b8:	e3530000 	cmp	r3, #0
f00129bc:	0a000005 	beq	f00129d8 <prefetch_abort_handler+0xe8>
f00129c0:	e59f002c 	ldr	r0, [pc, #44]	; f00129f4 <prefetch_abort_handler+0x104>
f00129c4:	e59f102c 	ldr	r1, [pc, #44]	; f00129f8 <prefetch_abort_handler+0x108>
f00129c8:	e59f202c 	ldr	r2, [pc, #44]	; f00129fc <prefetch_abort_handler+0x10c>
f00129cc:	e3a03e11 	mov	r3, #272	; 0x110
f00129d0:	eb000d45 	bl	f0015eec <printk>
f00129d4:	eafffffe 	b	f00129d4 <prefetch_abort_handler+0xe4>
f00129d8:	ebffd949 	bl	f0008f04 <sched_suspend_sync>
f00129dc:	eaffffff 	b	f00129e0 <prefetch_abort_handler+0xf0>
f00129e0:	e1a00000 	nop			; (mov r0, r0)
f00129e4:	e24bd004 	sub	sp, fp, #4
f00129e8:	e8bd8800 	pop	{fp, pc}
f00129ec:	f001ee70 	.word	0xf001ee70
f00129f0:	f001ee78 	.word	0xf001ee78
f00129f4:	f001ed30 	.word	0xf001ed30
f00129f8:	f001ed58 	.word	0xf001ed58
f00129fc:	f001ef44 	.word	0xf001ef44

f0012a00 <undefined_instr_handler>:
f0012a00:	e92d4800 	push	{fp, lr}
f0012a04:	e28db004 	add	fp, sp, #4
f0012a08:	e24dd010 	sub	sp, sp, #16
f0012a0c:	e50b0008 	str	r0, [fp, #-8]
f0012a10:	e50b100c 	str	r1, [fp, #-12]
f0012a14:	e50b2010 	str	r2, [fp, #-16]
f0012a18:	ebfffd93 	bl	f001206c <system_account_undef_abort>
f0012a1c:	e51b0008 	ldr	r0, [fp, #-8]
f0012a20:	e3a01000 	mov	r1, #0
f0012a24:	e51b2008 	ldr	r2, [fp, #-8]
f0012a28:	e3a03001 	mov	r3, #1
f0012a2c:	ebfffe21 	bl	f00122b8 <fault_ipc_to_pager>
f0012a30:	e51b000c 	ldr	r0, [fp, #-12]
f0012a34:	ebfffd91 	bl	f0012080 <is_user_mode>
f0012a38:	e1a03000 	mov	r3, r0
f0012a3c:	e3530000 	cmp	r3, #0
f0012a40:	1a000008 	bne	f0012a68 <undefined_instr_handler+0x68>
f0012a44:	e59f0074 	ldr	r0, [pc, #116]	; f0012ac0 <undefined_instr_handler+0xc0>
f0012a48:	eb002c0d 	bl	f001da84 <print_early>
f0012a4c:	e51b0008 	ldr	r0, [fp, #-8]
f0012a50:	eb002c38 	bl	f001db38 <printhex8>
f0012a54:	e59f0068 	ldr	r0, [pc, #104]	; f0012ac4 <undefined_instr_handler+0xc4>
f0012a58:	eb002c09 	bl	f001da84 <print_early>
f0012a5c:	e1a00000 	nop			; (mov r0, r0)
f0012a60:	ebfffda9 	bl	f001210c <abort_die>
f0012a64:	ea000013 	b	f0012ab8 <undefined_instr_handler+0xb8>
f0012a68:	ebfffd6c 	bl	f0012020 <current_task>
f0012a6c:	e1a03000 	mov	r3, r0
f0012a70:	e5933060 	ldr	r3, [r3, #96]	; 0x60
f0012a74:	e2033002 	and	r3, r3, #2
f0012a78:	e3530000 	cmp	r3, #0
f0012a7c:	0a00000c 	beq	f0012ab4 <undefined_instr_handler+0xb4>
f0012a80:	ebfffd66 	bl	f0012020 <current_task>
f0012a84:	e1a03000 	mov	r3, r0
f0012a88:	e59330ac 	ldr	r3, [r3, #172]	; 0xac
f0012a8c:	e3530000 	cmp	r3, #0
f0012a90:	0a000005 	beq	f0012aac <undefined_instr_handler+0xac>
f0012a94:	e59f002c 	ldr	r0, [pc, #44]	; f0012ac8 <undefined_instr_handler+0xc8>
f0012a98:	e59f102c 	ldr	r1, [pc, #44]	; f0012acc <undefined_instr_handler+0xcc>
f0012a9c:	e59f202c 	ldr	r2, [pc, #44]	; f0012ad0 <undefined_instr_handler+0xd0>
f0012aa0:	e3a03f4b 	mov	r3, #300	; 0x12c
f0012aa4:	eb000d10 	bl	f0015eec <printk>
f0012aa8:	eafffffe 	b	f0012aa8 <undefined_instr_handler+0xa8>
f0012aac:	ebffd914 	bl	f0008f04 <sched_suspend_sync>
f0012ab0:	eaffffff 	b	f0012ab4 <undefined_instr_handler+0xb4>
f0012ab4:	e1a00000 	nop			; (mov r0, r0)
f0012ab8:	e24bd004 	sub	sp, fp, #4
f0012abc:	e8bd8800 	pop	{fp, pc}
f0012ac0:	f001ee80 	.word	0xf001ee80
f0012ac4:	f001ee78 	.word	0xf001ee78
f0012ac8:	f001ed30 	.word	0xf001ed30
f0012acc:	f001ed58 	.word	0xf001ed58
f0012ad0:	f001ef5c 	.word	0xf001ef5c

f0012ad4 <irq_overnest_error>:
f0012ad4:	e92d4800 	push	{fp, lr}
f0012ad8:	e28db004 	add	fp, sp, #4
f0012adc:	e59f3018 	ldr	r3, [pc, #24]	; f0012afc <irq_overnest_error+0x28>
f0012ae0:	e5933000 	ldr	r3, [r3]
f0012ae4:	e59f0014 	ldr	r0, [pc, #20]	; f0012b00 <irq_overnest_error+0x2c>
f0012ae8:	e1a01003 	mov	r1, r3
f0012aec:	eb000cfe 	bl	f0015eec <printk>
f0012af0:	e59f000c 	ldr	r0, [pc, #12]	; f0012b04 <irq_overnest_error+0x30>
f0012af4:	eb002be2 	bl	f001da84 <print_early>
f0012af8:	eafffffe 	b	f0012af8 <irq_overnest_error+0x24>
f0012afc:	f002433c 	.word	0xf002433c
f0012b00:	f001eeb8 	.word	0xf001eeb8
f0012b04:	f001eee4 	.word	0xf001eee4

f0012b08 <dmb>:
f0012b08:	e92d4800 	push	{fp, lr}
f0012b0c:	e28db004 	add	fp, sp, #4
f0012b10:	eb0007aa 	bl	f00149c0 <arm_drain_writebuffer>
f0012b14:	e8bd8800 	pop	{fp, pc}

f0012b18 <current_task>:
f0012b18:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f0012b1c:	e28db000 	add	fp, sp, #0
f0012b20:	e1a0300d 	mov	r3, sp
f0012b24:	e3c33eff 	bic	r3, r3, #4080	; 0xff0
f0012b28:	e3c3300f 	bic	r3, r3, #15
f0012b2c:	e1a00003 	mov	r0, r3
f0012b30:	e24bd000 	sub	sp, fp, #0
f0012b34:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0012b38:	e12fff1e 	bx	lr

f0012b3c <pmd_exists>:
f0012b3c:	e92d4800 	push	{fp, lr}
f0012b40:	e28db004 	add	fp, sp, #4
f0012b44:	e24dd010 	sub	sp, sp, #16
f0012b48:	e50b0010 	str	r0, [fp, #-16]
f0012b4c:	e50b1014 	str	r1, [fp, #-20]
f0012b50:	e51b0010 	ldr	r0, [fp, #-16]
f0012b54:	e51b1014 	ldr	r1, [fp, #-20]
f0012b58:	eb0004db 	bl	f0013ecc <arch_pick_pmd>
f0012b5c:	e50b0008 	str	r0, [fp, #-8]
f0012b60:	e51b3008 	ldr	r3, [fp, #-8]
f0012b64:	e5933000 	ldr	r3, [r3]
f0012b68:	e2033003 	and	r3, r3, #3
f0012b6c:	e3530001 	cmp	r3, #1
f0012b70:	1a000005 	bne	f0012b8c <pmd_exists+0x50>
f0012b74:	e51b3008 	ldr	r3, [fp, #-8]
f0012b78:	e5933000 	ldr	r3, [r3]
f0012b7c:	e3c33fff 	bic	r3, r3, #1020	; 0x3fc
f0012b80:	e3c33003 	bic	r3, r3, #3
f0012b84:	e283320f 	add	r3, r3, #-268435456	; 0xf0000000
f0012b88:	ea00000c 	b	f0012bc0 <pmd_exists+0x84>
f0012b8c:	e51b3008 	ldr	r3, [fp, #-8]
f0012b90:	e5933000 	ldr	r3, [r3]
f0012b94:	e2033003 	and	r3, r3, #3
f0012b98:	e3530000 	cmp	r3, #0
f0012b9c:	1a000001 	bne	f0012ba8 <pmd_exists+0x6c>
f0012ba0:	e3a03000 	mov	r3, #0
f0012ba4:	ea000005 	b	f0012bc0 <pmd_exists+0x84>
f0012ba8:	e59f001c 	ldr	r0, [pc, #28]	; f0012bcc <pmd_exists+0x90>
f0012bac:	e59f101c 	ldr	r1, [pc, #28]	; f0012bd0 <pmd_exists+0x94>
f0012bb0:	e59f201c 	ldr	r2, [pc, #28]	; f0012bd4 <pmd_exists+0x98>
f0012bb4:	e3a03025 	mov	r3, #37	; 0x25
f0012bb8:	eb000ccb 	bl	f0015eec <printk>
f0012bbc:	eafffffe 	b	f0012bbc <pmd_exists+0x80>
f0012bc0:	e1a00003 	mov	r0, r3
f0012bc4:	e24bd004 	sub	sp, fp, #4
f0012bc8:	e8bd8800 	pop	{fp, pc}
f0012bcc:	f001ef74 	.word	0xf001ef74
f0012bd0:	f001ef9c 	.word	0xf001ef9c
f0012bd4:	f001f0a0 	.word	0xf001f0a0

f0012bd8 <virt_to_pte_from_pgd>:
f0012bd8:	e92d4800 	push	{fp, lr}
f0012bdc:	e28db004 	add	fp, sp, #4
f0012be0:	e24dd010 	sub	sp, sp, #16
f0012be4:	e50b0010 	str	r0, [fp, #-16]
f0012be8:	e50b1014 	str	r1, [fp, #-20]
f0012bec:	e51b0010 	ldr	r0, [fp, #-16]
f0012bf0:	e51b1014 	ldr	r1, [fp, #-20]
f0012bf4:	ebffffd0 	bl	f0012b3c <pmd_exists>
f0012bf8:	e50b0008 	str	r0, [fp, #-8]
f0012bfc:	e51b3008 	ldr	r3, [fp, #-8]
f0012c00:	e3530000 	cmp	r3, #0
f0012c04:	0a000006 	beq	f0012c24 <virt_to_pte_from_pgd+0x4c>
f0012c08:	e51b3014 	ldr	r3, [fp, #-20]
f0012c0c:	e1a03523 	lsr	r3, r3, #10
f0012c10:	e2033fff 	and	r3, r3, #1020	; 0x3fc
f0012c14:	e1a02123 	lsr	r2, r3, #2
f0012c18:	e51b3008 	ldr	r3, [fp, #-8]
f0012c1c:	e7933102 	ldr	r3, [r3, r2, lsl #2]
f0012c20:	ea000000 	b	f0012c28 <virt_to_pte_from_pgd+0x50>
f0012c24:	e3a03000 	mov	r3, #0
f0012c28:	e1a00003 	mov	r0, r3
f0012c2c:	e24bd004 	sub	sp, fp, #4
f0012c30:	e8bd8800 	pop	{fp, pc}

f0012c34 <virt_to_ptep_from_pgd>:
f0012c34:	e92d4800 	push	{fp, lr}
f0012c38:	e28db004 	add	fp, sp, #4
f0012c3c:	e24dd010 	sub	sp, sp, #16
f0012c40:	e50b0010 	str	r0, [fp, #-16]
f0012c44:	e50b1014 	str	r1, [fp, #-20]
f0012c48:	e51b0010 	ldr	r0, [fp, #-16]
f0012c4c:	e51b1014 	ldr	r1, [fp, #-20]
f0012c50:	ebffffb9 	bl	f0012b3c <pmd_exists>
f0012c54:	e50b0008 	str	r0, [fp, #-8]
f0012c58:	e51b3008 	ldr	r3, [fp, #-8]
f0012c5c:	e3530000 	cmp	r3, #0
f0012c60:	0a000007 	beq	f0012c84 <virt_to_ptep_from_pgd+0x50>
f0012c64:	e51b3014 	ldr	r3, [fp, #-20]
f0012c68:	e1a03523 	lsr	r3, r3, #10
f0012c6c:	e2033fff 	and	r3, r3, #1020	; 0x3fc
f0012c70:	e1a03123 	lsr	r3, r3, #2
f0012c74:	e1a03103 	lsl	r3, r3, #2
f0012c78:	e51b2008 	ldr	r2, [fp, #-8]
f0012c7c:	e0823003 	add	r3, r2, r3
f0012c80:	ea000000 	b	f0012c88 <virt_to_ptep_from_pgd+0x54>
f0012c84:	e3a03000 	mov	r3, #0
f0012c88:	e1a00003 	mov	r0, r3
f0012c8c:	e24bd004 	sub	sp, fp, #4
f0012c90:	e8bd8800 	pop	{fp, pc}

f0012c94 <virt_to_pte>:
f0012c94:	e92d4800 	push	{fp, lr}
f0012c98:	e28db004 	add	fp, sp, #4
f0012c9c:	e24dd008 	sub	sp, sp, #8
f0012ca0:	e50b0008 	str	r0, [fp, #-8]
f0012ca4:	ebffff9b 	bl	f0012b18 <current_task>
f0012ca8:	e1a03000 	mov	r3, r0
f0012cac:	e59330b4 	ldr	r3, [r3, #180]	; 0xb4
f0012cb0:	e5933010 	ldr	r3, [r3, #16]
f0012cb4:	e1a00003 	mov	r0, r3
f0012cb8:	e51b1008 	ldr	r1, [fp, #-8]
f0012cbc:	ebffffc5 	bl	f0012bd8 <virt_to_pte_from_pgd>
f0012cc0:	e1a03000 	mov	r3, r0
f0012cc4:	e1a00003 	mov	r0, r3
f0012cc8:	e24bd004 	sub	sp, fp, #4
f0012ccc:	e8bd8800 	pop	{fp, pc}

f0012cd0 <virt_to_ptep>:
f0012cd0:	e92d4800 	push	{fp, lr}
f0012cd4:	e28db004 	add	fp, sp, #4
f0012cd8:	e24dd008 	sub	sp, sp, #8
f0012cdc:	e50b0008 	str	r0, [fp, #-8]
f0012ce0:	ebffff8c 	bl	f0012b18 <current_task>
f0012ce4:	e1a03000 	mov	r3, r0
f0012ce8:	e59330b4 	ldr	r3, [r3, #180]	; 0xb4
f0012cec:	e5933010 	ldr	r3, [r3, #16]
f0012cf0:	e1a00003 	mov	r0, r3
f0012cf4:	e51b1008 	ldr	r1, [fp, #-8]
f0012cf8:	ebffffcd 	bl	f0012c34 <virt_to_ptep_from_pgd>
f0012cfc:	e1a03000 	mov	r3, r0
f0012d00:	e1a00003 	mov	r0, r3
f0012d04:	e24bd004 	sub	sp, fp, #4
f0012d08:	e8bd8800 	pop	{fp, pc}

f0012d0c <virt_to_phys_by_pgd>:
f0012d0c:	e92d4800 	push	{fp, lr}
f0012d10:	e28db004 	add	fp, sp, #4
f0012d14:	e24dd010 	sub	sp, sp, #16
f0012d18:	e50b0010 	str	r0, [fp, #-16]
f0012d1c:	e50b1014 	str	r1, [fp, #-20]
f0012d20:	e51b0010 	ldr	r0, [fp, #-16]
f0012d24:	e51b1014 	ldr	r1, [fp, #-20]
f0012d28:	ebffffaa 	bl	f0012bd8 <virt_to_pte_from_pgd>
f0012d2c:	e50b0008 	str	r0, [fp, #-8]
f0012d30:	e51b3008 	ldr	r3, [fp, #-8]
f0012d34:	e3c33eff 	bic	r3, r3, #4080	; 0xff0
f0012d38:	e3c3300f 	bic	r3, r3, #15
f0012d3c:	e1a00003 	mov	r0, r3
f0012d40:	e24bd004 	sub	sp, fp, #4
f0012d44:	e8bd8800 	pop	{fp, pc}

f0012d48 <attach_pmd>:
f0012d48:	e92d4800 	push	{fp, lr}
f0012d4c:	e28db004 	add	fp, sp, #4
f0012d50:	e24dd018 	sub	sp, sp, #24
f0012d54:	e50b0010 	str	r0, [fp, #-16]
f0012d58:	e50b1014 	str	r1, [fp, #-20]
f0012d5c:	e50b2018 	str	r2, [fp, #-24]
f0012d60:	e51b3014 	ldr	r3, [fp, #-20]
f0012d64:	e2833201 	add	r3, r3, #268435456	; 0x10000000
f0012d68:	e50b3008 	str	r3, [fp, #-8]
f0012d6c:	e51b3008 	ldr	r3, [fp, #-8]
f0012d70:	e1a03b03 	lsl	r3, r3, #22
f0012d74:	e1a03b23 	lsr	r3, r3, #22
f0012d78:	e3530000 	cmp	r3, #0
f0012d7c:	0a000005 	beq	f0012d98 <attach_pmd+0x50>
f0012d80:	e59f0048 	ldr	r0, [pc, #72]	; f0012dd0 <attach_pmd+0x88>
f0012d84:	e59f1048 	ldr	r1, [pc, #72]	; f0012dd4 <attach_pmd+0x8c>
f0012d88:	e59f2048 	ldr	r2, [pc, #72]	; f0012dd8 <attach_pmd+0x90>
f0012d8c:	e3a0306a 	mov	r3, #106	; 0x6a
f0012d90:	eb000c55 	bl	f0015eec <printk>
f0012d94:	eafffffe 	b	f0012d94 <attach_pmd+0x4c>
f0012d98:	e51b3010 	ldr	r3, [fp, #-16]
f0012d9c:	e5933010 	ldr	r3, [r3, #16]
f0012da0:	e1a00003 	mov	r0, r3
f0012da4:	e51b1018 	ldr	r1, [fp, #-24]
f0012da8:	eb000447 	bl	f0013ecc <arch_pick_pmd>
f0012dac:	e50b000c 	str	r0, [fp, #-12]
f0012db0:	e51b3010 	ldr	r3, [fp, #-16]
f0012db4:	e5933000 	ldr	r3, [r3]
f0012db8:	e51b000c 	ldr	r0, [fp, #-12]
f0012dbc:	e51b1008 	ldr	r1, [fp, #-8]
f0012dc0:	e51b2018 	ldr	r2, [fp, #-24]
f0012dc4:	eb000452 	bl	f0013f14 <arch_write_pmd>
f0012dc8:	e24bd004 	sub	sp, fp, #4
f0012dcc:	e8bd8800 	pop	{fp, pc}
f0012dd0:	f001ef74 	.word	0xf001ef74
f0012dd4:	f001ef9c 	.word	0xf001ef9c
f0012dd8:	f001f0ac 	.word	0xf001f0ac

f0012ddc <add_mapping_use_cap>:
f0012ddc:	e92d4800 	push	{fp, lr}
f0012de0:	e28db004 	add	fp, sp, #4
f0012de4:	e24dd028 	sub	sp, sp, #40	; 0x28
f0012de8:	e50b0018 	str	r0, [fp, #-24]
f0012dec:	e50b101c 	str	r1, [fp, #-28]
f0012df0:	e50b2020 	str	r2, [fp, #-32]
f0012df4:	e50b3024 	str	r3, [fp, #-36]	; 0x24
f0012df8:	e51b3020 	ldr	r3, [fp, #-32]
f0012dfc:	e1a03623 	lsr	r3, r3, #12
f0012e00:	e50b3008 	str	r3, [fp, #-8]
f0012e04:	e51b3020 	ldr	r3, [fp, #-32]
f0012e08:	e3530a01 	cmp	r3, #4096	; 0x1000
f0012e0c:	2a000007 	bcs	f0012e30 <add_mapping_use_cap+0x54>
f0012e10:	e59f0170 	ldr	r0, [pc, #368]	; f0012f88 <add_mapping_use_cap+0x1ac>
f0012e14:	eb002b1a 	bl	f001da84 <print_early>
f0012e18:	e59f016c 	ldr	r0, [pc, #364]	; f0012f8c <add_mapping_use_cap+0x1b0>
f0012e1c:	e59f116c 	ldr	r1, [pc, #364]	; f0012f90 <add_mapping_use_cap+0x1b4>
f0012e20:	e59f216c 	ldr	r2, [pc, #364]	; f0012f94 <add_mapping_use_cap+0x1b8>
f0012e24:	e3a03088 	mov	r3, #136	; 0x88
f0012e28:	eb000c2f 	bl	f0015eec <printk>
f0012e2c:	eafffffe 	b	f0012e2c <add_mapping_use_cap+0x50>
f0012e30:	e51b3020 	ldr	r3, [fp, #-32]
f0012e34:	e1a03a03 	lsl	r3, r3, #20
f0012e38:	e1a03a23 	lsr	r3, r3, #20
f0012e3c:	e3530000 	cmp	r3, #0
f0012e40:	0a000002 	beq	f0012e50 <add_mapping_use_cap+0x74>
f0012e44:	e51b3008 	ldr	r3, [fp, #-8]
f0012e48:	e2833001 	add	r3, r3, #1
f0012e4c:	e50b3008 	str	r3, [fp, #-8]
f0012e50:	e51b0024 	ldr	r0, [fp, #-36]	; 0x24
f0012e54:	ebfff49d 	bl	f00100d0 <space_flags_to_ptflags>
f0012e58:	e50b0024 	str	r0, [fp, #-36]	; 0x24
f0012e5c:	e51b3024 	ldr	r3, [fp, #-36]	; 0x24
f0012e60:	e3530000 	cmp	r3, #0
f0012e64:	1a000005 	bne	f0012e80 <add_mapping_use_cap+0xa4>
f0012e68:	e59f011c 	ldr	r0, [pc, #284]	; f0012f8c <add_mapping_use_cap+0x1b0>
f0012e6c:	e59f111c 	ldr	r1, [pc, #284]	; f0012f90 <add_mapping_use_cap+0x1b4>
f0012e70:	e59f211c 	ldr	r2, [pc, #284]	; f0012f94 <add_mapping_use_cap+0x1b8>
f0012e74:	e3a0308f 	mov	r3, #143	; 0x8f
f0012e78:	eb000c1b 	bl	f0015eec <printk>
f0012e7c:	eafffffe 	b	f0012e7c <add_mapping_use_cap+0xa0>
f0012e80:	e3a03000 	mov	r3, #0
f0012e84:	e50b300c 	str	r3, [fp, #-12]
f0012e88:	ea000036 	b	f0012f68 <add_mapping_use_cap+0x18c>
f0012e8c:	e59b3004 	ldr	r3, [fp, #4]
f0012e90:	e5933010 	ldr	r3, [r3, #16]
f0012e94:	e1a00003 	mov	r0, r3
f0012e98:	e51b101c 	ldr	r1, [fp, #-28]
f0012e9c:	ebffff26 	bl	f0012b3c <pmd_exists>
f0012ea0:	e50b0010 	str	r0, [fp, #-16]
f0012ea4:	e51b3010 	ldr	r3, [fp, #-16]
f0012ea8:	e3530000 	cmp	r3, #0
f0012eac:	1a000017 	bne	f0012f10 <add_mapping_use_cap+0x134>
f0012eb0:	e59b0008 	ldr	r0, [fp, #8]
f0012eb4:	ebffe397 	bl	f000bd18 <pmd_cap_alloc>
f0012eb8:	e50b0010 	str	r0, [fp, #-16]
f0012ebc:	e51b3010 	ldr	r3, [fp, #-16]
f0012ec0:	e3530000 	cmp	r3, #0
f0012ec4:	1a000001 	bne	f0012ed0 <add_mapping_use_cap+0xf4>
f0012ec8:	e3e0300b 	mvn	r3, #11
f0012ecc:	ea00002a 	b	f0012f7c <add_mapping_use_cap+0x1a0>
f0012ed0:	e51b301c 	ldr	r3, [fp, #-28]
f0012ed4:	e1a03523 	lsr	r3, r3, #10
f0012ed8:	e2033fff 	and	r3, r3, #1020	; 0x3fc
f0012edc:	e1a03123 	lsr	r3, r3, #2
f0012ee0:	e1a03103 	lsl	r3, r3, #2
f0012ee4:	e51b2010 	ldr	r2, [fp, #-16]
f0012ee8:	e0823003 	add	r3, r2, r3
f0012eec:	e51b0018 	ldr	r0, [fp, #-24]
f0012ef0:	e51b101c 	ldr	r1, [fp, #-28]
f0012ef4:	e51b2024 	ldr	r2, [fp, #-36]	; 0x24
f0012ef8:	eb000384 	bl	f0013d10 <arch_prepare_pte>
f0012efc:	e59b0004 	ldr	r0, [fp, #4]
f0012f00:	e51b1010 	ldr	r1, [fp, #-16]
f0012f04:	e51b201c 	ldr	r2, [fp, #-28]
f0012f08:	ebffff8e 	bl	f0012d48 <attach_pmd>
f0012f0c:	ea00000c 	b	f0012f44 <add_mapping_use_cap+0x168>
f0012f10:	e51b301c 	ldr	r3, [fp, #-28]
f0012f14:	e1a03523 	lsr	r3, r3, #10
f0012f18:	e2033fff 	and	r3, r3, #1020	; 0x3fc
f0012f1c:	e1a03123 	lsr	r3, r3, #2
f0012f20:	e1a03103 	lsl	r3, r3, #2
f0012f24:	e51b2010 	ldr	r2, [fp, #-16]
f0012f28:	e0823003 	add	r3, r2, r3
f0012f2c:	e58d3000 	str	r3, [sp]
f0012f30:	e59b0004 	ldr	r0, [fp, #4]
f0012f34:	e51b1018 	ldr	r1, [fp, #-24]
f0012f38:	e51b201c 	ldr	r2, [fp, #-28]
f0012f3c:	e51b3024 	ldr	r3, [fp, #-36]	; 0x24
f0012f40:	eb0003b1 	bl	f0013e0c <arch_prepare_write_pte>
f0012f44:	e51b3018 	ldr	r3, [fp, #-24]
f0012f48:	e2833a01 	add	r3, r3, #4096	; 0x1000
f0012f4c:	e50b3018 	str	r3, [fp, #-24]
f0012f50:	e51b301c 	ldr	r3, [fp, #-28]
f0012f54:	e2833a01 	add	r3, r3, #4096	; 0x1000
f0012f58:	e50b301c 	str	r3, [fp, #-28]
f0012f5c:	e51b300c 	ldr	r3, [fp, #-12]
f0012f60:	e2833001 	add	r3, r3, #1
f0012f64:	e50b300c 	str	r3, [fp, #-12]
f0012f68:	e51b200c 	ldr	r2, [fp, #-12]
f0012f6c:	e51b3008 	ldr	r3, [fp, #-8]
f0012f70:	e1520003 	cmp	r2, r3
f0012f74:	3affffc4 	bcc	f0012e8c <add_mapping_use_cap+0xb0>
f0012f78:	e3a03000 	mov	r3, #0
f0012f7c:	e1a00003 	mov	r0, r3
f0012f80:	e24bd004 	sub	sp, fp, #4
f0012f84:	e8bd8800 	pop	{fp, pc}
f0012f88:	f001efbc 	.word	0xf001efbc
f0012f8c:	f001ef74 	.word	0xf001ef74
f0012f90:	f001ef9c 	.word	0xf001ef9c
f0012f94:	f001f0b8 	.word	0xf001f0b8

f0012f98 <add_mapping_space>:
f0012f98:	e92d4800 	push	{fp, lr}
f0012f9c:	e28db004 	add	fp, sp, #4
f0012fa0:	e24dd028 	sub	sp, sp, #40	; 0x28
f0012fa4:	e50b0018 	str	r0, [fp, #-24]
f0012fa8:	e50b101c 	str	r1, [fp, #-28]
f0012fac:	e50b2020 	str	r2, [fp, #-32]
f0012fb0:	e50b3024 	str	r3, [fp, #-36]	; 0x24
f0012fb4:	e51b3020 	ldr	r3, [fp, #-32]
f0012fb8:	e1a03623 	lsr	r3, r3, #12
f0012fbc:	e50b3008 	str	r3, [fp, #-8]
f0012fc0:	e51b3020 	ldr	r3, [fp, #-32]
f0012fc4:	e3530a01 	cmp	r3, #4096	; 0x1000
f0012fc8:	2a000007 	bcs	f0012fec <add_mapping_space+0x54>
f0012fcc:	e59f0180 	ldr	r0, [pc, #384]	; f0013154 <add_mapping_space+0x1bc>
f0012fd0:	eb002aab 	bl	f001da84 <print_early>
f0012fd4:	e59f017c 	ldr	r0, [pc, #380]	; f0013158 <add_mapping_space+0x1c0>
f0012fd8:	e59f117c 	ldr	r1, [pc, #380]	; f001315c <add_mapping_space+0x1c4>
f0012fdc:	e59f217c 	ldr	r2, [pc, #380]	; f0013160 <add_mapping_space+0x1c8>
f0012fe0:	e3a030b9 	mov	r3, #185	; 0xb9
f0012fe4:	eb000bc0 	bl	f0015eec <printk>
f0012fe8:	eafffffe 	b	f0012fe8 <add_mapping_space+0x50>
f0012fec:	e51b3020 	ldr	r3, [fp, #-32]
f0012ff0:	e1a03a03 	lsl	r3, r3, #20
f0012ff4:	e1a03a23 	lsr	r3, r3, #20
f0012ff8:	e3530000 	cmp	r3, #0
f0012ffc:	0a000002 	beq	f001300c <add_mapping_space+0x74>
f0013000:	e51b3008 	ldr	r3, [fp, #-8]
f0013004:	e2833001 	add	r3, r3, #1
f0013008:	e50b3008 	str	r3, [fp, #-8]
f001300c:	e51b0024 	ldr	r0, [fp, #-36]	; 0x24
f0013010:	ebfff42e 	bl	f00100d0 <space_flags_to_ptflags>
f0013014:	e50b0024 	str	r0, [fp, #-36]	; 0x24
f0013018:	e51b3024 	ldr	r3, [fp, #-36]	; 0x24
f001301c:	e3530000 	cmp	r3, #0
f0013020:	1a000005 	bne	f001303c <add_mapping_space+0xa4>
f0013024:	e59f012c 	ldr	r0, [pc, #300]	; f0013158 <add_mapping_space+0x1c0>
f0013028:	e59f112c 	ldr	r1, [pc, #300]	; f001315c <add_mapping_space+0x1c4>
f001302c:	e59f212c 	ldr	r2, [pc, #300]	; f0013160 <add_mapping_space+0x1c8>
f0013030:	e3a030c0 	mov	r3, #192	; 0xc0
f0013034:	eb000bac 	bl	f0015eec <printk>
f0013038:	eafffffe 	b	f0013038 <add_mapping_space+0xa0>
f001303c:	e3a03000 	mov	r3, #0
f0013040:	e50b300c 	str	r3, [fp, #-12]
f0013044:	ea00003a 	b	f0013134 <add_mapping_space+0x19c>
f0013048:	e59b3004 	ldr	r3, [fp, #4]
f001304c:	e5933010 	ldr	r3, [r3, #16]
f0013050:	e1a00003 	mov	r0, r3
f0013054:	e51b101c 	ldr	r1, [fp, #-28]
f0013058:	ebfffeb7 	bl	f0012b3c <pmd_exists>
f001305c:	e50b0010 	str	r0, [fp, #-16]
f0013060:	e51b3010 	ldr	r3, [fp, #-16]
f0013064:	e3530000 	cmp	r3, #0
f0013068:	1a00001b 	bne	f00130dc <add_mapping_space+0x144>
f001306c:	ebfffea9 	bl	f0012b18 <current_task>
f0013070:	e1a03000 	mov	r3, r0
f0013074:	e59330b4 	ldr	r3, [r3, #180]	; 0xb4
f0013078:	e2833014 	add	r3, r3, #20
f001307c:	e1a00003 	mov	r0, r3
f0013080:	ebffe324 	bl	f000bd18 <pmd_cap_alloc>
f0013084:	e50b0010 	str	r0, [fp, #-16]
f0013088:	e51b3010 	ldr	r3, [fp, #-16]
f001308c:	e3530000 	cmp	r3, #0
f0013090:	1a000001 	bne	f001309c <add_mapping_space+0x104>
f0013094:	e3e0300b 	mvn	r3, #11
f0013098:	ea00002a 	b	f0013148 <add_mapping_space+0x1b0>
f001309c:	e51b301c 	ldr	r3, [fp, #-28]
f00130a0:	e1a03523 	lsr	r3, r3, #10
f00130a4:	e2033fff 	and	r3, r3, #1020	; 0x3fc
f00130a8:	e1a03123 	lsr	r3, r3, #2
f00130ac:	e1a03103 	lsl	r3, r3, #2
f00130b0:	e51b2010 	ldr	r2, [fp, #-16]
f00130b4:	e0823003 	add	r3, r2, r3
f00130b8:	e51b0018 	ldr	r0, [fp, #-24]
f00130bc:	e51b101c 	ldr	r1, [fp, #-28]
f00130c0:	e51b2024 	ldr	r2, [fp, #-36]	; 0x24
f00130c4:	eb000311 	bl	f0013d10 <arch_prepare_pte>
f00130c8:	e59b0004 	ldr	r0, [fp, #4]
f00130cc:	e51b1010 	ldr	r1, [fp, #-16]
f00130d0:	e51b201c 	ldr	r2, [fp, #-28]
f00130d4:	ebffff1b 	bl	f0012d48 <attach_pmd>
f00130d8:	ea00000c 	b	f0013110 <add_mapping_space+0x178>
f00130dc:	e51b301c 	ldr	r3, [fp, #-28]
f00130e0:	e1a03523 	lsr	r3, r3, #10
f00130e4:	e2033fff 	and	r3, r3, #1020	; 0x3fc
f00130e8:	e1a03123 	lsr	r3, r3, #2
f00130ec:	e1a03103 	lsl	r3, r3, #2
f00130f0:	e51b2010 	ldr	r2, [fp, #-16]
f00130f4:	e0823003 	add	r3, r2, r3
f00130f8:	e58d3000 	str	r3, [sp]
f00130fc:	e59b0004 	ldr	r0, [fp, #4]
f0013100:	e51b1018 	ldr	r1, [fp, #-24]
f0013104:	e51b201c 	ldr	r2, [fp, #-28]
f0013108:	e51b3024 	ldr	r3, [fp, #-36]	; 0x24
f001310c:	eb00033e 	bl	f0013e0c <arch_prepare_write_pte>
f0013110:	e51b3018 	ldr	r3, [fp, #-24]
f0013114:	e2833a01 	add	r3, r3, #4096	; 0x1000
f0013118:	e50b3018 	str	r3, [fp, #-24]
f001311c:	e51b301c 	ldr	r3, [fp, #-28]
f0013120:	e2833a01 	add	r3, r3, #4096	; 0x1000
f0013124:	e50b301c 	str	r3, [fp, #-28]
f0013128:	e51b300c 	ldr	r3, [fp, #-12]
f001312c:	e2833001 	add	r3, r3, #1
f0013130:	e50b300c 	str	r3, [fp, #-12]
f0013134:	e51b200c 	ldr	r2, [fp, #-12]
f0013138:	e51b3008 	ldr	r3, [fp, #-8]
f001313c:	e1520003 	cmp	r2, r3
f0013140:	3affffc0 	bcc	f0013048 <add_mapping_space+0xb0>
f0013144:	e3a03000 	mov	r3, #0
f0013148:	e1a00003 	mov	r0, r3
f001314c:	e24bd004 	sub	sp, fp, #4
f0013150:	e8bd8800 	pop	{fp, pc}
f0013154:	f001efbc 	.word	0xf001efbc
f0013158:	f001ef74 	.word	0xf001ef74
f001315c:	f001ef9c 	.word	0xf001ef9c
f0013160:	f001f0cc 	.word	0xf001f0cc

f0013164 <add_boot_mapping>:
f0013164:	e92d4800 	push	{fp, lr}
f0013168:	e28db004 	add	fp, sp, #4
f001316c:	e24dd028 	sub	sp, sp, #40	; 0x28
f0013170:	e50b0018 	str	r0, [fp, #-24]
f0013174:	e50b101c 	str	r1, [fp, #-28]
f0013178:	e50b2020 	str	r2, [fp, #-32]
f001317c:	e50b3024 	str	r3, [fp, #-36]	; 0x24
f0013180:	e51b3020 	ldr	r3, [fp, #-32]
f0013184:	e1a03623 	lsr	r3, r3, #12
f0013188:	e50b3008 	str	r3, [fp, #-8]
f001318c:	e51b3020 	ldr	r3, [fp, #-32]
f0013190:	e3530a01 	cmp	r3, #4096	; 0x1000
f0013194:	2a000007 	bcs	f00131b8 <add_boot_mapping+0x54>
f0013198:	e59f0160 	ldr	r0, [pc, #352]	; f0013300 <add_boot_mapping+0x19c>
f001319c:	eb002a38 	bl	f001da84 <print_early>
f00131a0:	e59f015c 	ldr	r0, [pc, #348]	; f0013304 <add_boot_mapping+0x1a0>
f00131a4:	e59f115c 	ldr	r1, [pc, #348]	; f0013308 <add_boot_mapping+0x1a4>
f00131a8:	e59f215c 	ldr	r2, [pc, #348]	; f001330c <add_boot_mapping+0x1a8>
f00131ac:	e3a030ea 	mov	r3, #234	; 0xea
f00131b0:	eb000b4d 	bl	f0015eec <printk>
f00131b4:	eafffffe 	b	f00131b4 <add_boot_mapping+0x50>
f00131b8:	e51b3020 	ldr	r3, [fp, #-32]
f00131bc:	e1a03a03 	lsl	r3, r3, #20
f00131c0:	e1a03a23 	lsr	r3, r3, #20
f00131c4:	e3530000 	cmp	r3, #0
f00131c8:	0a000002 	beq	f00131d8 <add_boot_mapping+0x74>
f00131cc:	e51b3008 	ldr	r3, [fp, #-8]
f00131d0:	e2833001 	add	r3, r3, #1
f00131d4:	e50b3008 	str	r3, [fp, #-8]
f00131d8:	e51b0024 	ldr	r0, [fp, #-36]	; 0x24
f00131dc:	ebfff3bb 	bl	f00100d0 <space_flags_to_ptflags>
f00131e0:	e50b0024 	str	r0, [fp, #-36]	; 0x24
f00131e4:	e51b3024 	ldr	r3, [fp, #-36]	; 0x24
f00131e8:	e3530000 	cmp	r3, #0
f00131ec:	1a000005 	bne	f0013208 <add_boot_mapping+0xa4>
f00131f0:	e59f010c 	ldr	r0, [pc, #268]	; f0013304 <add_boot_mapping+0x1a0>
f00131f4:	e59f110c 	ldr	r1, [pc, #268]	; f0013308 <add_boot_mapping+0x1a4>
f00131f8:	e59f210c 	ldr	r2, [pc, #268]	; f001330c <add_boot_mapping+0x1a8>
f00131fc:	e3a030f1 	mov	r3, #241	; 0xf1
f0013200:	eb000b39 	bl	f0015eec <printk>
f0013204:	eafffffe 	b	f0013204 <add_boot_mapping+0xa0>
f0013208:	e3a03000 	mov	r3, #0
f001320c:	e50b300c 	str	r3, [fp, #-12]
f0013210:	ea000034 	b	f00132e8 <add_boot_mapping+0x184>
f0013214:	e59f00f4 	ldr	r0, [pc, #244]	; f0013310 <add_boot_mapping+0x1ac>
f0013218:	e51b101c 	ldr	r1, [fp, #-28]
f001321c:	ebfffe46 	bl	f0012b3c <pmd_exists>
f0013220:	e50b0010 	str	r0, [fp, #-16]
f0013224:	e51b3010 	ldr	r3, [fp, #-16]
f0013228:	e3530000 	cmp	r3, #0
f001322c:	1a000014 	bne	f0013284 <add_boot_mapping+0x120>
f0013230:	ebffe20d 	bl	f000ba6c <alloc_boot_pmd>
f0013234:	e50b0010 	str	r0, [fp, #-16]
f0013238:	e51b301c 	ldr	r3, [fp, #-28]
f001323c:	e1a03523 	lsr	r3, r3, #10
f0013240:	e2033fff 	and	r3, r3, #1020	; 0x3fc
f0013244:	e1a03123 	lsr	r3, r3, #2
f0013248:	e1a03103 	lsl	r3, r3, #2
f001324c:	e51b2010 	ldr	r2, [fp, #-16]
f0013250:	e0823003 	add	r3, r2, r3
f0013254:	e51b0018 	ldr	r0, [fp, #-24]
f0013258:	e51b101c 	ldr	r1, [fp, #-28]
f001325c:	e51b2024 	ldr	r2, [fp, #-36]	; 0x24
f0013260:	eb0002aa 	bl	f0013d10 <arch_prepare_pte>
f0013264:	ebfffe2b 	bl	f0012b18 <current_task>
f0013268:	e1a03000 	mov	r3, r0
f001326c:	e59330b4 	ldr	r3, [r3, #180]	; 0xb4
f0013270:	e1a00003 	mov	r0, r3
f0013274:	e51b1010 	ldr	r1, [fp, #-16]
f0013278:	e51b201c 	ldr	r2, [fp, #-28]
f001327c:	ebfffeb1 	bl	f0012d48 <attach_pmd>
f0013280:	ea00000f 	b	f00132c4 <add_boot_mapping+0x160>
f0013284:	ebfffe23 	bl	f0012b18 <current_task>
f0013288:	e1a03000 	mov	r3, r0
f001328c:	e59330b4 	ldr	r3, [r3, #180]	; 0xb4
f0013290:	e51b201c 	ldr	r2, [fp, #-28]
f0013294:	e1a02522 	lsr	r2, r2, #10
f0013298:	e2022fff 	and	r2, r2, #1020	; 0x3fc
f001329c:	e1a02122 	lsr	r2, r2, #2
f00132a0:	e1a02102 	lsl	r2, r2, #2
f00132a4:	e51b1010 	ldr	r1, [fp, #-16]
f00132a8:	e0812002 	add	r2, r1, r2
f00132ac:	e58d2000 	str	r2, [sp]
f00132b0:	e1a00003 	mov	r0, r3
f00132b4:	e51b1018 	ldr	r1, [fp, #-24]
f00132b8:	e51b201c 	ldr	r2, [fp, #-28]
f00132bc:	e51b3024 	ldr	r3, [fp, #-36]	; 0x24
f00132c0:	eb0002d1 	bl	f0013e0c <arch_prepare_write_pte>
f00132c4:	e51b3018 	ldr	r3, [fp, #-24]
f00132c8:	e2833a01 	add	r3, r3, #4096	; 0x1000
f00132cc:	e50b3018 	str	r3, [fp, #-24]
f00132d0:	e51b301c 	ldr	r3, [fp, #-28]
f00132d4:	e2833a01 	add	r3, r3, #4096	; 0x1000
f00132d8:	e50b301c 	str	r3, [fp, #-28]
f00132dc:	e51b300c 	ldr	r3, [fp, #-12]
f00132e0:	e2833001 	add	r3, r3, #1
f00132e4:	e50b300c 	str	r3, [fp, #-12]
f00132e8:	e51b200c 	ldr	r2, [fp, #-12]
f00132ec:	e51b3008 	ldr	r3, [fp, #-8]
f00132f0:	e1520003 	cmp	r2, r3
f00132f4:	3affffc6 	bcc	f0013214 <add_boot_mapping+0xb0>
f00132f8:	e24bd004 	sub	sp, fp, #4
f00132fc:	e8bd8800 	pop	{fp, pc}
f0013300:	f001f00c 	.word	0xf001f00c
f0013304:	f001ef74 	.word	0xf001ef74
f0013308:	f001ef9c 	.word	0xf001ef9c
f001330c:	f001f0e0 	.word	0xf001f0e0
f0013310:	f0028000 	.word	0xf0028000

f0013314 <add_mapping>:
f0013314:	e92d4800 	push	{fp, lr}
f0013318:	e28db004 	add	fp, sp, #4
f001331c:	e24dd018 	sub	sp, sp, #24
f0013320:	e50b0008 	str	r0, [fp, #-8]
f0013324:	e50b100c 	str	r1, [fp, #-12]
f0013328:	e50b2010 	str	r2, [fp, #-16]
f001332c:	e50b3014 	str	r3, [fp, #-20]
f0013330:	ebfffdf8 	bl	f0012b18 <current_task>
f0013334:	e1a03000 	mov	r3, r0
f0013338:	e59330b4 	ldr	r3, [r3, #180]	; 0xb4
f001333c:	e58d3000 	str	r3, [sp]
f0013340:	e51b0008 	ldr	r0, [fp, #-8]
f0013344:	e51b100c 	ldr	r1, [fp, #-12]
f0013348:	e51b2010 	ldr	r2, [fp, #-16]
f001334c:	e51b3014 	ldr	r3, [fp, #-20]
f0013350:	ebffff10 	bl	f0012f98 <add_mapping_space>
f0013354:	e1a03000 	mov	r3, r0
f0013358:	e1a00003 	mov	r0, r3
f001335c:	e24bd004 	sub	sp, fp, #4
f0013360:	e8bd8800 	pop	{fp, pc}

f0013364 <check_mapping_pgd>:
f0013364:	e92d4800 	push	{fp, lr}
f0013368:	e28db004 	add	fp, sp, #4
f001336c:	e24dd020 	sub	sp, sp, #32
f0013370:	e50b0018 	str	r0, [fp, #-24]
f0013374:	e50b101c 	str	r1, [fp, #-28]
f0013378:	e50b2020 	str	r2, [fp, #-32]
f001337c:	e50b3024 	str	r3, [fp, #-36]	; 0x24
f0013380:	e51b301c 	ldr	r3, [fp, #-28]
f0013384:	e2833eff 	add	r3, r3, #4080	; 0xff0
f0013388:	e283300f 	add	r3, r3, #15
f001338c:	e1a03623 	lsr	r3, r3, #12
f0013390:	e50b300c 	str	r3, [fp, #-12]
f0013394:	e51b0020 	ldr	r0, [fp, #-32]
f0013398:	ebfff34c 	bl	f00100d0 <space_flags_to_ptflags>
f001339c:	e50b0020 	str	r0, [fp, #-32]
f00133a0:	e51b3020 	ldr	r3, [fp, #-32]
f00133a4:	e3530000 	cmp	r3, #0
f00133a8:	1a000005 	bne	f00133c4 <check_mapping_pgd+0x60>
f00133ac:	e59f0090 	ldr	r0, [pc, #144]	; f0013444 <check_mapping_pgd+0xe0>
f00133b0:	e59f1090 	ldr	r1, [pc, #144]	; f0013448 <check_mapping_pgd+0xe4>
f00133b4:	e59f2090 	ldr	r2, [pc, #144]	; f001344c <check_mapping_pgd+0xe8>
f00133b8:	e59f3090 	ldr	r3, [pc, #144]	; f0013450 <check_mapping_pgd+0xec>
f00133bc:	eb000aca 	bl	f0015eec <printk>
f00133c0:	eafffffe 	b	f00133c0 <check_mapping_pgd+0x5c>
f00133c4:	e3a03000 	mov	r3, #0
f00133c8:	e50b3008 	str	r3, [fp, #-8]
f00133cc:	ea000014 	b	f0013424 <check_mapping_pgd+0xc0>
f00133d0:	e51b3008 	ldr	r3, [fp, #-8]
f00133d4:	e1a03603 	lsl	r3, r3, #12
f00133d8:	e1a02003 	mov	r2, r3
f00133dc:	e51b3018 	ldr	r3, [fp, #-24]
f00133e0:	e0823003 	add	r3, r2, r3
f00133e4:	e51b0024 	ldr	r0, [fp, #-36]	; 0x24
f00133e8:	e1a01003 	mov	r1, r3
f00133ec:	ebfffdf9 	bl	f0012bd8 <virt_to_pte_from_pgd>
f00133f0:	e50b0010 	str	r0, [fp, #-16]
f00133f4:	e51b0010 	ldr	r0, [fp, #-16]
f00133f8:	e51b1020 	ldr	r1, [fp, #-32]
f00133fc:	eb0002d3 	bl	f0013f50 <arch_check_pte_access_perms>
f0013400:	e1a03000 	mov	r3, r0
f0013404:	e3530000 	cmp	r3, #0
f0013408:	0a000003 	beq	f001341c <check_mapping_pgd+0xb8>
f001340c:	e51b3008 	ldr	r3, [fp, #-8]
f0013410:	e2833001 	add	r3, r3, #1
f0013414:	e50b3008 	str	r3, [fp, #-8]
f0013418:	ea000001 	b	f0013424 <check_mapping_pgd+0xc0>
f001341c:	e3a03000 	mov	r3, #0
f0013420:	ea000004 	b	f0013438 <check_mapping_pgd+0xd4>
f0013424:	e51b2008 	ldr	r2, [fp, #-8]
f0013428:	e51b300c 	ldr	r3, [fp, #-12]
f001342c:	e1520003 	cmp	r2, r3
f0013430:	3affffe6 	bcc	f00133d0 <check_mapping_pgd+0x6c>
f0013434:	e3a03001 	mov	r3, #1
f0013438:	e1a00003 	mov	r0, r3
f001343c:	e24bd004 	sub	sp, fp, #4
f0013440:	e8bd8800 	pop	{fp, pc}
f0013444:	f001ef74 	.word	0xf001ef74
f0013448:	f001ef9c 	.word	0xf001ef9c
f001344c:	f001f0f4 	.word	0xf001f0f4
f0013450:	0000011f 	.word	0x0000011f

f0013454 <check_mapping>:
f0013454:	e92d4800 	push	{fp, lr}
f0013458:	e28db004 	add	fp, sp, #4
f001345c:	e24dd010 	sub	sp, sp, #16
f0013460:	e50b0008 	str	r0, [fp, #-8]
f0013464:	e50b100c 	str	r1, [fp, #-12]
f0013468:	e50b2010 	str	r2, [fp, #-16]
f001346c:	ebfffda9 	bl	f0012b18 <current_task>
f0013470:	e1a03000 	mov	r3, r0
f0013474:	e59330b4 	ldr	r3, [r3, #180]	; 0xb4
f0013478:	e5933010 	ldr	r3, [r3, #16]
f001347c:	e51b0008 	ldr	r0, [fp, #-8]
f0013480:	e51b100c 	ldr	r1, [fp, #-12]
f0013484:	e51b2010 	ldr	r2, [fp, #-16]
f0013488:	ebffffb5 	bl	f0013364 <check_mapping_pgd>
f001348c:	e1a03000 	mov	r3, r0
f0013490:	e1a00003 	mov	r0, r3
f0013494:	e24bd004 	sub	sp, fp, #4
f0013498:	e8bd8800 	pop	{fp, pc}

f001349c <remove_mapping_space>:
f001349c:	e92d4800 	push	{fp, lr}
f00134a0:	e28db004 	add	fp, sp, #4
f00134a4:	e24dd028 	sub	sp, sp, #40	; 0x28
f00134a8:	e50b0020 	str	r0, [fp, #-32]
f00134ac:	e50b1024 	str	r1, [fp, #-36]	; 0x24
f00134b0:	e51b3024 	ldr	r3, [fp, #-36]	; 0x24
f00134b4:	e3c33eff 	bic	r3, r3, #4080	; 0xff0
f00134b8:	e3c3300f 	bic	r3, r3, #15
f00134bc:	e50b3024 	str	r3, [fp, #-36]	; 0x24
f00134c0:	e51b3024 	ldr	r3, [fp, #-36]	; 0x24
f00134c4:	e1a03523 	lsr	r3, r3, #10
f00134c8:	e2033fff 	and	r3, r3, #1020	; 0x3fc
f00134cc:	e1a03123 	lsr	r3, r3, #2
f00134d0:	e50b3008 	str	r3, [fp, #-8]
f00134d4:	e51b3020 	ldr	r3, [fp, #-32]
f00134d8:	e5933010 	ldr	r3, [r3, #16]
f00134dc:	e1a00003 	mov	r0, r3
f00134e0:	e51b1024 	ldr	r1, [fp, #-36]	; 0x24
f00134e4:	eb000278 	bl	f0013ecc <arch_pick_pmd>
f00134e8:	e50b000c 	str	r0, [fp, #-12]
f00134ec:	e51b300c 	ldr	r3, [fp, #-12]
f00134f0:	e5933000 	ldr	r3, [r3]
f00134f4:	e2033003 	and	r3, r3, #3
f00134f8:	e50b3010 	str	r3, [fp, #-16]
f00134fc:	e51b3010 	ldr	r3, [fp, #-16]
f0013500:	e3530000 	cmp	r3, #0
f0013504:	1a000001 	bne	f0013510 <remove_mapping_space+0x74>
f0013508:	e3e03087 	mvn	r3, #135	; 0x87
f001350c:	ea00002e 	b	f00135cc <remove_mapping_space+0x130>
f0013510:	e51b3010 	ldr	r3, [fp, #-16]
f0013514:	e3530001 	cmp	r3, #1
f0013518:	0a000005 	beq	f0013534 <remove_mapping_space+0x98>
f001351c:	e59f00b4 	ldr	r0, [pc, #180]	; f00135d8 <remove_mapping_space+0x13c>
f0013520:	e59f10b4 	ldr	r1, [pc, #180]	; f00135dc <remove_mapping_space+0x140>
f0013524:	e59f20b4 	ldr	r2, [pc, #180]	; f00135e0 <remove_mapping_space+0x144>
f0013528:	e59f30b4 	ldr	r3, [pc, #180]	; f00135e4 <remove_mapping_space+0x148>
f001352c:	eb000a6e 	bl	f0015eec <printk>
f0013530:	eafffffe 	b	f0013530 <remove_mapping_space+0x94>
f0013534:	e51b300c 	ldr	r3, [fp, #-12]
f0013538:	e5933000 	ldr	r3, [r3]
f001353c:	e3c33fff 	bic	r3, r3, #1020	; 0x3fc
f0013540:	e3c33003 	bic	r3, r3, #3
f0013544:	e283320f 	add	r3, r3, #-268435456	; 0xf0000000
f0013548:	e50b3014 	str	r3, [fp, #-20]
f001354c:	e51b3014 	ldr	r3, [fp, #-20]
f0013550:	e51b2008 	ldr	r2, [fp, #-8]
f0013554:	e7933102 	ldr	r3, [r3, r2, lsl #2]
f0013558:	e2033003 	and	r3, r3, #3
f001355c:	e50b3018 	str	r3, [fp, #-24]
f0013560:	e51b3018 	ldr	r3, [fp, #-24]
f0013564:	e3530000 	cmp	r3, #0
f0013568:	1a000001 	bne	f0013574 <remove_mapping_space+0xd8>
f001356c:	e3e03087 	mvn	r3, #135	; 0x87
f0013570:	ea000015 	b	f00135cc <remove_mapping_space+0x130>
f0013574:	e51b3018 	ldr	r3, [fp, #-24]
f0013578:	e3530002 	cmp	r3, #2
f001357c:	0a000005 	beq	f0013598 <remove_mapping_space+0xfc>
f0013580:	e59f0050 	ldr	r0, [pc, #80]	; f00135d8 <remove_mapping_space+0x13c>
f0013584:	e59f1050 	ldr	r1, [pc, #80]	; f00135dc <remove_mapping_space+0x140>
f0013588:	e59f2050 	ldr	r2, [pc, #80]	; f00135e0 <remove_mapping_space+0x144>
f001358c:	e59f3054 	ldr	r3, [pc, #84]	; f00135e8 <remove_mapping_space+0x14c>
f0013590:	eb000a55 	bl	f0015eec <printk>
f0013594:	eafffffe 	b	f0013594 <remove_mapping_space+0xf8>
f0013598:	e3a00000 	mov	r0, #0
f001359c:	ebfff2cb 	bl	f00100d0 <space_flags_to_ptflags>
f00135a0:	e1a03000 	mov	r3, r0
f00135a4:	e51b2008 	ldr	r2, [fp, #-8]
f00135a8:	e1a02102 	lsl	r2, r2, #2
f00135ac:	e51b1014 	ldr	r1, [fp, #-20]
f00135b0:	e0812002 	add	r2, r1, r2
f00135b4:	e58d2000 	str	r2, [sp]
f00135b8:	e51b0020 	ldr	r0, [fp, #-32]
f00135bc:	e3a01000 	mov	r1, #0
f00135c0:	e51b2024 	ldr	r2, [fp, #-36]	; 0x24
f00135c4:	eb000210 	bl	f0013e0c <arch_prepare_write_pte>
f00135c8:	e3a03000 	mov	r3, #0
f00135cc:	e1a00003 	mov	r0, r3
f00135d0:	e24bd004 	sub	sp, fp, #4
f00135d4:	e8bd8800 	pop	{fp, pc}
f00135d8:	f001ef74 	.word	0xf001ef74
f00135dc:	f001ef9c 	.word	0xf001ef9c
f00135e0:	f001f108 	.word	0xf001f108
f00135e4:	0000014f 	.word	0x0000014f
f00135e8:	0000015e 	.word	0x0000015e

f00135ec <remove_mapping>:
f00135ec:	e92d4800 	push	{fp, lr}
f00135f0:	e28db004 	add	fp, sp, #4
f00135f4:	e24dd008 	sub	sp, sp, #8
f00135f8:	e50b0008 	str	r0, [fp, #-8]
f00135fc:	ebfffd45 	bl	f0012b18 <current_task>
f0013600:	e1a03000 	mov	r3, r0
f0013604:	e59330b4 	ldr	r3, [r3, #180]	; 0xb4
f0013608:	e1a00003 	mov	r0, r3
f001360c:	e51b1008 	ldr	r1, [fp, #-8]
f0013610:	ebffffa1 	bl	f001349c <remove_mapping_space>
f0013614:	e1a03000 	mov	r3, r0
f0013618:	e1a00003 	mov	r0, r3
f001361c:	e24bd004 	sub	sp, fp, #4
f0013620:	e8bd8800 	pop	{fp, pc}

f0013624 <delete_page_tables>:
f0013624:	e92d4800 	push	{fp, lr}
f0013628:	e28db004 	add	fp, sp, #4
f001362c:	e24dd008 	sub	sp, sp, #8
f0013630:	e50b0008 	str	r0, [fp, #-8]
f0013634:	e50b100c 	str	r1, [fp, #-12]
f0013638:	e51b0008 	ldr	r0, [fp, #-8]
f001363c:	e51b100c 	ldr	r1, [fp, #-12]
f0013640:	eb00027c 	bl	f0014038 <remove_mapping_pgd_all_user>
f0013644:	e51b3008 	ldr	r3, [fp, #-8]
f0013648:	e5933010 	ldr	r3, [r3, #16]
f001364c:	e1a00003 	mov	r0, r3
f0013650:	ebffe231 	bl	f000bf1c <pgd_free>
f0013654:	e3a03000 	mov	r3, #0
f0013658:	e1a00003 	mov	r0, r3
f001365c:	e24bd004 	sub	sp, fp, #4
f0013660:	e8bd8800 	pop	{fp, pc}

f0013664 <copy_user_tables>:
f0013664:	e92d4800 	push	{fp, lr}
f0013668:	e28db004 	add	fp, sp, #4
f001366c:	e24dd020 	sub	sp, sp, #32
f0013670:	e50b0020 	str	r0, [fp, #-32]
f0013674:	e50b1024 	str	r1, [fp, #-36]	; 0x24
f0013678:	e51b3020 	ldr	r3, [fp, #-32]
f001367c:	e5933010 	ldr	r3, [r3, #16]
f0013680:	e50b3010 	str	r3, [fp, #-16]
f0013684:	e51b3024 	ldr	r3, [fp, #-36]	; 0x24
f0013688:	e5933010 	ldr	r3, [r3, #16]
f001368c:	e50b3014 	str	r3, [fp, #-20]
f0013690:	e3a03000 	mov	r3, #0
f0013694:	e50b3008 	str	r3, [fp, #-8]
f0013698:	ea00002c 	b	f0013750 <copy_user_tables+0xec>
f001369c:	e51b0008 	ldr	r0, [fp, #-8]
f00136a0:	eb00023c 	bl	f0013f98 <is_global_pgdi>
f00136a4:	e1a03000 	mov	r3, r0
f00136a8:	e3530000 	cmp	r3, #0
f00136ac:	1a000024 	bne	f0013744 <copy_user_tables+0xe0>
f00136b0:	e51b3014 	ldr	r3, [fp, #-20]
f00136b4:	e51b2008 	ldr	r2, [fp, #-8]
f00136b8:	e7933102 	ldr	r3, [r3, r2, lsl #2]
f00136bc:	e2033003 	and	r3, r3, #3
f00136c0:	e3530001 	cmp	r3, #1
f00136c4:	1a00001e 	bne	f0013744 <copy_user_tables+0xe0>
f00136c8:	ebfffd12 	bl	f0012b18 <current_task>
f00136cc:	e1a03000 	mov	r3, r0
f00136d0:	e59330b4 	ldr	r3, [r3, #180]	; 0xb4
f00136d4:	e2833014 	add	r3, r3, #20
f00136d8:	e1a00003 	mov	r0, r3
f00136dc:	ebffe18d 	bl	f000bd18 <pmd_cap_alloc>
f00136e0:	e50b0018 	str	r0, [fp, #-24]
f00136e4:	e51b3018 	ldr	r3, [fp, #-24]
f00136e8:	e3530000 	cmp	r3, #0
f00136ec:	1a000003 	bne	f0013700 <copy_user_tables+0x9c>
f00136f0:	e1a00000 	nop			; (mov r0, r0)
f00136f4:	e3a03000 	mov	r3, #0
f00136f8:	e50b300c 	str	r3, [fp, #-12]
f00136fc:	ea000035 	b	f00137d8 <copy_user_tables+0x174>
f0013700:	e51b3014 	ldr	r3, [fp, #-20]
f0013704:	e51b2008 	ldr	r2, [fp, #-8]
f0013708:	e7933102 	ldr	r3, [r3, r2, lsl #2]
f001370c:	e3c33fff 	bic	r3, r3, #1020	; 0x3fc
f0013710:	e3c33003 	bic	r3, r3, #3
f0013714:	e283320f 	add	r3, r3, #-268435456	; 0xf0000000
f0013718:	e50b301c 	str	r3, [fp, #-28]
f001371c:	e51b0018 	ldr	r0, [fp, #-24]
f0013720:	e51b101c 	ldr	r1, [fp, #-28]
f0013724:	e3a02b01 	mov	r2, #1024	; 0x400
f0013728:	eb000a28 	bl	f0015fd0 <memcpy>
f001372c:	e51b3018 	ldr	r3, [fp, #-24]
f0013730:	e2833201 	add	r3, r3, #268435456	; 0x10000000
f0013734:	e3831001 	orr	r1, r3, #1
f0013738:	e51b3010 	ldr	r3, [fp, #-16]
f001373c:	e51b2008 	ldr	r2, [fp, #-8]
f0013740:	e7831102 	str	r1, [r3, r2, lsl #2]
f0013744:	e51b3008 	ldr	r3, [fp, #-8]
f0013748:	e2833001 	add	r3, r3, #1
f001374c:	e50b3008 	str	r3, [fp, #-8]
f0013750:	e51b3008 	ldr	r3, [fp, #-8]
f0013754:	e3530a01 	cmp	r3, #4096	; 0x1000
f0013758:	baffffcf 	blt	f001369c <copy_user_tables+0x38>
f001375c:	ebfffce9 	bl	f0012b08 <dmb>
f0013760:	e3a03000 	mov	r3, #0
f0013764:	ea00001f 	b	f00137e8 <copy_user_tables+0x184>
f0013768:	e51b000c 	ldr	r0, [fp, #-12]
f001376c:	eb000209 	bl	f0013f98 <is_global_pgdi>
f0013770:	e1a03000 	mov	r3, r0
f0013774:	e3530000 	cmp	r3, #0
f0013778:	1a000013 	bne	f00137cc <copy_user_tables+0x168>
f001377c:	e51b3010 	ldr	r3, [fp, #-16]
f0013780:	e51b200c 	ldr	r2, [fp, #-12]
f0013784:	e7933102 	ldr	r3, [r3, r2, lsl #2]
f0013788:	e2033003 	and	r3, r3, #3
f001378c:	e3530001 	cmp	r3, #1
f0013790:	1a00000d 	bne	f00137cc <copy_user_tables+0x168>
f0013794:	e51b3010 	ldr	r3, [fp, #-16]
f0013798:	e51b200c 	ldr	r2, [fp, #-12]
f001379c:	e7933102 	ldr	r3, [r3, r2, lsl #2]
f00137a0:	e3c33fff 	bic	r3, r3, #1020	; 0x3fc
f00137a4:	e3c33003 	bic	r3, r3, #3
f00137a8:	e283320f 	add	r3, r3, #-268435456	; 0xf0000000
f00137ac:	e50b3018 	str	r3, [fp, #-24]
f00137b0:	ebfffcd8 	bl	f0012b18 <current_task>
f00137b4:	e1a03000 	mov	r3, r0
f00137b8:	e59330b4 	ldr	r3, [r3, #180]	; 0xb4
f00137bc:	e2833014 	add	r3, r3, #20
f00137c0:	e51b0018 	ldr	r0, [fp, #-24]
f00137c4:	e1a01003 	mov	r1, r3
f00137c8:	ebffe1ed 	bl	f000bf84 <pmd_cap_free>
f00137cc:	e51b300c 	ldr	r3, [fp, #-12]
f00137d0:	e2833001 	add	r3, r3, #1
f00137d4:	e50b300c 	str	r3, [fp, #-12]
f00137d8:	e51b300c 	ldr	r3, [fp, #-12]
f00137dc:	e3530a01 	cmp	r3, #4096	; 0x1000
f00137e0:	baffffe0 	blt	f0013768 <copy_user_tables+0x104>
f00137e4:	e3e0300b 	mvn	r3, #11
f00137e8:	e1a00003 	mov	r0, r3
f00137ec:	e24bd004 	sub	sp, fp, #4
f00137f0:	e8bd8800 	pop	{fp, pc}

f00137f4 <remap_as_pages>:
f00137f4:	e92d4800 	push	{fp, lr}
f00137f8:	e28db004 	add	fp, sp, #4
f00137fc:	e24dd038 	sub	sp, sp, #56	; 0x38
f0013800:	e50b0030 	str	r0, [fp, #-48]	; 0x30
f0013804:	e50b1034 	str	r1, [fp, #-52]	; 0x34
f0013808:	e51b3030 	ldr	r3, [fp, #-48]	; 0x30
f001380c:	e2833201 	add	r3, r3, #268435456	; 0x10000000
f0013810:	e50b3018 	str	r3, [fp, #-24]
f0013814:	e51b3034 	ldr	r3, [fp, #-52]	; 0x34
f0013818:	e2833201 	add	r3, r3, #268435456	; 0x10000000
f001381c:	e50b301c 	str	r3, [fp, #-28]
f0013820:	e51b3018 	ldr	r3, [fp, #-24]
f0013824:	e50b3008 	str	r3, [fp, #-8]
f0013828:	e51b3030 	ldr	r3, [fp, #-48]	; 0x30
f001382c:	e50b300c 	str	r3, [fp, #-12]
f0013830:	e51b3030 	ldr	r3, [fp, #-48]	; 0x30
f0013834:	e1a03523 	lsr	r3, r3, #10
f0013838:	e2033fff 	and	r3, r3, #1020	; 0x3fc
f001383c:	e1a03123 	lsr	r3, r3, #2
f0013840:	e50b3020 	str	r3, [fp, #-32]
f0013844:	ebffe088 	bl	f000ba6c <alloc_boot_pmd>
f0013848:	e50b0024 	str	r0, [fp, #-36]	; 0x24
f001384c:	e51b201c 	ldr	r2, [fp, #-28]
f0013850:	e51b3018 	ldr	r3, [fp, #-24]
f0013854:	e0633002 	rsb	r3, r3, r2
f0013858:	e1a03623 	lsr	r3, r3, #12
f001385c:	e50b3028 	str	r3, [fp, #-40]	; 0x28
f0013860:	e3a03000 	mov	r3, #0
f0013864:	e50b3014 	str	r3, [fp, #-20]
f0013868:	ea000032 	b	f0013938 <remap_as_pages+0x144>
f001386c:	e59f3118 	ldr	r3, [pc, #280]	; f001398c <remap_as_pages+0x198>
f0013870:	e51b200c 	ldr	r2, [fp, #-12]
f0013874:	e1520003 	cmp	r2, r3
f0013878:	3a000007 	bcc	f001389c <remap_as_pages+0xa8>
f001387c:	e59f310c 	ldr	r3, [pc, #268]	; f0013990 <remap_as_pages+0x19c>
f0013880:	e2833eff 	add	r3, r3, #4080	; 0xff0
f0013884:	e283300f 	add	r3, r3, #15
f0013888:	e3c33eff 	bic	r3, r3, #4080	; 0xff0
f001388c:	e3c3300f 	bic	r3, r3, #15
f0013890:	e51b200c 	ldr	r2, [fp, #-12]
f0013894:	e1520003 	cmp	r2, r3
f0013898:	3a00000b 	bcc	f00138cc <remap_as_pages+0xd8>
f001389c:	e59f30f0 	ldr	r3, [pc, #240]	; f0013994 <remap_as_pages+0x1a0>
f00138a0:	e51b200c 	ldr	r2, [fp, #-12]
f00138a4:	e1520003 	cmp	r2, r3
f00138a8:	3a00000a 	bcc	f00138d8 <remap_as_pages+0xe4>
f00138ac:	e59f30e4 	ldr	r3, [pc, #228]	; f0013998 <remap_as_pages+0x1a4>
f00138b0:	e2833eff 	add	r3, r3, #4080	; 0xff0
f00138b4:	e283300f 	add	r3, r3, #15
f00138b8:	e3c33eff 	bic	r3, r3, #4080	; 0xff0
f00138bc:	e3c3300f 	bic	r3, r3, #15
f00138c0:	e51b200c 	ldr	r2, [fp, #-12]
f00138c4:	e1520003 	cmp	r2, r3
f00138c8:	2a000002 	bcs	f00138d8 <remap_as_pages+0xe4>
f00138cc:	e3a03007 	mov	r3, #7
f00138d0:	e50b3010 	str	r3, [fp, #-16]
f00138d4:	ea000001 	b	f00138e0 <remap_as_pages+0xec>
f00138d8:	e3a03003 	mov	r3, #3
f00138dc:	e50b3010 	str	r3, [fp, #-16]
f00138e0:	e51b3010 	ldr	r3, [fp, #-16]
f00138e4:	e1a00003 	mov	r0, r3
f00138e8:	ebfff1f8 	bl	f00100d0 <space_flags_to_ptflags>
f00138ec:	e1a02000 	mov	r2, r0
f00138f0:	e51b1020 	ldr	r1, [fp, #-32]
f00138f4:	e51b3014 	ldr	r3, [fp, #-20]
f00138f8:	e0813003 	add	r3, r1, r3
f00138fc:	e1a03103 	lsl	r3, r3, #2
f0013900:	e51b1024 	ldr	r1, [fp, #-36]	; 0x24
f0013904:	e0813003 	add	r3, r1, r3
f0013908:	e51b0008 	ldr	r0, [fp, #-8]
f001390c:	e51b100c 	ldr	r1, [fp, #-12]
f0013910:	eb0000fe 	bl	f0013d10 <arch_prepare_pte>
f0013914:	e51b3008 	ldr	r3, [fp, #-8]
f0013918:	e2833a01 	add	r3, r3, #4096	; 0x1000
f001391c:	e50b3008 	str	r3, [fp, #-8]
f0013920:	e51b300c 	ldr	r3, [fp, #-12]
f0013924:	e2833a01 	add	r3, r3, #4096	; 0x1000
f0013928:	e50b300c 	str	r3, [fp, #-12]
f001392c:	e51b3014 	ldr	r3, [fp, #-20]
f0013930:	e2833001 	add	r3, r3, #1
f0013934:	e50b3014 	str	r3, [fp, #-20]
f0013938:	e51b2014 	ldr	r2, [fp, #-20]
f001393c:	e51b3028 	ldr	r3, [fp, #-40]	; 0x28
f0013940:	e1520003 	cmp	r2, r3
f0013944:	baffffc8 	blt	f001386c <remap_as_pages+0x78>
f0013948:	ebfffc72 	bl	f0012b18 <current_task>
f001394c:	e1a03000 	mov	r3, r0
f0013950:	e59320b4 	ldr	r2, [r3, #180]	; 0xb4
f0013954:	e51b3030 	ldr	r3, [fp, #-48]	; 0x30
f0013958:	e1a00002 	mov	r0, r2
f001395c:	e51b1024 	ldr	r1, [fp, #-36]	; 0x24
f0013960:	e1a02003 	mov	r2, r3
f0013964:	ebfffcf7 	bl	f0012d48 <attach_pmd>
f0013968:	e51b2030 	ldr	r2, [fp, #-48]	; 0x30
f001396c:	e51b3034 	ldr	r3, [fp, #-52]	; 0x34
f0013970:	e51b1028 	ldr	r1, [fp, #-40]	; 0x28
f0013974:	e58d1000 	str	r1, [sp]
f0013978:	e59f001c 	ldr	r0, [pc, #28]	; f001399c <remap_as_pages+0x1a8>
f001397c:	e59f101c 	ldr	r1, [pc, #28]	; f00139a0 <remap_as_pages+0x1ac>
f0013980:	eb000959 	bl	f0015eec <printk>
f0013984:	e24bd004 	sub	sp, fp, #4
f0013988:	e8bd8800 	pop	{fp, pc}
f001398c:	f0008000 	.word	0xf0008000
f0013990:	f001e1cc 	.word	0xf001e1cc
f0013994:	f0024000 	.word	0xf0024000
f0013998:	f0025000 	.word	0xf0025000
f001399c:	f001f064 	.word	0xf001f064
f00139a0:	f001f098 	.word	0xf001f098

f00139a4 <_memset>:
f00139a4:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
f00139a8:	e20110ff 	and	r1, r1, #255	; 0xff
f00139ac:	e1811401 	orr	r1, r1, r1, lsl #8
f00139b0:	e1811801 	orr	r1, r1, r1, lsl #16
f00139b4:	e1a04001 	mov	r4, r1
f00139b8:	e3520008 	cmp	r2, #8
f00139bc:	ba000019 	blt	f0013a28 <_memset+0x84>
f00139c0:	a1a05004 	movge	r5, r4
f00139c4:	a3520010 	cmpge	r2, #16
f00139c8:	ba000011 	blt	f0013a14 <_memset+0x70>
f00139cc:	a1a06004 	movge	r6, r4
f00139d0:	a1a07004 	movge	r7, r4
f00139d4:	a3520020 	cmpge	r2, #32
f00139d8:	ba000008 	blt	f0013a00 <_memset+0x5c>
f00139dc:	a1a08004 	movge	r8, r4
f00139e0:	a1a09004 	movge	r9, r4
f00139e4:	a1a0a004 	movge	sl, r4
f00139e8:	a1a0b004 	movge	fp, r4
f00139ec:	e3520020 	cmp	r2, #32
f00139f0:	ba000002 	blt	f0013a00 <_memset+0x5c>
f00139f4:	e8a00ff0 	stmia	r0!, {r4, r5, r6, r7, r8, r9, sl, fp}
f00139f8:	e2422020 	sub	r2, r2, #32
f00139fc:	eafffffa 	b	f00139ec <_memset+0x48>
f0013a00:	e3520010 	cmp	r2, #16
f0013a04:	ba000002 	blt	f0013a14 <_memset+0x70>
f0013a08:	e8a000f0 	stmia	r0!, {r4, r5, r6, r7}
f0013a0c:	e2422010 	sub	r2, r2, #16
f0013a10:	eafffffa 	b	f0013a00 <_memset+0x5c>
f0013a14:	e3520008 	cmp	r2, #8
f0013a18:	ba000002 	blt	f0013a28 <_memset+0x84>
f0013a1c:	e8a00030 	stmia	r0!, {r4, r5}
f0013a20:	e2422008 	sub	r2, r2, #8
f0013a24:	eafffffa 	b	f0013a14 <_memset+0x70>
f0013a28:	e3520004 	cmp	r2, #4
f0013a2c:	ba000002 	blt	f0013a3c <end>
f0013a30:	e8a00010 	stmia	r0!, {r4}
f0013a34:	e2422004 	sub	r2, r2, #4
f0013a38:	eafffffa 	b	f0013a28 <_memset+0x84>

f0013a3c <end>:
f0013a3c:	e3320000 	teq	r2, #0
f0013a40:	15c04000 	strbne	r4, [r0]
f0013a44:	12422001 	subne	r2, r2, #1
f0013a48:	12800001 	addne	r0, r0, #1
f0013a4c:	1afffffa 	bne	f0013a3c <end>
f0013a50:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}

f0013a54 <_memcpy>:
f0013a54:	e92d4ff1 	push	{r0, r4, r5, r6, r7, r8, r9, sl, fp, lr}

f0013a58 <loop32>:
f0013a58:	e3520020 	cmp	r2, #32
f0013a5c:	ba000003 	blt	f0013a70 <loop16>
f0013a60:	e8b10ff0 	ldm	r1!, {r4, r5, r6, r7, r8, r9, sl, fp}
f0013a64:	e8a00ff0 	stmia	r0!, {r4, r5, r6, r7, r8, r9, sl, fp}
f0013a68:	e2422020 	sub	r2, r2, #32
f0013a6c:	eafffff9 	b	f0013a58 <loop32>

f0013a70 <loop16>:
f0013a70:	e3520010 	cmp	r2, #16
f0013a74:	ba000003 	blt	f0013a88 <loop8>
f0013a78:	e8b100f0 	ldm	r1!, {r4, r5, r6, r7}
f0013a7c:	e8a000f0 	stmia	r0!, {r4, r5, r6, r7}
f0013a80:	e2422010 	sub	r2, r2, #16
f0013a84:	eafffff9 	b	f0013a70 <loop16>

f0013a88 <loop8>:
f0013a88:	e3520008 	cmp	r2, #8
f0013a8c:	ba000003 	blt	f0013aa0 <loop4>
f0013a90:	e8b10030 	ldm	r1!, {r4, r5}
f0013a94:	e8a00030 	stmia	r0!, {r4, r5}
f0013a98:	e2422008 	sub	r2, r2, #8
f0013a9c:	eafffff9 	b	f0013a88 <loop8>

f0013aa0 <loop4>:
f0013aa0:	e3520004 	cmp	r2, #4
f0013aa4:	ba000003 	blt	f0013ab8 <end>
f0013aa8:	e8b10010 	ldm	r1!, {r4}
f0013aac:	e8a00010 	stmia	r0!, {r4}
f0013ab0:	e2422004 	sub	r2, r2, #4
f0013ab4:	eafffff9 	b	f0013aa0 <loop4>

f0013ab8 <end>:
f0013ab8:	e3320000 	teq	r2, #0
f0013abc:	c5d14000 	ldrbgt	r4, [r1]
f0013ac0:	15c04000 	strbne	r4, [r0]
f0013ac4:	11a04424 	lsrne	r4, r4, #8
f0013ac8:	12422001 	subne	r2, r2, #1
f0013acc:	12800001 	addne	r0, r0, #1
f0013ad0:	12811001 	addne	r1, r1, #1
f0013ad4:	1afffff7 	bne	f0013ab8 <end>
f0013ad8:	e8bd8ff1 	pop	{r0, r4, r5, r6, r7, r8, r9, sl, fp, pc}

f0013adc <current_task>:
f0013adc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f0013ae0:	e28db000 	add	fp, sp, #0
f0013ae4:	e1a0300d 	mov	r3, sp
f0013ae8:	e3c33eff 	bic	r3, r3, #4080	; 0xff0
f0013aec:	e3c3300f 	bic	r3, r3, #15
f0013af0:	e1a00003 	mov	r0, r3
f0013af4:	e24bd000 	sub	sp, fp, #0
f0013af8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0013afc:	e12fff1e 	bx	lr

f0013b00 <system_account_space_switch>:
f0013b00:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f0013b04:	e28db000 	add	fp, sp, #0
f0013b08:	e24bd000 	sub	sp, fp, #0
f0013b0c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0013b10:	e12fff1e 	bx	lr

f0013b14 <remove_section_mapping>:
f0013b14:	e92d4800 	push	{fp, lr}
f0013b18:	e28db004 	add	fp, sp, #4
f0013b1c:	e24dd010 	sub	sp, sp, #16
f0013b20:	e50b0010 	str	r0, [fp, #-16]
f0013b24:	e59f3068 	ldr	r3, [pc, #104]	; f0013b94 <remove_section_mapping+0x80>
f0013b28:	e50b3008 	str	r3, [fp, #-8]
f0013b2c:	e51b3010 	ldr	r3, [fp, #-16]
f0013b30:	e1a02923 	lsr	r2, r3, #18
f0013b34:	e59f305c 	ldr	r3, [pc, #92]	; f0013b98 <remove_section_mapping+0x84>
f0013b38:	e0023003 	and	r3, r2, r3
f0013b3c:	e1a03123 	lsr	r3, r3, #2
f0013b40:	e50b300c 	str	r3, [fp, #-12]
f0013b44:	e51b3008 	ldr	r3, [fp, #-8]
f0013b48:	e51b200c 	ldr	r2, [fp, #-12]
f0013b4c:	e7933102 	ldr	r3, [r3, r2, lsl #2]
f0013b50:	e2033002 	and	r3, r3, #2
f0013b54:	e3530000 	cmp	r3, #0
f0013b58:	1a000000 	bne	f0013b60 <remove_section_mapping+0x4c>
f0013b5c:	eafffffe 	b	f0013b5c <remove_section_mapping+0x48>
f0013b60:	e51b3008 	ldr	r3, [fp, #-8]
f0013b64:	e51b200c 	ldr	r2, [fp, #-12]
f0013b68:	e3a01000 	mov	r1, #0
f0013b6c:	e7831102 	str	r1, [r3, r2, lsl #2]
f0013b70:	e51b3008 	ldr	r3, [fp, #-8]
f0013b74:	e51b200c 	ldr	r2, [fp, #-12]
f0013b78:	e7931102 	ldr	r1, [r3, r2, lsl #2]
f0013b7c:	e51b3008 	ldr	r3, [fp, #-8]
f0013b80:	e51b200c 	ldr	r2, [fp, #-12]
f0013b84:	e7831102 	str	r1, [r3, r2, lsl #2]
f0013b88:	eb00038f 	bl	f00149cc <arm_invalidate_tlb>
f0013b8c:	e24bd004 	sub	sp, fp, #4
f0013b90:	e8bd8800 	pop	{fp, pc}
f0013b94:	f0028000 	.word	0xf0028000
f0013b98:	00003ffc 	.word	0x00003ffc

f0013b9c <__add_section_mapping_init>:
f0013b9c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f0013ba0:	e28db000 	add	fp, sp, #0
f0013ba4:	e24dd024 	sub	sp, sp, #36	; 0x24
f0013ba8:	e50b0018 	str	r0, [fp, #-24]
f0013bac:	e50b101c 	str	r1, [fp, #-28]
f0013bb0:	e50b2020 	str	r2, [fp, #-32]
f0013bb4:	e50b3024 	str	r3, [fp, #-36]	; 0x24
f0013bb8:	e59f30dc 	ldr	r3, [pc, #220]	; f0013c9c <__add_section_mapping_init+0x100>
f0013bbc:	e2833201 	add	r3, r3, #268435456	; 0x10000000
f0013bc0:	e50b3010 	str	r3, [fp, #-16]
f0013bc4:	e51b301c 	ldr	r3, [fp, #-28]
f0013bc8:	e1a02923 	lsr	r2, r3, #18
f0013bcc:	e59f30cc 	ldr	r3, [pc, #204]	; f0013ca0 <__add_section_mapping_init+0x104>
f0013bd0:	e0023003 	and	r3, r2, r3
f0013bd4:	e50b3014 	str	r3, [fp, #-20]
f0013bd8:	e51b2010 	ldr	r2, [fp, #-16]
f0013bdc:	e51b3014 	ldr	r3, [fp, #-20]
f0013be0:	e0823003 	add	r3, r2, r3
f0013be4:	e50b3008 	str	r3, [fp, #-8]
f0013be8:	e3a03000 	mov	r3, #0
f0013bec:	e50b300c 	str	r3, [fp, #-12]
f0013bf0:	ea000021 	b	f0013c7c <__add_section_mapping_init+0xe0>
f0013bf4:	e51b3008 	ldr	r3, [fp, #-8]
f0013bf8:	e3a02000 	mov	r2, #0
f0013bfc:	e5832000 	str	r2, [r3]
f0013c00:	e51b3008 	ldr	r3, [fp, #-8]
f0013c04:	e5932000 	ldr	r2, [r3]
f0013c08:	e51b3018 	ldr	r3, [fp, #-24]
f0013c0c:	e1822003 	orr	r2, r2, r3
f0013c10:	e51b3008 	ldr	r3, [fp, #-8]
f0013c14:	e5832000 	str	r2, [r3]
f0013c18:	e51b3008 	ldr	r3, [fp, #-8]
f0013c1c:	e5933000 	ldr	r3, [r3]
f0013c20:	e3832002 	orr	r2, r3, #2
f0013c24:	e51b3008 	ldr	r3, [fp, #-8]
f0013c28:	e5832000 	str	r2, [r3]
f0013c2c:	e51b3008 	ldr	r3, [fp, #-8]
f0013c30:	e5933000 	ldr	r3, [r3]
f0013c34:	e3832b01 	orr	r2, r3, #1024	; 0x400
f0013c38:	e51b3008 	ldr	r3, [fp, #-8]
f0013c3c:	e5832000 	str	r2, [r3]
f0013c40:	e51b3008 	ldr	r3, [fp, #-8]
f0013c44:	e5932000 	ldr	r2, [r3]
f0013c48:	e51b3024 	ldr	r3, [fp, #-36]	; 0x24
f0013c4c:	e1822003 	orr	r2, r2, r3
f0013c50:	e51b3008 	ldr	r3, [fp, #-8]
f0013c54:	e5832000 	str	r2, [r3]
f0013c58:	e51b3008 	ldr	r3, [fp, #-8]
f0013c5c:	e2833004 	add	r3, r3, #4
f0013c60:	e50b3008 	str	r3, [fp, #-8]
f0013c64:	e51b3018 	ldr	r3, [fp, #-24]
f0013c68:	e2833601 	add	r3, r3, #1048576	; 0x100000
f0013c6c:	e50b3018 	str	r3, [fp, #-24]
f0013c70:	e51b300c 	ldr	r3, [fp, #-12]
f0013c74:	e2833001 	add	r3, r3, #1
f0013c78:	e50b300c 	str	r3, [fp, #-12]
f0013c7c:	e51b200c 	ldr	r2, [fp, #-12]
f0013c80:	e51b3020 	ldr	r3, [fp, #-32]
f0013c84:	e1520003 	cmp	r2, r3
f0013c88:	3affffd9 	bcc	f0013bf4 <__add_section_mapping_init+0x58>
f0013c8c:	e1a00000 	nop			; (mov r0, r0)
f0013c90:	e24bd000 	sub	sp, fp, #0
f0013c94:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0013c98:	e12fff1e 	bx	lr
f0013c9c:	f0028000 	.word	0xf0028000
f0013ca0:	00003ffc 	.word	0x00003ffc

f0013ca4 <add_section_mapping_init>:
f0013ca4:	e92d4800 	push	{fp, lr}
f0013ca8:	e28db004 	add	fp, sp, #4
f0013cac:	e24dd018 	sub	sp, sp, #24
f0013cb0:	e50b0010 	str	r0, [fp, #-16]
f0013cb4:	e50b1014 	str	r1, [fp, #-20]
f0013cb8:	e50b2018 	str	r2, [fp, #-24]
f0013cbc:	e50b301c 	str	r3, [fp, #-28]
f0013cc0:	e51b3010 	ldr	r3, [fp, #-16]
f0013cc4:	e1a03a23 	lsr	r3, r3, #20
f0013cc8:	e1a03a03 	lsl	r3, r3, #20
f0013ccc:	e50b3008 	str	r3, [fp, #-8]
f0013cd0:	e51b3014 	ldr	r3, [fp, #-20]
f0013cd4:	e1a03a23 	lsr	r3, r3, #20
f0013cd8:	e1a03a03 	lsl	r3, r3, #20
f0013cdc:	e50b300c 	str	r3, [fp, #-12]
f0013ce0:	e51b3018 	ldr	r3, [fp, #-24]
f0013ce4:	e3530000 	cmp	r3, #0
f0013ce8:	1a000000 	bne	f0013cf0 <add_section_mapping_init+0x4c>
f0013cec:	ea000005 	b	f0013d08 <add_section_mapping_init+0x64>
f0013cf0:	e51b0008 	ldr	r0, [fp, #-8]
f0013cf4:	e51b100c 	ldr	r1, [fp, #-12]
f0013cf8:	e51b2018 	ldr	r2, [fp, #-24]
f0013cfc:	e51b301c 	ldr	r3, [fp, #-28]
f0013d00:	ebffffa5 	bl	f0013b9c <__add_section_mapping_init>
f0013d04:	e1a00000 	nop			; (mov r0, r0)
f0013d08:	e24bd004 	sub	sp, fp, #4
f0013d0c:	e8bd8800 	pop	{fp, pc}

f0013d10 <arch_prepare_pte>:
f0013d10:	e92d4800 	push	{fp, lr}
f0013d14:	e28db004 	add	fp, sp, #4
f0013d18:	e24dd010 	sub	sp, sp, #16
f0013d1c:	e50b0008 	str	r0, [fp, #-8]
f0013d20:	e50b100c 	str	r1, [fp, #-12]
f0013d24:	e50b2010 	str	r2, [fp, #-16]
f0013d28:	e50b3014 	str	r3, [fp, #-20]
f0013d2c:	e51b3008 	ldr	r3, [fp, #-8]
f0013d30:	e1a03a03 	lsl	r3, r3, #20
f0013d34:	e1a03a23 	lsr	r3, r3, #20
f0013d38:	e3530000 	cmp	r3, #0
f0013d3c:	1a000004 	bne	f0013d54 <arch_prepare_pte+0x44>
f0013d40:	e51b300c 	ldr	r3, [fp, #-12]
f0013d44:	e1a03a03 	lsl	r3, r3, #20
f0013d48:	e1a03a23 	lsr	r3, r3, #20
f0013d4c:	e3530000 	cmp	r3, #0
f0013d50:	0a000009 	beq	f0013d7c <arch_prepare_pte+0x6c>
f0013d54:	e59f0064 	ldr	r0, [pc, #100]	; f0013dc0 <arch_prepare_pte+0xb0>
f0013d58:	e51b1008 	ldr	r1, [fp, #-8]
f0013d5c:	e51b200c 	ldr	r2, [fp, #-12]
f0013d60:	eb000861 	bl	f0015eec <printk>
f0013d64:	e59f0058 	ldr	r0, [pc, #88]	; f0013dc4 <arch_prepare_pte+0xb4>
f0013d68:	e59f1058 	ldr	r1, [pc, #88]	; f0013dc8 <arch_prepare_pte+0xb8>
f0013d6c:	e59f2058 	ldr	r2, [pc, #88]	; f0013dcc <arch_prepare_pte+0xbc>
f0013d70:	e3a03066 	mov	r3, #102	; 0x66
f0013d74:	eb00085c 	bl	f0015eec <printk>
f0013d78:	eafffffe 	b	f0013d78 <arch_prepare_pte+0x68>
f0013d7c:	e51b3010 	ldr	r3, [fp, #-16]
f0013d80:	e3530000 	cmp	r3, #0
f0013d84:	1a000005 	bne	f0013da0 <arch_prepare_pte+0x90>
f0013d88:	e51b2008 	ldr	r2, [fp, #-8]
f0013d8c:	e51b3010 	ldr	r3, [fp, #-16]
f0013d90:	e1822003 	orr	r2, r2, r3
f0013d94:	e51b3014 	ldr	r3, [fp, #-20]
f0013d98:	e5832000 	str	r2, [r3]
f0013d9c:	ea000005 	b	f0013db8 <arch_prepare_pte+0xa8>
f0013da0:	e51b2008 	ldr	r2, [fp, #-8]
f0013da4:	e51b3010 	ldr	r3, [fp, #-16]
f0013da8:	e1823003 	orr	r3, r2, r3
f0013dac:	e3832002 	orr	r2, r3, #2
f0013db0:	e51b3014 	ldr	r3, [fp, #-20]
f0013db4:	e5832000 	str	r2, [r3]
f0013db8:	e24bd004 	sub	sp, fp, #4
f0013dbc:	e8bd8800 	pop	{fp, pc}
f0013dc0:	f001f120 	.word	0xf001f120
f0013dc4:	f001f15c 	.word	0xf001f15c
f0013dc8:	f001f184 	.word	0xf001f184
f0013dcc:	f001f220 	.word	0xf001f220

f0013dd0 <arch_write_pte>:
f0013dd0:	e92d4800 	push	{fp, lr}
f0013dd4:	e28db004 	add	fp, sp, #4
f0013dd8:	e24dd010 	sub	sp, sp, #16
f0013ddc:	e50b0008 	str	r0, [fp, #-8]
f0013de0:	e50b100c 	str	r1, [fp, #-12]
f0013de4:	e50b2010 	str	r2, [fp, #-16]
f0013de8:	e50b3014 	str	r3, [fp, #-20]
f0013dec:	eb0002ee 	bl	f00149ac <arm_clean_invalidate_cache>
f0013df0:	e51b3008 	ldr	r3, [fp, #-8]
f0013df4:	e51b200c 	ldr	r2, [fp, #-12]
f0013df8:	e5832000 	str	r2, [r3]
f0013dfc:	eb0002ea 	bl	f00149ac <arm_clean_invalidate_cache>
f0013e00:	eb0002f1 	bl	f00149cc <arm_invalidate_tlb>
f0013e04:	e24bd004 	sub	sp, fp, #4
f0013e08:	e8bd8800 	pop	{fp, pc}

f0013e0c <arch_prepare_write_pte>:
f0013e0c:	e92d4800 	push	{fp, lr}
f0013e10:	e28db004 	add	fp, sp, #4
f0013e14:	e24dd018 	sub	sp, sp, #24
f0013e18:	e50b0010 	str	r0, [fp, #-16]
f0013e1c:	e50b1014 	str	r1, [fp, #-20]
f0013e20:	e50b2018 	str	r2, [fp, #-24]
f0013e24:	e50b301c 	str	r3, [fp, #-28]
f0013e28:	e3a03000 	mov	r3, #0
f0013e2c:	e50b3008 	str	r3, [fp, #-8]
f0013e30:	e51b3014 	ldr	r3, [fp, #-20]
f0013e34:	e1a03a03 	lsl	r3, r3, #20
f0013e38:	e1a03a23 	lsr	r3, r3, #20
f0013e3c:	e3530000 	cmp	r3, #0
f0013e40:	0a000005 	beq	f0013e5c <arch_prepare_write_pte+0x50>
f0013e44:	e59f0074 	ldr	r0, [pc, #116]	; f0013ec0 <arch_prepare_write_pte+0xb4>
f0013e48:	e59f1074 	ldr	r1, [pc, #116]	; f0013ec4 <arch_prepare_write_pte+0xb8>
f0013e4c:	e59f2074 	ldr	r2, [pc, #116]	; f0013ec8 <arch_prepare_write_pte+0xbc>
f0013e50:	e3a03099 	mov	r3, #153	; 0x99
f0013e54:	eb000824 	bl	f0015eec <printk>
f0013e58:	eafffffe 	b	f0013e58 <arch_prepare_write_pte+0x4c>
f0013e5c:	e51b3018 	ldr	r3, [fp, #-24]
f0013e60:	e1a03a03 	lsl	r3, r3, #20
f0013e64:	e1a03a23 	lsr	r3, r3, #20
f0013e68:	e3530000 	cmp	r3, #0
f0013e6c:	0a000005 	beq	f0013e88 <arch_prepare_write_pte+0x7c>
f0013e70:	e59f0048 	ldr	r0, [pc, #72]	; f0013ec0 <arch_prepare_write_pte+0xb4>
f0013e74:	e59f1048 	ldr	r1, [pc, #72]	; f0013ec4 <arch_prepare_write_pte+0xb8>
f0013e78:	e59f2048 	ldr	r2, [pc, #72]	; f0013ec8 <arch_prepare_write_pte+0xbc>
f0013e7c:	e3a0309a 	mov	r3, #154	; 0x9a
f0013e80:	eb000819 	bl	f0015eec <printk>
f0013e84:	eafffffe 	b	f0013e84 <arch_prepare_write_pte+0x78>
f0013e88:	e24b3008 	sub	r3, fp, #8
f0013e8c:	e51b0014 	ldr	r0, [fp, #-20]
f0013e90:	e51b1018 	ldr	r1, [fp, #-24]
f0013e94:	e51b201c 	ldr	r2, [fp, #-28]
f0013e98:	ebffff9c 	bl	f0013d10 <arch_prepare_pte>
f0013e9c:	e51b2008 	ldr	r2, [fp, #-8]
f0013ea0:	e51b3010 	ldr	r3, [fp, #-16]
f0013ea4:	e5933000 	ldr	r3, [r3]
f0013ea8:	e59b0004 	ldr	r0, [fp, #4]
f0013eac:	e1a01002 	mov	r1, r2
f0013eb0:	e51b2018 	ldr	r2, [fp, #-24]
f0013eb4:	ebffffc5 	bl	f0013dd0 <arch_write_pte>
f0013eb8:	e24bd004 	sub	sp, fp, #4
f0013ebc:	e8bd8800 	pop	{fp, pc}
f0013ec0:	f001f15c 	.word	0xf001f15c
f0013ec4:	f001f184 	.word	0xf001f184
f0013ec8:	f001f234 	.word	0xf001f234

f0013ecc <arch_pick_pmd>:
f0013ecc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f0013ed0:	e28db000 	add	fp, sp, #0
f0013ed4:	e24dd00c 	sub	sp, sp, #12
f0013ed8:	e50b0008 	str	r0, [fp, #-8]
f0013edc:	e50b100c 	str	r1, [fp, #-12]
f0013ee0:	e51b300c 	ldr	r3, [fp, #-12]
f0013ee4:	e1a02923 	lsr	r2, r3, #18
f0013ee8:	e59f3020 	ldr	r3, [pc, #32]	; f0013f10 <arch_pick_pmd+0x44>
f0013eec:	e0023003 	and	r3, r2, r3
f0013ef0:	e1a03123 	lsr	r3, r3, #2
f0013ef4:	e1a03103 	lsl	r3, r3, #2
f0013ef8:	e51b2008 	ldr	r2, [fp, #-8]
f0013efc:	e0823003 	add	r3, r2, r3
f0013f00:	e1a00003 	mov	r0, r3
f0013f04:	e24bd000 	sub	sp, fp, #0
f0013f08:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0013f0c:	e12fff1e 	bx	lr
f0013f10:	00003ffc 	.word	0x00003ffc

f0013f14 <arch_write_pmd>:
f0013f14:	e92d4800 	push	{fp, lr}
f0013f18:	e28db004 	add	fp, sp, #4
f0013f1c:	e24dd010 	sub	sp, sp, #16
f0013f20:	e50b0008 	str	r0, [fp, #-8]
f0013f24:	e50b100c 	str	r1, [fp, #-12]
f0013f28:	e50b2010 	str	r2, [fp, #-16]
f0013f2c:	e50b3014 	str	r3, [fp, #-20]
f0013f30:	e51b300c 	ldr	r3, [fp, #-12]
f0013f34:	e3832001 	orr	r2, r3, #1
f0013f38:	e51b3008 	ldr	r3, [fp, #-8]
f0013f3c:	e5832000 	str	r2, [r3]
f0013f40:	eb000299 	bl	f00149ac <arm_clean_invalidate_cache>
f0013f44:	eb0002a0 	bl	f00149cc <arm_invalidate_tlb>
f0013f48:	e24bd004 	sub	sp, fp, #4
f0013f4c:	e8bd8800 	pop	{fp, pc}

f0013f50 <arch_check_pte_access_perms>:
f0013f50:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f0013f54:	e28db000 	add	fp, sp, #0
f0013f58:	e24dd00c 	sub	sp, sp, #12
f0013f5c:	e50b0008 	str	r0, [fp, #-8]
f0013f60:	e50b100c 	str	r1, [fp, #-12]
f0013f64:	e51b3008 	ldr	r3, [fp, #-8]
f0013f68:	e2032eff 	and	r2, r3, #4080	; 0xff0
f0013f6c:	e51b300c 	ldr	r3, [fp, #-12]
f0013f70:	e2033eff 	and	r3, r3, #4080	; 0xff0
f0013f74:	e1520003 	cmp	r2, r3
f0013f78:	3a000001 	bcc	f0013f84 <arch_check_pte_access_perms+0x34>
f0013f7c:	e3a03001 	mov	r3, #1
f0013f80:	ea000000 	b	f0013f88 <arch_check_pte_access_perms+0x38>
f0013f84:	e3a03000 	mov	r3, #0
f0013f88:	e1a00003 	mov	r0, r3
f0013f8c:	e24bd000 	sub	sp, fp, #0
f0013f90:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0013f94:	e12fff1e 	bx	lr

f0013f98 <is_global_pgdi>:
f0013f98:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f0013f9c:	e28db000 	add	fp, sp, #0
f0013fa0:	e24dd00c 	sub	sp, sp, #12
f0013fa4:	e50b0008 	str	r0, [fp, #-8]
f0013fa8:	e51b3008 	ldr	r3, [fp, #-8]
f0013fac:	e3530c0f 	cmp	r3, #3840	; 0xf00
f0013fb0:	3a000002 	bcc	f0013fc0 <is_global_pgdi+0x28>
f0013fb4:	e51b3008 	ldr	r3, [fp, #-8]
f0013fb8:	e3530d3e 	cmp	r3, #3968	; 0xf80
f0013fbc:	3a000014 	bcc	f0014014 <is_global_pgdi+0x7c>
f0013fc0:	e51b3008 	ldr	r3, [fp, #-8]
f0013fc4:	e3530ef9 	cmp	r3, #3984	; 0xf90
f0013fc8:	3a000002 	bcc	f0013fd8 <is_global_pgdi+0x40>
f0013fcc:	e51b3008 	ldr	r3, [fp, #-8]
f0013fd0:	e3530eff 	cmp	r3, #4080	; 0xff0
f0013fd4:	3a00000e 	bcc	f0014014 <is_global_pgdi+0x7c>
f0013fd8:	e51b3008 	ldr	r3, [fp, #-8]
f0013fdc:	e3530eff 	cmp	r3, #4080	; 0xff0
f0013fe0:	0a00000b 	beq	f0014014 <is_global_pgdi+0x7c>
f0013fe4:	e51b2008 	ldr	r2, [fp, #-8]
f0013fe8:	e59f3040 	ldr	r3, [pc, #64]	; f0014030 <is_global_pgdi+0x98>
f0013fec:	e1520003 	cmp	r2, r3
f0013ff0:	0a000007 	beq	f0014014 <is_global_pgdi+0x7c>
f0013ff4:	e51b2008 	ldr	r2, [fp, #-8]
f0013ff8:	e59f3030 	ldr	r3, [pc, #48]	; f0014030 <is_global_pgdi+0x98>
f0013ffc:	e1520003 	cmp	r2, r3
f0014000:	0a000003 	beq	f0014014 <is_global_pgdi+0x7c>
f0014004:	e51b2008 	ldr	r2, [fp, #-8]
f0014008:	e59f3024 	ldr	r3, [pc, #36]	; f0014034 <is_global_pgdi+0x9c>
f001400c:	e1520003 	cmp	r2, r3
f0014010:	1a000001 	bne	f001401c <is_global_pgdi+0x84>
f0014014:	e3a03001 	mov	r3, #1
f0014018:	ea000000 	b	f0014020 <is_global_pgdi+0x88>
f001401c:	e3a03000 	mov	r3, #0
f0014020:	e1a00003 	mov	r0, r3
f0014024:	e24bd000 	sub	sp, fp, #0
f0014028:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f001402c:	e12fff1e 	bx	lr
f0014030:	00000fff 	.word	0x00000fff
f0014034:	00000f98 	.word	0x00000f98

f0014038 <remove_mapping_pgd_all_user>:
f0014038:	e92d4800 	push	{fp, lr}
f001403c:	e28db004 	add	fp, sp, #4
f0014040:	e24dd018 	sub	sp, sp, #24
f0014044:	e50b0018 	str	r0, [fp, #-24]
f0014048:	e50b101c 	str	r1, [fp, #-28]
f001404c:	e51b3018 	ldr	r3, [fp, #-24]
f0014050:	e5933010 	ldr	r3, [r3, #16]
f0014054:	e50b300c 	str	r3, [fp, #-12]
f0014058:	e3a03000 	mov	r3, #0
f001405c:	e50b3008 	str	r3, [fp, #-8]
f0014060:	ea00001b 	b	f00140d4 <remove_mapping_pgd_all_user+0x9c>
f0014064:	e51b0008 	ldr	r0, [fp, #-8]
f0014068:	ebffffca 	bl	f0013f98 <is_global_pgdi>
f001406c:	e1a03000 	mov	r3, r0
f0014070:	e3530000 	cmp	r3, #0
f0014074:	1a000013 	bne	f00140c8 <remove_mapping_pgd_all_user+0x90>
f0014078:	e51b300c 	ldr	r3, [fp, #-12]
f001407c:	e51b2008 	ldr	r2, [fp, #-8]
f0014080:	e7933102 	ldr	r3, [r3, r2, lsl #2]
f0014084:	e2033003 	and	r3, r3, #3
f0014088:	e3530001 	cmp	r3, #1
f001408c:	1a000009 	bne	f00140b8 <remove_mapping_pgd_all_user+0x80>
f0014090:	e51b300c 	ldr	r3, [fp, #-12]
f0014094:	e51b2008 	ldr	r2, [fp, #-8]
f0014098:	e7933102 	ldr	r3, [r3, r2, lsl #2]
f001409c:	e3c33fff 	bic	r3, r3, #1020	; 0x3fc
f00140a0:	e3c33003 	bic	r3, r3, #3
f00140a4:	e283320f 	add	r3, r3, #-268435456	; 0xf0000000
f00140a8:	e50b3010 	str	r3, [fp, #-16]
f00140ac:	e51b0010 	ldr	r0, [fp, #-16]
f00140b0:	e51b101c 	ldr	r1, [fp, #-28]
f00140b4:	ebffdfb2 	bl	f000bf84 <pmd_cap_free>
f00140b8:	e51b300c 	ldr	r3, [fp, #-12]
f00140bc:	e51b2008 	ldr	r2, [fp, #-8]
f00140c0:	e3a01000 	mov	r1, #0
f00140c4:	e7831102 	str	r1, [r3, r2, lsl #2]
f00140c8:	e51b3008 	ldr	r3, [fp, #-8]
f00140cc:	e2833001 	add	r3, r3, #1
f00140d0:	e50b3008 	str	r3, [fp, #-8]
f00140d4:	e51b3008 	ldr	r3, [fp, #-8]
f00140d8:	e3530a01 	cmp	r3, #4096	; 0x1000
f00140dc:	baffffe0 	blt	f0014064 <remove_mapping_pgd_all_user+0x2c>
f00140e0:	e24bd004 	sub	sp, fp, #4
f00140e4:	e8bd8800 	pop	{fp, pc}

f00140e8 <arch_realloc_page_tables>:
f00140e8:	e92d4800 	push	{fp, lr}
f00140ec:	e28db004 	add	fp, sp, #4
f00140f0:	e24dd018 	sub	sp, sp, #24
f00140f4:	ebffdefb 	bl	f000bce8 <pgd_alloc>
f00140f8:	e50b000c 	str	r0, [fp, #-12]
f00140fc:	e59f313c 	ldr	r3, [pc, #316]	; f0014240 <arch_realloc_page_tables+0x158>
f0014100:	e50b3010 	str	r3, [fp, #-16]
f0014104:	e51b000c 	ldr	r0, [fp, #-12]
f0014108:	e51b1010 	ldr	r1, [fp, #-16]
f001410c:	e3a02901 	mov	r2, #16384	; 0x4000
f0014110:	eb0007ae 	bl	f0015fd0 <memcpy>
f0014114:	e3a03000 	mov	r3, #0
f0014118:	e50b3008 	str	r3, [fp, #-8]
f001411c:	ea000031 	b	f00141e8 <arch_realloc_page_tables+0x100>
f0014120:	e51b3010 	ldr	r3, [fp, #-16]
f0014124:	e51b2008 	ldr	r2, [fp, #-8]
f0014128:	e7933102 	ldr	r3, [r3, r2, lsl #2]
f001412c:	e2033003 	and	r3, r3, #3
f0014130:	e3530001 	cmp	r3, #1
f0014134:	1a000028 	bne	f00141dc <arch_realloc_page_tables+0xf4>
f0014138:	ebfffe67 	bl	f0013adc <current_task>
f001413c:	e1a03000 	mov	r3, r0
f0014140:	e59330b4 	ldr	r3, [r3, #180]	; 0xb4
f0014144:	e2833014 	add	r3, r3, #20
f0014148:	e1a00003 	mov	r0, r3
f001414c:	ebffdef1 	bl	f000bd18 <pmd_cap_alloc>
f0014150:	e50b0014 	str	r0, [fp, #-20]
f0014154:	e51b3014 	ldr	r3, [fp, #-20]
f0014158:	e3530000 	cmp	r3, #0
f001415c:	1a000007 	bne	f0014180 <arch_realloc_page_tables+0x98>
f0014160:	e59f00dc 	ldr	r0, [pc, #220]	; f0014244 <arch_realloc_page_tables+0x15c>
f0014164:	eb000760 	bl	f0015eec <printk>
f0014168:	e59f00d8 	ldr	r0, [pc, #216]	; f0014248 <arch_realloc_page_tables+0x160>
f001416c:	e59f10d8 	ldr	r1, [pc, #216]	; f001424c <arch_realloc_page_tables+0x164>
f0014170:	e59f20d8 	ldr	r2, [pc, #216]	; f0014250 <arch_realloc_page_tables+0x168>
f0014174:	e59f30d8 	ldr	r3, [pc, #216]	; f0014254 <arch_realloc_page_tables+0x16c>
f0014178:	eb00075b 	bl	f0015eec <printk>
f001417c:	eafffffe 	b	f001417c <arch_realloc_page_tables+0x94>
f0014180:	e51b3010 	ldr	r3, [fp, #-16]
f0014184:	e51b2008 	ldr	r2, [fp, #-8]
f0014188:	e7933102 	ldr	r3, [r3, r2, lsl #2]
f001418c:	e3c33fff 	bic	r3, r3, #1020	; 0x3fc
f0014190:	e3c33003 	bic	r3, r3, #3
f0014194:	e283320f 	add	r3, r3, #-268435456	; 0xf0000000
f0014198:	e50b3018 	str	r3, [fp, #-24]
f001419c:	e51b0014 	ldr	r0, [fp, #-20]
f00141a0:	e51b1018 	ldr	r1, [fp, #-24]
f00141a4:	e3a02b01 	mov	r2, #1024	; 0x400
f00141a8:	eb000788 	bl	f0015fd0 <memcpy>
f00141ac:	e51b3014 	ldr	r3, [fp, #-20]
f00141b0:	e2831201 	add	r1, r3, #268435456	; 0x10000000
f00141b4:	e51b300c 	ldr	r3, [fp, #-12]
f00141b8:	e51b2008 	ldr	r2, [fp, #-8]
f00141bc:	e7831102 	str	r1, [r3, r2, lsl #2]
f00141c0:	e51b300c 	ldr	r3, [fp, #-12]
f00141c4:	e51b2008 	ldr	r2, [fp, #-8]
f00141c8:	e7933102 	ldr	r3, [r3, r2, lsl #2]
f00141cc:	e3831001 	orr	r1, r3, #1
f00141d0:	e51b300c 	ldr	r3, [fp, #-12]
f00141d4:	e51b2008 	ldr	r2, [fp, #-8]
f00141d8:	e7831102 	str	r1, [r3, r2, lsl #2]
f00141dc:	e51b3008 	ldr	r3, [fp, #-8]
f00141e0:	e2833001 	add	r3, r3, #1
f00141e4:	e50b3008 	str	r3, [fp, #-8]
f00141e8:	e51b3008 	ldr	r3, [fp, #-8]
f00141ec:	e3530a01 	cmp	r3, #4096	; 0x1000
f00141f0:	baffffca 	blt	f0014120 <arch_realloc_page_tables+0x38>
f00141f4:	eb0001ec 	bl	f00149ac <arm_clean_invalidate_cache>
f00141f8:	eb0001f0 	bl	f00149c0 <arm_drain_writebuffer>
f00141fc:	eb0001f2 	bl	f00149cc <arm_invalidate_tlb>
f0014200:	e51b300c 	ldr	r3, [fp, #-12]
f0014204:	e2833201 	add	r3, r3, #268435456	; 0x10000000
f0014208:	e1a00003 	mov	r0, r3
f001420c:	eb0001bb 	bl	f0014900 <arm_set_ttb>
f0014210:	eb0001ed 	bl	f00149cc <arm_invalidate_tlb>
f0014214:	e51b3010 	ldr	r3, [fp, #-16]
f0014218:	e2832201 	add	r2, r3, #268435456	; 0x10000000
f001421c:	e51b300c 	ldr	r3, [fp, #-12]
f0014220:	e2833201 	add	r3, r3, #268435456	; 0x10000000
f0014224:	e59f002c 	ldr	r0, [pc, #44]	; f0014258 <arch_realloc_page_tables+0x170>
f0014228:	e59f102c 	ldr	r1, [pc, #44]	; f001425c <arch_realloc_page_tables+0x174>
f001422c:	eb00072e 	bl	f0015eec <printk>
f0014230:	e51b300c 	ldr	r3, [fp, #-12]
f0014234:	e1a00003 	mov	r0, r3
f0014238:	e24bd004 	sub	sp, fp, #4
f001423c:	e8bd8800 	pop	{fp, pc}
f0014240:	f0028000 	.word	0xf0028000
f0014244:	f001f1a0 	.word	0xf001f1a0
f0014248:	f001f15c 	.word	0xf001f15c
f001424c:	f001f184 	.word	0xf001f184
f0014250:	f001f24c 	.word	0xf001f24c
f0014254:	00000101 	.word	0x00000101
f0014258:	f001f1dc 	.word	0xf001f1dc
f001425c:	f001f218 	.word	0xf001f218

f0014260 <copy_pgd_global_by_vrange>:
f0014260:	e92d4800 	push	{fp, lr}
f0014264:	e28db004 	add	fp, sp, #4
f0014268:	e24dd010 	sub	sp, sp, #16
f001426c:	e50b0008 	str	r0, [fp, #-8]
f0014270:	e50b100c 	str	r1, [fp, #-12]
f0014274:	e50b2010 	str	r2, [fp, #-16]
f0014278:	e50b3014 	str	r3, [fp, #-20]
f001427c:	e51b3010 	ldr	r3, [fp, #-16]
f0014280:	e1a03a23 	lsr	r3, r3, #20
f0014284:	e1a03a03 	lsl	r3, r3, #20
f0014288:	e50b3010 	str	r3, [fp, #-16]
f001428c:	e51b2014 	ldr	r2, [fp, #-20]
f0014290:	e51b3010 	ldr	r3, [fp, #-16]
f0014294:	e1520003 	cmp	r2, r3
f0014298:	2a000001 	bcs	f00142a4 <copy_pgd_global_by_vrange+0x44>
f001429c:	e3a03000 	mov	r3, #0
f00142a0:	e50b3014 	str	r3, [fp, #-20]
f00142a4:	e51b3014 	ldr	r3, [fp, #-20]
f00142a8:	e3730601 	cmn	r3, #1048576	; 0x100000
f00142ac:	3a000003 	bcc	f00142c0 <copy_pgd_global_by_vrange+0x60>
f00142b0:	e51b2010 	ldr	r2, [fp, #-16]
f00142b4:	e51b3014 	ldr	r3, [fp, #-20]
f00142b8:	e1520003 	cmp	r2, r3
f00142bc:	9a000006 	bls	f00142dc <copy_pgd_global_by_vrange+0x7c>
f00142c0:	e51b3014 	ldr	r3, [fp, #-20]
f00142c4:	e243337f 	sub	r3, r3, #-67108863	; 0xfc000001
f00142c8:	e243363f 	sub	r3, r3, #66060288	; 0x3f00000
f00142cc:	e1a03a23 	lsr	r3, r3, #20
f00142d0:	e1a03a03 	lsl	r3, r3, #20
f00142d4:	e50b3014 	str	r3, [fp, #-20]
f00142d8:	ea000001 	b	f00142e4 <copy_pgd_global_by_vrange+0x84>
f00142dc:	e3a03000 	mov	r3, #0
f00142e0:	e50b3014 	str	r3, [fp, #-20]
f00142e4:	e51b0008 	ldr	r0, [fp, #-8]
f00142e8:	e51b100c 	ldr	r1, [fp, #-12]
f00142ec:	e51b2010 	ldr	r2, [fp, #-16]
f00142f0:	e51b3014 	ldr	r3, [fp, #-20]
f00142f4:	eb000001 	bl	f0014300 <copy_pgds_by_vrange>
f00142f8:	e24bd004 	sub	sp, fp, #4
f00142fc:	e8bd8800 	pop	{fp, pc}

f0014300 <copy_pgds_by_vrange>:
f0014300:	e92d4800 	push	{fp, lr}
f0014304:	e28db004 	add	fp, sp, #4
f0014308:	e24dd020 	sub	sp, sp, #32
f001430c:	e50b0018 	str	r0, [fp, #-24]
f0014310:	e50b101c 	str	r1, [fp, #-28]
f0014314:	e50b2020 	str	r2, [fp, #-32]
f0014318:	e50b3024 	str	r3, [fp, #-36]	; 0x24
f001431c:	e51b3020 	ldr	r3, [fp, #-32]
f0014320:	e1a02923 	lsr	r2, r3, #18
f0014324:	e59f3088 	ldr	r3, [pc, #136]	; f00143b4 <copy_pgds_by_vrange+0xb4>
f0014328:	e0023003 	and	r3, r2, r3
f001432c:	e1a03123 	lsr	r3, r3, #2
f0014330:	e50b3008 	str	r3, [fp, #-8]
f0014334:	e51b3024 	ldr	r3, [fp, #-36]	; 0x24
f0014338:	e1a02923 	lsr	r2, r3, #18
f001433c:	e59f3070 	ldr	r3, [pc, #112]	; f00143b4 <copy_pgds_by_vrange+0xb4>
f0014340:	e0023003 	and	r3, r2, r3
f0014344:	e1a03123 	lsr	r3, r3, #2
f0014348:	e50b300c 	str	r3, [fp, #-12]
f001434c:	e51b300c 	ldr	r3, [fp, #-12]
f0014350:	e3530000 	cmp	r3, #0
f0014354:	0a000003 	beq	f0014368 <copy_pgds_by_vrange+0x68>
f0014358:	e51b200c 	ldr	r2, [fp, #-12]
f001435c:	e51b3008 	ldr	r3, [fp, #-8]
f0014360:	e0633002 	rsb	r3, r3, r2
f0014364:	ea000001 	b	f0014370 <copy_pgds_by_vrange+0x70>
f0014368:	e51b3008 	ldr	r3, [fp, #-8]
f001436c:	e2633a01 	rsb	r3, r3, #4096	; 0x1000
f0014370:	e50b3010 	str	r3, [fp, #-16]
f0014374:	e51b3008 	ldr	r3, [fp, #-8]
f0014378:	e1a03103 	lsl	r3, r3, #2
f001437c:	e51b2018 	ldr	r2, [fp, #-24]
f0014380:	e0821003 	add	r1, r2, r3
f0014384:	e51b3008 	ldr	r3, [fp, #-8]
f0014388:	e1a03103 	lsl	r3, r3, #2
f001438c:	e51b201c 	ldr	r2, [fp, #-28]
f0014390:	e0822003 	add	r2, r2, r3
f0014394:	e51b3010 	ldr	r3, [fp, #-16]
f0014398:	e1a03103 	lsl	r3, r3, #2
f001439c:	e1a00001 	mov	r0, r1
f00143a0:	e1a01002 	mov	r1, r2
f00143a4:	e1a02003 	mov	r2, r3
f00143a8:	eb000708 	bl	f0015fd0 <memcpy>
f00143ac:	e24bd004 	sub	sp, fp, #4
f00143b0:	e8bd8800 	pop	{fp, pc}
f00143b4:	00003ffc 	.word	0x00003ffc

f00143b8 <arch_copy_pgd_kernel_entries>:
f00143b8:	e92d4800 	push	{fp, lr}
f00143bc:	e28db004 	add	fp, sp, #4
f00143c0:	e24dd010 	sub	sp, sp, #16
f00143c4:	e50b0010 	str	r0, [fp, #-16]
f00143c8:	ebfffdc3 	bl	f0013adc <current_task>
f00143cc:	e1a03000 	mov	r3, r0
f00143d0:	e59330b4 	ldr	r3, [r3, #180]	; 0xb4
f00143d4:	e5933010 	ldr	r3, [r3, #16]
f00143d8:	e50b3008 	str	r3, [fp, #-8]
f00143dc:	e51b0010 	ldr	r0, [fp, #-16]
f00143e0:	e51b1008 	ldr	r1, [fp, #-8]
f00143e4:	e3a0220f 	mov	r2, #-268435456	; 0xf0000000
f00143e8:	e3a0333e 	mov	r3, #-134217728	; 0xf8000000
f00143ec:	ebffff9b 	bl	f0014260 <copy_pgd_global_by_vrange>
f00143f0:	e51b0010 	ldr	r0, [fp, #-16]
f00143f4:	e51b1008 	ldr	r1, [fp, #-8]
f00143f8:	e3a024f9 	mov	r2, #-117440512	; 0xf9000000
f00143fc:	e3a034ff 	mov	r3, #-16777216	; 0xff000000
f0014400:	ebffff96 	bl	f0014260 <copy_pgd_global_by_vrange>
f0014404:	e51b0010 	ldr	r0, [fp, #-16]
f0014408:	e51b1008 	ldr	r1, [fp, #-8]
f001440c:	e3a024ff 	mov	r2, #-16777216	; 0xff000000
f0014410:	e59f3044 	ldr	r3, [pc, #68]	; f001445c <arch_copy_pgd_kernel_entries+0xa4>
f0014414:	ebffff91 	bl	f0014260 <copy_pgd_global_by_vrange>
f0014418:	e51b0010 	ldr	r0, [fp, #-16]
f001441c:	e51b1008 	ldr	r1, [fp, #-8]
f0014420:	e59f2038 	ldr	r2, [pc, #56]	; f0014460 <arch_copy_pgd_kernel_entries+0xa8>
f0014424:	e59f3038 	ldr	r3, [pc, #56]	; f0014464 <arch_copy_pgd_kernel_entries+0xac>
f0014428:	ebffff8c 	bl	f0014260 <copy_pgd_global_by_vrange>
f001442c:	e51b0010 	ldr	r0, [fp, #-16]
f0014430:	e51b1008 	ldr	r1, [fp, #-8]
f0014434:	e3e020ff 	mvn	r2, #255	; 0xff
f0014438:	e3a03c0f 	mov	r3, #3840	; 0xf00
f001443c:	ebffff87 	bl	f0014260 <copy_pgd_global_by_vrange>
f0014440:	e51b0010 	ldr	r0, [fp, #-16]
f0014444:	e51b1008 	ldr	r1, [fp, #-8]
f0014448:	e59f2018 	ldr	r2, [pc, #24]	; f0014468 <arch_copy_pgd_kernel_entries+0xb0>
f001444c:	e59f3018 	ldr	r3, [pc, #24]	; f001446c <arch_copy_pgd_kernel_entries+0xb4>
f0014450:	ebffff82 	bl	f0014260 <copy_pgd_global_by_vrange>
f0014454:	e24bd004 	sub	sp, fp, #4
f0014458:	e8bd8800 	pop	{fp, pc}
f001445c:	ff001000 	.word	0xff001000
f0014460:	ffff0000 	.word	0xffff0000
f0014464:	ffff1000 	.word	0xffff1000
f0014468:	f9800000 	.word	0xf9800000
f001446c:	f9801000 	.word	0xf9801000

f0014470 <arch_update_utcb>:
f0014470:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f0014474:	e28db000 	add	fp, sp, #0
f0014478:	e24dd00c 	sub	sp, sp, #12
f001447c:	e50b0008 	str	r0, [fp, #-8]
f0014480:	e59f3048 	ldr	r3, [pc, #72]	; f00144d0 <arch_update_utcb+0x60>
f0014484:	e55b2008 	ldrb	r2, [fp, #-8]
f0014488:	e3a01000 	mov	r1, #0
f001448c:	e1812002 	orr	r2, r1, r2
f0014490:	e5c32054 	strb	r2, [r3, #84]	; 0x54
f0014494:	e55b2007 	ldrb	r2, [fp, #-7]
f0014498:	e3a01000 	mov	r1, #0
f001449c:	e1812002 	orr	r2, r1, r2
f00144a0:	e5c32055 	strb	r2, [r3, #85]	; 0x55
f00144a4:	e55b2006 	ldrb	r2, [fp, #-6]
f00144a8:	e3a01000 	mov	r1, #0
f00144ac:	e1812002 	orr	r2, r1, r2
f00144b0:	e5c32056 	strb	r2, [r3, #86]	; 0x56
f00144b4:	e55b2005 	ldrb	r2, [fp, #-5]
f00144b8:	e3a01000 	mov	r1, #0
f00144bc:	e1812002 	orr	r2, r1, r2
f00144c0:	e5c32057 	strb	r2, [r3, #87]	; 0x57
f00144c4:	e24bd000 	sub	sp, fp, #0
f00144c8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f00144cc:	e12fff1e 	bx	lr
f00144d0:	f0025000 	.word	0xf0025000

f00144d4 <arch_space_switch>:
f00144d4:	e92d4800 	push	{fp, lr}
f00144d8:	e28db004 	add	fp, sp, #4
f00144dc:	e24dd010 	sub	sp, sp, #16
f00144e0:	e50b0010 	str	r0, [fp, #-16]
f00144e4:	e51b3010 	ldr	r3, [fp, #-16]
f00144e8:	e59330b4 	ldr	r3, [r3, #180]	; 0xb4
f00144ec:	e5933010 	ldr	r3, [r3, #16]
f00144f0:	e50b3008 	str	r3, [fp, #-8]
f00144f4:	ebfffd81 	bl	f0013b00 <system_account_space_switch>
f00144f8:	eb00012b 	bl	f00149ac <arm_clean_invalidate_cache>
f00144fc:	eb000132 	bl	f00149cc <arm_invalidate_tlb>
f0014500:	e51b3008 	ldr	r3, [fp, #-8]
f0014504:	e2833201 	add	r3, r3, #268435456	; 0x10000000
f0014508:	e1a00003 	mov	r0, r3
f001450c:	eb0000fb 	bl	f0014900 <arm_set_ttb>
f0014510:	eb00012d 	bl	f00149cc <arm_invalidate_tlb>
f0014514:	e24bd004 	sub	sp, fp, #4
f0014518:	e8bd8800 	pop	{fp, pc}

f001451c <idle_task>:
f001451c:	e92d4800 	push	{fp, lr}
f0014520:	e28db004 	add	fp, sp, #4
f0014524:	ebffd9ed 	bl	f000ace0 <tcb_delete_zombies>
f0014528:	e59f3014 	ldr	r3, [pc, #20]	; f0014544 <idle_task+0x28>
f001452c:	e5933000 	ldr	r3, [r3]
f0014530:	e3c32001 	bic	r2, r3, #1
f0014534:	e59f3008 	ldr	r3, [pc, #8]	; f0014544 <idle_task+0x28>
f0014538:	e5832000 	str	r2, [r3]
f001453c:	ebffd39c 	bl	f00093b4 <schedule>
f0014540:	eafffff7 	b	f0014524 <idle_task+0x8>
f0014544:	f002d02c 	.word	0xf002d02c

f0014548 <is_user_mode>:
f0014548:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f001454c:	e28db000 	add	fp, sp, #0
f0014550:	e24dd00c 	sub	sp, sp, #12
f0014554:	e50b0008 	str	r0, [fp, #-8]
f0014558:	e51b3008 	ldr	r3, [fp, #-8]
f001455c:	e203301f 	and	r3, r3, #31
f0014560:	e3530010 	cmp	r3, #16
f0014564:	13a03000 	movne	r3, #0
f0014568:	03a03001 	moveq	r3, #1
f001456c:	e20330ff 	and	r3, r3, #255	; 0xff
f0014570:	e1a00003 	mov	r0, r3
f0014574:	e24bd000 	sub	sp, fp, #0
f0014578:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f001457c:	e12fff1e 	bx	lr

f0014580 <check_abort_type>:
f0014580:	e92d4800 	push	{fp, lr}
f0014584:	e28db004 	add	fp, sp, #4
f0014588:	e24dd018 	sub	sp, sp, #24
f001458c:	e50b0010 	str	r0, [fp, #-16]
f0014590:	e50b1014 	str	r1, [fp, #-20]
f0014594:	e50b2018 	str	r2, [fp, #-24]
f0014598:	e50b301c 	str	r3, [fp, #-28]
f001459c:	e3a03000 	mov	r3, #0
f00145a0:	e50b3008 	str	r3, [fp, #-8]
f00145a4:	e51b3014 	ldr	r3, [fp, #-20]
f00145a8:	e2033c01 	and	r3, r3, #256	; 0x100
f00145ac:	e3530000 	cmp	r3, #0
f00145b0:	0a00000e 	beq	f00145f0 <check_abort_type+0x70>
f00145b4:	e51b001c 	ldr	r0, [fp, #-28]
f00145b8:	ebffffe2 	bl	f0014548 <is_user_mode>
f00145bc:	e1a03000 	mov	r3, r0
f00145c0:	e3530000 	cmp	r3, #0
f00145c4:	1a000007 	bne	f00145e8 <check_abort_type+0x68>
f00145c8:	e59f02ec 	ldr	r0, [pc, #748]	; f00148bc <check_abort_type+0x33c>
f00145cc:	eb00252c 	bl	f001da84 <print_early>
f00145d0:	e51b0018 	ldr	r0, [fp, #-24]
f00145d4:	eb002557 	bl	f001db38 <printhex8>
f00145d8:	e59f02e0 	ldr	r0, [pc, #736]	; f00148c0 <check_abort_type+0x340>
f00145dc:	eb002528 	bl	f001da84 <print_early>
f00145e0:	e3e03089 	mvn	r3, #137	; 0x89
f00145e4:	ea0000b1 	b	f00148b0 <check_abort_type+0x330>
f00145e8:	e3a03000 	mov	r3, #0
f00145ec:	ea0000af 	b	f00148b0 <check_abort_type+0x330>
f00145f0:	e51b3014 	ldr	r3, [fp, #-20]
f00145f4:	e203300f 	and	r3, r3, #15
f00145f8:	e353000f 	cmp	r3, #15
f00145fc:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
f0014600:	ea000084 	b	f0014818 <check_abort_type+0x298>
f0014604:	f001468c 	.word	0xf001468c
f0014608:	f00146b0 	.word	0xf00146b0
f001460c:	f0014668 	.word	0xf0014668
f0014610:	f0014818 	.word	0xf0014818
f0014614:	f0014788 	.word	0xf0014788
f0014618:	f001465c 	.word	0xf001465c
f001461c:	f00147ac 	.word	0xf00147ac
f0014620:	f0014650 	.word	0xf0014650
f0014624:	f00147d0 	.word	0xf00147d0
f0014628:	f001471c 	.word	0xf001471c
f001462c:	f00147f4 	.word	0xf00147f4
f0014630:	f0014740 	.word	0xf0014740
f0014634:	f00146d4 	.word	0xf00146d4
f0014638:	f0014764 	.word	0xf0014764
f001463c:	f00146f8 	.word	0xf00146f8
f0014640:	f0014644 	.word	0xf0014644
f0014644:	e3a03000 	mov	r3, #0
f0014648:	e50b3008 	str	r3, [fp, #-8]
f001464c:	ea00007f 	b	f0014850 <check_abort_type+0x2d0>
f0014650:	e3a03000 	mov	r3, #0
f0014654:	e50b3008 	str	r3, [fp, #-8]
f0014658:	ea00007c 	b	f0014850 <check_abort_type+0x2d0>
f001465c:	e3a03000 	mov	r3, #0
f0014660:	e50b3008 	str	r3, [fp, #-8]
f0014664:	ea000079 	b	f0014850 <check_abort_type+0x2d0>
f0014668:	e59f0254 	ldr	r0, [pc, #596]	; f00148c4 <check_abort_type+0x344>
f001466c:	eb002504 	bl	f001da84 <print_early>
f0014670:	e51b0018 	ldr	r0, [fp, #-24]
f0014674:	eb00252f 	bl	f001db38 <printhex8>
f0014678:	e59f0240 	ldr	r0, [pc, #576]	; f00148c0 <check_abort_type+0x340>
f001467c:	eb002500 	bl	f001da84 <print_early>
f0014680:	e3e03089 	mvn	r3, #137	; 0x89
f0014684:	e50b3008 	str	r3, [fp, #-8]
f0014688:	ea000070 	b	f0014850 <check_abort_type+0x2d0>
f001468c:	e59f0234 	ldr	r0, [pc, #564]	; f00148c8 <check_abort_type+0x348>
f0014690:	eb0024fb 	bl	f001da84 <print_early>
f0014694:	e51b0018 	ldr	r0, [fp, #-24]
f0014698:	eb002526 	bl	f001db38 <printhex8>
f001469c:	e59f021c 	ldr	r0, [pc, #540]	; f00148c0 <check_abort_type+0x340>
f00146a0:	eb0024f7 	bl	f001da84 <print_early>
f00146a4:	e3e03089 	mvn	r3, #137	; 0x89
f00146a8:	e50b3008 	str	r3, [fp, #-8]
f00146ac:	ea000067 	b	f0014850 <check_abort_type+0x2d0>
f00146b0:	e59f0214 	ldr	r0, [pc, #532]	; f00148cc <check_abort_type+0x34c>
f00146b4:	eb0024f2 	bl	f001da84 <print_early>
f00146b8:	e51b0018 	ldr	r0, [fp, #-24]
f00146bc:	eb00251d 	bl	f001db38 <printhex8>
f00146c0:	e59f01f8 	ldr	r0, [pc, #504]	; f00148c0 <check_abort_type+0x340>
f00146c4:	eb0024ee 	bl	f001da84 <print_early>
f00146c8:	e3e03089 	mvn	r3, #137	; 0x89
f00146cc:	e50b3008 	str	r3, [fp, #-8]
f00146d0:	ea00005e 	b	f0014850 <check_abort_type+0x2d0>
f00146d4:	e59f01f4 	ldr	r0, [pc, #500]	; f00148d0 <check_abort_type+0x350>
f00146d8:	eb0024e9 	bl	f001da84 <print_early>
f00146dc:	e51b0018 	ldr	r0, [fp, #-24]
f00146e0:	eb002514 	bl	f001db38 <printhex8>
f00146e4:	e59f01d4 	ldr	r0, [pc, #468]	; f00148c0 <check_abort_type+0x340>
f00146e8:	eb0024e5 	bl	f001da84 <print_early>
f00146ec:	e3e03089 	mvn	r3, #137	; 0x89
f00146f0:	e50b3008 	str	r3, [fp, #-8]
f00146f4:	ea000055 	b	f0014850 <check_abort_type+0x2d0>
f00146f8:	e59f01d4 	ldr	r0, [pc, #468]	; f00148d4 <check_abort_type+0x354>
f00146fc:	eb0024e0 	bl	f001da84 <print_early>
f0014700:	e51b0018 	ldr	r0, [fp, #-24]
f0014704:	eb00250b 	bl	f001db38 <printhex8>
f0014708:	e59f01b0 	ldr	r0, [pc, #432]	; f00148c0 <check_abort_type+0x340>
f001470c:	eb0024dc 	bl	f001da84 <print_early>
f0014710:	e3e03089 	mvn	r3, #137	; 0x89
f0014714:	e50b3008 	str	r3, [fp, #-8]
f0014718:	ea00004c 	b	f0014850 <check_abort_type+0x2d0>
f001471c:	e59f01b4 	ldr	r0, [pc, #436]	; f00148d8 <check_abort_type+0x358>
f0014720:	eb0024d7 	bl	f001da84 <print_early>
f0014724:	e51b0018 	ldr	r0, [fp, #-24]
f0014728:	eb002502 	bl	f001db38 <printhex8>
f001472c:	e59f018c 	ldr	r0, [pc, #396]	; f00148c0 <check_abort_type+0x340>
f0014730:	eb0024d3 	bl	f001da84 <print_early>
f0014734:	e3e03089 	mvn	r3, #137	; 0x89
f0014738:	e50b3008 	str	r3, [fp, #-8]
f001473c:	ea000043 	b	f0014850 <check_abort_type+0x2d0>
f0014740:	e59f0194 	ldr	r0, [pc, #404]	; f00148dc <check_abort_type+0x35c>
f0014744:	eb0024ce 	bl	f001da84 <print_early>
f0014748:	e51b0018 	ldr	r0, [fp, #-24]
f001474c:	eb0024f9 	bl	f001db38 <printhex8>
f0014750:	e59f0168 	ldr	r0, [pc, #360]	; f00148c0 <check_abort_type+0x340>
f0014754:	eb0024ca 	bl	f001da84 <print_early>
f0014758:	e3e03089 	mvn	r3, #137	; 0x89
f001475c:	e50b3008 	str	r3, [fp, #-8]
f0014760:	ea00003a 	b	f0014850 <check_abort_type+0x2d0>
f0014764:	e59f0174 	ldr	r0, [pc, #372]	; f00148e0 <check_abort_type+0x360>
f0014768:	eb0024c5 	bl	f001da84 <print_early>
f001476c:	e51b0018 	ldr	r0, [fp, #-24]
f0014770:	eb0024f0 	bl	f001db38 <printhex8>
f0014774:	e59f0144 	ldr	r0, [pc, #324]	; f00148c0 <check_abort_type+0x340>
f0014778:	eb0024c1 	bl	f001da84 <print_early>
f001477c:	e3e03089 	mvn	r3, #137	; 0x89
f0014780:	e50b3008 	str	r3, [fp, #-8]
f0014784:	ea000031 	b	f0014850 <check_abort_type+0x2d0>
f0014788:	e59f0154 	ldr	r0, [pc, #340]	; f00148e4 <check_abort_type+0x364>
f001478c:	eb0024bc 	bl	f001da84 <print_early>
f0014790:	e51b0018 	ldr	r0, [fp, #-24]
f0014794:	eb0024e7 	bl	f001db38 <printhex8>
f0014798:	e59f0120 	ldr	r0, [pc, #288]	; f00148c0 <check_abort_type+0x340>
f001479c:	eb0024b8 	bl	f001da84 <print_early>
f00147a0:	e3e03089 	mvn	r3, #137	; 0x89
f00147a4:	e50b3008 	str	r3, [fp, #-8]
f00147a8:	ea000028 	b	f0014850 <check_abort_type+0x2d0>
f00147ac:	e59f0134 	ldr	r0, [pc, #308]	; f00148e8 <check_abort_type+0x368>
f00147b0:	eb0024b3 	bl	f001da84 <print_early>
f00147b4:	e51b0018 	ldr	r0, [fp, #-24]
f00147b8:	eb0024de 	bl	f001db38 <printhex8>
f00147bc:	e59f00fc 	ldr	r0, [pc, #252]	; f00148c0 <check_abort_type+0x340>
f00147c0:	eb0024af 	bl	f001da84 <print_early>
f00147c4:	e3e03089 	mvn	r3, #137	; 0x89
f00147c8:	e50b3008 	str	r3, [fp, #-8]
f00147cc:	ea00001f 	b	f0014850 <check_abort_type+0x2d0>
f00147d0:	e59f0114 	ldr	r0, [pc, #276]	; f00148ec <check_abort_type+0x36c>
f00147d4:	eb0024aa 	bl	f001da84 <print_early>
f00147d8:	e51b0018 	ldr	r0, [fp, #-24]
f00147dc:	eb0024d5 	bl	f001db38 <printhex8>
f00147e0:	e59f00d8 	ldr	r0, [pc, #216]	; f00148c0 <check_abort_type+0x340>
f00147e4:	eb0024a6 	bl	f001da84 <print_early>
f00147e8:	e3e03089 	mvn	r3, #137	; 0x89
f00147ec:	e50b3008 	str	r3, [fp, #-8]
f00147f0:	ea000016 	b	f0014850 <check_abort_type+0x2d0>
f00147f4:	e59f00f4 	ldr	r0, [pc, #244]	; f00148f0 <check_abort_type+0x370>
f00147f8:	eb0024a1 	bl	f001da84 <print_early>
f00147fc:	e51b0018 	ldr	r0, [fp, #-24]
f0014800:	eb0024cc 	bl	f001db38 <printhex8>
f0014804:	e59f00b4 	ldr	r0, [pc, #180]	; f00148c0 <check_abort_type+0x340>
f0014808:	eb00249d 	bl	f001da84 <print_early>
f001480c:	e3e03089 	mvn	r3, #137	; 0x89
f0014810:	e50b3008 	str	r3, [fp, #-8]
f0014814:	ea00000d 	b	f0014850 <check_abort_type+0x2d0>
f0014818:	e59f00d4 	ldr	r0, [pc, #212]	; f00148f4 <check_abort_type+0x374>
f001481c:	eb002498 	bl	f001da84 <print_early>
f0014820:	e51b0018 	ldr	r0, [fp, #-24]
f0014824:	eb0024c3 	bl	f001db38 <printhex8>
f0014828:	e59f0090 	ldr	r0, [pc, #144]	; f00148c0 <check_abort_type+0x340>
f001482c:	eb002494 	bl	f001da84 <print_early>
f0014830:	e59f00c0 	ldr	r0, [pc, #192]	; f00148f8 <check_abort_type+0x378>
f0014834:	eb002492 	bl	f001da84 <print_early>
f0014838:	e51b0014 	ldr	r0, [fp, #-20]
f001483c:	eb0024bd 	bl	f001db38 <printhex8>
f0014840:	e59f0078 	ldr	r0, [pc, #120]	; f00148c0 <check_abort_type+0x340>
f0014844:	eb00248e 	bl	f001da84 <print_early>
f0014848:	e3e03089 	mvn	r3, #137	; 0x89
f001484c:	e50b3008 	str	r3, [fp, #-8]
f0014850:	e51b3010 	ldr	r3, [fp, #-16]
f0014854:	e3730211 	cmn	r3, #268435457	; 0x10000001
f0014858:	9a000002 	bls	f0014868 <check_abort_type+0x2e8>
f001485c:	e51b3010 	ldr	r3, [fp, #-16]
f0014860:	e3730342 	cmn	r3, #134217729	; 0x8000001
f0014864:	9a000008 	bls	f001488c <check_abort_type+0x30c>
f0014868:	e51b3010 	ldr	r3, [fp, #-16]
f001486c:	e3730801 	cmn	r3, #65536	; 0x10000
f0014870:	2a000005 	bcs	f001488c <check_abort_type+0x30c>
f0014874:	e51b3010 	ldr	r3, [fp, #-16]
f0014878:	e35304f9 	cmp	r3, #-117440512	; 0xf9000000
f001487c:	3a00000a 	bcc	f00148ac <check_abort_type+0x32c>
f0014880:	e51b3010 	ldr	r3, [fp, #-16]
f0014884:	e35304ff 	cmp	r3, #-16777216	; 0xff000000
f0014888:	2a000007 	bcs	f00148ac <check_abort_type+0x32c>
f001488c:	e59f0068 	ldr	r0, [pc, #104]	; f00148fc <check_abort_type+0x37c>
f0014890:	eb00247b 	bl	f001da84 <print_early>
f0014894:	e51b0010 	ldr	r0, [fp, #-16]
f0014898:	eb0024a6 	bl	f001db38 <printhex8>
f001489c:	e59f001c 	ldr	r0, [pc, #28]	; f00148c0 <check_abort_type+0x340>
f00148a0:	eb002477 	bl	f001da84 <print_early>
f00148a4:	e3e03089 	mvn	r3, #137	; 0x89
f00148a8:	e50b3008 	str	r3, [fp, #-8]
f00148ac:	e51b3008 	ldr	r3, [fp, #-8]
f00148b0:	e1a00003 	mov	r0, r3
f00148b4:	e24bd004 	sub	sp, fp, #4
f00148b8:	e8bd8800 	pop	{fp, pc}
f00148bc:	f001f268 	.word	0xf001f268
f00148c0:	f001f294 	.word	0xf001f294
f00148c4:	f001f298 	.word	0xf001f298
f00148c8:	f001f2b0 	.word	0xf001f2b0
f00148cc:	f001f2cc 	.word	0xf001f2cc
f00148d0:	f001f2e4 	.word	0xf001f2e4
f00148d4:	f001f308 	.word	0xf001f308
f00148d8:	f001f32c 	.word	0xf001f32c
f00148dc:	f001f348 	.word	0xf001f348
f00148e0:	f001f360 	.word	0xf001f360
f00148e4:	f001f380 	.word	0xf001f380
f00148e8:	f001f3a8 	.word	0xf001f3a8
f00148ec:	f001f3c0 	.word	0xf001f3c0
f00148f0:	f001f3ec 	.word	0xf001f3ec
f00148f4:	f001f414 	.word	0xf001f414
f00148f8:	f001f43c 	.word	0xf001f43c
f00148fc:	f001f450 	.word	0xf001f450

f0014900 <arm_set_ttb>:
f0014900:	ee020f10 	mcr	15, 0, r0, cr2, cr0, {0}
f0014904:	e1a0f00e 	mov	pc, lr

f0014908 <arm_get_domain>:
f0014908:	ee130f10 	mrc	15, 0, r0, cr3, cr0, {0}
f001490c:	e1a0f00e 	mov	pc, lr

f0014910 <arm_set_domain>:
f0014910:	ee030f10 	mcr	15, 0, r0, cr3, cr0, {0}
f0014914:	e1a0f00e 	mov	pc, lr

f0014918 <arm_enable_mmu>:
f0014918:	ee110f10 	mrc	15, 0, r0, cr1, cr0, {0}
f001491c:	e3800001 	orr	r0, r0, #1
f0014920:	ee010f10 	mcr	15, 0, r0, cr1, cr0, {0}
f0014924:	e1a0f00e 	mov	pc, lr

f0014928 <arm_enable_icache>:
f0014928:	ee110f10 	mrc	15, 0, r0, cr1, cr0, {0}
f001492c:	e3800a01 	orr	r0, r0, #4096	; 0x1000
f0014930:	ee010f10 	mcr	15, 0, r0, cr1, cr0, {0}
f0014934:	e1a0f00e 	mov	pc, lr

f0014938 <arm_enable_dcache>:
f0014938:	ee110f10 	mrc	15, 0, r0, cr1, cr0, {0}
f001493c:	e3800004 	orr	r0, r0, #4
f0014940:	ee010f10 	mcr	15, 0, r0, cr1, cr0, {0}
f0014944:	e1a0f00e 	mov	pc, lr

f0014948 <arm_enable_wbuffer>:
f0014948:	ee110f10 	mrc	15, 0, r0, cr1, cr0, {0}
f001494c:	e3800008 	orr	r0, r0, #8
f0014950:	ee010f10 	mcr	15, 0, r0, cr1, cr0, {0}
f0014954:	e1a0f00e 	mov	pc, lr

f0014958 <arm_enable_high_vectors>:
f0014958:	ee110f10 	mrc	15, 0, r0, cr1, cr0, {0}
f001495c:	e3800a02 	orr	r0, r0, #8192	; 0x2000
f0014960:	ee010f10 	mcr	15, 0, r0, cr1, cr0, {0}
f0014964:	e1a0f00e 	mov	pc, lr

f0014968 <arm_invalidate_cache>:
f0014968:	e3a00000 	mov	r0, #0
f001496c:	ee070f17 	mcr	15, 0, r0, cr7, cr7, {0}
f0014970:	e1a0f00e 	mov	pc, lr

f0014974 <arm_invalidate_icache>:
f0014974:	e3a00000 	mov	r0, #0
f0014978:	ee070f15 	mcr	15, 0, r0, cr7, cr5, {0}
f001497c:	e1a0f00e 	mov	pc, lr

f0014980 <arm_invalidate_dcache>:
f0014980:	e3a00000 	mov	r0, #0
f0014984:	ee070f16 	mcr	15, 0, r0, cr7, cr6, {0}
f0014988:	e1a0f00e 	mov	pc, lr

f001498c <arm_clean_dcache>:
f001498c:	ee17ff7a 	mrc	15, 0, APSR_nzcv, cr7, cr10, {3}
f0014990:	1afffffd 	bne	f001498c <arm_clean_dcache>
f0014994:	ee07cf9a 	mcr	15, 0, ip, cr7, cr10, {4}
f0014998:	e1a0f00e 	mov	pc, lr

f001499c <arm_clean_invalidate_dcache>:
f001499c:	ee17ff7e 	mrc	15, 0, APSR_nzcv, cr7, cr14, {3}
f00149a0:	1afffffd 	bne	f001499c <arm_clean_invalidate_dcache>
f00149a4:	ee07cf9a 	mcr	15, 0, ip, cr7, cr10, {4}
f00149a8:	e1a0f00e 	mov	pc, lr

f00149ac <arm_clean_invalidate_cache>:
f00149ac:	ee17ff7e 	mrc	15, 0, APSR_nzcv, cr7, cr14, {3}
f00149b0:	1afffffd 	bne	f00149ac <arm_clean_invalidate_cache>
f00149b4:	ee07cf15 	mcr	15, 0, ip, cr7, cr5, {0}
f00149b8:	ee07cf9a 	mcr	15, 0, ip, cr7, cr10, {4}
f00149bc:	e1a0f00e 	mov	pc, lr

f00149c0 <arm_drain_writebuffer>:
f00149c0:	e3a00000 	mov	r0, #0
f00149c4:	ee070f9a 	mcr	15, 0, r0, cr7, cr10, {4}
f00149c8:	e1a0f00e 	mov	pc, lr

f00149cc <arm_invalidate_tlb>:
f00149cc:	ee08cf17 	mcr	15, 0, ip, cr8, cr7, {0}
f00149d0:	e1a0f00e 	mov	pc, lr

f00149d4 <arm_invalidate_itlb>:
f00149d4:	e3a00000 	mov	r0, #0
f00149d8:	ee080f15 	mcr	15, 0, r0, cr8, cr5, {0}
f00149dc:	e1a0f00e 	mov	pc, lr

f00149e0 <arm_invalidate_dtlb>:
f00149e0:	e3a00000 	mov	r0, #0
f00149e4:	ee080f16 	mcr	15, 0, r0, cr8, cr6, {0}
f00149e8:	e1a0f00e 	mov	pc, lr

f00149ec <arch_invalidate_dcache>:
f00149ec:	e92d4800 	push	{fp, lr}
f00149f0:	e28db004 	add	fp, sp, #4
f00149f4:	e24dd008 	sub	sp, sp, #8
f00149f8:	e50b0008 	str	r0, [fp, #-8]
f00149fc:	e50b100c 	str	r1, [fp, #-12]
f0014a00:	ebffffde 	bl	f0014980 <arm_invalidate_dcache>
f0014a04:	e24bd004 	sub	sp, fp, #4
f0014a08:	e8bd8800 	pop	{fp, pc}

f0014a0c <arch_clean_invalidate_dcache>:
f0014a0c:	e92d4800 	push	{fp, lr}
f0014a10:	e28db004 	add	fp, sp, #4
f0014a14:	e24dd008 	sub	sp, sp, #8
f0014a18:	e50b0008 	str	r0, [fp, #-8]
f0014a1c:	e50b100c 	str	r1, [fp, #-12]
f0014a20:	ebffffdd 	bl	f001499c <arm_clean_invalidate_dcache>
f0014a24:	e24bd004 	sub	sp, fp, #4
f0014a28:	e8bd8800 	pop	{fp, pc}

f0014a2c <arch_invalidate_icache>:
f0014a2c:	e92d4800 	push	{fp, lr}
f0014a30:	e28db004 	add	fp, sp, #4
f0014a34:	e24dd008 	sub	sp, sp, #8
f0014a38:	e50b0008 	str	r0, [fp, #-8]
f0014a3c:	e50b100c 	str	r1, [fp, #-12]
f0014a40:	ebffffcb 	bl	f0014974 <arm_invalidate_icache>
f0014a44:	e24bd004 	sub	sp, fp, #4
f0014a48:	e8bd8800 	pop	{fp, pc}

f0014a4c <arch_clean_dcache>:
f0014a4c:	e92d4800 	push	{fp, lr}
f0014a50:	e28db004 	add	fp, sp, #4
f0014a54:	e24dd008 	sub	sp, sp, #8
f0014a58:	e50b0008 	str	r0, [fp, #-8]
f0014a5c:	e50b100c 	str	r1, [fp, #-12]
f0014a60:	ebffffc9 	bl	f001498c <arm_clean_dcache>
f0014a64:	e24bd004 	sub	sp, fp, #4
f0014a68:	e8bd8800 	pop	{fp, pc}

f0014a6c <arch_invalidate_tlb>:
f0014a6c:	e92d4800 	push	{fp, lr}
f0014a70:	e28db004 	add	fp, sp, #4
f0014a74:	e24dd008 	sub	sp, sp, #8
f0014a78:	e50b0008 	str	r0, [fp, #-8]
f0014a7c:	e50b100c 	str	r1, [fp, #-12]
f0014a80:	ebffffd1 	bl	f00149cc <arm_invalidate_tlb>
f0014a84:	e24bd004 	sub	sp, fp, #4
f0014a88:	e8bd8800 	pop	{fp, pc}

f0014a8c <__spin_lock>:
f0014a8c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f0014a90:	e28db000 	add	fp, sp, #0
f0014a94:	e24dd014 	sub	sp, sp, #20
f0014a98:	e50b0010 	str	r0, [fp, #-16]
f0014a9c:	e3a03000 	mov	r3, #0
f0014aa0:	e50b3008 	str	r3, [fp, #-8]
f0014aa4:	e51b2008 	ldr	r2, [fp, #-8]
f0014aa8:	e51b1010 	ldr	r1, [fp, #-16]
f0014aac:	e3a00000 	mov	r0, #0
f0014ab0:	e1013092 	swp	r3, r2, [r1]
f0014ab4:	e1330000 	teq	r3, r0
f0014ab8:	1afffffc 	bne	f0014ab0 <__spin_lock+0x24>
f0014abc:	e50b300c 	str	r3, [fp, #-12]
f0014ac0:	e24bd000 	sub	sp, fp, #0
f0014ac4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0014ac8:	e12fff1e 	bx	lr

f0014acc <__spin_unlock>:
f0014acc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f0014ad0:	e28db000 	add	fp, sp, #0
f0014ad4:	e24dd014 	sub	sp, sp, #20
f0014ad8:	e50b0010 	str	r0, [fp, #-16]
f0014adc:	e3a03001 	mov	r3, #1
f0014ae0:	e50b3008 	str	r3, [fp, #-8]
f0014ae4:	e51b2008 	ldr	r2, [fp, #-8]
f0014ae8:	e51b1010 	ldr	r1, [fp, #-16]
f0014aec:	e3a00000 	mov	r0, #0
f0014af0:	e1013092 	swp	r3, r2, [r1]
f0014af4:	e1330000 	teq	r3, r0
f0014af8:	1afffffc 	bne	f0014af0 <__spin_unlock+0x24>
f0014afc:	e50b300c 	str	r3, [fp, #-12]
f0014b00:	e24bd000 	sub	sp, fp, #0
f0014b04:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0014b08:	e12fff1e 	bx	lr

f0014b0c <__mutex_lock>:
f0014b0c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f0014b10:	e28db000 	add	fp, sp, #0
f0014b14:	e24dd014 	sub	sp, sp, #20
f0014b18:	e50b0010 	str	r0, [fp, #-16]
f0014b1c:	e3a03001 	mov	r3, #1
f0014b20:	e50b3008 	str	r3, [fp, #-8]
f0014b24:	e51b2008 	ldr	r2, [fp, #-8]
f0014b28:	e51b1010 	ldr	r1, [fp, #-16]
f0014b2c:	e1013092 	swp	r3, r2, [r1]
f0014b30:	e50b300c 	str	r3, [fp, #-12]
f0014b34:	e51b300c 	ldr	r3, [fp, #-12]
f0014b38:	e3530000 	cmp	r3, #0
f0014b3c:	1a000001 	bne	f0014b48 <__mutex_lock+0x3c>
f0014b40:	e3a03001 	mov	r3, #1
f0014b44:	ea000000 	b	f0014b4c <__mutex_lock+0x40>
f0014b48:	e3a03000 	mov	r3, #0
f0014b4c:	e1a00003 	mov	r0, r3
f0014b50:	e24bd000 	sub	sp, fp, #0
f0014b54:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0014b58:	e12fff1e 	bx	lr

f0014b5c <__mutex_unlock>:
f0014b5c:	e92d4800 	push	{fp, lr}
f0014b60:	e28db004 	add	fp, sp, #4
f0014b64:	e24dd010 	sub	sp, sp, #16
f0014b68:	e50b0010 	str	r0, [fp, #-16]
f0014b6c:	e3a03000 	mov	r3, #0
f0014b70:	e50b3008 	str	r3, [fp, #-8]
f0014b74:	e51b2008 	ldr	r2, [fp, #-8]
f0014b78:	e51b1010 	ldr	r1, [fp, #-16]
f0014b7c:	e1013092 	swp	r3, r2, [r1]
f0014b80:	e50b300c 	str	r3, [fp, #-12]
f0014b84:	e51b300c 	ldr	r3, [fp, #-12]
f0014b88:	e3530001 	cmp	r3, #1
f0014b8c:	0a000005 	beq	f0014ba8 <__mutex_unlock+0x4c>
f0014b90:	e59f0018 	ldr	r0, [pc, #24]	; f0014bb0 <__mutex_unlock+0x54>
f0014b94:	e59f1018 	ldr	r1, [pc, #24]	; f0014bb4 <__mutex_unlock+0x58>
f0014b98:	e59f2018 	ldr	r2, [pc, #24]	; f0014bb8 <__mutex_unlock+0x5c>
f0014b9c:	e3a0304a 	mov	r3, #74	; 0x4a
f0014ba0:	eb0004d1 	bl	f0015eec <printk>
f0014ba4:	eafffffe 	b	f0014ba4 <__mutex_unlock+0x48>
f0014ba8:	e24bd004 	sub	sp, fp, #4
f0014bac:	e8bd8800 	pop	{fp, pc}
f0014bb0:	f001f478 	.word	0xf001f478
f0014bb4:	f001f4a0 	.word	0xf001f4a0
f0014bb8:	f001f4b8 	.word	0xf001f4b8

f0014bbc <irq_local_disable_save>:
f0014bbc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f0014bc0:	e28db000 	add	fp, sp, #0
f0014bc4:	e24dd014 	sub	sp, sp, #20
f0014bc8:	e50b0010 	str	r0, [fp, #-16]
f0014bcc:	e10f2000 	mrs	r2, CPSR
f0014bd0:	e3823080 	orr	r3, r2, #128	; 0x80
f0014bd4:	e129f003 	msr	CPSR_fc, r3
f0014bd8:	e50b2008 	str	r2, [fp, #-8]
f0014bdc:	e50b300c 	str	r3, [fp, #-12]
f0014be0:	e51b3010 	ldr	r3, [fp, #-16]
f0014be4:	e51b2008 	ldr	r2, [fp, #-8]
f0014be8:	e5832000 	str	r2, [r3]
f0014bec:	e24bd000 	sub	sp, fp, #0
f0014bf0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0014bf4:	e12fff1e 	bx	lr

f0014bf8 <irq_local_restore>:
f0014bf8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f0014bfc:	e28db000 	add	fp, sp, #0
f0014c00:	e24dd00c 	sub	sp, sp, #12
f0014c04:	e50b0008 	str	r0, [fp, #-8]
f0014c08:	e51b3008 	ldr	r3, [fp, #-8]
f0014c0c:	e129f003 	msr	CPSR_fc, r3
f0014c10:	e24bd000 	sub	sp, fp, #0
f0014c14:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0014c18:	e12fff1e 	bx	lr

f0014c1c <irqs_enabled>:
f0014c1c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f0014c20:	e28db000 	add	fp, sp, #0
f0014c24:	e24dd00c 	sub	sp, sp, #12
f0014c28:	e10f3000 	mrs	r3, CPSR
f0014c2c:	e50b3008 	str	r3, [fp, #-8]
f0014c30:	e51b3008 	ldr	r3, [fp, #-8]
f0014c34:	e2033080 	and	r3, r3, #128	; 0x80
f0014c38:	e3530000 	cmp	r3, #0
f0014c3c:	0a000001 	beq	f0014c48 <irqs_enabled+0x2c>
f0014c40:	e3a03000 	mov	r3, #0
f0014c44:	ea000000 	b	f0014c4c <irqs_enabled+0x30>
f0014c48:	e3a03001 	mov	r3, #1
f0014c4c:	e1a00003 	mov	r0, r3
f0014c50:	e24bd000 	sub	sp, fp, #0
f0014c54:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0014c58:	e12fff1e 	bx	lr

f0014c5c <arm_enable_caches>:
f0014c5c:	e92d4800 	push	{fp, lr}
f0014c60:	e28db004 	add	fp, sp, #4
f0014c64:	ebffff2f 	bl	f0014928 <arm_enable_icache>
f0014c68:	ebffff32 	bl	f0014938 <arm_enable_dcache>
f0014c6c:	e8bd8800 	pop	{fp, pc}

f0014c70 <system_identify>:
f0014c70:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f0014c74:	e28db000 	add	fp, sp, #0
f0014c78:	e24bd000 	sub	sp, fp, #0
f0014c7c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0014c80:	e12fff1e 	bx	lr

f0014c84 <jump>:
f0014c84:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f0014c88:	e28db000 	add	fp, sp, #0
f0014c8c:	e24dd00c 	sub	sp, sp, #12
f0014c90:	e50b0008 	str	r0, [fp, #-8]
f0014c94:	e51b3008 	ldr	r3, [fp, #-8]
f0014c98:	e3a02a01 	mov	r2, #4096	; 0x1000
f0014c9c:	e3a01008 	mov	r1, #8
f0014ca0:	e1a0e003 	mov	lr, r3
f0014ca4:	e59e0000 	ldr	r0, [lr]
f0014ca8:	e169f000 	msr	SPSR_fc, r0
f0014cac:	e08ed002 	add	sp, lr, r2
f0014cb0:	e04dd001 	sub	sp, sp, r1
f0014cb4:	e9de7fff 	ldmib	lr, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr}^
f0014cb8:	e1a00000 	nop			; (mov r0, r0)
f0014cbc:	e28ee040 	add	lr, lr, #64	; 0x40
f0014cc0:	e59ee000 	ldr	lr, [lr]
f0014cc4:	e1b0f00e 	movs	pc, lr
f0014cc8:	e24bd000 	sub	sp, fp, #0
f0014ccc:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0014cd0:	e12fff1e 	bx	lr

f0014cd4 <switch_to_user>:
f0014cd4:	e92d4800 	push	{fp, lr}
f0014cd8:	e28db004 	add	fp, sp, #4
f0014cdc:	e24dd008 	sub	sp, sp, #8
f0014ce0:	e50b0008 	str	r0, [fp, #-8]
f0014ce4:	ebffff30 	bl	f00149ac <arm_clean_invalidate_cache>
f0014ce8:	ebffff37 	bl	f00149cc <arm_invalidate_tlb>
f0014cec:	e51b3008 	ldr	r3, [fp, #-8]
f0014cf0:	e59330b4 	ldr	r3, [r3, #180]	; 0xb4
f0014cf4:	e5933010 	ldr	r3, [r3, #16]
f0014cf8:	e2833201 	add	r3, r3, #268435456	; 0x10000000
f0014cfc:	e1a00003 	mov	r0, r3
f0014d00:	ebfffefe 	bl	f0014900 <arm_set_ttb>
f0014d04:	ebffff30 	bl	f00149cc <arm_invalidate_tlb>
f0014d08:	e51b0008 	ldr	r0, [fp, #-8]
f0014d0c:	ebffffdc 	bl	f0014c84 <jump>
f0014d10:	e24bd004 	sub	sp, fp, #4
f0014d14:	e8bd8800 	pop	{fp, pc}

f0014d18 <init_kernel_mappings>:
f0014d18:	e92d4800 	push	{fp, lr}
f0014d1c:	e28db004 	add	fp, sp, #4
f0014d20:	e59f3060 	ldr	r3, [pc, #96]	; f0014d88 <init_kernel_mappings+0x70>
f0014d24:	e2833201 	add	r3, r3, #268435456	; 0x10000000
f0014d28:	e1a02a23 	lsr	r2, r3, #20
f0014d2c:	e1a02a02 	lsl	r2, r2, #20
f0014d30:	e59f3050 	ldr	r3, [pc, #80]	; f0014d88 <init_kernel_mappings+0x70>
f0014d34:	e1a03a23 	lsr	r3, r3, #20
f0014d38:	e1a03a03 	lsl	r3, r3, #20
f0014d3c:	e1a00002 	mov	r0, r2
f0014d40:	e1a01003 	mov	r1, r3
f0014d44:	e3a02001 	mov	r2, #1
f0014d48:	e3a0300c 	mov	r3, #12
f0014d4c:	ebfffbd4 	bl	f0013ca4 <add_section_mapping_init>
f0014d50:	e59f3030 	ldr	r3, [pc, #48]	; f0014d88 <init_kernel_mappings+0x70>
f0014d54:	e2833201 	add	r3, r3, #268435456	; 0x10000000
f0014d58:	e1a02a23 	lsr	r2, r3, #20
f0014d5c:	e1a02a02 	lsl	r2, r2, #20
f0014d60:	e59f3020 	ldr	r3, [pc, #32]	; f0014d88 <init_kernel_mappings+0x70>
f0014d64:	e2833201 	add	r3, r3, #268435456	; 0x10000000
f0014d68:	e1a03a23 	lsr	r3, r3, #20
f0014d6c:	e1a03a03 	lsl	r3, r3, #20
f0014d70:	e1a00002 	mov	r0, r2
f0014d74:	e1a01003 	mov	r1, r3
f0014d78:	e3a02001 	mov	r2, #1
f0014d7c:	e3a03000 	mov	r3, #0
f0014d80:	ebfffbc7 	bl	f0013ca4 <add_section_mapping_init>
f0014d84:	e8bd8800 	pop	{fp, pc}
f0014d88:	f0008000 	.word	0xf0008000

f0014d8c <start_virtual_memory>:
f0014d8c:	e92d4818 	push	{r3, r4, fp, lr}
f0014d90:	e28db00c 	add	fp, sp, #12
f0014d94:	e1a0400e 	mov	r4, lr
f0014d98:	e59f3054 	ldr	r3, [pc, #84]	; f0014df4 <break_virtual+0x18>
f0014d9c:	e2833201 	add	r3, r3, #268435456	; 0x10000000
f0014da0:	e1a00003 	mov	r0, r3
f0014da4:	ebfffed5 	bl	f0014900 <arm_set_ttb>
f0014da8:	e3a00001 	mov	r0, #1
f0014dac:	ebfffed7 	bl	f0014910 <arm_set_domain>
f0014db0:	ebffffa9 	bl	f0014c5c <arm_enable_caches>
f0014db4:	ebfffee3 	bl	f0014948 <arm_enable_wbuffer>
f0014db8:	ebfffee6 	bl	f0014958 <arm_enable_high_vectors>
f0014dbc:	ebfffee9 	bl	f0014968 <arm_invalidate_cache>
f0014dc0:	ebfffefe 	bl	f00149c0 <arm_drain_writebuffer>
f0014dc4:	ebffff00 	bl	f00149cc <arm_invalidate_tlb>
f0014dc8:	ebfffed2 	bl	f0014918 <arm_enable_mmu>
f0014dcc:	e3a0320f 	mov	r3, #-268435456	; 0xf0000000
f0014dd0:	e08dd003 	add	sp, sp, r3
f0014dd4:	e08bb003 	add	fp, fp, r3
f0014dd8:	e08f0003 	add	r0, pc, r3

f0014ddc <break_virtual>:
f0014ddc:	e1a0f000 	mov	pc, r0
f0014de0:	e1a03004 	mov	r3, r4
f0014de4:	e3a0220f 	mov	r2, #-268435456	; 0xf0000000
f0014de8:	e0833002 	add	r3, r3, r2
f0014dec:	e1a0f003 	mov	pc, r3
f0014df0:	eafffffe 	b	f0014df0 <break_virtual+0x14>
f0014df4:	f0028000 	.word	0xf0028000

f0014df8 <l4_atomic_dest_readb>:
f0014df8:	e3a01000 	mov	r1, #0
f0014dfc:	e1402091 	swpb	r2, r1, [r0]
f0014e00:	e1a00002 	mov	r0, r2
f0014e04:	e1a0f00e 	mov	pc, lr

f0014e08 <spin_lock_irq>:
f0014e08:	e92d4800 	push	{fp, lr}
f0014e0c:	e28db004 	add	fp, sp, #4
f0014e10:	e24dd008 	sub	sp, sp, #8
f0014e14:	e50b0008 	str	r0, [fp, #-8]
f0014e18:	e50b100c 	str	r1, [fp, #-12]
f0014e1c:	e51b000c 	ldr	r0, [fp, #-12]
f0014e20:	ebffff65 	bl	f0014bbc <irq_local_disable_save>
f0014e24:	e24bd004 	sub	sp, fp, #4
f0014e28:	e8bd8800 	pop	{fp, pc}

f0014e2c <spin_unlock_irq>:
f0014e2c:	e92d4800 	push	{fp, lr}
f0014e30:	e28db004 	add	fp, sp, #4
f0014e34:	e24dd008 	sub	sp, sp, #8
f0014e38:	e50b0008 	str	r0, [fp, #-8]
f0014e3c:	e50b100c 	str	r1, [fp, #-12]
f0014e40:	e51b000c 	ldr	r0, [fp, #-12]
f0014e44:	ebffff6b 	bl	f0014bf8 <irq_local_restore>
f0014e48:	e24bd004 	sub	sp, fp, #4
f0014e4c:	e8bd8800 	pop	{fp, pc}

f0014e50 <print_hex64>:
f0014e50:	e92d4830 	push	{r4, r5, fp, lr}
f0014e54:	e28db00c 	add	fp, sp, #12
f0014e58:	e24dd028 	sub	sp, sp, #40	; 0x28
f0014e5c:	e50b002c 	str	r0, [fp, #-44]	; 0x2c
f0014e60:	e50b1028 	str	r1, [fp, #-40]	; 0x28
f0014e64:	e50b2030 	str	r2, [fp, #-48]	; 0x30
f0014e68:	e50b3034 	str	r3, [fp, #-52]	; 0x34
f0014e6c:	e3a03000 	mov	r3, #0
f0014e70:	e50b3014 	str	r3, [fp, #-20]
f0014e74:	e3a03000 	mov	r3, #0
f0014e78:	e50b3018 	str	r3, [fp, #-24]
f0014e7c:	e24b302c 	sub	r3, fp, #44	; 0x2c
f0014e80:	e893000c 	ldm	r3, {r2, r3}
f0014e84:	e1a04003 	mov	r4, r3
f0014e88:	e3a05000 	mov	r5, #0
f0014e8c:	e1a03004 	mov	r3, r4
f0014e90:	e50b301c 	str	r3, [fp, #-28]
f0014e94:	e51b302c 	ldr	r3, [fp, #-44]	; 0x2c
f0014e98:	e50b3020 	str	r3, [fp, #-32]
f0014e9c:	e51b301c 	ldr	r3, [fp, #-28]
f0014ea0:	e3530000 	cmp	r3, #0
f0014ea4:	0a000010 	beq	f0014eec <print_hex64+0x9c>
f0014ea8:	ea000002 	b	f0014eb8 <print_hex64+0x68>
f0014eac:	e51b3018 	ldr	r3, [fp, #-24]
f0014eb0:	e2833001 	add	r3, r3, #1
f0014eb4:	e50b3018 	str	r3, [fp, #-24]
f0014eb8:	e51b3018 	ldr	r3, [fp, #-24]
f0014ebc:	e1a03103 	lsl	r3, r3, #2
f0014ec0:	e51b201c 	ldr	r2, [fp, #-28]
f0014ec4:	e1a03332 	lsr	r3, r2, r3
f0014ec8:	e3530000 	cmp	r3, #0
f0014ecc:	0a000002 	beq	f0014edc <print_hex64+0x8c>
f0014ed0:	e51b3018 	ldr	r3, [fp, #-24]
f0014ed4:	e3530007 	cmp	r3, #7
f0014ed8:	9afffff3 	bls	f0014eac <print_hex64+0x5c>
f0014edc:	e51b3018 	ldr	r3, [fp, #-24]
f0014ee0:	e2833020 	add	r3, r3, #32
f0014ee4:	e50b3018 	str	r3, [fp, #-24]
f0014ee8:	ea00000c 	b	f0014f20 <print_hex64+0xd0>
f0014eec:	ea000002 	b	f0014efc <print_hex64+0xac>
f0014ef0:	e51b3018 	ldr	r3, [fp, #-24]
f0014ef4:	e2833001 	add	r3, r3, #1
f0014ef8:	e50b3018 	str	r3, [fp, #-24]
f0014efc:	e51b3018 	ldr	r3, [fp, #-24]
f0014f00:	e1a03103 	lsl	r3, r3, #2
f0014f04:	e51b2020 	ldr	r2, [fp, #-32]
f0014f08:	e1a03332 	lsr	r3, r2, r3
f0014f0c:	e3530000 	cmp	r3, #0
f0014f10:	0a000002 	beq	f0014f20 <print_hex64+0xd0>
f0014f14:	e51b3018 	ldr	r3, [fp, #-24]
f0014f18:	e3530007 	cmp	r3, #7
f0014f1c:	9afffff3 	bls	f0014ef0 <print_hex64+0xa0>
f0014f20:	e51b3018 	ldr	r3, [fp, #-24]
f0014f24:	e3530000 	cmp	r3, #0
f0014f28:	1a000001 	bne	f0014f34 <print_hex64+0xe4>
f0014f2c:	e3a03001 	mov	r3, #1
f0014f30:	e50b3018 	str	r3, [fp, #-24]
f0014f34:	e51b2034 	ldr	r2, [fp, #-52]	; 0x34
f0014f38:	e51b3018 	ldr	r3, [fp, #-24]
f0014f3c:	e1520003 	cmp	r2, r3
f0014f40:	da000001 	ble	f0014f4c <print_hex64+0xfc>
f0014f44:	e51b3034 	ldr	r3, [fp, #-52]	; 0x34
f0014f48:	e50b3018 	str	r3, [fp, #-24]
f0014f4c:	e51b3030 	ldr	r3, [fp, #-48]	; 0x30
f0014f50:	e3530000 	cmp	r3, #0
f0014f54:	1a000005 	bne	f0014f70 <print_hex64+0x120>
f0014f58:	e51b2030 	ldr	r2, [fp, #-48]	; 0x30
f0014f5c:	e51b3018 	ldr	r3, [fp, #-24]
f0014f60:	e1520003 	cmp	r2, r3
f0014f64:	aa000001 	bge	f0014f70 <print_hex64+0x120>
f0014f68:	e51b3018 	ldr	r3, [fp, #-24]
f0014f6c:	e50b3030 	str	r3, [fp, #-48]	; 0x30
f0014f70:	e51b301c 	ldr	r3, [fp, #-28]
f0014f74:	e3530000 	cmp	r3, #0
f0014f78:	0a00005a 	beq	f00150e8 <print_hex64+0x298>
f0014f7c:	e59b3004 	ldr	r3, [fp, #4]
f0014f80:	e3530000 	cmp	r3, #0
f0014f84:	1a000015 	bne	f0014fe0 <print_hex64+0x190>
f0014f88:	e51b2030 	ldr	r2, [fp, #-48]	; 0x30
f0014f8c:	e51b3018 	ldr	r3, [fp, #-24]
f0014f90:	e0633002 	rsb	r3, r3, r2
f0014f94:	e50b3010 	str	r3, [fp, #-16]
f0014f98:	ea00000d 	b	f0014fd4 <print_hex64+0x184>
f0014f9c:	e59b3008 	ldr	r3, [fp, #8]
f0014fa0:	e3530000 	cmp	r3, #0
f0014fa4:	0a000001 	beq	f0014fb0 <print_hex64+0x160>
f0014fa8:	e3a03030 	mov	r3, #48	; 0x30
f0014fac:	ea000000 	b	f0014fb4 <print_hex64+0x164>
f0014fb0:	e3a03020 	mov	r3, #32
f0014fb4:	e1a00003 	mov	r0, r3
f0014fb8:	eb0003e4 	bl	f0015f50 <putc>
f0014fbc:	e51b3010 	ldr	r3, [fp, #-16]
f0014fc0:	e2433001 	sub	r3, r3, #1
f0014fc4:	e50b3010 	str	r3, [fp, #-16]
f0014fc8:	e51b3014 	ldr	r3, [fp, #-20]
f0014fcc:	e2833001 	add	r3, r3, #1
f0014fd0:	e50b3014 	str	r3, [fp, #-20]
f0014fd4:	e51b3010 	ldr	r3, [fp, #-16]
f0014fd8:	e3530000 	cmp	r3, #0
f0014fdc:	caffffee 	bgt	f0014f9c <print_hex64+0x14c>
f0014fe0:	e51b3018 	ldr	r3, [fp, #-24]
f0014fe4:	e2433021 	sub	r3, r3, #33	; 0x21
f0014fe8:	e1a03103 	lsl	r3, r3, #2
f0014fec:	e50b3010 	str	r3, [fp, #-16]
f0014ff0:	ea00001e 	b	f0015070 <print_hex64+0x220>
f0014ff4:	e51b201c 	ldr	r2, [fp, #-28]
f0014ff8:	e51b3010 	ldr	r3, [fp, #-16]
f0014ffc:	e1a03332 	lsr	r3, r2, r3
f0015000:	e203300f 	and	r3, r3, #15
f0015004:	e3530009 	cmp	r3, #9
f0015008:	8a000008 	bhi	f0015030 <print_hex64+0x1e0>
f001500c:	e51b201c 	ldr	r2, [fp, #-28]
f0015010:	e51b3010 	ldr	r3, [fp, #-16]
f0015014:	e1a03332 	lsr	r3, r2, r3
f0015018:	e20330ff 	and	r3, r3, #255	; 0xff
f001501c:	e203300f 	and	r3, r3, #15
f0015020:	e20330ff 	and	r3, r3, #255	; 0xff
f0015024:	e2833030 	add	r3, r3, #48	; 0x30
f0015028:	e20330ff 	and	r3, r3, #255	; 0xff
f001502c:	ea000007 	b	f0015050 <print_hex64+0x200>
f0015030:	e51b201c 	ldr	r2, [fp, #-28]
f0015034:	e51b3010 	ldr	r3, [fp, #-16]
f0015038:	e1a03332 	lsr	r3, r2, r3
f001503c:	e20330ff 	and	r3, r3, #255	; 0xff
f0015040:	e203300f 	and	r3, r3, #15
f0015044:	e20330ff 	and	r3, r3, #255	; 0xff
f0015048:	e2833057 	add	r3, r3, #87	; 0x57
f001504c:	e20330ff 	and	r3, r3, #255	; 0xff
f0015050:	e1a00003 	mov	r0, r3
f0015054:	eb0003bd 	bl	f0015f50 <putc>
f0015058:	e51b3010 	ldr	r3, [fp, #-16]
f001505c:	e2433004 	sub	r3, r3, #4
f0015060:	e50b3010 	str	r3, [fp, #-16]
f0015064:	e51b3014 	ldr	r3, [fp, #-20]
f0015068:	e2833001 	add	r3, r3, #1
f001506c:	e50b3014 	str	r3, [fp, #-20]
f0015070:	e51b3010 	ldr	r3, [fp, #-16]
f0015074:	e3530000 	cmp	r3, #0
f0015078:	aaffffdd 	bge	f0014ff4 <print_hex64+0x1a4>
f001507c:	e59b3004 	ldr	r3, [fp, #4]
f0015080:	e3530000 	cmp	r3, #0
f0015084:	0a00000f 	beq	f00150c8 <print_hex64+0x278>
f0015088:	e51b2030 	ldr	r2, [fp, #-48]	; 0x30
f001508c:	e51b3018 	ldr	r3, [fp, #-24]
f0015090:	e0633002 	rsb	r3, r3, r2
f0015094:	e50b3010 	str	r3, [fp, #-16]
f0015098:	ea000007 	b	f00150bc <print_hex64+0x26c>
f001509c:	e3a00020 	mov	r0, #32
f00150a0:	eb0003aa 	bl	f0015f50 <putc>
f00150a4:	e51b3010 	ldr	r3, [fp, #-16]
f00150a8:	e2433001 	sub	r3, r3, #1
f00150ac:	e50b3010 	str	r3, [fp, #-16]
f00150b0:	e51b3014 	ldr	r3, [fp, #-20]
f00150b4:	e2833001 	add	r3, r3, #1
f00150b8:	e50b3014 	str	r3, [fp, #-20]
f00150bc:	e51b3010 	ldr	r3, [fp, #-16]
f00150c0:	e3530000 	cmp	r3, #0
f00150c4:	cafffff4 	bgt	f001509c <print_hex64+0x24c>
f00150c8:	e51b3030 	ldr	r3, [fp, #-48]	; 0x30
f00150cc:	e2433020 	sub	r3, r3, #32
f00150d0:	e50b3030 	str	r3, [fp, #-48]	; 0x30
f00150d4:	e51b3018 	ldr	r3, [fp, #-24]
f00150d8:	e2433020 	sub	r3, r3, #32
f00150dc:	e50b3018 	str	r3, [fp, #-24]
f00150e0:	e3a03001 	mov	r3, #1
f00150e4:	e58b3008 	str	r3, [fp, #8]
f00150e8:	e59b3004 	ldr	r3, [fp, #4]
f00150ec:	e3530000 	cmp	r3, #0
f00150f0:	1a000015 	bne	f001514c <print_hex64+0x2fc>
f00150f4:	e51b2030 	ldr	r2, [fp, #-48]	; 0x30
f00150f8:	e51b3018 	ldr	r3, [fp, #-24]
f00150fc:	e0633002 	rsb	r3, r3, r2
f0015100:	e50b3010 	str	r3, [fp, #-16]
f0015104:	ea00000d 	b	f0015140 <print_hex64+0x2f0>
f0015108:	e59b3008 	ldr	r3, [fp, #8]
f001510c:	e3530000 	cmp	r3, #0
f0015110:	0a000001 	beq	f001511c <print_hex64+0x2cc>
f0015114:	e3a03030 	mov	r3, #48	; 0x30
f0015118:	ea000000 	b	f0015120 <print_hex64+0x2d0>
f001511c:	e3a03020 	mov	r3, #32
f0015120:	e1a00003 	mov	r0, r3
f0015124:	eb000389 	bl	f0015f50 <putc>
f0015128:	e51b3010 	ldr	r3, [fp, #-16]
f001512c:	e2433001 	sub	r3, r3, #1
f0015130:	e50b3010 	str	r3, [fp, #-16]
f0015134:	e51b3014 	ldr	r3, [fp, #-20]
f0015138:	e2833001 	add	r3, r3, #1
f001513c:	e50b3014 	str	r3, [fp, #-20]
f0015140:	e51b3010 	ldr	r3, [fp, #-16]
f0015144:	e3530000 	cmp	r3, #0
f0015148:	caffffee 	bgt	f0015108 <print_hex64+0x2b8>
f001514c:	e51b3018 	ldr	r3, [fp, #-24]
f0015150:	e2433001 	sub	r3, r3, #1
f0015154:	e1a03103 	lsl	r3, r3, #2
f0015158:	e50b3010 	str	r3, [fp, #-16]
f001515c:	ea00001e 	b	f00151dc <print_hex64+0x38c>
f0015160:	e51b2020 	ldr	r2, [fp, #-32]
f0015164:	e51b3010 	ldr	r3, [fp, #-16]
f0015168:	e1a03332 	lsr	r3, r2, r3
f001516c:	e203300f 	and	r3, r3, #15
f0015170:	e3530009 	cmp	r3, #9
f0015174:	8a000008 	bhi	f001519c <print_hex64+0x34c>
f0015178:	e51b2020 	ldr	r2, [fp, #-32]
f001517c:	e51b3010 	ldr	r3, [fp, #-16]
f0015180:	e1a03332 	lsr	r3, r2, r3
f0015184:	e20330ff 	and	r3, r3, #255	; 0xff
f0015188:	e203300f 	and	r3, r3, #15
f001518c:	e20330ff 	and	r3, r3, #255	; 0xff
f0015190:	e2833030 	add	r3, r3, #48	; 0x30
f0015194:	e20330ff 	and	r3, r3, #255	; 0xff
f0015198:	ea000007 	b	f00151bc <print_hex64+0x36c>
f001519c:	e51b2020 	ldr	r2, [fp, #-32]
f00151a0:	e51b3010 	ldr	r3, [fp, #-16]
f00151a4:	e1a03332 	lsr	r3, r2, r3
f00151a8:	e20330ff 	and	r3, r3, #255	; 0xff
f00151ac:	e203300f 	and	r3, r3, #15
f00151b0:	e20330ff 	and	r3, r3, #255	; 0xff
f00151b4:	e2833057 	add	r3, r3, #87	; 0x57
f00151b8:	e20330ff 	and	r3, r3, #255	; 0xff
f00151bc:	e1a00003 	mov	r0, r3
f00151c0:	eb000362 	bl	f0015f50 <putc>
f00151c4:	e51b3010 	ldr	r3, [fp, #-16]
f00151c8:	e2433004 	sub	r3, r3, #4
f00151cc:	e50b3010 	str	r3, [fp, #-16]
f00151d0:	e51b3014 	ldr	r3, [fp, #-20]
f00151d4:	e2833001 	add	r3, r3, #1
f00151d8:	e50b3014 	str	r3, [fp, #-20]
f00151dc:	e51b3010 	ldr	r3, [fp, #-16]
f00151e0:	e3530000 	cmp	r3, #0
f00151e4:	aaffffdd 	bge	f0015160 <print_hex64+0x310>
f00151e8:	e59b3004 	ldr	r3, [fp, #4]
f00151ec:	e3530000 	cmp	r3, #0
f00151f0:	0a00000f 	beq	f0015234 <print_hex64+0x3e4>
f00151f4:	e51b2030 	ldr	r2, [fp, #-48]	; 0x30
f00151f8:	e51b3018 	ldr	r3, [fp, #-24]
f00151fc:	e0633002 	rsb	r3, r3, r2
f0015200:	e50b3010 	str	r3, [fp, #-16]
f0015204:	ea000007 	b	f0015228 <print_hex64+0x3d8>
f0015208:	e3a00020 	mov	r0, #32
f001520c:	eb00034f 	bl	f0015f50 <putc>
f0015210:	e51b3010 	ldr	r3, [fp, #-16]
f0015214:	e2433001 	sub	r3, r3, #1
f0015218:	e50b3010 	str	r3, [fp, #-16]
f001521c:	e51b3014 	ldr	r3, [fp, #-20]
f0015220:	e2833001 	add	r3, r3, #1
f0015224:	e50b3014 	str	r3, [fp, #-20]
f0015228:	e51b3010 	ldr	r3, [fp, #-16]
f001522c:	e3530000 	cmp	r3, #0
f0015230:	cafffff4 	bgt	f0015208 <print_hex64+0x3b8>
f0015234:	e51b3014 	ldr	r3, [fp, #-20]
f0015238:	e1a00003 	mov	r0, r3
f001523c:	e24bd00c 	sub	sp, fp, #12
f0015240:	e8bd8830 	pop	{r4, r5, fp, pc}

f0015244 <print_hex_3arg>:
f0015244:	e92d4800 	push	{fp, lr}
f0015248:	e28db004 	add	fp, sp, #4
f001524c:	e24dd028 	sub	sp, sp, #40	; 0x28
f0015250:	e50b0020 	str	r0, [fp, #-32]
f0015254:	e50b1024 	str	r1, [fp, #-36]	; 0x24
f0015258:	e50b2028 	str	r2, [fp, #-40]	; 0x28
f001525c:	e3a03000 	mov	r3, #0
f0015260:	e50b300c 	str	r3, [fp, #-12]
f0015264:	e3a03000 	mov	r3, #0
f0015268:	e50b3010 	str	r3, [fp, #-16]
f001526c:	e3a03000 	mov	r3, #0
f0015270:	e50b3014 	str	r3, [fp, #-20]
f0015274:	e3a03000 	mov	r3, #0
f0015278:	e50b3018 	str	r3, [fp, #-24]
f001527c:	ea000002 	b	f001528c <print_hex_3arg+0x48>
f0015280:	e51b3010 	ldr	r3, [fp, #-16]
f0015284:	e2833001 	add	r3, r3, #1
f0015288:	e50b3010 	str	r3, [fp, #-16]
f001528c:	e51b3010 	ldr	r3, [fp, #-16]
f0015290:	e1a03103 	lsl	r3, r3, #2
f0015294:	e51b2020 	ldr	r2, [fp, #-32]
f0015298:	e1a03332 	lsr	r3, r2, r3
f001529c:	e3530000 	cmp	r3, #0
f00152a0:	0a000002 	beq	f00152b0 <print_hex_3arg+0x6c>
f00152a4:	e51b3010 	ldr	r3, [fp, #-16]
f00152a8:	e3530007 	cmp	r3, #7
f00152ac:	9afffff3 	bls	f0015280 <print_hex_3arg+0x3c>
f00152b0:	e51b3010 	ldr	r3, [fp, #-16]
f00152b4:	e3530000 	cmp	r3, #0
f00152b8:	1a000001 	bne	f00152c4 <print_hex_3arg+0x80>
f00152bc:	e3a03001 	mov	r3, #1
f00152c0:	e50b3010 	str	r3, [fp, #-16]
f00152c4:	e51b2028 	ldr	r2, [fp, #-40]	; 0x28
f00152c8:	e51b3010 	ldr	r3, [fp, #-16]
f00152cc:	e1520003 	cmp	r2, r3
f00152d0:	da000001 	ble	f00152dc <print_hex_3arg+0x98>
f00152d4:	e51b3028 	ldr	r3, [fp, #-40]	; 0x28
f00152d8:	e50b3010 	str	r3, [fp, #-16]
f00152dc:	e51b3024 	ldr	r3, [fp, #-36]	; 0x24
f00152e0:	e3530000 	cmp	r3, #0
f00152e4:	1a000005 	bne	f0015300 <print_hex_3arg+0xbc>
f00152e8:	e51b2024 	ldr	r2, [fp, #-36]	; 0x24
f00152ec:	e51b3010 	ldr	r3, [fp, #-16]
f00152f0:	e1520003 	cmp	r2, r3
f00152f4:	aa000001 	bge	f0015300 <print_hex_3arg+0xbc>
f00152f8:	e51b3010 	ldr	r3, [fp, #-16]
f00152fc:	e50b3024 	str	r3, [fp, #-36]	; 0x24
f0015300:	e51b3014 	ldr	r3, [fp, #-20]
f0015304:	e3530000 	cmp	r3, #0
f0015308:	1a000015 	bne	f0015364 <print_hex_3arg+0x120>
f001530c:	e51b2024 	ldr	r2, [fp, #-36]	; 0x24
f0015310:	e51b3010 	ldr	r3, [fp, #-16]
f0015314:	e0633002 	rsb	r3, r3, r2
f0015318:	e50b3008 	str	r3, [fp, #-8]
f001531c:	ea00000d 	b	f0015358 <print_hex_3arg+0x114>
f0015320:	e51b3018 	ldr	r3, [fp, #-24]
f0015324:	e3530000 	cmp	r3, #0
f0015328:	0a000001 	beq	f0015334 <print_hex_3arg+0xf0>
f001532c:	e3a03030 	mov	r3, #48	; 0x30
f0015330:	ea000000 	b	f0015338 <print_hex_3arg+0xf4>
f0015334:	e3a03020 	mov	r3, #32
f0015338:	e1a00003 	mov	r0, r3
f001533c:	eb000303 	bl	f0015f50 <putc>
f0015340:	e51b3008 	ldr	r3, [fp, #-8]
f0015344:	e2433001 	sub	r3, r3, #1
f0015348:	e50b3008 	str	r3, [fp, #-8]
f001534c:	e51b300c 	ldr	r3, [fp, #-12]
f0015350:	e2833001 	add	r3, r3, #1
f0015354:	e50b300c 	str	r3, [fp, #-12]
f0015358:	e51b3008 	ldr	r3, [fp, #-8]
f001535c:	e3530000 	cmp	r3, #0
f0015360:	caffffee 	bgt	f0015320 <print_hex_3arg+0xdc>
f0015364:	e51b3010 	ldr	r3, [fp, #-16]
f0015368:	e2433001 	sub	r3, r3, #1
f001536c:	e1a03103 	lsl	r3, r3, #2
f0015370:	e50b3008 	str	r3, [fp, #-8]
f0015374:	ea00001e 	b	f00153f4 <print_hex_3arg+0x1b0>
f0015378:	e51b2020 	ldr	r2, [fp, #-32]
f001537c:	e51b3008 	ldr	r3, [fp, #-8]
f0015380:	e1a03332 	lsr	r3, r2, r3
f0015384:	e203300f 	and	r3, r3, #15
f0015388:	e3530009 	cmp	r3, #9
f001538c:	8a000008 	bhi	f00153b4 <print_hex_3arg+0x170>
f0015390:	e51b2020 	ldr	r2, [fp, #-32]
f0015394:	e51b3008 	ldr	r3, [fp, #-8]
f0015398:	e1a03332 	lsr	r3, r2, r3
f001539c:	e20330ff 	and	r3, r3, #255	; 0xff
f00153a0:	e203300f 	and	r3, r3, #15
f00153a4:	e20330ff 	and	r3, r3, #255	; 0xff
f00153a8:	e2833030 	add	r3, r3, #48	; 0x30
f00153ac:	e20330ff 	and	r3, r3, #255	; 0xff
f00153b0:	ea000007 	b	f00153d4 <print_hex_3arg+0x190>
f00153b4:	e51b2020 	ldr	r2, [fp, #-32]
f00153b8:	e51b3008 	ldr	r3, [fp, #-8]
f00153bc:	e1a03332 	lsr	r3, r2, r3
f00153c0:	e20330ff 	and	r3, r3, #255	; 0xff
f00153c4:	e203300f 	and	r3, r3, #15
f00153c8:	e20330ff 	and	r3, r3, #255	; 0xff
f00153cc:	e2833057 	add	r3, r3, #87	; 0x57
f00153d0:	e20330ff 	and	r3, r3, #255	; 0xff
f00153d4:	e1a00003 	mov	r0, r3
f00153d8:	eb0002dc 	bl	f0015f50 <putc>
f00153dc:	e51b3008 	ldr	r3, [fp, #-8]
f00153e0:	e2433004 	sub	r3, r3, #4
f00153e4:	e50b3008 	str	r3, [fp, #-8]
f00153e8:	e51b300c 	ldr	r3, [fp, #-12]
f00153ec:	e2833001 	add	r3, r3, #1
f00153f0:	e50b300c 	str	r3, [fp, #-12]
f00153f4:	e51b3008 	ldr	r3, [fp, #-8]
f00153f8:	e3530000 	cmp	r3, #0
f00153fc:	aaffffdd 	bge	f0015378 <print_hex_3arg+0x134>
f0015400:	e51b3014 	ldr	r3, [fp, #-20]
f0015404:	e3530000 	cmp	r3, #0
f0015408:	0a00000f 	beq	f001544c <print_hex_3arg+0x208>
f001540c:	e51b2024 	ldr	r2, [fp, #-36]	; 0x24
f0015410:	e51b3010 	ldr	r3, [fp, #-16]
f0015414:	e0633002 	rsb	r3, r3, r2
f0015418:	e50b3008 	str	r3, [fp, #-8]
f001541c:	ea000007 	b	f0015440 <print_hex_3arg+0x1fc>
f0015420:	e3a00020 	mov	r0, #32
f0015424:	eb0002c9 	bl	f0015f50 <putc>
f0015428:	e51b3008 	ldr	r3, [fp, #-8]
f001542c:	e2433001 	sub	r3, r3, #1
f0015430:	e50b3008 	str	r3, [fp, #-8]
f0015434:	e51b300c 	ldr	r3, [fp, #-12]
f0015438:	e2833001 	add	r3, r3, #1
f001543c:	e50b300c 	str	r3, [fp, #-12]
f0015440:	e51b3008 	ldr	r3, [fp, #-8]
f0015444:	e3530000 	cmp	r3, #0
f0015448:	cafffff4 	bgt	f0015420 <print_hex_3arg+0x1dc>
f001544c:	e51b300c 	ldr	r3, [fp, #-12]
f0015450:	e1a00003 	mov	r0, r3
f0015454:	e24bd004 	sub	sp, fp, #4
f0015458:	e8bd8800 	pop	{fp, pc}

f001545c <print_hex_5arg>:
f001545c:	e92d4800 	push	{fp, lr}
f0015460:	e28db004 	add	fp, sp, #4
f0015464:	e24dd020 	sub	sp, sp, #32
f0015468:	e50b0018 	str	r0, [fp, #-24]
f001546c:	e50b101c 	str	r1, [fp, #-28]
f0015470:	e50b2020 	str	r2, [fp, #-32]
f0015474:	e50b3024 	str	r3, [fp, #-36]	; 0x24
f0015478:	e3a03000 	mov	r3, #0
f001547c:	e50b300c 	str	r3, [fp, #-12]
f0015480:	e3a03000 	mov	r3, #0
f0015484:	e50b3010 	str	r3, [fp, #-16]
f0015488:	ea000002 	b	f0015498 <print_hex_5arg+0x3c>
f001548c:	e51b3010 	ldr	r3, [fp, #-16]
f0015490:	e2833001 	add	r3, r3, #1
f0015494:	e50b3010 	str	r3, [fp, #-16]
f0015498:	e51b3010 	ldr	r3, [fp, #-16]
f001549c:	e1a03103 	lsl	r3, r3, #2
f00154a0:	e51b2018 	ldr	r2, [fp, #-24]
f00154a4:	e1a03332 	lsr	r3, r2, r3
f00154a8:	e3530000 	cmp	r3, #0
f00154ac:	0a000002 	beq	f00154bc <print_hex_5arg+0x60>
f00154b0:	e51b3010 	ldr	r3, [fp, #-16]
f00154b4:	e3530007 	cmp	r3, #7
f00154b8:	9afffff3 	bls	f001548c <print_hex_5arg+0x30>
f00154bc:	e51b3010 	ldr	r3, [fp, #-16]
f00154c0:	e3530000 	cmp	r3, #0
f00154c4:	1a000001 	bne	f00154d0 <print_hex_5arg+0x74>
f00154c8:	e3a03001 	mov	r3, #1
f00154cc:	e50b3010 	str	r3, [fp, #-16]
f00154d0:	e51b2020 	ldr	r2, [fp, #-32]
f00154d4:	e51b3010 	ldr	r3, [fp, #-16]
f00154d8:	e1520003 	cmp	r2, r3
f00154dc:	da000001 	ble	f00154e8 <print_hex_5arg+0x8c>
f00154e0:	e51b3020 	ldr	r3, [fp, #-32]
f00154e4:	e50b3010 	str	r3, [fp, #-16]
f00154e8:	e51b301c 	ldr	r3, [fp, #-28]
f00154ec:	e3530000 	cmp	r3, #0
f00154f0:	1a000005 	bne	f001550c <print_hex_5arg+0xb0>
f00154f4:	e51b201c 	ldr	r2, [fp, #-28]
f00154f8:	e51b3010 	ldr	r3, [fp, #-16]
f00154fc:	e1520003 	cmp	r2, r3
f0015500:	aa000001 	bge	f001550c <print_hex_5arg+0xb0>
f0015504:	e51b3010 	ldr	r3, [fp, #-16]
f0015508:	e50b301c 	str	r3, [fp, #-28]
f001550c:	e51b3024 	ldr	r3, [fp, #-36]	; 0x24
f0015510:	e3530000 	cmp	r3, #0
f0015514:	1a000015 	bne	f0015570 <print_hex_5arg+0x114>
f0015518:	e51b201c 	ldr	r2, [fp, #-28]
f001551c:	e51b3010 	ldr	r3, [fp, #-16]
f0015520:	e0633002 	rsb	r3, r3, r2
f0015524:	e50b3008 	str	r3, [fp, #-8]
f0015528:	ea00000d 	b	f0015564 <print_hex_5arg+0x108>
f001552c:	e59b3004 	ldr	r3, [fp, #4]
f0015530:	e3530000 	cmp	r3, #0
f0015534:	0a000001 	beq	f0015540 <print_hex_5arg+0xe4>
f0015538:	e3a03030 	mov	r3, #48	; 0x30
f001553c:	ea000000 	b	f0015544 <print_hex_5arg+0xe8>
f0015540:	e3a03020 	mov	r3, #32
f0015544:	e1a00003 	mov	r0, r3
f0015548:	eb000280 	bl	f0015f50 <putc>
f001554c:	e51b3008 	ldr	r3, [fp, #-8]
f0015550:	e2433001 	sub	r3, r3, #1
f0015554:	e50b3008 	str	r3, [fp, #-8]
f0015558:	e51b300c 	ldr	r3, [fp, #-12]
f001555c:	e2833001 	add	r3, r3, #1
f0015560:	e50b300c 	str	r3, [fp, #-12]
f0015564:	e51b3008 	ldr	r3, [fp, #-8]
f0015568:	e3530000 	cmp	r3, #0
f001556c:	caffffee 	bgt	f001552c <print_hex_5arg+0xd0>
f0015570:	e51b3010 	ldr	r3, [fp, #-16]
f0015574:	e2433001 	sub	r3, r3, #1
f0015578:	e1a03103 	lsl	r3, r3, #2
f001557c:	e50b3008 	str	r3, [fp, #-8]
f0015580:	ea00001e 	b	f0015600 <print_hex_5arg+0x1a4>
f0015584:	e51b2018 	ldr	r2, [fp, #-24]
f0015588:	e51b3008 	ldr	r3, [fp, #-8]
f001558c:	e1a03332 	lsr	r3, r2, r3
f0015590:	e203300f 	and	r3, r3, #15
f0015594:	e3530009 	cmp	r3, #9
f0015598:	8a000008 	bhi	f00155c0 <print_hex_5arg+0x164>
f001559c:	e51b2018 	ldr	r2, [fp, #-24]
f00155a0:	e51b3008 	ldr	r3, [fp, #-8]
f00155a4:	e1a03332 	lsr	r3, r2, r3
f00155a8:	e20330ff 	and	r3, r3, #255	; 0xff
f00155ac:	e203300f 	and	r3, r3, #15
f00155b0:	e20330ff 	and	r3, r3, #255	; 0xff
f00155b4:	e2833030 	add	r3, r3, #48	; 0x30
f00155b8:	e20330ff 	and	r3, r3, #255	; 0xff
f00155bc:	ea000007 	b	f00155e0 <print_hex_5arg+0x184>
f00155c0:	e51b2018 	ldr	r2, [fp, #-24]
f00155c4:	e51b3008 	ldr	r3, [fp, #-8]
f00155c8:	e1a03332 	lsr	r3, r2, r3
f00155cc:	e20330ff 	and	r3, r3, #255	; 0xff
f00155d0:	e203300f 	and	r3, r3, #15
f00155d4:	e20330ff 	and	r3, r3, #255	; 0xff
f00155d8:	e2833057 	add	r3, r3, #87	; 0x57
f00155dc:	e20330ff 	and	r3, r3, #255	; 0xff
f00155e0:	e1a00003 	mov	r0, r3
f00155e4:	eb000259 	bl	f0015f50 <putc>
f00155e8:	e51b3008 	ldr	r3, [fp, #-8]
f00155ec:	e2433004 	sub	r3, r3, #4
f00155f0:	e50b3008 	str	r3, [fp, #-8]
f00155f4:	e51b300c 	ldr	r3, [fp, #-12]
f00155f8:	e2833001 	add	r3, r3, #1
f00155fc:	e50b300c 	str	r3, [fp, #-12]
f0015600:	e51b3008 	ldr	r3, [fp, #-8]
f0015604:	e3530000 	cmp	r3, #0
f0015608:	aaffffdd 	bge	f0015584 <print_hex_5arg+0x128>
f001560c:	e51b3024 	ldr	r3, [fp, #-36]	; 0x24
f0015610:	e3530000 	cmp	r3, #0
f0015614:	0a00000f 	beq	f0015658 <print_hex_5arg+0x1fc>
f0015618:	e51b201c 	ldr	r2, [fp, #-28]
f001561c:	e51b3010 	ldr	r3, [fp, #-16]
f0015620:	e0633002 	rsb	r3, r3, r2
f0015624:	e50b3008 	str	r3, [fp, #-8]
f0015628:	ea000007 	b	f001564c <print_hex_5arg+0x1f0>
f001562c:	e3a00020 	mov	r0, #32
f0015630:	eb000246 	bl	f0015f50 <putc>
f0015634:	e51b3008 	ldr	r3, [fp, #-8]
f0015638:	e2433001 	sub	r3, r3, #1
f001563c:	e50b3008 	str	r3, [fp, #-8]
f0015640:	e51b300c 	ldr	r3, [fp, #-12]
f0015644:	e2833001 	add	r3, r3, #1
f0015648:	e50b300c 	str	r3, [fp, #-12]
f001564c:	e51b3008 	ldr	r3, [fp, #-8]
f0015650:	e3530000 	cmp	r3, #0
f0015654:	cafffff4 	bgt	f001562c <print_hex_5arg+0x1d0>
f0015658:	e51b300c 	ldr	r3, [fp, #-12]
f001565c:	e1a00003 	mov	r0, r3
f0015660:	e24bd004 	sub	sp, fp, #4
f0015664:	e8bd8800 	pop	{fp, pc}

f0015668 <print_string_3arg>:
f0015668:	e92d4800 	push	{fp, lr}
f001566c:	e28db004 	add	fp, sp, #4
f0015670:	e24dd018 	sub	sp, sp, #24
f0015674:	e50b0010 	str	r0, [fp, #-16]
f0015678:	e50b1014 	str	r1, [fp, #-20]
f001567c:	e50b2018 	str	r2, [fp, #-24]
f0015680:	e3a03000 	mov	r3, #0
f0015684:	e50b3008 	str	r3, [fp, #-8]
f0015688:	e51b3010 	ldr	r3, [fp, #-16]
f001568c:	e5d33000 	ldrb	r3, [r3]
f0015690:	e3530000 	cmp	r3, #0
f0015694:	1a000000 	bne	f001569c <print_string_3arg+0x34>
f0015698:	ea000011 	b	f00156e4 <print_string_3arg+0x7c>
f001569c:	e51b3010 	ldr	r3, [fp, #-16]
f00156a0:	e2832001 	add	r2, r3, #1
f00156a4:	e50b2010 	str	r2, [fp, #-16]
f00156a8:	e5d33000 	ldrb	r3, [r3]
f00156ac:	e1a00003 	mov	r0, r3
f00156b0:	eb000226 	bl	f0015f50 <putc>
f00156b4:	e51b3008 	ldr	r3, [fp, #-8]
f00156b8:	e2833001 	add	r3, r3, #1
f00156bc:	e50b3008 	str	r3, [fp, #-8]
f00156c0:	e51b3018 	ldr	r3, [fp, #-24]
f00156c4:	e3530000 	cmp	r3, #0
f00156c8:	0a000004 	beq	f00156e0 <print_string_3arg+0x78>
f00156cc:	e51b2008 	ldr	r2, [fp, #-8]
f00156d0:	e51b3018 	ldr	r3, [fp, #-24]
f00156d4:	e1520003 	cmp	r2, r3
f00156d8:	ba000000 	blt	f00156e0 <print_string_3arg+0x78>
f00156dc:	ea000000 	b	f00156e4 <print_string_3arg+0x7c>
f00156e0:	eaffffe8 	b	f0015688 <print_string_3arg+0x20>
f00156e4:	ea000004 	b	f00156fc <print_string_3arg+0x94>
f00156e8:	e3a00020 	mov	r0, #32
f00156ec:	eb000217 	bl	f0015f50 <putc>
f00156f0:	e51b3008 	ldr	r3, [fp, #-8]
f00156f4:	e2833001 	add	r3, r3, #1
f00156f8:	e50b3008 	str	r3, [fp, #-8]
f00156fc:	e51b2008 	ldr	r2, [fp, #-8]
f0015700:	e51b3014 	ldr	r3, [fp, #-20]
f0015704:	e1520003 	cmp	r2, r3
f0015708:	bafffff6 	blt	f00156e8 <print_string_3arg+0x80>
f001570c:	e51b3008 	ldr	r3, [fp, #-8]
f0015710:	e1a00003 	mov	r0, r3
f0015714:	e24bd004 	sub	sp, fp, #4
f0015718:	e8bd8800 	pop	{fp, pc}

f001571c <print_string_1arg>:
f001571c:	e92d4800 	push	{fp, lr}
f0015720:	e28db004 	add	fp, sp, #4
f0015724:	e24dd018 	sub	sp, sp, #24
f0015728:	e50b0018 	str	r0, [fp, #-24]
f001572c:	e3a03000 	mov	r3, #0
f0015730:	e50b3008 	str	r3, [fp, #-8]
f0015734:	e3a03000 	mov	r3, #0
f0015738:	e50b300c 	str	r3, [fp, #-12]
f001573c:	e3a03000 	mov	r3, #0
f0015740:	e50b3010 	str	r3, [fp, #-16]
f0015744:	e51b3018 	ldr	r3, [fp, #-24]
f0015748:	e5d33000 	ldrb	r3, [r3]
f001574c:	e3530000 	cmp	r3, #0
f0015750:	1a000000 	bne	f0015758 <print_string_1arg+0x3c>
f0015754:	ea000011 	b	f00157a0 <print_string_1arg+0x84>
f0015758:	e51b3018 	ldr	r3, [fp, #-24]
f001575c:	e2832001 	add	r2, r3, #1
f0015760:	e50b2018 	str	r2, [fp, #-24]
f0015764:	e5d33000 	ldrb	r3, [r3]
f0015768:	e1a00003 	mov	r0, r3
f001576c:	eb0001f7 	bl	f0015f50 <putc>
f0015770:	e51b3008 	ldr	r3, [fp, #-8]
f0015774:	e2833001 	add	r3, r3, #1
f0015778:	e50b3008 	str	r3, [fp, #-8]
f001577c:	e51b3010 	ldr	r3, [fp, #-16]
f0015780:	e3530000 	cmp	r3, #0
f0015784:	0a000004 	beq	f001579c <print_string_1arg+0x80>
f0015788:	e51b2008 	ldr	r2, [fp, #-8]
f001578c:	e51b3010 	ldr	r3, [fp, #-16]
f0015790:	e1520003 	cmp	r2, r3
f0015794:	ba000000 	blt	f001579c <print_string_1arg+0x80>
f0015798:	ea000000 	b	f00157a0 <print_string_1arg+0x84>
f001579c:	eaffffe8 	b	f0015744 <print_string_1arg+0x28>
f00157a0:	ea000004 	b	f00157b8 <print_string_1arg+0x9c>
f00157a4:	e3a00020 	mov	r0, #32
f00157a8:	eb0001e8 	bl	f0015f50 <putc>
f00157ac:	e51b3008 	ldr	r3, [fp, #-8]
f00157b0:	e2833001 	add	r3, r3, #1
f00157b4:	e50b3008 	str	r3, [fp, #-8]
f00157b8:	e51b2008 	ldr	r2, [fp, #-8]
f00157bc:	e51b300c 	ldr	r3, [fp, #-12]
f00157c0:	e1520003 	cmp	r2, r3
f00157c4:	bafffff6 	blt	f00157a4 <print_string_1arg+0x88>
f00157c8:	e51b3008 	ldr	r3, [fp, #-8]
f00157cc:	e1a00003 	mov	r0, r3
f00157d0:	e24bd004 	sub	sp, fp, #4
f00157d4:	e8bd8800 	pop	{fp, pc}

f00157d8 <print_hex_sep>:
f00157d8:	e92d4800 	push	{fp, lr}
f00157dc:	e28db004 	add	fp, sp, #4
f00157e0:	e24dd018 	sub	sp, sp, #24
f00157e4:	e50b0010 	str	r0, [fp, #-16]
f00157e8:	e50b1014 	str	r1, [fp, #-20]
f00157ec:	e50b2018 	str	r2, [fp, #-24]
f00157f0:	e3a03000 	mov	r3, #0
f00157f4:	e50b3008 	str	r3, [fp, #-8]
f00157f8:	e51b2010 	ldr	r2, [fp, #-16]
f00157fc:	e51b3014 	ldr	r3, [fp, #-20]
f0015800:	e1a03332 	lsr	r3, r2, r3
f0015804:	e1a00003 	mov	r0, r3
f0015808:	e3a01000 	mov	r1, #0
f001580c:	e3a02000 	mov	r2, #0
f0015810:	ebfffe8b 	bl	f0015244 <print_hex_3arg>
f0015814:	e50b0008 	str	r0, [fp, #-8]
f0015818:	e51b0018 	ldr	r0, [fp, #-24]
f001581c:	ebffffbe 	bl	f001571c <print_string_1arg>
f0015820:	e1a03000 	mov	r3, r0
f0015824:	e51b2008 	ldr	r2, [fp, #-8]
f0015828:	e0823003 	add	r3, r2, r3
f001582c:	e50b3008 	str	r3, [fp, #-8]
f0015830:	e3a02001 	mov	r2, #1
f0015834:	e51b3014 	ldr	r3, [fp, #-20]
f0015838:	e1a03312 	lsl	r3, r2, r3
f001583c:	e2433001 	sub	r3, r3, #1
f0015840:	e1a02003 	mov	r2, r3
f0015844:	e51b3010 	ldr	r3, [fp, #-16]
f0015848:	e0023003 	and	r3, r2, r3
f001584c:	e1a00003 	mov	r0, r3
f0015850:	e3a01000 	mov	r1, #0
f0015854:	e3a02000 	mov	r2, #0
f0015858:	ebfffe79 	bl	f0015244 <print_hex_3arg>
f001585c:	e1a03000 	mov	r3, r0
f0015860:	e51b2008 	ldr	r2, [fp, #-8]
f0015864:	e0823003 	add	r3, r2, r3
f0015868:	e50b3008 	str	r3, [fp, #-8]
f001586c:	e51b3008 	ldr	r3, [fp, #-8]
f0015870:	e1a00003 	mov	r0, r3
f0015874:	e24bd004 	sub	sp, fp, #4
f0015878:	e8bd8800 	pop	{fp, pc}

f001587c <print_dec>:
f001587c:	e92d4800 	push	{fp, lr}
f0015880:	e28db004 	add	fp, sp, #4
f0015884:	e24dd010 	sub	sp, sp, #16
f0015888:	e50b0010 	str	r0, [fp, #-16]
f001588c:	e50b1014 	str	r1, [fp, #-20]
f0015890:	e3a03001 	mov	r3, #1
f0015894:	e50b3008 	str	r3, [fp, #-8]
f0015898:	e3a03001 	mov	r3, #1
f001589c:	e50b300c 	str	r3, [fp, #-12]
f00158a0:	ea000008 	b	f00158c8 <print_dec+0x4c>
f00158a4:	e51b2008 	ldr	r2, [fp, #-8]
f00158a8:	e1a03002 	mov	r3, r2
f00158ac:	e1a03103 	lsl	r3, r3, #2
f00158b0:	e0833002 	add	r3, r3, r2
f00158b4:	e1a03083 	lsl	r3, r3, #1
f00158b8:	e50b3008 	str	r3, [fp, #-8]
f00158bc:	e51b300c 	ldr	r3, [fp, #-12]
f00158c0:	e2833001 	add	r3, r3, #1
f00158c4:	e50b300c 	str	r3, [fp, #-12]
f00158c8:	e51b0010 	ldr	r0, [fp, #-16]
f00158cc:	e51b1008 	ldr	r1, [fp, #-8]
f00158d0:	eb0021a5 	bl	f001df6c <__aeabi_uidiv>
f00158d4:	e1a03000 	mov	r3, r0
f00158d8:	e3530009 	cmp	r3, #9
f00158dc:	8afffff0 	bhi	f00158a4 <print_dec+0x28>
f00158e0:	ea000004 	b	f00158f8 <print_dec+0x7c>
f00158e4:	e3a00020 	mov	r0, #32
f00158e8:	eb000198 	bl	f0015f50 <putc>
f00158ec:	e51b300c 	ldr	r3, [fp, #-12]
f00158f0:	e2833001 	add	r3, r3, #1
f00158f4:	e50b300c 	str	r3, [fp, #-12]
f00158f8:	e51b200c 	ldr	r2, [fp, #-12]
f00158fc:	e51b3014 	ldr	r3, [fp, #-20]
f0015900:	e1520003 	cmp	r2, r3
f0015904:	bafffff6 	blt	f00158e4 <print_dec+0x68>
f0015908:	e51b0010 	ldr	r0, [fp, #-16]
f001590c:	e51b1008 	ldr	r1, [fp, #-8]
f0015910:	eb002195 	bl	f001df6c <__aeabi_uidiv>
f0015914:	e1a03000 	mov	r3, r0
f0015918:	e1a01003 	mov	r1, r3
f001591c:	e59f305c 	ldr	r3, [pc, #92]	; f0015980 <print_dec+0x104>
f0015920:	e0832391 	umull	r2, r3, r1, r3
f0015924:	e1a021a3 	lsr	r2, r3, #3
f0015928:	e1a03002 	mov	r3, r2
f001592c:	e1a03103 	lsl	r3, r3, #2
f0015930:	e0833002 	add	r3, r3, r2
f0015934:	e1a03083 	lsl	r3, r3, #1
f0015938:	e0632001 	rsb	r2, r3, r1
f001593c:	e20230ff 	and	r3, r2, #255	; 0xff
f0015940:	e2833030 	add	r3, r3, #48	; 0x30
f0015944:	e20330ff 	and	r3, r3, #255	; 0xff
f0015948:	e1a00003 	mov	r0, r3
f001594c:	eb00017f 	bl	f0015f50 <putc>
f0015950:	e51b2008 	ldr	r2, [fp, #-8]
f0015954:	e59f3024 	ldr	r3, [pc, #36]	; f0015980 <print_dec+0x104>
f0015958:	e0831392 	umull	r1, r3, r2, r3
f001595c:	e1a031a3 	lsr	r3, r3, #3
f0015960:	e50b3008 	str	r3, [fp, #-8]
f0015964:	e51b3008 	ldr	r3, [fp, #-8]
f0015968:	e3530000 	cmp	r3, #0
f001596c:	1affffe5 	bne	f0015908 <print_dec+0x8c>
f0015970:	e51b300c 	ldr	r3, [fp, #-12]
f0015974:	e1a00003 	mov	r0, r3
f0015978:	e24bd004 	sub	sp, fp, #4
f001597c:	e8bd8800 	pop	{fp, pc}
f0015980:	cccccccd 	.word	0xcccccccd

f0015984 <do_printk>:
f0015984:	e92d4810 	push	{r4, fp, lr}
f0015988:	e28db008 	add	fp, sp, #8
f001598c:	e24dd03c 	sub	sp, sp, #60	; 0x3c
f0015990:	e50b0038 	str	r0, [fp, #-56]	; 0x38
f0015994:	e50b103c 	str	r1, [fp, #-60]	; 0x3c
f0015998:	e51b3038 	ldr	r3, [fp, #-56]	; 0x38
f001599c:	e50b3010 	str	r3, [fp, #-16]
f00159a0:	e3a03000 	mov	r3, #0
f00159a4:	e50b3014 	str	r3, [fp, #-20]
f00159a8:	e3a03000 	mov	r3, #0
f00159ac:	e50b3018 	str	r3, [fp, #-24]
f00159b0:	e3a03008 	mov	r3, #8
f00159b4:	e50b301c 	str	r3, [fp, #-28]
f00159b8:	e3a03000 	mov	r3, #0
f00159bc:	e50b3020 	str	r3, [fp, #-32]
f00159c0:	e3a03000 	mov	r3, #0
f00159c4:	e50b3024 	str	r3, [fp, #-36]	; 0x24
f00159c8:	e3a03000 	mov	r3, #0
f00159cc:	e50b3028 	str	r3, [fp, #-40]	; 0x28
f00159d0:	e51b3010 	ldr	r3, [fp, #-16]
f00159d4:	e3530000 	cmp	r3, #0
f00159d8:	1a000001 	bne	f00159e4 <do_printk+0x60>
f00159dc:	e3a03000 	mov	r3, #0
f00159e0:	ea00013c 	b	f0015ed8 <do_printk+0x554>
f00159e4:	ea000136 	b	f0015ec4 <do_printk+0x540>
f00159e8:	e51b3010 	ldr	r3, [fp, #-16]
f00159ec:	e5d33000 	ldrb	r3, [r3]
f00159f0:	e3530025 	cmp	r3, #37	; 0x25
f00159f4:	1a000127 	bne	f0015e98 <do_printk+0x514>
f00159f8:	e3a03000 	mov	r3, #0
f00159fc:	e50b3020 	str	r3, [fp, #-32]
f0015a00:	e51b3020 	ldr	r3, [fp, #-32]
f0015a04:	e50b301c 	str	r3, [fp, #-28]
f0015a08:	e3a03000 	mov	r3, #0
f0015a0c:	e50b3028 	str	r3, [fp, #-40]	; 0x28
f0015a10:	e51b3028 	ldr	r3, [fp, #-40]	; 0x28
f0015a14:	e50b3024 	str	r3, [fp, #-36]	; 0x24
f0015a18:	ea000000 	b	f0015a20 <do_printk+0x9c>
f0015a1c:	e1a00000 	nop			; (mov r0, r0)
f0015a20:	e51b3010 	ldr	r3, [fp, #-16]
f0015a24:	e2833001 	add	r3, r3, #1
f0015a28:	e50b3010 	str	r3, [fp, #-16]
f0015a2c:	e51b3010 	ldr	r3, [fp, #-16]
f0015a30:	e5d33000 	ldrb	r3, [r3]
f0015a34:	e2433025 	sub	r3, r3, #37	; 0x25
f0015a38:	e3530053 	cmp	r3, #83	; 0x53
f0015a3c:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
f0015a40:	ea000108 	b	f0015e68 <do_printk+0x4e4>
f0015a44:	f0015e44 	.word	0xf0015e44
f0015a48:	f0015e68 	.word	0xf0015e68
f0015a4c:	f0015e68 	.word	0xf0015e68
f0015a50:	f0015e68 	.word	0xf0015e68
f0015a54:	f0015e68 	.word	0xf0015e68
f0015a58:	f0015e68 	.word	0xf0015e68
f0015a5c:	f0015e68 	.word	0xf0015e68
f0015a60:	f0015e68 	.word	0xf0015e68
f0015a64:	f0015c84 	.word	0xf0015c84
f0015a68:	f0015b94 	.word	0xf0015b94
f0015a6c:	f0015e68 	.word	0xf0015e68
f0015a70:	f0015c30 	.word	0xf0015c30
f0015a74:	f0015c48 	.word	0xf0015c48
f0015a78:	f0015c48 	.word	0xf0015c48
f0015a7c:	f0015c48 	.word	0xf0015c48
f0015a80:	f0015c48 	.word	0xf0015c48
f0015a84:	f0015c48 	.word	0xf0015c48
f0015a88:	f0015c48 	.word	0xf0015c48
f0015a8c:	f0015c48 	.word	0xf0015c48
f0015a90:	f0015c48 	.word	0xf0015c48
f0015a94:	f0015c48 	.word	0xf0015c48
f0015a98:	f0015e68 	.word	0xf0015e68
f0015a9c:	f0015e68 	.word	0xf0015e68
f0015aa0:	f0015e68 	.word	0xf0015e68
f0015aa4:	f0015e68 	.word	0xf0015e68
f0015aa8:	f0015e68 	.word	0xf0015e68
f0015aac:	f0015e68 	.word	0xf0015e68
f0015ab0:	f0015e68 	.word	0xf0015e68
f0015ab4:	f0015e68 	.word	0xf0015e68
f0015ab8:	f0015e68 	.word	0xf0015e68
f0015abc:	f0015e68 	.word	0xf0015e68
f0015ac0:	f0015e68 	.word	0xf0015e68
f0015ac4:	f0015e68 	.word	0xf0015e68
f0015ac8:	f0015e68 	.word	0xf0015e68
f0015acc:	f0015e68 	.word	0xf0015e68
f0015ad0:	f0015e68 	.word	0xf0015e68
f0015ad4:	f0015e68 	.word	0xf0015e68
f0015ad8:	f0015e68 	.word	0xf0015e68
f0015adc:	f0015e68 	.word	0xf0015e68
f0015ae0:	f0015e68 	.word	0xf0015e68
f0015ae4:	f0015e68 	.word	0xf0015e68
f0015ae8:	f0015e68 	.word	0xf0015e68
f0015aec:	f0015e68 	.word	0xf0015e68
f0015af0:	f0015e68 	.word	0xf0015e68
f0015af4:	f0015e68 	.word	0xf0015e68
f0015af8:	f0015e68 	.word	0xf0015e68
f0015afc:	f0015e68 	.word	0xf0015e68
f0015b00:	f0015e84 	.word	0xf0015e84
f0015b04:	f0015e68 	.word	0xf0015e68
f0015b08:	f0015e68 	.word	0xf0015e68
f0015b0c:	f0015e68 	.word	0xf0015e68
f0015b10:	f0015e68 	.word	0xf0015e68
f0015b14:	f0015e68 	.word	0xf0015e68
f0015b18:	f0015e68 	.word	0xf0015e68
f0015b1c:	f0015e68 	.word	0xf0015e68
f0015b20:	f0015e68 	.word	0xf0015e68
f0015b24:	f0015e68 	.word	0xf0015e68
f0015b28:	f0015e68 	.word	0xf0015e68
f0015b2c:	f0015e68 	.word	0xf0015e68
f0015b30:	f0015e68 	.word	0xf0015e68
f0015b34:	f0015e68 	.word	0xf0015e68
f0015b38:	f0015e68 	.word	0xf0015e68
f0015b3c:	f0015c90 	.word	0xf0015c90
f0015b40:	f0015d0c 	.word	0xf0015d0c
f0015b44:	f0015e68 	.word	0xf0015e68
f0015b48:	f0015e68 	.word	0xf0015e68
f0015b4c:	f0015e68 	.word	0xf0015e68
f0015b50:	f0015e68 	.word	0xf0015e68
f0015b54:	f0015e68 	.word	0xf0015e68
f0015b58:	f0015e68 	.word	0xf0015e68
f0015b5c:	f0015e68 	.word	0xf0015e68
f0015b60:	f0015a1c 	.word	0xf0015a1c
f0015b64:	f0015cbc 	.word	0xf0015cbc
f0015b68:	f0015e68 	.word	0xf0015e68
f0015b6c:	f0015e68 	.word	0xf0015e68
f0015b70:	f0015d94 	.word	0xf0015d94
f0015b74:	f0015e68 	.word	0xf0015e68
f0015b78:	f0015e68 	.word	0xf0015e68
f0015b7c:	f0015ddc 	.word	0xf0015ddc
f0015b80:	f0015e84 	.word	0xf0015e84
f0015b84:	f0015d64 	.word	0xf0015d64
f0015b88:	f0015e68 	.word	0xf0015e68
f0015b8c:	f0015c78 	.word	0xf0015c78
f0015b90:	f0015d9c 	.word	0xf0015d9c
f0015b94:	e51b3010 	ldr	r3, [fp, #-16]
f0015b98:	e2833001 	add	r3, r3, #1
f0015b9c:	e50b3010 	str	r3, [fp, #-16]
f0015ba0:	ea00000d 	b	f0015bdc <do_printk+0x258>
f0015ba4:	e51b2020 	ldr	r2, [fp, #-32]
f0015ba8:	e1a03002 	mov	r3, r2
f0015bac:	e1a03103 	lsl	r3, r3, #2
f0015bb0:	e0833002 	add	r3, r3, r2
f0015bb4:	e1a03083 	lsl	r3, r3, #1
f0015bb8:	e1a02003 	mov	r2, r3
f0015bbc:	e51b3010 	ldr	r3, [fp, #-16]
f0015bc0:	e5d33000 	ldrb	r3, [r3]
f0015bc4:	e0823003 	add	r3, r2, r3
f0015bc8:	e2433030 	sub	r3, r3, #48	; 0x30
f0015bcc:	e50b3020 	str	r3, [fp, #-32]
f0015bd0:	e51b3010 	ldr	r3, [fp, #-16]
f0015bd4:	e2833001 	add	r3, r3, #1
f0015bd8:	e50b3010 	str	r3, [fp, #-16]
f0015bdc:	e51b3010 	ldr	r3, [fp, #-16]
f0015be0:	e5d33000 	ldrb	r3, [r3]
f0015be4:	e353002f 	cmp	r3, #47	; 0x2f
f0015be8:	9a000003 	bls	f0015bfc <do_printk+0x278>
f0015bec:	e51b3010 	ldr	r3, [fp, #-16]
f0015bf0:	e5d33000 	ldrb	r3, [r3]
f0015bf4:	e3530039 	cmp	r3, #57	; 0x39
f0015bf8:	9affffe9 	bls	f0015ba4 <do_printk+0x220>
f0015bfc:	e51b3010 	ldr	r3, [fp, #-16]
f0015c00:	e5d33000 	ldrb	r3, [r3]
f0015c04:	e3530077 	cmp	r3, #119	; 0x77
f0015c08:	1a000004 	bne	f0015c20 <do_printk+0x29c>
f0015c0c:	e3a03008 	mov	r3, #8
f0015c10:	e50b3020 	str	r3, [fp, #-32]
f0015c14:	e51b3010 	ldr	r3, [fp, #-16]
f0015c18:	e2833001 	add	r3, r3, #1
f0015c1c:	e50b3010 	str	r3, [fp, #-16]
f0015c20:	e51b3010 	ldr	r3, [fp, #-16]
f0015c24:	e2433001 	sub	r3, r3, #1
f0015c28:	e50b3010 	str	r3, [fp, #-16]
f0015c2c:	eaffff7b 	b	f0015a20 <do_printk+0x9c>
f0015c30:	e51b301c 	ldr	r3, [fp, #-28]
f0015c34:	e3530000 	cmp	r3, #0
f0015c38:	13a03000 	movne	r3, #0
f0015c3c:	03a03001 	moveq	r3, #1
f0015c40:	e20330ff 	and	r3, r3, #255	; 0xff
f0015c44:	e50b3028 	str	r3, [fp, #-40]	; 0x28
f0015c48:	e51b201c 	ldr	r2, [fp, #-28]
f0015c4c:	e1a03002 	mov	r3, r2
f0015c50:	e1a03103 	lsl	r3, r3, #2
f0015c54:	e0833002 	add	r3, r3, r2
f0015c58:	e1a03083 	lsl	r3, r3, #1
f0015c5c:	e1a02003 	mov	r2, r3
f0015c60:	e51b3010 	ldr	r3, [fp, #-16]
f0015c64:	e5d33000 	ldrb	r3, [r3]
f0015c68:	e0823003 	add	r3, r2, r3
f0015c6c:	e2433030 	sub	r3, r3, #48	; 0x30
f0015c70:	e50b301c 	str	r3, [fp, #-28]
f0015c74:	eaffff69 	b	f0015a20 <do_printk+0x9c>
f0015c78:	e3a03008 	mov	r3, #8
f0015c7c:	e50b301c 	str	r3, [fp, #-28]
f0015c80:	eaffff66 	b	f0015a20 <do_printk+0x9c>
f0015c84:	e3a03000 	mov	r3, #0
f0015c88:	e50b3024 	str	r3, [fp, #-36]	; 0x24
f0015c8c:	eaffff63 	b	f0015a20 <do_printk+0x9c>
f0015c90:	e51b303c 	ldr	r3, [fp, #-60]	; 0x3c
f0015c94:	e2832004 	add	r2, r3, #4
f0015c98:	e50b203c 	str	r2, [fp, #-60]	; 0x3c
f0015c9c:	e5933000 	ldr	r3, [r3]
f0015ca0:	e20330ff 	and	r3, r3, #255	; 0xff
f0015ca4:	e1a00003 	mov	r0, r3
f0015ca8:	eb0000a8 	bl	f0015f50 <putc>
f0015cac:	e51b3014 	ldr	r3, [fp, #-20]
f0015cb0:	e2833001 	add	r3, r3, #1
f0015cb4:	e50b3014 	str	r3, [fp, #-20]
f0015cb8:	ea000072 	b	f0015e88 <do_printk+0x504>
f0015cbc:	e51b303c 	ldr	r3, [fp, #-60]	; 0x3c
f0015cc0:	e2833007 	add	r3, r3, #7
f0015cc4:	e3c33007 	bic	r3, r3, #7
f0015cc8:	e2832008 	add	r2, r3, #8
f0015ccc:	e50b203c 	str	r2, [fp, #-60]	; 0x3c
f0015cd0:	e8930018 	ldm	r3, {r3, r4}
f0015cd4:	e51b2024 	ldr	r2, [fp, #-36]	; 0x24
f0015cd8:	e58d2000 	str	r2, [sp]
f0015cdc:	e51b2028 	ldr	r2, [fp, #-40]	; 0x28
f0015ce0:	e58d2004 	str	r2, [sp, #4]
f0015ce4:	e1a00003 	mov	r0, r3
f0015ce8:	e1a01004 	mov	r1, r4
f0015cec:	e51b201c 	ldr	r2, [fp, #-28]
f0015cf0:	e51b3020 	ldr	r3, [fp, #-32]
f0015cf4:	ebfffc55 	bl	f0014e50 <print_hex64>
f0015cf8:	e1a03000 	mov	r3, r0
f0015cfc:	e51b2014 	ldr	r2, [fp, #-20]
f0015d00:	e0823003 	add	r3, r2, r3
f0015d04:	e50b3014 	str	r3, [fp, #-20]
f0015d08:	ea00005e 	b	f0015e88 <do_printk+0x504>
f0015d0c:	e51b303c 	ldr	r3, [fp, #-60]	; 0x3c
f0015d10:	e2832004 	add	r2, r3, #4
f0015d14:	e50b203c 	str	r2, [fp, #-60]	; 0x3c
f0015d18:	e5933000 	ldr	r3, [r3]
f0015d1c:	e50b302c 	str	r3, [fp, #-44]	; 0x2c
f0015d20:	e51b302c 	ldr	r3, [fp, #-44]	; 0x2c
f0015d24:	e3530000 	cmp	r3, #0
f0015d28:	aa000004 	bge	f0015d40 <do_printk+0x3bc>
f0015d2c:	e3a0002d 	mov	r0, #45	; 0x2d
f0015d30:	eb000086 	bl	f0015f50 <putc>
f0015d34:	e51b302c 	ldr	r3, [fp, #-44]	; 0x2c
f0015d38:	e2633000 	rsb	r3, r3, #0
f0015d3c:	e50b302c 	str	r3, [fp, #-44]	; 0x2c
f0015d40:	e51b302c 	ldr	r3, [fp, #-44]	; 0x2c
f0015d44:	e1a00003 	mov	r0, r3
f0015d48:	e51b101c 	ldr	r1, [fp, #-28]
f0015d4c:	ebfffeca 	bl	f001587c <print_dec>
f0015d50:	e1a03000 	mov	r3, r0
f0015d54:	e51b2014 	ldr	r2, [fp, #-20]
f0015d58:	e0823003 	add	r3, r2, r3
f0015d5c:	e50b3014 	str	r3, [fp, #-20]
f0015d60:	ea000048 	b	f0015e88 <do_printk+0x504>
f0015d64:	e51b303c 	ldr	r3, [fp, #-60]	; 0x3c
f0015d68:	e2832004 	add	r2, r3, #4
f0015d6c:	e50b203c 	str	r2, [fp, #-60]	; 0x3c
f0015d70:	e5933000 	ldr	r3, [r3]
f0015d74:	e1a00003 	mov	r0, r3
f0015d78:	e51b101c 	ldr	r1, [fp, #-28]
f0015d7c:	ebfffebe 	bl	f001587c <print_dec>
f0015d80:	e1a03000 	mov	r3, r0
f0015d84:	e51b2014 	ldr	r2, [fp, #-20]
f0015d88:	e0823003 	add	r3, r2, r3
f0015d8c:	e50b3014 	str	r3, [fp, #-20]
f0015d90:	ea00003c 	b	f0015e88 <do_printk+0x504>
f0015d94:	e3a03008 	mov	r3, #8
f0015d98:	e50b3020 	str	r3, [fp, #-32]
f0015d9c:	e51b303c 	ldr	r3, [fp, #-60]	; 0x3c
f0015da0:	e2832004 	add	r2, r3, #4
f0015da4:	e50b203c 	str	r2, [fp, #-60]	; 0x3c
f0015da8:	e5933000 	ldr	r3, [r3]
f0015dac:	e51b2028 	ldr	r2, [fp, #-40]	; 0x28
f0015db0:	e58d2000 	str	r2, [sp]
f0015db4:	e1a00003 	mov	r0, r3
f0015db8:	e51b101c 	ldr	r1, [fp, #-28]
f0015dbc:	e51b2020 	ldr	r2, [fp, #-32]
f0015dc0:	e51b3024 	ldr	r3, [fp, #-36]	; 0x24
f0015dc4:	ebfffda4 	bl	f001545c <print_hex_5arg>
f0015dc8:	e1a03000 	mov	r3, r0
f0015dcc:	e51b2014 	ldr	r2, [fp, #-20]
f0015dd0:	e0823003 	add	r3, r2, r3
f0015dd4:	e50b3014 	str	r3, [fp, #-20]
f0015dd8:	ea00002a 	b	f0015e88 <do_printk+0x504>
f0015ddc:	e51b303c 	ldr	r3, [fp, #-60]	; 0x3c
f0015de0:	e2832004 	add	r2, r3, #4
f0015de4:	e50b203c 	str	r2, [fp, #-60]	; 0x3c
f0015de8:	e5933000 	ldr	r3, [r3]
f0015dec:	e50b3030 	str	r3, [fp, #-48]	; 0x30
f0015df0:	e51b3030 	ldr	r3, [fp, #-48]	; 0x30
f0015df4:	e3530000 	cmp	r3, #0
f0015df8:	0a000008 	beq	f0015e20 <do_printk+0x49c>
f0015dfc:	e51b0030 	ldr	r0, [fp, #-48]	; 0x30
f0015e00:	e51b101c 	ldr	r1, [fp, #-28]
f0015e04:	e51b2020 	ldr	r2, [fp, #-32]
f0015e08:	ebfffe16 	bl	f0015668 <print_string_3arg>
f0015e0c:	e1a03000 	mov	r3, r0
f0015e10:	e51b2014 	ldr	r2, [fp, #-20]
f0015e14:	e0823003 	add	r3, r2, r3
f0015e18:	e50b3014 	str	r3, [fp, #-20]
f0015e1c:	ea000019 	b	f0015e88 <do_printk+0x504>
f0015e20:	e59f00bc 	ldr	r0, [pc, #188]	; f0015ee4 <do_printk+0x560>
f0015e24:	e51b101c 	ldr	r1, [fp, #-28]
f0015e28:	e51b2020 	ldr	r2, [fp, #-32]
f0015e2c:	ebfffe0d 	bl	f0015668 <print_string_3arg>
f0015e30:	e1a03000 	mov	r3, r0
f0015e34:	e51b2014 	ldr	r2, [fp, #-20]
f0015e38:	e0823003 	add	r3, r2, r3
f0015e3c:	e50b3014 	str	r3, [fp, #-20]
f0015e40:	ea000010 	b	f0015e88 <do_printk+0x504>
f0015e44:	e3a00025 	mov	r0, #37	; 0x25
f0015e48:	eb000040 	bl	f0015f50 <putc>
f0015e4c:	e51b3014 	ldr	r3, [fp, #-20]
f0015e50:	e2833001 	add	r3, r3, #1
f0015e54:	e50b3014 	str	r3, [fp, #-20]
f0015e58:	e51b3010 	ldr	r3, [fp, #-16]
f0015e5c:	e2833001 	add	r3, r3, #1
f0015e60:	e50b3010 	str	r3, [fp, #-16]
f0015e64:	ea000016 	b	f0015ec4 <do_printk+0x540>
f0015e68:	e59f0078 	ldr	r0, [pc, #120]	; f0015ee8 <do_printk+0x564>
f0015e6c:	ebfffe2a 	bl	f001571c <print_string_1arg>
f0015e70:	e1a03000 	mov	r3, r0
f0015e74:	e51b2014 	ldr	r2, [fp, #-20]
f0015e78:	e0823003 	add	r3, r2, r3
f0015e7c:	e50b3014 	str	r3, [fp, #-20]
f0015e80:	ea000000 	b	f0015e88 <do_printk+0x504>
f0015e84:	e1a00000 	nop			; (mov r0, r0)
f0015e88:	e51b3018 	ldr	r3, [fp, #-24]
f0015e8c:	e2833001 	add	r3, r3, #1
f0015e90:	e50b3018 	str	r3, [fp, #-24]
f0015e94:	ea000007 	b	f0015eb8 <do_printk+0x534>
f0015e98:	e51b3010 	ldr	r3, [fp, #-16]
f0015e9c:	e5d33000 	ldrb	r3, [r3]
f0015ea0:	e1a00003 	mov	r0, r3
f0015ea4:	eb000029 	bl	f0015f50 <putc>
f0015ea8:	e51b3014 	ldr	r3, [fp, #-20]
f0015eac:	e2833001 	add	r3, r3, #1
f0015eb0:	e50b3014 	str	r3, [fp, #-20]
f0015eb4:	e1a00000 	nop			; (mov r0, r0)
f0015eb8:	e51b3010 	ldr	r3, [fp, #-16]
f0015ebc:	e2833001 	add	r3, r3, #1
f0015ec0:	e50b3010 	str	r3, [fp, #-16]
f0015ec4:	e51b3010 	ldr	r3, [fp, #-16]
f0015ec8:	e5d33000 	ldrb	r3, [r3]
f0015ecc:	e3530000 	cmp	r3, #0
f0015ed0:	1afffec4 	bne	f00159e8 <do_printk+0x64>
f0015ed4:	e51b3014 	ldr	r3, [fp, #-20]
f0015ed8:	e1a00003 	mov	r0, r3
f0015edc:	e24bd008 	sub	sp, fp, #8
f0015ee0:	e8bd8810 	pop	{r4, fp, pc}
f0015ee4:	f001f4c8 	.word	0xf001f4c8
f0015ee8:	f001f4d0 	.word	0xf001f4d0

f0015eec <printk>:
f0015eec:	e92d000f 	push	{r0, r1, r2, r3}
f0015ef0:	e92d4800 	push	{fp, lr}
f0015ef4:	e28db004 	add	fp, sp, #4
f0015ef8:	e24dd010 	sub	sp, sp, #16
f0015efc:	e28b3008 	add	r3, fp, #8
f0015f00:	e50b300c 	str	r3, [fp, #-12]
f0015f04:	e24b3010 	sub	r3, fp, #16
f0015f08:	e59f003c 	ldr	r0, [pc, #60]	; f0015f4c <printk+0x60>
f0015f0c:	e1a01003 	mov	r1, r3
f0015f10:	ebfffbbc 	bl	f0014e08 <spin_lock_irq>
f0015f14:	e59b0004 	ldr	r0, [fp, #4]
f0015f18:	e51b100c 	ldr	r1, [fp, #-12]
f0015f1c:	ebfffe98 	bl	f0015984 <do_printk>
f0015f20:	e50b0008 	str	r0, [fp, #-8]
f0015f24:	e51b3010 	ldr	r3, [fp, #-16]
f0015f28:	e59f001c 	ldr	r0, [pc, #28]	; f0015f4c <printk+0x60>
f0015f2c:	e1a01003 	mov	r1, r3
f0015f30:	ebfffbbd 	bl	f0014e2c <spin_unlock_irq>
f0015f34:	e51b3008 	ldr	r3, [fp, #-8]
f0015f38:	e1a00003 	mov	r0, r3
f0015f3c:	e24bd004 	sub	sp, fp, #4
f0015f40:	e8bd4800 	pop	{fp, lr}
f0015f44:	e28dd010 	add	sp, sp, #16
f0015f48:	e12fff1e 	bx	lr
f0015f4c:	f002d020 	.word	0xf002d020

f0015f50 <putc>:
f0015f50:	e92d4800 	push	{fp, lr}
f0015f54:	e28db004 	add	fp, sp, #4
f0015f58:	e24dd008 	sub	sp, sp, #8
f0015f5c:	e1a03000 	mov	r3, r0
f0015f60:	e54b3005 	strb	r3, [fp, #-5]
f0015f64:	e55b3005 	ldrb	r3, [fp, #-5]
f0015f68:	e353000a 	cmp	r3, #10
f0015f6c:	1a000002 	bne	f0015f7c <putc+0x2c>
f0015f70:	e59f001c 	ldr	r0, [pc, #28]	; f0015f94 <putc+0x44>
f0015f74:	e3a0100d 	mov	r1, #13
f0015f78:	eb001d30 	bl	f001d440 <uart_tx_char>
f0015f7c:	e55b3005 	ldrb	r3, [fp, #-5]
f0015f80:	e59f000c 	ldr	r0, [pc, #12]	; f0015f94 <putc+0x44>
f0015f84:	e1a01003 	mov	r1, r3
f0015f88:	eb001d2c 	bl	f001d440 <uart_tx_char>
f0015f8c:	e24bd004 	sub	sp, fp, #4
f0015f90:	e8bd8800 	pop	{fp, pc}
f0015f94:	f9001000 	.word	0xf9001000

f0015f98 <memset>:
f0015f98:	e92d4800 	push	{fp, lr}
f0015f9c:	e28db004 	add	fp, sp, #4
f0015fa0:	e24dd010 	sub	sp, sp, #16
f0015fa4:	e50b0008 	str	r0, [fp, #-8]
f0015fa8:	e50b100c 	str	r1, [fp, #-12]
f0015fac:	e50b2010 	str	r2, [fp, #-16]
f0015fb0:	e51b0008 	ldr	r0, [fp, #-8]
f0015fb4:	e51b100c 	ldr	r1, [fp, #-12]
f0015fb8:	e51b2010 	ldr	r2, [fp, #-16]
f0015fbc:	ebfff678 	bl	f00139a4 <_memset>
f0015fc0:	e1a03000 	mov	r3, r0
f0015fc4:	e1a00003 	mov	r0, r3
f0015fc8:	e24bd004 	sub	sp, fp, #4
f0015fcc:	e8bd8800 	pop	{fp, pc}

f0015fd0 <memcpy>:
f0015fd0:	e92d4800 	push	{fp, lr}
f0015fd4:	e28db004 	add	fp, sp, #4
f0015fd8:	e24dd010 	sub	sp, sp, #16
f0015fdc:	e50b0008 	str	r0, [fp, #-8]
f0015fe0:	e50b100c 	str	r1, [fp, #-12]
f0015fe4:	e50b2010 	str	r2, [fp, #-16]
f0015fe8:	e51b0008 	ldr	r0, [fp, #-8]
f0015fec:	e51b100c 	ldr	r1, [fp, #-12]
f0015ff0:	e51b2010 	ldr	r2, [fp, #-16]
f0015ff4:	ebfff696 	bl	f0013a54 <_memcpy>
f0015ff8:	e1a03000 	mov	r3, r0
f0015ffc:	e1a00003 	mov	r0, r3
f0016000:	e24bd004 	sub	sp, fp, #4
f0016004:	e8bd8800 	pop	{fp, pc}

f0016008 <strcmp>:
f0016008:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f001600c:	e28db000 	add	fp, sp, #0
f0016010:	e24dd014 	sub	sp, sp, #20
f0016014:	e50b0010 	str	r0, [fp, #-16]
f0016018:	e50b1014 	str	r1, [fp, #-20]
f001601c:	e3a03000 	mov	r3, #0
f0016020:	e50b3008 	str	r3, [fp, #-8]
f0016024:	e51b2010 	ldr	r2, [fp, #-16]
f0016028:	e51b3008 	ldr	r3, [fp, #-8]
f001602c:	e0823003 	add	r3, r2, r3
f0016030:	e5d33000 	ldrb	r3, [r3]
f0016034:	e1a02003 	mov	r2, r3
f0016038:	e51b1014 	ldr	r1, [fp, #-20]
f001603c:	e51b3008 	ldr	r3, [fp, #-8]
f0016040:	e0813003 	add	r3, r1, r3
f0016044:	e5d33000 	ldrb	r3, [r3]
f0016048:	e0633002 	rsb	r3, r3, r2
f001604c:	e50b300c 	str	r3, [fp, #-12]
f0016050:	e51b300c 	ldr	r3, [fp, #-12]
f0016054:	e3530000 	cmp	r3, #0
f0016058:	1a000005 	bne	f0016074 <strcmp+0x6c>
f001605c:	e51b2010 	ldr	r2, [fp, #-16]
f0016060:	e51b3008 	ldr	r3, [fp, #-8]
f0016064:	e0823003 	add	r3, r2, r3
f0016068:	e5d33000 	ldrb	r3, [r3]
f001606c:	e3530000 	cmp	r3, #0
f0016070:	1a000001 	bne	f001607c <strcmp+0x74>
f0016074:	e51b300c 	ldr	r3, [fp, #-12]
f0016078:	ea000003 	b	f001608c <strcmp+0x84>
f001607c:	e51b3008 	ldr	r3, [fp, #-8]
f0016080:	e2833001 	add	r3, r3, #1
f0016084:	e50b3008 	str	r3, [fp, #-8]
f0016088:	eaffffe5 	b	f0016024 <strcmp+0x1c>
f001608c:	e1a00003 	mov	r0, r3
f0016090:	e24bd000 	sub	sp, fp, #0
f0016094:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0016098:	e12fff1e 	bx	lr

f001609c <strncpy>:
f001609c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f00160a0:	e28db000 	add	fp, sp, #0
f00160a4:	e24dd01c 	sub	sp, sp, #28
f00160a8:	e50b0010 	str	r0, [fp, #-16]
f00160ac:	e50b1014 	str	r1, [fp, #-20]
f00160b0:	e50b2018 	str	r2, [fp, #-24]
f00160b4:	e51b3010 	ldr	r3, [fp, #-16]
f00160b8:	e50b3008 	str	r3, [fp, #-8]
f00160bc:	ea000010 	b	f0016104 <strncpy+0x68>
f00160c0:	e51b3014 	ldr	r3, [fp, #-20]
f00160c4:	e5d32000 	ldrb	r2, [r3]
f00160c8:	e51b3008 	ldr	r3, [fp, #-8]
f00160cc:	e5c32000 	strb	r2, [r3]
f00160d0:	e51b3014 	ldr	r3, [fp, #-20]
f00160d4:	e5d33000 	ldrb	r3, [r3]
f00160d8:	e3530000 	cmp	r3, #0
f00160dc:	0a000002 	beq	f00160ec <strncpy+0x50>
f00160e0:	e51b3014 	ldr	r3, [fp, #-20]
f00160e4:	e2833001 	add	r3, r3, #1
f00160e8:	e50b3014 	str	r3, [fp, #-20]
f00160ec:	e51b3008 	ldr	r3, [fp, #-8]
f00160f0:	e2833001 	add	r3, r3, #1
f00160f4:	e50b3008 	str	r3, [fp, #-8]
f00160f8:	e51b3018 	ldr	r3, [fp, #-24]
f00160fc:	e2433001 	sub	r3, r3, #1
f0016100:	e50b3018 	str	r3, [fp, #-24]
f0016104:	e51b3018 	ldr	r3, [fp, #-24]
f0016108:	e3530000 	cmp	r3, #0
f001610c:	1affffeb 	bne	f00160c0 <strncpy+0x24>
f0016110:	e51b3010 	ldr	r3, [fp, #-16]
f0016114:	e1a00003 	mov	r0, r3
f0016118:	e24bd000 	sub	sp, fp, #0
f001611c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0016120:	e12fff1e 	bx	lr

f0016124 <__clz>:
f0016124:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f0016128:	e28db000 	add	fp, sp, #0
f001612c:	e24dd014 	sub	sp, sp, #20
f0016130:	e50b0010 	str	r0, [fp, #-16]
f0016134:	e3a03000 	mov	r3, #0
f0016138:	e50b3008 	str	r3, [fp, #-8]
f001613c:	ea000005 	b	f0016158 <__clz+0x34>
f0016140:	e51b3010 	ldr	r3, [fp, #-16]
f0016144:	e1a03083 	lsl	r3, r3, #1
f0016148:	e50b3010 	str	r3, [fp, #-16]
f001614c:	e51b3008 	ldr	r3, [fp, #-8]
f0016150:	e2833001 	add	r3, r3, #1
f0016154:	e50b3008 	str	r3, [fp, #-8]
f0016158:	e51b3010 	ldr	r3, [fp, #-16]
f001615c:	e3530000 	cmp	r3, #0
f0016160:	ba000002 	blt	f0016170 <__clz+0x4c>
f0016164:	e51b3008 	ldr	r3, [fp, #-8]
f0016168:	e353001f 	cmp	r3, #31
f001616c:	9afffff3 	bls	f0016140 <__clz+0x1c>
f0016170:	e51b3008 	ldr	r3, [fp, #-8]
f0016174:	e1a00003 	mov	r0, r3
f0016178:	e24bd000 	sub	sp, fp, #0
f001617c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0016180:	e12fff1e 	bx	lr

f0016184 <find_and_set_first_free_bit>:
f0016184:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f0016188:	e28db000 	add	fp, sp, #0
f001618c:	e24dd014 	sub	sp, sp, #20
f0016190:	e50b0010 	str	r0, [fp, #-16]
f0016194:	e50b1014 	str	r1, [fp, #-20]
f0016198:	e3a03000 	mov	r3, #0
f001619c:	e50b3008 	str	r3, [fp, #-8]
f00161a0:	e3a03000 	mov	r3, #0
f00161a4:	e50b300c 	str	r3, [fp, #-12]
f00161a8:	ea00002b 	b	f001625c <find_and_set_first_free_bit+0xd8>
f00161ac:	e51b300c 	ldr	r3, [fp, #-12]
f00161b0:	e1a032c3 	asr	r3, r3, #5
f00161b4:	e1a03103 	lsl	r3, r3, #2
f00161b8:	e51b2010 	ldr	r2, [fp, #-16]
f00161bc:	e0823003 	add	r3, r2, r3
f00161c0:	e5931000 	ldr	r1, [r3]
f00161c4:	e51b200c 	ldr	r2, [fp, #-12]
f00161c8:	e1a03fc2 	asr	r3, r2, #31
f00161cc:	e1a03da3 	lsr	r3, r3, #27
f00161d0:	e0822003 	add	r2, r2, r3
f00161d4:	e202201f 	and	r2, r2, #31
f00161d8:	e0633002 	rsb	r3, r3, r2
f00161dc:	e3a02001 	mov	r2, #1
f00161e0:	e1a03312 	lsl	r3, r2, r3
f00161e4:	e0013003 	and	r3, r1, r3
f00161e8:	e3530000 	cmp	r3, #0
f00161ec:	1a000017 	bne	f0016250 <find_and_set_first_free_bit+0xcc>
f00161f0:	e51b300c 	ldr	r3, [fp, #-12]
f00161f4:	e1a032c3 	asr	r3, r3, #5
f00161f8:	e1a03103 	lsl	r3, r3, #2
f00161fc:	e51b2010 	ldr	r2, [fp, #-16]
f0016200:	e0821003 	add	r1, r2, r3
f0016204:	e51b300c 	ldr	r3, [fp, #-12]
f0016208:	e1a032c3 	asr	r3, r3, #5
f001620c:	e1a03103 	lsl	r3, r3, #2
f0016210:	e51b2010 	ldr	r2, [fp, #-16]
f0016214:	e0823003 	add	r3, r2, r3
f0016218:	e5930000 	ldr	r0, [r3]
f001621c:	e51b200c 	ldr	r2, [fp, #-12]
f0016220:	e1a03fc2 	asr	r3, r2, #31
f0016224:	e1a03da3 	lsr	r3, r3, #27
f0016228:	e0822003 	add	r2, r2, r3
f001622c:	e202201f 	and	r2, r2, #31
f0016230:	e0633002 	rsb	r3, r3, r2
f0016234:	e3a02001 	mov	r2, #1
f0016238:	e1a03312 	lsl	r3, r2, r3
f001623c:	e1803003 	orr	r3, r0, r3
f0016240:	e5813000 	str	r3, [r1]
f0016244:	e3a03001 	mov	r3, #1
f0016248:	e50b3008 	str	r3, [fp, #-8]
f001624c:	ea000006 	b	f001626c <find_and_set_first_free_bit+0xe8>
f0016250:	e51b300c 	ldr	r3, [fp, #-12]
f0016254:	e2833001 	add	r3, r3, #1
f0016258:	e50b300c 	str	r3, [fp, #-12]
f001625c:	e51b200c 	ldr	r2, [fp, #-12]
f0016260:	e51b3014 	ldr	r3, [fp, #-20]
f0016264:	e1520003 	cmp	r2, r3
f0016268:	3affffcf 	bcc	f00161ac <find_and_set_first_free_bit+0x28>
f001626c:	e51b3008 	ldr	r3, [fp, #-8]
f0016270:	e3530000 	cmp	r3, #0
f0016274:	0a000001 	beq	f0016280 <find_and_set_first_free_bit+0xfc>
f0016278:	e51b300c 	ldr	r3, [fp, #-12]
f001627c:	ea000000 	b	f0016284 <find_and_set_first_free_bit+0x100>
f0016280:	e3e03000 	mvn	r3, #0
f0016284:	e1a00003 	mov	r0, r3
f0016288:	e24bd000 	sub	sp, fp, #0
f001628c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0016290:	e12fff1e 	bx	lr

f0016294 <check_and_clear_bit>:
f0016294:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f0016298:	e28db000 	add	fp, sp, #0
f001629c:	e24dd00c 	sub	sp, sp, #12
f00162a0:	e50b0008 	str	r0, [fp, #-8]
f00162a4:	e50b100c 	str	r1, [fp, #-12]
f00162a8:	e51b300c 	ldr	r3, [fp, #-12]
f00162ac:	e1a032c3 	asr	r3, r3, #5
f00162b0:	e1a03103 	lsl	r3, r3, #2
f00162b4:	e51b2008 	ldr	r2, [fp, #-8]
f00162b8:	e0823003 	add	r3, r2, r3
f00162bc:	e5931000 	ldr	r1, [r3]
f00162c0:	e51b200c 	ldr	r2, [fp, #-12]
f00162c4:	e1a03fc2 	asr	r3, r2, #31
f00162c8:	e1a03da3 	lsr	r3, r3, #27
f00162cc:	e0822003 	add	r2, r2, r3
f00162d0:	e202201f 	and	r2, r2, #31
f00162d4:	e0633002 	rsb	r3, r3, r2
f00162d8:	e3a02001 	mov	r2, #1
f00162dc:	e1a03312 	lsl	r3, r2, r3
f00162e0:	e0013003 	and	r3, r1, r3
f00162e4:	e3530000 	cmp	r3, #0
f00162e8:	0a000017 	beq	f001634c <check_and_clear_bit+0xb8>
f00162ec:	e51b300c 	ldr	r3, [fp, #-12]
f00162f0:	e1a032c3 	asr	r3, r3, #5
f00162f4:	e1a03103 	lsl	r3, r3, #2
f00162f8:	e51b2008 	ldr	r2, [fp, #-8]
f00162fc:	e0821003 	add	r1, r2, r3
f0016300:	e51b300c 	ldr	r3, [fp, #-12]
f0016304:	e1a032c3 	asr	r3, r3, #5
f0016308:	e1a03103 	lsl	r3, r3, #2
f001630c:	e51b2008 	ldr	r2, [fp, #-8]
f0016310:	e0823003 	add	r3, r2, r3
f0016314:	e5930000 	ldr	r0, [r3]
f0016318:	e51b200c 	ldr	r2, [fp, #-12]
f001631c:	e1a03fc2 	asr	r3, r2, #31
f0016320:	e1a03da3 	lsr	r3, r3, #27
f0016324:	e0822003 	add	r2, r2, r3
f0016328:	e202201f 	and	r2, r2, #31
f001632c:	e0633002 	rsb	r3, r3, r2
f0016330:	e3a02001 	mov	r2, #1
f0016334:	e1a03312 	lsl	r3, r2, r3
f0016338:	e1e03003 	mvn	r3, r3
f001633c:	e0003003 	and	r3, r0, r3
f0016340:	e5813000 	str	r3, [r1]
f0016344:	e3a03000 	mov	r3, #0
f0016348:	ea000000 	b	f0016350 <check_and_clear_bit+0xbc>
f001634c:	e3e03000 	mvn	r3, #0
f0016350:	e1a00003 	mov	r0, r3
f0016354:	e24bd000 	sub	sp, fp, #0
f0016358:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f001635c:	e12fff1e 	bx	lr

f0016360 <check_and_set_bit>:
f0016360:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f0016364:	e28db000 	add	fp, sp, #0
f0016368:	e24dd00c 	sub	sp, sp, #12
f001636c:	e50b0008 	str	r0, [fp, #-8]
f0016370:	e50b100c 	str	r1, [fp, #-12]
f0016374:	e51b300c 	ldr	r3, [fp, #-12]
f0016378:	e1a032c3 	asr	r3, r3, #5
f001637c:	e1a03103 	lsl	r3, r3, #2
f0016380:	e51b2008 	ldr	r2, [fp, #-8]
f0016384:	e0823003 	add	r3, r2, r3
f0016388:	e5931000 	ldr	r1, [r3]
f001638c:	e51b200c 	ldr	r2, [fp, #-12]
f0016390:	e1a03fc2 	asr	r3, r2, #31
f0016394:	e1a03da3 	lsr	r3, r3, #27
f0016398:	e0822003 	add	r2, r2, r3
f001639c:	e202201f 	and	r2, r2, #31
f00163a0:	e0633002 	rsb	r3, r3, r2
f00163a4:	e3a02001 	mov	r2, #1
f00163a8:	e1a03312 	lsl	r3, r2, r3
f00163ac:	e0013003 	and	r3, r1, r3
f00163b0:	e3530000 	cmp	r3, #0
f00163b4:	1a000016 	bne	f0016414 <check_and_set_bit+0xb4>
f00163b8:	e51b300c 	ldr	r3, [fp, #-12]
f00163bc:	e1a032c3 	asr	r3, r3, #5
f00163c0:	e1a03103 	lsl	r3, r3, #2
f00163c4:	e51b2008 	ldr	r2, [fp, #-8]
f00163c8:	e0821003 	add	r1, r2, r3
f00163cc:	e51b300c 	ldr	r3, [fp, #-12]
f00163d0:	e1a032c3 	asr	r3, r3, #5
f00163d4:	e1a03103 	lsl	r3, r3, #2
f00163d8:	e51b2008 	ldr	r2, [fp, #-8]
f00163dc:	e0823003 	add	r3, r2, r3
f00163e0:	e5930000 	ldr	r0, [r3]
f00163e4:	e51b200c 	ldr	r2, [fp, #-12]
f00163e8:	e1a03fc2 	asr	r3, r2, #31
f00163ec:	e1a03da3 	lsr	r3, r3, #27
f00163f0:	e0822003 	add	r2, r2, r3
f00163f4:	e202201f 	and	r2, r2, #31
f00163f8:	e0633002 	rsb	r3, r3, r2
f00163fc:	e3a02001 	mov	r2, #1
f0016400:	e1a03312 	lsl	r3, r2, r3
f0016404:	e1803003 	orr	r3, r0, r3
f0016408:	e5813000 	str	r3, [r1]
f001640c:	e3a03000 	mov	r3, #0
f0016410:	ea000000 	b	f0016418 <check_and_set_bit+0xb8>
f0016414:	e3e03000 	mvn	r3, #0
f0016418:	e1a00003 	mov	r0, r3
f001641c:	e24bd000 	sub	sp, fp, #0
f0016420:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0016424:	e12fff1e 	bx	lr

f0016428 <list_insert_tail>:
f0016428:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f001642c:	e28db000 	add	fp, sp, #0
f0016430:	e24dd014 	sub	sp, sp, #20
f0016434:	e50b0010 	str	r0, [fp, #-16]
f0016438:	e50b1014 	str	r1, [fp, #-20]
f001643c:	e51b3014 	ldr	r3, [fp, #-20]
f0016440:	e5933004 	ldr	r3, [r3, #4]
f0016444:	e50b3008 	str	r3, [fp, #-8]
f0016448:	e51b3010 	ldr	r3, [fp, #-16]
f001644c:	e51b2014 	ldr	r2, [fp, #-20]
f0016450:	e5832000 	str	r2, [r3]
f0016454:	e51b3014 	ldr	r3, [fp, #-20]
f0016458:	e51b2010 	ldr	r2, [fp, #-16]
f001645c:	e5832004 	str	r2, [r3, #4]
f0016460:	e51b3010 	ldr	r3, [fp, #-16]
f0016464:	e51b2008 	ldr	r2, [fp, #-8]
f0016468:	e5832004 	str	r2, [r3, #4]
f001646c:	e51b3008 	ldr	r3, [fp, #-8]
f0016470:	e51b2010 	ldr	r2, [fp, #-16]
f0016474:	e5832000 	str	r2, [r3]
f0016478:	e24bd000 	sub	sp, fp, #0
f001647c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0016480:	e12fff1e 	bx	lr

f0016484 <list_remove_init>:
f0016484:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f0016488:	e28db000 	add	fp, sp, #0
f001648c:	e24dd014 	sub	sp, sp, #20
f0016490:	e50b0010 	str	r0, [fp, #-16]
f0016494:	e51b3010 	ldr	r3, [fp, #-16]
f0016498:	e5933004 	ldr	r3, [r3, #4]
f001649c:	e50b3008 	str	r3, [fp, #-8]
f00164a0:	e51b3010 	ldr	r3, [fp, #-16]
f00164a4:	e5933000 	ldr	r3, [r3]
f00164a8:	e50b300c 	str	r3, [fp, #-12]
f00164ac:	e51b3008 	ldr	r3, [fp, #-8]
f00164b0:	e51b200c 	ldr	r2, [fp, #-12]
f00164b4:	e5832000 	str	r2, [r3]
f00164b8:	e51b300c 	ldr	r3, [fp, #-12]
f00164bc:	e51b2008 	ldr	r2, [fp, #-8]
f00164c0:	e5832004 	str	r2, [r3, #4]
f00164c4:	e51b3010 	ldr	r3, [fp, #-16]
f00164c8:	e51b2010 	ldr	r2, [fp, #-16]
f00164cc:	e5832000 	str	r2, [r3]
f00164d0:	e51b3010 	ldr	r3, [fp, #-16]
f00164d4:	e51b2010 	ldr	r2, [fp, #-16]
f00164d8:	e5832004 	str	r2, [r3, #4]
f00164dc:	e24bd000 	sub	sp, fp, #0
f00164e0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f00164e4:	e12fff1e 	bx	lr

f00164e8 <list_empty>:
f00164e8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f00164ec:	e28db000 	add	fp, sp, #0
f00164f0:	e24dd00c 	sub	sp, sp, #12
f00164f4:	e50b0008 	str	r0, [fp, #-8]
f00164f8:	e51b3008 	ldr	r3, [fp, #-8]
f00164fc:	e5932004 	ldr	r2, [r3, #4]
f0016500:	e51b3008 	ldr	r3, [fp, #-8]
f0016504:	e1520003 	cmp	r2, r3
f0016508:	1a000006 	bne	f0016528 <list_empty+0x40>
f001650c:	e51b3008 	ldr	r3, [fp, #-8]
f0016510:	e5932000 	ldr	r2, [r3]
f0016514:	e51b3008 	ldr	r3, [fp, #-8]
f0016518:	e1520003 	cmp	r2, r3
f001651c:	1a000001 	bne	f0016528 <list_empty+0x40>
f0016520:	e3a03001 	mov	r3, #1
f0016524:	ea000000 	b	f001652c <list_empty+0x44>
f0016528:	e3a03000 	mov	r3, #0
f001652c:	e1a00003 	mov	r0, r3
f0016530:	e24bd000 	sub	sp, fp, #0
f0016534:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0016538:	e12fff1e 	bx	lr

f001653c <spin_lock_irq>:
f001653c:	e92d4800 	push	{fp, lr}
f0016540:	e28db004 	add	fp, sp, #4
f0016544:	e24dd008 	sub	sp, sp, #8
f0016548:	e50b0008 	str	r0, [fp, #-8]
f001654c:	e50b100c 	str	r1, [fp, #-12]
f0016550:	e51b000c 	ldr	r0, [fp, #-12]
f0016554:	ebfff998 	bl	f0014bbc <irq_local_disable_save>
f0016558:	e24bd004 	sub	sp, fp, #4
f001655c:	e8bd8800 	pop	{fp, pc}

f0016560 <spin_unlock_irq>:
f0016560:	e92d4800 	push	{fp, lr}
f0016564:	e28db004 	add	fp, sp, #4
f0016568:	e24dd008 	sub	sp, sp, #8
f001656c:	e50b0008 	str	r0, [fp, #-8]
f0016570:	e50b100c 	str	r1, [fp, #-12]
f0016574:	e51b000c 	ldr	r0, [fp, #-12]
f0016578:	ebfff99e 	bl	f0014bf8 <irq_local_restore>
f001657c:	e24bd004 	sub	sp, fp, #4
f0016580:	e8bd8800 	pop	{fp, pc}

f0016584 <current_task>:
f0016584:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f0016588:	e28db000 	add	fp, sp, #0
f001658c:	e1a0300d 	mov	r3, sp
f0016590:	e3c33eff 	bic	r3, r3, #4080	; 0xff0
f0016594:	e3c3300f 	bic	r3, r3, #15
f0016598:	e1a00003 	mov	r0, r3
f001659c:	e24bd000 	sub	sp, fp, #0
f00165a0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f00165a4:	e12fff1e 	bx	lr

f00165a8 <task_set_wqh>:
f00165a8:	e92d4800 	push	{fp, lr}
f00165ac:	e28db004 	add	fp, sp, #4
f00165b0:	e24dd018 	sub	sp, sp, #24
f00165b4:	e50b0010 	str	r0, [fp, #-16]
f00165b8:	e50b1014 	str	r1, [fp, #-20]
f00165bc:	e50b2018 	str	r2, [fp, #-24]
f00165c0:	e51b3010 	ldr	r3, [fp, #-16]
f00165c4:	e2832f42 	add	r2, r3, #264	; 0x108
f00165c8:	e24b3008 	sub	r3, fp, #8
f00165cc:	e1a00002 	mov	r0, r2
f00165d0:	e1a01003 	mov	r1, r3
f00165d4:	ebffffd8 	bl	f001653c <spin_lock_irq>
f00165d8:	e51b3010 	ldr	r3, [fp, #-16]
f00165dc:	e51b2014 	ldr	r2, [fp, #-20]
f00165e0:	e583210c 	str	r2, [r3, #268]	; 0x10c
f00165e4:	e51b3010 	ldr	r3, [fp, #-16]
f00165e8:	e51b2018 	ldr	r2, [fp, #-24]
f00165ec:	e5832110 	str	r2, [r3, #272]	; 0x110
f00165f0:	e51b3010 	ldr	r3, [fp, #-16]
f00165f4:	e2832f42 	add	r2, r3, #264	; 0x108
f00165f8:	e51b3008 	ldr	r3, [fp, #-8]
f00165fc:	e1a00002 	mov	r0, r2
f0016600:	e1a01003 	mov	r1, r3
f0016604:	ebffffd5 	bl	f0016560 <spin_unlock_irq>
f0016608:	e24bd004 	sub	sp, fp, #4
f001660c:	e8bd8800 	pop	{fp, pc}

f0016610 <task_unset_wqh>:
f0016610:	e92d4800 	push	{fp, lr}
f0016614:	e28db004 	add	fp, sp, #4
f0016618:	e24dd010 	sub	sp, sp, #16
f001661c:	e50b0010 	str	r0, [fp, #-16]
f0016620:	e51b3010 	ldr	r3, [fp, #-16]
f0016624:	e2832f42 	add	r2, r3, #264	; 0x108
f0016628:	e24b3008 	sub	r3, fp, #8
f001662c:	e1a00002 	mov	r0, r2
f0016630:	e1a01003 	mov	r1, r3
f0016634:	ebffffc0 	bl	f001653c <spin_lock_irq>
f0016638:	e51b3010 	ldr	r3, [fp, #-16]
f001663c:	e3a02000 	mov	r2, #0
f0016640:	e583210c 	str	r2, [r3, #268]	; 0x10c
f0016644:	e51b3010 	ldr	r3, [fp, #-16]
f0016648:	e3a02000 	mov	r2, #0
f001664c:	e5832110 	str	r2, [r3, #272]	; 0x110
f0016650:	e51b3010 	ldr	r3, [fp, #-16]
f0016654:	e2832f42 	add	r2, r3, #264	; 0x108
f0016658:	e51b3008 	ldr	r3, [fp, #-8]
f001665c:	e1a00002 	mov	r0, r2
f0016660:	e1a01003 	mov	r1, r3
f0016664:	ebffffbd 	bl	f0016560 <spin_unlock_irq>
f0016668:	e24bd004 	sub	sp, fp, #4
f001666c:	e8bd8800 	pop	{fp, pc}

f0016670 <wait_on_prepared_wait>:
f0016670:	e92d4800 	push	{fp, lr}
f0016674:	e28db004 	add	fp, sp, #4
f0016678:	ebffc8b2 	bl	f0008948 <preempt_enable>
f001667c:	ebffcb4c 	bl	f00093b4 <schedule>
f0016680:	ebffffbf 	bl	f0016584 <current_task>
f0016684:	e1a03000 	mov	r3, r0
f0016688:	e5933060 	ldr	r3, [r3, #96]	; 0x60
f001668c:	e2033001 	and	r3, r3, #1
f0016690:	e3530000 	cmp	r3, #0
f0016694:	0a000006 	beq	f00166b4 <wait_on_prepared_wait+0x44>
f0016698:	ebffffb9 	bl	f0016584 <current_task>
f001669c:	e1a03000 	mov	r3, r0
f00166a0:	e5932060 	ldr	r2, [r3, #96]	; 0x60
f00166a4:	e3c22001 	bic	r2, r2, #1
f00166a8:	e5832060 	str	r2, [r3, #96]	; 0x60
f00166ac:	e3e03003 	mvn	r3, #3
f00166b0:	ea000000 	b	f00166b8 <wait_on_prepared_wait+0x48>
f00166b4:	e3a03000 	mov	r3, #0
f00166b8:	e1a00003 	mov	r0, r3
f00166bc:	e8bd8800 	pop	{fp, pc}

f00166c0 <wait_on_prepare>:
f00166c0:	e92d4800 	push	{fp, lr}
f00166c4:	e28db004 	add	fp, sp, #4
f00166c8:	e24dd010 	sub	sp, sp, #16
f00166cc:	e50b0010 	str	r0, [fp, #-16]
f00166d0:	e50b1014 	str	r1, [fp, #-20]
f00166d4:	ebffc8ac 	bl	f000898c <preempt_disable>
f00166d8:	e51b3010 	ldr	r3, [fp, #-16]
f00166dc:	e2832004 	add	r2, r3, #4
f00166e0:	e24b3008 	sub	r3, fp, #8
f00166e4:	e1a00002 	mov	r0, r2
f00166e8:	e1a01003 	mov	r1, r3
f00166ec:	ebffff92 	bl	f001653c <spin_lock_irq>
f00166f0:	e51b3010 	ldr	r3, [fp, #-16]
f00166f4:	e5933000 	ldr	r3, [r3]
f00166f8:	e2832001 	add	r2, r3, #1
f00166fc:	e51b3010 	ldr	r3, [fp, #-16]
f0016700:	e5832000 	str	r2, [r3]
f0016704:	e51b2014 	ldr	r2, [fp, #-20]
f0016708:	e51b3010 	ldr	r3, [fp, #-16]
f001670c:	e2833008 	add	r3, r3, #8
f0016710:	e1a00002 	mov	r0, r2
f0016714:	e1a01003 	mov	r1, r3
f0016718:	ebffff42 	bl	f0016428 <list_insert_tail>
f001671c:	ebffff98 	bl	f0016584 <current_task>
f0016720:	e1a03000 	mov	r3, r0
f0016724:	e1a00003 	mov	r0, r3
f0016728:	e51b1010 	ldr	r1, [fp, #-16]
f001672c:	e51b2014 	ldr	r2, [fp, #-20]
f0016730:	ebffff9c 	bl	f00165a8 <task_set_wqh>
f0016734:	ebffc9e5 	bl	f0008ed0 <sched_prepare_sleep>
f0016738:	e51b3010 	ldr	r3, [fp, #-16]
f001673c:	e2832004 	add	r2, r3, #4
f0016740:	e51b3008 	ldr	r3, [fp, #-8]
f0016744:	e1a00002 	mov	r0, r2
f0016748:	e1a01003 	mov	r1, r3
f001674c:	ebffff83 	bl	f0016560 <spin_unlock_irq>
f0016750:	e3a03000 	mov	r3, #0
f0016754:	e1a00003 	mov	r0, r3
f0016758:	e24bd004 	sub	sp, fp, #4
f001675c:	e8bd8800 	pop	{fp, pc}

f0016760 <wait_on>:
f0016760:	e92d4800 	push	{fp, lr}
f0016764:	e28db004 	add	fp, sp, #4
f0016768:	e24dd018 	sub	sp, sp, #24
f001676c:	e50b0018 	str	r0, [fp, #-24]
f0016770:	e24b3014 	sub	r3, fp, #20
f0016774:	e50b3014 	str	r3, [fp, #-20]
f0016778:	e24b3014 	sub	r3, fp, #20
f001677c:	e50b3010 	str	r3, [fp, #-16]
f0016780:	ebffff7f 	bl	f0016584 <current_task>
f0016784:	e1a03000 	mov	r3, r0
f0016788:	e50b300c 	str	r3, [fp, #-12]
f001678c:	e51b3018 	ldr	r3, [fp, #-24]
f0016790:	e2832004 	add	r2, r3, #4
f0016794:	e24b3008 	sub	r3, fp, #8
f0016798:	e1a00002 	mov	r0, r2
f001679c:	e1a01003 	mov	r1, r3
f00167a0:	ebffff65 	bl	f001653c <spin_lock_irq>
f00167a4:	e51b3018 	ldr	r3, [fp, #-24]
f00167a8:	e5933000 	ldr	r3, [r3]
f00167ac:	e2832001 	add	r2, r3, #1
f00167b0:	e51b3018 	ldr	r3, [fp, #-24]
f00167b4:	e5832000 	str	r2, [r3]
f00167b8:	e51b3018 	ldr	r3, [fp, #-24]
f00167bc:	e2833008 	add	r3, r3, #8
f00167c0:	e24b2014 	sub	r2, fp, #20
f00167c4:	e1a00002 	mov	r0, r2
f00167c8:	e1a01003 	mov	r1, r3
f00167cc:	ebffff15 	bl	f0016428 <list_insert_tail>
f00167d0:	ebffff6b 	bl	f0016584 <current_task>
f00167d4:	e1a02000 	mov	r2, r0
f00167d8:	e24b3014 	sub	r3, fp, #20
f00167dc:	e1a00002 	mov	r0, r2
f00167e0:	e51b1018 	ldr	r1, [fp, #-24]
f00167e4:	e1a02003 	mov	r2, r3
f00167e8:	ebffff6e 	bl	f00165a8 <task_set_wqh>
f00167ec:	ebffc9b7 	bl	f0008ed0 <sched_prepare_sleep>
f00167f0:	e51b3018 	ldr	r3, [fp, #-24]
f00167f4:	e2832004 	add	r2, r3, #4
f00167f8:	e51b3008 	ldr	r3, [fp, #-8]
f00167fc:	e1a00002 	mov	r0, r2
f0016800:	e1a01003 	mov	r1, r3
f0016804:	ebffff55 	bl	f0016560 <spin_unlock_irq>
f0016808:	ebffcae9 	bl	f00093b4 <schedule>
f001680c:	ebffff5c 	bl	f0016584 <current_task>
f0016810:	e1a03000 	mov	r3, r0
f0016814:	e5933060 	ldr	r3, [r3, #96]	; 0x60
f0016818:	e2033001 	and	r3, r3, #1
f001681c:	e3530000 	cmp	r3, #0
f0016820:	0a000006 	beq	f0016840 <wait_on+0xe0>
f0016824:	ebffff56 	bl	f0016584 <current_task>
f0016828:	e1a03000 	mov	r3, r0
f001682c:	e5932060 	ldr	r2, [r3, #96]	; 0x60
f0016830:	e3c22001 	bic	r2, r2, #1
f0016834:	e5832060 	str	r2, [r3, #96]	; 0x60
f0016838:	e3e03003 	mvn	r3, #3
f001683c:	ea000000 	b	f0016844 <wait_on+0xe4>
f0016840:	e3a03000 	mov	r3, #0
f0016844:	e1a00003 	mov	r0, r3
f0016848:	e24bd004 	sub	sp, fp, #4
f001684c:	e8bd8800 	pop	{fp, pc}

f0016850 <wake_up_all>:
f0016850:	e92d4800 	push	{fp, lr}
f0016854:	e28db004 	add	fp, sp, #4
f0016858:	e24dd018 	sub	sp, sp, #24
f001685c:	e50b0018 	str	r0, [fp, #-24]
f0016860:	e50b101c 	str	r1, [fp, #-28]
f0016864:	e51b3018 	ldr	r3, [fp, #-24]
f0016868:	e2832004 	add	r2, r3, #4
f001686c:	e24b3014 	sub	r3, fp, #20
f0016870:	e1a00002 	mov	r0, r2
f0016874:	e1a01003 	mov	r1, r3
f0016878:	ebffff2f 	bl	f001653c <spin_lock_irq>
f001687c:	e51b3018 	ldr	r3, [fp, #-24]
f0016880:	e5933000 	ldr	r3, [r3]
f0016884:	e3530000 	cmp	r3, #0
f0016888:	aa000005 	bge	f00168a4 <wake_up_all+0x54>
f001688c:	e59f0138 	ldr	r0, [pc, #312]	; f00169cc <wake_up_all+0x17c>
f0016890:	e59f1138 	ldr	r1, [pc, #312]	; f00169d0 <wake_up_all+0x180>
f0016894:	e59f2138 	ldr	r2, [pc, #312]	; f00169d4 <wake_up_all+0x184>
f0016898:	e3a0307c 	mov	r3, #124	; 0x7c
f001689c:	ebfffd92 	bl	f0015eec <printk>
f00168a0:	eafffffe 	b	f00168a0 <wake_up_all+0x50>
f00168a4:	ea00003c 	b	f001699c <wake_up_all+0x14c>
f00168a8:	e51b3018 	ldr	r3, [fp, #-24]
f00168ac:	e5933008 	ldr	r3, [r3, #8]
f00168b0:	e50b3008 	str	r3, [fp, #-8]
f00168b4:	e51b3008 	ldr	r3, [fp, #-8]
f00168b8:	e50b300c 	str	r3, [fp, #-12]
f00168bc:	e51b300c 	ldr	r3, [fp, #-12]
f00168c0:	e5933008 	ldr	r3, [r3, #8]
f00168c4:	e50b3010 	str	r3, [fp, #-16]
f00168c8:	e51b0010 	ldr	r0, [fp, #-16]
f00168cc:	ebffff4f 	bl	f0016610 <task_unset_wqh>
f00168d0:	e51b3018 	ldr	r3, [fp, #-24]
f00168d4:	e2833008 	add	r3, r3, #8
f00168d8:	e1a00003 	mov	r0, r3
f00168dc:	ebffff01 	bl	f00164e8 <list_empty>
f00168e0:	e1a03000 	mov	r3, r0
f00168e4:	e3530000 	cmp	r3, #0
f00168e8:	0a000005 	beq	f0016904 <wake_up_all+0xb4>
f00168ec:	e59f00d8 	ldr	r0, [pc, #216]	; f00169cc <wake_up_all+0x17c>
f00168f0:	e59f10d8 	ldr	r1, [pc, #216]	; f00169d0 <wake_up_all+0x180>
f00168f4:	e59f20d8 	ldr	r2, [pc, #216]	; f00169d4 <wake_up_all+0x184>
f00168f8:	e3a03083 	mov	r3, #131	; 0x83
f00168fc:	ebfffd7a 	bl	f0015eec <printk>
f0016900:	eafffffe 	b	f0016900 <wake_up_all+0xb0>
f0016904:	e51b300c 	ldr	r3, [fp, #-12]
f0016908:	e1a00003 	mov	r0, r3
f001690c:	ebfffedc 	bl	f0016484 <list_remove_init>
f0016910:	e51b3018 	ldr	r3, [fp, #-24]
f0016914:	e5933000 	ldr	r3, [r3]
f0016918:	e2432001 	sub	r2, r3, #1
f001691c:	e51b3018 	ldr	r3, [fp, #-24]
f0016920:	e5832000 	str	r2, [r3]
f0016924:	e51b301c 	ldr	r3, [fp, #-28]
f0016928:	e2033001 	and	r3, r3, #1
f001692c:	e3530000 	cmp	r3, #0
f0016930:	0a000004 	beq	f0016948 <wake_up_all+0xf8>
f0016934:	e51b3010 	ldr	r3, [fp, #-16]
f0016938:	e5933060 	ldr	r3, [r3, #96]	; 0x60
f001693c:	e3832001 	orr	r2, r3, #1
f0016940:	e51b3010 	ldr	r3, [fp, #-16]
f0016944:	e5832060 	str	r2, [r3, #96]	; 0x60
f0016948:	e51b3018 	ldr	r3, [fp, #-24]
f001694c:	e2832004 	add	r2, r3, #4
f0016950:	e51b3014 	ldr	r3, [fp, #-20]
f0016954:	e1a00002 	mov	r0, r2
f0016958:	e1a01003 	mov	r1, r3
f001695c:	ebfffeff 	bl	f0016560 <spin_unlock_irq>
f0016960:	e51b301c 	ldr	r3, [fp, #-28]
f0016964:	e2033002 	and	r3, r3, #2
f0016968:	e3530000 	cmp	r3, #0
f001696c:	0a000002 	beq	f001697c <wake_up_all+0x12c>
f0016970:	e51b0010 	ldr	r0, [fp, #-16]
f0016974:	ebffc926 	bl	f0008e14 <sched_resume_sync>
f0016978:	ea000001 	b	f0016984 <wake_up_all+0x134>
f001697c:	e51b0010 	ldr	r0, [fp, #-16]
f0016980:	ebffc942 	bl	f0008e90 <sched_resume_async>
f0016984:	e51b3018 	ldr	r3, [fp, #-24]
f0016988:	e2832004 	add	r2, r3, #4
f001698c:	e24b3014 	sub	r3, fp, #20
f0016990:	e1a00002 	mov	r0, r2
f0016994:	e1a01003 	mov	r1, r3
f0016998:	ebfffee7 	bl	f001653c <spin_lock_irq>
f001699c:	e51b3018 	ldr	r3, [fp, #-24]
f00169a0:	e5933000 	ldr	r3, [r3]
f00169a4:	e3530000 	cmp	r3, #0
f00169a8:	caffffbe 	bgt	f00168a8 <wake_up_all+0x58>
f00169ac:	e51b3018 	ldr	r3, [fp, #-24]
f00169b0:	e2832004 	add	r2, r3, #4
f00169b4:	e51b3014 	ldr	r3, [fp, #-20]
f00169b8:	e1a00002 	mov	r0, r2
f00169bc:	e1a01003 	mov	r1, r3
f00169c0:	ebfffee6 	bl	f0016560 <spin_unlock_irq>
f00169c4:	e24bd004 	sub	sp, fp, #4
f00169c8:	e8bd8800 	pop	{fp, pc}
f00169cc:	f001f4d4 	.word	0xf001f4d4
f00169d0:	f001f4fc 	.word	0xf001f4fc
f00169d4:	f001f50c 	.word	0xf001f50c

f00169d8 <wake_up>:
f00169d8:	e92d4800 	push	{fp, lr}
f00169dc:	e28db004 	add	fp, sp, #4
f00169e0:	e24dd018 	sub	sp, sp, #24
f00169e4:	e50b0018 	str	r0, [fp, #-24]
f00169e8:	e50b101c 	str	r1, [fp, #-28]
f00169ec:	e51b3018 	ldr	r3, [fp, #-24]
f00169f0:	e5933000 	ldr	r3, [r3]
f00169f4:	e3530000 	cmp	r3, #0
f00169f8:	aa000005 	bge	f0016a14 <wake_up+0x3c>
f00169fc:	e59f0138 	ldr	r0, [pc, #312]	; f0016b3c <wake_up+0x164>
f0016a00:	e59f1138 	ldr	r1, [pc, #312]	; f0016b40 <wake_up+0x168>
f0016a04:	e59f2138 	ldr	r2, [pc, #312]	; f0016b44 <wake_up+0x16c>
f0016a08:	e3a0309a 	mov	r3, #154	; 0x9a
f0016a0c:	ebfffd36 	bl	f0015eec <printk>
f0016a10:	eafffffe 	b	f0016a10 <wake_up+0x38>
f0016a14:	e51b3018 	ldr	r3, [fp, #-24]
f0016a18:	e2832004 	add	r2, r3, #4
f0016a1c:	e24b3014 	sub	r3, fp, #20
f0016a20:	e1a00002 	mov	r0, r2
f0016a24:	e1a01003 	mov	r1, r3
f0016a28:	ebfffec3 	bl	f001653c <spin_lock_irq>
f0016a2c:	e51b3018 	ldr	r3, [fp, #-24]
f0016a30:	e5933000 	ldr	r3, [r3]
f0016a34:	e3530000 	cmp	r3, #0
f0016a38:	da000037 	ble	f0016b1c <wake_up+0x144>
f0016a3c:	e51b3018 	ldr	r3, [fp, #-24]
f0016a40:	e5933008 	ldr	r3, [r3, #8]
f0016a44:	e50b3008 	str	r3, [fp, #-8]
f0016a48:	e51b3008 	ldr	r3, [fp, #-8]
f0016a4c:	e50b300c 	str	r3, [fp, #-12]
f0016a50:	e51b300c 	ldr	r3, [fp, #-12]
f0016a54:	e5933008 	ldr	r3, [r3, #8]
f0016a58:	e50b3010 	str	r3, [fp, #-16]
f0016a5c:	e51b3018 	ldr	r3, [fp, #-24]
f0016a60:	e2833008 	add	r3, r3, #8
f0016a64:	e1a00003 	mov	r0, r3
f0016a68:	ebfffe9e 	bl	f00164e8 <list_empty>
f0016a6c:	e1a03000 	mov	r3, r0
f0016a70:	e3530000 	cmp	r3, #0
f0016a74:	0a000005 	beq	f0016a90 <wake_up+0xb8>
f0016a78:	e59f00bc 	ldr	r0, [pc, #188]	; f0016b3c <wake_up+0x164>
f0016a7c:	e59f10bc 	ldr	r1, [pc, #188]	; f0016b40 <wake_up+0x168>
f0016a80:	e59f20bc 	ldr	r2, [pc, #188]	; f0016b44 <wake_up+0x16c>
f0016a84:	e3a030a3 	mov	r3, #163	; 0xa3
f0016a88:	ebfffd17 	bl	f0015eec <printk>
f0016a8c:	eafffffe 	b	f0016a8c <wake_up+0xb4>
f0016a90:	e51b300c 	ldr	r3, [fp, #-12]
f0016a94:	e1a00003 	mov	r0, r3
f0016a98:	ebfffe79 	bl	f0016484 <list_remove_init>
f0016a9c:	e51b3018 	ldr	r3, [fp, #-24]
f0016aa0:	e5933000 	ldr	r3, [r3]
f0016aa4:	e2432001 	sub	r2, r3, #1
f0016aa8:	e51b3018 	ldr	r3, [fp, #-24]
f0016aac:	e5832000 	str	r2, [r3]
f0016ab0:	e51b0010 	ldr	r0, [fp, #-16]
f0016ab4:	ebfffed5 	bl	f0016610 <task_unset_wqh>
f0016ab8:	e51b301c 	ldr	r3, [fp, #-28]
f0016abc:	e2033001 	and	r3, r3, #1
f0016ac0:	e3530000 	cmp	r3, #0
f0016ac4:	0a000004 	beq	f0016adc <wake_up+0x104>
f0016ac8:	e51b3010 	ldr	r3, [fp, #-16]
f0016acc:	e5933060 	ldr	r3, [r3, #96]	; 0x60
f0016ad0:	e3832001 	orr	r2, r3, #1
f0016ad4:	e51b3010 	ldr	r3, [fp, #-16]
f0016ad8:	e5832060 	str	r2, [r3, #96]	; 0x60
f0016adc:	e51b3018 	ldr	r3, [fp, #-24]
f0016ae0:	e2832004 	add	r2, r3, #4
f0016ae4:	e51b3014 	ldr	r3, [fp, #-20]
f0016ae8:	e1a00002 	mov	r0, r2
f0016aec:	e1a01003 	mov	r1, r3
f0016af0:	ebfffe9a 	bl	f0016560 <spin_unlock_irq>
f0016af4:	e51b301c 	ldr	r3, [fp, #-28]
f0016af8:	e2033002 	and	r3, r3, #2
f0016afc:	e3530000 	cmp	r3, #0
f0016b00:	0a000002 	beq	f0016b10 <wake_up+0x138>
f0016b04:	e51b0010 	ldr	r0, [fp, #-16]
f0016b08:	ebffc8c1 	bl	f0008e14 <sched_resume_sync>
f0016b0c:	ea000008 	b	f0016b34 <wake_up+0x15c>
f0016b10:	e51b0010 	ldr	r0, [fp, #-16]
f0016b14:	ebffc8dd 	bl	f0008e90 <sched_resume_async>
f0016b18:	ea000005 	b	f0016b34 <wake_up+0x15c>
f0016b1c:	e51b3018 	ldr	r3, [fp, #-24]
f0016b20:	e2832004 	add	r2, r3, #4
f0016b24:	e51b3014 	ldr	r3, [fp, #-20]
f0016b28:	e1a00002 	mov	r0, r2
f0016b2c:	e1a01003 	mov	r1, r3
f0016b30:	ebfffe8a 	bl	f0016560 <spin_unlock_irq>
f0016b34:	e24bd004 	sub	sp, fp, #4
f0016b38:	e8bd8800 	pop	{fp, pc}
f0016b3c:	f001f4d4 	.word	0xf001f4d4
f0016b40:	f001f4fc 	.word	0xf001f4fc
f0016b44:	f001f518 	.word	0xf001f518

f0016b48 <wake_up_task>:
f0016b48:	e92d4800 	push	{fp, lr}
f0016b4c:	e28db004 	add	fp, sp, #4
f0016b50:	e24dd018 	sub	sp, sp, #24
f0016b54:	e50b0018 	str	r0, [fp, #-24]
f0016b58:	e50b101c 	str	r1, [fp, #-28]
f0016b5c:	e51b3018 	ldr	r3, [fp, #-24]
f0016b60:	e2832f42 	add	r2, r3, #264	; 0x108
f0016b64:	e24b3014 	sub	r3, fp, #20
f0016b68:	e1a00002 	mov	r0, r2
f0016b6c:	e1a01003 	mov	r1, r3
f0016b70:	ebfffe71 	bl	f001653c <spin_lock_irq>
f0016b74:	e51b3018 	ldr	r3, [fp, #-24]
f0016b78:	e593310c 	ldr	r3, [r3, #268]	; 0x10c
f0016b7c:	e3530000 	cmp	r3, #0
f0016b80:	1a000007 	bne	f0016ba4 <wake_up_task+0x5c>
f0016b84:	e51b3018 	ldr	r3, [fp, #-24]
f0016b88:	e2832f42 	add	r2, r3, #264	; 0x108
f0016b8c:	e51b3014 	ldr	r3, [fp, #-20]
f0016b90:	e1a00002 	mov	r0, r2
f0016b94:	e1a01003 	mov	r1, r3
f0016b98:	ebfffe70 	bl	f0016560 <spin_unlock_irq>
f0016b9c:	e3e03000 	mvn	r3, #0
f0016ba0:	ea000058 	b	f0016d08 <wake_up_task+0x1c0>
f0016ba4:	e51b3018 	ldr	r3, [fp, #-24]
f0016ba8:	e593310c 	ldr	r3, [r3, #268]	; 0x10c
f0016bac:	e50b3008 	str	r3, [fp, #-8]
f0016bb0:	e51b3018 	ldr	r3, [fp, #-24]
f0016bb4:	e5933110 	ldr	r3, [r3, #272]	; 0x110
f0016bb8:	e50b300c 	str	r3, [fp, #-12]
f0016bbc:	e51b3018 	ldr	r3, [fp, #-24]
f0016bc0:	e2832f42 	add	r2, r3, #264	; 0x108
f0016bc4:	e51b3014 	ldr	r3, [fp, #-20]
f0016bc8:	e1a00002 	mov	r0, r2
f0016bcc:	e1a01003 	mov	r1, r3
f0016bd0:	ebfffe62 	bl	f0016560 <spin_unlock_irq>
f0016bd4:	e51b3008 	ldr	r3, [fp, #-8]
f0016bd8:	e2832004 	add	r2, r3, #4
f0016bdc:	e24b3014 	sub	r3, fp, #20
f0016be0:	e1a00002 	mov	r0, r2
f0016be4:	e1a01003 	mov	r1, r3
f0016be8:	ebfffe53 	bl	f001653c <spin_lock_irq>
f0016bec:	e51b3018 	ldr	r3, [fp, #-24]
f0016bf0:	e2832f42 	add	r2, r3, #264	; 0x108
f0016bf4:	e24b3014 	sub	r3, fp, #20
f0016bf8:	e2833004 	add	r3, r3, #4
f0016bfc:	e1a00002 	mov	r0, r2
f0016c00:	e1a01003 	mov	r1, r3
f0016c04:	ebfffe4c 	bl	f001653c <spin_lock_irq>
f0016c08:	e51b3018 	ldr	r3, [fp, #-24]
f0016c0c:	e593210c 	ldr	r2, [r3, #268]	; 0x10c
f0016c10:	e51b3008 	ldr	r3, [fp, #-8]
f0016c14:	e1520003 	cmp	r2, r3
f0016c18:	0a00000d 	beq	f0016c54 <wake_up_task+0x10c>
f0016c1c:	e51b3008 	ldr	r3, [fp, #-8]
f0016c20:	e2832004 	add	r2, r3, #4
f0016c24:	e51b3014 	ldr	r3, [fp, #-20]
f0016c28:	e1a00002 	mov	r0, r2
f0016c2c:	e1a01003 	mov	r1, r3
f0016c30:	ebfffe4a 	bl	f0016560 <spin_unlock_irq>
f0016c34:	e51b3018 	ldr	r3, [fp, #-24]
f0016c38:	e2832f42 	add	r2, r3, #264	; 0x108
f0016c3c:	e51b3010 	ldr	r3, [fp, #-16]
f0016c40:	e1a00002 	mov	r0, r2
f0016c44:	e1a01003 	mov	r1, r3
f0016c48:	ebfffe44 	bl	f0016560 <spin_unlock_irq>
f0016c4c:	e3e03000 	mvn	r3, #0
f0016c50:	ea00002c 	b	f0016d08 <wake_up_task+0x1c0>
f0016c54:	e51b300c 	ldr	r3, [fp, #-12]
f0016c58:	e1a00003 	mov	r0, r3
f0016c5c:	ebfffe08 	bl	f0016484 <list_remove_init>
f0016c60:	e51b3008 	ldr	r3, [fp, #-8]
f0016c64:	e5933000 	ldr	r3, [r3]
f0016c68:	e2432001 	sub	r2, r3, #1
f0016c6c:	e51b3008 	ldr	r3, [fp, #-8]
f0016c70:	e5832000 	str	r2, [r3]
f0016c74:	e51b3018 	ldr	r3, [fp, #-24]
f0016c78:	e3a02000 	mov	r2, #0
f0016c7c:	e583210c 	str	r2, [r3, #268]	; 0x10c
f0016c80:	e51b3018 	ldr	r3, [fp, #-24]
f0016c84:	e3a02000 	mov	r2, #0
f0016c88:	e5832110 	str	r2, [r3, #272]	; 0x110
f0016c8c:	e51b301c 	ldr	r3, [fp, #-28]
f0016c90:	e2033001 	and	r3, r3, #1
f0016c94:	e3530000 	cmp	r3, #0
f0016c98:	0a000004 	beq	f0016cb0 <wake_up_task+0x168>
f0016c9c:	e51b3018 	ldr	r3, [fp, #-24]
f0016ca0:	e5933060 	ldr	r3, [r3, #96]	; 0x60
f0016ca4:	e3832001 	orr	r2, r3, #1
f0016ca8:	e51b3018 	ldr	r3, [fp, #-24]
f0016cac:	e5832060 	str	r2, [r3, #96]	; 0x60
f0016cb0:	e51b3008 	ldr	r3, [fp, #-8]
f0016cb4:	e2832004 	add	r2, r3, #4
f0016cb8:	e51b3014 	ldr	r3, [fp, #-20]
f0016cbc:	e1a00002 	mov	r0, r2
f0016cc0:	e1a01003 	mov	r1, r3
f0016cc4:	ebfffe25 	bl	f0016560 <spin_unlock_irq>
f0016cc8:	e51b3018 	ldr	r3, [fp, #-24]
f0016ccc:	e2832f42 	add	r2, r3, #264	; 0x108
f0016cd0:	e51b3010 	ldr	r3, [fp, #-16]
f0016cd4:	e1a00002 	mov	r0, r2
f0016cd8:	e1a01003 	mov	r1, r3
f0016cdc:	ebfffe1f 	bl	f0016560 <spin_unlock_irq>
f0016ce0:	e51b301c 	ldr	r3, [fp, #-28]
f0016ce4:	e2033002 	and	r3, r3, #2
f0016ce8:	e3530000 	cmp	r3, #0
f0016cec:	0a000002 	beq	f0016cfc <wake_up_task+0x1b4>
f0016cf0:	e51b0018 	ldr	r0, [fp, #-24]
f0016cf4:	ebffc846 	bl	f0008e14 <sched_resume_sync>
f0016cf8:	ea000001 	b	f0016d04 <wake_up_task+0x1bc>
f0016cfc:	e51b0018 	ldr	r0, [fp, #-24]
f0016d00:	ebffc862 	bl	f0008e90 <sched_resume_async>
f0016d04:	e3a03000 	mov	r3, #0
f0016d08:	e1a00003 	mov	r0, r3
f0016d0c:	e24bd004 	sub	sp, fp, #4
f0016d10:	e8bd8800 	pop	{fp, pc}

f0016d14 <spin_lock>:
f0016d14:	e92d4800 	push	{fp, lr}
f0016d18:	e28db004 	add	fp, sp, #4
f0016d1c:	e24dd008 	sub	sp, sp, #8
f0016d20:	e50b0008 	str	r0, [fp, #-8]
f0016d24:	ebffc718 	bl	f000898c <preempt_disable>
f0016d28:	e24bd004 	sub	sp, fp, #4
f0016d2c:	e8bd8800 	pop	{fp, pc}

f0016d30 <spin_unlock>:
f0016d30:	e92d4800 	push	{fp, lr}
f0016d34:	e28db004 	add	fp, sp, #4
f0016d38:	e24dd008 	sub	sp, sp, #8
f0016d3c:	e50b0008 	str	r0, [fp, #-8]
f0016d40:	ebffc700 	bl	f0008948 <preempt_enable>
f0016d44:	e24bd004 	sub	sp, fp, #4
f0016d48:	e8bd8800 	pop	{fp, pc}

f0016d4c <list_insert_tail>:
f0016d4c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f0016d50:	e28db000 	add	fp, sp, #0
f0016d54:	e24dd014 	sub	sp, sp, #20
f0016d58:	e50b0010 	str	r0, [fp, #-16]
f0016d5c:	e50b1014 	str	r1, [fp, #-20]
f0016d60:	e51b3014 	ldr	r3, [fp, #-20]
f0016d64:	e5933004 	ldr	r3, [r3, #4]
f0016d68:	e50b3008 	str	r3, [fp, #-8]
f0016d6c:	e51b3010 	ldr	r3, [fp, #-16]
f0016d70:	e51b2014 	ldr	r2, [fp, #-20]
f0016d74:	e5832000 	str	r2, [r3]
f0016d78:	e51b3014 	ldr	r3, [fp, #-20]
f0016d7c:	e51b2010 	ldr	r2, [fp, #-16]
f0016d80:	e5832004 	str	r2, [r3, #4]
f0016d84:	e51b3010 	ldr	r3, [fp, #-16]
f0016d88:	e51b2008 	ldr	r2, [fp, #-8]
f0016d8c:	e5832004 	str	r2, [r3, #4]
f0016d90:	e51b3008 	ldr	r3, [fp, #-8]
f0016d94:	e51b2010 	ldr	r2, [fp, #-16]
f0016d98:	e5832000 	str	r2, [r3]
f0016d9c:	e24bd000 	sub	sp, fp, #0
f0016da0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0016da4:	e12fff1e 	bx	lr

f0016da8 <list_remove_init>:
f0016da8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f0016dac:	e28db000 	add	fp, sp, #0
f0016db0:	e24dd014 	sub	sp, sp, #20
f0016db4:	e50b0010 	str	r0, [fp, #-16]
f0016db8:	e51b3010 	ldr	r3, [fp, #-16]
f0016dbc:	e5933004 	ldr	r3, [r3, #4]
f0016dc0:	e50b3008 	str	r3, [fp, #-8]
f0016dc4:	e51b3010 	ldr	r3, [fp, #-16]
f0016dc8:	e5933000 	ldr	r3, [r3]
f0016dcc:	e50b300c 	str	r3, [fp, #-12]
f0016dd0:	e51b3008 	ldr	r3, [fp, #-8]
f0016dd4:	e51b200c 	ldr	r2, [fp, #-12]
f0016dd8:	e5832000 	str	r2, [r3]
f0016ddc:	e51b300c 	ldr	r3, [fp, #-12]
f0016de0:	e51b2008 	ldr	r2, [fp, #-8]
f0016de4:	e5832004 	str	r2, [r3, #4]
f0016de8:	e51b3010 	ldr	r3, [fp, #-16]
f0016dec:	e51b2010 	ldr	r2, [fp, #-16]
f0016df0:	e5832000 	str	r2, [r3]
f0016df4:	e51b3010 	ldr	r3, [fp, #-16]
f0016df8:	e51b2010 	ldr	r2, [fp, #-16]
f0016dfc:	e5832004 	str	r2, [r3, #4]
f0016e00:	e24bd000 	sub	sp, fp, #0
f0016e04:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0016e08:	e12fff1e 	bx	lr

f0016e0c <list_empty>:
f0016e0c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f0016e10:	e28db000 	add	fp, sp, #0
f0016e14:	e24dd00c 	sub	sp, sp, #12
f0016e18:	e50b0008 	str	r0, [fp, #-8]
f0016e1c:	e51b3008 	ldr	r3, [fp, #-8]
f0016e20:	e5932004 	ldr	r2, [r3, #4]
f0016e24:	e51b3008 	ldr	r3, [fp, #-8]
f0016e28:	e1520003 	cmp	r2, r3
f0016e2c:	1a000006 	bne	f0016e4c <list_empty+0x40>
f0016e30:	e51b3008 	ldr	r3, [fp, #-8]
f0016e34:	e5932000 	ldr	r2, [r3]
f0016e38:	e51b3008 	ldr	r3, [fp, #-8]
f0016e3c:	e1520003 	cmp	r2, r3
f0016e40:	1a000001 	bne	f0016e4c <list_empty+0x40>
f0016e44:	e3a03001 	mov	r3, #1
f0016e48:	ea000000 	b	f0016e50 <list_empty+0x44>
f0016e4c:	e3a03000 	mov	r3, #0
f0016e50:	e1a00003 	mov	r0, r3
f0016e54:	e24bd000 	sub	sp, fp, #0
f0016e58:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0016e5c:	e12fff1e 	bx	lr

f0016e60 <current_task>:
f0016e60:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f0016e64:	e28db000 	add	fp, sp, #0
f0016e68:	e1a0300d 	mov	r3, sp
f0016e6c:	e3c33eff 	bic	r3, r3, #4080	; 0xff0
f0016e70:	e3c3300f 	bic	r3, r3, #15
f0016e74:	e1a00003 	mov	r0, r3
f0016e78:	e24bd000 	sub	sp, fp, #0
f0016e7c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0016e80:	e12fff1e 	bx	lr

f0016e84 <mutex_trylock>:
f0016e84:	e92d4800 	push	{fp, lr}
f0016e88:	e28db004 	add	fp, sp, #4
f0016e8c:	e24dd010 	sub	sp, sp, #16
f0016e90:	e50b0010 	str	r0, [fp, #-16]
f0016e94:	e51b3010 	ldr	r3, [fp, #-16]
f0016e98:	e2833004 	add	r3, r3, #4
f0016e9c:	e1a00003 	mov	r0, r3
f0016ea0:	ebffff9b 	bl	f0016d14 <spin_lock>
f0016ea4:	e51b3010 	ldr	r3, [fp, #-16]
f0016ea8:	e2833010 	add	r3, r3, #16
f0016eac:	e1a00003 	mov	r0, r3
f0016eb0:	ebfff715 	bl	f0014b0c <__mutex_lock>
f0016eb4:	e1a03000 	mov	r3, r0
f0016eb8:	e50b3008 	str	r3, [fp, #-8]
f0016ebc:	e51b3008 	ldr	r3, [fp, #-8]
f0016ec0:	e3530000 	cmp	r3, #0
f0016ec4:	0a000004 	beq	f0016edc <mutex_trylock+0x58>
f0016ec8:	ebffffe4 	bl	f0016e60 <current_task>
f0016ecc:	e1a03000 	mov	r3, r0
f0016ed0:	e59320ac 	ldr	r2, [r3, #172]	; 0xac
f0016ed4:	e2822001 	add	r2, r2, #1
f0016ed8:	e58320ac 	str	r2, [r3, #172]	; 0xac
f0016edc:	e51b3010 	ldr	r3, [fp, #-16]
f0016ee0:	e2833004 	add	r3, r3, #4
f0016ee4:	e1a00003 	mov	r0, r3
f0016ee8:	ebffff90 	bl	f0016d30 <spin_unlock>
f0016eec:	e51b3008 	ldr	r3, [fp, #-8]
f0016ef0:	e1a00003 	mov	r0, r3
f0016ef4:	e24bd004 	sub	sp, fp, #4
f0016ef8:	e8bd8800 	pop	{fp, pc}

f0016efc <mutex_lock>:
f0016efc:	e92d4800 	push	{fp, lr}
f0016f00:	e28db004 	add	fp, sp, #4
f0016f04:	e24dd018 	sub	sp, sp, #24
f0016f08:	e50b0018 	str	r0, [fp, #-24]
f0016f0c:	e51b3018 	ldr	r3, [fp, #-24]
f0016f10:	e2833004 	add	r3, r3, #4
f0016f14:	e1a00003 	mov	r0, r3
f0016f18:	ebffff7d 	bl	f0016d14 <spin_lock>
f0016f1c:	e51b3018 	ldr	r3, [fp, #-24]
f0016f20:	e2833010 	add	r3, r3, #16
f0016f24:	e1a00003 	mov	r0, r3
f0016f28:	ebfff6f7 	bl	f0014b0c <__mutex_lock>
f0016f2c:	e1a03000 	mov	r3, r0
f0016f30:	e3530000 	cmp	r3, #0
f0016f34:	1a00002d 	bne	f0016ff0 <mutex_lock+0xf4>
f0016f38:	e24b3010 	sub	r3, fp, #16
f0016f3c:	e50b3010 	str	r3, [fp, #-16]
f0016f40:	e24b3010 	sub	r3, fp, #16
f0016f44:	e50b300c 	str	r3, [fp, #-12]
f0016f48:	ebffffc4 	bl	f0016e60 <current_task>
f0016f4c:	e1a03000 	mov	r3, r0
f0016f50:	e50b3008 	str	r3, [fp, #-8]
f0016f54:	ebffffc1 	bl	f0016e60 <current_task>
f0016f58:	e1a01000 	mov	r1, r0
f0016f5c:	e51b2018 	ldr	r2, [fp, #-24]
f0016f60:	e24b3010 	sub	r3, fp, #16
f0016f64:	e1a00001 	mov	r0, r1
f0016f68:	e1a01002 	mov	r1, r2
f0016f6c:	e1a02003 	mov	r2, r3
f0016f70:	ebfffd8c 	bl	f00165a8 <task_set_wqh>
f0016f74:	e51b3018 	ldr	r3, [fp, #-24]
f0016f78:	e2833008 	add	r3, r3, #8
f0016f7c:	e24b2010 	sub	r2, fp, #16
f0016f80:	e1a00002 	mov	r0, r2
f0016f84:	e1a01003 	mov	r1, r3
f0016f88:	ebffff6f 	bl	f0016d4c <list_insert_tail>
f0016f8c:	e51b3018 	ldr	r3, [fp, #-24]
f0016f90:	e5933000 	ldr	r3, [r3]
f0016f94:	e2832001 	add	r2, r3, #1
f0016f98:	e51b3018 	ldr	r3, [fp, #-24]
f0016f9c:	e5832000 	str	r2, [r3]
f0016fa0:	ebffc7ca 	bl	f0008ed0 <sched_prepare_sleep>
f0016fa4:	e51b3018 	ldr	r3, [fp, #-24]
f0016fa8:	e2833004 	add	r3, r3, #4
f0016fac:	e1a00003 	mov	r0, r3
f0016fb0:	ebffff5e 	bl	f0016d30 <spin_unlock>
f0016fb4:	ebffc8fe 	bl	f00093b4 <schedule>
f0016fb8:	ebffffa8 	bl	f0016e60 <current_task>
f0016fbc:	e1a03000 	mov	r3, r0
f0016fc0:	e5933060 	ldr	r3, [r3, #96]	; 0x60
f0016fc4:	e2033001 	and	r3, r3, #1
f0016fc8:	e3530000 	cmp	r3, #0
f0016fcc:	0a000006 	beq	f0016fec <mutex_lock+0xf0>
f0016fd0:	ebffffa2 	bl	f0016e60 <current_task>
f0016fd4:	e1a03000 	mov	r3, r0
f0016fd8:	e5932060 	ldr	r2, [r3, #96]	; 0x60
f0016fdc:	e3c22001 	bic	r2, r2, #1
f0016fe0:	e5832060 	str	r2, [r3, #96]	; 0x60
f0016fe4:	e3e03003 	mvn	r3, #3
f0016fe8:	ea00000b 	b	f001701c <mutex_lock+0x120>
f0016fec:	eaffffc6 	b	f0016f0c <mutex_lock+0x10>
f0016ff0:	ebffff9a 	bl	f0016e60 <current_task>
f0016ff4:	e1a03000 	mov	r3, r0
f0016ff8:	e59320ac 	ldr	r2, [r3, #172]	; 0xac
f0016ffc:	e2822001 	add	r2, r2, #1
f0017000:	e58320ac 	str	r2, [r3, #172]	; 0xac
f0017004:	e1a00000 	nop			; (mov r0, r0)
f0017008:	e51b3018 	ldr	r3, [fp, #-24]
f001700c:	e2833004 	add	r3, r3, #4
f0017010:	e1a00003 	mov	r0, r3
f0017014:	ebffff45 	bl	f0016d30 <spin_unlock>
f0017018:	e3a03000 	mov	r3, #0
f001701c:	e1a00003 	mov	r0, r3
f0017020:	e24bd004 	sub	sp, fp, #4
f0017024:	e8bd8800 	pop	{fp, pc}

f0017028 <mutex_unlock_common>:
f0017028:	e92d4800 	push	{fp, lr}
f001702c:	e28db004 	add	fp, sp, #4
f0017030:	e24dd018 	sub	sp, sp, #24
f0017034:	e50b0018 	str	r0, [fp, #-24]
f0017038:	e50b101c 	str	r1, [fp, #-28]
f001703c:	ebffff87 	bl	f0016e60 <current_task>
f0017040:	e50b0008 	str	r0, [fp, #-8]
f0017044:	e51b3018 	ldr	r3, [fp, #-24]
f0017048:	e2833004 	add	r3, r3, #4
f001704c:	e1a00003 	mov	r0, r3
f0017050:	ebffff2f 	bl	f0016d14 <spin_lock>
f0017054:	e51b3018 	ldr	r3, [fp, #-24]
f0017058:	e2833010 	add	r3, r3, #16
f001705c:	e1a00003 	mov	r0, r3
f0017060:	ebfff6bd 	bl	f0014b5c <__mutex_unlock>
f0017064:	ebffff7d 	bl	f0016e60 <current_task>
f0017068:	e1a03000 	mov	r3, r0
f001706c:	e59320ac 	ldr	r2, [r3, #172]	; 0xac
f0017070:	e2422001 	sub	r2, r2, #1
f0017074:	e58320ac 	str	r2, [r3, #172]	; 0xac
f0017078:	ebffff78 	bl	f0016e60 <current_task>
f001707c:	e1a03000 	mov	r3, r0
f0017080:	e59330ac 	ldr	r3, [r3, #172]	; 0xac
f0017084:	e3530000 	cmp	r3, #0
f0017088:	aa000005 	bge	f00170a4 <mutex_unlock_common+0x7c>
f001708c:	e59f0110 	ldr	r0, [pc, #272]	; f00171a4 <mutex_unlock_common+0x17c>
f0017090:	e59f1110 	ldr	r1, [pc, #272]	; f00171a8 <mutex_unlock_common+0x180>
f0017094:	e59f2110 	ldr	r2, [pc, #272]	; f00171ac <mutex_unlock_common+0x184>
f0017098:	e3a03098 	mov	r3, #152	; 0x98
f001709c:	ebfffb92 	bl	f0015eec <printk>
f00170a0:	eafffffe 	b	f00170a0 <mutex_unlock_common+0x78>
f00170a4:	e51b3018 	ldr	r3, [fp, #-24]
f00170a8:	e5933000 	ldr	r3, [r3]
f00170ac:	e3530000 	cmp	r3, #0
f00170b0:	aa000005 	bge	f00170cc <mutex_unlock_common+0xa4>
f00170b4:	e59f00e8 	ldr	r0, [pc, #232]	; f00171a4 <mutex_unlock_common+0x17c>
f00170b8:	e59f10e8 	ldr	r1, [pc, #232]	; f00171a8 <mutex_unlock_common+0x180>
f00170bc:	e59f20e8 	ldr	r2, [pc, #232]	; f00171ac <mutex_unlock_common+0x184>
f00170c0:	e3a03099 	mov	r3, #153	; 0x99
f00170c4:	ebfffb88 	bl	f0015eec <printk>
f00170c8:	eafffffe 	b	f00170c8 <mutex_unlock_common+0xa0>
f00170cc:	e51b3018 	ldr	r3, [fp, #-24]
f00170d0:	e5933000 	ldr	r3, [r3]
f00170d4:	e3530000 	cmp	r3, #0
f00170d8:	da00002b 	ble	f001718c <mutex_unlock_common+0x164>
f00170dc:	e51b3018 	ldr	r3, [fp, #-24]
f00170e0:	e5933008 	ldr	r3, [r3, #8]
f00170e4:	e50b300c 	str	r3, [fp, #-12]
f00170e8:	e51b300c 	ldr	r3, [fp, #-12]
f00170ec:	e50b3010 	str	r3, [fp, #-16]
f00170f0:	e51b3010 	ldr	r3, [fp, #-16]
f00170f4:	e5933008 	ldr	r3, [r3, #8]
f00170f8:	e50b3014 	str	r3, [fp, #-20]
f00170fc:	e51b0014 	ldr	r0, [fp, #-20]
f0017100:	ebfffd42 	bl	f0016610 <task_unset_wqh>
f0017104:	e51b3018 	ldr	r3, [fp, #-24]
f0017108:	e2833008 	add	r3, r3, #8
f001710c:	e1a00003 	mov	r0, r3
f0017110:	ebffff3d 	bl	f0016e0c <list_empty>
f0017114:	e1a03000 	mov	r3, r0
f0017118:	e3530000 	cmp	r3, #0
f001711c:	0a000005 	beq	f0017138 <mutex_unlock_common+0x110>
f0017120:	e59f007c 	ldr	r0, [pc, #124]	; f00171a4 <mutex_unlock_common+0x17c>
f0017124:	e59f107c 	ldr	r1, [pc, #124]	; f00171a8 <mutex_unlock_common+0x180>
f0017128:	e59f207c 	ldr	r2, [pc, #124]	; f00171ac <mutex_unlock_common+0x184>
f001712c:	e3a030a1 	mov	r3, #161	; 0xa1
f0017130:	ebfffb6d 	bl	f0015eec <printk>
f0017134:	eafffffe 	b	f0017134 <mutex_unlock_common+0x10c>
f0017138:	e51b3010 	ldr	r3, [fp, #-16]
f001713c:	e1a00003 	mov	r0, r3
f0017140:	ebffff18 	bl	f0016da8 <list_remove_init>
f0017144:	e51b3018 	ldr	r3, [fp, #-24]
f0017148:	e5933000 	ldr	r3, [r3]
f001714c:	e2432001 	sub	r2, r3, #1
f0017150:	e51b3018 	ldr	r3, [fp, #-24]
f0017154:	e5832000 	str	r2, [r3]
f0017158:	e51b3018 	ldr	r3, [fp, #-24]
f001715c:	e2833004 	add	r3, r3, #4
f0017160:	e1a00003 	mov	r0, r3
f0017164:	ebfffef1 	bl	f0016d30 <spin_unlock>
f0017168:	e51b301c 	ldr	r3, [fp, #-28]
f001716c:	e3530000 	cmp	r3, #0
f0017170:	0a000002 	beq	f0017180 <mutex_unlock_common+0x158>
f0017174:	e51b0014 	ldr	r0, [fp, #-20]
f0017178:	ebffc725 	bl	f0008e14 <sched_resume_sync>
f001717c:	ea000006 	b	f001719c <mutex_unlock_common+0x174>
f0017180:	e51b0014 	ldr	r0, [fp, #-20]
f0017184:	ebffc741 	bl	f0008e90 <sched_resume_async>
f0017188:	ea000003 	b	f001719c <mutex_unlock_common+0x174>
f001718c:	e51b3018 	ldr	r3, [fp, #-24]
f0017190:	e2833004 	add	r3, r3, #4
f0017194:	e1a00003 	mov	r0, r3
f0017198:	ebfffee4 	bl	f0016d30 <spin_unlock>
f001719c:	e24bd004 	sub	sp, fp, #4
f00171a0:	e8bd8800 	pop	{fp, pc}
f00171a4:	f001f520 	.word	0xf001f520
f00171a8:	f001f548 	.word	0xf001f548
f00171ac:	f001f558 	.word	0xf001f558

f00171b0 <mutex_unlock>:
f00171b0:	e92d4800 	push	{fp, lr}
f00171b4:	e28db004 	add	fp, sp, #4
f00171b8:	e24dd008 	sub	sp, sp, #8
f00171bc:	e50b0008 	str	r0, [fp, #-8]
f00171c0:	e51b0008 	ldr	r0, [fp, #-8]
f00171c4:	e3a01001 	mov	r1, #1
f00171c8:	ebffff96 	bl	f0017028 <mutex_unlock_common>
f00171cc:	e24bd004 	sub	sp, fp, #4
f00171d0:	e8bd8800 	pop	{fp, pc}

f00171d4 <mutex_unlock_async>:
f00171d4:	e92d4800 	push	{fp, lr}
f00171d8:	e28db004 	add	fp, sp, #4
f00171dc:	e24dd008 	sub	sp, sp, #8
f00171e0:	e50b0008 	str	r0, [fp, #-8]
f00171e4:	e51b0008 	ldr	r0, [fp, #-8]
f00171e8:	e3a01000 	mov	r1, #0
f00171ec:	ebffff8d 	bl	f0017028 <mutex_unlock_common>
f00171f0:	e24bd004 	sub	sp, fp, #4
f00171f4:	e8bd8800 	pop	{fp, pc}

f00171f8 <spin_lock_init>:
f00171f8:	e92d4800 	push	{fp, lr}
f00171fc:	e28db004 	add	fp, sp, #4
f0017200:	e24dd008 	sub	sp, sp, #8
f0017204:	e50b0008 	str	r0, [fp, #-8]
f0017208:	e51b0008 	ldr	r0, [fp, #-8]
f001720c:	e3a01000 	mov	r1, #0
f0017210:	e3a02004 	mov	r2, #4
f0017214:	ebfffb5f 	bl	f0015f98 <memset>
f0017218:	e24bd004 	sub	sp, fp, #4
f001721c:	e8bd8800 	pop	{fp, pc}

f0017220 <spin_lock>:
f0017220:	e92d4800 	push	{fp, lr}
f0017224:	e28db004 	add	fp, sp, #4
f0017228:	e24dd008 	sub	sp, sp, #8
f001722c:	e50b0008 	str	r0, [fp, #-8]
f0017230:	ebffc5d5 	bl	f000898c <preempt_disable>
f0017234:	e24bd004 	sub	sp, fp, #4
f0017238:	e8bd8800 	pop	{fp, pc}

f001723c <spin_unlock>:
f001723c:	e92d4800 	push	{fp, lr}
f0017240:	e28db004 	add	fp, sp, #4
f0017244:	e24dd008 	sub	sp, sp, #8
f0017248:	e50b0008 	str	r0, [fp, #-8]
f001724c:	ebffc5bd 	bl	f0008948 <preempt_enable>
f0017250:	e24bd004 	sub	sp, fp, #4
f0017254:	e8bd8800 	pop	{fp, pc}

f0017258 <id_pool_new_init>:
f0017258:	e92d4800 	push	{fp, lr}
f001725c:	e28db004 	add	fp, sp, #4
f0017260:	e24dd010 	sub	sp, sp, #16
f0017264:	e50b0010 	str	r0, [fp, #-16]
f0017268:	e50b1014 	str	r1, [fp, #-20]
f001726c:	e51b3010 	ldr	r3, [fp, #-16]
f0017270:	e1a032c3 	asr	r3, r3, #5
f0017274:	e50b3008 	str	r3, [fp, #-8]
f0017278:	e51b3014 	ldr	r3, [fp, #-20]
f001727c:	e50b300c 	str	r3, [fp, #-12]
f0017280:	e51b300c 	ldr	r3, [fp, #-12]
f0017284:	e1a00003 	mov	r0, r3
f0017288:	ebffffda 	bl	f00171f8 <spin_lock_init>
f001728c:	e51b300c 	ldr	r3, [fp, #-12]
f0017290:	e51b2008 	ldr	r2, [fp, #-8]
f0017294:	e5832004 	str	r2, [r3, #4]
f0017298:	e51b300c 	ldr	r3, [fp, #-12]
f001729c:	e1a00003 	mov	r0, r3
f00172a0:	e24bd004 	sub	sp, fp, #4
f00172a4:	e8bd8800 	pop	{fp, pc}

f00172a8 <id_new>:
f00172a8:	e92d4800 	push	{fp, lr}
f00172ac:	e28db004 	add	fp, sp, #4
f00172b0:	e24dd010 	sub	sp, sp, #16
f00172b4:	e50b0010 	str	r0, [fp, #-16]
f00172b8:	e51b3010 	ldr	r3, [fp, #-16]
f00172bc:	e1a00003 	mov	r0, r3
f00172c0:	ebffffd6 	bl	f0017220 <spin_lock>
f00172c4:	e51b3010 	ldr	r3, [fp, #-16]
f00172c8:	e2832008 	add	r2, r3, #8
f00172cc:	e51b3010 	ldr	r3, [fp, #-16]
f00172d0:	e5933004 	ldr	r3, [r3, #4]
f00172d4:	e1a03283 	lsl	r3, r3, #5
f00172d8:	e1a00002 	mov	r0, r2
f00172dc:	e1a01003 	mov	r1, r3
f00172e0:	ebfffba7 	bl	f0016184 <find_and_set_first_free_bit>
f00172e4:	e50b0008 	str	r0, [fp, #-8]
f00172e8:	e51b3010 	ldr	r3, [fp, #-16]
f00172ec:	e1a00003 	mov	r0, r3
f00172f0:	ebffffd1 	bl	f001723c <spin_unlock>
f00172f4:	e51b3008 	ldr	r3, [fp, #-8]
f00172f8:	e3530000 	cmp	r3, #0
f00172fc:	aa000005 	bge	f0017318 <id_new+0x70>
f0017300:	e59f0020 	ldr	r0, [pc, #32]	; f0017328 <id_new+0x80>
f0017304:	e59f1020 	ldr	r1, [pc, #32]	; f001732c <id_new+0x84>
f0017308:	e59f2020 	ldr	r2, [pc, #32]	; f0017330 <id_new+0x88>
f001730c:	e3a0301d 	mov	r3, #29
f0017310:	ebfffaf5 	bl	f0015eec <printk>
f0017314:	eafffffe 	b	f0017314 <id_new+0x6c>
f0017318:	e51b3008 	ldr	r3, [fp, #-8]
f001731c:	e1a00003 	mov	r0, r3
f0017320:	e24bd004 	sub	sp, fp, #4
f0017324:	e8bd8800 	pop	{fp, pc}
f0017328:	f001f56c 	.word	0xf001f56c
f001732c:	f001f594 	.word	0xf001f594
f0017330:	f001f5a8 	.word	0xf001f5a8

f0017334 <id_del>:
f0017334:	e92d4800 	push	{fp, lr}
f0017338:	e28db004 	add	fp, sp, #4
f001733c:	e24dd010 	sub	sp, sp, #16
f0017340:	e50b0010 	str	r0, [fp, #-16]
f0017344:	e50b1014 	str	r1, [fp, #-20]
f0017348:	e51b3010 	ldr	r3, [fp, #-16]
f001734c:	e1a00003 	mov	r0, r3
f0017350:	ebffffb2 	bl	f0017220 <spin_lock>
f0017354:	e51b3010 	ldr	r3, [fp, #-16]
f0017358:	e2833008 	add	r3, r3, #8
f001735c:	e1a00003 	mov	r0, r3
f0017360:	e51b1014 	ldr	r1, [fp, #-20]
f0017364:	ebfffbca 	bl	f0016294 <check_and_clear_bit>
f0017368:	e50b0008 	str	r0, [fp, #-8]
f001736c:	e51b3010 	ldr	r3, [fp, #-16]
f0017370:	e1a00003 	mov	r0, r3
f0017374:	ebffffb0 	bl	f001723c <spin_unlock>
f0017378:	e51b3008 	ldr	r3, [fp, #-8]
f001737c:	e3530000 	cmp	r3, #0
f0017380:	aa000005 	bge	f001739c <id_del+0x68>
f0017384:	e59f0020 	ldr	r0, [pc, #32]	; f00173ac <id_del+0x78>
f0017388:	e59f1020 	ldr	r1, [pc, #32]	; f00173b0 <id_del+0x7c>
f001738c:	e59f2020 	ldr	r2, [pc, #32]	; f00173b4 <id_del+0x80>
f0017390:	e3a0302a 	mov	r3, #42	; 0x2a
f0017394:	ebfffad4 	bl	f0015eec <printk>
f0017398:	eafffffe 	b	f0017398 <id_del+0x64>
f001739c:	e51b3008 	ldr	r3, [fp, #-8]
f00173a0:	e1a00003 	mov	r0, r3
f00173a4:	e24bd004 	sub	sp, fp, #4
f00173a8:	e8bd8800 	pop	{fp, pc}
f00173ac:	f001f56c 	.word	0xf001f56c
f00173b0:	f001f594 	.word	0xf001f594
f00173b4:	f001f5b0 	.word	0xf001f5b0

f00173b8 <id_get>:
f00173b8:	e92d4800 	push	{fp, lr}
f00173bc:	e28db004 	add	fp, sp, #4
f00173c0:	e24dd010 	sub	sp, sp, #16
f00173c4:	e50b0010 	str	r0, [fp, #-16]
f00173c8:	e50b1014 	str	r1, [fp, #-20]
f00173cc:	e51b3010 	ldr	r3, [fp, #-16]
f00173d0:	e1a00003 	mov	r0, r3
f00173d4:	ebffff91 	bl	f0017220 <spin_lock>
f00173d8:	e51b3010 	ldr	r3, [fp, #-16]
f00173dc:	e2833008 	add	r3, r3, #8
f00173e0:	e1a00003 	mov	r0, r3
f00173e4:	e51b1014 	ldr	r1, [fp, #-20]
f00173e8:	ebfffbdc 	bl	f0016360 <check_and_set_bit>
f00173ec:	e50b0008 	str	r0, [fp, #-8]
f00173f0:	e51b3010 	ldr	r3, [fp, #-16]
f00173f4:	e1a00003 	mov	r0, r3
f00173f8:	ebffff8f 	bl	f001723c <spin_unlock>
f00173fc:	e51b3008 	ldr	r3, [fp, #-8]
f0017400:	e3530000 	cmp	r3, #0
f0017404:	aa000001 	bge	f0017410 <id_get+0x58>
f0017408:	e51b3008 	ldr	r3, [fp, #-8]
f001740c:	ea000000 	b	f0017414 <id_get+0x5c>
f0017410:	e51b3014 	ldr	r3, [fp, #-20]
f0017414:	e1a00003 	mov	r0, r3
f0017418:	e24bd004 	sub	sp, fp, #4
f001741c:	e8bd8800 	pop	{fp, pc}

f0017420 <link_init>:
f0017420:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f0017424:	e28db000 	add	fp, sp, #0
f0017428:	e24dd00c 	sub	sp, sp, #12
f001742c:	e50b0008 	str	r0, [fp, #-8]
f0017430:	e51b3008 	ldr	r3, [fp, #-8]
f0017434:	e51b2008 	ldr	r2, [fp, #-8]
f0017438:	e5832000 	str	r2, [r3]
f001743c:	e51b3008 	ldr	r3, [fp, #-8]
f0017440:	e51b2008 	ldr	r2, [fp, #-8]
f0017444:	e5832004 	str	r2, [r3, #4]
f0017448:	e24bd000 	sub	sp, fp, #0
f001744c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0017450:	e12fff1e 	bx	lr

f0017454 <waitqueue_head_init>:
f0017454:	e92d4800 	push	{fp, lr}
f0017458:	e28db004 	add	fp, sp, #4
f001745c:	e24dd008 	sub	sp, sp, #8
f0017460:	e50b0008 	str	r0, [fp, #-8]
f0017464:	e51b0008 	ldr	r0, [fp, #-8]
f0017468:	e3a01000 	mov	r1, #0
f001746c:	e3a02010 	mov	r2, #16
f0017470:	ebfffac8 	bl	f0015f98 <memset>
f0017474:	e51b3008 	ldr	r3, [fp, #-8]
f0017478:	e2833008 	add	r3, r3, #8
f001747c:	e1a00003 	mov	r0, r3
f0017480:	ebffffe6 	bl	f0017420 <link_init>
f0017484:	e24bd004 	sub	sp, fp, #4
f0017488:	e8bd8800 	pop	{fp, pc}

f001748c <mutex_init>:
f001748c:	e92d4800 	push	{fp, lr}
f0017490:	e28db004 	add	fp, sp, #4
f0017494:	e24dd008 	sub	sp, sp, #8
f0017498:	e50b0008 	str	r0, [fp, #-8]
f001749c:	e51b0008 	ldr	r0, [fp, #-8]
f00174a0:	e3a01000 	mov	r1, #0
f00174a4:	e3a02014 	mov	r2, #20
f00174a8:	ebfffaba 	bl	f0015f98 <memset>
f00174ac:	e51b3008 	ldr	r3, [fp, #-8]
f00174b0:	e1a00003 	mov	r0, r3
f00174b4:	ebffffe6 	bl	f0017454 <waitqueue_head_init>
f00174b8:	e24bd004 	sub	sp, fp, #4
f00174bc:	e8bd8800 	pop	{fp, pc}

f00174c0 <mem_cache_zalloc>:
f00174c0:	e92d4800 	push	{fp, lr}
f00174c4:	e28db004 	add	fp, sp, #4
f00174c8:	e24dd010 	sub	sp, sp, #16
f00174cc:	e50b0010 	str	r0, [fp, #-16]
f00174d0:	e51b0010 	ldr	r0, [fp, #-16]
f00174d4:	eb00000a 	bl	f0017504 <mem_cache_alloc>
f00174d8:	e50b0008 	str	r0, [fp, #-8]
f00174dc:	e51b3010 	ldr	r3, [fp, #-16]
f00174e0:	e593302c 	ldr	r3, [r3, #44]	; 0x2c
f00174e4:	e51b0008 	ldr	r0, [fp, #-8]
f00174e8:	e3a01000 	mov	r1, #0
f00174ec:	e1a02003 	mov	r2, r3
f00174f0:	ebfffaa8 	bl	f0015f98 <memset>
f00174f4:	e51b3008 	ldr	r3, [fp, #-8]
f00174f8:	e1a00003 	mov	r0, r3
f00174fc:	e24bd004 	sub	sp, fp, #4
f0017500:	e8bd8800 	pop	{fp, pc}

f0017504 <mem_cache_alloc>:
f0017504:	e92d4800 	push	{fp, lr}
f0017508:	e28db004 	add	fp, sp, #4
f001750c:	e24dd010 	sub	sp, sp, #16
f0017510:	e50b0010 	str	r0, [fp, #-16]
f0017514:	e51b3010 	ldr	r3, [fp, #-16]
f0017518:	e5933020 	ldr	r3, [r3, #32]
f001751c:	e3530000 	cmp	r3, #0
f0017520:	da00002d 	ble	f00175dc <mem_cache_alloc+0xd8>
f0017524:	e51b3010 	ldr	r3, [fp, #-16]
f0017528:	e2833008 	add	r3, r3, #8
f001752c:	e1a00003 	mov	r0, r3
f0017530:	ebfffe71 	bl	f0016efc <mutex_lock>
f0017534:	e50b0008 	str	r0, [fp, #-8]
f0017538:	e51b3008 	ldr	r3, [fp, #-8]
f001753c:	e3530000 	cmp	r3, #0
f0017540:	aa000001 	bge	f001754c <mem_cache_alloc+0x48>
f0017544:	e51b3008 	ldr	r3, [fp, #-8]
f0017548:	ea000024 	b	f00175e0 <mem_cache_alloc+0xdc>
f001754c:	e51b3010 	ldr	r3, [fp, #-16]
f0017550:	e5933020 	ldr	r3, [r3, #32]
f0017554:	e2432001 	sub	r2, r3, #1
f0017558:	e51b3010 	ldr	r3, [fp, #-16]
f001755c:	e5832020 	str	r2, [r3, #32]
f0017560:	e51b3010 	ldr	r3, [fp, #-16]
f0017564:	e5932030 	ldr	r2, [r3, #48]	; 0x30
f0017568:	e51b3010 	ldr	r3, [fp, #-16]
f001756c:	e593301c 	ldr	r3, [r3, #28]
f0017570:	e1a00002 	mov	r0, r2
f0017574:	e1a01003 	mov	r1, r3
f0017578:	ebfffb01 	bl	f0016184 <find_and_set_first_free_bit>
f001757c:	e50b000c 	str	r0, [fp, #-12]
f0017580:	e51b300c 	ldr	r3, [fp, #-12]
f0017584:	e3530000 	cmp	r3, #0
f0017588:	aa000007 	bge	f00175ac <mem_cache_alloc+0xa8>
f001758c:	e59f0058 	ldr	r0, [pc, #88]	; f00175ec <mem_cache_alloc+0xe8>
f0017590:	ebfffa55 	bl	f0015eec <printk>
f0017594:	e59f0054 	ldr	r0, [pc, #84]	; f00175f0 <mem_cache_alloc+0xec>
f0017598:	e59f1054 	ldr	r1, [pc, #84]	; f00175f4 <mem_cache_alloc+0xf0>
f001759c:	e59f2054 	ldr	r2, [pc, #84]	; f00175f8 <mem_cache_alloc+0xf4>
f00175a0:	e3a03023 	mov	r3, #35	; 0x23
f00175a4:	ebfffa50 	bl	f0015eec <printk>
f00175a8:	eafffffe 	b	f00175a8 <mem_cache_alloc+0xa4>
f00175ac:	e51b3010 	ldr	r3, [fp, #-16]
f00175b0:	e2833008 	add	r3, r3, #8
f00175b4:	e1a00003 	mov	r0, r3
f00175b8:	ebfffefc 	bl	f00171b0 <mutex_unlock>
f00175bc:	e51b3010 	ldr	r3, [fp, #-16]
f00175c0:	e5932024 	ldr	r2, [r3, #36]	; 0x24
f00175c4:	e51b3010 	ldr	r3, [fp, #-16]
f00175c8:	e593302c 	ldr	r3, [r3, #44]	; 0x2c
f00175cc:	e51b100c 	ldr	r1, [fp, #-12]
f00175d0:	e0030391 	mul	r3, r1, r3
f00175d4:	e0823003 	add	r3, r2, r3
f00175d8:	ea000000 	b	f00175e0 <mem_cache_alloc+0xdc>
f00175dc:	e3a03000 	mov	r3, #0
f00175e0:	e1a00003 	mov	r0, r3
f00175e4:	e24bd004 	sub	sp, fp, #4
f00175e8:	e8bd8800 	pop	{fp, pc}
f00175ec:	f001f5b8 	.word	0xf001f5b8
f00175f0:	f001f608 	.word	0xf001f608
f00175f4:	f001f630 	.word	0xf001f630
f00175f8:	f001f774 	.word	0xf001f774

f00175fc <mem_cache_free>:
f00175fc:	e92d4800 	push	{fp, lr}
f0017600:	e28db004 	add	fp, sp, #4
f0017604:	e24dd018 	sub	sp, sp, #24
f0017608:	e50b0018 	str	r0, [fp, #-24]
f001760c:	e50b101c 	str	r1, [fp, #-28]
f0017610:	e51b301c 	ldr	r3, [fp, #-28]
f0017614:	e50b300c 	str	r3, [fp, #-12]
f0017618:	e3a03000 	mov	r3, #0
f001761c:	e50b3008 	str	r3, [fp, #-8]
f0017620:	e51b3018 	ldr	r3, [fp, #-24]
f0017624:	e5932024 	ldr	r2, [r3, #36]	; 0x24
f0017628:	e51b300c 	ldr	r3, [fp, #-12]
f001762c:	e1520003 	cmp	r2, r3
f0017630:	8a000004 	bhi	f0017648 <mem_cache_free+0x4c>
f0017634:	e51b3018 	ldr	r3, [fp, #-24]
f0017638:	e5932028 	ldr	r2, [r3, #40]	; 0x28
f001763c:	e51b300c 	ldr	r3, [fp, #-12]
f0017640:	e1520003 	cmp	r2, r3
f0017644:	2a000001 	bcs	f0017650 <mem_cache_free+0x54>
f0017648:	e3e03000 	mvn	r3, #0
f001764c:	ea000047 	b	f0017770 <mem_cache_free+0x174>
f0017650:	e51b3018 	ldr	r3, [fp, #-24]
f0017654:	e5933024 	ldr	r3, [r3, #36]	; 0x24
f0017658:	e51b200c 	ldr	r2, [fp, #-12]
f001765c:	e0632002 	rsb	r2, r3, r2
f0017660:	e51b3018 	ldr	r3, [fp, #-24]
f0017664:	e593302c 	ldr	r3, [r3, #44]	; 0x2c
f0017668:	e1a00002 	mov	r0, r2
f001766c:	e1a01003 	mov	r1, r3
f0017670:	eb001a3d 	bl	f001df6c <__aeabi_uidiv>
f0017674:	e1a03000 	mov	r3, r0
f0017678:	e50b3010 	str	r3, [fp, #-16]
f001767c:	e51b3018 	ldr	r3, [fp, #-24]
f0017680:	e593302c 	ldr	r3, [r3, #44]	; 0x2c
f0017684:	e51b2010 	ldr	r2, [fp, #-16]
f0017688:	e0020293 	mul	r2, r3, r2
f001768c:	e51b3018 	ldr	r3, [fp, #-24]
f0017690:	e5933024 	ldr	r3, [r3, #36]	; 0x24
f0017694:	e0822003 	add	r2, r2, r3
f0017698:	e51b300c 	ldr	r3, [fp, #-12]
f001769c:	e1520003 	cmp	r2, r3
f00176a0:	0a000005 	beq	f00176bc <mem_cache_free+0xc0>
f00176a4:	e59f00d0 	ldr	r0, [pc, #208]	; f001777c <mem_cache_free+0x180>
f00176a8:	ebfffa0f 	bl	f0015eec <printk>
f00176ac:	e3e03000 	mvn	r3, #0
f00176b0:	e50b3008 	str	r3, [fp, #-8]
f00176b4:	e51b3008 	ldr	r3, [fp, #-8]
f00176b8:	ea00002c 	b	f0017770 <mem_cache_free+0x174>
f00176bc:	e51b3018 	ldr	r3, [fp, #-24]
f00176c0:	e2833008 	add	r3, r3, #8
f00176c4:	e1a00003 	mov	r0, r3
f00176c8:	ebfffe0b 	bl	f0016efc <mutex_lock>
f00176cc:	e50b0008 	str	r0, [fp, #-8]
f00176d0:	e51b3008 	ldr	r3, [fp, #-8]
f00176d4:	e3530000 	cmp	r3, #0
f00176d8:	aa000001 	bge	f00176e4 <mem_cache_free+0xe8>
f00176dc:	e51b3008 	ldr	r3, [fp, #-8]
f00176e0:	ea000022 	b	f0017770 <mem_cache_free+0x174>
f00176e4:	e51b3018 	ldr	r3, [fp, #-24]
f00176e8:	e5932030 	ldr	r2, [r3, #48]	; 0x30
f00176ec:	e51b3010 	ldr	r3, [fp, #-16]
f00176f0:	e1a00002 	mov	r0, r2
f00176f4:	e1a01003 	mov	r1, r3
f00176f8:	ebfffae5 	bl	f0016294 <check_and_clear_bit>
f00176fc:	e1a03000 	mov	r3, r0
f0017700:	e3530000 	cmp	r3, #0
f0017704:	aa000004 	bge	f001771c <mem_cache_free+0x120>
f0017708:	e59f0070 	ldr	r0, [pc, #112]	; f0017780 <mem_cache_free+0x184>
f001770c:	ebfff9f6 	bl	f0015eec <printk>
f0017710:	e3e03000 	mvn	r3, #0
f0017714:	e50b3008 	str	r3, [fp, #-8]
f0017718:	ea00000f 	b	f001775c <mem_cache_free+0x160>
f001771c:	e51b3018 	ldr	r3, [fp, #-24]
f0017720:	e5933020 	ldr	r3, [r3, #32]
f0017724:	e2832001 	add	r2, r3, #1
f0017728:	e51b3018 	ldr	r3, [fp, #-24]
f001772c:	e5832020 	str	r2, [r3, #32]
f0017730:	e51b3018 	ldr	r3, [fp, #-24]
f0017734:	e5932020 	ldr	r2, [r3, #32]
f0017738:	e51b3018 	ldr	r3, [fp, #-24]
f001773c:	e593301c 	ldr	r3, [r3, #28]
f0017740:	e1520003 	cmp	r2, r3
f0017744:	da000004 	ble	f001775c <mem_cache_free+0x160>
f0017748:	e59f0034 	ldr	r0, [pc, #52]	; f0017784 <mem_cache_free+0x188>
f001774c:	ebfff9e6 	bl	f0015eec <printk>
f0017750:	e3e03000 	mvn	r3, #0
f0017754:	e50b3008 	str	r3, [fp, #-8]
f0017758:	e1a00000 	nop			; (mov r0, r0)
f001775c:	e51b3018 	ldr	r3, [fp, #-24]
f0017760:	e2833008 	add	r3, r3, #8
f0017764:	e1a00003 	mov	r0, r3
f0017768:	ebfffe90 	bl	f00171b0 <mutex_unlock>
f001776c:	e51b3008 	ldr	r3, [fp, #-8]
f0017770:	e1a00003 	mov	r0, r3
f0017774:	e24bd004 	sub	sp, fp, #4
f0017778:	e8bd8800 	pop	{fp, pc}
f001777c:	f001f644 	.word	0xf001f644
f0017780:	f001f69c 	.word	0xf001f69c
f0017784:	f001f6ec 	.word	0xf001f6ec

f0017788 <mem_cache_bufsize>:
f0017788:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f001778c:	e28db000 	add	fp, sp, #0
f0017790:	e24dd024 	sub	sp, sp, #36	; 0x24
f0017794:	e50b0018 	str	r0, [fp, #-24]
f0017798:	e50b101c 	str	r1, [fp, #-28]
f001779c:	e50b2020 	str	r2, [fp, #-32]
f00177a0:	e50b3024 	str	r3, [fp, #-36]	; 0x24
f00177a4:	e51b3018 	ldr	r3, [fp, #-24]
f00177a8:	e50b3008 	str	r3, [fp, #-8]
f00177ac:	e51b3008 	ldr	r3, [fp, #-8]
f00177b0:	e2833003 	add	r3, r3, #3
f00177b4:	e3c33003 	bic	r3, r3, #3
f00177b8:	e50b3008 	str	r3, [fp, #-8]
f00177bc:	e51b301c 	ldr	r3, [fp, #-28]
f00177c0:	e51b2020 	ldr	r2, [fp, #-32]
f00177c4:	e0030392 	mul	r3, r2, r3
f00177c8:	e50b3010 	str	r3, [fp, #-16]
f00177cc:	e51b3020 	ldr	r3, [fp, #-32]
f00177d0:	e1a032c3 	asr	r3, r3, #5
f00177d4:	e50b300c 	str	r3, [fp, #-12]
f00177d8:	e51b3020 	ldr	r3, [fp, #-32]
f00177dc:	e203301f 	and	r3, r3, #31
f00177e0:	e3530000 	cmp	r3, #0
f00177e4:	0a000002 	beq	f00177f4 <mem_cache_bufsize+0x6c>
f00177e8:	e51b300c 	ldr	r3, [fp, #-12]
f00177ec:	e2833001 	add	r3, r3, #1
f00177f0:	e50b300c 	str	r3, [fp, #-12]
f00177f4:	e51b300c 	ldr	r3, [fp, #-12]
f00177f8:	e1a03103 	lsl	r3, r3, #2
f00177fc:	e50b3014 	str	r3, [fp, #-20]
f0017800:	e51b2014 	ldr	r2, [fp, #-20]
f0017804:	e51b3010 	ldr	r3, [fp, #-16]
f0017808:	e0823003 	add	r3, r2, r3
f001780c:	e1a02003 	mov	r2, r3
f0017810:	e51b3008 	ldr	r3, [fp, #-8]
f0017814:	e0823003 	add	r3, r2, r3
f0017818:	e2833034 	add	r3, r3, #52	; 0x34
f001781c:	e50b3008 	str	r3, [fp, #-8]
f0017820:	e51b3024 	ldr	r3, [fp, #-36]	; 0x24
f0017824:	e3530000 	cmp	r3, #0
f0017828:	0a000007 	beq	f001784c <mem_cache_bufsize+0xc4>
f001782c:	e51b201c 	ldr	r2, [fp, #-28]
f0017830:	e51b3008 	ldr	r3, [fp, #-8]
f0017834:	e0823003 	add	r3, r2, r3
f0017838:	e2432001 	sub	r2, r3, #1
f001783c:	e51b301c 	ldr	r3, [fp, #-28]
f0017840:	e2633000 	rsb	r3, r3, #0
f0017844:	e0023003 	and	r3, r2, r3
f0017848:	e50b3008 	str	r3, [fp, #-8]
f001784c:	e51b3018 	ldr	r3, [fp, #-24]
f0017850:	e51b2008 	ldr	r2, [fp, #-8]
f0017854:	e0633002 	rsb	r3, r3, r2
f0017858:	e1a00003 	mov	r0, r3
f001785c:	e24bd000 	sub	sp, fp, #0
f0017860:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0017864:	e12fff1e 	bx	lr

f0017868 <mem_cache_init>:
f0017868:	e92d4800 	push	{fp, lr}
f001786c:	e28db004 	add	fp, sp, #4
f0017870:	e24dd038 	sub	sp, sp, #56	; 0x38
f0017874:	e50b0030 	str	r0, [fp, #-48]	; 0x30
f0017878:	e50b1034 	str	r1, [fp, #-52]	; 0x34
f001787c:	e50b2038 	str	r2, [fp, #-56]	; 0x38
f0017880:	e50b303c 	str	r3, [fp, #-60]	; 0x3c
f0017884:	e51b3030 	ldr	r3, [fp, #-48]	; 0x30
f0017888:	e2833003 	add	r3, r3, #3
f001788c:	e3c33003 	bic	r3, r3, #3
f0017890:	e50b3014 	str	r3, [fp, #-20]
f0017894:	e51b2030 	ldr	r2, [fp, #-48]	; 0x30
f0017898:	e51b3014 	ldr	r3, [fp, #-20]
f001789c:	e0633002 	rsb	r3, r3, r2
f00178a0:	e51b2034 	ldr	r2, [fp, #-52]	; 0x34
f00178a4:	e0823003 	add	r3, r2, r3
f00178a8:	e50b3034 	str	r3, [fp, #-52]	; 0x34
f00178ac:	e51b3014 	ldr	r3, [fp, #-20]
f00178b0:	e50b3018 	str	r3, [fp, #-24]
f00178b4:	e51b3038 	ldr	r3, [fp, #-56]	; 0x38
f00178b8:	e3530000 	cmp	r3, #0
f00178bc:	ba000005 	blt	f00178d8 <mem_cache_init+0x70>
f00178c0:	e51b3034 	ldr	r3, [fp, #-52]	; 0x34
f00178c4:	e3530000 	cmp	r3, #0
f00178c8:	ba000002 	blt	f00178d8 <mem_cache_init+0x70>
f00178cc:	e51b3014 	ldr	r3, [fp, #-20]
f00178d0:	e3730001 	cmn	r3, #1
f00178d4:	1a000003 	bne	f00178e8 <mem_cache_init+0x80>
f00178d8:	e59f0238 	ldr	r0, [pc, #568]	; f0017b18 <mem_cache_init+0x2b0>
f00178dc:	ebfff982 	bl	f0015eec <printk>
f00178e0:	e3a03000 	mov	r3, #0
f00178e4:	ea000088 	b	f0017b0c <mem_cache_init+0x2a4>
f00178e8:	e51b3014 	ldr	r3, [fp, #-20]
f00178ec:	e2833034 	add	r3, r3, #52	; 0x34
f00178f0:	e50b3008 	str	r3, [fp, #-8]
f00178f4:	e51b3034 	ldr	r3, [fp, #-52]	; 0x34
f00178f8:	e2433034 	sub	r3, r3, #52	; 0x34
f00178fc:	e50b3034 	str	r3, [fp, #-52]	; 0x34
f0017900:	e51b2034 	ldr	r2, [fp, #-52]	; 0x34
f0017904:	e51b3038 	ldr	r3, [fp, #-56]	; 0x38
f0017908:	e1520003 	cmp	r2, r3
f001790c:	aa000003 	bge	f0017920 <mem_cache_init+0xb8>
f0017910:	e59f0204 	ldr	r0, [pc, #516]	; f0017b1c <mem_cache_init+0x2b4>
f0017914:	ebfff974 	bl	f0015eec <printk>
f0017918:	e3a03000 	mov	r3, #0
f001791c:	ea00007a 	b	f0017b0c <mem_cache_init+0x2a4>
f0017920:	e51b0034 	ldr	r0, [fp, #-52]	; 0x34
f0017924:	e51b1038 	ldr	r1, [fp, #-56]	; 0x38
f0017928:	eb0019d4 	bl	f001e080 <__aeabi_idiv>
f001792c:	e1a03000 	mov	r3, r0
f0017930:	e50b3010 	str	r3, [fp, #-16]
f0017934:	e51b3010 	ldr	r3, [fp, #-16]
f0017938:	e1a032c3 	asr	r3, r3, #5
f001793c:	e50b300c 	str	r3, [fp, #-12]
f0017940:	e51b3010 	ldr	r3, [fp, #-16]
f0017944:	e203301f 	and	r3, r3, #31
f0017948:	e3530000 	cmp	r3, #0
f001794c:	0a000002 	beq	f001795c <mem_cache_init+0xf4>
f0017950:	e51b300c 	ldr	r3, [fp, #-12]
f0017954:	e2833001 	add	r3, r3, #1
f0017958:	e50b300c 	str	r3, [fp, #-12]
f001795c:	e51b300c 	ldr	r3, [fp, #-12]
f0017960:	e1a03103 	lsl	r3, r3, #2
f0017964:	e50b301c 	str	r3, [fp, #-28]
f0017968:	e51b2034 	ldr	r2, [fp, #-52]	; 0x34
f001796c:	e51b301c 	ldr	r3, [fp, #-28]
f0017970:	e0633002 	rsb	r3, r3, r2
f0017974:	e50b3034 	str	r3, [fp, #-52]	; 0x34
f0017978:	e51b0034 	ldr	r0, [fp, #-52]	; 0x34
f001797c:	e51b1038 	ldr	r1, [fp, #-56]	; 0x38
f0017980:	eb0019be 	bl	f001e080 <__aeabi_idiv>
f0017984:	e1a03000 	mov	r3, r0
f0017988:	e50b3010 	str	r3, [fp, #-16]
f001798c:	e51b3010 	ldr	r3, [fp, #-16]
f0017990:	e3530000 	cmp	r3, #0
f0017994:	ca000003 	bgt	f00179a8 <mem_cache_init+0x140>
f0017998:	e59f017c 	ldr	r0, [pc, #380]	; f0017b1c <mem_cache_init+0x2b4>
f001799c:	ebfff952 	bl	f0015eec <printk>
f00179a0:	e3a03000 	mov	r3, #0
f00179a4:	ea000058 	b	f0017b0c <mem_cache_init+0x2a4>
f00179a8:	e51b3034 	ldr	r3, [fp, #-52]	; 0x34
f00179ac:	e3530000 	cmp	r3, #0
f00179b0:	ca000003 	bgt	f00179c4 <mem_cache_init+0x15c>
f00179b4:	e59f0160 	ldr	r0, [pc, #352]	; f0017b1c <mem_cache_init+0x2b4>
f00179b8:	ebfff94b 	bl	f0015eec <printk>
f00179bc:	e3a03000 	mov	r3, #0
f00179c0:	ea000051 	b	f0017b0c <mem_cache_init+0x2a4>
f00179c4:	e51b3008 	ldr	r3, [fp, #-8]
f00179c8:	e50b3020 	str	r3, [fp, #-32]
f00179cc:	e51b300c 	ldr	r3, [fp, #-12]
f00179d0:	e1a03103 	lsl	r3, r3, #2
f00179d4:	e51b2020 	ldr	r2, [fp, #-32]
f00179d8:	e0823003 	add	r3, r2, r3
f00179dc:	e50b3008 	str	r3, [fp, #-8]
f00179e0:	e51b303c 	ldr	r3, [fp, #-60]	; 0x3c
f00179e4:	e3530000 	cmp	r3, #0
f00179e8:	0a000022 	beq	f0017a78 <mem_cache_init+0x210>
f00179ec:	e51b3008 	ldr	r3, [fp, #-8]
f00179f0:	e50b3024 	str	r3, [fp, #-36]	; 0x24
f00179f4:	e51b2038 	ldr	r2, [fp, #-56]	; 0x38
f00179f8:	e51b3008 	ldr	r3, [fp, #-8]
f00179fc:	e0823003 	add	r3, r2, r3
f0017a00:	e2432001 	sub	r2, r3, #1
f0017a04:	e51b3038 	ldr	r3, [fp, #-56]	; 0x38
f0017a08:	e2633000 	rsb	r3, r3, #0
f0017a0c:	e0023003 	and	r3, r2, r3
f0017a10:	e50b3028 	str	r3, [fp, #-40]	; 0x28
f0017a14:	e51b2028 	ldr	r2, [fp, #-40]	; 0x28
f0017a18:	e51b3024 	ldr	r3, [fp, #-36]	; 0x24
f0017a1c:	e0633002 	rsb	r3, r3, r2
f0017a20:	e50b302c 	str	r3, [fp, #-44]	; 0x2c
f0017a24:	e51b2038 	ldr	r2, [fp, #-56]	; 0x38
f0017a28:	e51b302c 	ldr	r3, [fp, #-44]	; 0x2c
f0017a2c:	e1520003 	cmp	r2, r3
f0017a30:	8a000005 	bhi	f0017a4c <mem_cache_init+0x1e4>
f0017a34:	e59f00e4 	ldr	r0, [pc, #228]	; f0017b20 <mem_cache_init+0x2b8>
f0017a38:	e59f10e4 	ldr	r1, [pc, #228]	; f0017b24 <mem_cache_init+0x2bc>
f0017a3c:	e59f20e4 	ldr	r2, [pc, #228]	; f0017b28 <mem_cache_init+0x2c0>
f0017a40:	e3a030c1 	mov	r3, #193	; 0xc1
f0017a44:	ebfff928 	bl	f0015eec <printk>
f0017a48:	eafffffe 	b	f0017a48 <mem_cache_init+0x1e0>
f0017a4c:	e51b2034 	ldr	r2, [fp, #-52]	; 0x34
f0017a50:	e51b302c 	ldr	r3, [fp, #-44]	; 0x2c
f0017a54:	e0633002 	rsb	r3, r3, r2
f0017a58:	e50b3034 	str	r3, [fp, #-52]	; 0x34
f0017a5c:	e51b0034 	ldr	r0, [fp, #-52]	; 0x34
f0017a60:	e51b1038 	ldr	r1, [fp, #-56]	; 0x38
f0017a64:	eb001985 	bl	f001e080 <__aeabi_idiv>
f0017a68:	e1a03000 	mov	r3, r0
f0017a6c:	e50b3010 	str	r3, [fp, #-16]
f0017a70:	e51b3028 	ldr	r3, [fp, #-40]	; 0x28
f0017a74:	e50b3008 	str	r3, [fp, #-8]
f0017a78:	e51b3018 	ldr	r3, [fp, #-24]
f0017a7c:	e1a00003 	mov	r0, r3
f0017a80:	ebfffe66 	bl	f0017420 <link_init>
f0017a84:	e51b3018 	ldr	r3, [fp, #-24]
f0017a88:	e51b2008 	ldr	r2, [fp, #-8]
f0017a8c:	e5832024 	str	r2, [r3, #36]	; 0x24
f0017a90:	e51b2034 	ldr	r2, [fp, #-52]	; 0x34
f0017a94:	e51b3008 	ldr	r3, [fp, #-8]
f0017a98:	e0822003 	add	r2, r2, r3
f0017a9c:	e51b3018 	ldr	r3, [fp, #-24]
f0017aa0:	e5832028 	str	r2, [r3, #40]	; 0x28
f0017aa4:	e51b3018 	ldr	r3, [fp, #-24]
f0017aa8:	e51b2010 	ldr	r2, [fp, #-16]
f0017aac:	e583201c 	str	r2, [r3, #28]
f0017ab0:	e51b3018 	ldr	r3, [fp, #-24]
f0017ab4:	e593201c 	ldr	r2, [r3, #28]
f0017ab8:	e51b3018 	ldr	r3, [fp, #-24]
f0017abc:	e5832020 	str	r2, [r3, #32]
f0017ac0:	e51b2038 	ldr	r2, [fp, #-56]	; 0x38
f0017ac4:	e51b3018 	ldr	r3, [fp, #-24]
f0017ac8:	e583202c 	str	r2, [r3, #44]	; 0x2c
f0017acc:	e51b3018 	ldr	r3, [fp, #-24]
f0017ad0:	e51b2020 	ldr	r2, [fp, #-32]
f0017ad4:	e5832030 	str	r2, [r3, #48]	; 0x30
f0017ad8:	e51b3018 	ldr	r3, [fp, #-24]
f0017adc:	e2833008 	add	r3, r3, #8
f0017ae0:	e1a00003 	mov	r0, r3
f0017ae4:	ebfffe68 	bl	f001748c <mutex_init>
f0017ae8:	e51b3018 	ldr	r3, [fp, #-24]
f0017aec:	e5932030 	ldr	r2, [r3, #48]	; 0x30
f0017af0:	e51b300c 	ldr	r3, [fp, #-12]
f0017af4:	e1a03103 	lsl	r3, r3, #2
f0017af8:	e1a00002 	mov	r0, r2
f0017afc:	e3a01000 	mov	r1, #0
f0017b00:	e1a02003 	mov	r2, r3
f0017b04:	ebfff923 	bl	f0015f98 <memset>
f0017b08:	e51b3018 	ldr	r3, [fp, #-24]
f0017b0c:	e1a00003 	mov	r0, r3
f0017b10:	e24bd004 	sub	sp, fp, #4
f0017b14:	e8bd8800 	pop	{fp, pc}
f0017b18:	f001f734 	.word	0xf001f734
f0017b1c:	f001f74c 	.word	0xf001f74c
f0017b20:	f001f608 	.word	0xf001f608
f0017b24:	f001f630 	.word	0xf001f630
f0017b28:	f001f784 	.word	0xf001f784

f0017b2c <current_task>:
f0017b2c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f0017b30:	e28db000 	add	fp, sp, #0
f0017b34:	e1a0300d 	mov	r3, sp
f0017b38:	e3c33eff 	bic	r3, r3, #4080	; 0xff0
f0017b3c:	e3c3300f 	bic	r3, r3, #15
f0017b40:	e1a00003 	mov	r0, r3
f0017b44:	e24bd000 	sub	sp, fp, #0
f0017b48:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0017b4c:	e12fff1e 	bx	lr

f0017b50 <print_syscall_context>:
f0017b50:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
f0017b54:	e28db020 	add	fp, sp, #32
f0017b58:	e24dd044 	sub	sp, sp, #68	; 0x44
f0017b5c:	e50b0030 	str	r0, [fp, #-48]	; 0x30
f0017b60:	e51b3030 	ldr	r3, [fp, #-48]	; 0x30
f0017b64:	e5933044 	ldr	r3, [r3, #68]	; 0x44
f0017b68:	e50b3028 	str	r3, [fp, #-40]	; 0x28
f0017b6c:	e51b3030 	ldr	r3, [fp, #-48]	; 0x30
f0017b70:	e5934054 	ldr	r4, [r3, #84]	; 0x54
f0017b74:	e51b3028 	ldr	r3, [fp, #-40]	; 0x28
f0017b78:	e5d32000 	ldrb	r2, [r3]
f0017b7c:	e5d31001 	ldrb	r1, [r3, #1]
f0017b80:	e1a01401 	lsl	r1, r1, #8
f0017b84:	e1812002 	orr	r2, r1, r2
f0017b88:	e5d31002 	ldrb	r1, [r3, #2]
f0017b8c:	e1a01801 	lsl	r1, r1, #16
f0017b90:	e1812002 	orr	r2, r1, r2
f0017b94:	e5d33003 	ldrb	r3, [r3, #3]
f0017b98:	e1a03c03 	lsl	r3, r3, #24
f0017b9c:	e1833002 	orr	r3, r3, r2
f0017ba0:	e1a0e003 	mov	lr, r3
f0017ba4:	e51b3028 	ldr	r3, [fp, #-40]	; 0x28
f0017ba8:	e5d32004 	ldrb	r2, [r3, #4]
f0017bac:	e5d31005 	ldrb	r1, [r3, #5]
f0017bb0:	e1a01401 	lsl	r1, r1, #8
f0017bb4:	e1812002 	orr	r2, r1, r2
f0017bb8:	e5d31006 	ldrb	r1, [r3, #6]
f0017bbc:	e1a01801 	lsl	r1, r1, #16
f0017bc0:	e1812002 	orr	r2, r1, r2
f0017bc4:	e5d33007 	ldrb	r3, [r3, #7]
f0017bc8:	e1a03c03 	lsl	r3, r3, #24
f0017bcc:	e1833002 	orr	r3, r3, r2
f0017bd0:	e1a0c003 	mov	ip, r3
f0017bd4:	e51b3028 	ldr	r3, [fp, #-40]	; 0x28
f0017bd8:	e5d32008 	ldrb	r2, [r3, #8]
f0017bdc:	e5d31009 	ldrb	r1, [r3, #9]
f0017be0:	e1a01401 	lsl	r1, r1, #8
f0017be4:	e1812002 	orr	r2, r1, r2
f0017be8:	e5d3100a 	ldrb	r1, [r3, #10]
f0017bec:	e1a01801 	lsl	r1, r1, #16
f0017bf0:	e1812002 	orr	r2, r1, r2
f0017bf4:	e5d3300b 	ldrb	r3, [r3, #11]
f0017bf8:	e1a03c03 	lsl	r3, r3, #24
f0017bfc:	e1833002 	orr	r3, r3, r2
f0017c00:	e50b3034 	str	r3, [fp, #-52]	; 0x34
f0017c04:	e51b3028 	ldr	r3, [fp, #-40]	; 0x28
f0017c08:	e5d3200c 	ldrb	r2, [r3, #12]
f0017c0c:	e5d3100d 	ldrb	r1, [r3, #13]
f0017c10:	e1a01401 	lsl	r1, r1, #8
f0017c14:	e1812002 	orr	r2, r1, r2
f0017c18:	e5d3100e 	ldrb	r1, [r3, #14]
f0017c1c:	e1a01801 	lsl	r1, r1, #16
f0017c20:	e1812002 	orr	r2, r1, r2
f0017c24:	e5d3300f 	ldrb	r3, [r3, #15]
f0017c28:	e1a03c03 	lsl	r3, r3, #24
f0017c2c:	e1833002 	orr	r3, r3, r2
f0017c30:	e50b3038 	str	r3, [fp, #-56]	; 0x38
f0017c34:	e51b3028 	ldr	r3, [fp, #-40]	; 0x28
f0017c38:	e5d32010 	ldrb	r2, [r3, #16]
f0017c3c:	e5d31011 	ldrb	r1, [r3, #17]
f0017c40:	e1a01401 	lsl	r1, r1, #8
f0017c44:	e1812002 	orr	r2, r1, r2
f0017c48:	e5d31012 	ldrb	r1, [r3, #18]
f0017c4c:	e1a01801 	lsl	r1, r1, #16
f0017c50:	e1812002 	orr	r2, r1, r2
f0017c54:	e5d33013 	ldrb	r3, [r3, #19]
f0017c58:	e1a03c03 	lsl	r3, r3, #24
f0017c5c:	e1833002 	orr	r3, r3, r2
f0017c60:	e1a0a003 	mov	sl, r3
f0017c64:	e51b3028 	ldr	r3, [fp, #-40]	; 0x28
f0017c68:	e5d32014 	ldrb	r2, [r3, #20]
f0017c6c:	e5d31015 	ldrb	r1, [r3, #21]
f0017c70:	e1a01401 	lsl	r1, r1, #8
f0017c74:	e1812002 	orr	r2, r1, r2
f0017c78:	e5d31016 	ldrb	r1, [r3, #22]
f0017c7c:	e1a01801 	lsl	r1, r1, #16
f0017c80:	e1812002 	orr	r2, r1, r2
f0017c84:	e5d33017 	ldrb	r3, [r3, #23]
f0017c88:	e1a03c03 	lsl	r3, r3, #24
f0017c8c:	e1833002 	orr	r3, r3, r2
f0017c90:	e1a09003 	mov	r9, r3
f0017c94:	e51b3028 	ldr	r3, [fp, #-40]	; 0x28
f0017c98:	e5d32018 	ldrb	r2, [r3, #24]
f0017c9c:	e5d31019 	ldrb	r1, [r3, #25]
f0017ca0:	e1a01401 	lsl	r1, r1, #8
f0017ca4:	e1812002 	orr	r2, r1, r2
f0017ca8:	e5d3101a 	ldrb	r1, [r3, #26]
f0017cac:	e1a01801 	lsl	r1, r1, #16
f0017cb0:	e1812002 	orr	r2, r1, r2
f0017cb4:	e5d3301b 	ldrb	r3, [r3, #27]
f0017cb8:	e1a03c03 	lsl	r3, r3, #24
f0017cbc:	e1833002 	orr	r3, r3, r2
f0017cc0:	e1a08003 	mov	r8, r3
f0017cc4:	e51b3028 	ldr	r3, [fp, #-40]	; 0x28
f0017cc8:	e5d3201c 	ldrb	r2, [r3, #28]
f0017ccc:	e5d3101d 	ldrb	r1, [r3, #29]
f0017cd0:	e1a01401 	lsl	r1, r1, #8
f0017cd4:	e1812002 	orr	r2, r1, r2
f0017cd8:	e5d3101e 	ldrb	r1, [r3, #30]
f0017cdc:	e1a01801 	lsl	r1, r1, #16
f0017ce0:	e1812002 	orr	r2, r1, r2
f0017ce4:	e5d3301f 	ldrb	r3, [r3, #31]
f0017ce8:	e1a03c03 	lsl	r3, r3, #24
f0017cec:	e1833002 	orr	r3, r3, r2
f0017cf0:	e1a07003 	mov	r7, r3
f0017cf4:	e51b3028 	ldr	r3, [fp, #-40]	; 0x28
f0017cf8:	e5d32020 	ldrb	r2, [r3, #32]
f0017cfc:	e5d31021 	ldrb	r1, [r3, #33]	; 0x21
f0017d00:	e1a01401 	lsl	r1, r1, #8
f0017d04:	e1812002 	orr	r2, r1, r2
f0017d08:	e5d31022 	ldrb	r1, [r3, #34]	; 0x22
f0017d0c:	e1a01801 	lsl	r1, r1, #16
f0017d10:	e1812002 	orr	r2, r1, r2
f0017d14:	e5d33023 	ldrb	r3, [r3, #35]	; 0x23
f0017d18:	e1a03c03 	lsl	r3, r3, #24
f0017d1c:	e1833002 	orr	r3, r3, r2
f0017d20:	e1a06003 	mov	r6, r3
f0017d24:	e51b3028 	ldr	r3, [fp, #-40]	; 0x28
f0017d28:	e5d32024 	ldrb	r2, [r3, #36]	; 0x24
f0017d2c:	e5d31025 	ldrb	r1, [r3, #37]	; 0x25
f0017d30:	e1a01401 	lsl	r1, r1, #8
f0017d34:	e1812002 	orr	r2, r1, r2
f0017d38:	e5d31026 	ldrb	r1, [r3, #38]	; 0x26
f0017d3c:	e1a01801 	lsl	r1, r1, #16
f0017d40:	e1812002 	orr	r2, r1, r2
f0017d44:	e5d33027 	ldrb	r3, [r3, #39]	; 0x27
f0017d48:	e1a03c03 	lsl	r3, r3, #24
f0017d4c:	e1833002 	orr	r3, r3, r2
f0017d50:	e1a05003 	mov	r5, r3
f0017d54:	e51b2028 	ldr	r2, [fp, #-40]	; 0x28
f0017d58:	e5d21038 	ldrb	r1, [r2, #56]	; 0x38
f0017d5c:	e5d23039 	ldrb	r3, [r2, #57]	; 0x39
f0017d60:	e1a03403 	lsl	r3, r3, #8
f0017d64:	e1831001 	orr	r1, r3, r1
f0017d68:	e5d2303a 	ldrb	r3, [r2, #58]	; 0x3a
f0017d6c:	e1a03803 	lsl	r3, r3, #16
f0017d70:	e1833001 	orr	r3, r3, r1
f0017d74:	e5d2203b 	ldrb	r2, [r2, #59]	; 0x3b
f0017d78:	e1a02c02 	lsl	r2, r2, #24
f0017d7c:	e1823003 	orr	r3, r2, r3
f0017d80:	e1a00003 	mov	r0, r3
f0017d84:	e51b2028 	ldr	r2, [fp, #-40]	; 0x28
f0017d88:	e5d2103c 	ldrb	r1, [r2, #60]	; 0x3c
f0017d8c:	e5d2303d 	ldrb	r3, [r2, #61]	; 0x3d
f0017d90:	e1a03403 	lsl	r3, r3, #8
f0017d94:	e1831001 	orr	r1, r3, r1
f0017d98:	e5d2303e 	ldrb	r3, [r2, #62]	; 0x3e
f0017d9c:	e1a03803 	lsl	r3, r3, #16
f0017da0:	e1831001 	orr	r1, r3, r1
f0017da4:	e5d2303f 	ldrb	r3, [r2, #63]	; 0x3f
f0017da8:	e1a03c03 	lsl	r3, r3, #24
f0017dac:	e1833001 	orr	r3, r3, r1
f0017db0:	e51b2034 	ldr	r2, [fp, #-52]	; 0x34
f0017db4:	e58d2000 	str	r2, [sp]
f0017db8:	e51b2038 	ldr	r2, [fp, #-56]	; 0x38
f0017dbc:	e58d2004 	str	r2, [sp, #4]
f0017dc0:	e58da008 	str	sl, [sp, #8]
f0017dc4:	e58d900c 	str	r9, [sp, #12]
f0017dc8:	e58d8010 	str	r8, [sp, #16]
f0017dcc:	e58d7014 	str	r7, [sp, #20]
f0017dd0:	e58d6018 	str	r6, [sp, #24]
f0017dd4:	e58d501c 	str	r5, [sp, #28]
f0017dd8:	e58d0020 	str	r0, [sp, #32]
f0017ddc:	e58d3024 	str	r3, [sp, #36]	; 0x24
f0017de0:	e59f0014 	ldr	r0, [pc, #20]	; f0017dfc <print_syscall_context+0x2ac>
f0017de4:	e1a01004 	mov	r1, r4
f0017de8:	e1a0200e 	mov	r2, lr
f0017dec:	e1a0300c 	mov	r3, ip
f0017df0:	ebfff83d 	bl	f0015eec <printk>
f0017df4:	e24bd020 	sub	sp, fp, #32
f0017df8:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
f0017dfc:	f001f794 	.word	0xf001f794

f0017e00 <sys_schedule>:
f0017e00:	e92d4800 	push	{fp, lr}
f0017e04:	e28db004 	add	fp, sp, #4
f0017e08:	ebffff47 	bl	f0017b2c <current_task>
f0017e0c:	e1a03000 	mov	r3, r0
f0017e10:	e5933054 	ldr	r3, [r3, #84]	; 0x54
f0017e14:	e59f0014 	ldr	r0, [pc, #20]	; f0017e30 <sys_schedule+0x30>
f0017e18:	e59f1014 	ldr	r1, [pc, #20]	; f0017e34 <sys_schedule+0x34>
f0017e1c:	e1a02003 	mov	r2, r3
f0017e20:	ebfff831 	bl	f0015eec <printk>
f0017e24:	e3a03000 	mov	r3, #0
f0017e28:	e1a00003 	mov	r0, r3
f0017e2c:	e8bd8800 	pop	{fp, pc}
f0017e30:	f001f7f8 	.word	0xf001f7f8
f0017e34:	f001f814 	.word	0xf001f814

f0017e38 <sys_getid>:
f0017e38:	e92d4800 	push	{fp, lr}
f0017e3c:	e28db004 	add	fp, sp, #4
f0017e40:	e24dd010 	sub	sp, sp, #16
f0017e44:	e50b0010 	str	r0, [fp, #-16]
f0017e48:	ebffff37 	bl	f0017b2c <current_task>
f0017e4c:	e50b0008 	str	r0, [fp, #-8]
f0017e50:	e51b3010 	ldr	r3, [fp, #-16]
f0017e54:	e1a00003 	mov	r0, r3
f0017e58:	e3a0100c 	mov	r1, #12
f0017e5c:	e3a02001 	mov	r2, #1
f0017e60:	e3a03001 	mov	r3, #1
f0017e64:	ebffcea1 	bl	f000b8f0 <check_access>
f0017e68:	e50b000c 	str	r0, [fp, #-12]
f0017e6c:	e51b300c 	ldr	r3, [fp, #-12]
f0017e70:	e3530000 	cmp	r3, #0
f0017e74:	aa000001 	bge	f0017e80 <sys_getid+0x48>
f0017e78:	e51b300c 	ldr	r3, [fp, #-12]
f0017e7c:	ea00000d 	b	f0017eb8 <sys_getid+0x80>
f0017e80:	e51b3008 	ldr	r3, [fp, #-8]
f0017e84:	e5932054 	ldr	r2, [r3, #84]	; 0x54
f0017e88:	e51b3010 	ldr	r3, [fp, #-16]
f0017e8c:	e5832000 	str	r2, [r3]
f0017e90:	e51b3008 	ldr	r3, [fp, #-8]
f0017e94:	e59330b4 	ldr	r3, [r3, #180]	; 0xb4
f0017e98:	e5932000 	ldr	r2, [r3]
f0017e9c:	e51b3010 	ldr	r3, [fp, #-16]
f0017ea0:	e5832004 	str	r2, [r3, #4]
f0017ea4:	e51b3008 	ldr	r3, [fp, #-8]
f0017ea8:	e5932058 	ldr	r2, [r3, #88]	; 0x58
f0017eac:	e51b3010 	ldr	r3, [fp, #-16]
f0017eb0:	e5832008 	str	r2, [r3, #8]
f0017eb4:	e3a03000 	mov	r3, #0
f0017eb8:	e1a00003 	mov	r0, r3
f0017ebc:	e24bd004 	sub	sp, fp, #4
f0017ec0:	e8bd8800 	pop	{fp, pc}

f0017ec4 <sys_container_control>:
f0017ec4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f0017ec8:	e28db000 	add	fp, sp, #0
f0017ecc:	e24dd014 	sub	sp, sp, #20
f0017ed0:	e50b0008 	str	r0, [fp, #-8]
f0017ed4:	e50b100c 	str	r1, [fp, #-12]
f0017ed8:	e50b2010 	str	r2, [fp, #-16]
f0017edc:	e3a03000 	mov	r3, #0
f0017ee0:	e1a00003 	mov	r0, r3
f0017ee4:	e24bd000 	sub	sp, fp, #0
f0017ee8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0017eec:	e12fff1e 	bx	lr

f0017ef0 <is_err>:
f0017ef0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f0017ef4:	e28db000 	add	fp, sp, #0
f0017ef8:	e24dd00c 	sub	sp, sp, #12
f0017efc:	e50b0008 	str	r0, [fp, #-8]
f0017f00:	e51b3008 	ldr	r3, [fp, #-8]
f0017f04:	e3530000 	cmp	r3, #0
f0017f08:	aa000004 	bge	f0017f20 <is_err+0x30>
f0017f0c:	e51b3008 	ldr	r3, [fp, #-8]
f0017f10:	e3730a01 	cmn	r3, #4096	; 0x1000
f0017f14:	da000001 	ble	f0017f20 <is_err+0x30>
f0017f18:	e3a03001 	mov	r3, #1
f0017f1c:	ea000000 	b	f0017f24 <is_err+0x34>
f0017f20:	e3a03000 	mov	r3, #0
f0017f24:	e1a00003 	mov	r0, r3
f0017f28:	e24bd000 	sub	sp, fp, #0
f0017f2c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0017f30:	e12fff1e 	bx	lr

f0017f34 <list_insert>:
f0017f34:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f0017f38:	e28db000 	add	fp, sp, #0
f0017f3c:	e24dd014 	sub	sp, sp, #20
f0017f40:	e50b0010 	str	r0, [fp, #-16]
f0017f44:	e50b1014 	str	r1, [fp, #-20]
f0017f48:	e51b3014 	ldr	r3, [fp, #-20]
f0017f4c:	e5933000 	ldr	r3, [r3]
f0017f50:	e50b3008 	str	r3, [fp, #-8]
f0017f54:	e51b3010 	ldr	r3, [fp, #-16]
f0017f58:	e51b2008 	ldr	r2, [fp, #-8]
f0017f5c:	e5832000 	str	r2, [r3]
f0017f60:	e51b3008 	ldr	r3, [fp, #-8]
f0017f64:	e51b2010 	ldr	r2, [fp, #-16]
f0017f68:	e5832004 	str	r2, [r3, #4]
f0017f6c:	e51b3014 	ldr	r3, [fp, #-20]
f0017f70:	e51b2010 	ldr	r2, [fp, #-16]
f0017f74:	e5832000 	str	r2, [r3]
f0017f78:	e51b3010 	ldr	r3, [fp, #-16]
f0017f7c:	e51b2014 	ldr	r2, [fp, #-20]
f0017f80:	e5832004 	str	r2, [r3, #4]
f0017f84:	e24bd000 	sub	sp, fp, #0
f0017f88:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0017f8c:	e12fff1e 	bx	lr

f0017f90 <list_insert_tail>:
f0017f90:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f0017f94:	e28db000 	add	fp, sp, #0
f0017f98:	e24dd014 	sub	sp, sp, #20
f0017f9c:	e50b0010 	str	r0, [fp, #-16]
f0017fa0:	e50b1014 	str	r1, [fp, #-20]
f0017fa4:	e51b3014 	ldr	r3, [fp, #-20]
f0017fa8:	e5933004 	ldr	r3, [r3, #4]
f0017fac:	e50b3008 	str	r3, [fp, #-8]
f0017fb0:	e51b3010 	ldr	r3, [fp, #-16]
f0017fb4:	e51b2014 	ldr	r2, [fp, #-20]
f0017fb8:	e5832000 	str	r2, [r3]
f0017fbc:	e51b3014 	ldr	r3, [fp, #-20]
f0017fc0:	e51b2010 	ldr	r2, [fp, #-16]
f0017fc4:	e5832004 	str	r2, [r3, #4]
f0017fc8:	e51b3010 	ldr	r3, [fp, #-16]
f0017fcc:	e51b2008 	ldr	r2, [fp, #-8]
f0017fd0:	e5832004 	str	r2, [r3, #4]
f0017fd4:	e51b3008 	ldr	r3, [fp, #-8]
f0017fd8:	e51b2010 	ldr	r2, [fp, #-16]
f0017fdc:	e5832000 	str	r2, [r3]
f0017fe0:	e24bd000 	sub	sp, fp, #0
f0017fe4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0017fe8:	e12fff1e 	bx	lr

f0017fec <list_remove_init>:
f0017fec:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f0017ff0:	e28db000 	add	fp, sp, #0
f0017ff4:	e24dd014 	sub	sp, sp, #20
f0017ff8:	e50b0010 	str	r0, [fp, #-16]
f0017ffc:	e51b3010 	ldr	r3, [fp, #-16]
f0018000:	e5933004 	ldr	r3, [r3, #4]
f0018004:	e50b3008 	str	r3, [fp, #-8]
f0018008:	e51b3010 	ldr	r3, [fp, #-16]
f001800c:	e5933000 	ldr	r3, [r3]
f0018010:	e50b300c 	str	r3, [fp, #-12]
f0018014:	e51b3008 	ldr	r3, [fp, #-8]
f0018018:	e51b200c 	ldr	r2, [fp, #-12]
f001801c:	e5832000 	str	r2, [r3]
f0018020:	e51b300c 	ldr	r3, [fp, #-12]
f0018024:	e51b2008 	ldr	r2, [fp, #-8]
f0018028:	e5832004 	str	r2, [r3, #4]
f001802c:	e51b3010 	ldr	r3, [fp, #-16]
f0018030:	e51b2010 	ldr	r2, [fp, #-16]
f0018034:	e5832000 	str	r2, [r3]
f0018038:	e51b3010 	ldr	r3, [fp, #-16]
f001803c:	e51b2010 	ldr	r2, [fp, #-16]
f0018040:	e5832004 	str	r2, [r3, #4]
f0018044:	e24bd000 	sub	sp, fp, #0
f0018048:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f001804c:	e12fff1e 	bx	lr

f0018050 <list_detach>:
f0018050:	e92d4800 	push	{fp, lr}
f0018054:	e28db004 	add	fp, sp, #4
f0018058:	e24dd010 	sub	sp, sp, #16
f001805c:	e50b0010 	str	r0, [fp, #-16]
f0018060:	e51b3010 	ldr	r3, [fp, #-16]
f0018064:	e5933000 	ldr	r3, [r3]
f0018068:	e50b3008 	str	r3, [fp, #-8]
f001806c:	e51b0010 	ldr	r0, [fp, #-16]
f0018070:	ebffffdd 	bl	f0017fec <list_remove_init>
f0018074:	e51b3008 	ldr	r3, [fp, #-8]
f0018078:	e1a00003 	mov	r0, r3
f001807c:	e24bd004 	sub	sp, fp, #4
f0018080:	e8bd8800 	pop	{fp, pc}

f0018084 <list_empty>:
f0018084:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f0018088:	e28db000 	add	fp, sp, #0
f001808c:	e24dd00c 	sub	sp, sp, #12
f0018090:	e50b0008 	str	r0, [fp, #-8]
f0018094:	e51b3008 	ldr	r3, [fp, #-8]
f0018098:	e5932004 	ldr	r2, [r3, #4]
f001809c:	e51b3008 	ldr	r3, [fp, #-8]
f00180a0:	e1520003 	cmp	r2, r3
f00180a4:	1a000006 	bne	f00180c4 <list_empty+0x40>
f00180a8:	e51b3008 	ldr	r3, [fp, #-8]
f00180ac:	e5932000 	ldr	r2, [r3]
f00180b0:	e51b3008 	ldr	r3, [fp, #-8]
f00180b4:	e1520003 	cmp	r2, r3
f00180b8:	1a000001 	bne	f00180c4 <list_empty+0x40>
f00180bc:	e3a03001 	mov	r3, #1
f00180c0:	ea000000 	b	f00180c8 <list_empty+0x44>
f00180c4:	e3a03000 	mov	r3, #0
f00180c8:	e1a00003 	mov	r0, r3
f00180cc:	e24bd000 	sub	sp, fp, #0
f00180d0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f00180d4:	e12fff1e 	bx	lr

f00180d8 <spin_lock>:
f00180d8:	e92d4800 	push	{fp, lr}
f00180dc:	e28db004 	add	fp, sp, #4
f00180e0:	e24dd008 	sub	sp, sp, #8
f00180e4:	e50b0008 	str	r0, [fp, #-8]
f00180e8:	ebffc227 	bl	f000898c <preempt_disable>
f00180ec:	e24bd004 	sub	sp, fp, #4
f00180f0:	e8bd8800 	pop	{fp, pc}

f00180f4 <spin_unlock>:
f00180f4:	e92d4800 	push	{fp, lr}
f00180f8:	e28db004 	add	fp, sp, #4
f00180fc:	e24dd008 	sub	sp, sp, #8
f0018100:	e50b0008 	str	r0, [fp, #-8]
f0018104:	ebffc20f 	bl	f0008948 <preempt_enable>
f0018108:	e24bd004 	sub	sp, fp, #4
f001810c:	e8bd8800 	pop	{fp, pc}

f0018110 <spin_lock_irq>:
f0018110:	e92d4800 	push	{fp, lr}
f0018114:	e28db004 	add	fp, sp, #4
f0018118:	e24dd008 	sub	sp, sp, #8
f001811c:	e50b0008 	str	r0, [fp, #-8]
f0018120:	e50b100c 	str	r1, [fp, #-12]
f0018124:	e51b000c 	ldr	r0, [fp, #-12]
f0018128:	ebfff2a3 	bl	f0014bbc <irq_local_disable_save>
f001812c:	e24bd004 	sub	sp, fp, #4
f0018130:	e8bd8800 	pop	{fp, pc}

f0018134 <spin_unlock_irq>:
f0018134:	e92d4800 	push	{fp, lr}
f0018138:	e28db004 	add	fp, sp, #4
f001813c:	e24dd008 	sub	sp, sp, #8
f0018140:	e50b0008 	str	r0, [fp, #-8]
f0018144:	e50b100c 	str	r1, [fp, #-12]
f0018148:	e51b000c 	ldr	r0, [fp, #-12]
f001814c:	ebfff2a9 	bl	f0014bf8 <irq_local_restore>
f0018150:	e24bd004 	sub	sp, fp, #4
f0018154:	e8bd8800 	pop	{fp, pc}

f0018158 <cap_list_detach>:
f0018158:	e92d4800 	push	{fp, lr}
f001815c:	e28db004 	add	fp, sp, #4
f0018160:	e24dd010 	sub	sp, sp, #16
f0018164:	e50b0010 	str	r0, [fp, #-16]
f0018168:	e51b3010 	ldr	r3, [fp, #-16]
f001816c:	e5933000 	ldr	r3, [r3]
f0018170:	e3530000 	cmp	r3, #0
f0018174:	1a000001 	bne	f0018180 <cap_list_detach+0x28>
f0018178:	e3a03000 	mov	r3, #0
f001817c:	ea00000b 	b	f00181b0 <cap_list_detach+0x58>
f0018180:	e51b3010 	ldr	r3, [fp, #-16]
f0018184:	e2833004 	add	r3, r3, #4
f0018188:	e1a00003 	mov	r0, r3
f001818c:	ebffffaf 	bl	f0018050 <list_detach>
f0018190:	e50b0008 	str	r0, [fp, #-8]
f0018194:	e51b3010 	ldr	r3, [fp, #-16]
f0018198:	e3a02000 	mov	r2, #0
f001819c:	e5832000 	str	r2, [r3]
f00181a0:	e51b3008 	ldr	r3, [fp, #-8]
f00181a4:	e50b300c 	str	r3, [fp, #-12]
f00181a8:	e51b300c 	ldr	r3, [fp, #-12]
f00181ac:	e1a00000 	nop			; (mov r0, r0)
f00181b0:	e1a00003 	mov	r0, r3
f00181b4:	e24bd004 	sub	sp, fp, #4
f00181b8:	e8bd8800 	pop	{fp, pc}

f00181bc <cap_list_attach>:
f00181bc:	e92d4800 	push	{fp, lr}
f00181c0:	e28db004 	add	fp, sp, #4
f00181c4:	e24dd010 	sub	sp, sp, #16
f00181c8:	e50b0010 	str	r0, [fp, #-16]
f00181cc:	e50b1014 	str	r1, [fp, #-20]
f00181d0:	e51b3014 	ldr	r3, [fp, #-20]
f00181d4:	e2832004 	add	r2, r3, #4
f00181d8:	e51b3010 	ldr	r3, [fp, #-16]
f00181dc:	e1a00002 	mov	r0, r2
f00181e0:	e1a01003 	mov	r1, r3
f00181e4:	ebffff52 	bl	f0017f34 <list_insert>
f00181e8:	e51b3014 	ldr	r3, [fp, #-20]
f00181ec:	e5933004 	ldr	r3, [r3, #4]
f00181f0:	e50b3008 	str	r3, [fp, #-8]
f00181f4:	e51b3008 	ldr	r3, [fp, #-8]
f00181f8:	e50b3010 	str	r3, [fp, #-16]
f00181fc:	ea000009 	b	f0018228 <cap_list_attach+0x6c>
f0018200:	e51b3014 	ldr	r3, [fp, #-20]
f0018204:	e5933000 	ldr	r3, [r3]
f0018208:	e2832001 	add	r2, r3, #1
f001820c:	e51b3014 	ldr	r3, [fp, #-20]
f0018210:	e5832000 	str	r2, [r3]
f0018214:	e51b3010 	ldr	r3, [fp, #-16]
f0018218:	e5933000 	ldr	r3, [r3]
f001821c:	e50b300c 	str	r3, [fp, #-12]
f0018220:	e51b300c 	ldr	r3, [fp, #-12]
f0018224:	e50b3010 	str	r3, [fp, #-16]
f0018228:	e51b2010 	ldr	r2, [fp, #-16]
f001822c:	e51b3014 	ldr	r3, [fp, #-20]
f0018230:	e2833004 	add	r3, r3, #4
f0018234:	e1520003 	cmp	r2, r3
f0018238:	1afffff0 	bne	f0018200 <cap_list_attach+0x44>
f001823c:	e24bd004 	sub	sp, fp, #4
f0018240:	e8bd8800 	pop	{fp, pc}

f0018244 <cap_list_move>:
f0018244:	e92d4800 	push	{fp, lr}
f0018248:	e28db004 	add	fp, sp, #4
f001824c:	e24dd010 	sub	sp, sp, #16
f0018250:	e50b0010 	str	r0, [fp, #-16]
f0018254:	e50b1014 	str	r1, [fp, #-20]
f0018258:	e51b3014 	ldr	r3, [fp, #-20]
f001825c:	e5933000 	ldr	r3, [r3]
f0018260:	e3530000 	cmp	r3, #0
f0018264:	1a000000 	bne	f001826c <cap_list_move+0x28>
f0018268:	ea000005 	b	f0018284 <cap_list_move+0x40>
f001826c:	e51b0014 	ldr	r0, [fp, #-20]
f0018270:	ebffffb8 	bl	f0018158 <cap_list_detach>
f0018274:	e50b0008 	str	r0, [fp, #-8]
f0018278:	e51b0008 	ldr	r0, [fp, #-8]
f001827c:	e51b1010 	ldr	r1, [fp, #-16]
f0018280:	ebffffcd 	bl	f00181bc <cap_list_attach>
f0018284:	e24bd004 	sub	sp, fp, #4
f0018288:	e8bd8800 	pop	{fp, pc}

f001828c <current_task>:
f001828c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f0018290:	e28db000 	add	fp, sp, #0
f0018294:	e1a0300d 	mov	r3, sp
f0018298:	e3c33eff 	bic	r3, r3, #4080	; 0xff0
f001829c:	e3c3300f 	bic	r3, r3, #15
f00182a0:	e1a00003 	mov	r0, r3
f00182a4:	e24bd000 	sub	sp, fp, #0
f00182a8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f00182ac:	e12fff1e 	bx	lr

f00182b0 <sys_thread_switch>:
f00182b0:	e92d4800 	push	{fp, lr}
f00182b4:	e28db004 	add	fp, sp, #4
f00182b8:	ebffc43d 	bl	f00093b4 <schedule>
f00182bc:	e3a03000 	mov	r3, #0
f00182c0:	e1a00003 	mov	r0, r3
f00182c4:	e8bd8800 	pop	{fp, pc}

f00182c8 <thread_signal>:
f00182c8:	e92d4800 	push	{fp, lr}
f00182cc:	e28db004 	add	fp, sp, #4
f00182d0:	e24dd028 	sub	sp, sp, #40	; 0x28
f00182d4:	e50b0020 	str	r0, [fp, #-32]
f00182d8:	e50b1024 	str	r1, [fp, #-36]	; 0x24
f00182dc:	e50b2028 	str	r2, [fp, #-40]	; 0x28
f00182e0:	e3a03000 	mov	r3, #0
f00182e4:	e50b3008 	str	r3, [fp, #-8]
f00182e8:	e51b3020 	ldr	r3, [fp, #-32]
f00182ec:	e5d33084 	ldrb	r3, [r3, #132]	; 0x84
f00182f0:	e1a02003 	mov	r2, r3
f00182f4:	e51b3028 	ldr	r3, [fp, #-40]	; 0x28
f00182f8:	e1520003 	cmp	r2, r3
f00182fc:	1a000001 	bne	f0018308 <thread_signal+0x40>
f0018300:	e3a03000 	mov	r3, #0
f0018304:	ea000050 	b	f001844c <thread_signal+0x184>
f0018308:	e51b3020 	ldr	r3, [fp, #-32]
f001830c:	e5932060 	ldr	r2, [r3, #96]	; 0x60
f0018310:	e51b3024 	ldr	r3, [fp, #-36]	; 0x24
f0018314:	e1822003 	orr	r2, r2, r3
f0018318:	e51b3020 	ldr	r3, [fp, #-32]
f001831c:	e5832060 	str	r2, [r3, #96]	; 0x60
f0018320:	e51b0020 	ldr	r0, [fp, #-32]
f0018324:	e3a01003 	mov	r1, #3
f0018328:	ebfffa06 	bl	f0016b48 <wake_up_task>
f001832c:	e3a03000 	mov	r3, #0
f0018330:	e50b3008 	str	r3, [fp, #-8]
f0018334:	e51b3020 	ldr	r3, [fp, #-32]
f0018338:	e28320fc 	add	r2, r3, #252	; 0xfc
f001833c:	e24b300c 	sub	r3, fp, #12
f0018340:	e1a00002 	mov	r0, r2
f0018344:	e1a01003 	mov	r1, r3
f0018348:	ebffff70 	bl	f0018110 <spin_lock_irq>
f001834c:	e51b3020 	ldr	r3, [fp, #-32]
f0018350:	e5d33084 	ldrb	r3, [r3, #132]	; 0x84
f0018354:	e1a02003 	mov	r2, r3
f0018358:	e51b3028 	ldr	r3, [fp, #-40]	; 0x28
f001835c:	e1520003 	cmp	r2, r3
f0018360:	1a000006 	bne	f0018380 <thread_signal+0xb8>
f0018364:	e51b3020 	ldr	r3, [fp, #-32]
f0018368:	e28320fc 	add	r2, r3, #252	; 0xfc
f001836c:	e51b300c 	ldr	r3, [fp, #-12]
f0018370:	e1a00002 	mov	r0, r2
f0018374:	e1a01003 	mov	r1, r3
f0018378:	ebffff6d 	bl	f0018134 <spin_unlock_irq>
f001837c:	ea000031 	b	f0018448 <thread_signal+0x180>
f0018380:	e24b3018 	sub	r3, fp, #24
f0018384:	e50b3018 	str	r3, [fp, #-24]
f0018388:	e24b3018 	sub	r3, fp, #24
f001838c:	e50b3014 	str	r3, [fp, #-20]
f0018390:	ebffffbd 	bl	f001828c <current_task>
f0018394:	e1a03000 	mov	r3, r0
f0018398:	e50b3010 	str	r3, [fp, #-16]
f001839c:	ebffffba 	bl	f001828c <current_task>
f00183a0:	e1a01000 	mov	r1, r0
f00183a4:	e51b3020 	ldr	r3, [fp, #-32]
f00183a8:	e28320f8 	add	r2, r3, #248	; 0xf8
f00183ac:	e24b3018 	sub	r3, fp, #24
f00183b0:	e1a00001 	mov	r0, r1
f00183b4:	e1a01002 	mov	r1, r2
f00183b8:	e1a02003 	mov	r2, r3
f00183bc:	ebfff879 	bl	f00165a8 <task_set_wqh>
f00183c0:	e51b3020 	ldr	r3, [fp, #-32]
f00183c4:	e59330f8 	ldr	r3, [r3, #248]	; 0xf8
f00183c8:	e2832001 	add	r2, r3, #1
f00183cc:	e51b3020 	ldr	r3, [fp, #-32]
f00183d0:	e58320f8 	str	r2, [r3, #248]	; 0xf8
f00183d4:	e51b3020 	ldr	r3, [fp, #-32]
f00183d8:	e2833c01 	add	r3, r3, #256	; 0x100
f00183dc:	e24b2018 	sub	r2, fp, #24
f00183e0:	e1a00002 	mov	r0, r2
f00183e4:	e1a01003 	mov	r1, r3
f00183e8:	ebfffee8 	bl	f0017f90 <list_insert_tail>
f00183ec:	ebffc2b7 	bl	f0008ed0 <sched_prepare_sleep>
f00183f0:	e51b3020 	ldr	r3, [fp, #-32]
f00183f4:	e28320fc 	add	r2, r3, #252	; 0xfc
f00183f8:	e51b300c 	ldr	r3, [fp, #-12]
f00183fc:	e1a00002 	mov	r0, r2
f0018400:	e1a01003 	mov	r1, r3
f0018404:	ebffff4a 	bl	f0018134 <spin_unlock_irq>
f0018408:	ebffc3e9 	bl	f00093b4 <schedule>
f001840c:	ebffff9e 	bl	f001828c <current_task>
f0018410:	e1a03000 	mov	r3, r0
f0018414:	e5933060 	ldr	r3, [r3, #96]	; 0x60
f0018418:	e2033001 	and	r3, r3, #1
f001841c:	e3530000 	cmp	r3, #0
f0018420:	0a000007 	beq	f0018444 <thread_signal+0x17c>
f0018424:	ebffff98 	bl	f001828c <current_task>
f0018428:	e1a03000 	mov	r3, r0
f001842c:	e5932060 	ldr	r2, [r3, #96]	; 0x60
f0018430:	e3c22001 	bic	r2, r2, #1
f0018434:	e5832060 	str	r2, [r3, #96]	; 0x60
f0018438:	e3e03003 	mvn	r3, #3
f001843c:	e50b3008 	str	r3, [fp, #-8]
f0018440:	ea000000 	b	f0018448 <thread_signal+0x180>
f0018444:	eaffffba 	b	f0018334 <thread_signal+0x6c>
f0018448:	e51b3008 	ldr	r3, [fp, #-8]
f001844c:	e1a00003 	mov	r0, r3
f0018450:	e24bd004 	sub	sp, fp, #4
f0018454:	e8bd8800 	pop	{fp, pc}

f0018458 <thread_suspend>:
f0018458:	e92d4800 	push	{fp, lr}
f001845c:	e28db004 	add	fp, sp, #4
f0018460:	e24dd008 	sub	sp, sp, #8
f0018464:	e50b0008 	str	r0, [fp, #-8]
f0018468:	e51b0008 	ldr	r0, [fp, #-8]
f001846c:	e3a01002 	mov	r1, #2
f0018470:	e3a02000 	mov	r2, #0
f0018474:	ebffff93 	bl	f00182c8 <thread_signal>
f0018478:	e1a03000 	mov	r3, r0
f001847c:	e1a00003 	mov	r0, r3
f0018480:	e24bd004 	sub	sp, fp, #4
f0018484:	e8bd8800 	pop	{fp, pc}

f0018488 <thread_exit>:
f0018488:	e92d4800 	push	{fp, lr}
f001848c:	e28db004 	add	fp, sp, #4
f0018490:	e24dd008 	sub	sp, sp, #8
f0018494:	e50b0008 	str	r0, [fp, #-8]
f0018498:	e51b0008 	ldr	r0, [fp, #-8]
f001849c:	e3a01002 	mov	r1, #2
f00184a0:	e3a02000 	mov	r2, #0
f00184a4:	ebffff87 	bl	f00182c8 <thread_signal>
f00184a8:	e1a03000 	mov	r3, r0
f00184ac:	e1a00003 	mov	r0, r3
f00184b0:	e24bd004 	sub	sp, fp, #4
f00184b4:	e8bd8800 	pop	{fp, pc}

f00184b8 <task_is_child>:
f00184b8:	e92d4810 	push	{r4, fp, lr}
f00184bc:	e28db008 	add	fp, sp, #8
f00184c0:	e24dd00c 	sub	sp, sp, #12
f00184c4:	e50b0010 	str	r0, [fp, #-16]
f00184c8:	ebffff6f 	bl	f001828c <current_task>
f00184cc:	e1a02000 	mov	r2, r0
f00184d0:	e51b3010 	ldr	r3, [fp, #-16]
f00184d4:	e1520003 	cmp	r2, r3
f00184d8:	0a000007 	beq	f00184fc <task_is_child+0x44>
f00184dc:	e51b3010 	ldr	r3, [fp, #-16]
f00184e0:	e59340bc 	ldr	r4, [r3, #188]	; 0xbc
f00184e4:	ebffff68 	bl	f001828c <current_task>
f00184e8:	e1a03000 	mov	r3, r0
f00184ec:	e1540003 	cmp	r4, r3
f00184f0:	1a000001 	bne	f00184fc <task_is_child+0x44>
f00184f4:	e3a03001 	mov	r3, #1
f00184f8:	ea000000 	b	f0018500 <task_is_child+0x48>
f00184fc:	e3a03000 	mov	r3, #0
f0018500:	e1a00003 	mov	r0, r3
f0018504:	e24bd008 	sub	sp, fp, #8
f0018508:	e8bd8810 	pop	{r4, fp, pc}

f001850c <thread_destroy_child>:
f001850c:	e92d4800 	push	{fp, lr}
f0018510:	e28db004 	add	fp, sp, #4
f0018514:	e24dd008 	sub	sp, sp, #8
f0018518:	e50b0008 	str	r0, [fp, #-8]
f001851c:	e51b0008 	ldr	r0, [fp, #-8]
f0018520:	ebffffd8 	bl	f0018488 <thread_exit>
f0018524:	ebffff58 	bl	f001828c <current_task>
f0018528:	e1a03000 	mov	r3, r0
f001852c:	e5932060 	ldr	r2, [r3, #96]	; 0x60
f0018530:	e3822008 	orr	r2, r2, #8
f0018534:	e5832060 	str	r2, [r3, #96]	; 0x60
f0018538:	e51b0008 	ldr	r0, [fp, #-8]
f001853c:	ebffca2f 	bl	f000ae00 <tcb_remove>
f0018540:	e51b3008 	ldr	r3, [fp, #-8]
f0018544:	e28330d4 	add	r3, r3, #212	; 0xd4
f0018548:	e1a00003 	mov	r0, r3
f001854c:	e3a01001 	mov	r1, #1
f0018550:	ebfff8be 	bl	f0016850 <wake_up_all>
f0018554:	e51b3008 	ldr	r3, [fp, #-8]
f0018558:	e28330c4 	add	r3, r3, #196	; 0xc4
f001855c:	e1a00003 	mov	r0, r3
f0018560:	e3a01001 	mov	r1, #1
f0018564:	ebfff8b9 	bl	f0016850 <wake_up_all>
f0018568:	e51b3008 	ldr	r3, [fp, #-8]
f001856c:	e59330f8 	ldr	r3, [r3, #248]	; 0xf8
f0018570:	e3530000 	cmp	r3, #0
f0018574:	da000005 	ble	f0018590 <thread_destroy_child+0x84>
f0018578:	e59f0054 	ldr	r0, [pc, #84]	; f00185d4 <thread_destroy_child+0xc8>
f001857c:	e59f1054 	ldr	r1, [pc, #84]	; f00185d8 <thread_destroy_child+0xcc>
f0018580:	e59f2054 	ldr	r2, [pc, #84]	; f00185dc <thread_destroy_child+0xd0>
f0018584:	e3a03053 	mov	r3, #83	; 0x53
f0018588:	ebfff657 	bl	f0015eec <printk>
f001858c:	eafffffe 	b	f001858c <thread_destroy_child+0x80>
f0018590:	e51b3008 	ldr	r3, [fp, #-8]
f0018594:	e5d33084 	ldrb	r3, [r3, #132]	; 0x84
f0018598:	e3530000 	cmp	r3, #0
f001859c:	0a000005 	beq	f00185b8 <thread_destroy_child+0xac>
f00185a0:	e59f002c 	ldr	r0, [pc, #44]	; f00185d4 <thread_destroy_child+0xc8>
f00185a4:	e59f102c 	ldr	r1, [pc, #44]	; f00185d8 <thread_destroy_child+0xcc>
f00185a8:	e59f202c 	ldr	r2, [pc, #44]	; f00185dc <thread_destroy_child+0xd0>
f00185ac:	e3a03054 	mov	r3, #84	; 0x54
f00185b0:	ebfff64d 	bl	f0015eec <printk>
f00185b4:	eafffffe 	b	f00185b4 <thread_destroy_child+0xa8>
f00185b8:	e51b0008 	ldr	r0, [fp, #-8]
f00185bc:	e59f101c 	ldr	r1, [pc, #28]	; f00185e0 <thread_destroy_child+0xd4>
f00185c0:	ebffc957 	bl	f000ab24 <ktcb_list_add>
f00185c4:	e3a03000 	mov	r3, #0
f00185c8:	e1a00003 	mov	r0, r3
f00185cc:	e24bd004 	sub	sp, fp, #4
f00185d0:	e8bd8800 	pop	{fp, pc}
f00185d4:	f001f824 	.word	0xf001f824
f00185d8:	f001f84c 	.word	0xf001f84c
f00185dc:	f001f860 	.word	0xf001f860
f00185e0:	f0033130 	.word	0xf0033130

f00185e4 <thread_destroy_children>:
f00185e4:	e92d4810 	push	{r4, fp, lr}
f00185e8:	e28db008 	add	fp, sp, #8
f00185ec:	e24dd02c 	sub	sp, sp, #44	; 0x2c
f00185f0:	ebffff25 	bl	f001828c <current_task>
f00185f4:	e1a03000 	mov	r3, r0
f00185f8:	e59330b8 	ldr	r3, [r3, #184]	; 0xb8
f00185fc:	e2833068 	add	r3, r3, #104	; 0x68
f0018600:	e1a00003 	mov	r0, r3
f0018604:	ebfffeb3 	bl	f00180d8 <spin_lock>
f0018608:	ebffff1f 	bl	f001828c <current_task>
f001860c:	e1a03000 	mov	r3, r0
f0018610:	e59330b8 	ldr	r3, [r3, #184]	; 0xb8
f0018614:	e5933060 	ldr	r3, [r3, #96]	; 0x60
f0018618:	e50b301c 	str	r3, [fp, #-28]
f001861c:	e51b301c 	ldr	r3, [fp, #-28]
f0018620:	e2433088 	sub	r3, r3, #136	; 0x88
f0018624:	e50b3010 	str	r3, [fp, #-16]
f0018628:	e51b3010 	ldr	r3, [fp, #-16]
f001862c:	e5933088 	ldr	r3, [r3, #136]	; 0x88
f0018630:	e50b3020 	str	r3, [fp, #-32]
f0018634:	e51b3020 	ldr	r3, [fp, #-32]
f0018638:	e2433088 	sub	r3, r3, #136	; 0x88
f001863c:	e50b3014 	str	r3, [fp, #-20]
f0018640:	ea00001a 	b	f00186b0 <thread_destroy_children+0xcc>
f0018644:	e51b0010 	ldr	r0, [fp, #-16]
f0018648:	ebffff9a 	bl	f00184b8 <task_is_child>
f001864c:	e1a03000 	mov	r3, r0
f0018650:	e3530000 	cmp	r3, #0
f0018654:	0a00000d 	beq	f0018690 <thread_destroy_children+0xac>
f0018658:	ebffff0b 	bl	f001828c <current_task>
f001865c:	e1a03000 	mov	r3, r0
f0018660:	e59330b8 	ldr	r3, [r3, #184]	; 0xb8
f0018664:	e2833068 	add	r3, r3, #104	; 0x68
f0018668:	e1a00003 	mov	r0, r3
f001866c:	ebfffea0 	bl	f00180f4 <spin_unlock>
f0018670:	e51b0010 	ldr	r0, [fp, #-16]
f0018674:	ebffffa4 	bl	f001850c <thread_destroy_child>
f0018678:	ebffff03 	bl	f001828c <current_task>
f001867c:	e1a03000 	mov	r3, r0
f0018680:	e59330b8 	ldr	r3, [r3, #184]	; 0xb8
f0018684:	e2833068 	add	r3, r3, #104	; 0x68
f0018688:	e1a00003 	mov	r0, r3
f001868c:	ebfffe91 	bl	f00180d8 <spin_lock>
f0018690:	e51b3014 	ldr	r3, [fp, #-20]
f0018694:	e50b3010 	str	r3, [fp, #-16]
f0018698:	e51b3014 	ldr	r3, [fp, #-20]
f001869c:	e5933088 	ldr	r3, [r3, #136]	; 0x88
f00186a0:	e50b3024 	str	r3, [fp, #-36]	; 0x24
f00186a4:	e51b3024 	ldr	r3, [fp, #-36]	; 0x24
f00186a8:	e2433088 	sub	r3, r3, #136	; 0x88
f00186ac:	e50b3014 	str	r3, [fp, #-20]
f00186b0:	e51b3010 	ldr	r3, [fp, #-16]
f00186b4:	e2834088 	add	r4, r3, #136	; 0x88
f00186b8:	ebfffef3 	bl	f001828c <current_task>
f00186bc:	e1a03000 	mov	r3, r0
f00186c0:	e59330b8 	ldr	r3, [r3, #184]	; 0xb8
f00186c4:	e2833060 	add	r3, r3, #96	; 0x60
f00186c8:	e1540003 	cmp	r4, r3
f00186cc:	1affffdc 	bne	f0018644 <thread_destroy_children+0x60>
f00186d0:	ebfffeed 	bl	f001828c <current_task>
f00186d4:	e1a03000 	mov	r3, r0
f00186d8:	e59330b8 	ldr	r3, [r3, #184]	; 0xb8
f00186dc:	e2833068 	add	r3, r3, #104	; 0x68
f00186e0:	e1a00003 	mov	r0, r3
f00186e4:	ebfffe82 	bl	f00180f4 <spin_unlock>
f00186e8:	e3a03000 	mov	r3, #0
f00186ec:	e50b3018 	str	r3, [fp, #-24]
f00186f0:	ebfffee5 	bl	f001828c <current_task>
f00186f4:	e1a03000 	mov	r3, r0
f00186f8:	e28320fc 	add	r2, r3, #252	; 0xfc
f00186fc:	e24b3028 	sub	r3, fp, #40	; 0x28
f0018700:	e1a00002 	mov	r0, r2
f0018704:	e1a01003 	mov	r1, r3
f0018708:	ebfffe80 	bl	f0018110 <spin_lock_irq>
f001870c:	ebfffede 	bl	f001828c <current_task>
f0018710:	e1a03000 	mov	r3, r0
f0018714:	e59330c0 	ldr	r3, [r3, #192]	; 0xc0
f0018718:	e3530000 	cmp	r3, #0
f001871c:	1a000007 	bne	f0018740 <thread_destroy_children+0x15c>
f0018720:	ebfffed9 	bl	f001828c <current_task>
f0018724:	e1a03000 	mov	r3, r0
f0018728:	e28320fc 	add	r2, r3, #252	; 0xfc
f001872c:	e51b3028 	ldr	r3, [fp, #-40]	; 0x28
f0018730:	e1a00002 	mov	r0, r2
f0018734:	e1a01003 	mov	r1, r3
f0018738:	ebfffe7d 	bl	f0018134 <spin_unlock_irq>
f001873c:	ea000034 	b	f0018814 <thread_destroy_children+0x230>
f0018740:	e24b3034 	sub	r3, fp, #52	; 0x34
f0018744:	e50b3034 	str	r3, [fp, #-52]	; 0x34
f0018748:	e24b3034 	sub	r3, fp, #52	; 0x34
f001874c:	e50b3030 	str	r3, [fp, #-48]	; 0x30
f0018750:	ebfffecd 	bl	f001828c <current_task>
f0018754:	e1a03000 	mov	r3, r0
f0018758:	e50b302c 	str	r3, [fp, #-44]	; 0x2c
f001875c:	ebfffeca 	bl	f001828c <current_task>
f0018760:	e1a04000 	mov	r4, r0
f0018764:	ebfffec8 	bl	f001828c <current_task>
f0018768:	e1a03000 	mov	r3, r0
f001876c:	e28320f8 	add	r2, r3, #248	; 0xf8
f0018770:	e24b3034 	sub	r3, fp, #52	; 0x34
f0018774:	e1a00004 	mov	r0, r4
f0018778:	e1a01002 	mov	r1, r2
f001877c:	e1a02003 	mov	r2, r3
f0018780:	ebfff788 	bl	f00165a8 <task_set_wqh>
f0018784:	ebfffec0 	bl	f001828c <current_task>
f0018788:	e1a03000 	mov	r3, r0
f001878c:	e59320f8 	ldr	r2, [r3, #248]	; 0xf8
f0018790:	e2822001 	add	r2, r2, #1
f0018794:	e58320f8 	str	r2, [r3, #248]	; 0xf8
f0018798:	ebfffebb 	bl	f001828c <current_task>
f001879c:	e1a03000 	mov	r3, r0
f00187a0:	e2833c01 	add	r3, r3, #256	; 0x100
f00187a4:	e24b2034 	sub	r2, fp, #52	; 0x34
f00187a8:	e1a00002 	mov	r0, r2
f00187ac:	e1a01003 	mov	r1, r3
f00187b0:	ebfffdf6 	bl	f0017f90 <list_insert_tail>
f00187b4:	ebffc1c5 	bl	f0008ed0 <sched_prepare_sleep>
f00187b8:	ebfffeb3 	bl	f001828c <current_task>
f00187bc:	e1a03000 	mov	r3, r0
f00187c0:	e28320fc 	add	r2, r3, #252	; 0xfc
f00187c4:	e51b3028 	ldr	r3, [fp, #-40]	; 0x28
f00187c8:	e1a00002 	mov	r0, r2
f00187cc:	e1a01003 	mov	r1, r3
f00187d0:	ebfffe57 	bl	f0018134 <spin_unlock_irq>
f00187d4:	ebffc2f6 	bl	f00093b4 <schedule>
f00187d8:	ebfffeab 	bl	f001828c <current_task>
f00187dc:	e1a03000 	mov	r3, r0
f00187e0:	e5933060 	ldr	r3, [r3, #96]	; 0x60
f00187e4:	e2033001 	and	r3, r3, #1
f00187e8:	e3530000 	cmp	r3, #0
f00187ec:	0a000007 	beq	f0018810 <thread_destroy_children+0x22c>
f00187f0:	ebfffea5 	bl	f001828c <current_task>
f00187f4:	e1a03000 	mov	r3, r0
f00187f8:	e5932060 	ldr	r2, [r3, #96]	; 0x60
f00187fc:	e3c22001 	bic	r2, r2, #1
f0018800:	e5832060 	str	r2, [r3, #96]	; 0x60
f0018804:	e3e03003 	mvn	r3, #3
f0018808:	e50b3018 	str	r3, [fp, #-24]
f001880c:	ea000000 	b	f0018814 <thread_destroy_children+0x230>
f0018810:	eaffffb6 	b	f00186f0 <thread_destroy_children+0x10c>
f0018814:	e51b3018 	ldr	r3, [fp, #-24]
f0018818:	e1a00003 	mov	r0, r3
f001881c:	e24bd008 	sub	sp, fp, #8
f0018820:	e8bd8810 	pop	{r4, fp, pc}

f0018824 <thread_destroy_self>:
f0018824:	e92d4810 	push	{r4, fp, lr}
f0018828:	e28db008 	add	fp, sp, #8
f001882c:	e24dd00c 	sub	sp, sp, #12
f0018830:	e50b0010 	str	r0, [fp, #-16]
f0018834:	ebfffe94 	bl	f001828c <current_task>
f0018838:	e1a03000 	mov	r3, r0
f001883c:	e59340bc 	ldr	r4, [r3, #188]	; 0xbc
f0018840:	ebfffe91 	bl	f001828c <current_task>
f0018844:	e1a03000 	mov	r3, r0
f0018848:	e1540003 	cmp	r4, r3
f001884c:	1a00002a 	bne	f00188fc <thread_destroy_self+0xd8>
f0018850:	ebffff63 	bl	f00185e4 <thread_destroy_children>
f0018854:	e1a03000 	mov	r3, r0
f0018858:	e3530000 	cmp	r3, #0
f001885c:	aa000005 	bge	f0018878 <thread_destroy_self+0x54>
f0018860:	e59f00c4 	ldr	r0, [pc, #196]	; f001892c <thread_destroy_self+0x108>
f0018864:	e59f10c4 	ldr	r1, [pc, #196]	; f0018930 <thread_destroy_self+0x10c>
f0018868:	e59f20c4 	ldr	r2, [pc, #196]	; f0018934 <thread_destroy_self+0x110>
f001886c:	e3a0307b 	mov	r3, #123	; 0x7b
f0018870:	ebfff59d 	bl	f0015eec <printk>
f0018874:	eafffffe 	b	f0018874 <thread_destroy_self+0x50>
f0018878:	ebfffe83 	bl	f001828c <current_task>
f001887c:	e1a03000 	mov	r3, r0
f0018880:	e1a00003 	mov	r0, r3
f0018884:	ebffc95d 	bl	f000ae00 <tcb_remove>
f0018888:	ebfffe7f 	bl	f001828c <current_task>
f001888c:	e1a03000 	mov	r3, r0
f0018890:	e28330d4 	add	r3, r3, #212	; 0xd4
f0018894:	e1a00003 	mov	r0, r3
f0018898:	e3a01001 	mov	r1, #1
f001889c:	ebfff7eb 	bl	f0016850 <wake_up_all>
f00188a0:	ebfffe79 	bl	f001828c <current_task>
f00188a4:	e1a03000 	mov	r3, r0
f00188a8:	e28330c4 	add	r3, r3, #196	; 0xc4
f00188ac:	e1a00003 	mov	r0, r3
f00188b0:	e3a01001 	mov	r1, #1
f00188b4:	ebfff7e5 	bl	f0016850 <wake_up_all>
f00188b8:	ebfffe73 	bl	f001828c <current_task>
f00188bc:	e1a03000 	mov	r3, r0
f00188c0:	e59330b8 	ldr	r3, [r3, #184]	; 0xb8
f00188c4:	e59330ac 	ldr	r3, [r3, #172]	; 0xac
f00188c8:	e2834018 	add	r4, r3, #24
f00188cc:	ebfffe6e 	bl	f001828c <current_task>
f00188d0:	e1a03000 	mov	r3, r0
f00188d4:	e59330b4 	ldr	r3, [r3, #180]	; 0xb4
f00188d8:	e2833014 	add	r3, r3, #20
f00188dc:	e1a00004 	mov	r0, r4
f00188e0:	e1a01003 	mov	r1, r3
f00188e4:	ebfffe56 	bl	f0018244 <cap_list_move>
f00188e8:	ebfffe67 	bl	f001828c <current_task>
f00188ec:	e1a03000 	mov	r3, r0
f00188f0:	e1a00003 	mov	r0, r3
f00188f4:	e59f103c 	ldr	r1, [pc, #60]	; f0018938 <thread_destroy_self+0x114>
f00188f8:	ebffc889 	bl	f000ab24 <ktcb_list_add>
f00188fc:	ebfffe62 	bl	f001828c <current_task>
f0018900:	e1a03000 	mov	r3, r0
f0018904:	e51b2010 	ldr	r2, [fp, #-16]
f0018908:	e58320b0 	str	r2, [r3, #176]	; 0xb0
f001890c:	ebfffe5e 	bl	f001828c <current_task>
f0018910:	e1a03000 	mov	r3, r0
f0018914:	e5932060 	ldr	r2, [r3, #96]	; 0x60
f0018918:	e3822008 	orr	r2, r2, #8
f001891c:	e5832060 	str	r2, [r3, #96]	; 0x60
f0018920:	ebffc177 	bl	f0008f04 <sched_suspend_sync>
f0018924:	e24bd008 	sub	sp, fp, #8
f0018928:	e8bd8810 	pop	{r4, fp, pc}
f001892c:	f001f824 	.word	0xf001f824
f0018930:	f001f84c 	.word	0xf001f84c
f0018934:	f001f878 	.word	0xf001f878
f0018938:	f0033130 	.word	0xf0033130

f001893c <thread_wait>:
f001893c:	e92d4800 	push	{fp, lr}
f0018940:	e28db004 	add	fp, sp, #4
f0018944:	e24dd020 	sub	sp, sp, #32
f0018948:	e50b0020 	str	r0, [fp, #-32]
f001894c:	e3a03000 	mov	r3, #0
f0018950:	e50b3008 	str	r3, [fp, #-8]
f0018954:	e51b3020 	ldr	r3, [fp, #-32]
f0018958:	e28320fc 	add	r2, r3, #252	; 0xfc
f001895c:	e24b3010 	sub	r3, fp, #16
f0018960:	e1a00002 	mov	r0, r2
f0018964:	e1a01003 	mov	r1, r3
f0018968:	ebfffde8 	bl	f0018110 <spin_lock_irq>
f001896c:	e51b3020 	ldr	r3, [fp, #-32]
f0018970:	e5d33084 	ldrb	r3, [r3, #132]	; 0x84
f0018974:	e3530000 	cmp	r3, #0
f0018978:	1a000006 	bne	f0018998 <thread_wait+0x5c>
f001897c:	e51b3020 	ldr	r3, [fp, #-32]
f0018980:	e28320fc 	add	r2, r3, #252	; 0xfc
f0018984:	e51b3010 	ldr	r3, [fp, #-16]
f0018988:	e1a00002 	mov	r0, r2
f001898c:	e1a01003 	mov	r1, r3
f0018990:	ebfffde7 	bl	f0018134 <spin_unlock_irq>
f0018994:	ea000031 	b	f0018a60 <thread_wait+0x124>
f0018998:	e24b301c 	sub	r3, fp, #28
f001899c:	e50b301c 	str	r3, [fp, #-28]
f00189a0:	e24b301c 	sub	r3, fp, #28
f00189a4:	e50b3018 	str	r3, [fp, #-24]
f00189a8:	ebfffe37 	bl	f001828c <current_task>
f00189ac:	e1a03000 	mov	r3, r0
f00189b0:	e50b3014 	str	r3, [fp, #-20]
f00189b4:	ebfffe34 	bl	f001828c <current_task>
f00189b8:	e1a01000 	mov	r1, r0
f00189bc:	e51b3020 	ldr	r3, [fp, #-32]
f00189c0:	e28320f8 	add	r2, r3, #248	; 0xf8
f00189c4:	e24b301c 	sub	r3, fp, #28
f00189c8:	e1a00001 	mov	r0, r1
f00189cc:	e1a01002 	mov	r1, r2
f00189d0:	e1a02003 	mov	r2, r3
f00189d4:	ebfff6f3 	bl	f00165a8 <task_set_wqh>
f00189d8:	e51b3020 	ldr	r3, [fp, #-32]
f00189dc:	e59330f8 	ldr	r3, [r3, #248]	; 0xf8
f00189e0:	e2832001 	add	r2, r3, #1
f00189e4:	e51b3020 	ldr	r3, [fp, #-32]
f00189e8:	e58320f8 	str	r2, [r3, #248]	; 0xf8
f00189ec:	e51b3020 	ldr	r3, [fp, #-32]
f00189f0:	e2833c01 	add	r3, r3, #256	; 0x100
f00189f4:	e24b201c 	sub	r2, fp, #28
f00189f8:	e1a00002 	mov	r0, r2
f00189fc:	e1a01003 	mov	r1, r3
f0018a00:	ebfffd62 	bl	f0017f90 <list_insert_tail>
f0018a04:	ebffc131 	bl	f0008ed0 <sched_prepare_sleep>
f0018a08:	e51b3020 	ldr	r3, [fp, #-32]
f0018a0c:	e28320fc 	add	r2, r3, #252	; 0xfc
f0018a10:	e51b3010 	ldr	r3, [fp, #-16]
f0018a14:	e1a00002 	mov	r0, r2
f0018a18:	e1a01003 	mov	r1, r3
f0018a1c:	ebfffdc4 	bl	f0018134 <spin_unlock_irq>
f0018a20:	ebffc263 	bl	f00093b4 <schedule>
f0018a24:	ebfffe18 	bl	f001828c <current_task>
f0018a28:	e1a03000 	mov	r3, r0
f0018a2c:	e5933060 	ldr	r3, [r3, #96]	; 0x60
f0018a30:	e2033001 	and	r3, r3, #1
f0018a34:	e3530000 	cmp	r3, #0
f0018a38:	0a000007 	beq	f0018a5c <thread_wait+0x120>
f0018a3c:	ebfffe12 	bl	f001828c <current_task>
f0018a40:	e1a03000 	mov	r3, r0
f0018a44:	e5932060 	ldr	r2, [r3, #96]	; 0x60
f0018a48:	e3c22001 	bic	r2, r2, #1
f0018a4c:	e5832060 	str	r2, [r3, #96]	; 0x60
f0018a50:	e3e03003 	mvn	r3, #3
f0018a54:	e50b3008 	str	r3, [fp, #-8]
f0018a58:	ea000000 	b	f0018a60 <thread_wait+0x124>
f0018a5c:	eaffffbc 	b	f0018954 <thread_wait+0x18>
f0018a60:	e51b3008 	ldr	r3, [fp, #-8]
f0018a64:	e3530000 	cmp	r3, #0
f0018a68:	aa000001 	bge	f0018a74 <thread_wait+0x138>
f0018a6c:	e51b3008 	ldr	r3, [fp, #-8]
f0018a70:	ea000026 	b	f0018b10 <thread_wait+0x1d4>
f0018a74:	e51b0020 	ldr	r0, [fp, #-32]
f0018a78:	ebffc8e0 	bl	f000ae00 <tcb_remove>
f0018a7c:	e51b3020 	ldr	r3, [fp, #-32]
f0018a80:	e28330d4 	add	r3, r3, #212	; 0xd4
f0018a84:	e1a00003 	mov	r0, r3
f0018a88:	e3a01001 	mov	r1, #1
f0018a8c:	ebfff76f 	bl	f0016850 <wake_up_all>
f0018a90:	e51b3020 	ldr	r3, [fp, #-32]
f0018a94:	e28330c4 	add	r3, r3, #196	; 0xc4
f0018a98:	e1a00003 	mov	r0, r3
f0018a9c:	e3a01001 	mov	r1, #1
f0018aa0:	ebfff76a 	bl	f0016850 <wake_up_all>
f0018aa4:	e51b3020 	ldr	r3, [fp, #-32]
f0018aa8:	e59330f8 	ldr	r3, [r3, #248]	; 0xf8
f0018aac:	e3530000 	cmp	r3, #0
f0018ab0:	da000005 	ble	f0018acc <thread_wait+0x190>
f0018ab4:	e59f0060 	ldr	r0, [pc, #96]	; f0018b1c <thread_wait+0x1e0>
f0018ab8:	e59f1060 	ldr	r1, [pc, #96]	; f0018b20 <thread_wait+0x1e4>
f0018abc:	e59f2060 	ldr	r2, [pc, #96]	; f0018b24 <thread_wait+0x1e8>
f0018ac0:	e3a030af 	mov	r3, #175	; 0xaf
f0018ac4:	ebfff508 	bl	f0015eec <printk>
f0018ac8:	eafffffe 	b	f0018ac8 <thread_wait+0x18c>
f0018acc:	e51b3020 	ldr	r3, [fp, #-32]
f0018ad0:	e5d33084 	ldrb	r3, [r3, #132]	; 0x84
f0018ad4:	e3530000 	cmp	r3, #0
f0018ad8:	0a000005 	beq	f0018af4 <thread_wait+0x1b8>
f0018adc:	e59f0038 	ldr	r0, [pc, #56]	; f0018b1c <thread_wait+0x1e0>
f0018ae0:	e59f1038 	ldr	r1, [pc, #56]	; f0018b20 <thread_wait+0x1e4>
f0018ae4:	e59f2038 	ldr	r2, [pc, #56]	; f0018b24 <thread_wait+0x1e8>
f0018ae8:	e3a030b0 	mov	r3, #176	; 0xb0
f0018aec:	ebfff4fe 	bl	f0015eec <printk>
f0018af0:	eafffffe 	b	f0018af0 <thread_wait+0x1b4>
f0018af4:	e51b3020 	ldr	r3, [fp, #-32]
f0018af8:	e59330b0 	ldr	r3, [r3, #176]	; 0xb0
f0018afc:	e50b300c 	str	r3, [fp, #-12]
f0018b00:	e51b0020 	ldr	r0, [fp, #-32]
f0018b04:	e59f101c 	ldr	r1, [pc, #28]	; f0018b28 <thread_wait+0x1ec>
f0018b08:	ebffc805 	bl	f000ab24 <ktcb_list_add>
f0018b0c:	e51b300c 	ldr	r3, [fp, #-12]
f0018b10:	e1a00003 	mov	r0, r3
f0018b14:	e24bd004 	sub	sp, fp, #4
f0018b18:	e8bd8800 	pop	{fp, pc}
f0018b1c:	f001f824 	.word	0xf001f824
f0018b20:	f001f84c 	.word	0xf001f84c
f0018b24:	f001f88c 	.word	0xf001f88c
f0018b28:	f0033130 	.word	0xf0033130

f0018b2c <thread_destroy>:
f0018b2c:	e92d4800 	push	{fp, lr}
f0018b30:	e28db004 	add	fp, sp, #4
f0018b34:	e24dd008 	sub	sp, sp, #8
f0018b38:	e50b0008 	str	r0, [fp, #-8]
f0018b3c:	e50b100c 	str	r1, [fp, #-12]
f0018b40:	e51b300c 	ldr	r3, [fp, #-12]
f0018b44:	e1a03803 	lsl	r3, r3, #16
f0018b48:	e1a03823 	lsr	r3, r3, #16
f0018b4c:	e50b300c 	str	r3, [fp, #-12]
f0018b50:	e51b0008 	ldr	r0, [fp, #-8]
f0018b54:	ebfffe57 	bl	f00184b8 <task_is_child>
f0018b58:	e1a03000 	mov	r3, r0
f0018b5c:	e3530000 	cmp	r3, #0
f0018b60:	0a000003 	beq	f0018b74 <thread_destroy+0x48>
f0018b64:	e51b0008 	ldr	r0, [fp, #-8]
f0018b68:	ebfffe67 	bl	f001850c <thread_destroy_child>
f0018b6c:	e1a03000 	mov	r3, r0
f0018b70:	ea00000e 	b	f0018bb0 <thread_destroy+0x84>
f0018b74:	ebfffdc4 	bl	f001828c <current_task>
f0018b78:	e1a02000 	mov	r2, r0
f0018b7c:	e51b3008 	ldr	r3, [fp, #-8]
f0018b80:	e1520003 	cmp	r2, r3
f0018b84:	1a000003 	bne	f0018b98 <thread_destroy+0x6c>
f0018b88:	e51b000c 	ldr	r0, [fp, #-12]
f0018b8c:	ebffff24 	bl	f0018824 <thread_destroy_self>
f0018b90:	e3a03000 	mov	r3, #0
f0018b94:	ea000005 	b	f0018bb0 <thread_destroy+0x84>
f0018b98:	e59f001c 	ldr	r0, [pc, #28]	; f0018bbc <thread_destroy+0x90>
f0018b9c:	e59f101c 	ldr	r1, [pc, #28]	; f0018bc0 <thread_destroy+0x94>
f0018ba0:	e59f201c 	ldr	r2, [pc, #28]	; f0018bc4 <thread_destroy+0x98>
f0018ba4:	e3a030c8 	mov	r3, #200	; 0xc8
f0018ba8:	ebfff4cf 	bl	f0015eec <printk>
f0018bac:	eafffffe 	b	f0018bac <thread_destroy+0x80>
f0018bb0:	e1a00003 	mov	r0, r3
f0018bb4:	e24bd004 	sub	sp, fp, #4
f0018bb8:	e8bd8800 	pop	{fp, pc}
f0018bbc:	f001f824 	.word	0xf001f824
f0018bc0:	f001f84c 	.word	0xf001f84c
f0018bc4:	f001f898 	.word	0xf001f898

f0018bc8 <arch_clear_thread>:
f0018bc8:	e92d4810 	push	{r4, fp, lr}
f0018bcc:	e28db008 	add	fp, sp, #8
f0018bd0:	e24dd00c 	sub	sp, sp, #12
f0018bd4:	e50b0010 	str	r0, [fp, #-16]
f0018bd8:	e51b0010 	ldr	r0, [fp, #-16]
f0018bdc:	ebffc887 	bl	f000ae00 <tcb_remove>
f0018be0:	e51b3010 	ldr	r3, [fp, #-16]
f0018be4:	e1a03a03 	lsl	r3, r3, #20
f0018be8:	e1a03a23 	lsr	r3, r3, #20
f0018bec:	e3530000 	cmp	r3, #0
f0018bf0:	0a000005 	beq	f0018c0c <arch_clear_thread+0x44>
f0018bf4:	e59f01f4 	ldr	r0, [pc, #500]	; f0018df0 <arch_clear_thread+0x228>
f0018bf8:	e59f11f4 	ldr	r1, [pc, #500]	; f0018df4 <arch_clear_thread+0x22c>
f0018bfc:	e59f21f4 	ldr	r2, [pc, #500]	; f0018df8 <arch_clear_thread+0x230>
f0018c00:	e3a030d3 	mov	r3, #211	; 0xd3
f0018c04:	ebfff4b8 	bl	f0015eec <printk>
f0018c08:	eafffffe 	b	f0018c08 <arch_clear_thread+0x40>
f0018c0c:	e51b3010 	ldr	r3, [fp, #-16]
f0018c10:	e59330f8 	ldr	r3, [r3, #248]	; 0xf8
f0018c14:	e3530000 	cmp	r3, #0
f0018c18:	da000005 	ble	f0018c34 <arch_clear_thread+0x6c>
f0018c1c:	e59f01cc 	ldr	r0, [pc, #460]	; f0018df0 <arch_clear_thread+0x228>
f0018c20:	e59f11cc 	ldr	r1, [pc, #460]	; f0018df4 <arch_clear_thread+0x22c>
f0018c24:	e59f21cc 	ldr	r2, [pc, #460]	; f0018df8 <arch_clear_thread+0x230>
f0018c28:	e3a030d4 	mov	r3, #212	; 0xd4
f0018c2c:	ebfff4ae 	bl	f0015eec <printk>
f0018c30:	eafffffe 	b	f0018c30 <arch_clear_thread+0x68>
f0018c34:	e51b3010 	ldr	r3, [fp, #-16]
f0018c38:	e59330d4 	ldr	r3, [r3, #212]	; 0xd4
f0018c3c:	e3530000 	cmp	r3, #0
f0018c40:	da000005 	ble	f0018c5c <arch_clear_thread+0x94>
f0018c44:	e59f01a4 	ldr	r0, [pc, #420]	; f0018df0 <arch_clear_thread+0x228>
f0018c48:	e59f11a4 	ldr	r1, [pc, #420]	; f0018df4 <arch_clear_thread+0x22c>
f0018c4c:	e59f21a4 	ldr	r2, [pc, #420]	; f0018df8 <arch_clear_thread+0x230>
f0018c50:	e3a030d5 	mov	r3, #213	; 0xd5
f0018c54:	ebfff4a4 	bl	f0015eec <printk>
f0018c58:	eafffffe 	b	f0018c58 <arch_clear_thread+0x90>
f0018c5c:	e51b3010 	ldr	r3, [fp, #-16]
f0018c60:	e59330c4 	ldr	r3, [r3, #196]	; 0xc4
f0018c64:	e3530000 	cmp	r3, #0
f0018c68:	da000005 	ble	f0018c84 <arch_clear_thread+0xbc>
f0018c6c:	e59f017c 	ldr	r0, [pc, #380]	; f0018df0 <arch_clear_thread+0x228>
f0018c70:	e59f117c 	ldr	r1, [pc, #380]	; f0018df4 <arch_clear_thread+0x22c>
f0018c74:	e59f217c 	ldr	r2, [pc, #380]	; f0018df8 <arch_clear_thread+0x230>
f0018c78:	e3a030d6 	mov	r3, #214	; 0xd6
f0018c7c:	ebfff49a 	bl	f0015eec <printk>
f0018c80:	eafffffe 	b	f0018c80 <arch_clear_thread+0xb8>
f0018c84:	e51b3010 	ldr	r3, [fp, #-16]
f0018c88:	e2833088 	add	r3, r3, #136	; 0x88
f0018c8c:	e1a00003 	mov	r0, r3
f0018c90:	ebfffcfb 	bl	f0018084 <list_empty>
f0018c94:	e1a03000 	mov	r3, r0
f0018c98:	e3530000 	cmp	r3, #0
f0018c9c:	1a000005 	bne	f0018cb8 <arch_clear_thread+0xf0>
f0018ca0:	e59f0148 	ldr	r0, [pc, #328]	; f0018df0 <arch_clear_thread+0x228>
f0018ca4:	e59f1148 	ldr	r1, [pc, #328]	; f0018df4 <arch_clear_thread+0x22c>
f0018ca8:	e59f2148 	ldr	r2, [pc, #328]	; f0018df8 <arch_clear_thread+0x230>
f0018cac:	e3a030d7 	mov	r3, #215	; 0xd7
f0018cb0:	ebfff48d 	bl	f0015eec <printk>
f0018cb4:	eafffffe 	b	f0018cb4 <arch_clear_thread+0xec>
f0018cb8:	e51b3010 	ldr	r3, [fp, #-16]
f0018cbc:	e2833048 	add	r3, r3, #72	; 0x48
f0018cc0:	e1a00003 	mov	r0, r3
f0018cc4:	ebfffcee 	bl	f0018084 <list_empty>
f0018cc8:	e1a03000 	mov	r3, r0
f0018ccc:	e3530000 	cmp	r3, #0
f0018cd0:	1a000005 	bne	f0018cec <arch_clear_thread+0x124>
f0018cd4:	e59f0114 	ldr	r0, [pc, #276]	; f0018df0 <arch_clear_thread+0x228>
f0018cd8:	e59f1114 	ldr	r1, [pc, #276]	; f0018df4 <arch_clear_thread+0x22c>
f0018cdc:	e59f2114 	ldr	r2, [pc, #276]	; f0018df8 <arch_clear_thread+0x230>
f0018ce0:	e3a030d8 	mov	r3, #216	; 0xd8
f0018ce4:	ebfff480 	bl	f0015eec <printk>
f0018ce8:	eafffffe 	b	f0018ce8 <arch_clear_thread+0x120>
f0018cec:	e51b3010 	ldr	r3, [fp, #-16]
f0018cf0:	e5933050 	ldr	r3, [r3, #80]	; 0x50
f0018cf4:	e3530000 	cmp	r3, #0
f0018cf8:	0a000005 	beq	f0018d14 <arch_clear_thread+0x14c>
f0018cfc:	e59f00ec 	ldr	r0, [pc, #236]	; f0018df0 <arch_clear_thread+0x228>
f0018d00:	e59f10ec 	ldr	r1, [pc, #236]	; f0018df4 <arch_clear_thread+0x22c>
f0018d04:	e59f20ec 	ldr	r2, [pc, #236]	; f0018df8 <arch_clear_thread+0x230>
f0018d08:	e3a030d9 	mov	r3, #217	; 0xd9
f0018d0c:	ebfff476 	bl	f0015eec <printk>
f0018d10:	eafffffe 	b	f0018d10 <arch_clear_thread+0x148>
f0018d14:	e51b3010 	ldr	r3, [fp, #-16]
f0018d18:	e59330ac 	ldr	r3, [r3, #172]	; 0xac
f0018d1c:	e3530000 	cmp	r3, #0
f0018d20:	0a000005 	beq	f0018d3c <arch_clear_thread+0x174>
f0018d24:	e59f00c4 	ldr	r0, [pc, #196]	; f0018df0 <arch_clear_thread+0x228>
f0018d28:	e59f10c4 	ldr	r1, [pc, #196]	; f0018df4 <arch_clear_thread+0x22c>
f0018d2c:	e59f20c4 	ldr	r2, [pc, #196]	; f0018df8 <arch_clear_thread+0x230>
f0018d30:	e3a030da 	mov	r3, #218	; 0xda
f0018d34:	ebfff46c 	bl	f0015eec <printk>
f0018d38:	eafffffe 	b	f0018d38 <arch_clear_thread+0x170>
f0018d3c:	e51b3010 	ldr	r3, [fp, #-16]
f0018d40:	e593310c 	ldr	r3, [r3, #268]	; 0x10c
f0018d44:	e3530000 	cmp	r3, #0
f0018d48:	0a000005 	beq	f0018d64 <arch_clear_thread+0x19c>
f0018d4c:	e59f009c 	ldr	r0, [pc, #156]	; f0018df0 <arch_clear_thread+0x228>
f0018d50:	e59f109c 	ldr	r1, [pc, #156]	; f0018df4 <arch_clear_thread+0x22c>
f0018d54:	e59f209c 	ldr	r2, [pc, #156]	; f0018df8 <arch_clear_thread+0x230>
f0018d58:	e3a030db 	mov	r3, #219	; 0xdb
f0018d5c:	ebfff462 	bl	f0015eec <printk>
f0018d60:	eafffffe 	b	f0018d60 <arch_clear_thread+0x198>
f0018d64:	e51b3010 	ldr	r3, [fp, #-16]
f0018d68:	e5933110 	ldr	r3, [r3, #272]	; 0x110
f0018d6c:	e3530000 	cmp	r3, #0
f0018d70:	0a000005 	beq	f0018d8c <arch_clear_thread+0x1c4>
f0018d74:	e59f0074 	ldr	r0, [pc, #116]	; f0018df0 <arch_clear_thread+0x228>
f0018d78:	e59f1074 	ldr	r1, [pc, #116]	; f0018df4 <arch_clear_thread+0x22c>
f0018d7c:	e59f2074 	ldr	r2, [pc, #116]	; f0018df8 <arch_clear_thread+0x230>
f0018d80:	e3a030dc 	mov	r3, #220	; 0xdc
f0018d84:	ebfff458 	bl	f0015eec <printk>
f0018d88:	eafffffe 	b	f0018d88 <arch_clear_thread+0x1c0>
f0018d8c:	e51b3010 	ldr	r3, [fp, #-16]
f0018d90:	e1a00003 	mov	r0, r3
f0018d94:	e3a01000 	mov	r1, #0
f0018d98:	e3a02044 	mov	r2, #68	; 0x44
f0018d9c:	ebfff47d 	bl	f0015f98 <memset>
f0018da0:	e51b3010 	ldr	r3, [fp, #-16]
f0018da4:	e3a02010 	mov	r2, #16
f0018da8:	e5832000 	str	r2, [r3]
f0018dac:	e51b3010 	ldr	r3, [fp, #-16]
f0018db0:	e59340b4 	ldr	r4, [r3, #180]	; 0xb4
f0018db4:	ebfffd34 	bl	f001828c <current_task>
f0018db8:	e1a03000 	mov	r3, r0
f0018dbc:	e59330b4 	ldr	r3, [r3, #180]	; 0xb4
f0018dc0:	e2833014 	add	r3, r3, #20
f0018dc4:	e1a00004 	mov	r0, r4
f0018dc8:	e1a01003 	mov	r1, r3
f0018dcc:	ebffec99 	bl	f0014038 <remove_mapping_pgd_all_user>
f0018dd0:	e51b0010 	ldr	r0, [fp, #-16]
f0018dd4:	ebffc41f 	bl	f0009e58 <tcb_init>
f0018dd8:	e51b0010 	ldr	r0, [fp, #-16]
f0018ddc:	ebffc786 	bl	f000abfc <tcb_add>
f0018de0:	e3a03000 	mov	r3, #0
f0018de4:	e1a00003 	mov	r0, r3
f0018de8:	e24bd008 	sub	sp, fp, #8
f0018dec:	e8bd8810 	pop	{r4, fp, pc}
f0018df0:	f001f824 	.word	0xf001f824
f0018df4:	f001f84c 	.word	0xf001f84c
f0018df8:	f001f8a8 	.word	0xf001f8a8

f0018dfc <thread_recycle>:
f0018dfc:	e92d4800 	push	{fp, lr}
f0018e00:	e28db004 	add	fp, sp, #4
f0018e04:	e24dd010 	sub	sp, sp, #16
f0018e08:	e50b0010 	str	r0, [fp, #-16]
f0018e0c:	e51b0010 	ldr	r0, [fp, #-16]
f0018e10:	ebfffd90 	bl	f0018458 <thread_suspend>
f0018e14:	e50b0008 	str	r0, [fp, #-8]
f0018e18:	e51b3008 	ldr	r3, [fp, #-8]
f0018e1c:	e3530000 	cmp	r3, #0
f0018e20:	aa000001 	bge	f0018e2c <thread_recycle+0x30>
f0018e24:	e51b3008 	ldr	r3, [fp, #-8]
f0018e28:	ea000016 	b	f0018e88 <thread_recycle+0x8c>
f0018e2c:	e51b3010 	ldr	r3, [fp, #-16]
f0018e30:	e28330d4 	add	r3, r3, #212	; 0xd4
f0018e34:	e1a00003 	mov	r0, r3
f0018e38:	e3a01000 	mov	r1, #0
f0018e3c:	ebfff683 	bl	f0016850 <wake_up_all>
f0018e40:	e51b3010 	ldr	r3, [fp, #-16]
f0018e44:	e28330c4 	add	r3, r3, #196	; 0xc4
f0018e48:	e1a00003 	mov	r0, r3
f0018e4c:	e3a01000 	mov	r1, #0
f0018e50:	ebfff67e 	bl	f0016850 <wake_up_all>
f0018e54:	e51b3010 	ldr	r3, [fp, #-16]
f0018e58:	e59330f8 	ldr	r3, [r3, #248]	; 0xf8
f0018e5c:	e3530000 	cmp	r3, #0
f0018e60:	da000005 	ble	f0018e7c <thread_recycle+0x80>
f0018e64:	e59f0028 	ldr	r0, [pc, #40]	; f0018e94 <thread_recycle+0x98>
f0018e68:	e59f1028 	ldr	r1, [pc, #40]	; f0018e98 <thread_recycle+0x9c>
f0018e6c:	e59f2028 	ldr	r2, [pc, #40]	; f0018e9c <thread_recycle+0xa0>
f0018e70:	e3a03c01 	mov	r3, #256	; 0x100
f0018e74:	ebfff41c 	bl	f0015eec <printk>
f0018e78:	eafffffe 	b	f0018e78 <thread_recycle+0x7c>
f0018e7c:	e51b0010 	ldr	r0, [fp, #-16]
f0018e80:	ebffff50 	bl	f0018bc8 <arch_clear_thread>
f0018e84:	e3a03000 	mov	r3, #0
f0018e88:	e1a00003 	mov	r0, r3
f0018e8c:	e24bd004 	sub	sp, fp, #4
f0018e90:	e8bd8800 	pop	{fp, pc}
f0018e94:	f001f824 	.word	0xf001f824
f0018e98:	f001f84c 	.word	0xf001f84c
f0018e9c:	f001f8bc 	.word	0xf001f8bc

f0018ea0 <thread_start>:
f0018ea0:	e92d4800 	push	{fp, lr}
f0018ea4:	e28db004 	add	fp, sp, #4
f0018ea8:	e24dd008 	sub	sp, sp, #8
f0018eac:	e50b0008 	str	r0, [fp, #-8]
f0018eb0:	e51b3008 	ldr	r3, [fp, #-8]
f0018eb4:	e2833068 	add	r3, r3, #104	; 0x68
f0018eb8:	e1a00003 	mov	r0, r3
f0018ebc:	ebfff7f0 	bl	f0016e84 <mutex_trylock>
f0018ec0:	e1a03000 	mov	r3, r0
f0018ec4:	e3530000 	cmp	r3, #0
f0018ec8:	1a000001 	bne	f0018ed4 <thread_start+0x34>
f0018ecc:	e3e0300a 	mvn	r3, #10
f0018ed0:	ea000006 	b	f0018ef0 <thread_start+0x50>
f0018ed4:	e51b0008 	ldr	r0, [fp, #-8]
f0018ed8:	ebffbfec 	bl	f0008e90 <sched_resume_async>
f0018edc:	e51b3008 	ldr	r3, [fp, #-8]
f0018ee0:	e2833068 	add	r3, r3, #104	; 0x68
f0018ee4:	e1a00003 	mov	r0, r3
f0018ee8:	ebfff8b0 	bl	f00171b0 <mutex_unlock>
f0018eec:	e3a03000 	mov	r3, #0
f0018ef0:	e1a00003 	mov	r0, r3
f0018ef4:	e24bd004 	sub	sp, fp, #4
f0018ef8:	e8bd8800 	pop	{fp, pc}

f0018efc <arch_setup_new_thread>:
f0018efc:	e92d4800 	push	{fp, lr}
f0018f00:	e28db004 	add	fp, sp, #4
f0018f04:	e24dd010 	sub	sp, sp, #16
f0018f08:	e50b0008 	str	r0, [fp, #-8]
f0018f0c:	e50b100c 	str	r1, [fp, #-12]
f0018f10:	e50b2010 	str	r2, [fp, #-16]
f0018f14:	e51b3010 	ldr	r3, [fp, #-16]
f0018f18:	e2033301 	and	r3, r3, #67108864	; 0x4000000
f0018f1c:	e3530000 	cmp	r3, #0
f0018f20:	0a00000d 	beq	f0018f5c <arch_setup_new_thread+0x60>
f0018f24:	e51b300c 	ldr	r3, [fp, #-12]
f0018f28:	e3530000 	cmp	r3, #0
f0018f2c:	0a000005 	beq	f0018f48 <arch_setup_new_thread+0x4c>
f0018f30:	e59f04a0 	ldr	r0, [pc, #1184]	; f00193d8 <arch_setup_new_thread+0x4dc>
f0018f34:	e59f14a0 	ldr	r1, [pc, #1184]	; f00193dc <arch_setup_new_thread+0x4e0>
f0018f38:	e59f24a0 	ldr	r2, [pc, #1184]	; f00193e0 <arch_setup_new_thread+0x4e4>
f0018f3c:	e3a03f47 	mov	r3, #284	; 0x11c
f0018f40:	ebfff3e9 	bl	f0015eec <printk>
f0018f44:	eafffffe 	b	f0018f44 <arch_setup_new_thread+0x48>
f0018f48:	e51b3008 	ldr	r3, [fp, #-8]
f0018f4c:	e3a02010 	mov	r2, #16
f0018f50:	e5832000 	str	r2, [r3]
f0018f54:	e3a03000 	mov	r3, #0
f0018f58:	ea00011b 	b	f00193cc <arch_setup_new_thread+0x4d0>
f0018f5c:	e51b300c 	ldr	r3, [fp, #-12]
f0018f60:	e3530000 	cmp	r3, #0
f0018f64:	1a000005 	bne	f0018f80 <arch_setup_new_thread+0x84>
f0018f68:	e59f0468 	ldr	r0, [pc, #1128]	; f00193d8 <arch_setup_new_thread+0x4dc>
f0018f6c:	e59f1468 	ldr	r1, [pc, #1128]	; f00193dc <arch_setup_new_thread+0x4e0>
f0018f70:	e59f2468 	ldr	r2, [pc, #1128]	; f00193e0 <arch_setup_new_thread+0x4e4>
f0018f74:	e59f3468 	ldr	r3, [pc, #1128]	; f00193e4 <arch_setup_new_thread+0x4e8>
f0018f78:	ebfff3db 	bl	f0015eec <printk>
f0018f7c:	eafffffe 	b	f0018f7c <arch_setup_new_thread+0x80>
f0018f80:	e51b300c 	ldr	r3, [fp, #-12]
f0018f84:	e5933044 	ldr	r3, [r3, #68]	; 0x44
f0018f88:	e3530000 	cmp	r3, #0
f0018f8c:	1a000001 	bne	f0018f98 <arch_setup_new_thread+0x9c>
f0018f90:	e3a03000 	mov	r3, #0
f0018f94:	ea00010c 	b	f00193cc <arch_setup_new_thread+0x4d0>
f0018f98:	e51b300c 	ldr	r3, [fp, #-12]
f0018f9c:	e5933044 	ldr	r3, [r3, #68]	; 0x44
f0018fa0:	e5d32000 	ldrb	r2, [r3]
f0018fa4:	e5d31001 	ldrb	r1, [r3, #1]
f0018fa8:	e1a01401 	lsl	r1, r1, #8
f0018fac:	e1812002 	orr	r2, r1, r2
f0018fb0:	e5d31002 	ldrb	r1, [r3, #2]
f0018fb4:	e1a01801 	lsl	r1, r1, #16
f0018fb8:	e1812002 	orr	r2, r1, r2
f0018fbc:	e5d33003 	ldrb	r3, [r3, #3]
f0018fc0:	e1a03c03 	lsl	r3, r3, #24
f0018fc4:	e1833002 	orr	r3, r3, r2
f0018fc8:	e1a02003 	mov	r2, r3
f0018fcc:	e51b3008 	ldr	r3, [fp, #-8]
f0018fd0:	e5832000 	str	r2, [r3]
f0018fd4:	e51b3008 	ldr	r3, [fp, #-8]
f0018fd8:	e5933000 	ldr	r3, [r3]
f0018fdc:	e3530000 	cmp	r3, #0
f0018fe0:	1a000005 	bne	f0018ffc <arch_setup_new_thread+0x100>
f0018fe4:	e59f03ec 	ldr	r0, [pc, #1004]	; f00193d8 <arch_setup_new_thread+0x4dc>
f0018fe8:	e59f13ec 	ldr	r1, [pc, #1004]	; f00193dc <arch_setup_new_thread+0x4e0>
f0018fec:	e59f23ec 	ldr	r2, [pc, #1004]	; f00193e0 <arch_setup_new_thread+0x4e4>
f0018ff0:	e59f33f0 	ldr	r3, [pc, #1008]	; f00193e8 <arch_setup_new_thread+0x4ec>
f0018ff4:	ebfff3bc 	bl	f0015eec <printk>
f0018ff8:	eafffffe 	b	f0018ff8 <arch_setup_new_thread+0xfc>
f0018ffc:	e51b300c 	ldr	r3, [fp, #-12]
f0019000:	e5933044 	ldr	r3, [r3, #68]	; 0x44
f0019004:	e5d32004 	ldrb	r2, [r3, #4]
f0019008:	e5d31005 	ldrb	r1, [r3, #5]
f001900c:	e1a01401 	lsl	r1, r1, #8
f0019010:	e1812002 	orr	r2, r1, r2
f0019014:	e5d31006 	ldrb	r1, [r3, #6]
f0019018:	e1a01801 	lsl	r1, r1, #16
f001901c:	e1812002 	orr	r2, r1, r2
f0019020:	e5d33007 	ldrb	r3, [r3, #7]
f0019024:	e1a03c03 	lsl	r3, r3, #24
f0019028:	e1833002 	orr	r3, r3, r2
f001902c:	e1a02003 	mov	r2, r3
f0019030:	e51b3008 	ldr	r3, [fp, #-8]
f0019034:	e5832004 	str	r2, [r3, #4]
f0019038:	e51b300c 	ldr	r3, [fp, #-12]
f001903c:	e5933044 	ldr	r3, [r3, #68]	; 0x44
f0019040:	e5d32008 	ldrb	r2, [r3, #8]
f0019044:	e5d31009 	ldrb	r1, [r3, #9]
f0019048:	e1a01401 	lsl	r1, r1, #8
f001904c:	e1812002 	orr	r2, r1, r2
f0019050:	e5d3100a 	ldrb	r1, [r3, #10]
f0019054:	e1a01801 	lsl	r1, r1, #16
f0019058:	e1812002 	orr	r2, r1, r2
f001905c:	e5d3300b 	ldrb	r3, [r3, #11]
f0019060:	e1a03c03 	lsl	r3, r3, #24
f0019064:	e1833002 	orr	r3, r3, r2
f0019068:	e1a02003 	mov	r2, r3
f001906c:	e51b3008 	ldr	r3, [fp, #-8]
f0019070:	e5832008 	str	r2, [r3, #8]
f0019074:	e51b300c 	ldr	r3, [fp, #-12]
f0019078:	e5933044 	ldr	r3, [r3, #68]	; 0x44
f001907c:	e5d3200c 	ldrb	r2, [r3, #12]
f0019080:	e5d3100d 	ldrb	r1, [r3, #13]
f0019084:	e1a01401 	lsl	r1, r1, #8
f0019088:	e1812002 	orr	r2, r1, r2
f001908c:	e5d3100e 	ldrb	r1, [r3, #14]
f0019090:	e1a01801 	lsl	r1, r1, #16
f0019094:	e1812002 	orr	r2, r1, r2
f0019098:	e5d3300f 	ldrb	r3, [r3, #15]
f001909c:	e1a03c03 	lsl	r3, r3, #24
f00190a0:	e1833002 	orr	r3, r3, r2
f00190a4:	e1a02003 	mov	r2, r3
f00190a8:	e51b3008 	ldr	r3, [fp, #-8]
f00190ac:	e583200c 	str	r2, [r3, #12]
f00190b0:	e51b300c 	ldr	r3, [fp, #-12]
f00190b4:	e5933044 	ldr	r3, [r3, #68]	; 0x44
f00190b8:	e5d32010 	ldrb	r2, [r3, #16]
f00190bc:	e5d31011 	ldrb	r1, [r3, #17]
f00190c0:	e1a01401 	lsl	r1, r1, #8
f00190c4:	e1812002 	orr	r2, r1, r2
f00190c8:	e5d31012 	ldrb	r1, [r3, #18]
f00190cc:	e1a01801 	lsl	r1, r1, #16
f00190d0:	e1812002 	orr	r2, r1, r2
f00190d4:	e5d33013 	ldrb	r3, [r3, #19]
f00190d8:	e1a03c03 	lsl	r3, r3, #24
f00190dc:	e1833002 	orr	r3, r3, r2
f00190e0:	e1a02003 	mov	r2, r3
f00190e4:	e51b3008 	ldr	r3, [fp, #-8]
f00190e8:	e5832010 	str	r2, [r3, #16]
f00190ec:	e51b300c 	ldr	r3, [fp, #-12]
f00190f0:	e5933044 	ldr	r3, [r3, #68]	; 0x44
f00190f4:	e5d32014 	ldrb	r2, [r3, #20]
f00190f8:	e5d31015 	ldrb	r1, [r3, #21]
f00190fc:	e1a01401 	lsl	r1, r1, #8
f0019100:	e1812002 	orr	r2, r1, r2
f0019104:	e5d31016 	ldrb	r1, [r3, #22]
f0019108:	e1a01801 	lsl	r1, r1, #16
f001910c:	e1812002 	orr	r2, r1, r2
f0019110:	e5d33017 	ldrb	r3, [r3, #23]
f0019114:	e1a03c03 	lsl	r3, r3, #24
f0019118:	e1833002 	orr	r3, r3, r2
f001911c:	e1a02003 	mov	r2, r3
f0019120:	e51b3008 	ldr	r3, [fp, #-8]
f0019124:	e5832014 	str	r2, [r3, #20]
f0019128:	e51b300c 	ldr	r3, [fp, #-12]
f001912c:	e5933044 	ldr	r3, [r3, #68]	; 0x44
f0019130:	e5d32018 	ldrb	r2, [r3, #24]
f0019134:	e5d31019 	ldrb	r1, [r3, #25]
f0019138:	e1a01401 	lsl	r1, r1, #8
f001913c:	e1812002 	orr	r2, r1, r2
f0019140:	e5d3101a 	ldrb	r1, [r3, #26]
f0019144:	e1a01801 	lsl	r1, r1, #16
f0019148:	e1812002 	orr	r2, r1, r2
f001914c:	e5d3301b 	ldrb	r3, [r3, #27]
f0019150:	e1a03c03 	lsl	r3, r3, #24
f0019154:	e1833002 	orr	r3, r3, r2
f0019158:	e1a02003 	mov	r2, r3
f001915c:	e51b3008 	ldr	r3, [fp, #-8]
f0019160:	e5832018 	str	r2, [r3, #24]
f0019164:	e51b300c 	ldr	r3, [fp, #-12]
f0019168:	e5933044 	ldr	r3, [r3, #68]	; 0x44
f001916c:	e5d3201c 	ldrb	r2, [r3, #28]
f0019170:	e5d3101d 	ldrb	r1, [r3, #29]
f0019174:	e1a01401 	lsl	r1, r1, #8
f0019178:	e1812002 	orr	r2, r1, r2
f001917c:	e5d3101e 	ldrb	r1, [r3, #30]
f0019180:	e1a01801 	lsl	r1, r1, #16
f0019184:	e1812002 	orr	r2, r1, r2
f0019188:	e5d3301f 	ldrb	r3, [r3, #31]
f001918c:	e1a03c03 	lsl	r3, r3, #24
f0019190:	e1833002 	orr	r3, r3, r2
f0019194:	e1a02003 	mov	r2, r3
f0019198:	e51b3008 	ldr	r3, [fp, #-8]
f001919c:	e583201c 	str	r2, [r3, #28]
f00191a0:	e51b300c 	ldr	r3, [fp, #-12]
f00191a4:	e5933044 	ldr	r3, [r3, #68]	; 0x44
f00191a8:	e5d32020 	ldrb	r2, [r3, #32]
f00191ac:	e5d31021 	ldrb	r1, [r3, #33]	; 0x21
f00191b0:	e1a01401 	lsl	r1, r1, #8
f00191b4:	e1812002 	orr	r2, r1, r2
f00191b8:	e5d31022 	ldrb	r1, [r3, #34]	; 0x22
f00191bc:	e1a01801 	lsl	r1, r1, #16
f00191c0:	e1812002 	orr	r2, r1, r2
f00191c4:	e5d33023 	ldrb	r3, [r3, #35]	; 0x23
f00191c8:	e1a03c03 	lsl	r3, r3, #24
f00191cc:	e1833002 	orr	r3, r3, r2
f00191d0:	e1a02003 	mov	r2, r3
f00191d4:	e51b3008 	ldr	r3, [fp, #-8]
f00191d8:	e5832020 	str	r2, [r3, #32]
f00191dc:	e51b300c 	ldr	r3, [fp, #-12]
f00191e0:	e5933044 	ldr	r3, [r3, #68]	; 0x44
f00191e4:	e5d32024 	ldrb	r2, [r3, #36]	; 0x24
f00191e8:	e5d31025 	ldrb	r1, [r3, #37]	; 0x25
f00191ec:	e1a01401 	lsl	r1, r1, #8
f00191f0:	e1812002 	orr	r2, r1, r2
f00191f4:	e5d31026 	ldrb	r1, [r3, #38]	; 0x26
f00191f8:	e1a01801 	lsl	r1, r1, #16
f00191fc:	e1812002 	orr	r2, r1, r2
f0019200:	e5d33027 	ldrb	r3, [r3, #39]	; 0x27
f0019204:	e1a03c03 	lsl	r3, r3, #24
f0019208:	e1833002 	orr	r3, r3, r2
f001920c:	e1a02003 	mov	r2, r3
f0019210:	e51b3008 	ldr	r3, [fp, #-8]
f0019214:	e5832024 	str	r2, [r3, #36]	; 0x24
f0019218:	e51b300c 	ldr	r3, [fp, #-12]
f001921c:	e5933044 	ldr	r3, [r3, #68]	; 0x44
f0019220:	e5d32028 	ldrb	r2, [r3, #40]	; 0x28
f0019224:	e5d31029 	ldrb	r1, [r3, #41]	; 0x29
f0019228:	e1a01401 	lsl	r1, r1, #8
f001922c:	e1812002 	orr	r2, r1, r2
f0019230:	e5d3102a 	ldrb	r1, [r3, #42]	; 0x2a
f0019234:	e1a01801 	lsl	r1, r1, #16
f0019238:	e1812002 	orr	r2, r1, r2
f001923c:	e5d3302b 	ldrb	r3, [r3, #43]	; 0x2b
f0019240:	e1a03c03 	lsl	r3, r3, #24
f0019244:	e1833002 	orr	r3, r3, r2
f0019248:	e1a02003 	mov	r2, r3
f001924c:	e51b3008 	ldr	r3, [fp, #-8]
f0019250:	e5832028 	str	r2, [r3, #40]	; 0x28
f0019254:	e51b300c 	ldr	r3, [fp, #-12]
f0019258:	e5933044 	ldr	r3, [r3, #68]	; 0x44
f001925c:	e5d3202c 	ldrb	r2, [r3, #44]	; 0x2c
f0019260:	e5d3102d 	ldrb	r1, [r3, #45]	; 0x2d
f0019264:	e1a01401 	lsl	r1, r1, #8
f0019268:	e1812002 	orr	r2, r1, r2
f001926c:	e5d3102e 	ldrb	r1, [r3, #46]	; 0x2e
f0019270:	e1a01801 	lsl	r1, r1, #16
f0019274:	e1812002 	orr	r2, r1, r2
f0019278:	e5d3302f 	ldrb	r3, [r3, #47]	; 0x2f
f001927c:	e1a03c03 	lsl	r3, r3, #24
f0019280:	e1833002 	orr	r3, r3, r2
f0019284:	e1a02003 	mov	r2, r3
f0019288:	e51b3008 	ldr	r3, [fp, #-8]
f001928c:	e583202c 	str	r2, [r3, #44]	; 0x2c
f0019290:	e51b300c 	ldr	r3, [fp, #-12]
f0019294:	e5933044 	ldr	r3, [r3, #68]	; 0x44
f0019298:	e5d32030 	ldrb	r2, [r3, #48]	; 0x30
f001929c:	e5d31031 	ldrb	r1, [r3, #49]	; 0x31
f00192a0:	e1a01401 	lsl	r1, r1, #8
f00192a4:	e1812002 	orr	r2, r1, r2
f00192a8:	e5d31032 	ldrb	r1, [r3, #50]	; 0x32
f00192ac:	e1a01801 	lsl	r1, r1, #16
f00192b0:	e1812002 	orr	r2, r1, r2
f00192b4:	e5d33033 	ldrb	r3, [r3, #51]	; 0x33
f00192b8:	e1a03c03 	lsl	r3, r3, #24
f00192bc:	e1833002 	orr	r3, r3, r2
f00192c0:	e1a02003 	mov	r2, r3
f00192c4:	e51b3008 	ldr	r3, [fp, #-8]
f00192c8:	e5832030 	str	r2, [r3, #48]	; 0x30
f00192cc:	e51b300c 	ldr	r3, [fp, #-12]
f00192d0:	e5933044 	ldr	r3, [r3, #68]	; 0x44
f00192d4:	e5d32034 	ldrb	r2, [r3, #52]	; 0x34
f00192d8:	e5d31035 	ldrb	r1, [r3, #53]	; 0x35
f00192dc:	e1a01401 	lsl	r1, r1, #8
f00192e0:	e1812002 	orr	r2, r1, r2
f00192e4:	e5d31036 	ldrb	r1, [r3, #54]	; 0x36
f00192e8:	e1a01801 	lsl	r1, r1, #16
f00192ec:	e1812002 	orr	r2, r1, r2
f00192f0:	e5d33037 	ldrb	r3, [r3, #55]	; 0x37
f00192f4:	e1a03c03 	lsl	r3, r3, #24
f00192f8:	e1833002 	orr	r3, r3, r2
f00192fc:	e1a02003 	mov	r2, r3
f0019300:	e51b3008 	ldr	r3, [fp, #-8]
f0019304:	e5832034 	str	r2, [r3, #52]	; 0x34
f0019308:	e51b300c 	ldr	r3, [fp, #-12]
f001930c:	e5933044 	ldr	r3, [r3, #68]	; 0x44
f0019310:	e5d32038 	ldrb	r2, [r3, #56]	; 0x38
f0019314:	e5d31039 	ldrb	r1, [r3, #57]	; 0x39
f0019318:	e1a01401 	lsl	r1, r1, #8
f001931c:	e1812002 	orr	r2, r1, r2
f0019320:	e5d3103a 	ldrb	r1, [r3, #58]	; 0x3a
f0019324:	e1a01801 	lsl	r1, r1, #16
f0019328:	e1812002 	orr	r2, r1, r2
f001932c:	e5d3303b 	ldrb	r3, [r3, #59]	; 0x3b
f0019330:	e1a03c03 	lsl	r3, r3, #24
f0019334:	e1833002 	orr	r3, r3, r2
f0019338:	e1a02003 	mov	r2, r3
f001933c:	e51b3008 	ldr	r3, [fp, #-8]
f0019340:	e5832038 	str	r2, [r3, #56]	; 0x38
f0019344:	e51b300c 	ldr	r3, [fp, #-12]
f0019348:	e5933044 	ldr	r3, [r3, #68]	; 0x44
f001934c:	e5d3203c 	ldrb	r2, [r3, #60]	; 0x3c
f0019350:	e5d3103d 	ldrb	r1, [r3, #61]	; 0x3d
f0019354:	e1a01401 	lsl	r1, r1, #8
f0019358:	e1812002 	orr	r2, r1, r2
f001935c:	e5d3103e 	ldrb	r1, [r3, #62]	; 0x3e
f0019360:	e1a01801 	lsl	r1, r1, #16
f0019364:	e1812002 	orr	r2, r1, r2
f0019368:	e5d3303f 	ldrb	r3, [r3, #63]	; 0x3f
f001936c:	e1a03c03 	lsl	r3, r3, #24
f0019370:	e1833002 	orr	r3, r3, r2
f0019374:	e1a02003 	mov	r2, r3
f0019378:	e51b3008 	ldr	r3, [fp, #-8]
f001937c:	e5832040 	str	r2, [r3, #64]	; 0x40
f0019380:	e51b300c 	ldr	r3, [fp, #-12]
f0019384:	e593309c 	ldr	r3, [r3, #156]	; 0x9c
f0019388:	e2833001 	add	r3, r3, #1
f001938c:	e1a020a3 	lsr	r2, r3, #1
f0019390:	e51b3008 	ldr	r3, [fp, #-8]
f0019394:	e583209c 	str	r2, [r3, #156]	; 0x9c
f0019398:	e51b300c 	ldr	r3, [fp, #-12]
f001939c:	e593309c 	ldr	r3, [r3, #156]	; 0x9c
f00193a0:	e1a020a3 	lsr	r2, r3, #1
f00193a4:	e51b300c 	ldr	r3, [fp, #-12]
f00193a8:	e583209c 	str	r2, [r3, #156]	; 0x9c
f00193ac:	e51b300c 	ldr	r3, [fp, #-12]
f00193b0:	e593309c 	ldr	r3, [r3, #156]	; 0x9c
f00193b4:	e3530000 	cmp	r3, #0
f00193b8:	1a000002 	bne	f00193c8 <arch_setup_new_thread+0x4cc>
f00193bc:	e51b300c 	ldr	r3, [fp, #-12]
f00193c0:	e3a02001 	mov	r2, #1
f00193c4:	e583209c 	str	r2, [r3, #156]	; 0x9c
f00193c8:	e3a03000 	mov	r3, #0
f00193cc:	e1a00003 	mov	r0, r3
f00193d0:	e24bd004 	sub	sp, fp, #4
f00193d4:	e8bd8800 	pop	{fp, pc}
f00193d8:	f001f824 	.word	0xf001f824
f00193dc:	f001f84c 	.word	0xf001f84c
f00193e0:	f001f8cc 	.word	0xf001f8cc
f00193e4:	00000121 	.word	0x00000121
f00193e8:	0000012e 	.word	0x0000012e

f00193ec <thread_setup_affinity>:
f00193ec:	e92d4800 	push	{fp, lr}
f00193f0:	e28db004 	add	fp, sp, #4
f00193f4:	e24dd008 	sub	sp, sp, #8
f00193f8:	e50b0008 	str	r0, [fp, #-8]
f00193fc:	e59f0054 	ldr	r0, [pc, #84]	; f0019458 <thread_setup_affinity+0x6c>
f0019400:	ebfffb34 	bl	f00180d8 <spin_lock>
f0019404:	e59f3050 	ldr	r3, [pc, #80]	; f001945c <thread_setup_affinity+0x70>
f0019408:	e5933000 	ldr	r3, [r3]
f001940c:	e1a02003 	mov	r2, r3
f0019410:	e51b3008 	ldr	r3, [fp, #-8]
f0019414:	e583205c 	str	r2, [r3, #92]	; 0x5c
f0019418:	e59f303c 	ldr	r3, [pc, #60]	; f001945c <thread_setup_affinity+0x70>
f001941c:	e5933000 	ldr	r3, [r3]
f0019420:	e2832001 	add	r2, r3, #1
f0019424:	e59f3030 	ldr	r3, [pc, #48]	; f001945c <thread_setup_affinity+0x70>
f0019428:	e5832000 	str	r2, [r3]
f001942c:	e59f3028 	ldr	r3, [pc, #40]	; f001945c <thread_setup_affinity+0x70>
f0019430:	e5933000 	ldr	r3, [r3]
f0019434:	e3530000 	cmp	r3, #0
f0019438:	0a000002 	beq	f0019448 <thread_setup_affinity+0x5c>
f001943c:	e59f3018 	ldr	r3, [pc, #24]	; f001945c <thread_setup_affinity+0x70>
f0019440:	e3a02000 	mov	r2, #0
f0019444:	e5832000 	str	r2, [r3]
f0019448:	e59f0008 	ldr	r0, [pc, #8]	; f0019458 <thread_setup_affinity+0x6c>
f001944c:	ebfffb28 	bl	f00180f4 <spin_unlock>
f0019450:	e24bd004 	sub	sp, fp, #4
f0019454:	e8bd8800 	pop	{fp, pc}
f0019458:	f002d024 	.word	0xf002d024
f001945c:	f002d028 	.word	0xf002d028

f0019460 <thread_setup_new_ids>:
f0019460:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f0019464:	e28db000 	add	fp, sp, #0
f0019468:	e24dd014 	sub	sp, sp, #20
f001946c:	e50b0008 	str	r0, [fp, #-8]
f0019470:	e50b100c 	str	r1, [fp, #-12]
f0019474:	e50b2010 	str	r2, [fp, #-16]
f0019478:	e50b3014 	str	r3, [fp, #-20]
f001947c:	e51b300c 	ldr	r3, [fp, #-12]
f0019480:	e2033501 	and	r3, r3, #4194304	; 0x400000
f0019484:	e3530000 	cmp	r3, #0
f0019488:	0a000004 	beq	f00194a0 <thread_setup_new_ids+0x40>
f001948c:	e51b3014 	ldr	r3, [fp, #-20]
f0019490:	e5932058 	ldr	r2, [r3, #88]	; 0x58
f0019494:	e51b3010 	ldr	r3, [fp, #-16]
f0019498:	e5832058 	str	r2, [r3, #88]	; 0x58
f001949c:	ea000003 	b	f00194b0 <thread_setup_new_ids+0x50>
f00194a0:	e51b3010 	ldr	r3, [fp, #-16]
f00194a4:	e5932054 	ldr	r2, [r3, #84]	; 0x54
f00194a8:	e51b3010 	ldr	r3, [fp, #-16]
f00194ac:	e5832058 	str	r2, [r3, #88]	; 0x58
f00194b0:	e51b3010 	ldr	r3, [fp, #-16]
f00194b4:	e5932054 	ldr	r2, [r3, #84]	; 0x54
f00194b8:	e51b3008 	ldr	r3, [fp, #-8]
f00194bc:	e5832000 	str	r2, [r3]
f00194c0:	e51b3010 	ldr	r3, [fp, #-16]
f00194c4:	e5932058 	ldr	r2, [r3, #88]	; 0x58
f00194c8:	e51b3008 	ldr	r3, [fp, #-8]
f00194cc:	e5832008 	str	r2, [r3, #8]
f00194d0:	e24bd000 	sub	sp, fp, #0
f00194d4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f00194d8:	e12fff1e 	bx	lr

f00194dc <thread_setup_space>:
f00194dc:	e92d4800 	push	{fp, lr}
f00194e0:	e28db004 	add	fp, sp, #4
f00194e4:	e24dd020 	sub	sp, sp, #32
f00194e8:	e50b0018 	str	r0, [fp, #-24]
f00194ec:	e50b101c 	str	r1, [fp, #-28]
f00194f0:	e50b2020 	str	r2, [fp, #-32]
f00194f4:	e3a03000 	mov	r3, #0
f00194f8:	e50b3008 	str	r3, [fp, #-8]
f00194fc:	e51b3020 	ldr	r3, [fp, #-32]
f0019500:	e2033401 	and	r3, r3, #16777216	; 0x1000000
f0019504:	e3530000 	cmp	r3, #0
f0019508:	0a000028 	beq	f00195b0 <thread_setup_space+0xd4>
f001950c:	ebfffb5e 	bl	f001828c <current_task>
f0019510:	e1a03000 	mov	r3, r0
f0019514:	e59330b8 	ldr	r3, [r3, #184]	; 0xb8
f0019518:	e2833018 	add	r3, r3, #24
f001951c:	e1a00003 	mov	r0, r3
f0019520:	ebfffaec 	bl	f00180d8 <spin_lock>
f0019524:	e51b301c 	ldr	r3, [fp, #-28]
f0019528:	e5933004 	ldr	r3, [r3, #4]
f001952c:	e1a00003 	mov	r0, r3
f0019530:	ebffc7b0 	bl	f000b3f8 <address_space_find>
f0019534:	e50b000c 	str	r0, [fp, #-12]
f0019538:	e51b300c 	ldr	r3, [fp, #-12]
f001953c:	e3530000 	cmp	r3, #0
f0019540:	1a000008 	bne	f0019568 <thread_setup_space+0x8c>
f0019544:	ebfffb50 	bl	f001828c <current_task>
f0019548:	e1a03000 	mov	r3, r0
f001954c:	e59330b8 	ldr	r3, [r3, #184]	; 0xb8
f0019550:	e2833018 	add	r3, r3, #24
f0019554:	e1a00003 	mov	r0, r3
f0019558:	ebfffae5 	bl	f00180f4 <spin_unlock>
f001955c:	e3e03002 	mvn	r3, #2
f0019560:	e50b3008 	str	r3, [fp, #-8]
f0019564:	ea00007f 	b	f0019768 <thread_setup_space+0x28c>
f0019568:	e51b300c 	ldr	r3, [fp, #-12]
f001956c:	e283300c 	add	r3, r3, #12
f0019570:	e1a00003 	mov	r0, r3
f0019574:	ebfffad7 	bl	f00180d8 <spin_lock>
f0019578:	ebfffb43 	bl	f001828c <current_task>
f001957c:	e1a03000 	mov	r3, r0
f0019580:	e59330b8 	ldr	r3, [r3, #184]	; 0xb8
f0019584:	e2833018 	add	r3, r3, #24
f0019588:	e1a00003 	mov	r0, r3
f001958c:	ebfffad8 	bl	f00180f4 <spin_unlock>
f0019590:	e51b0018 	ldr	r0, [fp, #-24]
f0019594:	e51b100c 	ldr	r1, [fp, #-12]
f0019598:	ebffc786 	bl	f000b3b8 <address_space_attach>
f001959c:	e51b300c 	ldr	r3, [fp, #-12]
f00195a0:	e283300c 	add	r3, r3, #12
f00195a4:	e1a00003 	mov	r0, r3
f00195a8:	ebfffad1 	bl	f00180f4 <spin_unlock>
f00195ac:	ea00006d 	b	f0019768 <thread_setup_space+0x28c>
f00195b0:	e51b3020 	ldr	r3, [fp, #-32]
f00195b4:	e2033402 	and	r3, r3, #33554432	; 0x2000000
f00195b8:	e3530000 	cmp	r3, #0
f00195bc:	0a000044 	beq	f00196d4 <thread_setup_space+0x1f8>
f00195c0:	ebfffb31 	bl	f001828c <current_task>
f00195c4:	e1a03000 	mov	r3, r0
f00195c8:	e59330b8 	ldr	r3, [r3, #184]	; 0xb8
f00195cc:	e2833018 	add	r3, r3, #24
f00195d0:	e1a00003 	mov	r0, r3
f00195d4:	ebfffabf 	bl	f00180d8 <spin_lock>
f00195d8:	e51b301c 	ldr	r3, [fp, #-28]
f00195dc:	e5933004 	ldr	r3, [r3, #4]
f00195e0:	e1a00003 	mov	r0, r3
f00195e4:	ebffc783 	bl	f000b3f8 <address_space_find>
f00195e8:	e50b000c 	str	r0, [fp, #-12]
f00195ec:	e51b300c 	ldr	r3, [fp, #-12]
f00195f0:	e3530000 	cmp	r3, #0
f00195f4:	1a000008 	bne	f001961c <thread_setup_space+0x140>
f00195f8:	ebfffb23 	bl	f001828c <current_task>
f00195fc:	e1a03000 	mov	r3, r0
f0019600:	e59330b8 	ldr	r3, [r3, #184]	; 0xb8
f0019604:	e2833018 	add	r3, r3, #24
f0019608:	e1a00003 	mov	r0, r3
f001960c:	ebfffab8 	bl	f00180f4 <spin_unlock>
f0019610:	e3e03002 	mvn	r3, #2
f0019614:	e50b3008 	str	r3, [fp, #-8]
f0019618:	ea000052 	b	f0019768 <thread_setup_space+0x28c>
f001961c:	e51b300c 	ldr	r3, [fp, #-12]
f0019620:	e283300c 	add	r3, r3, #12
f0019624:	e1a00003 	mov	r0, r3
f0019628:	ebfffaaa 	bl	f00180d8 <spin_lock>
f001962c:	e51b000c 	ldr	r0, [fp, #-12]
f0019630:	ebffc825 	bl	f000b6cc <address_space_create>
f0019634:	e50b0010 	str	r0, [fp, #-16]
f0019638:	e51b3010 	ldr	r3, [fp, #-16]
f001963c:	e1a00003 	mov	r0, r3
f0019640:	ebfffa2a 	bl	f0017ef0 <is_err>
f0019644:	e1a03000 	mov	r3, r0
f0019648:	e3530000 	cmp	r3, #0
f001964c:	0a00000c 	beq	f0019684 <thread_setup_space+0x1a8>
f0019650:	ebfffb0d 	bl	f001828c <current_task>
f0019654:	e1a03000 	mov	r3, r0
f0019658:	e59330b8 	ldr	r3, [r3, #184]	; 0xb8
f001965c:	e2833018 	add	r3, r3, #24
f0019660:	e1a00003 	mov	r0, r3
f0019664:	ebfffaa2 	bl	f00180f4 <spin_unlock>
f0019668:	e51b300c 	ldr	r3, [fp, #-12]
f001966c:	e283300c 	add	r3, r3, #12
f0019670:	e1a00003 	mov	r0, r3
f0019674:	ebfffa9e 	bl	f00180f4 <spin_unlock>
f0019678:	e51b3010 	ldr	r3, [fp, #-16]
f001967c:	e50b3008 	str	r3, [fp, #-8]
f0019680:	ea000038 	b	f0019768 <thread_setup_space+0x28c>
f0019684:	e51b300c 	ldr	r3, [fp, #-12]
f0019688:	e283300c 	add	r3, r3, #12
f001968c:	e1a00003 	mov	r0, r3
f0019690:	ebfffa97 	bl	f00180f4 <spin_unlock>
f0019694:	e51b3010 	ldr	r3, [fp, #-16]
f0019698:	e5932000 	ldr	r2, [r3]
f001969c:	e51b301c 	ldr	r3, [fp, #-28]
f00196a0:	e5832004 	str	r2, [r3, #4]
f00196a4:	e51b0018 	ldr	r0, [fp, #-24]
f00196a8:	e51b1010 	ldr	r1, [fp, #-16]
f00196ac:	ebffc741 	bl	f000b3b8 <address_space_attach>
f00196b0:	e51b0010 	ldr	r0, [fp, #-16]
f00196b4:	ebffc775 	bl	f000b490 <address_space_add>
f00196b8:	ebfffaf3 	bl	f001828c <current_task>
f00196bc:	e1a03000 	mov	r3, r0
f00196c0:	e59330b8 	ldr	r3, [r3, #184]	; 0xb8
f00196c4:	e2833018 	add	r3, r3, #24
f00196c8:	e1a00003 	mov	r0, r3
f00196cc:	ebfffa88 	bl	f00180f4 <spin_unlock>
f00196d0:	ea000024 	b	f0019768 <thread_setup_space+0x28c>
f00196d4:	e51b3020 	ldr	r3, [fp, #-32]
f00196d8:	e2033301 	and	r3, r3, #67108864	; 0x4000000
f00196dc:	e3530000 	cmp	r3, #0
f00196e0:	0a000020 	beq	f0019768 <thread_setup_space+0x28c>
f00196e4:	e3a00000 	mov	r0, #0
f00196e8:	ebffc7f7 	bl	f000b6cc <address_space_create>
f00196ec:	e50b0010 	str	r0, [fp, #-16]
f00196f0:	e51b3010 	ldr	r3, [fp, #-16]
f00196f4:	e1a00003 	mov	r0, r3
f00196f8:	ebfff9fc 	bl	f0017ef0 <is_err>
f00196fc:	e1a03000 	mov	r3, r0
f0019700:	e3530000 	cmp	r3, #0
f0019704:	0a000002 	beq	f0019714 <thread_setup_space+0x238>
f0019708:	e51b3010 	ldr	r3, [fp, #-16]
f001970c:	e50b3008 	str	r3, [fp, #-8]
f0019710:	ea000014 	b	f0019768 <thread_setup_space+0x28c>
f0019714:	e51b3010 	ldr	r3, [fp, #-16]
f0019718:	e5932000 	ldr	r2, [r3]
f001971c:	e51b301c 	ldr	r3, [fp, #-28]
f0019720:	e5832004 	str	r2, [r3, #4]
f0019724:	e51b0018 	ldr	r0, [fp, #-24]
f0019728:	e51b1010 	ldr	r1, [fp, #-16]
f001972c:	ebffc721 	bl	f000b3b8 <address_space_attach>
f0019730:	ebfffad5 	bl	f001828c <current_task>
f0019734:	e1a03000 	mov	r3, r0
f0019738:	e59330b8 	ldr	r3, [r3, #184]	; 0xb8
f001973c:	e2833018 	add	r3, r3, #24
f0019740:	e1a00003 	mov	r0, r3
f0019744:	ebfffa63 	bl	f00180d8 <spin_lock>
f0019748:	e51b0010 	ldr	r0, [fp, #-16]
f001974c:	ebffc74f 	bl	f000b490 <address_space_add>
f0019750:	ebfffacd 	bl	f001828c <current_task>
f0019754:	e1a03000 	mov	r3, r0
f0019758:	e59330b8 	ldr	r3, [r3, #184]	; 0xb8
f001975c:	e2833018 	add	r3, r3, #24
f0019760:	e1a00003 	mov	r0, r3
f0019764:	ebfffa62 	bl	f00180f4 <spin_unlock>
f0019768:	e51b3008 	ldr	r3, [fp, #-8]
f001976c:	e1a00003 	mov	r0, r3
f0019770:	e24bd004 	sub	sp, fp, #4
f0019774:	e8bd8800 	pop	{fp, pc}

f0019778 <thread_create>:
f0019778:	e92d4800 	push	{fp, lr}
f001977c:	e28db004 	add	fp, sp, #4
f0019780:	e24dd018 	sub	sp, sp, #24
f0019784:	e50b0018 	str	r0, [fp, #-24]
f0019788:	e50b101c 	str	r1, [fp, #-28]
f001978c:	e3a03000 	mov	r3, #0
f0019790:	e50b3008 	str	r3, [fp, #-8]
f0019794:	e51b301c 	ldr	r3, [fp, #-28]
f0019798:	e20336ff 	and	r3, r3, #267386880	; 0xff00000
f001979c:	e50b301c 	str	r3, [fp, #-28]
f00197a0:	e51b301c 	ldr	r3, [fp, #-28]
f00197a4:	e3530000 	cmp	r3, #0
f00197a8:	1a000001 	bne	f00197b4 <thread_create+0x3c>
f00197ac:	e3e03015 	mvn	r3, #21
f00197b0:	ea00006a 	b	f0019960 <thread_create+0x1e8>
f00197b4:	e51b301c 	ldr	r3, [fp, #-28]
f00197b8:	e203340f 	and	r3, r3, #251658240	; 0xf000000
f00197bc:	e3530000 	cmp	r3, #0
f00197c0:	1a000001 	bne	f00197cc <thread_create+0x54>
f00197c4:	e3e03015 	mvn	r3, #21
f00197c8:	ea000064 	b	f0019960 <thread_create+0x1e8>
f00197cc:	e51b301c 	ldr	r3, [fp, #-28]
f00197d0:	e2033401 	and	r3, r3, #16777216	; 0x1000000
f00197d4:	e3530000 	cmp	r3, #0
f00197d8:	1a000009 	bne	f0019804 <thread_create+0x8c>
f00197dc:	e51b301c 	ldr	r3, [fp, #-28]
f00197e0:	e2033602 	and	r3, r3, #2097152	; 0x200000
f00197e4:	e3530000 	cmp	r3, #0
f00197e8:	1a000003 	bne	f00197fc <thread_create+0x84>
f00197ec:	e51b301c 	ldr	r3, [fp, #-28]
f00197f0:	e2033501 	and	r3, r3, #4194304	; 0x400000
f00197f4:	e3530000 	cmp	r3, #0
f00197f8:	0a000001 	beq	f0019804 <thread_create+0x8c>
f00197fc:	e3e03015 	mvn	r3, #21
f0019800:	ea000056 	b	f0019960 <thread_create+0x1e8>
f0019804:	ebfffaa0 	bl	f001828c <current_task>
f0019808:	e1a03000 	mov	r3, r0
f001980c:	e59330b8 	ldr	r3, [r3, #184]	; 0xb8
f0019810:	e5933000 	ldr	r3, [r3]
f0019814:	e1a00003 	mov	r0, r3
f0019818:	ebffc1b3 	bl	f0009eec <tcb_alloc_init>
f001981c:	e50b0010 	str	r0, [fp, #-16]
f0019820:	e51b3010 	ldr	r3, [fp, #-16]
f0019824:	e3530000 	cmp	r3, #0
f0019828:	1a000001 	bne	f0019834 <thread_create+0xbc>
f001982c:	e3e0300b 	mvn	r3, #11
f0019830:	ea00004a 	b	f0019960 <thread_create+0x1e8>
f0019834:	e51b0010 	ldr	r0, [fp, #-16]
f0019838:	e51b1018 	ldr	r1, [fp, #-24]
f001983c:	e51b201c 	ldr	r2, [fp, #-28]
f0019840:	ebffff25 	bl	f00194dc <thread_setup_space>
f0019844:	e50b000c 	str	r0, [fp, #-12]
f0019848:	e51b300c 	ldr	r3, [fp, #-12]
f001984c:	e3530000 	cmp	r3, #0
f0019850:	aa000000 	bge	f0019858 <thread_create+0xe0>
f0019854:	ea000039 	b	f0019940 <thread_create+0x1c8>
f0019858:	e51b301c 	ldr	r3, [fp, #-28]
f001985c:	e2033401 	and	r3, r3, #16777216	; 0x1000000
f0019860:	e3530000 	cmp	r3, #0
f0019864:	1a000003 	bne	f0019878 <thread_create+0x100>
f0019868:	e51b301c 	ldr	r3, [fp, #-28]
f001986c:	e2033402 	and	r3, r3, #33554432	; 0x2000000
f0019870:	e3530000 	cmp	r3, #0
f0019874:	0a00000a 	beq	f00198a4 <thread_create+0x12c>
f0019878:	e51b3018 	ldr	r3, [fp, #-24]
f001987c:	e5933000 	ldr	r3, [r3]
f0019880:	e1a00003 	mov	r0, r3
f0019884:	ebffc43d 	bl	f000a980 <tcb_find>
f0019888:	e50b0008 	str	r0, [fp, #-8]
f001988c:	e51b3008 	ldr	r3, [fp, #-8]
f0019890:	e3530000 	cmp	r3, #0
f0019894:	1a000002 	bne	f00198a4 <thread_create+0x12c>
f0019898:	e3e03015 	mvn	r3, #21
f001989c:	e50b300c 	str	r3, [fp, #-12]
f00198a0:	ea000026 	b	f0019940 <thread_create+0x1c8>
f00198a4:	ebfffa78 	bl	f001828c <current_task>
f00198a8:	e1a02000 	mov	r2, r0
f00198ac:	e51b3010 	ldr	r3, [fp, #-16]
f00198b0:	e58320bc 	str	r2, [r3, #188]	; 0xbc
f00198b4:	ebfffa74 	bl	f001828c <current_task>
f00198b8:	e1a03000 	mov	r3, r0
f00198bc:	e283307c 	add	r3, r3, #124	; 0x7c
f00198c0:	e1a00003 	mov	r0, r3
f00198c4:	ebfffa03 	bl	f00180d8 <spin_lock>
f00198c8:	ebfffa6f 	bl	f001828c <current_task>
f00198cc:	e1a03000 	mov	r3, r0
f00198d0:	e59320c0 	ldr	r2, [r3, #192]	; 0xc0
f00198d4:	e2822001 	add	r2, r2, #1
f00198d8:	e58320c0 	str	r2, [r3, #192]	; 0xc0
f00198dc:	ebfffa6a 	bl	f001828c <current_task>
f00198e0:	e1a03000 	mov	r3, r0
f00198e4:	e283307c 	add	r3, r3, #124	; 0x7c
f00198e8:	e1a00003 	mov	r0, r3
f00198ec:	ebfffa00 	bl	f00180f4 <spin_unlock>
f00198f0:	ebfffa65 	bl	f001828c <current_task>
f00198f4:	e1a03000 	mov	r3, r0
f00198f8:	e59320b8 	ldr	r2, [r3, #184]	; 0xb8
f00198fc:	e51b3010 	ldr	r3, [fp, #-16]
f0019900:	e58320b8 	str	r2, [r3, #184]	; 0xb8
f0019904:	e51b0010 	ldr	r0, [fp, #-16]
f0019908:	ebfffeb7 	bl	f00193ec <thread_setup_affinity>
f001990c:	e51b0018 	ldr	r0, [fp, #-24]
f0019910:	e51b101c 	ldr	r1, [fp, #-28]
f0019914:	e51b2010 	ldr	r2, [fp, #-16]
f0019918:	e51b3008 	ldr	r3, [fp, #-8]
f001991c:	ebfffecf 	bl	f0019460 <thread_setup_new_ids>
f0019920:	e51b0010 	ldr	r0, [fp, #-16]
f0019924:	e51b1008 	ldr	r1, [fp, #-8]
f0019928:	e51b201c 	ldr	r2, [fp, #-28]
f001992c:	ebfffd72 	bl	f0018efc <arch_setup_new_thread>
f0019930:	e51b0010 	ldr	r0, [fp, #-16]
f0019934:	ebffc4b0 	bl	f000abfc <tcb_add>
f0019938:	e3a03000 	mov	r3, #0
f001993c:	ea000007 	b	f0019960 <thread_create+0x1e8>
f0019940:	ebfffa51 	bl	f001828c <current_task>
f0019944:	e1a03000 	mov	r3, r0
f0019948:	e59330b4 	ldr	r3, [r3, #180]	; 0xb4
f001994c:	e2833014 	add	r3, r3, #20
f0019950:	e51b0010 	ldr	r0, [fp, #-16]
f0019954:	e1a01003 	mov	r1, r3
f0019958:	ebffc9df 	bl	f000c0dc <ktcb_cap_free>
f001995c:	e51b300c 	ldr	r3, [fp, #-12]
f0019960:	e1a00003 	mov	r0, r3
f0019964:	e24bd004 	sub	sp, fp, #4
f0019968:	e8bd8800 	pop	{fp, pc}

f001996c <sys_thread_control>:
f001996c:	e92d4810 	push	{r4, fp, lr}
f0019970:	e28db008 	add	fp, sp, #8
f0019974:	e24dd01c 	sub	sp, sp, #28
f0019978:	e50b0020 	str	r0, [fp, #-32]
f001997c:	e50b1024 	str	r1, [fp, #-36]	; 0x24
f0019980:	e3a03000 	mov	r3, #0
f0019984:	e50b3010 	str	r3, [fp, #-16]
f0019988:	e3a03000 	mov	r3, #0
f001998c:	e50b3014 	str	r3, [fp, #-20]
f0019990:	e51b3024 	ldr	r3, [fp, #-36]	; 0x24
f0019994:	e1a00003 	mov	r0, r3
f0019998:	e3a0100c 	mov	r1, #12
f001999c:	e3a02001 	mov	r2, #1
f00199a0:	e3a03001 	mov	r3, #1
f00199a4:	ebffc7d1 	bl	f000b8f0 <check_access>
f00199a8:	e50b0018 	str	r0, [fp, #-24]
f00199ac:	e51b3018 	ldr	r3, [fp, #-24]
f00199b0:	e3530000 	cmp	r3, #0
f00199b4:	aa000001 	bge	f00199c0 <sys_thread_control+0x54>
f00199b8:	e51b3018 	ldr	r3, [fp, #-24]
f00199bc:	ea000053 	b	f0019b10 <sys_thread_control+0x1a4>
f00199c0:	e51b3020 	ldr	r3, [fp, #-32]
f00199c4:	e203320f 	and	r3, r3, #-268435456	; 0xf0000000
f00199c8:	e3530000 	cmp	r3, #0
f00199cc:	0a000016 	beq	f0019a2c <sys_thread_control+0xc0>
f00199d0:	e51b3024 	ldr	r3, [fp, #-36]	; 0x24
f00199d4:	e5933000 	ldr	r3, [r3]
f00199d8:	e1a00003 	mov	r0, r3
f00199dc:	ebffc3e7 	bl	f000a980 <tcb_find>
f00199e0:	e50b0010 	str	r0, [fp, #-16]
f00199e4:	e51b3010 	ldr	r3, [fp, #-16]
f00199e8:	e3530000 	cmp	r3, #0
f00199ec:	1a000001 	bne	f00199f8 <sys_thread_control+0x8c>
f00199f0:	e3e03002 	mvn	r3, #2
f00199f4:	ea000045 	b	f0019b10 <sys_thread_control+0x1a4>
f00199f8:	ebfffa23 	bl	f001828c <current_task>
f00199fc:	e1a03000 	mov	r3, r0
f0019a00:	e59330b4 	ldr	r3, [r3, #180]	; 0xb4
f0019a04:	e5934000 	ldr	r4, [r3]
f0019a08:	ebfffa1f 	bl	f001828c <current_task>
f0019a0c:	e1a03000 	mov	r3, r0
f0019a10:	e59330bc 	ldr	r3, [r3, #188]	; 0xbc
f0019a14:	e59330b4 	ldr	r3, [r3, #180]	; 0xb4
f0019a18:	e5933000 	ldr	r3, [r3]
f0019a1c:	e1540003 	cmp	r4, r3
f0019a20:	0a000001 	beq	f0019a2c <sys_thread_control+0xc0>
f0019a24:	e3e03000 	mvn	r3, #0
f0019a28:	ea000038 	b	f0019b10 <sys_thread_control+0x1a4>
f0019a2c:	e51b0010 	ldr	r0, [fp, #-16]
f0019a30:	e51b1020 	ldr	r1, [fp, #-32]
f0019a34:	e51b2024 	ldr	r2, [fp, #-36]	; 0x24
f0019a38:	ebffd740 	bl	f000f740 <cap_thread_check>
f0019a3c:	e50b0018 	str	r0, [fp, #-24]
f0019a40:	e51b3018 	ldr	r3, [fp, #-24]
f0019a44:	e3530000 	cmp	r3, #0
f0019a48:	aa000001 	bge	f0019a54 <sys_thread_control+0xe8>
f0019a4c:	e51b3018 	ldr	r3, [fp, #-24]
f0019a50:	ea00002e 	b	f0019b10 <sys_thread_control+0x1a4>
f0019a54:	e51b3020 	ldr	r3, [fp, #-32]
f0019a58:	e203320f 	and	r3, r3, #-268435456	; 0xf0000000
f0019a5c:	e3530202 	cmp	r3, #536870912	; 0x20000000
f0019a60:	0a000016 	beq	f0019ac0 <sys_thread_control+0x154>
f0019a64:	e3530202 	cmp	r3, #536870912	; 0x20000000
f0019a68:	8a000004 	bhi	f0019a80 <sys_thread_control+0x114>
f0019a6c:	e3530000 	cmp	r3, #0
f0019a70:	0a000009 	beq	f0019a9c <sys_thread_control+0x130>
f0019a74:	e3530201 	cmp	r3, #268435456	; 0x10000000
f0019a78:	0a00000c 	beq	f0019ab0 <sys_thread_control+0x144>
f0019a7c:	ea000020 	b	f0019b04 <sys_thread_control+0x198>
f0019a80:	e3530101 	cmp	r3, #1073741824	; 0x40000000
f0019a84:	0a000016 	beq	f0019ae4 <sys_thread_control+0x178>
f0019a88:	e3530205 	cmp	r3, #1342177280	; 0x50000000
f0019a8c:	0a000018 	beq	f0019af4 <sys_thread_control+0x188>
f0019a90:	e3530203 	cmp	r3, #805306368	; 0x30000000
f0019a94:	0a00000d 	beq	f0019ad0 <sys_thread_control+0x164>
f0019a98:	ea000019 	b	f0019b04 <sys_thread_control+0x198>
f0019a9c:	e51b0024 	ldr	r0, [fp, #-36]	; 0x24
f0019aa0:	e51b1020 	ldr	r1, [fp, #-32]
f0019aa4:	ebffff33 	bl	f0019778 <thread_create>
f0019aa8:	e50b0014 	str	r0, [fp, #-20]
f0019aac:	ea000016 	b	f0019b0c <sys_thread_control+0x1a0>
f0019ab0:	e51b0010 	ldr	r0, [fp, #-16]
f0019ab4:	ebfffcf9 	bl	f0018ea0 <thread_start>
f0019ab8:	e50b0014 	str	r0, [fp, #-20]
f0019abc:	ea000012 	b	f0019b0c <sys_thread_control+0x1a0>
f0019ac0:	e51b0010 	ldr	r0, [fp, #-16]
f0019ac4:	ebfffa63 	bl	f0018458 <thread_suspend>
f0019ac8:	e50b0014 	str	r0, [fp, #-20]
f0019acc:	ea00000e 	b	f0019b0c <sys_thread_control+0x1a0>
f0019ad0:	e51b0010 	ldr	r0, [fp, #-16]
f0019ad4:	e51b1020 	ldr	r1, [fp, #-32]
f0019ad8:	ebfffc13 	bl	f0018b2c <thread_destroy>
f0019adc:	e50b0014 	str	r0, [fp, #-20]
f0019ae0:	ea000009 	b	f0019b0c <sys_thread_control+0x1a0>
f0019ae4:	e51b0010 	ldr	r0, [fp, #-16]
f0019ae8:	ebfffcc3 	bl	f0018dfc <thread_recycle>
f0019aec:	e50b0014 	str	r0, [fp, #-20]
f0019af0:	ea000005 	b	f0019b0c <sys_thread_control+0x1a0>
f0019af4:	e51b0010 	ldr	r0, [fp, #-16]
f0019af8:	ebfffb8f 	bl	f001893c <thread_wait>
f0019afc:	e50b0014 	str	r0, [fp, #-20]
f0019b00:	ea000001 	b	f0019b0c <sys_thread_control+0x1a0>
f0019b04:	e3e03015 	mvn	r3, #21
f0019b08:	e50b3014 	str	r3, [fp, #-20]
f0019b0c:	e51b3014 	ldr	r3, [fp, #-20]
f0019b10:	e1a00003 	mov	r0, r3
f0019b14:	e24bd008 	sub	sp, fp, #8
f0019b18:	e8bd8810 	pop	{r4, fp, pc}

f0019b1c <list_insert_tail>:
f0019b1c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f0019b20:	e28db000 	add	fp, sp, #0
f0019b24:	e24dd014 	sub	sp, sp, #20
f0019b28:	e50b0010 	str	r0, [fp, #-16]
f0019b2c:	e50b1014 	str	r1, [fp, #-20]
f0019b30:	e51b3014 	ldr	r3, [fp, #-20]
f0019b34:	e5933004 	ldr	r3, [r3, #4]
f0019b38:	e50b3008 	str	r3, [fp, #-8]
f0019b3c:	e51b3010 	ldr	r3, [fp, #-16]
f0019b40:	e51b2014 	ldr	r2, [fp, #-20]
f0019b44:	e5832000 	str	r2, [r3]
f0019b48:	e51b3014 	ldr	r3, [fp, #-20]
f0019b4c:	e51b2010 	ldr	r2, [fp, #-16]
f0019b50:	e5832004 	str	r2, [r3, #4]
f0019b54:	e51b3010 	ldr	r3, [fp, #-16]
f0019b58:	e51b2008 	ldr	r2, [fp, #-8]
f0019b5c:	e5832004 	str	r2, [r3, #4]
f0019b60:	e51b3008 	ldr	r3, [fp, #-8]
f0019b64:	e51b2010 	ldr	r2, [fp, #-16]
f0019b68:	e5832000 	str	r2, [r3]
f0019b6c:	e24bd000 	sub	sp, fp, #0
f0019b70:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0019b74:	e12fff1e 	bx	lr

f0019b78 <list_remove_init>:
f0019b78:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f0019b7c:	e28db000 	add	fp, sp, #0
f0019b80:	e24dd014 	sub	sp, sp, #20
f0019b84:	e50b0010 	str	r0, [fp, #-16]
f0019b88:	e51b3010 	ldr	r3, [fp, #-16]
f0019b8c:	e5933004 	ldr	r3, [r3, #4]
f0019b90:	e50b3008 	str	r3, [fp, #-8]
f0019b94:	e51b3010 	ldr	r3, [fp, #-16]
f0019b98:	e5933000 	ldr	r3, [r3]
f0019b9c:	e50b300c 	str	r3, [fp, #-12]
f0019ba0:	e51b3008 	ldr	r3, [fp, #-8]
f0019ba4:	e51b200c 	ldr	r2, [fp, #-12]
f0019ba8:	e5832000 	str	r2, [r3]
f0019bac:	e51b300c 	ldr	r3, [fp, #-12]
f0019bb0:	e51b2008 	ldr	r2, [fp, #-8]
f0019bb4:	e5832004 	str	r2, [r3, #4]
f0019bb8:	e51b3010 	ldr	r3, [fp, #-16]
f0019bbc:	e51b2010 	ldr	r2, [fp, #-16]
f0019bc0:	e5832000 	str	r2, [r3]
f0019bc4:	e51b3010 	ldr	r3, [fp, #-16]
f0019bc8:	e51b2010 	ldr	r2, [fp, #-16]
f0019bcc:	e5832004 	str	r2, [r3, #4]
f0019bd0:	e24bd000 	sub	sp, fp, #0
f0019bd4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0019bd8:	e12fff1e 	bx	lr

f0019bdc <list_empty>:
f0019bdc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f0019be0:	e28db000 	add	fp, sp, #0
f0019be4:	e24dd00c 	sub	sp, sp, #12
f0019be8:	e50b0008 	str	r0, [fp, #-8]
f0019bec:	e51b3008 	ldr	r3, [fp, #-8]
f0019bf0:	e5932004 	ldr	r2, [r3, #4]
f0019bf4:	e51b3008 	ldr	r3, [fp, #-8]
f0019bf8:	e1520003 	cmp	r2, r3
f0019bfc:	1a000006 	bne	f0019c1c <list_empty+0x40>
f0019c00:	e51b3008 	ldr	r3, [fp, #-8]
f0019c04:	e5932000 	ldr	r2, [r3]
f0019c08:	e51b3008 	ldr	r3, [fp, #-8]
f0019c0c:	e1520003 	cmp	r2, r3
f0019c10:	1a000001 	bne	f0019c1c <list_empty+0x40>
f0019c14:	e3a03001 	mov	r3, #1
f0019c18:	ea000000 	b	f0019c20 <list_empty+0x44>
f0019c1c:	e3a03000 	mov	r3, #0
f0019c20:	e1a00003 	mov	r0, r3
f0019c24:	e24bd000 	sub	sp, fp, #0
f0019c28:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0019c2c:	e12fff1e 	bx	lr

f0019c30 <spin_lock>:
f0019c30:	e92d4800 	push	{fp, lr}
f0019c34:	e28db004 	add	fp, sp, #4
f0019c38:	e24dd008 	sub	sp, sp, #8
f0019c3c:	e50b0008 	str	r0, [fp, #-8]
f0019c40:	ebffbb51 	bl	f000898c <preempt_disable>
f0019c44:	e24bd004 	sub	sp, fp, #4
f0019c48:	e8bd8800 	pop	{fp, pc}

f0019c4c <spin_unlock>:
f0019c4c:	e92d4800 	push	{fp, lr}
f0019c50:	e28db004 	add	fp, sp, #4
f0019c54:	e24dd008 	sub	sp, sp, #8
f0019c58:	e50b0008 	str	r0, [fp, #-8]
f0019c5c:	ebffbb39 	bl	f0008948 <preempt_enable>
f0019c60:	e24bd004 	sub	sp, fp, #4
f0019c64:	e8bd8800 	pop	{fp, pc}

f0019c68 <current_task>:
f0019c68:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f0019c6c:	e28db000 	add	fp, sp, #0
f0019c70:	e1a0300d 	mov	r3, sp
f0019c74:	e3c33eff 	bic	r3, r3, #4080	; 0xff0
f0019c78:	e3c3300f 	bic	r3, r3, #15
f0019c7c:	e1a00003 	mov	r0, r3
f0019c80:	e24bd000 	sub	sp, fp, #0
f0019c84:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0019c88:	e12fff1e 	bx	lr

f0019c8c <tid_special_value>:
f0019c8c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f0019c90:	e28db000 	add	fp, sp, #0
f0019c94:	e24dd00c 	sub	sp, sp, #12
f0019c98:	e50b0008 	str	r0, [fp, #-8]
f0019c9c:	e51b3008 	ldr	r3, [fp, #-8]
f0019ca0:	e20334ff 	and	r3, r3, #-16777216	; 0xff000000
f0019ca4:	e35304ff 	cmp	r3, #-16777216	; 0xff000000
f0019ca8:	13a03000 	movne	r3, #0
f0019cac:	03a03001 	moveq	r3, #1
f0019cb0:	e20330ff 	and	r3, r3, #255	; 0xff
f0019cb4:	e1a00003 	mov	r0, r3
f0019cb8:	e24bd000 	sub	sp, fp, #0
f0019cbc:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0019cc0:	e12fff1e 	bx	lr

f0019cc4 <min>:
f0019cc4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f0019cc8:	e28db000 	add	fp, sp, #0
f0019ccc:	e24dd00c 	sub	sp, sp, #12
f0019cd0:	e50b0008 	str	r0, [fp, #-8]
f0019cd4:	e50b100c 	str	r1, [fp, #-12]
f0019cd8:	e51b200c 	ldr	r2, [fp, #-12]
f0019cdc:	e51b3008 	ldr	r3, [fp, #-8]
f0019ce0:	e1530002 	cmp	r3, r2
f0019ce4:	a1a03002 	movge	r3, r2
f0019ce8:	e1a00003 	mov	r0, r3
f0019cec:	e24bd000 	sub	sp, fp, #0
f0019cf0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0019cf4:	e12fff1e 	bx	lr

f0019cf8 <extended_ipc_msg_index>:
f0019cf8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f0019cfc:	e28db000 	add	fp, sp, #0
f0019d00:	e24dd00c 	sub	sp, sp, #12
f0019d04:	e50b0008 	str	r0, [fp, #-8]
f0019d08:	e51b3008 	ldr	r3, [fp, #-8]
f0019d0c:	e2033eff 	and	r3, r3, #4080	; 0xff0
f0019d10:	e1a03223 	lsr	r3, r3, #4
f0019d14:	e1a00003 	mov	r0, r3
f0019d18:	e24bd000 	sub	sp, fp, #0
f0019d1c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0019d20:	e12fff1e 	bx	lr

f0019d24 <extended_ipc_msg_size>:
f0019d24:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f0019d28:	e28db000 	add	fp, sp, #0
f0019d2c:	e24dd00c 	sub	sp, sp, #12
f0019d30:	e50b0008 	str	r0, [fp, #-8]
f0019d34:	e51b2008 	ldr	r2, [fp, #-8]
f0019d38:	e59f3014 	ldr	r3, [pc, #20]	; f0019d54 <extended_ipc_msg_size+0x30>
f0019d3c:	e0023003 	and	r3, r2, r3
f0019d40:	e1a03823 	lsr	r3, r3, #16
f0019d44:	e1a00003 	mov	r0, r3
f0019d48:	e24bd000 	sub	sp, fp, #0
f0019d4c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0019d50:	e12fff1e 	bx	lr
f0019d54:	0fff0000 	.word	0x0fff0000

f0019d58 <tcb_set_ipc_flags>:
f0019d58:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f0019d5c:	e28db000 	add	fp, sp, #0
f0019d60:	e24dd00c 	sub	sp, sp, #12
f0019d64:	e50b0008 	str	r0, [fp, #-8]
f0019d68:	e50b100c 	str	r1, [fp, #-12]
f0019d6c:	e51b3008 	ldr	r3, [fp, #-8]
f0019d70:	e51b200c 	ldr	r2, [fp, #-12]
f0019d74:	e5832064 	str	r2, [r3, #100]	; 0x64
f0019d78:	e24bd000 	sub	sp, fp, #0
f0019d7c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0019d80:	e12fff1e 	bx	lr

f0019d84 <ipc_flags_get_type>:
f0019d84:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f0019d88:	e28db000 	add	fp, sp, #0
f0019d8c:	e24dd00c 	sub	sp, sp, #12
f0019d90:	e50b0008 	str	r0, [fp, #-8]
f0019d94:	e51b3008 	ldr	r3, [fp, #-8]
f0019d98:	e203300f 	and	r3, r3, #15
f0019d9c:	e1a00003 	mov	r0, r3
f0019da0:	e24bd000 	sub	sp, fp, #0
f0019da4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f0019da8:	e12fff1e 	bx	lr

f0019dac <tcb_get_ipc_type>:
f0019dac:	e92d4800 	push	{fp, lr}
f0019db0:	e28db004 	add	fp, sp, #4
f0019db4:	e24dd008 	sub	sp, sp, #8
f0019db8:	e50b0008 	str	r0, [fp, #-8]
f0019dbc:	e51b3008 	ldr	r3, [fp, #-8]
f0019dc0:	e5933064 	ldr	r3, [r3, #100]	; 0x64
f0019dc4:	e1a00003 	mov	r0, r3
f0019dc8:	ebffffed 	bl	f0019d84 <ipc_flags_get_type>
f0019dcc:	e1a03000 	mov	r3, r0
f0019dd0:	e1a00003 	mov	r0, r3
f0019dd4:	e24bd004 	sub	sp, fp, #4
f0019dd8:	e8bd8800 	pop	{fp, pc}

f0019ddc <ipc_short_copy>:
f0019ddc:	e92d4800 	push	{fp, lr}
f0019de0:	e28db004 	add	fp, sp, #4
f0019de4:	e24dd010 	sub	sp, sp, #16
f0019de8:	e50b0010 	str	r0, [fp, #-16]
f0019dec:	e50b1014 	str	r1, [fp, #-20]
f0019df0:	e51b3014 	ldr	r3, [fp, #-20]
f0019df4:	e5933044 	ldr	r3, [r3, #68]	; 0x44
f0019df8:	e2833010 	add	r3, r3, #16
f0019dfc:	e50b3008 	str	r3, [fp, #-8]
f0019e00:	e51b3010 	ldr	r3, [fp, #-16]
f0019e04:	e5933044 	ldr	r3, [r3, #68]	; 0x44
f0019e08:	e2833010 	add	r3, r3, #16
f0019e0c:	e50b300c 	str	r3, [fp, #-12]
f0019e10:	e51b000c 	ldr	r0, [fp, #-12]
f0019e14:	e51b1008 	ldr	r1, [fp, #-8]
f0019e18:	e3a02018 	mov	r2, #24
f0019e1c:	ebfff06b 	bl	f0015fd0 <memcpy>
f0019e20:	e3a03000 	mov	r3, #0
f0019e24:	e1a00003 	mov	r0, r3
f0019e28:	e24bd004 	sub	sp, fp, #4
f0019e2c:	e8bd8800 	pop	{fp, pc}

f0019e30 <ipc_full_copy>:
f0019e30:	e92d4800 	push	{fp, lr}
f0019e34:	e28db004 	add	fp, sp, #4
f0019e38:	e24dd018 	sub	sp, sp, #24
f0019e3c:	e50b0018 	str	r0, [fp, #-24]
f0019e40:	e50b101c 	str	r1, [fp, #-28]
f0019e44:	e51b301c 	ldr	r3, [fp, #-28]
f0019e48:	e5933090 	ldr	r3, [r3, #144]	; 0x90
f0019e4c:	e50b3008 	str	r3, [fp, #-8]
f0019e50:	e51b3018 	ldr	r3, [fp, #-24]
f0019e54:	e5933090 	ldr	r3, [r3, #144]	; 0x90
f0019e58:	e50b300c 	str	r3, [fp, #-12]
f0019e5c:	e51b0018 	ldr	r0, [fp, #-24]
f0019e60:	e51b101c 	ldr	r1, [fp, #-28]
f0019e64:	ebffffdc 	bl	f0019ddc <ipc_short_copy>
f0019e68:	e50b0010 	str	r0, [fp, #-16]
f0019e6c:	e51b3010 	ldr	r3, [fp, #-16]
f0019e70:	e3530000 	cmp	r3, #0
f0019e74:	aa000001 	bge	f0019e80 <ipc_full_copy+0x50>
f0019e78:	e51b3010 	ldr	r3, [fp, #-16]
f0019e7c:	ea00001a 	b	f0019eec <ipc_full_copy+0xbc>
f0019e80:	e51b0018 	ldr	r0, [fp, #-24]
f0019e84:	e3a01001 	mov	r1, #1
f0019e88:	ebffc457 	bl	f000afec <tcb_check_and_lazy_map_utcb>
f0019e8c:	e50b0010 	str	r0, [fp, #-16]
f0019e90:	e51b3010 	ldr	r3, [fp, #-16]
f0019e94:	e3530000 	cmp	r3, #0
f0019e98:	aa000001 	bge	f0019ea4 <ipc_full_copy+0x74>
f0019e9c:	e51b3010 	ldr	r3, [fp, #-16]
f0019ea0:	ea000011 	b	f0019eec <ipc_full_copy+0xbc>
f0019ea4:	e51b001c 	ldr	r0, [fp, #-28]
f0019ea8:	e3a01001 	mov	r1, #1
f0019eac:	ebffc44e 	bl	f000afec <tcb_check_and_lazy_map_utcb>
f0019eb0:	e50b0010 	str	r0, [fp, #-16]
f0019eb4:	e51b3010 	ldr	r3, [fp, #-16]
f0019eb8:	e3530000 	cmp	r3, #0
f0019ebc:	aa000001 	bge	f0019ec8 <ipc_full_copy+0x98>
f0019ec0:	e51b3010 	ldr	r3, [fp, #-16]
f0019ec4:	ea000008 	b	f0019eec <ipc_full_copy+0xbc>
f0019ec8:	e51b300c 	ldr	r3, [fp, #-12]
f0019ecc:	e2832028 	add	r2, r3, #40	; 0x28
f0019ed0:	e51b3008 	ldr	r3, [fp, #-8]
f0019ed4:	e2833028 	add	r3, r3, #40	; 0x28
f0019ed8:	e1a00002 	mov	r0, r2
f0019edc:	e1a01003 	mov	r1, r3
f0019ee0:	e3a020d8 	mov	r2, #216	; 0xd8
f0019ee4:	ebfff039 	bl	f0015fd0 <memcpy>
f0019ee8:	e3a03000 	mov	r3, #0
f0019eec:	e1a00003 	mov	r0, r3
f0019ef0:	e24bd004 	sub	sp, fp, #4
f0019ef4:	e8bd8800 	pop	{fp, pc}

f0019ef8 <ipc_extended_copy>:
f0019ef8:	e92d4800 	push	{fp, lr}
f0019efc:	e28db004 	add	fp, sp, #4
f0019f00:	e24dd010 	sub	sp, sp, #16
f0019f04:	e50b0010 	str	r0, [fp, #-16]
f0019f08:	e50b1014 	str	r1, [fp, #-20]
f0019f0c:	e51b3014 	ldr	r3, [fp, #-20]
f0019f10:	e5933114 	ldr	r3, [r3, #276]	; 0x114
f0019f14:	e1a02003 	mov	r2, r3
f0019f18:	e51b3010 	ldr	r3, [fp, #-16]
f0019f1c:	e5933114 	ldr	r3, [r3, #276]	; 0x114
f0019f20:	e1a00002 	mov	r0, r2
f0019f24:	e1a01003 	mov	r1, r3
f0019f28:	ebffff65 	bl	f0019cc4 <min>
f0019f2c:	e1a03000 	mov	r3, r0
f0019f30:	e50b3008 	str	r3, [fp, #-8]
f0019f34:	e51b3010 	ldr	r3, [fp, #-16]
f0019f38:	e2831f46 	add	r1, r3, #280	; 0x118
f0019f3c:	e51b3014 	ldr	r3, [fp, #-20]
f0019f40:	e2832f46 	add	r2, r3, #280	; 0x118
f0019f44:	e51b3008 	ldr	r3, [fp, #-8]
f0019f48:	e1a00001 	mov	r0, r1
f0019f4c:	e1a01002 	mov	r1, r2
f0019f50:	e1a02003 	mov	r2, r3
f0019f54:	ebfff01d 	bl	f0015fd0 <memcpy>
f0019f58:	e3a03000 	mov	r3, #0
f0019f5c:	e1a00003 	mov	r0, r3
f0019f60:	e24bd004 	sub	sp, fp, #4
f0019f64:	e8bd8800 	pop	{fp, pc}

f0019f68 <ipc_msg_copy>:
f0019f68:	e92d4800 	push	{fp, lr}
f0019f6c:	e28db004 	add	fp, sp, #4
f0019f70:	e24dd018 	sub	sp, sp, #24
f0019f74:	e50b0018 	str	r0, [fp, #-24]
f0019f78:	e50b101c 	str	r1, [fp, #-28]
f0019f7c:	e3a03000 	mov	r3, #0
f0019f80:	e50b3008 	str	r3, [fp, #-8]
f0019f84:	e51b0018 	ldr	r0, [fp, #-24]
f0019f88:	ebffff87 	bl	f0019dac <tcb_get_ipc_type>
f0019f8c:	e50b000c 	str	r0, [fp, #-12]
f0019f90:	e51b001c 	ldr	r0, [fp, #-28]
f0019f94:	ebffff84 	bl	f0019dac <tcb_get_ipc_type>
f0019f98:	e50b0010 	str	r0, [fp, #-16]
f0019f9c:	e51b300c 	ldr	r3, [fp, #-12]
f0019fa0:	e3530001 	cmp	r3, #1
f0019fa4:	0a000019 	beq	f001a010 <ipc_msg_copy+0xa8>
f0019fa8:	e3530001 	cmp	r3, #1
f0019fac:	3a000002 	bcc	f0019fbc <ipc_msg_copy+0x54>
f0019fb0:	e3530002 	cmp	r3, #2
f0019fb4:	0a00002a 	beq	f001a064 <ipc_msg_copy+0xfc>
f0019fb8:	ea000040 	b	f001a0c0 <ipc_msg_copy+0x158>
f0019fbc:	e51b3010 	ldr	r3, [fp, #-16]
f0019fc0:	e3530000 	cmp	r3, #0
f0019fc4:	1a000003 	bne	f0019fd8 <ipc_msg_copy+0x70>
f0019fc8:	e51b0018 	ldr	r0, [fp, #-24]
f0019fcc:	e51b101c 	ldr	r1, [fp, #-28]
f0019fd0:	ebffff81 	bl	f0019ddc <ipc_short_copy>
f0019fd4:	e50b0008 	str	r0, [fp, #-8]
f0019fd8:	e51b3010 	ldr	r3, [fp, #-16]
f0019fdc:	e3530001 	cmp	r3, #1
f0019fe0:	1a000003 	bne	f0019ff4 <ipc_msg_copy+0x8c>
f0019fe4:	e51b0018 	ldr	r0, [fp, #-24]
f0019fe8:	e51b101c 	ldr	r1, [fp, #-28]
f0019fec:	ebffff8f 	bl	f0019e30 <ipc_full_copy>
f0019ff0:	e50b0008 	str	r0, [fp, #-8]
f0019ff4:	e51b3010 	ldr	r3, [fp, #-16]
f0019ff8:	e3530002 	cmp	r3, #2
f0019ffc:	1a000002 	bne	f001a00c <ipc_msg_copy+0xa4>
f001a000:	e3e03084 	mvn	r3, #132	; 0x84
f001a004:	e50b3008 	str	r3, [fp, #-8]
f001a008:	ea00002c 	b	f001a0c0 <ipc_msg_copy+0x158>
f001a00c:	ea00002b 	b	f001a0c0 <ipc_msg_copy+0x158>
f001a010:	e51b3010 	ldr	r3, [fp, #-16]
f001a014:	e3530000 	cmp	r3, #0
f001a018:	1a000003 	bne	f001a02c <ipc_msg_copy+0xc4>
f001a01c:	e51b0018 	ldr	r0, [fp, #-24]
f001a020:	e51b101c 	ldr	r1, [fp, #-28]
f001a024:	ebffff81 	bl	f0019e30 <ipc_full_copy>
f001a028:	e50b0008 	str	r0, [fp, #-8]
f001a02c:	e51b3010 	ldr	r3, [fp, #-16]
f001a030:	e3530001 	cmp	r3, #1
f001a034:	1a000003 	bne	f001a048 <ipc_msg_copy+0xe0>
f001a038:	e51b0018 	ldr	r0, [fp, #-24]
f001a03c:	e51b101c 	ldr	r1, [fp, #-28]
f001a040:	ebffff7a 	bl	f0019e30 <ipc_full_copy>
f001a044:	e50b0008 	str	r0, [fp, #-8]
f001a048:	e51b3010 	ldr	r3, [fp, #-16]
f001a04c:	e3530002 	cmp	r3, #2
f001a050:	1a000002 	bne	f001a060 <ipc_msg_copy+0xf8>
f001a054:	e3e03084 	mvn	r3, #132	; 0x84
f001a058:	e50b3008 	str	r3, [fp, #-8]
f001a05c:	ea000017 	b	f001a0c0 <ipc_msg_copy+0x158>
f001a060:	ea000016 	b	f001a0c0 <ipc_msg_copy+0x158>
f001a064:	e51b3010 	ldr	r3, [fp, #-16]
f001a068:	e3530002 	cmp	r3, #2
f001a06c:	1a000003 	bne	f001a080 <ipc_msg_copy+0x118>
f001a070:	e51b0018 	ldr	r0, [fp, #-24]
f001a074:	e51b101c 	ldr	r1, [fp, #-28]
f001a078:	ebffff57 	bl	f0019ddc <ipc_short_copy>
f001a07c:	e50b0008 	str	r0, [fp, #-8]
f001a080:	e51b0018 	ldr	r0, [fp, #-24]
f001a084:	e51b101c 	ldr	r1, [fp, #-28]
f001a088:	ebffff9a 	bl	f0019ef8 <ipc_extended_copy>
f001a08c:	e50b0008 	str	r0, [fp, #-8]
f001a090:	e51b3010 	ldr	r3, [fp, #-16]
f001a094:	e3530000 	cmp	r3, #0
f001a098:	1a000001 	bne	f001a0a4 <ipc_msg_copy+0x13c>
f001a09c:	e3e03084 	mvn	r3, #132	; 0x84
f001a0a0:	e50b3008 	str	r3, [fp, #-8]
f001a0a4:	e51b3010 	ldr	r3, [fp, #-16]
f001a0a8:	e3530001 	cmp	r3, #1
f001a0ac:	1a000002 	bne	f001a0bc <ipc_msg_copy+0x154>
f001a0b0:	e3e03084 	mvn	r3, #132	; 0x84
f001a0b4:	e50b3008 	str	r3, [fp, #-8]
f001a0b8:	eaffffff 	b	f001a0bc <ipc_msg_copy+0x154>
f001a0bc:	e1a00000 	nop			; (mov r0, r0)
f001a0c0:	e51b3018 	ldr	r3, [fp, #-24]
f001a0c4:	e59330e4 	ldr	r3, [r3, #228]	; 0xe4
f001a0c8:	e3730002 	cmn	r3, #2
f001a0cc:	1a000008 	bne	f001a0f4 <ipc_msg_copy+0x18c>
f001a0d0:	e51b3018 	ldr	r3, [fp, #-24]
f001a0d4:	e5933044 	ldr	r3, [r3, #68]	; 0x44
f001a0d8:	e2833010 	add	r3, r3, #16
f001a0dc:	e50b3014 	str	r3, [fp, #-20]
f001a0e0:	e51b3014 	ldr	r3, [fp, #-20]
f001a0e4:	e2833004 	add	r3, r3, #4
f001a0e8:	e51b201c 	ldr	r2, [fp, #-28]
f001a0ec:	e5922054 	ldr	r2, [r2, #84]	; 0x54
f001a0f0:	e5832000 	str	r2, [r3]
f001a0f4:	e51b3008 	ldr	r3, [fp, #-8]
f001a0f8:	e1a00003 	mov	r0, r3
f001a0fc:	e24bd004 	sub	sp, fp, #4
f001a100:	e8bd8800 	pop	{fp, pc}

f001a104 <sys_ipc_control>:
f001a104:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f001a108:	e28db000 	add	fp, sp, #0
f001a10c:	e3e03025 	mvn	r3, #37	; 0x25
f001a110:	e1a00003 	mov	r0, r3
f001a114:	e24bd000 	sub	sp, fp, #0
f001a118:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f001a11c:	e12fff1e 	bx	lr

f001a120 <ipc_signal_error>:
f001a120:	e92d4800 	push	{fp, lr}
f001a124:	e28db004 	add	fp, sp, #4
f001a128:	e24dd008 	sub	sp, sp, #8
f001a12c:	e50b0008 	str	r0, [fp, #-8]
f001a130:	e50b100c 	str	r1, [fp, #-12]
f001a134:	e51b300c 	ldr	r3, [fp, #-12]
f001a138:	e373000e 	cmn	r3, #14
f001a13c:	0a000008 	beq	f001a164 <ipc_signal_error+0x44>
f001a140:	e51b300c 	ldr	r3, [fp, #-12]
f001a144:	e3730085 	cmn	r3, #133	; 0x85
f001a148:	0a000005 	beq	f001a164 <ipc_signal_error+0x44>
f001a14c:	e59f0058 	ldr	r0, [pc, #88]	; f001a1ac <ipc_signal_error+0x8c>
f001a150:	e59f1058 	ldr	r1, [pc, #88]	; f001a1b0 <ipc_signal_error+0x90>
f001a154:	e59f2058 	ldr	r2, [pc, #88]	; f001a1b4 <ipc_signal_error+0x94>
f001a158:	e3a0309c 	mov	r3, #156	; 0x9c
f001a15c:	ebffef62 	bl	f0015eec <printk>
f001a160:	eafffffe 	b	f001a160 <ipc_signal_error+0x40>
f001a164:	e51b300c 	ldr	r3, [fp, #-12]
f001a168:	e373000e 	cmn	r3, #14
f001a16c:	1a000004 	bne	f001a184 <ipc_signal_error+0x64>
f001a170:	e51b3008 	ldr	r3, [fp, #-8]
f001a174:	e5933064 	ldr	r3, [r3, #100]	; 0x64
f001a178:	e3832201 	orr	r2, r3, #268435456	; 0x10000000
f001a17c:	e51b3008 	ldr	r3, [fp, #-8]
f001a180:	e5832064 	str	r2, [r3, #100]	; 0x64
f001a184:	e51b300c 	ldr	r3, [fp, #-12]
f001a188:	e3730085 	cmn	r3, #133	; 0x85
f001a18c:	1a000004 	bne	f001a1a4 <ipc_signal_error+0x84>
f001a190:	e51b3008 	ldr	r3, [fp, #-8]
f001a194:	e5933064 	ldr	r3, [r3, #100]	; 0x64
f001a198:	e3832202 	orr	r2, r3, #536870912	; 0x20000000
f001a19c:	e51b3008 	ldr	r3, [fp, #-8]
f001a1a0:	e5832064 	str	r2, [r3, #100]	; 0x64
f001a1a4:	e24bd004 	sub	sp, fp, #4
f001a1a8:	e8bd8800 	pop	{fp, pc}
f001a1ac:	f001f8e4 	.word	0xf001f8e4
f001a1b0:	f001f90c 	.word	0xf001f90c
f001a1b4:	f001f9c4 	.word	0xf001f9c4

f001a1b8 <ipc_handle_errors>:
f001a1b8:	e92d4800 	push	{fp, lr}
f001a1bc:	e28db004 	add	fp, sp, #4
f001a1c0:	ebfffea8 	bl	f0019c68 <current_task>
f001a1c4:	e1a03000 	mov	r3, r0
f001a1c8:	e5933060 	ldr	r3, [r3, #96]	; 0x60
f001a1cc:	e2033001 	and	r3, r3, #1
f001a1d0:	e3530000 	cmp	r3, #0
f001a1d4:	0a000006 	beq	f001a1f4 <ipc_handle_errors+0x3c>
f001a1d8:	ebfffea2 	bl	f0019c68 <current_task>
f001a1dc:	e1a03000 	mov	r3, r0
f001a1e0:	e5932060 	ldr	r2, [r3, #96]	; 0x60
f001a1e4:	e3c22001 	bic	r2, r2, #1
f001a1e8:	e5832060 	str	r2, [r3, #96]	; 0x60
f001a1ec:	e3e03003 	mvn	r3, #3
f001a1f0:	ea00001a 	b	f001a260 <ipc_handle_errors+0xa8>
f001a1f4:	ebfffe9b 	bl	f0019c68 <current_task>
f001a1f8:	e1a03000 	mov	r3, r0
f001a1fc:	e5933064 	ldr	r3, [r3, #100]	; 0x64
f001a200:	e2033201 	and	r3, r3, #268435456	; 0x10000000
f001a204:	e3530000 	cmp	r3, #0
f001a208:	0a000006 	beq	f001a228 <ipc_handle_errors+0x70>
f001a20c:	ebfffe95 	bl	f0019c68 <current_task>
f001a210:	e1a03000 	mov	r3, r0
f001a214:	e5932064 	ldr	r2, [r3, #100]	; 0x64
f001a218:	e3c22201 	bic	r2, r2, #268435456	; 0x10000000
f001a21c:	e5832064 	str	r2, [r3, #100]	; 0x64
f001a220:	e3e0300d 	mvn	r3, #13
f001a224:	ea00000d 	b	f001a260 <ipc_handle_errors+0xa8>
f001a228:	ebfffe8e 	bl	f0019c68 <current_task>
f001a22c:	e1a03000 	mov	r3, r0
f001a230:	e5933064 	ldr	r3, [r3, #100]	; 0x64
f001a234:	e2033202 	and	r3, r3, #536870912	; 0x20000000
f001a238:	e3530000 	cmp	r3, #0
f001a23c:	0a000006 	beq	f001a25c <ipc_handle_errors+0xa4>
f001a240:	ebfffe88 	bl	f0019c68 <current_task>
f001a244:	e1a03000 	mov	r3, r0
f001a248:	e5932064 	ldr	r2, [r3, #100]	; 0x64
f001a24c:	e3c22202 	bic	r2, r2, #536870912	; 0x20000000
f001a250:	e5832064 	str	r2, [r3, #100]	; 0x64
f001a254:	e3e03084 	mvn	r3, #132	; 0x84
f001a258:	ea000000 	b	f001a260 <ipc_handle_errors+0xa8>
f001a25c:	e3a03000 	mov	r3, #0
f001a260:	e1a00003 	mov	r0, r3
f001a264:	e8bd8800 	pop	{fp, pc}

f001a268 <ipc_send>:
f001a268:	e92d4810 	push	{r4, fp, lr}
f001a26c:	e28db008 	add	fp, sp, #8
f001a270:	e24dd02c 	sub	sp, sp, #44	; 0x2c
f001a274:	e50b0030 	str	r0, [fp, #-48]	; 0x30
f001a278:	e50b1034 	str	r1, [fp, #-52]	; 0x34
f001a27c:	e3a03000 	mov	r3, #0
f001a280:	e50b3010 	str	r3, [fp, #-16]
f001a284:	e51b0030 	ldr	r0, [fp, #-48]	; 0x30
f001a288:	ebffc1ee 	bl	f000aa48 <tcb_find_lock>
f001a28c:	e50b0014 	str	r0, [fp, #-20]
f001a290:	e51b3014 	ldr	r3, [fp, #-20]
f001a294:	e3530000 	cmp	r3, #0
f001a298:	1a000001 	bne	f001a2a4 <ipc_send+0x3c>
f001a29c:	e3e03002 	mvn	r3, #2
f001a2a0:	ea000073 	b	f001a474 <ipc_send+0x20c>
f001a2a4:	e51b3014 	ldr	r3, [fp, #-20]
f001a2a8:	e28330d4 	add	r3, r3, #212	; 0xd4
f001a2ac:	e50b3018 	str	r3, [fp, #-24]
f001a2b0:	e51b3014 	ldr	r3, [fp, #-20]
f001a2b4:	e28330c4 	add	r3, r3, #196	; 0xc4
f001a2b8:	e50b301c 	str	r3, [fp, #-28]
f001a2bc:	e51b3018 	ldr	r3, [fp, #-24]
f001a2c0:	e2833004 	add	r3, r3, #4
f001a2c4:	e1a00003 	mov	r0, r3
f001a2c8:	ebfffe58 	bl	f0019c30 <spin_lock>
f001a2cc:	e51b301c 	ldr	r3, [fp, #-28]
f001a2d0:	e2833004 	add	r3, r3, #4
f001a2d4:	e1a00003 	mov	r0, r3
f001a2d8:	ebfffe54 	bl	f0019c30 <spin_lock>
f001a2dc:	e51b3014 	ldr	r3, [fp, #-20]
f001a2e0:	e5d33084 	ldrb	r3, [r3, #132]	; 0x84
f001a2e4:	e3530001 	cmp	r3, #1
f001a2e8:	1a000038 	bne	f001a3d0 <ipc_send+0x168>
f001a2ec:	e51b3014 	ldr	r3, [fp, #-20]
f001a2f0:	e593210c 	ldr	r2, [r3, #268]	; 0x10c
f001a2f4:	e51b301c 	ldr	r3, [fp, #-28]
f001a2f8:	e1520003 	cmp	r2, r3
f001a2fc:	1a000033 	bne	f001a3d0 <ipc_send+0x168>
f001a300:	e51b3014 	ldr	r3, [fp, #-20]
f001a304:	e59340e4 	ldr	r4, [r3, #228]	; 0xe4
f001a308:	ebfffe56 	bl	f0019c68 <current_task>
f001a30c:	e1a03000 	mov	r3, r0
f001a310:	e5933054 	ldr	r3, [r3, #84]	; 0x54
f001a314:	e1540003 	cmp	r4, r3
f001a318:	0a000003 	beq	f001a32c <ipc_send+0xc4>
f001a31c:	e51b3014 	ldr	r3, [fp, #-20]
f001a320:	e59330e4 	ldr	r3, [r3, #228]	; 0xe4
f001a324:	e3730002 	cmn	r3, #2
f001a328:	1a000028 	bne	f001a3d0 <ipc_send+0x168>
f001a32c:	e51b3014 	ldr	r3, [fp, #-20]
f001a330:	e5933110 	ldr	r3, [r3, #272]	; 0x110
f001a334:	e50b3020 	str	r3, [fp, #-32]
f001a338:	e51b3020 	ldr	r3, [fp, #-32]
f001a33c:	e1a00003 	mov	r0, r3
f001a340:	ebfffe0c 	bl	f0019b78 <list_remove_init>
f001a344:	e51b301c 	ldr	r3, [fp, #-28]
f001a348:	e5933000 	ldr	r3, [r3]
f001a34c:	e2432001 	sub	r2, r3, #1
f001a350:	e51b301c 	ldr	r3, [fp, #-28]
f001a354:	e5832000 	str	r2, [r3]
f001a358:	e51b0014 	ldr	r0, [fp, #-20]
f001a35c:	ebfff0ab 	bl	f0016610 <task_unset_wqh>
f001a360:	e51b301c 	ldr	r3, [fp, #-28]
f001a364:	e2833004 	add	r3, r3, #4
f001a368:	e1a00003 	mov	r0, r3
f001a36c:	ebfffe36 	bl	f0019c4c <spin_unlock>
f001a370:	e51b3018 	ldr	r3, [fp, #-24]
f001a374:	e2833004 	add	r3, r3, #4
f001a378:	e1a00003 	mov	r0, r3
f001a37c:	ebfffe32 	bl	f0019c4c <spin_unlock>
f001a380:	ebfffe38 	bl	f0019c68 <current_task>
f001a384:	e1a03000 	mov	r3, r0
f001a388:	e51b0014 	ldr	r0, [fp, #-20]
f001a38c:	e1a01003 	mov	r1, r3
f001a390:	ebfffef4 	bl	f0019f68 <ipc_msg_copy>
f001a394:	e50b0010 	str	r0, [fp, #-16]
f001a398:	e51b3010 	ldr	r3, [fp, #-16]
f001a39c:	e3530000 	cmp	r3, #0
f001a3a0:	aa000002 	bge	f001a3b0 <ipc_send+0x148>
f001a3a4:	e51b0014 	ldr	r0, [fp, #-20]
f001a3a8:	e51b1010 	ldr	r1, [fp, #-16]
f001a3ac:	ebffff5b 	bl	f001a120 <ipc_signal_error>
f001a3b0:	e51b0014 	ldr	r0, [fp, #-20]
f001a3b4:	ebffbab5 	bl	f0008e90 <sched_resume_async>
f001a3b8:	e51b3014 	ldr	r3, [fp, #-20]
f001a3bc:	e283307c 	add	r3, r3, #124	; 0x7c
f001a3c0:	e1a00003 	mov	r0, r3
f001a3c4:	ebfffe20 	bl	f0019c4c <spin_unlock>
f001a3c8:	e51b3010 	ldr	r3, [fp, #-16]
f001a3cc:	ea000028 	b	f001a474 <ipc_send+0x20c>
f001a3d0:	e24b302c 	sub	r3, fp, #44	; 0x2c
f001a3d4:	e50b302c 	str	r3, [fp, #-44]	; 0x2c
f001a3d8:	e24b302c 	sub	r3, fp, #44	; 0x2c
f001a3dc:	e50b3028 	str	r3, [fp, #-40]	; 0x28
f001a3e0:	ebfffe20 	bl	f0019c68 <current_task>
f001a3e4:	e1a03000 	mov	r3, r0
f001a3e8:	e50b3024 	str	r3, [fp, #-36]	; 0x24
f001a3ec:	e51b3018 	ldr	r3, [fp, #-24]
f001a3f0:	e5933000 	ldr	r3, [r3]
f001a3f4:	e2832001 	add	r2, r3, #1
f001a3f8:	e51b3018 	ldr	r3, [fp, #-24]
f001a3fc:	e5832000 	str	r2, [r3]
f001a400:	e51b3018 	ldr	r3, [fp, #-24]
f001a404:	e2833008 	add	r3, r3, #8
f001a408:	e24b202c 	sub	r2, fp, #44	; 0x2c
f001a40c:	e1a00002 	mov	r0, r2
f001a410:	e1a01003 	mov	r1, r3
f001a414:	ebfffdc0 	bl	f0019b1c <list_insert_tail>
f001a418:	ebfffe12 	bl	f0019c68 <current_task>
f001a41c:	e1a02000 	mov	r2, r0
f001a420:	e24b302c 	sub	r3, fp, #44	; 0x2c
f001a424:	e1a00002 	mov	r0, r2
f001a428:	e51b1018 	ldr	r1, [fp, #-24]
f001a42c:	e1a02003 	mov	r2, r3
f001a430:	ebfff05c 	bl	f00165a8 <task_set_wqh>
f001a434:	ebffbaa5 	bl	f0008ed0 <sched_prepare_sleep>
f001a438:	e51b301c 	ldr	r3, [fp, #-28]
f001a43c:	e2833004 	add	r3, r3, #4
f001a440:	e1a00003 	mov	r0, r3
f001a444:	ebfffe00 	bl	f0019c4c <spin_unlock>
f001a448:	e51b3018 	ldr	r3, [fp, #-24]
f001a44c:	e2833004 	add	r3, r3, #4
f001a450:	e1a00003 	mov	r0, r3
f001a454:	ebfffdfc 	bl	f0019c4c <spin_unlock>
f001a458:	e51b3014 	ldr	r3, [fp, #-20]
f001a45c:	e283307c 	add	r3, r3, #124	; 0x7c
f001a460:	e1a00003 	mov	r0, r3
f001a464:	ebfffdf8 	bl	f0019c4c <spin_unlock>
f001a468:	ebffbbd1 	bl	f00093b4 <schedule>
f001a46c:	ebffff51 	bl	f001a1b8 <ipc_handle_errors>
f001a470:	e1a03000 	mov	r3, r0
f001a474:	e1a00003 	mov	r0, r3
f001a478:	e24bd008 	sub	sp, fp, #8
f001a47c:	e8bd8810 	pop	{r4, fp, pc}

f001a480 <ipc_recv>:
f001a480:	e92d4810 	push	{r4, fp, lr}
f001a484:	e28db008 	add	fp, sp, #8
f001a488:	e24dd03c 	sub	sp, sp, #60	; 0x3c
f001a48c:	e50b0040 	str	r0, [fp, #-64]	; 0x40
f001a490:	e50b1044 	str	r1, [fp, #-68]	; 0x44
f001a494:	e3a03000 	mov	r3, #0
f001a498:	e50b3018 	str	r3, [fp, #-24]
f001a49c:	ebfffdf1 	bl	f0019c68 <current_task>
f001a4a0:	e1a03000 	mov	r3, r0
f001a4a4:	e28330d4 	add	r3, r3, #212	; 0xd4
f001a4a8:	e50b301c 	str	r3, [fp, #-28]
f001a4ac:	ebfffded 	bl	f0019c68 <current_task>
f001a4b0:	e1a03000 	mov	r3, r0
f001a4b4:	e28330c4 	add	r3, r3, #196	; 0xc4
f001a4b8:	e50b3020 	str	r3, [fp, #-32]
f001a4bc:	ebfffde9 	bl	f0019c68 <current_task>
f001a4c0:	e1a03000 	mov	r3, r0
f001a4c4:	e51b2040 	ldr	r2, [fp, #-64]	; 0x40
f001a4c8:	e58320e4 	str	r2, [r3, #228]	; 0xe4
f001a4cc:	e51b301c 	ldr	r3, [fp, #-28]
f001a4d0:	e2833004 	add	r3, r3, #4
f001a4d4:	e1a00003 	mov	r0, r3
f001a4d8:	ebfffdd4 	bl	f0019c30 <spin_lock>
f001a4dc:	e51b3020 	ldr	r3, [fp, #-32]
f001a4e0:	e2833004 	add	r3, r3, #4
f001a4e4:	e1a00003 	mov	r0, r3
f001a4e8:	ebfffdd0 	bl	f0019c30 <spin_lock>
f001a4ec:	e51b301c 	ldr	r3, [fp, #-28]
f001a4f0:	e5933000 	ldr	r3, [r3]
f001a4f4:	e3530000 	cmp	r3, #0
f001a4f8:	da000054 	ble	f001a650 <ipc_recv+0x1d0>
f001a4fc:	e51b301c 	ldr	r3, [fp, #-28]
f001a500:	e2833008 	add	r3, r3, #8
f001a504:	e1a00003 	mov	r0, r3
f001a508:	ebfffdb3 	bl	f0019bdc <list_empty>
f001a50c:	e1a03000 	mov	r3, r0
f001a510:	e3530000 	cmp	r3, #0
f001a514:	0a000005 	beq	f001a530 <ipc_recv+0xb0>
f001a518:	e59f01d0 	ldr	r0, [pc, #464]	; f001a6f0 <ipc_recv+0x270>
f001a51c:	e59f11d0 	ldr	r1, [pc, #464]	; f001a6f4 <ipc_recv+0x274>
f001a520:	e59f21d0 	ldr	r2, [pc, #464]	; f001a6f8 <ipc_recv+0x278>
f001a524:	e59f31d0 	ldr	r3, [pc, #464]	; f001a6fc <ipc_recv+0x27c>
f001a528:	ebffee6f 	bl	f0015eec <printk>
f001a52c:	eafffffe 	b	f001a52c <ipc_recv+0xac>
f001a530:	e51b301c 	ldr	r3, [fp, #-28]
f001a534:	e5933008 	ldr	r3, [r3, #8]
f001a538:	e50b3024 	str	r3, [fp, #-36]	; 0x24
f001a53c:	e51b3024 	ldr	r3, [fp, #-36]	; 0x24
f001a540:	e50b3010 	str	r3, [fp, #-16]
f001a544:	e51b3010 	ldr	r3, [fp, #-16]
f001a548:	e5933000 	ldr	r3, [r3]
f001a54c:	e50b3028 	str	r3, [fp, #-40]	; 0x28
f001a550:	e51b3028 	ldr	r3, [fp, #-40]	; 0x28
f001a554:	e50b3014 	str	r3, [fp, #-20]
f001a558:	ea000037 	b	f001a63c <ipc_recv+0x1bc>
f001a55c:	e51b3010 	ldr	r3, [fp, #-16]
f001a560:	e5933008 	ldr	r3, [r3, #8]
f001a564:	e50b302c 	str	r3, [fp, #-44]	; 0x2c
f001a568:	e51b302c 	ldr	r3, [fp, #-44]	; 0x2c
f001a56c:	e5934054 	ldr	r4, [r3, #84]	; 0x54
f001a570:	ebfffdbc 	bl	f0019c68 <current_task>
f001a574:	e1a03000 	mov	r3, r0
f001a578:	e59330e4 	ldr	r3, [r3, #228]	; 0xe4
f001a57c:	e1540003 	cmp	r4, r3
f001a580:	0a000004 	beq	f001a598 <ipc_recv+0x118>
f001a584:	ebfffdb7 	bl	f0019c68 <current_task>
f001a588:	e1a03000 	mov	r3, r0
f001a58c:	e59330e4 	ldr	r3, [r3, #228]	; 0xe4
f001a590:	e3730002 	cmn	r3, #2
f001a594:	1a000021 	bne	f001a620 <ipc_recv+0x1a0>
f001a598:	e51b3010 	ldr	r3, [fp, #-16]
f001a59c:	e1a00003 	mov	r0, r3
f001a5a0:	ebfffd74 	bl	f0019b78 <list_remove_init>
f001a5a4:	e51b301c 	ldr	r3, [fp, #-28]
f001a5a8:	e5933000 	ldr	r3, [r3]
f001a5ac:	e2432001 	sub	r2, r3, #1
f001a5b0:	e51b301c 	ldr	r3, [fp, #-28]
f001a5b4:	e5832000 	str	r2, [r3]
f001a5b8:	e51b002c 	ldr	r0, [fp, #-44]	; 0x2c
f001a5bc:	ebfff013 	bl	f0016610 <task_unset_wqh>
f001a5c0:	e51b3020 	ldr	r3, [fp, #-32]
f001a5c4:	e2833004 	add	r3, r3, #4
f001a5c8:	e1a00003 	mov	r0, r3
f001a5cc:	ebfffd9e 	bl	f0019c4c <spin_unlock>
f001a5d0:	e51b301c 	ldr	r3, [fp, #-28]
f001a5d4:	e2833004 	add	r3, r3, #4
f001a5d8:	e1a00003 	mov	r0, r3
f001a5dc:	ebfffd9a 	bl	f0019c4c <spin_unlock>
f001a5e0:	ebfffda0 	bl	f0019c68 <current_task>
f001a5e4:	e1a03000 	mov	r3, r0
f001a5e8:	e1a00003 	mov	r0, r3
f001a5ec:	e51b102c 	ldr	r1, [fp, #-44]	; 0x2c
f001a5f0:	ebfffe5c 	bl	f0019f68 <ipc_msg_copy>
f001a5f4:	e50b0018 	str	r0, [fp, #-24]
f001a5f8:	e51b3018 	ldr	r3, [fp, #-24]
f001a5fc:	e3530000 	cmp	r3, #0
f001a600:	aa000002 	bge	f001a610 <ipc_recv+0x190>
f001a604:	e51b002c 	ldr	r0, [fp, #-44]	; 0x2c
f001a608:	e51b1018 	ldr	r1, [fp, #-24]
f001a60c:	ebfffec3 	bl	f001a120 <ipc_signal_error>
f001a610:	e51b002c 	ldr	r0, [fp, #-44]	; 0x2c
f001a614:	ebffb9fe 	bl	f0008e14 <sched_resume_sync>
f001a618:	e51b3018 	ldr	r3, [fp, #-24]
f001a61c:	ea000030 	b	f001a6e4 <ipc_recv+0x264>
f001a620:	e51b3014 	ldr	r3, [fp, #-20]
f001a624:	e50b3010 	str	r3, [fp, #-16]
f001a628:	e51b3014 	ldr	r3, [fp, #-20]
f001a62c:	e5933000 	ldr	r3, [r3]
f001a630:	e50b3030 	str	r3, [fp, #-48]	; 0x30
f001a634:	e51b3030 	ldr	r3, [fp, #-48]	; 0x30
f001a638:	e50b3014 	str	r3, [fp, #-20]
f001a63c:	e51b2010 	ldr	r2, [fp, #-16]
f001a640:	e51b301c 	ldr	r3, [fp, #-28]
f001a644:	e2833008 	add	r3, r3, #8
f001a648:	e1520003 	cmp	r2, r3
f001a64c:	1affffc2 	bne	f001a55c <ipc_recv+0xdc>
f001a650:	e24b303c 	sub	r3, fp, #60	; 0x3c
f001a654:	e50b303c 	str	r3, [fp, #-60]	; 0x3c
f001a658:	e24b303c 	sub	r3, fp, #60	; 0x3c
f001a65c:	e50b3038 	str	r3, [fp, #-56]	; 0x38
f001a660:	ebfffd80 	bl	f0019c68 <current_task>
f001a664:	e1a03000 	mov	r3, r0
f001a668:	e50b3034 	str	r3, [fp, #-52]	; 0x34
f001a66c:	e51b3020 	ldr	r3, [fp, #-32]
f001a670:	e5933000 	ldr	r3, [r3]
f001a674:	e2832001 	add	r2, r3, #1
f001a678:	e51b3020 	ldr	r3, [fp, #-32]
f001a67c:	e5832000 	str	r2, [r3]
f001a680:	e51b3020 	ldr	r3, [fp, #-32]
f001a684:	e2833008 	add	r3, r3, #8
f001a688:	e24b203c 	sub	r2, fp, #60	; 0x3c
f001a68c:	e1a00002 	mov	r0, r2
f001a690:	e1a01003 	mov	r1, r3
f001a694:	ebfffd20 	bl	f0019b1c <list_insert_tail>
f001a698:	ebfffd72 	bl	f0019c68 <current_task>
f001a69c:	e1a02000 	mov	r2, r0
f001a6a0:	e24b303c 	sub	r3, fp, #60	; 0x3c
f001a6a4:	e1a00002 	mov	r0, r2
f001a6a8:	e51b1020 	ldr	r1, [fp, #-32]
f001a6ac:	e1a02003 	mov	r2, r3
f001a6b0:	ebffefbc 	bl	f00165a8 <task_set_wqh>
f001a6b4:	ebffba05 	bl	f0008ed0 <sched_prepare_sleep>
f001a6b8:	e51b3020 	ldr	r3, [fp, #-32]
f001a6bc:	e2833004 	add	r3, r3, #4
f001a6c0:	e1a00003 	mov	r0, r3
f001a6c4:	ebfffd60 	bl	f0019c4c <spin_unlock>
f001a6c8:	e51b301c 	ldr	r3, [fp, #-28]
f001a6cc:	e2833004 	add	r3, r3, #4
f001a6d0:	e1a00003 	mov	r0, r3
f001a6d4:	ebfffd5c 	bl	f0019c4c <spin_unlock>
f001a6d8:	ebffbb35 	bl	f00093b4 <schedule>
f001a6dc:	ebfffeb5 	bl	f001a1b8 <ipc_handle_errors>
f001a6e0:	e1a03000 	mov	r3, r0
f001a6e4:	e1a00003 	mov	r0, r3
f001a6e8:	e24bd008 	sub	sp, fp, #8
f001a6ec:	e8bd8810 	pop	{r4, fp, pc}
f001a6f0:	f001f8e4 	.word	0xf001f8e4
f001a6f4:	f001f90c 	.word	0xf001f90c
f001a6f8:	f001f9d8 	.word	0xf001f9d8
f001a6fc:	00000121 	.word	0x00000121

f001a700 <ipc_sendrecv>:
f001a700:	e92d4800 	push	{fp, lr}
f001a704:	e28db004 	add	fp, sp, #4
f001a708:	e24dd018 	sub	sp, sp, #24
f001a70c:	e50b0010 	str	r0, [fp, #-16]
f001a710:	e50b1014 	str	r1, [fp, #-20]
f001a714:	e50b2018 	str	r2, [fp, #-24]
f001a718:	e3a03000 	mov	r3, #0
f001a71c:	e50b3008 	str	r3, [fp, #-8]
f001a720:	e51b2010 	ldr	r2, [fp, #-16]
f001a724:	e51b3014 	ldr	r3, [fp, #-20]
f001a728:	e1520003 	cmp	r2, r3
f001a72c:	1a000011 	bne	f001a778 <ipc_sendrecv+0x78>
f001a730:	e51b0010 	ldr	r0, [fp, #-16]
f001a734:	e51b1018 	ldr	r1, [fp, #-24]
f001a738:	ebfffeca 	bl	f001a268 <ipc_send>
f001a73c:	e50b0008 	str	r0, [fp, #-8]
f001a740:	e51b3008 	ldr	r3, [fp, #-8]
f001a744:	e3530000 	cmp	r3, #0
f001a748:	aa000001 	bge	f001a754 <ipc_sendrecv+0x54>
f001a74c:	e51b3008 	ldr	r3, [fp, #-8]
f001a750:	ea00000e 	b	f001a790 <ipc_sendrecv+0x90>
f001a754:	e51b0014 	ldr	r0, [fp, #-20]
f001a758:	e51b1018 	ldr	r1, [fp, #-24]
f001a75c:	ebffff47 	bl	f001a480 <ipc_recv>
f001a760:	e50b0008 	str	r0, [fp, #-8]
f001a764:	e51b3008 	ldr	r3, [fp, #-8]
f001a768:	e3530000 	cmp	r3, #0
f001a76c:	aa000006 	bge	f001a78c <ipc_sendrecv+0x8c>
f001a770:	e51b3008 	ldr	r3, [fp, #-8]
f001a774:	ea000005 	b	f001a790 <ipc_sendrecv+0x90>
f001a778:	e59f001c 	ldr	r0, [pc, #28]	; f001a79c <ipc_sendrecv+0x9c>
f001a77c:	e59f101c 	ldr	r1, [pc, #28]	; f001a7a0 <ipc_sendrecv+0xa0>
f001a780:	ebffedd9 	bl	f0015eec <printk>
f001a784:	e3e03025 	mvn	r3, #37	; 0x25
f001a788:	e50b3008 	str	r3, [fp, #-8]
f001a78c:	e51b3008 	ldr	r3, [fp, #-8]
f001a790:	e1a00003 	mov	r0, r3
f001a794:	e24bd004 	sub	sp, fp, #4
f001a798:	e8bd8800 	pop	{fp, pc}
f001a79c:	f001f91c 	.word	0xf001f91c
f001a7a0:	f001f9e4 	.word	0xf001f9e4

f001a7a4 <ipc_sendrecv_extended>:
f001a7a4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f001a7a8:	e28db000 	add	fp, sp, #0
f001a7ac:	e24dd014 	sub	sp, sp, #20
f001a7b0:	e50b0008 	str	r0, [fp, #-8]
f001a7b4:	e50b100c 	str	r1, [fp, #-12]
f001a7b8:	e50b2010 	str	r2, [fp, #-16]
f001a7bc:	e3e03025 	mvn	r3, #37	; 0x25
f001a7c0:	e1a00003 	mov	r0, r3
f001a7c4:	e24bd000 	sub	sp, fp, #0
f001a7c8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f001a7cc:	e12fff1e 	bx	lr

f001a7d0 <ipc_recv_extended>:
f001a7d0:	e92d4830 	push	{r4, r5, fp, lr}
f001a7d4:	e28db00c 	add	fp, sp, #12
f001a7d8:	e24dd020 	sub	sp, sp, #32
f001a7dc:	e50b0028 	str	r0, [fp, #-40]	; 0x28
f001a7e0:	e50b102c 	str	r1, [fp, #-44]	; 0x2c
f001a7e4:	e51b002c 	ldr	r0, [fp, #-44]	; 0x2c
f001a7e8:	ebfffd42 	bl	f0019cf8 <extended_ipc_msg_index>
f001a7ec:	e1a03000 	mov	r3, r0
f001a7f0:	e50b3010 	str	r3, [fp, #-16]
f001a7f4:	ebfffd1b 	bl	f0019c68 <current_task>
f001a7f8:	e1a03000 	mov	r3, r0
f001a7fc:	e5933044 	ldr	r3, [r3, #68]	; 0x44
f001a800:	e2833010 	add	r3, r3, #16
f001a804:	e50b3014 	str	r3, [fp, #-20]
f001a808:	e51b3010 	ldr	r3, [fp, #-16]
f001a80c:	e1a03103 	lsl	r3, r3, #2
f001a810:	e51b2014 	ldr	r2, [fp, #-20]
f001a814:	e0823003 	add	r3, r2, r3
f001a818:	e5933000 	ldr	r3, [r3]
f001a81c:	e50b3018 	str	r3, [fp, #-24]
f001a820:	e51b002c 	ldr	r0, [fp, #-44]	; 0x2c
f001a824:	ebfffd3e 	bl	f0019d24 <extended_ipc_msg_size>
f001a828:	e1a03000 	mov	r3, r0
f001a82c:	e50b301c 	str	r3, [fp, #-28]
f001a830:	e51b301c 	ldr	r3, [fp, #-28]
f001a834:	e3530b02 	cmp	r3, #2048	; 0x800
f001a838:	9a000001 	bls	f001a844 <ipc_recv_extended+0x74>
f001a83c:	e3e03015 	mvn	r3, #21
f001a840:	ea000023 	b	f001a8d4 <ipc_recv_extended+0x104>
f001a844:	ebfffd07 	bl	f0019c68 <current_task>
f001a848:	e1a03000 	mov	r3, r0
f001a84c:	e51b201c 	ldr	r2, [fp, #-28]
f001a850:	e5832114 	str	r2, [r3, #276]	; 0x114
f001a854:	e51b0028 	ldr	r0, [fp, #-40]	; 0x28
f001a858:	e51b102c 	ldr	r1, [fp, #-44]	; 0x2c
f001a85c:	ebffff07 	bl	f001a480 <ipc_recv>
f001a860:	e50b0020 	str	r0, [fp, #-32]
f001a864:	e51b3020 	ldr	r3, [fp, #-32]
f001a868:	e3530000 	cmp	r3, #0
f001a86c:	aa000001 	bge	f001a878 <ipc_recv_extended+0xa8>
f001a870:	e51b3020 	ldr	r3, [fp, #-32]
f001a874:	ea000016 	b	f001a8d4 <ipc_recv_extended+0x104>
f001a878:	e51b0018 	ldr	r0, [fp, #-24]
f001a87c:	e51b101c 	ldr	r1, [fp, #-28]
f001a880:	e3a02001 	mov	r2, #1
f001a884:	e3a03001 	mov	r3, #1
f001a888:	ebffc418 	bl	f000b8f0 <check_access>
f001a88c:	e50b0020 	str	r0, [fp, #-32]
f001a890:	e51b3020 	ldr	r3, [fp, #-32]
f001a894:	e3530000 	cmp	r3, #0
f001a898:	aa000001 	bge	f001a8a4 <ipc_recv_extended+0xd4>
f001a89c:	e51b3020 	ldr	r3, [fp, #-32]
f001a8a0:	ea00000b 	b	f001a8d4 <ipc_recv_extended+0x104>
f001a8a4:	e51b5018 	ldr	r5, [fp, #-24]
f001a8a8:	ebfffcee 	bl	f0019c68 <current_task>
f001a8ac:	e1a03000 	mov	r3, r0
f001a8b0:	e2834f46 	add	r4, r3, #280	; 0x118
f001a8b4:	ebfffceb 	bl	f0019c68 <current_task>
f001a8b8:	e1a03000 	mov	r3, r0
f001a8bc:	e5933114 	ldr	r3, [r3, #276]	; 0x114
f001a8c0:	e1a00005 	mov	r0, r5
f001a8c4:	e1a01004 	mov	r1, r4
f001a8c8:	e1a02003 	mov	r2, r3
f001a8cc:	ebffedbf 	bl	f0015fd0 <memcpy>
f001a8d0:	e3a03000 	mov	r3, #0
f001a8d4:	e1a00003 	mov	r0, r3
f001a8d8:	e24bd00c 	sub	sp, fp, #12
f001a8dc:	e8bd8830 	pop	{r4, r5, fp, pc}

f001a8e0 <ipc_send_extended>:
f001a8e0:	e92d4800 	push	{fp, lr}
f001a8e4:	e28db004 	add	fp, sp, #4
f001a8e8:	e24dd020 	sub	sp, sp, #32
f001a8ec:	e50b0020 	str	r0, [fp, #-32]
f001a8f0:	e50b1024 	str	r1, [fp, #-36]	; 0x24
f001a8f4:	e51b0024 	ldr	r0, [fp, #-36]	; 0x24
f001a8f8:	ebfffcfe 	bl	f0019cf8 <extended_ipc_msg_index>
f001a8fc:	e1a03000 	mov	r3, r0
f001a900:	e50b3008 	str	r3, [fp, #-8]
f001a904:	ebfffcd7 	bl	f0019c68 <current_task>
f001a908:	e1a03000 	mov	r3, r0
f001a90c:	e5933044 	ldr	r3, [r3, #68]	; 0x44
f001a910:	e2833010 	add	r3, r3, #16
f001a914:	e50b300c 	str	r3, [fp, #-12]
f001a918:	e51b3008 	ldr	r3, [fp, #-8]
f001a91c:	e1a03103 	lsl	r3, r3, #2
f001a920:	e51b200c 	ldr	r2, [fp, #-12]
f001a924:	e0823003 	add	r3, r2, r3
f001a928:	e5933000 	ldr	r3, [r3]
f001a92c:	e50b3010 	str	r3, [fp, #-16]
f001a930:	e51b0024 	ldr	r0, [fp, #-36]	; 0x24
f001a934:	ebfffcfa 	bl	f0019d24 <extended_ipc_msg_size>
f001a938:	e1a03000 	mov	r3, r0
f001a93c:	e50b3014 	str	r3, [fp, #-20]
f001a940:	e51b3014 	ldr	r3, [fp, #-20]
f001a944:	e3530b02 	cmp	r3, #2048	; 0x800
f001a948:	9a000001 	bls	f001a954 <ipc_send_extended+0x74>
f001a94c:	e3e03015 	mvn	r3, #21
f001a950:	ea00001b 	b	f001a9c4 <ipc_send_extended+0xe4>
f001a954:	ebfffcc3 	bl	f0019c68 <current_task>
f001a958:	e1a03000 	mov	r3, r0
f001a95c:	e51b2014 	ldr	r2, [fp, #-20]
f001a960:	e5832114 	str	r2, [r3, #276]	; 0x114
f001a964:	e51b0010 	ldr	r0, [fp, #-16]
f001a968:	e51b1014 	ldr	r1, [fp, #-20]
f001a96c:	e3a02001 	mov	r2, #1
f001a970:	e3a03001 	mov	r3, #1
f001a974:	ebffc3dd 	bl	f000b8f0 <check_access>
f001a978:	e50b0018 	str	r0, [fp, #-24]
f001a97c:	e51b3018 	ldr	r3, [fp, #-24]
f001a980:	e3530000 	cmp	r3, #0
f001a984:	aa000001 	bge	f001a990 <ipc_send_extended+0xb0>
f001a988:	e51b3018 	ldr	r3, [fp, #-24]
f001a98c:	ea00000c 	b	f001a9c4 <ipc_send_extended+0xe4>
f001a990:	ebfffcb4 	bl	f0019c68 <current_task>
f001a994:	e1a03000 	mov	r3, r0
f001a998:	e2831f46 	add	r1, r3, #280	; 0x118
f001a99c:	e51b2010 	ldr	r2, [fp, #-16]
f001a9a0:	e51b3014 	ldr	r3, [fp, #-20]
f001a9a4:	e1a00001 	mov	r0, r1
f001a9a8:	e1a01002 	mov	r1, r2
f001a9ac:	e1a02003 	mov	r2, r3
f001a9b0:	ebffed86 	bl	f0015fd0 <memcpy>
f001a9b4:	e51b0020 	ldr	r0, [fp, #-32]
f001a9b8:	e51b1024 	ldr	r1, [fp, #-36]	; 0x24
f001a9bc:	ebfffe29 	bl	f001a268 <ipc_send>
f001a9c0:	e1a03000 	mov	r3, r0
f001a9c4:	e1a00003 	mov	r0, r3
f001a9c8:	e24bd004 	sub	sp, fp, #4
f001a9cc:	e8bd8800 	pop	{fp, pc}

f001a9d0 <__sys_ipc>:
f001a9d0:	e92d4800 	push	{fp, lr}
f001a9d4:	e28db004 	add	fp, sp, #4
f001a9d8:	e24dd018 	sub	sp, sp, #24
f001a9dc:	e50b0010 	str	r0, [fp, #-16]
f001a9e0:	e50b1014 	str	r1, [fp, #-20]
f001a9e4:	e50b2018 	str	r2, [fp, #-24]
f001a9e8:	e50b301c 	str	r3, [fp, #-28]
f001a9ec:	e51b001c 	ldr	r0, [fp, #-28]
f001a9f0:	ebfffce3 	bl	f0019d84 <ipc_flags_get_type>
f001a9f4:	e1a03000 	mov	r3, r0
f001a9f8:	e3530002 	cmp	r3, #2
f001a9fc:	1a00001c 	bne	f001aa74 <__sys_ipc+0xa4>
f001aa00:	e51b3018 	ldr	r3, [fp, #-24]
f001aa04:	e3530002 	cmp	r3, #2
f001aa08:	0a000008 	beq	f001aa30 <__sys_ipc+0x60>
f001aa0c:	e3530003 	cmp	r3, #3
f001aa10:	0a00000b 	beq	f001aa44 <__sys_ipc+0x74>
f001aa14:	e3530001 	cmp	r3, #1
f001aa18:	1a00000f 	bne	f001aa5c <__sys_ipc+0x8c>
f001aa1c:	e51b0010 	ldr	r0, [fp, #-16]
f001aa20:	e51b101c 	ldr	r1, [fp, #-28]
f001aa24:	ebffffad 	bl	f001a8e0 <ipc_send_extended>
f001aa28:	e50b0008 	str	r0, [fp, #-8]
f001aa2c:	ea00000f 	b	f001aa70 <__sys_ipc+0xa0>
f001aa30:	e51b0014 	ldr	r0, [fp, #-20]
f001aa34:	e51b101c 	ldr	r1, [fp, #-28]
f001aa38:	ebffff64 	bl	f001a7d0 <ipc_recv_extended>
f001aa3c:	e50b0008 	str	r0, [fp, #-8]
f001aa40:	ea00000a 	b	f001aa70 <__sys_ipc+0xa0>
f001aa44:	e51b0010 	ldr	r0, [fp, #-16]
f001aa48:	e51b1014 	ldr	r1, [fp, #-20]
f001aa4c:	e51b201c 	ldr	r2, [fp, #-28]
f001aa50:	ebffff53 	bl	f001a7a4 <ipc_sendrecv_extended>
f001aa54:	e50b0008 	str	r0, [fp, #-8]
f001aa58:	ea000004 	b	f001aa70 <__sys_ipc+0xa0>
f001aa5c:	e59f008c 	ldr	r0, [pc, #140]	; f001aaf0 <__sys_ipc+0x120>
f001aa60:	ebffed21 	bl	f0015eec <printk>
f001aa64:	e3e03025 	mvn	r3, #37	; 0x25
f001aa68:	e50b3008 	str	r3, [fp, #-8]
f001aa6c:	ea00001b 	b	f001aae0 <__sys_ipc+0x110>
f001aa70:	ea00001a 	b	f001aae0 <__sys_ipc+0x110>
f001aa74:	e51b3018 	ldr	r3, [fp, #-24]
f001aa78:	e3530002 	cmp	r3, #2
f001aa7c:	0a000008 	beq	f001aaa4 <__sys_ipc+0xd4>
f001aa80:	e3530003 	cmp	r3, #3
f001aa84:	0a00000b 	beq	f001aab8 <__sys_ipc+0xe8>
f001aa88:	e3530001 	cmp	r3, #1
f001aa8c:	1a00000f 	bne	f001aad0 <__sys_ipc+0x100>
f001aa90:	e51b0010 	ldr	r0, [fp, #-16]
f001aa94:	e51b101c 	ldr	r1, [fp, #-28]
f001aa98:	ebfffdf2 	bl	f001a268 <ipc_send>
f001aa9c:	e50b0008 	str	r0, [fp, #-8]
f001aaa0:	ea00000e 	b	f001aae0 <__sys_ipc+0x110>
f001aaa4:	e51b0014 	ldr	r0, [fp, #-20]
f001aaa8:	e51b101c 	ldr	r1, [fp, #-28]
f001aaac:	ebfffe73 	bl	f001a480 <ipc_recv>
f001aab0:	e50b0008 	str	r0, [fp, #-8]
f001aab4:	ea000009 	b	f001aae0 <__sys_ipc+0x110>
f001aab8:	e51b0010 	ldr	r0, [fp, #-16]
f001aabc:	e51b1014 	ldr	r1, [fp, #-20]
f001aac0:	e51b201c 	ldr	r2, [fp, #-28]
f001aac4:	ebffff0d 	bl	f001a700 <ipc_sendrecv>
f001aac8:	e50b0008 	str	r0, [fp, #-8]
f001aacc:	ea000003 	b	f001aae0 <__sys_ipc+0x110>
f001aad0:	e59f0018 	ldr	r0, [pc, #24]	; f001aaf0 <__sys_ipc+0x120>
f001aad4:	ebffed04 	bl	f0015eec <printk>
f001aad8:	e3e03025 	mvn	r3, #37	; 0x25
f001aadc:	e50b3008 	str	r3, [fp, #-8]
f001aae0:	e51b3008 	ldr	r3, [fp, #-8]
f001aae4:	e1a00003 	mov	r0, r3
f001aae8:	e24bd004 	sub	sp, fp, #4
f001aaec:	e8bd8800 	pop	{fp, pc}
f001aaf0:	f001f93c 	.word	0xf001f93c

f001aaf4 <printk_sysregs>:
f001aaf4:	e92d4800 	push	{fp, lr}
f001aaf8:	e28db004 	add	fp, sp, #4
f001aafc:	e24dd008 	sub	sp, sp, #8
f001ab00:	e50b0008 	str	r0, [fp, #-8]
f001ab04:	ebfffc57 	bl	f0019c68 <current_task>
f001ab08:	e1a03000 	mov	r3, r0
f001ab0c:	e5933054 	ldr	r3, [r3, #84]	; 0x54
f001ab10:	e59f0204 	ldr	r0, [pc, #516]	; f001ad1c <printk_sysregs+0x228>
f001ab14:	e1a01003 	mov	r1, r3
f001ab18:	ebffecf3 	bl	f0015eec <printk>
f001ab1c:	e51b3008 	ldr	r3, [fp, #-8]
f001ab20:	e5d32004 	ldrb	r2, [r3, #4]
f001ab24:	e5d31005 	ldrb	r1, [r3, #5]
f001ab28:	e1a01401 	lsl	r1, r1, #8
f001ab2c:	e1812002 	orr	r2, r1, r2
f001ab30:	e5d31006 	ldrb	r1, [r3, #6]
f001ab34:	e1a01801 	lsl	r1, r1, #16
f001ab38:	e1812002 	orr	r2, r1, r2
f001ab3c:	e5d33007 	ldrb	r3, [r3, #7]
f001ab40:	e1a03c03 	lsl	r3, r3, #24
f001ab44:	e1833002 	orr	r3, r3, r2
f001ab48:	e59f01d0 	ldr	r0, [pc, #464]	; f001ad20 <printk_sysregs+0x22c>
f001ab4c:	e1a01003 	mov	r1, r3
f001ab50:	ebffece5 	bl	f0015eec <printk>
f001ab54:	e51b3008 	ldr	r3, [fp, #-8]
f001ab58:	e5d32008 	ldrb	r2, [r3, #8]
f001ab5c:	e5d31009 	ldrb	r1, [r3, #9]
f001ab60:	e1a01401 	lsl	r1, r1, #8
f001ab64:	e1812002 	orr	r2, r1, r2
f001ab68:	e5d3100a 	ldrb	r1, [r3, #10]
f001ab6c:	e1a01801 	lsl	r1, r1, #16
f001ab70:	e1812002 	orr	r2, r1, r2
f001ab74:	e5d3300b 	ldrb	r3, [r3, #11]
f001ab78:	e1a03c03 	lsl	r3, r3, #24
f001ab7c:	e1833002 	orr	r3, r3, r2
f001ab80:	e59f019c 	ldr	r0, [pc, #412]	; f001ad24 <printk_sysregs+0x230>
f001ab84:	e1a01003 	mov	r1, r3
f001ab88:	ebffecd7 	bl	f0015eec <printk>
f001ab8c:	e51b3008 	ldr	r3, [fp, #-8]
f001ab90:	e5d3200c 	ldrb	r2, [r3, #12]
f001ab94:	e5d3100d 	ldrb	r1, [r3, #13]
f001ab98:	e1a01401 	lsl	r1, r1, #8
f001ab9c:	e1812002 	orr	r2, r1, r2
f001aba0:	e5d3100e 	ldrb	r1, [r3, #14]
f001aba4:	e1a01801 	lsl	r1, r1, #16
f001aba8:	e1812002 	orr	r2, r1, r2
f001abac:	e5d3300f 	ldrb	r3, [r3, #15]
f001abb0:	e1a03c03 	lsl	r3, r3, #24
f001abb4:	e1833002 	orr	r3, r3, r2
f001abb8:	e59f0168 	ldr	r0, [pc, #360]	; f001ad28 <printk_sysregs+0x234>
f001abbc:	e1a01003 	mov	r1, r3
f001abc0:	ebffecc9 	bl	f0015eec <printk>
f001abc4:	e51b3008 	ldr	r3, [fp, #-8]
f001abc8:	e5d32010 	ldrb	r2, [r3, #16]
f001abcc:	e5d31011 	ldrb	r1, [r3, #17]
f001abd0:	e1a01401 	lsl	r1, r1, #8
f001abd4:	e1812002 	orr	r2, r1, r2
f001abd8:	e5d31012 	ldrb	r1, [r3, #18]
f001abdc:	e1a01801 	lsl	r1, r1, #16
f001abe0:	e1812002 	orr	r2, r1, r2
f001abe4:	e5d33013 	ldrb	r3, [r3, #19]
f001abe8:	e1a03c03 	lsl	r3, r3, #24
f001abec:	e1833002 	orr	r3, r3, r2
f001abf0:	e59f0134 	ldr	r0, [pc, #308]	; f001ad2c <printk_sysregs+0x238>
f001abf4:	e1a01003 	mov	r1, r3
f001abf8:	ebffecbb 	bl	f0015eec <printk>
f001abfc:	e51b3008 	ldr	r3, [fp, #-8]
f001ac00:	e5d32014 	ldrb	r2, [r3, #20]
f001ac04:	e5d31015 	ldrb	r1, [r3, #21]
f001ac08:	e1a01401 	lsl	r1, r1, #8
f001ac0c:	e1812002 	orr	r2, r1, r2
f001ac10:	e5d31016 	ldrb	r1, [r3, #22]
f001ac14:	e1a01801 	lsl	r1, r1, #16
f001ac18:	e1812002 	orr	r2, r1, r2
f001ac1c:	e5d33017 	ldrb	r3, [r3, #23]
f001ac20:	e1a03c03 	lsl	r3, r3, #24
f001ac24:	e1833002 	orr	r3, r3, r2
f001ac28:	e59f0100 	ldr	r0, [pc, #256]	; f001ad30 <printk_sysregs+0x23c>
f001ac2c:	e1a01003 	mov	r1, r3
f001ac30:	ebffecad 	bl	f0015eec <printk>
f001ac34:	e51b3008 	ldr	r3, [fp, #-8]
f001ac38:	e5d32018 	ldrb	r2, [r3, #24]
f001ac3c:	e5d31019 	ldrb	r1, [r3, #25]
f001ac40:	e1a01401 	lsl	r1, r1, #8
f001ac44:	e1812002 	orr	r2, r1, r2
f001ac48:	e5d3101a 	ldrb	r1, [r3, #26]
f001ac4c:	e1a01801 	lsl	r1, r1, #16
f001ac50:	e1812002 	orr	r2, r1, r2
f001ac54:	e5d3301b 	ldrb	r3, [r3, #27]
f001ac58:	e1a03c03 	lsl	r3, r3, #24
f001ac5c:	e1833002 	orr	r3, r3, r2
f001ac60:	e59f00cc 	ldr	r0, [pc, #204]	; f001ad34 <printk_sysregs+0x240>
f001ac64:	e1a01003 	mov	r1, r3
f001ac68:	ebffec9f 	bl	f0015eec <printk>
f001ac6c:	e51b3008 	ldr	r3, [fp, #-8]
f001ac70:	e5d3201c 	ldrb	r2, [r3, #28]
f001ac74:	e5d3101d 	ldrb	r1, [r3, #29]
f001ac78:	e1a01401 	lsl	r1, r1, #8
f001ac7c:	e1812002 	orr	r2, r1, r2
f001ac80:	e5d3101e 	ldrb	r1, [r3, #30]
f001ac84:	e1a01801 	lsl	r1, r1, #16
f001ac88:	e1812002 	orr	r2, r1, r2
f001ac8c:	e5d3301f 	ldrb	r3, [r3, #31]
f001ac90:	e1a03c03 	lsl	r3, r3, #24
f001ac94:	e1833002 	orr	r3, r3, r2
f001ac98:	e59f0098 	ldr	r0, [pc, #152]	; f001ad38 <printk_sysregs+0x244>
f001ac9c:	e1a01003 	mov	r1, r3
f001aca0:	ebffec91 	bl	f0015eec <printk>
f001aca4:	e51b3008 	ldr	r3, [fp, #-8]
f001aca8:	e5d32020 	ldrb	r2, [r3, #32]
f001acac:	e5d31021 	ldrb	r1, [r3, #33]	; 0x21
f001acb0:	e1a01401 	lsl	r1, r1, #8
f001acb4:	e1812002 	orr	r2, r1, r2
f001acb8:	e5d31022 	ldrb	r1, [r3, #34]	; 0x22
f001acbc:	e1a01801 	lsl	r1, r1, #16
f001acc0:	e1812002 	orr	r2, r1, r2
f001acc4:	e5d33023 	ldrb	r3, [r3, #35]	; 0x23
f001acc8:	e1a03c03 	lsl	r3, r3, #24
f001accc:	e1833002 	orr	r3, r3, r2
f001acd0:	e59f0064 	ldr	r0, [pc, #100]	; f001ad3c <printk_sysregs+0x248>
f001acd4:	e1a01003 	mov	r1, r3
f001acd8:	ebffec83 	bl	f0015eec <printk>
f001acdc:	e51b3008 	ldr	r3, [fp, #-8]
f001ace0:	e5d32024 	ldrb	r2, [r3, #36]	; 0x24
f001ace4:	e5d31025 	ldrb	r1, [r3, #37]	; 0x25
f001ace8:	e1a01401 	lsl	r1, r1, #8
f001acec:	e1812002 	orr	r2, r1, r2
f001acf0:	e5d31026 	ldrb	r1, [r3, #38]	; 0x26
f001acf4:	e1a01801 	lsl	r1, r1, #16
f001acf8:	e1812002 	orr	r2, r1, r2
f001acfc:	e5d33027 	ldrb	r3, [r3, #39]	; 0x27
f001ad00:	e1a03c03 	lsl	r3, r3, #24
f001ad04:	e1833002 	orr	r3, r3, r2
f001ad08:	e59f0030 	ldr	r0, [pc, #48]	; f001ad40 <printk_sysregs+0x24c>
f001ad0c:	e1a01003 	mov	r1, r3
f001ad10:	ebffec75 	bl	f0015eec <printk>
f001ad14:	e24bd004 	sub	sp, fp, #4
f001ad18:	e8bd8800 	pop	{fp, pc}
f001ad1c:	f001f958 	.word	0xf001f958
f001ad20:	f001f97c 	.word	0xf001f97c
f001ad24:	f001f984 	.word	0xf001f984
f001ad28:	f001f98c 	.word	0xf001f98c
f001ad2c:	f001f994 	.word	0xf001f994
f001ad30:	f001f99c 	.word	0xf001f99c
f001ad34:	f001f9a4 	.word	0xf001f9a4
f001ad38:	f001f9ac 	.word	0xf001f9ac
f001ad3c:	f001f9b4 	.word	0xf001f9b4
f001ad40:	f001f9bc 	.word	0xf001f9bc

f001ad44 <sys_ipc>:
f001ad44:	e92d4800 	push	{fp, lr}
f001ad48:	e28db004 	add	fp, sp, #4
f001ad4c:	e24dd018 	sub	sp, sp, #24
f001ad50:	e50b0010 	str	r0, [fp, #-16]
f001ad54:	e50b1014 	str	r1, [fp, #-20]
f001ad58:	e50b2018 	str	r2, [fp, #-24]
f001ad5c:	e3a03000 	mov	r3, #0
f001ad60:	e50b300c 	str	r3, [fp, #-12]
f001ad64:	e3a03000 	mov	r3, #0
f001ad68:	e50b3008 	str	r3, [fp, #-8]
f001ad6c:	e51b0014 	ldr	r0, [fp, #-20]
f001ad70:	ebfffbc5 	bl	f0019c8c <tid_special_value>
f001ad74:	e1a03000 	mov	r3, r0
f001ad78:	e3530000 	cmp	r3, #0
f001ad7c:	0a000008 	beq	f001ada4 <sys_ipc+0x60>
f001ad80:	e51b3014 	ldr	r3, [fp, #-20]
f001ad84:	e3730002 	cmn	r3, #2
f001ad88:	0a000005 	beq	f001ada4 <sys_ipc+0x60>
f001ad8c:	e51b3014 	ldr	r3, [fp, #-20]
f001ad90:	e3730001 	cmn	r3, #1
f001ad94:	0a000002 	beq	f001ada4 <sys_ipc+0x60>
f001ad98:	e3e03015 	mvn	r3, #21
f001ad9c:	e50b3008 	str	r3, [fp, #-8]
f001ada0:	ea00004f 	b	f001aee4 <sys_ipc+0x1a0>
f001ada4:	e51b0010 	ldr	r0, [fp, #-16]
f001ada8:	ebfffbb7 	bl	f0019c8c <tid_special_value>
f001adac:	e1a03000 	mov	r3, r0
f001adb0:	e3530000 	cmp	r3, #0
f001adb4:	0a000008 	beq	f001addc <sys_ipc+0x98>
f001adb8:	e51b3010 	ldr	r3, [fp, #-16]
f001adbc:	e3730002 	cmn	r3, #2
f001adc0:	0a000005 	beq	f001addc <sys_ipc+0x98>
f001adc4:	e51b3010 	ldr	r3, [fp, #-16]
f001adc8:	e3730001 	cmn	r3, #1
f001adcc:	0a000002 	beq	f001addc <sys_ipc+0x98>
f001add0:	e3e03015 	mvn	r3, #21
f001add4:	e50b3008 	str	r3, [fp, #-8]
f001add8:	ea000041 	b	f001aee4 <sys_ipc+0x1a0>
f001addc:	ebfffba1 	bl	f0019c68 <current_task>
f001ade0:	e1a03000 	mov	r3, r0
f001ade4:	e5932054 	ldr	r2, [r3, #84]	; 0x54
f001ade8:	e51b3014 	ldr	r3, [fp, #-20]
f001adec:	e1520003 	cmp	r2, r3
f001adf0:	0a000005 	beq	f001ae0c <sys_ipc+0xc8>
f001adf4:	ebfffb9b 	bl	f0019c68 <current_task>
f001adf8:	e1a03000 	mov	r3, r0
f001adfc:	e5932054 	ldr	r2, [r3, #84]	; 0x54
f001ae00:	e51b3010 	ldr	r3, [fp, #-16]
f001ae04:	e1520003 	cmp	r2, r3
f001ae08:	1a000002 	bne	f001ae18 <sys_ipc+0xd4>
f001ae0c:	e3e03015 	mvn	r3, #21
f001ae10:	e50b3008 	str	r3, [fp, #-8]
f001ae14:	ea000032 	b	f001aee4 <sys_ipc+0x1a0>
f001ae18:	e51b3010 	ldr	r3, [fp, #-16]
f001ae1c:	e3730001 	cmn	r3, #1
f001ae20:	03a03000 	moveq	r3, #0
f001ae24:	13a03001 	movne	r3, #1
f001ae28:	e20330ff 	and	r3, r3, #255	; 0xff
f001ae2c:	e51b200c 	ldr	r2, [fp, #-12]
f001ae30:	e1823003 	orr	r3, r2, r3
f001ae34:	e50b300c 	str	r3, [fp, #-12]
f001ae38:	e51b3014 	ldr	r3, [fp, #-20]
f001ae3c:	e3730001 	cmn	r3, #1
f001ae40:	0a000001 	beq	f001ae4c <sys_ipc+0x108>
f001ae44:	e3a03002 	mov	r3, #2
f001ae48:	ea000000 	b	f001ae50 <sys_ipc+0x10c>
f001ae4c:	e3a03000 	mov	r3, #0
f001ae50:	e51b200c 	ldr	r2, [fp, #-12]
f001ae54:	e1823003 	orr	r3, r2, r3
f001ae58:	e50b300c 	str	r3, [fp, #-12]
f001ae5c:	e51b300c 	ldr	r3, [fp, #-12]
f001ae60:	e3530000 	cmp	r3, #0
f001ae64:	1a000002 	bne	f001ae74 <sys_ipc+0x130>
f001ae68:	e3e03015 	mvn	r3, #21
f001ae6c:	e50b3008 	str	r3, [fp, #-8]
f001ae70:	ea00001b 	b	f001aee4 <sys_ipc+0x1a0>
f001ae74:	e51b0010 	ldr	r0, [fp, #-16]
f001ae78:	e51b1014 	ldr	r1, [fp, #-20]
f001ae7c:	e51b2018 	ldr	r2, [fp, #-24]
f001ae80:	e51b300c 	ldr	r3, [fp, #-12]
f001ae84:	ebffd1e1 	bl	f000f610 <cap_ipc_check>
f001ae88:	e50b0008 	str	r0, [fp, #-8]
f001ae8c:	e51b3008 	ldr	r3, [fp, #-8]
f001ae90:	e3530000 	cmp	r3, #0
f001ae94:	aa000001 	bge	f001aea0 <sys_ipc+0x15c>
f001ae98:	e51b3008 	ldr	r3, [fp, #-8]
f001ae9c:	ea000013 	b	f001aef0 <sys_ipc+0x1ac>
f001aea0:	ebfffb70 	bl	f0019c68 <current_task>
f001aea4:	e1a03000 	mov	r3, r0
f001aea8:	e1a00003 	mov	r0, r3
f001aeac:	e51b1018 	ldr	r1, [fp, #-24]
f001aeb0:	ebfffba8 	bl	f0019d58 <tcb_set_ipc_flags>
f001aeb4:	e51b0010 	ldr	r0, [fp, #-16]
f001aeb8:	e51b1014 	ldr	r1, [fp, #-20]
f001aebc:	e51b200c 	ldr	r2, [fp, #-12]
f001aec0:	e51b3018 	ldr	r3, [fp, #-24]
f001aec4:	ebfffec1 	bl	f001a9d0 <__sys_ipc>
f001aec8:	e50b0008 	str	r0, [fp, #-8]
f001aecc:	e51b3008 	ldr	r3, [fp, #-8]
f001aed0:	e3530000 	cmp	r3, #0
f001aed4:	aa000000 	bge	f001aedc <sys_ipc+0x198>
f001aed8:	ea000001 	b	f001aee4 <sys_ipc+0x1a0>
f001aedc:	e51b3008 	ldr	r3, [fp, #-8]
f001aee0:	ea000002 	b	f001aef0 <sys_ipc+0x1ac>
f001aee4:	e3a03000 	mov	r3, #0
f001aee8:	e50b300c 	str	r3, [fp, #-12]
f001aeec:	e51b3008 	ldr	r3, [fp, #-8]
f001aef0:	e1a00003 	mov	r0, r3
f001aef4:	e24bd004 	sub	sp, fp, #4
f001aef8:	e8bd8800 	pop	{fp, pc}

f001aefc <user_map_flags_validate>:
f001aefc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f001af00:	e28db000 	add	fp, sp, #0
f001af04:	e24dd00c 	sub	sp, sp, #12
f001af08:	e50b0008 	str	r0, [fp, #-8]
f001af0c:	e51b3008 	ldr	r3, [fp, #-8]
f001af10:	e2433001 	sub	r3, r3, #1
f001af14:	e3530007 	cmp	r3, #7
f001af18:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
f001af1c:	ea000009 	b	f001af48 <user_map_flags_validate+0x4c>
f001af20:	f001af40 	.word	0xf001af40
f001af24:	f001af40 	.word	0xf001af40
f001af28:	f001af48 	.word	0xf001af48
f001af2c:	f001af40 	.word	0xf001af40
f001af30:	f001af48 	.word	0xf001af48
f001af34:	f001af40 	.word	0xf001af40
f001af38:	f001af48 	.word	0xf001af48
f001af3c:	f001af40 	.word	0xf001af40
f001af40:	e3a03001 	mov	r3, #1
f001af44:	ea000000 	b	f001af4c <user_map_flags_validate+0x50>
f001af48:	e3a03000 	mov	r3, #0
f001af4c:	e1a00003 	mov	r0, r3
f001af50:	e24bd000 	sub	sp, fp, #0
f001af54:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f001af58:	e12fff1e 	bx	lr

f001af5c <sys_map>:
f001af5c:	e92d4800 	push	{fp, lr}
f001af60:	e28db004 	add	fp, sp, #4
f001af64:	e24dd020 	sub	sp, sp, #32
f001af68:	e50b0010 	str	r0, [fp, #-16]
f001af6c:	e50b1014 	str	r1, [fp, #-20]
f001af70:	e50b2018 	str	r2, [fp, #-24]
f001af74:	e50b301c 	str	r3, [fp, #-28]
f001af78:	e59b0004 	ldr	r0, [fp, #4]
f001af7c:	ebffbe7f 	bl	f000a980 <tcb_find>
f001af80:	e50b0008 	str	r0, [fp, #-8]
f001af84:	e51b3008 	ldr	r3, [fp, #-8]
f001af88:	e3530000 	cmp	r3, #0
f001af8c:	1a000001 	bne	f001af98 <sys_map+0x3c>
f001af90:	e3e03002 	mvn	r3, #2
f001af94:	ea000029 	b	f001b040 <sys_map+0xe4>
f001af98:	e51b001c 	ldr	r0, [fp, #-28]
f001af9c:	ebffffd6 	bl	f001aefc <user_map_flags_validate>
f001afa0:	e1a03000 	mov	r3, r0
f001afa4:	e3530000 	cmp	r3, #0
f001afa8:	1a000001 	bne	f001afb4 <sys_map+0x58>
f001afac:	e3e03015 	mvn	r3, #21
f001afb0:	ea000022 	b	f001b040 <sys_map+0xe4>
f001afb4:	e51b3018 	ldr	r3, [fp, #-24]
f001afb8:	e3530000 	cmp	r3, #0
f001afbc:	0a000005 	beq	f001afd8 <sys_map+0x7c>
f001afc0:	e51b3010 	ldr	r3, [fp, #-16]
f001afc4:	e3530000 	cmp	r3, #0
f001afc8:	0a000002 	beq	f001afd8 <sys_map+0x7c>
f001afcc:	e51b3014 	ldr	r3, [fp, #-20]
f001afd0:	e3530000 	cmp	r3, #0
f001afd4:	1a000001 	bne	f001afe0 <sys_map+0x84>
f001afd8:	e3e03015 	mvn	r3, #21
f001afdc:	ea000017 	b	f001b040 <sys_map+0xe4>
f001afe0:	e51b301c 	ldr	r3, [fp, #-28]
f001afe4:	e58d3000 	str	r3, [sp]
f001afe8:	e51b0008 	ldr	r0, [fp, #-8]
f001afec:	e51b1010 	ldr	r1, [fp, #-16]
f001aff0:	e51b2014 	ldr	r2, [fp, #-20]
f001aff4:	e51b3018 	ldr	r3, [fp, #-24]
f001aff8:	ebffd121 	bl	f000f484 <cap_map_check>
f001affc:	e50b000c 	str	r0, [fp, #-12]
f001b000:	e51b300c 	ldr	r3, [fp, #-12]
f001b004:	e3530000 	cmp	r3, #0
f001b008:	aa000001 	bge	f001b014 <sys_map+0xb8>
f001b00c:	e51b300c 	ldr	r3, [fp, #-12]
f001b010:	ea00000a 	b	f001b040 <sys_map+0xe4>
f001b014:	e51b3018 	ldr	r3, [fp, #-24]
f001b018:	e1a03603 	lsl	r3, r3, #12
f001b01c:	e51b2008 	ldr	r2, [fp, #-8]
f001b020:	e59220b4 	ldr	r2, [r2, #180]	; 0xb4
f001b024:	e58d2000 	str	r2, [sp]
f001b028:	e51b0010 	ldr	r0, [fp, #-16]
f001b02c:	e51b1014 	ldr	r1, [fp, #-20]
f001b030:	e1a02003 	mov	r2, r3
f001b034:	e51b301c 	ldr	r3, [fp, #-28]
f001b038:	ebffdfd6 	bl	f0012f98 <add_mapping_space>
f001b03c:	e1a03000 	mov	r3, r0
f001b040:	e1a00003 	mov	r0, r3
f001b044:	e24bd004 	sub	sp, fp, #4
f001b048:	e8bd8800 	pop	{fp, pc}

f001b04c <sys_unmap>:
f001b04c:	e92d4800 	push	{fp, lr}
f001b050:	e28db004 	add	fp, sp, #4
f001b054:	e24dd020 	sub	sp, sp, #32
f001b058:	e50b0018 	str	r0, [fp, #-24]
f001b05c:	e50b101c 	str	r1, [fp, #-28]
f001b060:	e50b2020 	str	r2, [fp, #-32]
f001b064:	e3a03000 	mov	r3, #0
f001b068:	e50b3010 	str	r3, [fp, #-16]
f001b06c:	e3a03000 	mov	r3, #0
f001b070:	e50b3008 	str	r3, [fp, #-8]
f001b074:	e51b0020 	ldr	r0, [fp, #-32]
f001b078:	ebffbe40 	bl	f000a980 <tcb_find>
f001b07c:	e50b0014 	str	r0, [fp, #-20]
f001b080:	e51b3014 	ldr	r3, [fp, #-20]
f001b084:	e3530000 	cmp	r3, #0
f001b088:	1a000001 	bne	f001b094 <sys_unmap+0x48>
f001b08c:	e3e03002 	mvn	r3, #2
f001b090:	ea00002c 	b	f001b148 <sys_unmap+0xfc>
f001b094:	e51b301c 	ldr	r3, [fp, #-28]
f001b098:	e3530000 	cmp	r3, #0
f001b09c:	0a000002 	beq	f001b0ac <sys_unmap+0x60>
f001b0a0:	e51b3018 	ldr	r3, [fp, #-24]
f001b0a4:	e3530000 	cmp	r3, #0
f001b0a8:	1a000001 	bne	f001b0b4 <sys_unmap+0x68>
f001b0ac:	e3e03015 	mvn	r3, #21
f001b0b0:	ea000024 	b	f001b148 <sys_unmap+0xfc>
f001b0b4:	e51b0014 	ldr	r0, [fp, #-20]
f001b0b8:	e51b1018 	ldr	r1, [fp, #-24]
f001b0bc:	e51b201c 	ldr	r2, [fp, #-28]
f001b0c0:	ebffd121 	bl	f000f54c <cap_unmap_check>
f001b0c4:	e50b0010 	str	r0, [fp, #-16]
f001b0c8:	e51b3010 	ldr	r3, [fp, #-16]
f001b0cc:	e3530000 	cmp	r3, #0
f001b0d0:	aa000001 	bge	f001b0dc <sys_unmap+0x90>
f001b0d4:	e51b3010 	ldr	r3, [fp, #-16]
f001b0d8:	ea00001a 	b	f001b148 <sys_unmap+0xfc>
f001b0dc:	e3a03000 	mov	r3, #0
f001b0e0:	e50b300c 	str	r3, [fp, #-12]
f001b0e4:	ea000012 	b	f001b134 <sys_unmap+0xe8>
f001b0e8:	e51b3014 	ldr	r3, [fp, #-20]
f001b0ec:	e59320b4 	ldr	r2, [r3, #180]	; 0xb4
f001b0f0:	e51b300c 	ldr	r3, [fp, #-12]
f001b0f4:	e1a03603 	lsl	r3, r3, #12
f001b0f8:	e1a01003 	mov	r1, r3
f001b0fc:	e51b3018 	ldr	r3, [fp, #-24]
f001b100:	e0813003 	add	r3, r1, r3
f001b104:	e1a00002 	mov	r0, r2
f001b108:	e1a01003 	mov	r1, r3
f001b10c:	ebffe0e2 	bl	f001349c <remove_mapping_space>
f001b110:	e50b0010 	str	r0, [fp, #-16]
f001b114:	e51b3010 	ldr	r3, [fp, #-16]
f001b118:	e3530000 	cmp	r3, #0
f001b11c:	0a000001 	beq	f001b128 <sys_unmap+0xdc>
f001b120:	e51b3010 	ldr	r3, [fp, #-16]
f001b124:	e50b3008 	str	r3, [fp, #-8]
f001b128:	e51b300c 	ldr	r3, [fp, #-12]
f001b12c:	e2833001 	add	r3, r3, #1
f001b130:	e50b300c 	str	r3, [fp, #-12]
f001b134:	e51b200c 	ldr	r2, [fp, #-12]
f001b138:	e51b301c 	ldr	r3, [fp, #-28]
f001b13c:	e1520003 	cmp	r2, r3
f001b140:	3affffe8 	bcc	f001b0e8 <sys_unmap+0x9c>
f001b144:	e51b3008 	ldr	r3, [fp, #-8]
f001b148:	e1a00003 	mov	r0, r3
f001b14c:	e24bd004 	sub	sp, fp, #4
f001b150:	e8bd8800 	pop	{fp, pc}

f001b154 <link_init>:
f001b154:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f001b158:	e28db000 	add	fp, sp, #0
f001b15c:	e24dd00c 	sub	sp, sp, #12
f001b160:	e50b0008 	str	r0, [fp, #-8]
f001b164:	e51b3008 	ldr	r3, [fp, #-8]
f001b168:	e51b2008 	ldr	r2, [fp, #-8]
f001b16c:	e5832000 	str	r2, [r3]
f001b170:	e51b3008 	ldr	r3, [fp, #-8]
f001b174:	e51b2008 	ldr	r2, [fp, #-8]
f001b178:	e5832004 	str	r2, [r3, #4]
f001b17c:	e24bd000 	sub	sp, fp, #0
f001b180:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f001b184:	e12fff1e 	bx	lr

f001b188 <list_insert>:
f001b188:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f001b18c:	e28db000 	add	fp, sp, #0
f001b190:	e24dd014 	sub	sp, sp, #20
f001b194:	e50b0010 	str	r0, [fp, #-16]
f001b198:	e50b1014 	str	r1, [fp, #-20]
f001b19c:	e51b3014 	ldr	r3, [fp, #-20]
f001b1a0:	e5933000 	ldr	r3, [r3]
f001b1a4:	e50b3008 	str	r3, [fp, #-8]
f001b1a8:	e51b3010 	ldr	r3, [fp, #-16]
f001b1ac:	e51b2008 	ldr	r2, [fp, #-8]
f001b1b0:	e5832000 	str	r2, [r3]
f001b1b4:	e51b3008 	ldr	r3, [fp, #-8]
f001b1b8:	e51b2010 	ldr	r2, [fp, #-16]
f001b1bc:	e5832004 	str	r2, [r3, #4]
f001b1c0:	e51b3014 	ldr	r3, [fp, #-20]
f001b1c4:	e51b2010 	ldr	r2, [fp, #-16]
f001b1c8:	e5832000 	str	r2, [r3]
f001b1cc:	e51b3010 	ldr	r3, [fp, #-16]
f001b1d0:	e51b2014 	ldr	r2, [fp, #-20]
f001b1d4:	e5832004 	str	r2, [r3, #4]
f001b1d8:	e24bd000 	sub	sp, fp, #0
f001b1dc:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f001b1e0:	e12fff1e 	bx	lr

f001b1e4 <list_remove_init>:
f001b1e4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f001b1e8:	e28db000 	add	fp, sp, #0
f001b1ec:	e24dd014 	sub	sp, sp, #20
f001b1f0:	e50b0010 	str	r0, [fp, #-16]
f001b1f4:	e51b3010 	ldr	r3, [fp, #-16]
f001b1f8:	e5933004 	ldr	r3, [r3, #4]
f001b1fc:	e50b3008 	str	r3, [fp, #-8]
f001b200:	e51b3010 	ldr	r3, [fp, #-16]
f001b204:	e5933000 	ldr	r3, [r3]
f001b208:	e50b300c 	str	r3, [fp, #-12]
f001b20c:	e51b3008 	ldr	r3, [fp, #-8]
f001b210:	e51b200c 	ldr	r2, [fp, #-12]
f001b214:	e5832000 	str	r2, [r3]
f001b218:	e51b300c 	ldr	r3, [fp, #-12]
f001b21c:	e51b2008 	ldr	r2, [fp, #-8]
f001b220:	e5832004 	str	r2, [r3, #4]
f001b224:	e51b3010 	ldr	r3, [fp, #-16]
f001b228:	e51b2010 	ldr	r2, [fp, #-16]
f001b22c:	e5832000 	str	r2, [r3]
f001b230:	e51b3010 	ldr	r3, [fp, #-16]
f001b234:	e51b2010 	ldr	r2, [fp, #-16]
f001b238:	e5832004 	str	r2, [r3, #4]
f001b23c:	e24bd000 	sub	sp, fp, #0
f001b240:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f001b244:	e12fff1e 	bx	lr

f001b248 <list_empty>:
f001b248:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f001b24c:	e28db000 	add	fp, sp, #0
f001b250:	e24dd00c 	sub	sp, sp, #12
f001b254:	e50b0008 	str	r0, [fp, #-8]
f001b258:	e51b3008 	ldr	r3, [fp, #-8]
f001b25c:	e5932004 	ldr	r2, [r3, #4]
f001b260:	e51b3008 	ldr	r3, [fp, #-8]
f001b264:	e1520003 	cmp	r2, r3
f001b268:	1a000006 	bne	f001b288 <list_empty+0x40>
f001b26c:	e51b3008 	ldr	r3, [fp, #-8]
f001b270:	e5932000 	ldr	r2, [r3]
f001b274:	e51b3008 	ldr	r3, [fp, #-8]
f001b278:	e1520003 	cmp	r2, r3
f001b27c:	1a000001 	bne	f001b288 <list_empty+0x40>
f001b280:	e3a03001 	mov	r3, #1
f001b284:	ea000000 	b	f001b28c <list_empty+0x44>
f001b288:	e3a03000 	mov	r3, #0
f001b28c:	e1a00003 	mov	r0, r3
f001b290:	e24bd000 	sub	sp, fp, #0
f001b294:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f001b298:	e12fff1e 	bx	lr

f001b29c <waitqueue_head_init>:
f001b29c:	e92d4800 	push	{fp, lr}
f001b2a0:	e28db004 	add	fp, sp, #4
f001b2a4:	e24dd008 	sub	sp, sp, #8
f001b2a8:	e50b0008 	str	r0, [fp, #-8]
f001b2ac:	e51b0008 	ldr	r0, [fp, #-8]
f001b2b0:	e3a01000 	mov	r1, #0
f001b2b4:	e3a02010 	mov	r2, #16
f001b2b8:	ebffeb36 	bl	f0015f98 <memset>
f001b2bc:	e51b3008 	ldr	r3, [fp, #-8]
f001b2c0:	e2833008 	add	r3, r3, #8
f001b2c4:	e1a00003 	mov	r0, r3
f001b2c8:	ebffffa1 	bl	f001b154 <link_init>
f001b2cc:	e24bd004 	sub	sp, fp, #4
f001b2d0:	e8bd8800 	pop	{fp, pc}

f001b2d4 <mutex_init>:
f001b2d4:	e92d4800 	push	{fp, lr}
f001b2d8:	e28db004 	add	fp, sp, #4
f001b2dc:	e24dd008 	sub	sp, sp, #8
f001b2e0:	e50b0008 	str	r0, [fp, #-8]
f001b2e4:	e51b0008 	ldr	r0, [fp, #-8]
f001b2e8:	e3a01000 	mov	r1, #0
f001b2ec:	e3a02014 	mov	r2, #20
f001b2f0:	ebffeb28 	bl	f0015f98 <memset>
f001b2f4:	e51b3008 	ldr	r3, [fp, #-8]
f001b2f8:	e1a00003 	mov	r0, r3
f001b2fc:	ebffffe6 	bl	f001b29c <waitqueue_head_init>
f001b300:	e24bd004 	sub	sp, fp, #4
f001b304:	e8bd8800 	pop	{fp, pc}

f001b308 <current_task>:
f001b308:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f001b30c:	e28db000 	add	fp, sp, #0
f001b310:	e1a0300d 	mov	r3, sp
f001b314:	e3c33eff 	bic	r3, r3, #4080	; 0xff0
f001b318:	e3c3300f 	bic	r3, r3, #15
f001b31c:	e1a00003 	mov	r0, r3
f001b320:	e24bd000 	sub	sp, fp, #0
f001b324:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f001b328:	e12fff1e 	bx	lr

f001b32c <init_mutex_queue_head>:
f001b32c:	e92d4800 	push	{fp, lr}
f001b330:	e28db004 	add	fp, sp, #4
f001b334:	e24dd008 	sub	sp, sp, #8
f001b338:	e50b0008 	str	r0, [fp, #-8]
f001b33c:	e51b0008 	ldr	r0, [fp, #-8]
f001b340:	e3a01000 	mov	r1, #0
f001b344:	e3a02020 	mov	r2, #32
f001b348:	ebffeb12 	bl	f0015f98 <memset>
f001b34c:	e51b3008 	ldr	r3, [fp, #-8]
f001b350:	e1a00003 	mov	r0, r3
f001b354:	ebffff7e 	bl	f001b154 <link_init>
f001b358:	e51b3008 	ldr	r3, [fp, #-8]
f001b35c:	e2833008 	add	r3, r3, #8
f001b360:	e1a00003 	mov	r0, r3
f001b364:	ebffffda 	bl	f001b2d4 <mutex_init>
f001b368:	e24bd004 	sub	sp, fp, #4
f001b36c:	e8bd8800 	pop	{fp, pc}

f001b370 <mutex_queue_head_lock>:
f001b370:	e92d4800 	push	{fp, lr}
f001b374:	e28db004 	add	fp, sp, #4
f001b378:	e24dd008 	sub	sp, sp, #8
f001b37c:	e50b0008 	str	r0, [fp, #-8]
f001b380:	e51b3008 	ldr	r3, [fp, #-8]
f001b384:	e2833008 	add	r3, r3, #8
f001b388:	e1a00003 	mov	r0, r3
f001b38c:	ebffeeda 	bl	f0016efc <mutex_lock>
f001b390:	e24bd004 	sub	sp, fp, #4
f001b394:	e8bd8800 	pop	{fp, pc}

f001b398 <mutex_queue_head_unlock>:
f001b398:	e92d4800 	push	{fp, lr}
f001b39c:	e28db004 	add	fp, sp, #4
f001b3a0:	e24dd008 	sub	sp, sp, #8
f001b3a4:	e50b0008 	str	r0, [fp, #-8]
f001b3a8:	e51b3008 	ldr	r3, [fp, #-8]
f001b3ac:	e2833008 	add	r3, r3, #8
f001b3b0:	e1a00003 	mov	r0, r3
f001b3b4:	ebffef86 	bl	f00171d4 <mutex_unlock_async>
f001b3b8:	e24bd004 	sub	sp, fp, #4
f001b3bc:	e8bd8800 	pop	{fp, pc}

f001b3c0 <mutex_queue_init>:
f001b3c0:	e92d4800 	push	{fp, lr}
f001b3c4:	e28db004 	add	fp, sp, #4
f001b3c8:	e24dd008 	sub	sp, sp, #8
f001b3cc:	e50b0008 	str	r0, [fp, #-8]
f001b3d0:	e50b100c 	str	r1, [fp, #-12]
f001b3d4:	e51b3008 	ldr	r3, [fp, #-8]
f001b3d8:	e51b200c 	ldr	r2, [fp, #-12]
f001b3dc:	e5832004 	str	r2, [r3, #4]
f001b3e0:	e51b3008 	ldr	r3, [fp, #-8]
f001b3e4:	e2833008 	add	r3, r3, #8
f001b3e8:	e1a00003 	mov	r0, r3
f001b3ec:	ebffff58 	bl	f001b154 <link_init>
f001b3f0:	e51b3008 	ldr	r3, [fp, #-8]
f001b3f4:	e2833020 	add	r3, r3, #32
f001b3f8:	e1a00003 	mov	r0, r3
f001b3fc:	ebffffa6 	bl	f001b29c <waitqueue_head_init>
f001b400:	e51b3008 	ldr	r3, [fp, #-8]
f001b404:	e2833010 	add	r3, r3, #16
f001b408:	e1a00003 	mov	r0, r3
f001b40c:	ebffffa2 	bl	f001b29c <waitqueue_head_init>
f001b410:	e24bd004 	sub	sp, fp, #4
f001b414:	e8bd8800 	pop	{fp, pc}

f001b418 <mutex_control_add>:
f001b418:	e92d4800 	push	{fp, lr}
f001b41c:	e28db004 	add	fp, sp, #4
f001b420:	e24dd008 	sub	sp, sp, #8
f001b424:	e50b0008 	str	r0, [fp, #-8]
f001b428:	e50b100c 	str	r1, [fp, #-12]
f001b42c:	e51b300c 	ldr	r3, [fp, #-12]
f001b430:	e2833008 	add	r3, r3, #8
f001b434:	e1a00003 	mov	r0, r3
f001b438:	ebffff82 	bl	f001b248 <list_empty>
f001b43c:	e1a03000 	mov	r3, r0
f001b440:	e3530000 	cmp	r3, #0
f001b444:	1a000005 	bne	f001b460 <mutex_control_add+0x48>
f001b448:	e59f0044 	ldr	r0, [pc, #68]	; f001b494 <mutex_control_add+0x7c>
f001b44c:	e59f1044 	ldr	r1, [pc, #68]	; f001b498 <mutex_control_add+0x80>
f001b450:	e59f2044 	ldr	r2, [pc, #68]	; f001b49c <mutex_control_add+0x84>
f001b454:	e3a03033 	mov	r3, #51	; 0x33
f001b458:	ebffeaa3 	bl	f0015eec <printk>
f001b45c:	eafffffe 	b	f001b45c <mutex_control_add+0x44>
f001b460:	e51b300c 	ldr	r3, [fp, #-12]
f001b464:	e2832008 	add	r2, r3, #8
f001b468:	e51b3008 	ldr	r3, [fp, #-8]
f001b46c:	e1a00002 	mov	r0, r2
f001b470:	e1a01003 	mov	r1, r3
f001b474:	ebffff43 	bl	f001b188 <list_insert>
f001b478:	e51b3008 	ldr	r3, [fp, #-8]
f001b47c:	e593301c 	ldr	r3, [r3, #28]
f001b480:	e2832001 	add	r2, r3, #1
f001b484:	e51b3008 	ldr	r3, [fp, #-8]
f001b488:	e583201c 	str	r2, [r3, #28]
f001b48c:	e24bd004 	sub	sp, fp, #4
f001b490:	e8bd8800 	pop	{fp, pc}
f001b494:	f001f9f4 	.word	0xf001f9f4
f001b498:	f001fa1c 	.word	0xf001fa1c
f001b49c:	f001fa44 	.word	0xf001fa44

f001b4a0 <mutex_control_remove>:
f001b4a0:	e92d4800 	push	{fp, lr}
f001b4a4:	e28db004 	add	fp, sp, #4
f001b4a8:	e24dd008 	sub	sp, sp, #8
f001b4ac:	e50b0008 	str	r0, [fp, #-8]
f001b4b0:	e50b100c 	str	r1, [fp, #-12]
f001b4b4:	e51b300c 	ldr	r3, [fp, #-12]
f001b4b8:	e2833008 	add	r3, r3, #8
f001b4bc:	e1a00003 	mov	r0, r3
f001b4c0:	ebffff47 	bl	f001b1e4 <list_remove_init>
f001b4c4:	e51b3008 	ldr	r3, [fp, #-8]
f001b4c8:	e593301c 	ldr	r3, [r3, #28]
f001b4cc:	e2432001 	sub	r2, r3, #1
f001b4d0:	e51b3008 	ldr	r3, [fp, #-8]
f001b4d4:	e583201c 	str	r2, [r3, #28]
f001b4d8:	e24bd004 	sub	sp, fp, #4
f001b4dc:	e8bd8800 	pop	{fp, pc}

f001b4e0 <mutex_control_find>:
f001b4e0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f001b4e4:	e28db000 	add	fp, sp, #0
f001b4e8:	e24dd01c 	sub	sp, sp, #28
f001b4ec:	e50b0018 	str	r0, [fp, #-24]
f001b4f0:	e50b101c 	str	r1, [fp, #-28]
f001b4f4:	e51b3018 	ldr	r3, [fp, #-24]
f001b4f8:	e5933000 	ldr	r3, [r3]
f001b4fc:	e50b300c 	str	r3, [fp, #-12]
f001b500:	e51b300c 	ldr	r3, [fp, #-12]
f001b504:	e2433008 	sub	r3, r3, #8
f001b508:	e50b3008 	str	r3, [fp, #-8]
f001b50c:	ea00000c 	b	f001b544 <mutex_control_find+0x64>
f001b510:	e51b3008 	ldr	r3, [fp, #-8]
f001b514:	e5932004 	ldr	r2, [r3, #4]
f001b518:	e51b301c 	ldr	r3, [fp, #-28]
f001b51c:	e1520003 	cmp	r2, r3
f001b520:	1a000001 	bne	f001b52c <mutex_control_find+0x4c>
f001b524:	e51b3008 	ldr	r3, [fp, #-8]
f001b528:	ea00000b 	b	f001b55c <mutex_control_find+0x7c>
f001b52c:	e51b3008 	ldr	r3, [fp, #-8]
f001b530:	e5933008 	ldr	r3, [r3, #8]
f001b534:	e50b3010 	str	r3, [fp, #-16]
f001b538:	e51b3010 	ldr	r3, [fp, #-16]
f001b53c:	e2433008 	sub	r3, r3, #8
f001b540:	e50b3008 	str	r3, [fp, #-8]
f001b544:	e51b3008 	ldr	r3, [fp, #-8]
f001b548:	e2832008 	add	r2, r3, #8
f001b54c:	e51b3018 	ldr	r3, [fp, #-24]
f001b550:	e1520003 	cmp	r2, r3
f001b554:	1affffed 	bne	f001b510 <mutex_control_find+0x30>
f001b558:	e3a03000 	mov	r3, #0
f001b55c:	e1a00003 	mov	r0, r3
f001b560:	e24bd000 	sub	sp, fp, #0
f001b564:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f001b568:	e12fff1e 	bx	lr

f001b56c <mutex_control_create>:
f001b56c:	e92d4800 	push	{fp, lr}
f001b570:	e28db004 	add	fp, sp, #4
f001b574:	e24dd010 	sub	sp, sp, #16
f001b578:	e50b0010 	str	r0, [fp, #-16]
f001b57c:	ebffc245 	bl	f000be98 <mutex_cap_alloc>
f001b580:	e50b0008 	str	r0, [fp, #-8]
f001b584:	e51b3008 	ldr	r3, [fp, #-8]
f001b588:	e3530000 	cmp	r3, #0
f001b58c:	1a000001 	bne	f001b598 <mutex_control_create+0x2c>
f001b590:	e3a03000 	mov	r3, #0
f001b594:	ea000003 	b	f001b5a8 <mutex_control_create+0x3c>
f001b598:	e51b0008 	ldr	r0, [fp, #-8]
f001b59c:	e51b1010 	ldr	r1, [fp, #-16]
f001b5a0:	ebffff86 	bl	f001b3c0 <mutex_queue_init>
f001b5a4:	e51b3008 	ldr	r3, [fp, #-8]
f001b5a8:	e1a00003 	mov	r0, r3
f001b5ac:	e24bd004 	sub	sp, fp, #4
f001b5b0:	e8bd8800 	pop	{fp, pc}

f001b5b4 <mutex_control_delete>:
f001b5b4:	e92d4800 	push	{fp, lr}
f001b5b8:	e28db004 	add	fp, sp, #4
f001b5bc:	e24dd008 	sub	sp, sp, #8
f001b5c0:	e50b0008 	str	r0, [fp, #-8]
f001b5c4:	e51b3008 	ldr	r3, [fp, #-8]
f001b5c8:	e2833008 	add	r3, r3, #8
f001b5cc:	e1a00003 	mov	r0, r3
f001b5d0:	ebffff1c 	bl	f001b248 <list_empty>
f001b5d4:	e1a03000 	mov	r3, r0
f001b5d8:	e3530000 	cmp	r3, #0
f001b5dc:	1a000005 	bne	f001b5f8 <mutex_control_delete+0x44>
f001b5e0:	e59f00d8 	ldr	r0, [pc, #216]	; f001b6c0 <mutex_control_delete+0x10c>
f001b5e4:	e59f10d8 	ldr	r1, [pc, #216]	; f001b6c4 <mutex_control_delete+0x110>
f001b5e8:	e59f20d8 	ldr	r2, [pc, #216]	; f001b6c8 <mutex_control_delete+0x114>
f001b5ec:	e3a0305d 	mov	r3, #93	; 0x5d
f001b5f0:	ebffea3d 	bl	f0015eec <printk>
f001b5f4:	eafffffe 	b	f001b5f4 <mutex_control_delete+0x40>
f001b5f8:	e51b3008 	ldr	r3, [fp, #-8]
f001b5fc:	e5933010 	ldr	r3, [r3, #16]
f001b600:	e3530000 	cmp	r3, #0
f001b604:	0a000005 	beq	f001b620 <mutex_control_delete+0x6c>
f001b608:	e59f00b0 	ldr	r0, [pc, #176]	; f001b6c0 <mutex_control_delete+0x10c>
f001b60c:	e59f10b0 	ldr	r1, [pc, #176]	; f001b6c4 <mutex_control_delete+0x110>
f001b610:	e59f20b0 	ldr	r2, [pc, #176]	; f001b6c8 <mutex_control_delete+0x114>
f001b614:	e3a03060 	mov	r3, #96	; 0x60
f001b618:	ebffea33 	bl	f0015eec <printk>
f001b61c:	eafffffe 	b	f001b61c <mutex_control_delete+0x68>
f001b620:	e51b3008 	ldr	r3, [fp, #-8]
f001b624:	e5933020 	ldr	r3, [r3, #32]
f001b628:	e3530000 	cmp	r3, #0
f001b62c:	0a000005 	beq	f001b648 <mutex_control_delete+0x94>
f001b630:	e59f0088 	ldr	r0, [pc, #136]	; f001b6c0 <mutex_control_delete+0x10c>
f001b634:	e59f1088 	ldr	r1, [pc, #136]	; f001b6c4 <mutex_control_delete+0x110>
f001b638:	e59f2088 	ldr	r2, [pc, #136]	; f001b6c8 <mutex_control_delete+0x114>
f001b63c:	e3a03061 	mov	r3, #97	; 0x61
f001b640:	ebffea29 	bl	f0015eec <printk>
f001b644:	eafffffe 	b	f001b644 <mutex_control_delete+0x90>
f001b648:	e51b3008 	ldr	r3, [fp, #-8]
f001b64c:	e2833018 	add	r3, r3, #24
f001b650:	e1a00003 	mov	r0, r3
f001b654:	ebfffefb 	bl	f001b248 <list_empty>
f001b658:	e1a03000 	mov	r3, r0
f001b65c:	e3530000 	cmp	r3, #0
f001b660:	1a000005 	bne	f001b67c <mutex_control_delete+0xc8>
f001b664:	e59f0054 	ldr	r0, [pc, #84]	; f001b6c0 <mutex_control_delete+0x10c>
f001b668:	e59f1054 	ldr	r1, [pc, #84]	; f001b6c4 <mutex_control_delete+0x110>
f001b66c:	e59f2054 	ldr	r2, [pc, #84]	; f001b6c8 <mutex_control_delete+0x114>
f001b670:	e3a03062 	mov	r3, #98	; 0x62
f001b674:	ebffea1c 	bl	f0015eec <printk>
f001b678:	eafffffe 	b	f001b678 <mutex_control_delete+0xc4>
f001b67c:	e51b3008 	ldr	r3, [fp, #-8]
f001b680:	e2833028 	add	r3, r3, #40	; 0x28
f001b684:	e1a00003 	mov	r0, r3
f001b688:	ebfffeee 	bl	f001b248 <list_empty>
f001b68c:	e1a03000 	mov	r3, r0
f001b690:	e3530000 	cmp	r3, #0
f001b694:	1a000005 	bne	f001b6b0 <mutex_control_delete+0xfc>
f001b698:	e59f0020 	ldr	r0, [pc, #32]	; f001b6c0 <mutex_control_delete+0x10c>
f001b69c:	e59f1020 	ldr	r1, [pc, #32]	; f001b6c4 <mutex_control_delete+0x110>
f001b6a0:	e59f2020 	ldr	r2, [pc, #32]	; f001b6c8 <mutex_control_delete+0x114>
f001b6a4:	e3a03063 	mov	r3, #99	; 0x63
f001b6a8:	ebffea0f 	bl	f0015eec <printk>
f001b6ac:	eafffffe 	b	f001b6ac <mutex_control_delete+0xf8>
f001b6b0:	e51b0008 	ldr	r0, [fp, #-8]
f001b6b4:	ebffc2b3 	bl	f000c188 <mutex_cap_free>
f001b6b8:	e24bd004 	sub	sp, fp, #4
f001b6bc:	e8bd8800 	pop	{fp, pc}
f001b6c0:	f001f9f4 	.word	0xf001f9f4
f001b6c4:	f001fa1c 	.word	0xf001fa1c
f001b6c8:	f001fa58 	.word	0xf001fa58

f001b6cc <mutex_control_lock>:
f001b6cc:	e92d4800 	push	{fp, lr}
f001b6d0:	e28db004 	add	fp, sp, #4
f001b6d4:	e24dd018 	sub	sp, sp, #24
f001b6d8:	e50b0018 	str	r0, [fp, #-24]
f001b6dc:	e50b101c 	str	r1, [fp, #-28]
f001b6e0:	e51b0018 	ldr	r0, [fp, #-24]
f001b6e4:	ebffff21 	bl	f001b370 <mutex_queue_head_lock>
f001b6e8:	e51b0018 	ldr	r0, [fp, #-24]
f001b6ec:	e51b101c 	ldr	r1, [fp, #-28]
f001b6f0:	ebffff7a 	bl	f001b4e0 <mutex_control_find>
f001b6f4:	e50b0008 	str	r0, [fp, #-8]
f001b6f8:	e51b3008 	ldr	r3, [fp, #-8]
f001b6fc:	e3530000 	cmp	r3, #0
f001b700:	1a00000d 	bne	f001b73c <mutex_control_lock+0x70>
f001b704:	e51b001c 	ldr	r0, [fp, #-28]
f001b708:	ebffff97 	bl	f001b56c <mutex_control_create>
f001b70c:	e50b0008 	str	r0, [fp, #-8]
f001b710:	e51b3008 	ldr	r3, [fp, #-8]
f001b714:	e3530000 	cmp	r3, #0
f001b718:	1a000003 	bne	f001b72c <mutex_control_lock+0x60>
f001b71c:	e51b0018 	ldr	r0, [fp, #-24]
f001b720:	ebffff1c 	bl	f001b398 <mutex_queue_head_unlock>
f001b724:	e3e0300b 	mvn	r3, #11
f001b728:	ea00002f 	b	f001b7ec <mutex_control_lock+0x120>
f001b72c:	e51b0018 	ldr	r0, [fp, #-24]
f001b730:	e51b1008 	ldr	r1, [fp, #-8]
f001b734:	ebffff37 	bl	f001b418 <mutex_control_add>
f001b738:	ea00001a 	b	f001b7a8 <mutex_control_lock+0xdc>
f001b73c:	e51b3008 	ldr	r3, [fp, #-8]
f001b740:	e5933020 	ldr	r3, [r3, #32]
f001b744:	e3530000 	cmp	r3, #0
f001b748:	0a000016 	beq	f001b7a8 <mutex_control_lock+0xdc>
f001b74c:	e51b3008 	ldr	r3, [fp, #-8]
f001b750:	e5933000 	ldr	r3, [r3]
f001b754:	e2432001 	sub	r2, r3, #1
f001b758:	e51b3008 	ldr	r3, [fp, #-8]
f001b75c:	e5832000 	str	r2, [r3]
f001b760:	e51b3008 	ldr	r3, [fp, #-8]
f001b764:	e5933000 	ldr	r3, [r3]
f001b768:	e3530000 	cmp	r3, #0
f001b76c:	1a000009 	bne	f001b798 <mutex_control_lock+0xcc>
f001b770:	e51b3008 	ldr	r3, [fp, #-8]
f001b774:	e2833020 	add	r3, r3, #32
f001b778:	e1a00003 	mov	r0, r3
f001b77c:	e3a01000 	mov	r1, #0
f001b780:	ebffec94 	bl	f00169d8 <wake_up>
f001b784:	e51b0018 	ldr	r0, [fp, #-24]
f001b788:	e51b1008 	ldr	r1, [fp, #-8]
f001b78c:	ebffff43 	bl	f001b4a0 <mutex_control_remove>
f001b790:	e51b0008 	ldr	r0, [fp, #-8]
f001b794:	ebffff86 	bl	f001b5b4 <mutex_control_delete>
f001b798:	e51b0018 	ldr	r0, [fp, #-24]
f001b79c:	ebfffefd 	bl	f001b398 <mutex_queue_head_unlock>
f001b7a0:	e3a03000 	mov	r3, #0
f001b7a4:	ea000010 	b	f001b7ec <mutex_control_lock+0x120>
f001b7a8:	e24b3014 	sub	r3, fp, #20
f001b7ac:	e50b3014 	str	r3, [fp, #-20]
f001b7b0:	e24b3014 	sub	r3, fp, #20
f001b7b4:	e50b3010 	str	r3, [fp, #-16]
f001b7b8:	ebfffed2 	bl	f001b308 <current_task>
f001b7bc:	e1a03000 	mov	r3, r0
f001b7c0:	e50b300c 	str	r3, [fp, #-12]
f001b7c4:	e51b3008 	ldr	r3, [fp, #-8]
f001b7c8:	e2832010 	add	r2, r3, #16
f001b7cc:	e24b3014 	sub	r3, fp, #20
f001b7d0:	e1a00002 	mov	r0, r2
f001b7d4:	e1a01003 	mov	r1, r3
f001b7d8:	ebffebb8 	bl	f00166c0 <wait_on_prepare>
f001b7dc:	e51b0018 	ldr	r0, [fp, #-24]
f001b7e0:	ebfffeec 	bl	f001b398 <mutex_queue_head_unlock>
f001b7e4:	ebffeba1 	bl	f0016670 <wait_on_prepared_wait>
f001b7e8:	e1a03000 	mov	r3, r0
f001b7ec:	e1a00003 	mov	r0, r3
f001b7f0:	e24bd004 	sub	sp, fp, #4
f001b7f4:	e8bd8800 	pop	{fp, pc}

f001b7f8 <mutex_control_unlock>:
f001b7f8:	e92d4800 	push	{fp, lr}
f001b7fc:	e28db004 	add	fp, sp, #4
f001b800:	e24dd030 	sub	sp, sp, #48	; 0x30
f001b804:	e50b0028 	str	r0, [fp, #-40]	; 0x28
f001b808:	e50b102c 	str	r1, [fp, #-44]	; 0x2c
f001b80c:	e50b2030 	str	r2, [fp, #-48]	; 0x30
f001b810:	e51b0028 	ldr	r0, [fp, #-40]	; 0x28
f001b814:	ebfffed5 	bl	f001b370 <mutex_queue_head_lock>
f001b818:	e51b0028 	ldr	r0, [fp, #-40]	; 0x28
f001b81c:	e51b102c 	ldr	r1, [fp, #-44]	; 0x2c
f001b820:	ebffff2e 	bl	f001b4e0 <mutex_control_find>
f001b824:	e50b0008 	str	r0, [fp, #-8]
f001b828:	e51b3008 	ldr	r3, [fp, #-8]
f001b82c:	e3530000 	cmp	r3, #0
f001b830:	1a000021 	bne	f001b8bc <mutex_control_unlock+0xc4>
f001b834:	e51b002c 	ldr	r0, [fp, #-44]	; 0x2c
f001b838:	ebffff4b 	bl	f001b56c <mutex_control_create>
f001b83c:	e50b0008 	str	r0, [fp, #-8]
f001b840:	e51b3008 	ldr	r3, [fp, #-8]
f001b844:	e3530000 	cmp	r3, #0
f001b848:	1a000003 	bne	f001b85c <mutex_control_unlock+0x64>
f001b84c:	e51b0028 	ldr	r0, [fp, #-40]	; 0x28
f001b850:	ebfffed0 	bl	f001b398 <mutex_queue_head_unlock>
f001b854:	e3e0300b 	mvn	r3, #11
f001b858:	ea00005c 	b	f001b9d0 <mutex_control_unlock+0x1d8>
f001b85c:	e51b3008 	ldr	r3, [fp, #-8]
f001b860:	e51b2030 	ldr	r2, [fp, #-48]	; 0x30
f001b864:	e5832000 	str	r2, [r3]
f001b868:	e51b0028 	ldr	r0, [fp, #-40]	; 0x28
f001b86c:	e51b1008 	ldr	r1, [fp, #-8]
f001b870:	ebfffee8 	bl	f001b418 <mutex_control_add>
f001b874:	e24b3014 	sub	r3, fp, #20
f001b878:	e50b3014 	str	r3, [fp, #-20]
f001b87c:	e24b3014 	sub	r3, fp, #20
f001b880:	e50b3010 	str	r3, [fp, #-16]
f001b884:	ebfffe9f 	bl	f001b308 <current_task>
f001b888:	e1a03000 	mov	r3, r0
f001b88c:	e50b300c 	str	r3, [fp, #-12]
f001b890:	e51b3008 	ldr	r3, [fp, #-8]
f001b894:	e2832020 	add	r2, r3, #32
f001b898:	e24b3014 	sub	r3, fp, #20
f001b89c:	e1a00002 	mov	r0, r2
f001b8a0:	e1a01003 	mov	r1, r3
f001b8a4:	ebffeb85 	bl	f00166c0 <wait_on_prepare>
f001b8a8:	e51b0028 	ldr	r0, [fp, #-40]	; 0x28
f001b8ac:	ebfffeb9 	bl	f001b398 <mutex_queue_head_unlock>
f001b8b0:	ebffeb6e 	bl	f0016670 <wait_on_prepared_wait>
f001b8b4:	e1a03000 	mov	r3, r0
f001b8b8:	ea000044 	b	f001b9d0 <mutex_control_unlock+0x1d8>
f001b8bc:	e51b3008 	ldr	r3, [fp, #-8]
f001b8c0:	e5932000 	ldr	r2, [r3]
f001b8c4:	e51b3030 	ldr	r3, [fp, #-48]	; 0x30
f001b8c8:	e0822003 	add	r2, r2, r3
f001b8cc:	e51b3008 	ldr	r3, [fp, #-8]
f001b8d0:	e5832000 	str	r2, [r3]
f001b8d4:	e51b3008 	ldr	r3, [fp, #-8]
f001b8d8:	e5933020 	ldr	r3, [r3, #32]
f001b8dc:	e3530000 	cmp	r3, #0
f001b8e0:	0a000005 	beq	f001b8fc <mutex_control_unlock+0x104>
f001b8e4:	e51b3008 	ldr	r3, [fp, #-8]
f001b8e8:	e2833020 	add	r3, r3, #32
f001b8ec:	e1a00003 	mov	r0, r3
f001b8f0:	e3a01000 	mov	r1, #0
f001b8f4:	ebffec37 	bl	f00169d8 <wake_up>
f001b8f8:	ea00000a 	b	f001b928 <mutex_control_unlock+0x130>
f001b8fc:	ea000009 	b	f001b928 <mutex_control_unlock+0x130>
f001b900:	e51b3008 	ldr	r3, [fp, #-8]
f001b904:	e5933000 	ldr	r3, [r3]
f001b908:	e2432001 	sub	r2, r3, #1
f001b90c:	e51b3008 	ldr	r3, [fp, #-8]
f001b910:	e5832000 	str	r2, [r3]
f001b914:	e51b3008 	ldr	r3, [fp, #-8]
f001b918:	e2833010 	add	r3, r3, #16
f001b91c:	e1a00003 	mov	r0, r3
f001b920:	e3a01000 	mov	r1, #0
f001b924:	ebffec2b 	bl	f00169d8 <wake_up>
f001b928:	e51b3008 	ldr	r3, [fp, #-8]
f001b92c:	e5933000 	ldr	r3, [r3]
f001b930:	e3530000 	cmp	r3, #0
f001b934:	0a000003 	beq	f001b948 <mutex_control_unlock+0x150>
f001b938:	e51b3008 	ldr	r3, [fp, #-8]
f001b93c:	e5933010 	ldr	r3, [r3, #16]
f001b940:	e3530000 	cmp	r3, #0
f001b944:	1affffed 	bne	f001b900 <mutex_control_unlock+0x108>
f001b948:	e51b3008 	ldr	r3, [fp, #-8]
f001b94c:	e5933000 	ldr	r3, [r3]
f001b950:	e3530000 	cmp	r3, #0
f001b954:	1a00000c 	bne	f001b98c <mutex_control_unlock+0x194>
f001b958:	e51b3008 	ldr	r3, [fp, #-8]
f001b95c:	e5933010 	ldr	r3, [r3, #16]
f001b960:	e3530000 	cmp	r3, #0
f001b964:	1a000004 	bne	f001b97c <mutex_control_unlock+0x184>
f001b968:	e51b0028 	ldr	r0, [fp, #-40]	; 0x28
f001b96c:	e51b1008 	ldr	r1, [fp, #-8]
f001b970:	ebfffeca 	bl	f001b4a0 <mutex_control_remove>
f001b974:	e51b0008 	ldr	r0, [fp, #-8]
f001b978:	ebffff0d 	bl	f001b5b4 <mutex_control_delete>
f001b97c:	e51b0028 	ldr	r0, [fp, #-40]	; 0x28
f001b980:	ebfffe84 	bl	f001b398 <mutex_queue_head_unlock>
f001b984:	e3a03000 	mov	r3, #0
f001b988:	ea000010 	b	f001b9d0 <mutex_control_unlock+0x1d8>
f001b98c:	e24b3020 	sub	r3, fp, #32
f001b990:	e50b3020 	str	r3, [fp, #-32]
f001b994:	e24b3020 	sub	r3, fp, #32
f001b998:	e50b301c 	str	r3, [fp, #-28]
f001b99c:	ebfffe59 	bl	f001b308 <current_task>
f001b9a0:	e1a03000 	mov	r3, r0
f001b9a4:	e50b3018 	str	r3, [fp, #-24]
f001b9a8:	e51b3008 	ldr	r3, [fp, #-8]
f001b9ac:	e2832020 	add	r2, r3, #32
f001b9b0:	e24b3020 	sub	r3, fp, #32
f001b9b4:	e1a00002 	mov	r0, r2
f001b9b8:	e1a01003 	mov	r1, r3
f001b9bc:	ebffeb3f 	bl	f00166c0 <wait_on_prepare>
f001b9c0:	e51b0028 	ldr	r0, [fp, #-40]	; 0x28
f001b9c4:	ebfffe73 	bl	f001b398 <mutex_queue_head_unlock>
f001b9c8:	ebffeb28 	bl	f0016670 <wait_on_prepared_wait>
f001b9cc:	e1a03000 	mov	r3, r0
f001b9d0:	e1a00003 	mov	r0, r3
f001b9d4:	e24bd004 	sub	sp, fp, #4
f001b9d8:	e8bd8800 	pop	{fp, pc}

f001b9dc <sys_mutex_control>:
f001b9dc:	e92d4800 	push	{fp, lr}
f001b9e0:	e28db004 	add	fp, sp, #4
f001b9e4:	e24dd018 	sub	sp, sp, #24
f001b9e8:	e50b0018 	str	r0, [fp, #-24]
f001b9ec:	e50b101c 	str	r1, [fp, #-28]
f001b9f0:	e51b301c 	ldr	r3, [fp, #-28]
f001b9f4:	e203320f 	and	r3, r3, #-268435456	; 0xf0000000
f001b9f8:	e50b300c 	str	r3, [fp, #-12]
f001b9fc:	e51b301c 	ldr	r3, [fp, #-28]
f001ba00:	e3c3320f 	bic	r3, r3, #-268435456	; 0xf0000000
f001ba04:	e50b3010 	str	r3, [fp, #-16]
f001ba08:	e51b3018 	ldr	r3, [fp, #-24]
f001ba0c:	e3730211 	cmn	r3, #268435457	; 0x10000001
f001ba10:	9a000007 	bls	f001ba34 <sys_mutex_control+0x58>
f001ba14:	e51b3018 	ldr	r3, [fp, #-24]
f001ba18:	e3730342 	cmn	r3, #134217729	; 0x8000001
f001ba1c:	8a000004 	bhi	f001ba34 <sys_mutex_control+0x58>
f001ba20:	e59f00d4 	ldr	r0, [pc, #212]	; f001bafc <sys_mutex_control+0x120>
f001ba24:	e59f10d4 	ldr	r1, [pc, #212]	; f001bb00 <sys_mutex_control+0x124>
f001ba28:	ebffe92f 	bl	f0015eec <printk>
f001ba2c:	e3e03015 	mvn	r3, #21
f001ba30:	ea00002e 	b	f001baf0 <sys_mutex_control+0x114>
f001ba34:	e51b300c 	ldr	r3, [fp, #-12]
f001ba38:	e3530201 	cmp	r3, #268435456	; 0x10000000
f001ba3c:	0a000004 	beq	f001ba54 <sys_mutex_control+0x78>
f001ba40:	e51b300c 	ldr	r3, [fp, #-12]
f001ba44:	e3530202 	cmp	r3, #536870912	; 0x20000000
f001ba48:	0a000001 	beq	f001ba54 <sys_mutex_control+0x78>
f001ba4c:	e3e03000 	mvn	r3, #0
f001ba50:	ea000026 	b	f001baf0 <sys_mutex_control+0x114>
f001ba54:	ebfffe2b 	bl	f001b308 <current_task>
f001ba58:	e1a03000 	mov	r3, r0
f001ba5c:	e59330b4 	ldr	r3, [r3, #180]	; 0xb4
f001ba60:	e5933010 	ldr	r3, [r3, #16]
f001ba64:	e1a00003 	mov	r0, r3
f001ba68:	e51b1018 	ldr	r1, [fp, #-24]
f001ba6c:	ebffdca6 	bl	f0012d0c <virt_to_phys_by_pgd>
f001ba70:	e50b0014 	str	r0, [fp, #-20]
f001ba74:	e51b3014 	ldr	r3, [fp, #-20]
f001ba78:	e3530000 	cmp	r3, #0
f001ba7c:	1a000001 	bne	f001ba88 <sys_mutex_control+0xac>
f001ba80:	e3e03015 	mvn	r3, #21
f001ba84:	ea000019 	b	f001baf0 <sys_mutex_control+0x114>
f001ba88:	e51b300c 	ldr	r3, [fp, #-12]
f001ba8c:	e3530201 	cmp	r3, #268435456	; 0x10000000
f001ba90:	0a000002 	beq	f001baa0 <sys_mutex_control+0xc4>
f001ba94:	e3530202 	cmp	r3, #536870912	; 0x20000000
f001ba98:	0a000009 	beq	f001bac4 <sys_mutex_control+0xe8>
f001ba9c:	ea000012 	b	f001baec <sys_mutex_control+0x110>
f001baa0:	ebfffe18 	bl	f001b308 <current_task>
f001baa4:	e1a03000 	mov	r3, r0
f001baa8:	e59330b8 	ldr	r3, [r3, #184]	; 0xb8
f001baac:	e2833080 	add	r3, r3, #128	; 0x80
f001bab0:	e1a00003 	mov	r0, r3
f001bab4:	e51b1014 	ldr	r1, [fp, #-20]
f001bab8:	ebffff03 	bl	f001b6cc <mutex_control_lock>
f001babc:	e50b0008 	str	r0, [fp, #-8]
f001bac0:	ea000009 	b	f001baec <sys_mutex_control+0x110>
f001bac4:	ebfffe0f 	bl	f001b308 <current_task>
f001bac8:	e1a03000 	mov	r3, r0
f001bacc:	e59330b8 	ldr	r3, [r3, #184]	; 0xb8
f001bad0:	e2833080 	add	r3, r3, #128	; 0x80
f001bad4:	e1a00003 	mov	r0, r3
f001bad8:	e51b1014 	ldr	r1, [fp, #-20]
f001badc:	e51b2010 	ldr	r2, [fp, #-16]
f001bae0:	ebffff44 	bl	f001b7f8 <mutex_control_unlock>
f001bae4:	e50b0008 	str	r0, [fp, #-8]
f001bae8:	e1a00000 	nop			; (mov r0, r0)
f001baec:	e51b3008 	ldr	r3, [fp, #-8]
f001baf0:	e1a00003 	mov	r0, r3
f001baf4:	e24bd004 	sub	sp, fp, #4
f001baf8:	e8bd8800 	pop	{fp, pc}
f001bafc:	f001fa2c 	.word	0xf001fa2c
f001bb00:	f001fa70 	.word	0xf001fa70

f001bb04 <current_task>:
f001bb04:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f001bb08:	e28db000 	add	fp, sp, #0
f001bb0c:	e1a0300d 	mov	r3, sp
f001bb10:	e3c33eff 	bic	r3, r3, #4080	; 0xff0
f001bb14:	e3c3300f 	bic	r3, r3, #15
f001bb18:	e1a00003 	mov	r0, r3
f001bb1c:	e24bd000 	sub	sp, fp, #0
f001bb20:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f001bb24:	e12fff1e 	bx	lr

f001bb28 <cap_read_all>:
f001bb28:	e92d4810 	push	{r4, fp, lr}
f001bb2c:	e28db008 	add	fp, sp, #8
f001bb30:	e24dd024 	sub	sp, sp, #36	; 0x24
f001bb34:	e50b0028 	str	r0, [fp, #-40]	; 0x28
f001bb38:	e3a03000 	mov	r3, #0
f001bb3c:	e50b3014 	str	r3, [fp, #-20]
f001bb40:	ebffffef 	bl	f001bb04 <current_task>
f001bb44:	e1a03000 	mov	r3, r0
f001bb48:	e59330b4 	ldr	r3, [r3, #180]	; 0xb4
f001bb4c:	e5933018 	ldr	r3, [r3, #24]
f001bb50:	e50b3018 	str	r3, [fp, #-24]
f001bb54:	e51b3018 	ldr	r3, [fp, #-24]
f001bb58:	e50b3010 	str	r3, [fp, #-16]
f001bb5c:	ea000014 	b	f001bbb4 <cap_read_all+0x8c>
f001bb60:	e51b2014 	ldr	r2, [fp, #-20]
f001bb64:	e1a03002 	mov	r3, r2
f001bb68:	e1a03103 	lsl	r3, r3, #2
f001bb6c:	e0833002 	add	r3, r3, r2
f001bb70:	e1a03083 	lsl	r3, r3, #1
f001bb74:	e0833002 	add	r3, r3, r2
f001bb78:	e1a03103 	lsl	r3, r3, #2
f001bb7c:	e51b2028 	ldr	r2, [fp, #-40]	; 0x28
f001bb80:	e0823003 	add	r3, r2, r3
f001bb84:	e1a00003 	mov	r0, r3
f001bb88:	e51b1010 	ldr	r1, [fp, #-16]
f001bb8c:	e3a0202c 	mov	r2, #44	; 0x2c
f001bb90:	ebffe90e 	bl	f0015fd0 <memcpy>
f001bb94:	e51b3014 	ldr	r3, [fp, #-20]
f001bb98:	e2833001 	add	r3, r3, #1
f001bb9c:	e50b3014 	str	r3, [fp, #-20]
f001bba0:	e51b3010 	ldr	r3, [fp, #-16]
f001bba4:	e5933000 	ldr	r3, [r3]
f001bba8:	e50b301c 	str	r3, [fp, #-28]
f001bbac:	e51b301c 	ldr	r3, [fp, #-28]
f001bbb0:	e50b3010 	str	r3, [fp, #-16]
f001bbb4:	e51b4010 	ldr	r4, [fp, #-16]
f001bbb8:	ebffffd1 	bl	f001bb04 <current_task>
f001bbbc:	e1a03000 	mov	r3, r0
f001bbc0:	e59330b4 	ldr	r3, [r3, #180]	; 0xb4
f001bbc4:	e2833018 	add	r3, r3, #24
f001bbc8:	e1540003 	cmp	r4, r3
f001bbcc:	1affffe3 	bne	f001bb60 <cap_read_all+0x38>
f001bbd0:	ebffffcb 	bl	f001bb04 <current_task>
f001bbd4:	e1a03000 	mov	r3, r0
f001bbd8:	e59330b8 	ldr	r3, [r3, #184]	; 0xb8
f001bbdc:	e59330a4 	ldr	r3, [r3, #164]	; 0xa4
f001bbe0:	e50b3020 	str	r3, [fp, #-32]
f001bbe4:	e51b3020 	ldr	r3, [fp, #-32]
f001bbe8:	e50b3010 	str	r3, [fp, #-16]
f001bbec:	ea000014 	b	f001bc44 <cap_read_all+0x11c>
f001bbf0:	e51b2014 	ldr	r2, [fp, #-20]
f001bbf4:	e1a03002 	mov	r3, r2
f001bbf8:	e1a03103 	lsl	r3, r3, #2
f001bbfc:	e0833002 	add	r3, r3, r2
f001bc00:	e1a03083 	lsl	r3, r3, #1
f001bc04:	e0833002 	add	r3, r3, r2
f001bc08:	e1a03103 	lsl	r3, r3, #2
f001bc0c:	e51b2028 	ldr	r2, [fp, #-40]	; 0x28
f001bc10:	e0823003 	add	r3, r2, r3
f001bc14:	e1a00003 	mov	r0, r3
f001bc18:	e51b1010 	ldr	r1, [fp, #-16]
f001bc1c:	e3a0202c 	mov	r2, #44	; 0x2c
f001bc20:	ebffe8ea 	bl	f0015fd0 <memcpy>
f001bc24:	e51b3014 	ldr	r3, [fp, #-20]
f001bc28:	e2833001 	add	r3, r3, #1
f001bc2c:	e50b3014 	str	r3, [fp, #-20]
f001bc30:	e51b3010 	ldr	r3, [fp, #-16]
f001bc34:	e5933000 	ldr	r3, [r3]
f001bc38:	e50b3024 	str	r3, [fp, #-36]	; 0x24
f001bc3c:	e51b3024 	ldr	r3, [fp, #-36]	; 0x24
f001bc40:	e50b3010 	str	r3, [fp, #-16]
f001bc44:	e51b4010 	ldr	r4, [fp, #-16]
f001bc48:	ebffffad 	bl	f001bb04 <current_task>
f001bc4c:	e1a03000 	mov	r3, r0
f001bc50:	e59330b8 	ldr	r3, [r3, #184]	; 0xb8
f001bc54:	e28330a4 	add	r3, r3, #164	; 0xa4
f001bc58:	e1540003 	cmp	r4, r3
f001bc5c:	1affffe3 	bne	f001bbf0 <cap_read_all+0xc8>
f001bc60:	e3a03000 	mov	r3, #0
f001bc64:	e1a00003 	mov	r0, r3
f001bc68:	e24bd008 	sub	sp, fp, #8
f001bc6c:	e8bd8810 	pop	{r4, fp, pc}

f001bc70 <sys_capability_control>:
f001bc70:	e92d4810 	push	{r4, fp, lr}
f001bc74:	e28db008 	add	fp, sp, #8
f001bc78:	e24dd01c 	sub	sp, sp, #28
f001bc7c:	e50b0018 	str	r0, [fp, #-24]
f001bc80:	e50b101c 	str	r1, [fp, #-28]
f001bc84:	e50b2020 	str	r2, [fp, #-32]
f001bc88:	e3a03000 	mov	r3, #0
f001bc8c:	e50b3010 	str	r3, [fp, #-16]
f001bc90:	e51b3018 	ldr	r3, [fp, #-24]
f001bc94:	e3530000 	cmp	r3, #0
f001bc98:	0a000002 	beq	f001bca8 <sys_capability_control+0x38>
f001bc9c:	e3530001 	cmp	r3, #1
f001bca0:	0a00000d 	beq	f001bcdc <sys_capability_control+0x6c>
f001bca4:	ea000025 	b	f001bd40 <sys_capability_control+0xd0>
f001bca8:	e51b3020 	ldr	r3, [fp, #-32]
f001bcac:	e1a00003 	mov	r0, r3
f001bcb0:	e3a01004 	mov	r1, #4
f001bcb4:	e3a02001 	mov	r2, #1
f001bcb8:	e3a03001 	mov	r3, #1
f001bcbc:	ebffbf0b 	bl	f000b8f0 <check_access>
f001bcc0:	e50b0010 	str	r0, [fp, #-16]
f001bcc4:	e51b3010 	ldr	r3, [fp, #-16]
f001bcc8:	e3530000 	cmp	r3, #0
f001bccc:	aa000001 	bge	f001bcd8 <sys_capability_control+0x68>
f001bcd0:	e51b3010 	ldr	r3, [fp, #-16]
f001bcd4:	ea000030 	b	f001bd9c <sys_capability_control+0x12c>
f001bcd8:	ea00001a 	b	f001bd48 <sys_capability_control+0xd8>
f001bcdc:	e51b4020 	ldr	r4, [fp, #-32]
f001bce0:	ebffff87 	bl	f001bb04 <current_task>
f001bce4:	e1a03000 	mov	r3, r0
f001bce8:	e1a00003 	mov	r0, r3
f001bcec:	ebffca57 	bl	f000e650 <cap_count>
f001bcf0:	e1a03000 	mov	r3, r0
f001bcf4:	e1a02003 	mov	r2, r3
f001bcf8:	e1a03002 	mov	r3, r2
f001bcfc:	e1a03103 	lsl	r3, r3, #2
f001bd00:	e0833002 	add	r3, r3, r2
f001bd04:	e1a03083 	lsl	r3, r3, #1
f001bd08:	e0833002 	add	r3, r3, r2
f001bd0c:	e1a03103 	lsl	r3, r3, #2
f001bd10:	e1a00004 	mov	r0, r4
f001bd14:	e1a01003 	mov	r1, r3
f001bd18:	e3a02001 	mov	r2, #1
f001bd1c:	e3a03001 	mov	r3, #1
f001bd20:	ebffbef2 	bl	f000b8f0 <check_access>
f001bd24:	e50b0010 	str	r0, [fp, #-16]
f001bd28:	e51b3010 	ldr	r3, [fp, #-16]
f001bd2c:	e3530000 	cmp	r3, #0
f001bd30:	aa000001 	bge	f001bd3c <sys_capability_control+0xcc>
f001bd34:	e51b3010 	ldr	r3, [fp, #-16]
f001bd38:	ea000017 	b	f001bd9c <sys_capability_control+0x12c>
f001bd3c:	ea000001 	b	f001bd48 <sys_capability_control+0xd8>
f001bd40:	e3e03015 	mvn	r3, #21
f001bd44:	ea000014 	b	f001bd9c <sys_capability_control+0x12c>
f001bd48:	e51b3018 	ldr	r3, [fp, #-24]
f001bd4c:	e3530000 	cmp	r3, #0
f001bd50:	0a000002 	beq	f001bd60 <sys_capability_control+0xf0>
f001bd54:	e3530001 	cmp	r3, #1
f001bd58:	0a000008 	beq	f001bd80 <sys_capability_control+0x110>
f001bd5c:	ea00000b 	b	f001bd90 <sys_capability_control+0x120>
f001bd60:	ebffff67 	bl	f001bb04 <current_task>
f001bd64:	e1a03000 	mov	r3, r0
f001bd68:	e1a00003 	mov	r0, r3
f001bd6c:	ebffca37 	bl	f000e650 <cap_count>
f001bd70:	e1a02000 	mov	r2, r0
f001bd74:	e51b3020 	ldr	r3, [fp, #-32]
f001bd78:	e5832000 	str	r2, [r3]
f001bd7c:	ea000005 	b	f001bd98 <sys_capability_control+0x128>
f001bd80:	e51b0020 	ldr	r0, [fp, #-32]
f001bd84:	ebffff67 	bl	f001bb28 <cap_read_all>
f001bd88:	e50b0010 	str	r0, [fp, #-16]
f001bd8c:	ea000001 	b	f001bd98 <sys_capability_control+0x128>
f001bd90:	e3e03015 	mvn	r3, #21
f001bd94:	ea000000 	b	f001bd9c <sys_capability_control+0x12c>
f001bd98:	e51b3010 	ldr	r3, [fp, #-16]
f001bd9c:	e1a00003 	mov	r0, r3
f001bda0:	e24bd008 	sub	sp, fp, #8
f001bda4:	e8bd8810 	pop	{r4, fp, pc}

f001bda8 <current_task>:
f001bda8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f001bdac:	e28db000 	add	fp, sp, #0
f001bdb0:	e1a0300d 	mov	r3, sp
f001bdb4:	e3c33eff 	bic	r3, r3, #4080	; 0xff0
f001bdb8:	e3c3300f 	bic	r3, r3, #15
f001bdbc:	e1a00003 	mov	r0, r3
f001bdc0:	e24bd000 	sub	sp, fp, #0
f001bdc4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f001bdc8:	e12fff1e 	bx	lr

f001bdcc <exregs_write_registers>:
f001bdcc:	e92d4800 	push	{fp, lr}
f001bdd0:	e28db004 	add	fp, sp, #4
f001bdd4:	e24dd010 	sub	sp, sp, #16
f001bdd8:	e50b0010 	str	r0, [fp, #-16]
f001bddc:	e50b1014 	str	r1, [fp, #-20]
f001bde0:	e51b3010 	ldr	r3, [fp, #-16]
f001bde4:	e50b3008 	str	r3, [fp, #-8]
f001bde8:	e51b3014 	ldr	r3, [fp, #-20]
f001bdec:	e5933040 	ldr	r3, [r3, #64]	; 0x40
f001bdf0:	e3530000 	cmp	r3, #0
f001bdf4:	1a000000 	bne	f001bdfc <exregs_write_registers+0x30>
f001bdf8:	ea00019f 	b	f001c47c <exregs_write_registers+0x6b0>
f001bdfc:	e51b3014 	ldr	r3, [fp, #-20]
f001be00:	e5933040 	ldr	r3, [r3, #64]	; 0x40
f001be04:	e2033001 	and	r3, r3, #1
f001be08:	e3530000 	cmp	r3, #0
f001be0c:	0a000014 	beq	f001be64 <exregs_write_registers+0x98>
f001be10:	e51b3014 	ldr	r3, [fp, #-20]
f001be14:	e5932000 	ldr	r2, [r3]
f001be18:	e51b3008 	ldr	r3, [fp, #-8]
f001be1c:	e20210ff 	and	r1, r2, #255	; 0xff
f001be20:	e3a00000 	mov	r0, #0
f001be24:	e1801001 	orr	r1, r0, r1
f001be28:	e5c31004 	strb	r1, [r3, #4]
f001be2c:	e1a01422 	lsr	r1, r2, #8
f001be30:	e20110ff 	and	r1, r1, #255	; 0xff
f001be34:	e3a00000 	mov	r0, #0
f001be38:	e1801001 	orr	r1, r0, r1
f001be3c:	e5c31005 	strb	r1, [r3, #5]
f001be40:	e1a01822 	lsr	r1, r2, #16
f001be44:	e20110ff 	and	r1, r1, #255	; 0xff
f001be48:	e3a00000 	mov	r0, #0
f001be4c:	e1801001 	orr	r1, r0, r1
f001be50:	e5c31006 	strb	r1, [r3, #6]
f001be54:	e1a02c22 	lsr	r2, r2, #24
f001be58:	e3a01000 	mov	r1, #0
f001be5c:	e1812002 	orr	r2, r1, r2
f001be60:	e5c32007 	strb	r2, [r3, #7]
f001be64:	e51b3014 	ldr	r3, [fp, #-20]
f001be68:	e5933040 	ldr	r3, [r3, #64]	; 0x40
f001be6c:	e2033002 	and	r3, r3, #2
f001be70:	e3530000 	cmp	r3, #0
f001be74:	0a000014 	beq	f001becc <exregs_write_registers+0x100>
f001be78:	e51b3014 	ldr	r3, [fp, #-20]
f001be7c:	e5932004 	ldr	r2, [r3, #4]
f001be80:	e51b3008 	ldr	r3, [fp, #-8]
f001be84:	e20210ff 	and	r1, r2, #255	; 0xff
f001be88:	e3a00000 	mov	r0, #0
f001be8c:	e1801001 	orr	r1, r0, r1
f001be90:	e5c31008 	strb	r1, [r3, #8]
f001be94:	e1a01422 	lsr	r1, r2, #8
f001be98:	e20110ff 	and	r1, r1, #255	; 0xff
f001be9c:	e3a00000 	mov	r0, #0
f001bea0:	e1801001 	orr	r1, r0, r1
f001bea4:	e5c31009 	strb	r1, [r3, #9]
f001bea8:	e1a01822 	lsr	r1, r2, #16
f001beac:	e20110ff 	and	r1, r1, #255	; 0xff
f001beb0:	e3a00000 	mov	r0, #0
f001beb4:	e1801001 	orr	r1, r0, r1
f001beb8:	e5c3100a 	strb	r1, [r3, #10]
f001bebc:	e1a02c22 	lsr	r2, r2, #24
f001bec0:	e3a01000 	mov	r1, #0
f001bec4:	e1812002 	orr	r2, r1, r2
f001bec8:	e5c3200b 	strb	r2, [r3, #11]
f001becc:	e51b3014 	ldr	r3, [fp, #-20]
f001bed0:	e5933040 	ldr	r3, [r3, #64]	; 0x40
f001bed4:	e2033004 	and	r3, r3, #4
f001bed8:	e3530000 	cmp	r3, #0
f001bedc:	0a000014 	beq	f001bf34 <exregs_write_registers+0x168>
f001bee0:	e51b3014 	ldr	r3, [fp, #-20]
f001bee4:	e5932008 	ldr	r2, [r3, #8]
f001bee8:	e51b3008 	ldr	r3, [fp, #-8]
f001beec:	e20210ff 	and	r1, r2, #255	; 0xff
f001bef0:	e3a00000 	mov	r0, #0
f001bef4:	e1801001 	orr	r1, r0, r1
f001bef8:	e5c3100c 	strb	r1, [r3, #12]
f001befc:	e1a01422 	lsr	r1, r2, #8
f001bf00:	e20110ff 	and	r1, r1, #255	; 0xff
f001bf04:	e3a00000 	mov	r0, #0
f001bf08:	e1801001 	orr	r1, r0, r1
f001bf0c:	e5c3100d 	strb	r1, [r3, #13]
f001bf10:	e1a01822 	lsr	r1, r2, #16
f001bf14:	e20110ff 	and	r1, r1, #255	; 0xff
f001bf18:	e3a00000 	mov	r0, #0
f001bf1c:	e1801001 	orr	r1, r0, r1
f001bf20:	e5c3100e 	strb	r1, [r3, #14]
f001bf24:	e1a02c22 	lsr	r2, r2, #24
f001bf28:	e3a01000 	mov	r1, #0
f001bf2c:	e1812002 	orr	r2, r1, r2
f001bf30:	e5c3200f 	strb	r2, [r3, #15]
f001bf34:	e51b3014 	ldr	r3, [fp, #-20]
f001bf38:	e5933040 	ldr	r3, [r3, #64]	; 0x40
f001bf3c:	e2033008 	and	r3, r3, #8
f001bf40:	e3530000 	cmp	r3, #0
f001bf44:	0a000014 	beq	f001bf9c <exregs_write_registers+0x1d0>
f001bf48:	e51b3014 	ldr	r3, [fp, #-20]
f001bf4c:	e593200c 	ldr	r2, [r3, #12]
f001bf50:	e51b3008 	ldr	r3, [fp, #-8]
f001bf54:	e20210ff 	and	r1, r2, #255	; 0xff
f001bf58:	e3a00000 	mov	r0, #0
f001bf5c:	e1801001 	orr	r1, r0, r1
f001bf60:	e5c31010 	strb	r1, [r3, #16]
f001bf64:	e1a01422 	lsr	r1, r2, #8
f001bf68:	e20110ff 	and	r1, r1, #255	; 0xff
f001bf6c:	e3a00000 	mov	r0, #0
f001bf70:	e1801001 	orr	r1, r0, r1
f001bf74:	e5c31011 	strb	r1, [r3, #17]
f001bf78:	e1a01822 	lsr	r1, r2, #16
f001bf7c:	e20110ff 	and	r1, r1, #255	; 0xff
f001bf80:	e3a00000 	mov	r0, #0
f001bf84:	e1801001 	orr	r1, r0, r1
f001bf88:	e5c31012 	strb	r1, [r3, #18]
f001bf8c:	e1a02c22 	lsr	r2, r2, #24
f001bf90:	e3a01000 	mov	r1, #0
f001bf94:	e1812002 	orr	r2, r1, r2
f001bf98:	e5c32013 	strb	r2, [r3, #19]
f001bf9c:	e51b3014 	ldr	r3, [fp, #-20]
f001bfa0:	e5933040 	ldr	r3, [r3, #64]	; 0x40
f001bfa4:	e2033010 	and	r3, r3, #16
f001bfa8:	e3530000 	cmp	r3, #0
f001bfac:	0a000014 	beq	f001c004 <exregs_write_registers+0x238>
f001bfb0:	e51b3014 	ldr	r3, [fp, #-20]
f001bfb4:	e5932010 	ldr	r2, [r3, #16]
f001bfb8:	e51b3008 	ldr	r3, [fp, #-8]
f001bfbc:	e20210ff 	and	r1, r2, #255	; 0xff
f001bfc0:	e3a00000 	mov	r0, #0
f001bfc4:	e1801001 	orr	r1, r0, r1
f001bfc8:	e5c31014 	strb	r1, [r3, #20]
f001bfcc:	e1a01422 	lsr	r1, r2, #8
f001bfd0:	e20110ff 	and	r1, r1, #255	; 0xff
f001bfd4:	e3a00000 	mov	r0, #0
f001bfd8:	e1801001 	orr	r1, r0, r1
f001bfdc:	e5c31015 	strb	r1, [r3, #21]
f001bfe0:	e1a01822 	lsr	r1, r2, #16
f001bfe4:	e20110ff 	and	r1, r1, #255	; 0xff
f001bfe8:	e3a00000 	mov	r0, #0
f001bfec:	e1801001 	orr	r1, r0, r1
f001bff0:	e5c31016 	strb	r1, [r3, #22]
f001bff4:	e1a02c22 	lsr	r2, r2, #24
f001bff8:	e3a01000 	mov	r1, #0
f001bffc:	e1812002 	orr	r2, r1, r2
f001c000:	e5c32017 	strb	r2, [r3, #23]
f001c004:	e51b3014 	ldr	r3, [fp, #-20]
f001c008:	e5933040 	ldr	r3, [r3, #64]	; 0x40
f001c00c:	e2033020 	and	r3, r3, #32
f001c010:	e3530000 	cmp	r3, #0
f001c014:	0a000014 	beq	f001c06c <exregs_write_registers+0x2a0>
f001c018:	e51b3014 	ldr	r3, [fp, #-20]
f001c01c:	e5932014 	ldr	r2, [r3, #20]
f001c020:	e51b3008 	ldr	r3, [fp, #-8]
f001c024:	e20210ff 	and	r1, r2, #255	; 0xff
f001c028:	e3a00000 	mov	r0, #0
f001c02c:	e1801001 	orr	r1, r0, r1
f001c030:	e5c31018 	strb	r1, [r3, #24]
f001c034:	e1a01422 	lsr	r1, r2, #8
f001c038:	e20110ff 	and	r1, r1, #255	; 0xff
f001c03c:	e3a00000 	mov	r0, #0
f001c040:	e1801001 	orr	r1, r0, r1
f001c044:	e5c31019 	strb	r1, [r3, #25]
f001c048:	e1a01822 	lsr	r1, r2, #16
f001c04c:	e20110ff 	and	r1, r1, #255	; 0xff
f001c050:	e3a00000 	mov	r0, #0
f001c054:	e1801001 	orr	r1, r0, r1
f001c058:	e5c3101a 	strb	r1, [r3, #26]
f001c05c:	e1a02c22 	lsr	r2, r2, #24
f001c060:	e3a01000 	mov	r1, #0
f001c064:	e1812002 	orr	r2, r1, r2
f001c068:	e5c3201b 	strb	r2, [r3, #27]
f001c06c:	e51b3014 	ldr	r3, [fp, #-20]
f001c070:	e5933040 	ldr	r3, [r3, #64]	; 0x40
f001c074:	e2033040 	and	r3, r3, #64	; 0x40
f001c078:	e3530000 	cmp	r3, #0
f001c07c:	0a000014 	beq	f001c0d4 <exregs_write_registers+0x308>
f001c080:	e51b3014 	ldr	r3, [fp, #-20]
f001c084:	e5932018 	ldr	r2, [r3, #24]
f001c088:	e51b3008 	ldr	r3, [fp, #-8]
f001c08c:	e20210ff 	and	r1, r2, #255	; 0xff
f001c090:	e3a00000 	mov	r0, #0
f001c094:	e1801001 	orr	r1, r0, r1
f001c098:	e5c3101c 	strb	r1, [r3, #28]
f001c09c:	e1a01422 	lsr	r1, r2, #8
f001c0a0:	e20110ff 	and	r1, r1, #255	; 0xff
f001c0a4:	e3a00000 	mov	r0, #0
f001c0a8:	e1801001 	orr	r1, r0, r1
f001c0ac:	e5c3101d 	strb	r1, [r3, #29]
f001c0b0:	e1a01822 	lsr	r1, r2, #16
f001c0b4:	e20110ff 	and	r1, r1, #255	; 0xff
f001c0b8:	e3a00000 	mov	r0, #0
f001c0bc:	e1801001 	orr	r1, r0, r1
f001c0c0:	e5c3101e 	strb	r1, [r3, #30]
f001c0c4:	e1a02c22 	lsr	r2, r2, #24
f001c0c8:	e3a01000 	mov	r1, #0
f001c0cc:	e1812002 	orr	r2, r1, r2
f001c0d0:	e5c3201f 	strb	r2, [r3, #31]
f001c0d4:	e51b3014 	ldr	r3, [fp, #-20]
f001c0d8:	e5933040 	ldr	r3, [r3, #64]	; 0x40
f001c0dc:	e2033080 	and	r3, r3, #128	; 0x80
f001c0e0:	e3530000 	cmp	r3, #0
f001c0e4:	0a000014 	beq	f001c13c <exregs_write_registers+0x370>
f001c0e8:	e51b3014 	ldr	r3, [fp, #-20]
f001c0ec:	e593201c 	ldr	r2, [r3, #28]
f001c0f0:	e51b3008 	ldr	r3, [fp, #-8]
f001c0f4:	e20210ff 	and	r1, r2, #255	; 0xff
f001c0f8:	e3a00000 	mov	r0, #0
f001c0fc:	e1801001 	orr	r1, r0, r1
f001c100:	e5c31020 	strb	r1, [r3, #32]
f001c104:	e1a01422 	lsr	r1, r2, #8
f001c108:	e20110ff 	and	r1, r1, #255	; 0xff
f001c10c:	e3a00000 	mov	r0, #0
f001c110:	e1801001 	orr	r1, r0, r1
f001c114:	e5c31021 	strb	r1, [r3, #33]	; 0x21
f001c118:	e1a01822 	lsr	r1, r2, #16
f001c11c:	e20110ff 	and	r1, r1, #255	; 0xff
f001c120:	e3a00000 	mov	r0, #0
f001c124:	e1801001 	orr	r1, r0, r1
f001c128:	e5c31022 	strb	r1, [r3, #34]	; 0x22
f001c12c:	e1a02c22 	lsr	r2, r2, #24
f001c130:	e3a01000 	mov	r1, #0
f001c134:	e1812002 	orr	r2, r1, r2
f001c138:	e5c32023 	strb	r2, [r3, #35]	; 0x23
f001c13c:	e51b3014 	ldr	r3, [fp, #-20]
f001c140:	e5933040 	ldr	r3, [r3, #64]	; 0x40
f001c144:	e2033c01 	and	r3, r3, #256	; 0x100
f001c148:	e3530000 	cmp	r3, #0
f001c14c:	0a000014 	beq	f001c1a4 <exregs_write_registers+0x3d8>
f001c150:	e51b3014 	ldr	r3, [fp, #-20]
f001c154:	e5932020 	ldr	r2, [r3, #32]
f001c158:	e51b3008 	ldr	r3, [fp, #-8]
f001c15c:	e20210ff 	and	r1, r2, #255	; 0xff
f001c160:	e3a00000 	mov	r0, #0
f001c164:	e1801001 	orr	r1, r0, r1
f001c168:	e5c31024 	strb	r1, [r3, #36]	; 0x24
f001c16c:	e1a01422 	lsr	r1, r2, #8
f001c170:	e20110ff 	and	r1, r1, #255	; 0xff
f001c174:	e3a00000 	mov	r0, #0
f001c178:	e1801001 	orr	r1, r0, r1
f001c17c:	e5c31025 	strb	r1, [r3, #37]	; 0x25
f001c180:	e1a01822 	lsr	r1, r2, #16
f001c184:	e20110ff 	and	r1, r1, #255	; 0xff
f001c188:	e3a00000 	mov	r0, #0
f001c18c:	e1801001 	orr	r1, r0, r1
f001c190:	e5c31026 	strb	r1, [r3, #38]	; 0x26
f001c194:	e1a02c22 	lsr	r2, r2, #24
f001c198:	e3a01000 	mov	r1, #0
f001c19c:	e1812002 	orr	r2, r1, r2
f001c1a0:	e5c32027 	strb	r2, [r3, #39]	; 0x27
f001c1a4:	e51b3014 	ldr	r3, [fp, #-20]
f001c1a8:	e5933040 	ldr	r3, [r3, #64]	; 0x40
f001c1ac:	e2033c02 	and	r3, r3, #512	; 0x200
f001c1b0:	e3530000 	cmp	r3, #0
f001c1b4:	0a000014 	beq	f001c20c <exregs_write_registers+0x440>
f001c1b8:	e51b3014 	ldr	r3, [fp, #-20]
f001c1bc:	e5932024 	ldr	r2, [r3, #36]	; 0x24
f001c1c0:	e51b3008 	ldr	r3, [fp, #-8]
f001c1c4:	e20210ff 	and	r1, r2, #255	; 0xff
f001c1c8:	e3a00000 	mov	r0, #0
f001c1cc:	e1801001 	orr	r1, r0, r1
f001c1d0:	e5c31028 	strb	r1, [r3, #40]	; 0x28
f001c1d4:	e1a01422 	lsr	r1, r2, #8
f001c1d8:	e20110ff 	and	r1, r1, #255	; 0xff
f001c1dc:	e3a00000 	mov	r0, #0
f001c1e0:	e1801001 	orr	r1, r0, r1
f001c1e4:	e5c31029 	strb	r1, [r3, #41]	; 0x29
f001c1e8:	e1a01822 	lsr	r1, r2, #16
f001c1ec:	e20110ff 	and	r1, r1, #255	; 0xff
f001c1f0:	e3a00000 	mov	r0, #0
f001c1f4:	e1801001 	orr	r1, r0, r1
f001c1f8:	e5c3102a 	strb	r1, [r3, #42]	; 0x2a
f001c1fc:	e1a02c22 	lsr	r2, r2, #24
f001c200:	e3a01000 	mov	r1, #0
f001c204:	e1812002 	orr	r2, r1, r2
f001c208:	e5c3202b 	strb	r2, [r3, #43]	; 0x2b
f001c20c:	e51b3014 	ldr	r3, [fp, #-20]
f001c210:	e5933040 	ldr	r3, [r3, #64]	; 0x40
f001c214:	e2033b01 	and	r3, r3, #1024	; 0x400
f001c218:	e3530000 	cmp	r3, #0
f001c21c:	0a000014 	beq	f001c274 <exregs_write_registers+0x4a8>
f001c220:	e51b3014 	ldr	r3, [fp, #-20]
f001c224:	e5932028 	ldr	r2, [r3, #40]	; 0x28
f001c228:	e51b3008 	ldr	r3, [fp, #-8]
f001c22c:	e20210ff 	and	r1, r2, #255	; 0xff
f001c230:	e3a00000 	mov	r0, #0
f001c234:	e1801001 	orr	r1, r0, r1
f001c238:	e5c3102c 	strb	r1, [r3, #44]	; 0x2c
f001c23c:	e1a01422 	lsr	r1, r2, #8
f001c240:	e20110ff 	and	r1, r1, #255	; 0xff
f001c244:	e3a00000 	mov	r0, #0
f001c248:	e1801001 	orr	r1, r0, r1
f001c24c:	e5c3102d 	strb	r1, [r3, #45]	; 0x2d
f001c250:	e1a01822 	lsr	r1, r2, #16
f001c254:	e20110ff 	and	r1, r1, #255	; 0xff
f001c258:	e3a00000 	mov	r0, #0
f001c25c:	e1801001 	orr	r1, r0, r1
f001c260:	e5c3102e 	strb	r1, [r3, #46]	; 0x2e
f001c264:	e1a02c22 	lsr	r2, r2, #24
f001c268:	e3a01000 	mov	r1, #0
f001c26c:	e1812002 	orr	r2, r1, r2
f001c270:	e5c3202f 	strb	r2, [r3, #47]	; 0x2f
f001c274:	e51b3014 	ldr	r3, [fp, #-20]
f001c278:	e5933040 	ldr	r3, [r3, #64]	; 0x40
f001c27c:	e2033b02 	and	r3, r3, #2048	; 0x800
f001c280:	e3530000 	cmp	r3, #0
f001c284:	0a000014 	beq	f001c2dc <exregs_write_registers+0x510>
f001c288:	e51b3014 	ldr	r3, [fp, #-20]
f001c28c:	e593202c 	ldr	r2, [r3, #44]	; 0x2c
f001c290:	e51b3008 	ldr	r3, [fp, #-8]
f001c294:	e20210ff 	and	r1, r2, #255	; 0xff
f001c298:	e3a00000 	mov	r0, #0
f001c29c:	e1801001 	orr	r1, r0, r1
f001c2a0:	e5c31030 	strb	r1, [r3, #48]	; 0x30
f001c2a4:	e1a01422 	lsr	r1, r2, #8
f001c2a8:	e20110ff 	and	r1, r1, #255	; 0xff
f001c2ac:	e3a00000 	mov	r0, #0
f001c2b0:	e1801001 	orr	r1, r0, r1
f001c2b4:	e5c31031 	strb	r1, [r3, #49]	; 0x31
f001c2b8:	e1a01822 	lsr	r1, r2, #16
f001c2bc:	e20110ff 	and	r1, r1, #255	; 0xff
f001c2c0:	e3a00000 	mov	r0, #0
f001c2c4:	e1801001 	orr	r1, r0, r1
f001c2c8:	e5c31032 	strb	r1, [r3, #50]	; 0x32
f001c2cc:	e1a02c22 	lsr	r2, r2, #24
f001c2d0:	e3a01000 	mov	r1, #0
f001c2d4:	e1812002 	orr	r2, r1, r2
f001c2d8:	e5c32033 	strb	r2, [r3, #51]	; 0x33
f001c2dc:	e51b3014 	ldr	r3, [fp, #-20]
f001c2e0:	e5933040 	ldr	r3, [r3, #64]	; 0x40
f001c2e4:	e2033a01 	and	r3, r3, #4096	; 0x1000
f001c2e8:	e3530000 	cmp	r3, #0
f001c2ec:	0a000014 	beq	f001c344 <exregs_write_registers+0x578>
f001c2f0:	e51b3014 	ldr	r3, [fp, #-20]
f001c2f4:	e5932030 	ldr	r2, [r3, #48]	; 0x30
f001c2f8:	e51b3008 	ldr	r3, [fp, #-8]
f001c2fc:	e20210ff 	and	r1, r2, #255	; 0xff
f001c300:	e3a00000 	mov	r0, #0
f001c304:	e1801001 	orr	r1, r0, r1
f001c308:	e5c31034 	strb	r1, [r3, #52]	; 0x34
f001c30c:	e1a01422 	lsr	r1, r2, #8
f001c310:	e20110ff 	and	r1, r1, #255	; 0xff
f001c314:	e3a00000 	mov	r0, #0
f001c318:	e1801001 	orr	r1, r0, r1
f001c31c:	e5c31035 	strb	r1, [r3, #53]	; 0x35
f001c320:	e1a01822 	lsr	r1, r2, #16
f001c324:	e20110ff 	and	r1, r1, #255	; 0xff
f001c328:	e3a00000 	mov	r0, #0
f001c32c:	e1801001 	orr	r1, r0, r1
f001c330:	e5c31036 	strb	r1, [r3, #54]	; 0x36
f001c334:	e1a02c22 	lsr	r2, r2, #24
f001c338:	e3a01000 	mov	r1, #0
f001c33c:	e1812002 	orr	r2, r1, r2
f001c340:	e5c32037 	strb	r2, [r3, #55]	; 0x37
f001c344:	e51b3014 	ldr	r3, [fp, #-20]
f001c348:	e5933040 	ldr	r3, [r3, #64]	; 0x40
f001c34c:	e2033a02 	and	r3, r3, #8192	; 0x2000
f001c350:	e3530000 	cmp	r3, #0
f001c354:	0a000014 	beq	f001c3ac <exregs_write_registers+0x5e0>
f001c358:	e51b3014 	ldr	r3, [fp, #-20]
f001c35c:	e5932034 	ldr	r2, [r3, #52]	; 0x34
f001c360:	e51b3008 	ldr	r3, [fp, #-8]
f001c364:	e20210ff 	and	r1, r2, #255	; 0xff
f001c368:	e3a00000 	mov	r0, #0
f001c36c:	e1801001 	orr	r1, r0, r1
f001c370:	e5c31038 	strb	r1, [r3, #56]	; 0x38
f001c374:	e1a01422 	lsr	r1, r2, #8
f001c378:	e20110ff 	and	r1, r1, #255	; 0xff
f001c37c:	e3a00000 	mov	r0, #0
f001c380:	e1801001 	orr	r1, r0, r1
f001c384:	e5c31039 	strb	r1, [r3, #57]	; 0x39
f001c388:	e1a01822 	lsr	r1, r2, #16
f001c38c:	e20110ff 	and	r1, r1, #255	; 0xff
f001c390:	e3a00000 	mov	r0, #0
f001c394:	e1801001 	orr	r1, r0, r1
f001c398:	e5c3103a 	strb	r1, [r3, #58]	; 0x3a
f001c39c:	e1a02c22 	lsr	r2, r2, #24
f001c3a0:	e3a01000 	mov	r1, #0
f001c3a4:	e1812002 	orr	r2, r1, r2
f001c3a8:	e5c3203b 	strb	r2, [r3, #59]	; 0x3b
f001c3ac:	e51b3014 	ldr	r3, [fp, #-20]
f001c3b0:	e5933040 	ldr	r3, [r3, #64]	; 0x40
f001c3b4:	e2033901 	and	r3, r3, #16384	; 0x4000
f001c3b8:	e3530000 	cmp	r3, #0
f001c3bc:	0a000014 	beq	f001c414 <exregs_write_registers+0x648>
f001c3c0:	e51b3014 	ldr	r3, [fp, #-20]
f001c3c4:	e5932038 	ldr	r2, [r3, #56]	; 0x38
f001c3c8:	e51b3008 	ldr	r3, [fp, #-8]
f001c3cc:	e20210ff 	and	r1, r2, #255	; 0xff
f001c3d0:	e3a00000 	mov	r0, #0
f001c3d4:	e1801001 	orr	r1, r0, r1
f001c3d8:	e5c3103c 	strb	r1, [r3, #60]	; 0x3c
f001c3dc:	e1a01422 	lsr	r1, r2, #8
f001c3e0:	e20110ff 	and	r1, r1, #255	; 0xff
f001c3e4:	e3a00000 	mov	r0, #0
f001c3e8:	e1801001 	orr	r1, r0, r1
f001c3ec:	e5c3103d 	strb	r1, [r3, #61]	; 0x3d
f001c3f0:	e1a01822 	lsr	r1, r2, #16
f001c3f4:	e20110ff 	and	r1, r1, #255	; 0xff
f001c3f8:	e3a00000 	mov	r0, #0
f001c3fc:	e1801001 	orr	r1, r0, r1
f001c400:	e5c3103e 	strb	r1, [r3, #62]	; 0x3e
f001c404:	e1a02c22 	lsr	r2, r2, #24
f001c408:	e3a01000 	mov	r1, #0
f001c40c:	e1812002 	orr	r2, r1, r2
f001c410:	e5c3203f 	strb	r2, [r3, #63]	; 0x3f
f001c414:	e51b3014 	ldr	r3, [fp, #-20]
f001c418:	e5933040 	ldr	r3, [r3, #64]	; 0x40
f001c41c:	e2033902 	and	r3, r3, #32768	; 0x8000
f001c420:	e3530000 	cmp	r3, #0
f001c424:	0a000014 	beq	f001c47c <exregs_write_registers+0x6b0>
f001c428:	e51b3014 	ldr	r3, [fp, #-20]
f001c42c:	e593203c 	ldr	r2, [r3, #60]	; 0x3c
f001c430:	e51b3008 	ldr	r3, [fp, #-8]
f001c434:	e20210ff 	and	r1, r2, #255	; 0xff
f001c438:	e3a00000 	mov	r0, #0
f001c43c:	e1801001 	orr	r1, r0, r1
f001c440:	e5c31040 	strb	r1, [r3, #64]	; 0x40
f001c444:	e1a01422 	lsr	r1, r2, #8
f001c448:	e20110ff 	and	r1, r1, #255	; 0xff
f001c44c:	e3a00000 	mov	r0, #0
f001c450:	e1801001 	orr	r1, r0, r1
f001c454:	e5c31041 	strb	r1, [r3, #65]	; 0x41
f001c458:	e1a01822 	lsr	r1, r2, #16
f001c45c:	e20110ff 	and	r1, r1, #255	; 0xff
f001c460:	e3a00000 	mov	r0, #0
f001c464:	e1801001 	orr	r1, r0, r1
f001c468:	e5c31042 	strb	r1, [r3, #66]	; 0x42
f001c46c:	e1a02c22 	lsr	r2, r2, #24
f001c470:	e3a01000 	mov	r1, #0
f001c474:	e1812002 	orr	r2, r1, r2
f001c478:	e5c32043 	strb	r2, [r3, #67]	; 0x43
f001c47c:	e51b3014 	ldr	r3, [fp, #-20]
f001c480:	e5933044 	ldr	r3, [r3, #68]	; 0x44
f001c484:	e2033002 	and	r3, r3, #2
f001c488:	e3530000 	cmp	r3, #0
f001c48c:	0a00000a 	beq	f001c4bc <exregs_write_registers+0x6f0>
f001c490:	e51b3014 	ldr	r3, [fp, #-20]
f001c494:	e593204c 	ldr	r2, [r3, #76]	; 0x4c
f001c498:	e51b3010 	ldr	r3, [fp, #-16]
f001c49c:	e5832090 	str	r2, [r3, #144]	; 0x90
f001c4a0:	ebfffe40 	bl	f001bda8 <current_task>
f001c4a4:	e1a02000 	mov	r2, r0
f001c4a8:	e51b3010 	ldr	r3, [fp, #-16]
f001c4ac:	e1520003 	cmp	r2, r3
f001c4b0:	1a000001 	bne	f001c4bc <exregs_write_registers+0x6f0>
f001c4b4:	e51b0010 	ldr	r0, [fp, #-16]
f001c4b8:	ebffbac1 	bl	f000afc4 <task_update_utcb>
f001c4bc:	e24bd004 	sub	sp, fp, #4
f001c4c0:	e8bd8800 	pop	{fp, pc}

f001c4c4 <exregs_read_registers>:
f001c4c4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f001c4c8:	e28db000 	add	fp, sp, #0
f001c4cc:	e24dd014 	sub	sp, sp, #20
f001c4d0:	e50b0010 	str	r0, [fp, #-16]
f001c4d4:	e50b1014 	str	r1, [fp, #-20]
f001c4d8:	e51b3010 	ldr	r3, [fp, #-16]
f001c4dc:	e50b3008 	str	r3, [fp, #-8]
f001c4e0:	e51b3014 	ldr	r3, [fp, #-20]
f001c4e4:	e5933040 	ldr	r3, [r3, #64]	; 0x40
f001c4e8:	e3530000 	cmp	r3, #0
f001c4ec:	1a000000 	bne	f001c4f4 <exregs_read_registers+0x30>
f001c4f0:	ea00012f 	b	f001c9b4 <exregs_read_registers+0x4f0>
f001c4f4:	e51b3014 	ldr	r3, [fp, #-20]
f001c4f8:	e5933040 	ldr	r3, [r3, #64]	; 0x40
f001c4fc:	e2033001 	and	r3, r3, #1
f001c500:	e3530000 	cmp	r3, #0
f001c504:	0a00000d 	beq	f001c540 <exregs_read_registers+0x7c>
f001c508:	e51b3008 	ldr	r3, [fp, #-8]
f001c50c:	e5d32004 	ldrb	r2, [r3, #4]
f001c510:	e5d31005 	ldrb	r1, [r3, #5]
f001c514:	e1a01401 	lsl	r1, r1, #8
f001c518:	e1812002 	orr	r2, r1, r2
f001c51c:	e5d31006 	ldrb	r1, [r3, #6]
f001c520:	e1a01801 	lsl	r1, r1, #16
f001c524:	e1812002 	orr	r2, r1, r2
f001c528:	e5d33007 	ldrb	r3, [r3, #7]
f001c52c:	e1a03c03 	lsl	r3, r3, #24
f001c530:	e1833002 	orr	r3, r3, r2
f001c534:	e1a02003 	mov	r2, r3
f001c538:	e51b3014 	ldr	r3, [fp, #-20]
f001c53c:	e5832000 	str	r2, [r3]
f001c540:	e51b3014 	ldr	r3, [fp, #-20]
f001c544:	e5933040 	ldr	r3, [r3, #64]	; 0x40
f001c548:	e2033002 	and	r3, r3, #2
f001c54c:	e3530000 	cmp	r3, #0
f001c550:	0a00000d 	beq	f001c58c <exregs_read_registers+0xc8>
f001c554:	e51b3008 	ldr	r3, [fp, #-8]
f001c558:	e5d32008 	ldrb	r2, [r3, #8]
f001c55c:	e5d31009 	ldrb	r1, [r3, #9]
f001c560:	e1a01401 	lsl	r1, r1, #8
f001c564:	e1812002 	orr	r2, r1, r2
f001c568:	e5d3100a 	ldrb	r1, [r3, #10]
f001c56c:	e1a01801 	lsl	r1, r1, #16
f001c570:	e1812002 	orr	r2, r1, r2
f001c574:	e5d3300b 	ldrb	r3, [r3, #11]
f001c578:	e1a03c03 	lsl	r3, r3, #24
f001c57c:	e1833002 	orr	r3, r3, r2
f001c580:	e1a02003 	mov	r2, r3
f001c584:	e51b3014 	ldr	r3, [fp, #-20]
f001c588:	e5832004 	str	r2, [r3, #4]
f001c58c:	e51b3014 	ldr	r3, [fp, #-20]
f001c590:	e5933040 	ldr	r3, [r3, #64]	; 0x40
f001c594:	e2033004 	and	r3, r3, #4
f001c598:	e3530000 	cmp	r3, #0
f001c59c:	0a00000d 	beq	f001c5d8 <exregs_read_registers+0x114>
f001c5a0:	e51b3008 	ldr	r3, [fp, #-8]
f001c5a4:	e5d3200c 	ldrb	r2, [r3, #12]
f001c5a8:	e5d3100d 	ldrb	r1, [r3, #13]
f001c5ac:	e1a01401 	lsl	r1, r1, #8
f001c5b0:	e1812002 	orr	r2, r1, r2
f001c5b4:	e5d3100e 	ldrb	r1, [r3, #14]
f001c5b8:	e1a01801 	lsl	r1, r1, #16
f001c5bc:	e1812002 	orr	r2, r1, r2
f001c5c0:	e5d3300f 	ldrb	r3, [r3, #15]
f001c5c4:	e1a03c03 	lsl	r3, r3, #24
f001c5c8:	e1833002 	orr	r3, r3, r2
f001c5cc:	e1a02003 	mov	r2, r3
f001c5d0:	e51b3014 	ldr	r3, [fp, #-20]
f001c5d4:	e5832008 	str	r2, [r3, #8]
f001c5d8:	e51b3014 	ldr	r3, [fp, #-20]
f001c5dc:	e5933040 	ldr	r3, [r3, #64]	; 0x40
f001c5e0:	e2033008 	and	r3, r3, #8
f001c5e4:	e3530000 	cmp	r3, #0
f001c5e8:	0a00000d 	beq	f001c624 <exregs_read_registers+0x160>
f001c5ec:	e51b3008 	ldr	r3, [fp, #-8]
f001c5f0:	e5d32010 	ldrb	r2, [r3, #16]
f001c5f4:	e5d31011 	ldrb	r1, [r3, #17]
f001c5f8:	e1a01401 	lsl	r1, r1, #8
f001c5fc:	e1812002 	orr	r2, r1, r2
f001c600:	e5d31012 	ldrb	r1, [r3, #18]
f001c604:	e1a01801 	lsl	r1, r1, #16
f001c608:	e1812002 	orr	r2, r1, r2
f001c60c:	e5d33013 	ldrb	r3, [r3, #19]
f001c610:	e1a03c03 	lsl	r3, r3, #24
f001c614:	e1833002 	orr	r3, r3, r2
f001c618:	e1a02003 	mov	r2, r3
f001c61c:	e51b3014 	ldr	r3, [fp, #-20]
f001c620:	e583200c 	str	r2, [r3, #12]
f001c624:	e51b3014 	ldr	r3, [fp, #-20]
f001c628:	e5933040 	ldr	r3, [r3, #64]	; 0x40
f001c62c:	e2033010 	and	r3, r3, #16
f001c630:	e3530000 	cmp	r3, #0
f001c634:	0a00000d 	beq	f001c670 <exregs_read_registers+0x1ac>
f001c638:	e51b3008 	ldr	r3, [fp, #-8]
f001c63c:	e5d32014 	ldrb	r2, [r3, #20]
f001c640:	e5d31015 	ldrb	r1, [r3, #21]
f001c644:	e1a01401 	lsl	r1, r1, #8
f001c648:	e1812002 	orr	r2, r1, r2
f001c64c:	e5d31016 	ldrb	r1, [r3, #22]
f001c650:	e1a01801 	lsl	r1, r1, #16
f001c654:	e1812002 	orr	r2, r1, r2
f001c658:	e5d33017 	ldrb	r3, [r3, #23]
f001c65c:	e1a03c03 	lsl	r3, r3, #24
f001c660:	e1833002 	orr	r3, r3, r2
f001c664:	e1a02003 	mov	r2, r3
f001c668:	e51b3014 	ldr	r3, [fp, #-20]
f001c66c:	e5832010 	str	r2, [r3, #16]
f001c670:	e51b3014 	ldr	r3, [fp, #-20]
f001c674:	e5933040 	ldr	r3, [r3, #64]	; 0x40
f001c678:	e2033020 	and	r3, r3, #32
f001c67c:	e3530000 	cmp	r3, #0
f001c680:	0a00000d 	beq	f001c6bc <exregs_read_registers+0x1f8>
f001c684:	e51b3008 	ldr	r3, [fp, #-8]
f001c688:	e5d32018 	ldrb	r2, [r3, #24]
f001c68c:	e5d31019 	ldrb	r1, [r3, #25]
f001c690:	e1a01401 	lsl	r1, r1, #8
f001c694:	e1812002 	orr	r2, r1, r2
f001c698:	e5d3101a 	ldrb	r1, [r3, #26]
f001c69c:	e1a01801 	lsl	r1, r1, #16
f001c6a0:	e1812002 	orr	r2, r1, r2
f001c6a4:	e5d3301b 	ldrb	r3, [r3, #27]
f001c6a8:	e1a03c03 	lsl	r3, r3, #24
f001c6ac:	e1833002 	orr	r3, r3, r2
f001c6b0:	e1a02003 	mov	r2, r3
f001c6b4:	e51b3014 	ldr	r3, [fp, #-20]
f001c6b8:	e5832014 	str	r2, [r3, #20]
f001c6bc:	e51b3014 	ldr	r3, [fp, #-20]
f001c6c0:	e5933040 	ldr	r3, [r3, #64]	; 0x40
f001c6c4:	e2033040 	and	r3, r3, #64	; 0x40
f001c6c8:	e3530000 	cmp	r3, #0
f001c6cc:	0a00000d 	beq	f001c708 <exregs_read_registers+0x244>
f001c6d0:	e51b3008 	ldr	r3, [fp, #-8]
f001c6d4:	e5d3201c 	ldrb	r2, [r3, #28]
f001c6d8:	e5d3101d 	ldrb	r1, [r3, #29]
f001c6dc:	e1a01401 	lsl	r1, r1, #8
f001c6e0:	e1812002 	orr	r2, r1, r2
f001c6e4:	e5d3101e 	ldrb	r1, [r3, #30]
f001c6e8:	e1a01801 	lsl	r1, r1, #16
f001c6ec:	e1812002 	orr	r2, r1, r2
f001c6f0:	e5d3301f 	ldrb	r3, [r3, #31]
f001c6f4:	e1a03c03 	lsl	r3, r3, #24
f001c6f8:	e1833002 	orr	r3, r3, r2
f001c6fc:	e1a02003 	mov	r2, r3
f001c700:	e51b3014 	ldr	r3, [fp, #-20]
f001c704:	e5832018 	str	r2, [r3, #24]
f001c708:	e51b3014 	ldr	r3, [fp, #-20]
f001c70c:	e5933040 	ldr	r3, [r3, #64]	; 0x40
f001c710:	e2033080 	and	r3, r3, #128	; 0x80
f001c714:	e3530000 	cmp	r3, #0
f001c718:	0a00000d 	beq	f001c754 <exregs_read_registers+0x290>
f001c71c:	e51b3008 	ldr	r3, [fp, #-8]
f001c720:	e5d32020 	ldrb	r2, [r3, #32]
f001c724:	e5d31021 	ldrb	r1, [r3, #33]	; 0x21
f001c728:	e1a01401 	lsl	r1, r1, #8
f001c72c:	e1812002 	orr	r2, r1, r2
f001c730:	e5d31022 	ldrb	r1, [r3, #34]	; 0x22
f001c734:	e1a01801 	lsl	r1, r1, #16
f001c738:	e1812002 	orr	r2, r1, r2
f001c73c:	e5d33023 	ldrb	r3, [r3, #35]	; 0x23
f001c740:	e1a03c03 	lsl	r3, r3, #24
f001c744:	e1833002 	orr	r3, r3, r2
f001c748:	e1a02003 	mov	r2, r3
f001c74c:	e51b3014 	ldr	r3, [fp, #-20]
f001c750:	e583201c 	str	r2, [r3, #28]
f001c754:	e51b3014 	ldr	r3, [fp, #-20]
f001c758:	e5933040 	ldr	r3, [r3, #64]	; 0x40
f001c75c:	e2033c01 	and	r3, r3, #256	; 0x100
f001c760:	e3530000 	cmp	r3, #0
f001c764:	0a00000d 	beq	f001c7a0 <exregs_read_registers+0x2dc>
f001c768:	e51b3008 	ldr	r3, [fp, #-8]
f001c76c:	e5d32024 	ldrb	r2, [r3, #36]	; 0x24
f001c770:	e5d31025 	ldrb	r1, [r3, #37]	; 0x25
f001c774:	e1a01401 	lsl	r1, r1, #8
f001c778:	e1812002 	orr	r2, r1, r2
f001c77c:	e5d31026 	ldrb	r1, [r3, #38]	; 0x26
f001c780:	e1a01801 	lsl	r1, r1, #16
f001c784:	e1812002 	orr	r2, r1, r2
f001c788:	e5d33027 	ldrb	r3, [r3, #39]	; 0x27
f001c78c:	e1a03c03 	lsl	r3, r3, #24
f001c790:	e1833002 	orr	r3, r3, r2
f001c794:	e1a02003 	mov	r2, r3
f001c798:	e51b3014 	ldr	r3, [fp, #-20]
f001c79c:	e5832020 	str	r2, [r3, #32]
f001c7a0:	e51b3014 	ldr	r3, [fp, #-20]
f001c7a4:	e5933040 	ldr	r3, [r3, #64]	; 0x40
f001c7a8:	e2033c02 	and	r3, r3, #512	; 0x200
f001c7ac:	e3530000 	cmp	r3, #0
f001c7b0:	0a00000d 	beq	f001c7ec <exregs_read_registers+0x328>
f001c7b4:	e51b3008 	ldr	r3, [fp, #-8]
f001c7b8:	e5d32028 	ldrb	r2, [r3, #40]	; 0x28
f001c7bc:	e5d31029 	ldrb	r1, [r3, #41]	; 0x29
f001c7c0:	e1a01401 	lsl	r1, r1, #8
f001c7c4:	e1812002 	orr	r2, r1, r2
f001c7c8:	e5d3102a 	ldrb	r1, [r3, #42]	; 0x2a
f001c7cc:	e1a01801 	lsl	r1, r1, #16
f001c7d0:	e1812002 	orr	r2, r1, r2
f001c7d4:	e5d3302b 	ldrb	r3, [r3, #43]	; 0x2b
f001c7d8:	e1a03c03 	lsl	r3, r3, #24
f001c7dc:	e1833002 	orr	r3, r3, r2
f001c7e0:	e1a02003 	mov	r2, r3
f001c7e4:	e51b3014 	ldr	r3, [fp, #-20]
f001c7e8:	e5832024 	str	r2, [r3, #36]	; 0x24
f001c7ec:	e51b3014 	ldr	r3, [fp, #-20]
f001c7f0:	e5933040 	ldr	r3, [r3, #64]	; 0x40
f001c7f4:	e2033b01 	and	r3, r3, #1024	; 0x400
f001c7f8:	e3530000 	cmp	r3, #0
f001c7fc:	0a00000d 	beq	f001c838 <exregs_read_registers+0x374>
f001c800:	e51b3008 	ldr	r3, [fp, #-8]
f001c804:	e5d3202c 	ldrb	r2, [r3, #44]	; 0x2c
f001c808:	e5d3102d 	ldrb	r1, [r3, #45]	; 0x2d
f001c80c:	e1a01401 	lsl	r1, r1, #8
f001c810:	e1812002 	orr	r2, r1, r2
f001c814:	e5d3102e 	ldrb	r1, [r3, #46]	; 0x2e
f001c818:	e1a01801 	lsl	r1, r1, #16
f001c81c:	e1812002 	orr	r2, r1, r2
f001c820:	e5d3302f 	ldrb	r3, [r3, #47]	; 0x2f
f001c824:	e1a03c03 	lsl	r3, r3, #24
f001c828:	e1833002 	orr	r3, r3, r2
f001c82c:	e1a02003 	mov	r2, r3
f001c830:	e51b3014 	ldr	r3, [fp, #-20]
f001c834:	e5832028 	str	r2, [r3, #40]	; 0x28
f001c838:	e51b3014 	ldr	r3, [fp, #-20]
f001c83c:	e5933040 	ldr	r3, [r3, #64]	; 0x40
f001c840:	e2033b02 	and	r3, r3, #2048	; 0x800
f001c844:	e3530000 	cmp	r3, #0
f001c848:	0a00000d 	beq	f001c884 <exregs_read_registers+0x3c0>
f001c84c:	e51b3008 	ldr	r3, [fp, #-8]
f001c850:	e5d32030 	ldrb	r2, [r3, #48]	; 0x30
f001c854:	e5d31031 	ldrb	r1, [r3, #49]	; 0x31
f001c858:	e1a01401 	lsl	r1, r1, #8
f001c85c:	e1812002 	orr	r2, r1, r2
f001c860:	e5d31032 	ldrb	r1, [r3, #50]	; 0x32
f001c864:	e1a01801 	lsl	r1, r1, #16
f001c868:	e1812002 	orr	r2, r1, r2
f001c86c:	e5d33033 	ldrb	r3, [r3, #51]	; 0x33
f001c870:	e1a03c03 	lsl	r3, r3, #24
f001c874:	e1833002 	orr	r3, r3, r2
f001c878:	e1a02003 	mov	r2, r3
f001c87c:	e51b3014 	ldr	r3, [fp, #-20]
f001c880:	e583202c 	str	r2, [r3, #44]	; 0x2c
f001c884:	e51b3014 	ldr	r3, [fp, #-20]
f001c888:	e5933040 	ldr	r3, [r3, #64]	; 0x40
f001c88c:	e2033a01 	and	r3, r3, #4096	; 0x1000
f001c890:	e3530000 	cmp	r3, #0
f001c894:	0a00000d 	beq	f001c8d0 <exregs_read_registers+0x40c>
f001c898:	e51b3008 	ldr	r3, [fp, #-8]
f001c89c:	e5d32034 	ldrb	r2, [r3, #52]	; 0x34
f001c8a0:	e5d31035 	ldrb	r1, [r3, #53]	; 0x35
f001c8a4:	e1a01401 	lsl	r1, r1, #8
f001c8a8:	e1812002 	orr	r2, r1, r2
f001c8ac:	e5d31036 	ldrb	r1, [r3, #54]	; 0x36
f001c8b0:	e1a01801 	lsl	r1, r1, #16
f001c8b4:	e1812002 	orr	r2, r1, r2
f001c8b8:	e5d33037 	ldrb	r3, [r3, #55]	; 0x37
f001c8bc:	e1a03c03 	lsl	r3, r3, #24
f001c8c0:	e1833002 	orr	r3, r3, r2
f001c8c4:	e1a02003 	mov	r2, r3
f001c8c8:	e51b3014 	ldr	r3, [fp, #-20]
f001c8cc:	e5832030 	str	r2, [r3, #48]	; 0x30
f001c8d0:	e51b3014 	ldr	r3, [fp, #-20]
f001c8d4:	e5933040 	ldr	r3, [r3, #64]	; 0x40
f001c8d8:	e2033a02 	and	r3, r3, #8192	; 0x2000
f001c8dc:	e3530000 	cmp	r3, #0
f001c8e0:	0a00000d 	beq	f001c91c <exregs_read_registers+0x458>
f001c8e4:	e51b3008 	ldr	r3, [fp, #-8]
f001c8e8:	e5d32038 	ldrb	r2, [r3, #56]	; 0x38
f001c8ec:	e5d31039 	ldrb	r1, [r3, #57]	; 0x39
f001c8f0:	e1a01401 	lsl	r1, r1, #8
f001c8f4:	e1812002 	orr	r2, r1, r2
f001c8f8:	e5d3103a 	ldrb	r1, [r3, #58]	; 0x3a
f001c8fc:	e1a01801 	lsl	r1, r1, #16
f001c900:	e1812002 	orr	r2, r1, r2
f001c904:	e5d3303b 	ldrb	r3, [r3, #59]	; 0x3b
f001c908:	e1a03c03 	lsl	r3, r3, #24
f001c90c:	e1833002 	orr	r3, r3, r2
f001c910:	e1a02003 	mov	r2, r3
f001c914:	e51b3014 	ldr	r3, [fp, #-20]
f001c918:	e5832034 	str	r2, [r3, #52]	; 0x34
f001c91c:	e51b3014 	ldr	r3, [fp, #-20]
f001c920:	e5933040 	ldr	r3, [r3, #64]	; 0x40
f001c924:	e2033901 	and	r3, r3, #16384	; 0x4000
f001c928:	e3530000 	cmp	r3, #0
f001c92c:	0a00000d 	beq	f001c968 <exregs_read_registers+0x4a4>
f001c930:	e51b3008 	ldr	r3, [fp, #-8]
f001c934:	e5d3203c 	ldrb	r2, [r3, #60]	; 0x3c
f001c938:	e5d3103d 	ldrb	r1, [r3, #61]	; 0x3d
f001c93c:	e1a01401 	lsl	r1, r1, #8
f001c940:	e1812002 	orr	r2, r1, r2
f001c944:	e5d3103e 	ldrb	r1, [r3, #62]	; 0x3e
f001c948:	e1a01801 	lsl	r1, r1, #16
f001c94c:	e1812002 	orr	r2, r1, r2
f001c950:	e5d3303f 	ldrb	r3, [r3, #63]	; 0x3f
f001c954:	e1a03c03 	lsl	r3, r3, #24
f001c958:	e1833002 	orr	r3, r3, r2
f001c95c:	e1a02003 	mov	r2, r3
f001c960:	e51b3014 	ldr	r3, [fp, #-20]
f001c964:	e5832038 	str	r2, [r3, #56]	; 0x38
f001c968:	e51b3014 	ldr	r3, [fp, #-20]
f001c96c:	e5933040 	ldr	r3, [r3, #64]	; 0x40
f001c970:	e2033902 	and	r3, r3, #32768	; 0x8000
f001c974:	e3530000 	cmp	r3, #0
f001c978:	0a00000d 	beq	f001c9b4 <exregs_read_registers+0x4f0>
f001c97c:	e51b3008 	ldr	r3, [fp, #-8]
f001c980:	e5d32040 	ldrb	r2, [r3, #64]	; 0x40
f001c984:	e5d31041 	ldrb	r1, [r3, #65]	; 0x41
f001c988:	e1a01401 	lsl	r1, r1, #8
f001c98c:	e1812002 	orr	r2, r1, r2
f001c990:	e5d31042 	ldrb	r1, [r3, #66]	; 0x42
f001c994:	e1a01801 	lsl	r1, r1, #16
f001c998:	e1812002 	orr	r2, r1, r2
f001c99c:	e5d33043 	ldrb	r3, [r3, #67]	; 0x43
f001c9a0:	e1a03c03 	lsl	r3, r3, #24
f001c9a4:	e1833002 	orr	r3, r3, r2
f001c9a8:	e1a02003 	mov	r2, r3
f001c9ac:	e51b3014 	ldr	r3, [fp, #-20]
f001c9b0:	e583203c 	str	r2, [r3, #60]	; 0x3c
f001c9b4:	e51b3014 	ldr	r3, [fp, #-20]
f001c9b8:	e5933044 	ldr	r3, [r3, #68]	; 0x44
f001c9bc:	e2033001 	and	r3, r3, #1
f001c9c0:	e3530000 	cmp	r3, #0
f001c9c4:	0a000004 	beq	f001c9dc <exregs_read_registers+0x518>
f001c9c8:	e51b3010 	ldr	r3, [fp, #-16]
f001c9cc:	e59330bc 	ldr	r3, [r3, #188]	; 0xbc
f001c9d0:	e5932054 	ldr	r2, [r3, #84]	; 0x54
f001c9d4:	e51b3014 	ldr	r3, [fp, #-20]
f001c9d8:	e5832048 	str	r2, [r3, #72]	; 0x48
f001c9dc:	e51b3014 	ldr	r3, [fp, #-20]
f001c9e0:	e5933044 	ldr	r3, [r3, #68]	; 0x44
f001c9e4:	e2033002 	and	r3, r3, #2
f001c9e8:	e3530000 	cmp	r3, #0
f001c9ec:	0a000003 	beq	f001ca00 <exregs_read_registers+0x53c>
f001c9f0:	e51b3010 	ldr	r3, [fp, #-16]
f001c9f4:	e5932090 	ldr	r2, [r3, #144]	; 0x90
f001c9f8:	e51b3014 	ldr	r3, [fp, #-20]
f001c9fc:	e583204c 	str	r2, [r3, #76]	; 0x4c
f001ca00:	e24bd000 	sub	sp, fp, #0
f001ca04:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f001ca08:	e12fff1e 	bx	lr

f001ca0c <sys_exchange_registers>:
f001ca0c:	e92d4810 	push	{r4, fp, lr}
f001ca10:	e28db008 	add	fp, sp, #8
f001ca14:	e24dd014 	sub	sp, sp, #20
f001ca18:	e50b0018 	str	r0, [fp, #-24]
f001ca1c:	e50b101c 	str	r1, [fp, #-28]
f001ca20:	e3a03000 	mov	r3, #0
f001ca24:	e50b3010 	str	r3, [fp, #-16]
f001ca28:	e51b3018 	ldr	r3, [fp, #-24]
f001ca2c:	e1a00003 	mov	r0, r3
f001ca30:	e3a01050 	mov	r1, #80	; 0x50
f001ca34:	e3a02001 	mov	r2, #1
f001ca38:	e3a03001 	mov	r3, #1
f001ca3c:	ebffbbab 	bl	f000b8f0 <check_access>
f001ca40:	e50b0010 	str	r0, [fp, #-16]
f001ca44:	e51b3010 	ldr	r3, [fp, #-16]
f001ca48:	e3530000 	cmp	r3, #0
f001ca4c:	aa000001 	bge	f001ca58 <sys_exchange_registers+0x4c>
f001ca50:	e51b3010 	ldr	r3, [fp, #-16]
f001ca54:	ea000042 	b	f001cb64 <sys_exchange_registers+0x158>
f001ca58:	e51b001c 	ldr	r0, [fp, #-28]
f001ca5c:	ebffb7c7 	bl	f000a980 <tcb_find>
f001ca60:	e50b0014 	str	r0, [fp, #-20]
f001ca64:	e51b3014 	ldr	r3, [fp, #-20]
f001ca68:	e3530000 	cmp	r3, #0
f001ca6c:	1a000001 	bne	f001ca78 <sys_exchange_registers+0x6c>
f001ca70:	e3e03002 	mvn	r3, #2
f001ca74:	ea00003a 	b	f001cb64 <sys_exchange_registers+0x158>
f001ca78:	e51b3014 	ldr	r3, [fp, #-20]
f001ca7c:	e2833068 	add	r3, r3, #104	; 0x68
f001ca80:	e1a00003 	mov	r0, r3
f001ca84:	ebffe8fe 	bl	f0016e84 <mutex_trylock>
f001ca88:	e1a03000 	mov	r3, r0
f001ca8c:	e3530000 	cmp	r3, #0
f001ca90:	1a000001 	bne	f001ca9c <sys_exchange_registers+0x90>
f001ca94:	e3e0300a 	mvn	r3, #10
f001ca98:	ea000031 	b	f001cb64 <sys_exchange_registers+0x158>
f001ca9c:	e51b3014 	ldr	r3, [fp, #-20]
f001caa0:	e5d33084 	ldrb	r3, [r3, #132]	; 0x84
f001caa4:	e3530000 	cmp	r3, #0
f001caa8:	0a000013 	beq	f001cafc <sys_exchange_registers+0xf0>
f001caac:	e51b3018 	ldr	r3, [fp, #-24]
f001cab0:	e5933040 	ldr	r3, [r3, #64]	; 0x40
f001cab4:	e3530000 	cmp	r3, #0
f001cab8:	0a00000f 	beq	f001cafc <sys_exchange_registers+0xf0>
f001cabc:	ebfffcb9 	bl	f001bda8 <current_task>
f001cac0:	e1a02000 	mov	r2, r0
f001cac4:	e51b3014 	ldr	r3, [fp, #-20]
f001cac8:	e1520003 	cmp	r2, r3
f001cacc:	0a00000a 	beq	f001cafc <sys_exchange_registers+0xf0>
f001cad0:	e51b3014 	ldr	r3, [fp, #-20]
f001cad4:	e59330bc 	ldr	r3, [r3, #188]	; 0xbc
f001cad8:	e5934054 	ldr	r4, [r3, #84]	; 0x54
f001cadc:	ebfffcb1 	bl	f001bda8 <current_task>
f001cae0:	e1a03000 	mov	r3, r0
f001cae4:	e5933054 	ldr	r3, [r3, #84]	; 0x54
f001cae8:	e1540003 	cmp	r4, r3
f001caec:	0a000002 	beq	f001cafc <sys_exchange_registers+0xf0>
f001caf0:	e3e03083 	mvn	r3, #131	; 0x83
f001caf4:	e50b3010 	str	r3, [fp, #-16]
f001caf8:	ea000014 	b	f001cb50 <sys_exchange_registers+0x144>
f001cafc:	e51b0014 	ldr	r0, [fp, #-20]
f001cb00:	e51b1018 	ldr	r1, [fp, #-24]
f001cb04:	ebffcaf2 	bl	f000f6d4 <cap_exregs_check>
f001cb08:	e50b0010 	str	r0, [fp, #-16]
f001cb0c:	e51b3010 	ldr	r3, [fp, #-16]
f001cb10:	e3530000 	cmp	r3, #0
f001cb14:	aa000001 	bge	f001cb20 <sys_exchange_registers+0x114>
f001cb18:	e3e03085 	mvn	r3, #133	; 0x85
f001cb1c:	ea000010 	b	f001cb64 <sys_exchange_registers+0x158>
f001cb20:	e51b3018 	ldr	r3, [fp, #-24]
f001cb24:	e5933044 	ldr	r3, [r3, #68]	; 0x44
f001cb28:	e2033004 	and	r3, r3, #4
f001cb2c:	e3530000 	cmp	r3, #0
f001cb30:	0a000003 	beq	f001cb44 <sys_exchange_registers+0x138>
f001cb34:	e51b0014 	ldr	r0, [fp, #-20]
f001cb38:	e51b1018 	ldr	r1, [fp, #-24]
f001cb3c:	ebfffe60 	bl	f001c4c4 <exregs_read_registers>
f001cb40:	ea000002 	b	f001cb50 <sys_exchange_registers+0x144>
f001cb44:	e51b0014 	ldr	r0, [fp, #-20]
f001cb48:	e51b1018 	ldr	r1, [fp, #-24]
f001cb4c:	ebfffc9e 	bl	f001bdcc <exregs_write_registers>
f001cb50:	e51b3014 	ldr	r3, [fp, #-20]
f001cb54:	e2833068 	add	r3, r3, #104	; 0x68
f001cb58:	e1a00003 	mov	r0, r3
f001cb5c:	ebffe993 	bl	f00171b0 <mutex_unlock>
f001cb60:	e51b3010 	ldr	r3, [fp, #-16]
f001cb64:	e1a00003 	mov	r0, r3
f001cb68:	e24bd008 	sub	sp, fp, #8
f001cb6c:	e8bd8810 	pop	{r4, fp, pc}

f001cb70 <list_insert_tail>:
f001cb70:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f001cb74:	e28db000 	add	fp, sp, #0
f001cb78:	e24dd014 	sub	sp, sp, #20
f001cb7c:	e50b0010 	str	r0, [fp, #-16]
f001cb80:	e50b1014 	str	r1, [fp, #-20]
f001cb84:	e51b3014 	ldr	r3, [fp, #-20]
f001cb88:	e5933004 	ldr	r3, [r3, #4]
f001cb8c:	e50b3008 	str	r3, [fp, #-8]
f001cb90:	e51b3010 	ldr	r3, [fp, #-16]
f001cb94:	e51b2014 	ldr	r2, [fp, #-20]
f001cb98:	e5832000 	str	r2, [r3]
f001cb9c:	e51b3014 	ldr	r3, [fp, #-20]
f001cba0:	e51b2010 	ldr	r2, [fp, #-16]
f001cba4:	e5832004 	str	r2, [r3, #4]
f001cba8:	e51b3010 	ldr	r3, [fp, #-16]
f001cbac:	e51b2008 	ldr	r2, [fp, #-8]
f001cbb0:	e5832004 	str	r2, [r3, #4]
f001cbb4:	e51b3008 	ldr	r3, [fp, #-8]
f001cbb8:	e51b2010 	ldr	r2, [fp, #-16]
f001cbbc:	e5832000 	str	r2, [r3]
f001cbc0:	e24bd000 	sub	sp, fp, #0
f001cbc4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f001cbc8:	e12fff1e 	bx	lr

f001cbcc <spin_lock_irq>:
f001cbcc:	e92d4800 	push	{fp, lr}
f001cbd0:	e28db004 	add	fp, sp, #4
f001cbd4:	e24dd008 	sub	sp, sp, #8
f001cbd8:	e50b0008 	str	r0, [fp, #-8]
f001cbdc:	e50b100c 	str	r1, [fp, #-12]
f001cbe0:	e51b000c 	ldr	r0, [fp, #-12]
f001cbe4:	ebffdff4 	bl	f0014bbc <irq_local_disable_save>
f001cbe8:	e24bd004 	sub	sp, fp, #4
f001cbec:	e8bd8800 	pop	{fp, pc}

f001cbf0 <spin_unlock_irq>:
f001cbf0:	e92d4800 	push	{fp, lr}
f001cbf4:	e28db004 	add	fp, sp, #4
f001cbf8:	e24dd008 	sub	sp, sp, #8
f001cbfc:	e50b0008 	str	r0, [fp, #-8]
f001cc00:	e50b100c 	str	r1, [fp, #-12]
f001cc04:	e51b000c 	ldr	r0, [fp, #-12]
f001cc08:	ebffdffa 	bl	f0014bf8 <irq_local_restore>
f001cc0c:	e24bd004 	sub	sp, fp, #4
f001cc10:	e8bd8800 	pop	{fp, pc}

f001cc14 <current_task>:
f001cc14:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f001cc18:	e28db000 	add	fp, sp, #0
f001cc1c:	e1a0300d 	mov	r3, sp
f001cc20:	e3c33eff 	bic	r3, r3, #4080	; 0xff0
f001cc24:	e3c3300f 	bic	r3, r3, #15
f001cc28:	e1a00003 	mov	r0, r3
f001cc2c:	e24bd000 	sub	sp, fp, #0
f001cc30:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f001cc34:	e12fff1e 	bx	lr

f001cc38 <irq_thread_notify>:
f001cc38:	e92d4800 	push	{fp, lr}
f001cc3c:	e28db004 	add	fp, sp, #4
f001cc40:	e24dd010 	sub	sp, sp, #16
f001cc44:	e50b0010 	str	r0, [fp, #-16]
f001cc48:	e51b3010 	ldr	r3, [fp, #-16]
f001cc4c:	e593300c 	ldr	r3, [r3, #12]
f001cc50:	e1a00003 	mov	r0, r3
f001cc54:	e3a01000 	mov	r1, #0
f001cc58:	ebffb8e3 	bl	f000afec <tcb_check_and_lazy_map_utcb>
f001cc5c:	e50b0008 	str	r0, [fp, #-8]
f001cc60:	e51b3008 	ldr	r3, [fp, #-8]
f001cc64:	e3530000 	cmp	r3, #0
f001cc68:	aa00000b 	bge	f001cc9c <irq_thread_notify+0x64>
f001cc6c:	e51b3010 	ldr	r3, [fp, #-16]
f001cc70:	e593300c 	ldr	r3, [r3, #12]
f001cc74:	e5933054 	ldr	r3, [r3, #84]	; 0x54
f001cc78:	e59f00d4 	ldr	r0, [pc, #212]	; f001cd54 <irq_thread_notify+0x11c>
f001cc7c:	e59f10d4 	ldr	r1, [pc, #212]	; f001cd58 <irq_thread_notify+0x120>
f001cc80:	e1a02003 	mov	r2, r3
f001cc84:	e51b3008 	ldr	r3, [fp, #-8]
f001cc88:	ebffe497 	bl	f0015eec <printk>
f001cc8c:	e51b3010 	ldr	r3, [fp, #-16]
f001cc90:	e593300c 	ldr	r3, [r3, #12]
f001cc94:	e1a00003 	mov	r0, r3
f001cc98:	ebffefa3 	bl	f0018b2c <thread_destroy>
f001cc9c:	e51b3010 	ldr	r3, [fp, #-16]
f001cca0:	e593300c 	ldr	r3, [r3, #12]
f001cca4:	e5933090 	ldr	r3, [r3, #144]	; 0x90
f001cca8:	e50b300c 	str	r3, [fp, #-12]
f001ccac:	e51b3010 	ldr	r3, [fp, #-16]
f001ccb0:	e5932010 	ldr	r2, [r3, #16]
f001ccb4:	e51b100c 	ldr	r1, [fp, #-12]
f001ccb8:	e3a03020 	mov	r3, #32
f001ccbc:	e0812002 	add	r2, r1, r2
f001ccc0:	e0823003 	add	r3, r2, r3
f001ccc4:	e5d33000 	ldrb	r3, [r3]
f001ccc8:	e35300ff 	cmp	r3, #255	; 0xff
f001cccc:	0a00000d 	beq	f001cd08 <irq_thread_notify+0xd0>
f001ccd0:	e51b3010 	ldr	r3, [fp, #-16]
f001ccd4:	e5933010 	ldr	r3, [r3, #16]
f001ccd8:	e51b100c 	ldr	r1, [fp, #-12]
f001ccdc:	e3a02020 	mov	r2, #32
f001cce0:	e0811003 	add	r1, r1, r3
f001cce4:	e0812002 	add	r2, r1, r2
f001cce8:	e5d22000 	ldrb	r2, [r2]
f001ccec:	e2822001 	add	r2, r2, #1
f001ccf0:	e20220ff 	and	r2, r2, #255	; 0xff
f001ccf4:	e51b000c 	ldr	r0, [fp, #-12]
f001ccf8:	e3a01020 	mov	r1, #32
f001ccfc:	e0803003 	add	r3, r0, r3
f001cd00:	e0833001 	add	r3, r3, r1
f001cd04:	e5c32000 	strb	r2, [r3]
f001cd08:	e51b3010 	ldr	r3, [fp, #-16]
f001cd0c:	e2833014 	add	r3, r3, #20
f001cd10:	e1a00003 	mov	r0, r3
f001cd14:	e3a01000 	mov	r1, #0
f001cd18:	ebffe72e 	bl	f00169d8 <wake_up>
f001cd1c:	ebffdfbe 	bl	f0014c1c <irqs_enabled>
f001cd20:	e1a03000 	mov	r3, r0
f001cd24:	e3530000 	cmp	r3, #0
f001cd28:	1a000005 	bne	f001cd44 <irq_thread_notify+0x10c>
f001cd2c:	e59f0028 	ldr	r0, [pc, #40]	; f001cd5c <irq_thread_notify+0x124>
f001cd30:	e59f1028 	ldr	r1, [pc, #40]	; f001cd60 <irq_thread_notify+0x128>
f001cd34:	e59f201c 	ldr	r2, [pc, #28]	; f001cd58 <irq_thread_notify+0x120>
f001cd38:	e3a03043 	mov	r3, #67	; 0x43
f001cd3c:	ebffe46a 	bl	f0015eec <printk>
f001cd40:	eafffffe 	b	f001cd40 <irq_thread_notify+0x108>
f001cd44:	e3a03000 	mov	r3, #0
f001cd48:	e1a00003 	mov	r0, r3
f001cd4c:	e24bd004 	sub	sp, fp, #4
f001cd50:	e8bd8800 	pop	{fp, pc}
f001cd54:	f001fa84 	.word	0xf001fa84
f001cd58:	f001fb34 	.word	0xf001fb34
f001cd5c:	f001fafc 	.word	0xf001fafc
f001cd60:	f001fb24 	.word	0xf001fb24

f001cd64 <irq_control_register>:
f001cd64:	e92d4800 	push	{fp, lr}
f001cd68:	e28db004 	add	fp, sp, #4
f001cd6c:	e24dd018 	sub	sp, sp, #24
f001cd70:	e50b0010 	str	r0, [fp, #-16]
f001cd74:	e50b1014 	str	r1, [fp, #-20]
f001cd78:	e50b2018 	str	r2, [fp, #-24]
f001cd7c:	ebffffa4 	bl	f001cc14 <current_task>
f001cd80:	e1a03000 	mov	r3, r0
f001cd84:	e1a00003 	mov	r0, r3
f001cd88:	e3a01001 	mov	r1, #1
f001cd8c:	ebffb896 	bl	f000afec <tcb_check_and_lazy_map_utcb>
f001cd90:	e50b0008 	str	r0, [fp, #-8]
f001cd94:	e51b3008 	ldr	r3, [fp, #-8]
f001cd98:	e3530000 	cmp	r3, #0
f001cd9c:	aa000001 	bge	f001cda8 <irq_control_register+0x44>
f001cda0:	e51b3008 	ldr	r3, [fp, #-8]
f001cda4:	ea000011 	b	f001cdf0 <irq_control_register+0x8c>
f001cda8:	ebffff99 	bl	f001cc14 <current_task>
f001cdac:	e1a03000 	mov	r3, r0
f001cdb0:	e1a00003 	mov	r0, r3
f001cdb4:	e51b1014 	ldr	r1, [fp, #-20]
f001cdb8:	e51b2018 	ldr	r2, [fp, #-24]
f001cdbc:	ebffad06 	bl	f00081dc <irq_register>
f001cdc0:	e50b0008 	str	r0, [fp, #-8]
f001cdc4:	e51b3008 	ldr	r3, [fp, #-8]
f001cdc8:	e3530000 	cmp	r3, #0
f001cdcc:	aa000001 	bge	f001cdd8 <irq_control_register+0x74>
f001cdd0:	e51b3008 	ldr	r3, [fp, #-8]
f001cdd4:	ea000005 	b	f001cdf0 <irq_control_register+0x8c>
f001cdd8:	ebffff8d 	bl	f001cc14 <current_task>
f001cddc:	e1a03000 	mov	r3, r0
f001cde0:	e5932060 	ldr	r2, [r3, #96]	; 0x60
f001cde4:	e3822020 	orr	r2, r2, #32
f001cde8:	e5832060 	str	r2, [r3, #96]	; 0x60
f001cdec:	e3a03000 	mov	r3, #0
f001cdf0:	e1a00003 	mov	r0, r3
f001cdf4:	e24bd004 	sub	sp, fp, #4
f001cdf8:	e8bd8800 	pop	{fp, pc}

f001cdfc <irq_wait>:
f001cdfc:	e92d4800 	push	{fp, lr}
f001ce00:	e28db004 	add	fp, sp, #4
f001ce04:	e24dd028 	sub	sp, sp, #40	; 0x28
f001ce08:	e50b0028 	str	r0, [fp, #-40]	; 0x28
f001ce0c:	e51b2028 	ldr	r2, [fp, #-40]	; 0x28
f001ce10:	e1a03002 	mov	r3, r2
f001ce14:	e1a03103 	lsl	r3, r3, #2
f001ce18:	e0833002 	add	r3, r3, r2
f001ce1c:	e1a03183 	lsl	r3, r3, #3
f001ce20:	e1a02003 	mov	r2, r3
f001ce24:	e59f31bc 	ldr	r3, [pc, #444]	; f001cfe8 <irq_wait+0x1ec>
f001ce28:	e0823003 	add	r3, r2, r3
f001ce2c:	e50b300c 	str	r3, [fp, #-12]
f001ce30:	ebffff77 	bl	f001cc14 <current_task>
f001ce34:	e1a03000 	mov	r3, r0
f001ce38:	e5933090 	ldr	r3, [r3, #144]	; 0x90
f001ce3c:	e50b3010 	str	r3, [fp, #-16]
f001ce40:	e51b3028 	ldr	r3, [fp, #-40]	; 0x28
f001ce44:	e3530040 	cmp	r3, #64	; 0x40
f001ce48:	9a000001 	bls	f001ce54 <irq_wait+0x58>
f001ce4c:	e3e03015 	mvn	r3, #21
f001ce50:	ea000061 	b	f001cfdc <irq_wait+0x1e0>
f001ce54:	ebffff6e 	bl	f001cc14 <current_task>
f001ce58:	e1a03000 	mov	r3, r0
f001ce5c:	e1a00003 	mov	r0, r3
f001ce60:	e3a01001 	mov	r1, #1
f001ce64:	ebffb860 	bl	f000afec <tcb_check_and_lazy_map_utcb>
f001ce68:	e50b0008 	str	r0, [fp, #-8]
f001ce6c:	e51b3008 	ldr	r3, [fp, #-8]
f001ce70:	e3530000 	cmp	r3, #0
f001ce74:	aa000001 	bge	f001ce80 <irq_wait+0x84>
f001ce78:	e51b3008 	ldr	r3, [fp, #-8]
f001ce7c:	ea000056 	b	f001cfdc <irq_wait+0x1e0>
f001ce80:	e3a03000 	mov	r3, #0
f001ce84:	e50b3008 	str	r3, [fp, #-8]
f001ce88:	e51b300c 	ldr	r3, [fp, #-12]
f001ce8c:	e2832018 	add	r2, r3, #24
f001ce90:	e24b3014 	sub	r3, fp, #20
f001ce94:	e1a00002 	mov	r0, r2
f001ce98:	e1a01003 	mov	r1, r3
f001ce9c:	ebffff4a 	bl	f001cbcc <spin_lock_irq>
f001cea0:	e51b300c 	ldr	r3, [fp, #-12]
f001cea4:	e5932010 	ldr	r2, [r3, #16]
f001cea8:	e51b1010 	ldr	r1, [fp, #-16]
f001ceac:	e3a03020 	mov	r3, #32
f001ceb0:	e0812002 	add	r2, r1, r2
f001ceb4:	e0823003 	add	r3, r2, r3
f001ceb8:	e5d33000 	ldrb	r3, [r3]
f001cebc:	e3530000 	cmp	r3, #0
f001cec0:	0a000006 	beq	f001cee0 <irq_wait+0xe4>
f001cec4:	e51b300c 	ldr	r3, [fp, #-12]
f001cec8:	e2832018 	add	r2, r3, #24
f001cecc:	e51b3014 	ldr	r3, [fp, #-20]
f001ced0:	e1a00002 	mov	r0, r2
f001ced4:	e1a01003 	mov	r1, r3
f001ced8:	ebffff44 	bl	f001cbf0 <spin_unlock_irq>
f001cedc:	ea000031 	b	f001cfa8 <irq_wait+0x1ac>
f001cee0:	e24b3020 	sub	r3, fp, #32
f001cee4:	e50b3020 	str	r3, [fp, #-32]
f001cee8:	e24b3020 	sub	r3, fp, #32
f001ceec:	e50b301c 	str	r3, [fp, #-28]
f001cef0:	ebffff47 	bl	f001cc14 <current_task>
f001cef4:	e1a03000 	mov	r3, r0
f001cef8:	e50b3018 	str	r3, [fp, #-24]
f001cefc:	ebffff44 	bl	f001cc14 <current_task>
f001cf00:	e1a01000 	mov	r1, r0
f001cf04:	e51b300c 	ldr	r3, [fp, #-12]
f001cf08:	e2832014 	add	r2, r3, #20
f001cf0c:	e24b3020 	sub	r3, fp, #32
f001cf10:	e1a00001 	mov	r0, r1
f001cf14:	e1a01002 	mov	r1, r2
f001cf18:	e1a02003 	mov	r2, r3
f001cf1c:	ebffe5a1 	bl	f00165a8 <task_set_wqh>
f001cf20:	e51b300c 	ldr	r3, [fp, #-12]
f001cf24:	e5933014 	ldr	r3, [r3, #20]
f001cf28:	e2832001 	add	r2, r3, #1
f001cf2c:	e51b300c 	ldr	r3, [fp, #-12]
f001cf30:	e5832014 	str	r2, [r3, #20]
f001cf34:	e51b300c 	ldr	r3, [fp, #-12]
f001cf38:	e283301c 	add	r3, r3, #28
f001cf3c:	e24b2020 	sub	r2, fp, #32
f001cf40:	e1a00002 	mov	r0, r2
f001cf44:	e1a01003 	mov	r1, r3
f001cf48:	ebffff08 	bl	f001cb70 <list_insert_tail>
f001cf4c:	ebffafdf 	bl	f0008ed0 <sched_prepare_sleep>
f001cf50:	e51b300c 	ldr	r3, [fp, #-12]
f001cf54:	e2832018 	add	r2, r3, #24
f001cf58:	e51b3014 	ldr	r3, [fp, #-20]
f001cf5c:	e1a00002 	mov	r0, r2
f001cf60:	e1a01003 	mov	r1, r3
f001cf64:	ebffff21 	bl	f001cbf0 <spin_unlock_irq>
f001cf68:	ebffb111 	bl	f00093b4 <schedule>
f001cf6c:	ebffff28 	bl	f001cc14 <current_task>
f001cf70:	e1a03000 	mov	r3, r0
f001cf74:	e5933060 	ldr	r3, [r3, #96]	; 0x60
f001cf78:	e2033001 	and	r3, r3, #1
f001cf7c:	e3530000 	cmp	r3, #0
f001cf80:	0a000007 	beq	f001cfa4 <irq_wait+0x1a8>
f001cf84:	ebffff22 	bl	f001cc14 <current_task>
f001cf88:	e1a03000 	mov	r3, r0
f001cf8c:	e5932060 	ldr	r2, [r3, #96]	; 0x60
f001cf90:	e3c22001 	bic	r2, r2, #1
f001cf94:	e5832060 	str	r2, [r3, #96]	; 0x60
f001cf98:	e3e03003 	mvn	r3, #3
f001cf9c:	e50b3008 	str	r3, [fp, #-8]
f001cfa0:	ea000000 	b	f001cfa8 <irq_wait+0x1ac>
f001cfa4:	eaffffb7 	b	f001ce88 <irq_wait+0x8c>
f001cfa8:	e51b3008 	ldr	r3, [fp, #-8]
f001cfac:	e3530000 	cmp	r3, #0
f001cfb0:	aa000001 	bge	f001cfbc <irq_wait+0x1c0>
f001cfb4:	e51b3008 	ldr	r3, [fp, #-8]
f001cfb8:	ea000007 	b	f001cfdc <irq_wait+0x1e0>
f001cfbc:	e51b300c 	ldr	r3, [fp, #-12]
f001cfc0:	e5933010 	ldr	r3, [r3, #16]
f001cfc4:	e2833020 	add	r3, r3, #32
f001cfc8:	e51b2010 	ldr	r2, [fp, #-16]
f001cfcc:	e0823003 	add	r3, r2, r3
f001cfd0:	e1a00003 	mov	r0, r3
f001cfd4:	ebffdf87 	bl	f0014df8 <l4_atomic_dest_readb>
f001cfd8:	e1a03000 	mov	r3, r0
f001cfdc:	e1a00003 	mov	r0, r3
f001cfe0:	e24bd004 	sub	sp, fp, #4
f001cfe4:	e8bd8800 	pop	{fp, pc}
f001cfe8:	f00200b8 	.word	0xf00200b8

f001cfec <sys_irq_control>:
f001cfec:	e92d4800 	push	{fp, lr}
f001cff0:	e28db004 	add	fp, sp, #4
f001cff4:	e24dd018 	sub	sp, sp, #24
f001cff8:	e50b0010 	str	r0, [fp, #-16]
f001cffc:	e50b1014 	str	r1, [fp, #-20]
f001d000:	e50b2018 	str	r2, [fp, #-24]
f001d004:	ebffff02 	bl	f001cc14 <current_task>
f001d008:	e50b0008 	str	r0, [fp, #-8]
f001d00c:	e51b0008 	ldr	r0, [fp, #-8]
f001d010:	e51b1010 	ldr	r1, [fp, #-16]
f001d014:	e51b2014 	ldr	r2, [fp, #-20]
f001d018:	e51b3018 	ldr	r3, [fp, #-24]
f001d01c:	ebffc9e5 	bl	f000f7b8 <cap_irq_check>
f001d020:	e50b000c 	str	r0, [fp, #-12]
f001d024:	e51b300c 	ldr	r3, [fp, #-12]
f001d028:	e3530000 	cmp	r3, #0
f001d02c:	aa000001 	bge	f001d038 <sys_irq_control+0x4c>
f001d030:	e51b300c 	ldr	r3, [fp, #-12]
f001d034:	ea000011 	b	f001d080 <sys_irq_control+0x94>
f001d038:	e51b3010 	ldr	r3, [fp, #-16]
f001d03c:	e3530000 	cmp	r3, #0
f001d040:	0a000002 	beq	f001d050 <sys_irq_control+0x64>
f001d044:	e3530002 	cmp	r3, #2
f001d048:	0a000007 	beq	f001d06c <sys_irq_control+0x80>
f001d04c:	ea00000a 	b	f001d07c <sys_irq_control+0x90>
f001d050:	e51b3014 	ldr	r3, [fp, #-20]
f001d054:	e51b0008 	ldr	r0, [fp, #-8]
f001d058:	e1a01003 	mov	r1, r3
f001d05c:	e51b2018 	ldr	r2, [fp, #-24]
f001d060:	ebffff3f 	bl	f001cd64 <irq_control_register>
f001d064:	e1a03000 	mov	r3, r0
f001d068:	ea000004 	b	f001d080 <sys_irq_control+0x94>
f001d06c:	e51b0018 	ldr	r0, [fp, #-24]
f001d070:	ebffff61 	bl	f001cdfc <irq_wait>
f001d074:	e1a03000 	mov	r3, r0
f001d078:	ea000000 	b	f001d080 <sys_irq_control+0x94>
f001d07c:	e3e03015 	mvn	r3, #21
f001d080:	e1a00003 	mov	r0, r3
f001d084:	e24bd004 	sub	sp, fp, #4
f001d088:	e8bd8800 	pop	{fp, pc}

f001d08c <sys_cache_control>:
f001d08c:	e92d4800 	push	{fp, lr}
f001d090:	e28db004 	add	fp, sp, #4
f001d094:	e24dd018 	sub	sp, sp, #24
f001d098:	e50b0010 	str	r0, [fp, #-16]
f001d09c:	e50b1014 	str	r1, [fp, #-20]
f001d0a0:	e50b2018 	str	r2, [fp, #-24]
f001d0a4:	e3a03000 	mov	r3, #0
f001d0a8:	e50b3008 	str	r3, [fp, #-8]
f001d0ac:	e51b0010 	ldr	r0, [fp, #-16]
f001d0b0:	e51b1014 	ldr	r1, [fp, #-20]
f001d0b4:	e51b2018 	ldr	r2, [fp, #-24]
f001d0b8:	ebffc9df 	bl	f000f83c <cap_cache_check>
f001d0bc:	e50b0008 	str	r0, [fp, #-8]
f001d0c0:	e51b3008 	ldr	r3, [fp, #-8]
f001d0c4:	e3530000 	cmp	r3, #0
f001d0c8:	aa000001 	bge	f001d0d4 <sys_cache_control+0x48>
f001d0cc:	e51b3008 	ldr	r3, [fp, #-8]
f001d0d0:	ea000025 	b	f001d16c <sys_cache_control+0xe0>
f001d0d4:	e51b3018 	ldr	r3, [fp, #-24]
f001d0d8:	e3530030 	cmp	r3, #48	; 0x30
f001d0dc:	0a000013 	beq	f001d130 <sys_cache_control+0xa4>
f001d0e0:	e3530030 	cmp	r3, #48	; 0x30
f001d0e4:	8a000004 	bhi	f001d0fc <sys_cache_control+0x70>
f001d0e8:	e3530010 	cmp	r3, #16
f001d0ec:	0a000007 	beq	f001d110 <sys_cache_control+0x84>
f001d0f0:	e3530020 	cmp	r3, #32
f001d0f4:	0a000009 	beq	f001d120 <sys_cache_control+0x94>
f001d0f8:	ea000018 	b	f001d160 <sys_cache_control+0xd4>
f001d0fc:	e3530040 	cmp	r3, #64	; 0x40
f001d100:	0a00000e 	beq	f001d140 <sys_cache_control+0xb4>
f001d104:	e3530050 	cmp	r3, #80	; 0x50
f001d108:	0a000010 	beq	f001d150 <sys_cache_control+0xc4>
f001d10c:	ea000013 	b	f001d160 <sys_cache_control+0xd4>
f001d110:	e51b0010 	ldr	r0, [fp, #-16]
f001d114:	e51b1014 	ldr	r1, [fp, #-20]
f001d118:	ebffde43 	bl	f0014a2c <arch_invalidate_icache>
f001d11c:	ea000011 	b	f001d168 <sys_cache_control+0xdc>
f001d120:	e51b0010 	ldr	r0, [fp, #-16]
f001d124:	e51b1014 	ldr	r1, [fp, #-20]
f001d128:	ebffde2f 	bl	f00149ec <arch_invalidate_dcache>
f001d12c:	ea00000d 	b	f001d168 <sys_cache_control+0xdc>
f001d130:	e51b0010 	ldr	r0, [fp, #-16]
f001d134:	e51b1014 	ldr	r1, [fp, #-20]
f001d138:	ebffde43 	bl	f0014a4c <arch_clean_dcache>
f001d13c:	ea000009 	b	f001d168 <sys_cache_control+0xdc>
f001d140:	e51b0010 	ldr	r0, [fp, #-16]
f001d144:	e51b1014 	ldr	r1, [fp, #-20]
f001d148:	ebffde2f 	bl	f0014a0c <arch_clean_invalidate_dcache>
f001d14c:	ea000005 	b	f001d168 <sys_cache_control+0xdc>
f001d150:	e51b0010 	ldr	r0, [fp, #-16]
f001d154:	e51b1014 	ldr	r1, [fp, #-20]
f001d158:	ebffde43 	bl	f0014a6c <arch_invalidate_tlb>
f001d15c:	ea000001 	b	f001d168 <sys_cache_control+0xdc>
f001d160:	e3e03015 	mvn	r3, #21
f001d164:	e50b3008 	str	r3, [fp, #-8]
f001d168:	e51b3008 	ldr	r3, [fp, #-8]
f001d16c:	e1a00003 	mov	r0, r3
f001d170:	e24bd004 	sub	sp, fp, #4
f001d174:	e8bd8800 	pop	{fp, pc}

f001d178 <pl011_uart_enable>:
f001d178:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f001d17c:	e28db000 	add	fp, sp, #0
f001d180:	e24dd014 	sub	sp, sp, #20
f001d184:	e50b0010 	str	r0, [fp, #-16]
f001d188:	e3a03000 	mov	r3, #0
f001d18c:	e50b3008 	str	r3, [fp, #-8]
f001d190:	e51b3010 	ldr	r3, [fp, #-16]
f001d194:	e2833030 	add	r3, r3, #48	; 0x30
f001d198:	e5933000 	ldr	r3, [r3]
f001d19c:	e50b3008 	str	r3, [fp, #-8]
f001d1a0:	e51b3008 	ldr	r3, [fp, #-8]
f001d1a4:	e3833001 	orr	r3, r3, #1
f001d1a8:	e50b3008 	str	r3, [fp, #-8]
f001d1ac:	e51b3010 	ldr	r3, [fp, #-16]
f001d1b0:	e2833030 	add	r3, r3, #48	; 0x30
f001d1b4:	e51b2008 	ldr	r2, [fp, #-8]
f001d1b8:	e5832000 	str	r2, [r3]
f001d1bc:	e1a00000 	nop			; (mov r0, r0)
f001d1c0:	e24bd000 	sub	sp, fp, #0
f001d1c4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f001d1c8:	e12fff1e 	bx	lr

f001d1cc <pl011_tx_enable>:
f001d1cc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f001d1d0:	e28db000 	add	fp, sp, #0
f001d1d4:	e24dd014 	sub	sp, sp, #20
f001d1d8:	e50b0010 	str	r0, [fp, #-16]
f001d1dc:	e3a03000 	mov	r3, #0
f001d1e0:	e50b3008 	str	r3, [fp, #-8]
f001d1e4:	e51b3010 	ldr	r3, [fp, #-16]
f001d1e8:	e2833030 	add	r3, r3, #48	; 0x30
f001d1ec:	e5933000 	ldr	r3, [r3]
f001d1f0:	e50b3008 	str	r3, [fp, #-8]
f001d1f4:	e51b3008 	ldr	r3, [fp, #-8]
f001d1f8:	e3833c01 	orr	r3, r3, #256	; 0x100
f001d1fc:	e50b3008 	str	r3, [fp, #-8]
f001d200:	e51b3010 	ldr	r3, [fp, #-16]
f001d204:	e2833030 	add	r3, r3, #48	; 0x30
f001d208:	e51b2008 	ldr	r2, [fp, #-8]
f001d20c:	e5832000 	str	r2, [r3]
f001d210:	e1a00000 	nop			; (mov r0, r0)
f001d214:	e24bd000 	sub	sp, fp, #0
f001d218:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f001d21c:	e12fff1e 	bx	lr

f001d220 <pl011_rx_enable>:
f001d220:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f001d224:	e28db000 	add	fp, sp, #0
f001d228:	e24dd014 	sub	sp, sp, #20
f001d22c:	e50b0010 	str	r0, [fp, #-16]
f001d230:	e3a03000 	mov	r3, #0
f001d234:	e50b3008 	str	r3, [fp, #-8]
f001d238:	e51b3010 	ldr	r3, [fp, #-16]
f001d23c:	e2833030 	add	r3, r3, #48	; 0x30
f001d240:	e5933000 	ldr	r3, [r3]
f001d244:	e50b3008 	str	r3, [fp, #-8]
f001d248:	e51b3008 	ldr	r3, [fp, #-8]
f001d24c:	e3833c02 	orr	r3, r3, #512	; 0x200
f001d250:	e50b3008 	str	r3, [fp, #-8]
f001d254:	e51b3010 	ldr	r3, [fp, #-16]
f001d258:	e2833030 	add	r3, r3, #48	; 0x30
f001d25c:	e51b2008 	ldr	r2, [fp, #-8]
f001d260:	e5832000 	str	r2, [r3]
f001d264:	e1a00000 	nop			; (mov r0, r0)
f001d268:	e24bd000 	sub	sp, fp, #0
f001d26c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f001d270:	e12fff1e 	bx	lr

f001d274 <pl011_set_stopbits>:
f001d274:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f001d278:	e28db000 	add	fp, sp, #0
f001d27c:	e24dd014 	sub	sp, sp, #20
f001d280:	e50b0010 	str	r0, [fp, #-16]
f001d284:	e50b1014 	str	r1, [fp, #-20]
f001d288:	e3a03000 	mov	r3, #0
f001d28c:	e50b3008 	str	r3, [fp, #-8]
f001d290:	e51b3010 	ldr	r3, [fp, #-16]
f001d294:	e283302c 	add	r3, r3, #44	; 0x2c
f001d298:	e5933000 	ldr	r3, [r3]
f001d29c:	e50b3008 	str	r3, [fp, #-8]
f001d2a0:	e51b3014 	ldr	r3, [fp, #-20]
f001d2a4:	e3530002 	cmp	r3, #2
f001d2a8:	1a000003 	bne	f001d2bc <pl011_set_stopbits+0x48>
f001d2ac:	e51b3008 	ldr	r3, [fp, #-8]
f001d2b0:	e3833008 	orr	r3, r3, #8
f001d2b4:	e50b3008 	str	r3, [fp, #-8]
f001d2b8:	ea000002 	b	f001d2c8 <pl011_set_stopbits+0x54>
f001d2bc:	e51b3008 	ldr	r3, [fp, #-8]
f001d2c0:	e3c33008 	bic	r3, r3, #8
f001d2c4:	e50b3008 	str	r3, [fp, #-8]
f001d2c8:	e51b3010 	ldr	r3, [fp, #-16]
f001d2cc:	e283302c 	add	r3, r3, #44	; 0x2c
f001d2d0:	e51b2008 	ldr	r2, [fp, #-8]
f001d2d4:	e5832000 	str	r2, [r3]
f001d2d8:	e1a00000 	nop			; (mov r0, r0)
f001d2dc:	e24bd000 	sub	sp, fp, #0
f001d2e0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f001d2e4:	e12fff1e 	bx	lr

f001d2e8 <pl011_parity_disable>:
f001d2e8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f001d2ec:	e28db000 	add	fp, sp, #0
f001d2f0:	e24dd014 	sub	sp, sp, #20
f001d2f4:	e50b0010 	str	r0, [fp, #-16]
f001d2f8:	e3a03000 	mov	r3, #0
f001d2fc:	e50b3008 	str	r3, [fp, #-8]
f001d300:	e51b3010 	ldr	r3, [fp, #-16]
f001d304:	e283302c 	add	r3, r3, #44	; 0x2c
f001d308:	e5933000 	ldr	r3, [r3]
f001d30c:	e50b3008 	str	r3, [fp, #-8]
f001d310:	e51b3008 	ldr	r3, [fp, #-8]
f001d314:	e3c33002 	bic	r3, r3, #2
f001d318:	e50b3008 	str	r3, [fp, #-8]
f001d31c:	e51b3010 	ldr	r3, [fp, #-16]
f001d320:	e283302c 	add	r3, r3, #44	; 0x2c
f001d324:	e51b2008 	ldr	r2, [fp, #-8]
f001d328:	e5832000 	str	r2, [r3]
f001d32c:	e1a00000 	nop			; (mov r0, r0)
f001d330:	e24bd000 	sub	sp, fp, #0
f001d334:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f001d338:	e12fff1e 	bx	lr

f001d33c <pl011_disable_fifos>:
f001d33c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f001d340:	e28db000 	add	fp, sp, #0
f001d344:	e24dd014 	sub	sp, sp, #20
f001d348:	e50b0010 	str	r0, [fp, #-16]
f001d34c:	e3a03000 	mov	r3, #0
f001d350:	e50b3008 	str	r3, [fp, #-8]
f001d354:	e51b3010 	ldr	r3, [fp, #-16]
f001d358:	e283302c 	add	r3, r3, #44	; 0x2c
f001d35c:	e5933000 	ldr	r3, [r3]
f001d360:	e50b3008 	str	r3, [fp, #-8]
f001d364:	e51b3008 	ldr	r3, [fp, #-8]
f001d368:	e3c33010 	bic	r3, r3, #16
f001d36c:	e50b3008 	str	r3, [fp, #-8]
f001d370:	e51b3010 	ldr	r3, [fp, #-16]
f001d374:	e283302c 	add	r3, r3, #44	; 0x2c
f001d378:	e51b2008 	ldr	r2, [fp, #-8]
f001d37c:	e5832000 	str	r2, [r3]
f001d380:	e1a00000 	nop			; (mov r0, r0)
f001d384:	e24bd000 	sub	sp, fp, #0
f001d388:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f001d38c:	e12fff1e 	bx	lr

f001d390 <pl011_set_word_width>:
f001d390:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f001d394:	e28db000 	add	fp, sp, #0
f001d398:	e24dd014 	sub	sp, sp, #20
f001d39c:	e50b0010 	str	r0, [fp, #-16]
f001d3a0:	e50b1014 	str	r1, [fp, #-20]
f001d3a4:	e3a03000 	mov	r3, #0
f001d3a8:	e50b3008 	str	r3, [fp, #-8]
f001d3ac:	e51b3014 	ldr	r3, [fp, #-20]
f001d3b0:	e3530004 	cmp	r3, #4
f001d3b4:	da000002 	ble	f001d3c4 <pl011_set_word_width+0x34>
f001d3b8:	e51b3014 	ldr	r3, [fp, #-20]
f001d3bc:	e3530008 	cmp	r3, #8
f001d3c0:	da000001 	ble	f001d3cc <pl011_set_word_width+0x3c>
f001d3c4:	e3a03008 	mov	r3, #8
f001d3c8:	e50b3014 	str	r3, [fp, #-20]
f001d3cc:	e51b3010 	ldr	r3, [fp, #-16]
f001d3d0:	e283302c 	add	r3, r3, #44	; 0x2c
f001d3d4:	e5933000 	ldr	r3, [r3]
f001d3d8:	e50b3008 	str	r3, [fp, #-8]
f001d3dc:	e51b3008 	ldr	r3, [fp, #-8]
f001d3e0:	e3c33060 	bic	r3, r3, #96	; 0x60
f001d3e4:	e50b3008 	str	r3, [fp, #-8]
f001d3e8:	e51b3010 	ldr	r3, [fp, #-16]
f001d3ec:	e283302c 	add	r3, r3, #44	; 0x2c
f001d3f0:	e51b2008 	ldr	r2, [fp, #-8]
f001d3f4:	e5832000 	str	r2, [r3]
f001d3f8:	e51b3010 	ldr	r3, [fp, #-16]
f001d3fc:	e283302c 	add	r3, r3, #44	; 0x2c
f001d400:	e5933000 	ldr	r3, [r3]
f001d404:	e50b3008 	str	r3, [fp, #-8]
f001d408:	e51b3014 	ldr	r3, [fp, #-20]
f001d40c:	e2433005 	sub	r3, r3, #5
f001d410:	e1a03283 	lsl	r3, r3, #5
f001d414:	e51b2008 	ldr	r2, [fp, #-8]
f001d418:	e1823003 	orr	r3, r2, r3
f001d41c:	e50b3008 	str	r3, [fp, #-8]
f001d420:	e51b3010 	ldr	r3, [fp, #-16]
f001d424:	e283302c 	add	r3, r3, #44	; 0x2c
f001d428:	e51b2008 	ldr	r2, [fp, #-8]
f001d42c:	e5832000 	str	r2, [r3]
f001d430:	e1a00000 	nop			; (mov r0, r0)
f001d434:	e24bd000 	sub	sp, fp, #0
f001d438:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f001d43c:	e12fff1e 	bx	lr

f001d440 <uart_tx_char>:
f001d440:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f001d444:	e28db000 	add	fp, sp, #0
f001d448:	e24dd014 	sub	sp, sp, #20
f001d44c:	e50b0010 	str	r0, [fp, #-16]
f001d450:	e1a03001 	mov	r3, r1
f001d454:	e54b3011 	strb	r3, [fp, #-17]
f001d458:	e3a03000 	mov	r3, #0
f001d45c:	e50b3008 	str	r3, [fp, #-8]
f001d460:	e51b3010 	ldr	r3, [fp, #-16]
f001d464:	e2833018 	add	r3, r3, #24
f001d468:	e5933000 	ldr	r3, [r3]
f001d46c:	e50b3008 	str	r3, [fp, #-8]
f001d470:	e51b3008 	ldr	r3, [fp, #-8]
f001d474:	e2033020 	and	r3, r3, #32
f001d478:	e3530000 	cmp	r3, #0
f001d47c:	1afffff7 	bne	f001d460 <uart_tx_char+0x20>
f001d480:	e51b3010 	ldr	r3, [fp, #-16]
f001d484:	e55b2011 	ldrb	r2, [fp, #-17]
f001d488:	e5832000 	str	r2, [r3]
f001d48c:	e24bd000 	sub	sp, fp, #0
f001d490:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f001d494:	e12fff1e 	bx	lr

f001d498 <uart_rx_char>:
f001d498:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f001d49c:	e28db000 	add	fp, sp, #0
f001d4a0:	e24dd014 	sub	sp, sp, #20
f001d4a4:	e50b0010 	str	r0, [fp, #-16]
f001d4a8:	e3a03000 	mov	r3, #0
f001d4ac:	e50b3008 	str	r3, [fp, #-8]
f001d4b0:	e51b3010 	ldr	r3, [fp, #-16]
f001d4b4:	e2833018 	add	r3, r3, #24
f001d4b8:	e5933000 	ldr	r3, [r3]
f001d4bc:	e50b3008 	str	r3, [fp, #-8]
f001d4c0:	e51b3008 	ldr	r3, [fp, #-8]
f001d4c4:	e2033010 	and	r3, r3, #16
f001d4c8:	e3530000 	cmp	r3, #0
f001d4cc:	1afffff7 	bne	f001d4b0 <uart_rx_char+0x18>
f001d4d0:	e51b3010 	ldr	r3, [fp, #-16]
f001d4d4:	e5933000 	ldr	r3, [r3]
f001d4d8:	e20330ff 	and	r3, r3, #255	; 0xff
f001d4dc:	e1a00003 	mov	r0, r3
f001d4e0:	e24bd000 	sub	sp, fp, #0
f001d4e4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f001d4e8:	e12fff1e 	bx	lr

f001d4ec <pl011_set_baudrate>:
f001d4ec:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f001d4f0:	e28db000 	add	fp, sp, #0
f001d4f4:	e24dd024 	sub	sp, sp, #36	; 0x24
f001d4f8:	e50b0018 	str	r0, [fp, #-24]
f001d4fc:	e50b101c 	str	r1, [fp, #-28]
f001d500:	e50b2020 	str	r2, [fp, #-32]
f001d504:	e59f30a4 	ldr	r3, [pc, #164]	; f001d5b0 <pl011_set_baudrate+0xc4>
f001d508:	e50b3008 	str	r3, [fp, #-8]
f001d50c:	e3a03000 	mov	r3, #0
f001d510:	e50b300c 	str	r3, [fp, #-12]
f001d514:	e3a03000 	mov	r3, #0
f001d518:	e50b3010 	str	r3, [fp, #-16]
f001d51c:	e3a03000 	mov	r3, #0
f001d520:	e50b3014 	str	r3, [fp, #-20]
f001d524:	e51b3020 	ldr	r3, [fp, #-32]
f001d528:	e3530000 	cmp	r3, #0
f001d52c:	1a000001 	bne	f001d538 <pl011_set_baudrate+0x4c>
f001d530:	e51b3008 	ldr	r3, [fp, #-8]
f001d534:	e50b3020 	str	r3, [fp, #-32]
f001d538:	e51b201c 	ldr	r2, [fp, #-28]
f001d53c:	e59f3070 	ldr	r3, [pc, #112]	; f001d5b4 <pl011_set_baudrate+0xc8>
f001d540:	e1520003 	cmp	r2, r3
f001d544:	8a000002 	bhi	f001d554 <pl011_set_baudrate+0x68>
f001d548:	e51b301c 	ldr	r3, [fp, #-28]
f001d54c:	e3530e4b 	cmp	r3, #1200	; 0x4b0
f001d550:	2a000001 	bcs	f001d55c <pl011_set_baudrate+0x70>
f001d554:	e3a03c96 	mov	r3, #38400	; 0x9600
f001d558:	e50b301c 	str	r3, [fp, #-28]
f001d55c:	e3a03027 	mov	r3, #39	; 0x27
f001d560:	e50b3010 	str	r3, [fp, #-16]
f001d564:	e51b3018 	ldr	r3, [fp, #-24]
f001d568:	e2833024 	add	r3, r3, #36	; 0x24
f001d56c:	e51b2010 	ldr	r2, [fp, #-16]
f001d570:	e5832000 	str	r2, [r3]
f001d574:	e51b3018 	ldr	r3, [fp, #-24]
f001d578:	e2833028 	add	r3, r3, #40	; 0x28
f001d57c:	e51b2014 	ldr	r2, [fp, #-20]
f001d580:	e5832000 	str	r2, [r3]
f001d584:	e51b3018 	ldr	r3, [fp, #-24]
f001d588:	e283302c 	add	r3, r3, #44	; 0x2c
f001d58c:	e5933000 	ldr	r3, [r3]
f001d590:	e50b300c 	str	r3, [fp, #-12]
f001d594:	e51b3018 	ldr	r3, [fp, #-24]
f001d598:	e283302c 	add	r3, r3, #44	; 0x2c
f001d59c:	e51b200c 	ldr	r2, [fp, #-12]
f001d5a0:	e5832000 	str	r2, [r3]
f001d5a4:	e24bd000 	sub	sp, fp, #0
f001d5a8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f001d5ac:	e12fff1e 	bx	lr
f001d5b0:	016e3600 	.word	0x016e3600
f001d5b4:	0001c200 	.word	0x0001c200

f001d5b8 <uart_init>:
f001d5b8:	e92d4800 	push	{fp, lr}
f001d5bc:	e28db004 	add	fp, sp, #4
f001d5c0:	e24dd008 	sub	sp, sp, #8
f001d5c4:	e50b0008 	str	r0, [fp, #-8]
f001d5c8:	e51b0008 	ldr	r0, [fp, #-8]
f001d5cc:	e3a01008 	mov	r1, #8
f001d5d0:	ebffff6e 	bl	f001d390 <pl011_set_word_width>
f001d5d4:	e51b0008 	ldr	r0, [fp, #-8]
f001d5d8:	ebffff57 	bl	f001d33c <pl011_disable_fifos>
f001d5dc:	e51b0008 	ldr	r0, [fp, #-8]
f001d5e0:	e3a01c96 	mov	r1, #38400	; 0x9600
f001d5e4:	e59f2034 	ldr	r2, [pc, #52]	; f001d620 <uart_init+0x68>
f001d5e8:	ebffffbf 	bl	f001d4ec <pl011_set_baudrate>
f001d5ec:	e51b0008 	ldr	r0, [fp, #-8]
f001d5f0:	e3a01001 	mov	r1, #1
f001d5f4:	ebffff1e 	bl	f001d274 <pl011_set_stopbits>
f001d5f8:	e51b0008 	ldr	r0, [fp, #-8]
f001d5fc:	ebffff39 	bl	f001d2e8 <pl011_parity_disable>
f001d600:	e51b0008 	ldr	r0, [fp, #-8]
f001d604:	ebfffef0 	bl	f001d1cc <pl011_tx_enable>
f001d608:	e51b0008 	ldr	r0, [fp, #-8]
f001d60c:	ebffff03 	bl	f001d220 <pl011_rx_enable>
f001d610:	e51b0008 	ldr	r0, [fp, #-8]
f001d614:	ebfffed7 	bl	f001d178 <pl011_uart_enable>
f001d618:	e24bd004 	sub	sp, fp, #4
f001d61c:	e8bd8800 	pop	{fp, pc}
f001d620:	016e3600 	.word	0x016e3600

f001d624 <timer_secondary_base>:
f001d624:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f001d628:	e28db000 	add	fp, sp, #0
f001d62c:	e24dd00c 	sub	sp, sp, #12
f001d630:	e50b0008 	str	r0, [fp, #-8]
f001d634:	e51b3008 	ldr	r3, [fp, #-8]
f001d638:	e2833020 	add	r3, r3, #32
f001d63c:	e1a00003 	mov	r0, r3
f001d640:	e24bd000 	sub	sp, fp, #0
f001d644:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f001d648:	e12fff1e 	bx	lr

f001d64c <timer_irq_clear>:
f001d64c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f001d650:	e28db000 	add	fp, sp, #0
f001d654:	e24dd00c 	sub	sp, sp, #12
f001d658:	e50b0008 	str	r0, [fp, #-8]
f001d65c:	e51b3008 	ldr	r3, [fp, #-8]
f001d660:	e283300c 	add	r3, r3, #12
f001d664:	e3a02001 	mov	r2, #1
f001d668:	e5832000 	str	r2, [r3]
f001d66c:	e24bd000 	sub	sp, fp, #0
f001d670:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f001d674:	e12fff1e 	bx	lr

f001d678 <timer_start>:
f001d678:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f001d67c:	e28db000 	add	fp, sp, #0
f001d680:	e24dd014 	sub	sp, sp, #20
f001d684:	e50b0010 	str	r0, [fp, #-16]
f001d688:	e51b3010 	ldr	r3, [fp, #-16]
f001d68c:	e2833008 	add	r3, r3, #8
f001d690:	e5933000 	ldr	r3, [r3]
f001d694:	e50b3008 	str	r3, [fp, #-8]
f001d698:	e51b3008 	ldr	r3, [fp, #-8]
f001d69c:	e3833080 	orr	r3, r3, #128	; 0x80
f001d6a0:	e50b3008 	str	r3, [fp, #-8]
f001d6a4:	e51b3010 	ldr	r3, [fp, #-16]
f001d6a8:	e2833008 	add	r3, r3, #8
f001d6ac:	e51b2008 	ldr	r2, [fp, #-8]
f001d6b0:	e5832000 	str	r2, [r3]
f001d6b4:	e24bd000 	sub	sp, fp, #0
f001d6b8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f001d6bc:	e12fff1e 	bx	lr

f001d6c0 <timer_load>:
f001d6c0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f001d6c4:	e28db000 	add	fp, sp, #0
f001d6c8:	e24dd00c 	sub	sp, sp, #12
f001d6cc:	e50b0008 	str	r0, [fp, #-8]
f001d6d0:	e50b100c 	str	r1, [fp, #-12]
f001d6d4:	e51b300c 	ldr	r3, [fp, #-12]
f001d6d8:	e51b2008 	ldr	r2, [fp, #-8]
f001d6dc:	e5832000 	str	r2, [r3]
f001d6e0:	e24bd000 	sub	sp, fp, #0
f001d6e4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f001d6e8:	e12fff1e 	bx	lr

f001d6ec <timer_read>:
f001d6ec:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f001d6f0:	e28db000 	add	fp, sp, #0
f001d6f4:	e24dd00c 	sub	sp, sp, #12
f001d6f8:	e50b0008 	str	r0, [fp, #-8]
f001d6fc:	e51b3008 	ldr	r3, [fp, #-8]
f001d700:	e2833004 	add	r3, r3, #4
f001d704:	e5933000 	ldr	r3, [r3]
f001d708:	e1a00003 	mov	r0, r3
f001d70c:	e24bd000 	sub	sp, fp, #0
f001d710:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f001d714:	e12fff1e 	bx	lr

f001d718 <timer_stop>:
f001d718:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f001d71c:	e28db000 	add	fp, sp, #0
f001d720:	e24dd00c 	sub	sp, sp, #12
f001d724:	e50b0008 	str	r0, [fp, #-8]
f001d728:	e51b3008 	ldr	r3, [fp, #-8]
f001d72c:	e2833008 	add	r3, r3, #8
f001d730:	e3a02000 	mov	r2, #0
f001d734:	e5832000 	str	r2, [r3]
f001d738:	e24bd000 	sub	sp, fp, #0
f001d73c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f001d740:	e12fff1e 	bx	lr

f001d744 <timer_init_periodic>:
f001d744:	e92d4800 	push	{fp, lr}
f001d748:	e28db004 	add	fp, sp, #4
f001d74c:	e24dd010 	sub	sp, sp, #16
f001d750:	e50b0010 	str	r0, [fp, #-16]
f001d754:	e50b1014 	str	r1, [fp, #-20]
f001d758:	e3a03062 	mov	r3, #98	; 0x62
f001d75c:	e50b3008 	str	r3, [fp, #-8]
f001d760:	e51b3010 	ldr	r3, [fp, #-16]
f001d764:	e2833008 	add	r3, r3, #8
f001d768:	e51b2008 	ldr	r2, [fp, #-8]
f001d76c:	e5832000 	str	r2, [r3]
f001d770:	e51b3014 	ldr	r3, [fp, #-20]
f001d774:	e3530000 	cmp	r3, #0
f001d778:	0a000003 	beq	f001d78c <timer_init_periodic+0x48>
f001d77c:	e51b0014 	ldr	r0, [fp, #-20]
f001d780:	e51b1010 	ldr	r1, [fp, #-16]
f001d784:	ebffffcd 	bl	f001d6c0 <timer_load>
f001d788:	ea000002 	b	f001d798 <timer_init_periodic+0x54>
f001d78c:	e3a00ffa 	mov	r0, #1000	; 0x3e8
f001d790:	e51b1010 	ldr	r1, [fp, #-16]
f001d794:	ebffffc9 	bl	f001d6c0 <timer_load>
f001d798:	e24bd004 	sub	sp, fp, #4
f001d79c:	e8bd8800 	pop	{fp, pc}

f001d7a0 <timer_init_oneshot>:
f001d7a0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f001d7a4:	e28db000 	add	fp, sp, #0
f001d7a8:	e24dd014 	sub	sp, sp, #20
f001d7ac:	e50b0010 	str	r0, [fp, #-16]
f001d7b0:	e51b3010 	ldr	r3, [fp, #-16]
f001d7b4:	e2833008 	add	r3, r3, #8
f001d7b8:	e5933000 	ldr	r3, [r3]
f001d7bc:	e50b3008 	str	r3, [fp, #-8]
f001d7c0:	e51b3008 	ldr	r3, [fp, #-8]
f001d7c4:	e3833003 	orr	r3, r3, #3
f001d7c8:	e50b3008 	str	r3, [fp, #-8]
f001d7cc:	e51b3010 	ldr	r3, [fp, #-16]
f001d7d0:	e2833008 	add	r3, r3, #8
f001d7d4:	e51b2008 	ldr	r2, [fp, #-8]
f001d7d8:	e5832000 	str	r2, [r3]
f001d7dc:	e24bd000 	sub	sp, fp, #0
f001d7e0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f001d7e4:	e12fff1e 	bx	lr

f001d7e8 <timer_init>:
f001d7e8:	e92d4800 	push	{fp, lr}
f001d7ec:	e28db004 	add	fp, sp, #4
f001d7f0:	e24dd008 	sub	sp, sp, #8
f001d7f4:	e50b0008 	str	r0, [fp, #-8]
f001d7f8:	e50b100c 	str	r1, [fp, #-12]
f001d7fc:	e51b0008 	ldr	r0, [fp, #-8]
f001d800:	e51b100c 	ldr	r1, [fp, #-12]
f001d804:	ebffffce 	bl	f001d744 <timer_init_periodic>
f001d808:	e24bd004 	sub	sp, fp, #4
f001d80c:	e8bd8800 	pop	{fp, pc}

f001d810 <setbit>:
f001d810:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f001d814:	e28db000 	add	fp, sp, #0
f001d818:	e24dd00c 	sub	sp, sp, #12
f001d81c:	e50b0008 	str	r0, [fp, #-8]
f001d820:	e50b100c 	str	r1, [fp, #-12]
f001d824:	e51b3008 	ldr	r3, [fp, #-8]
f001d828:	e5932000 	ldr	r2, [r3]
f001d82c:	e51b300c 	ldr	r3, [fp, #-12]
f001d830:	e1822003 	orr	r2, r2, r3
f001d834:	e51b3008 	ldr	r3, [fp, #-8]
f001d838:	e5832000 	str	r2, [r3]
f001d83c:	e24bd000 	sub	sp, fp, #0
f001d840:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f001d844:	e12fff1e 	bx	lr

f001d848 <pl190_read_irq>:
f001d848:	e92d4800 	push	{fp, lr}
f001d84c:	e28db004 	add	fp, sp, #4
f001d850:	e24dd010 	sub	sp, sp, #16
f001d854:	e50b0010 	str	r0, [fp, #-16]
f001d858:	e59f3024 	ldr	r3, [pc, #36]	; f001d884 <pl190_read_irq+0x3c>
f001d85c:	e5933000 	ldr	r3, [r3]
f001d860:	e1a00003 	mov	r0, r3
f001d864:	ebffe22e 	bl	f0016124 <__clz>
f001d868:	e1a03000 	mov	r3, r0
f001d86c:	e263301f 	rsb	r3, r3, #31
f001d870:	e50b3008 	str	r3, [fp, #-8]
f001d874:	e51b3008 	ldr	r3, [fp, #-8]
f001d878:	e1a00003 	mov	r0, r3
f001d87c:	e24bd004 	sub	sp, fp, #4
f001d880:	e8bd8800 	pop	{fp, pc}
f001d884:	f9002000 	.word	0xf9002000

f001d888 <pl190_mask_irq>:
f001d888:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f001d88c:	e28db000 	add	fp, sp, #0
f001d890:	e24dd00c 	sub	sp, sp, #12
f001d894:	e50b0008 	str	r0, [fp, #-8]
f001d898:	e59f3018 	ldr	r3, [pc, #24]	; f001d8b8 <pl190_mask_irq+0x30>
f001d89c:	e51b2008 	ldr	r2, [fp, #-8]
f001d8a0:	e3a01001 	mov	r1, #1
f001d8a4:	e1a02211 	lsl	r2, r1, r2
f001d8a8:	e5832000 	str	r2, [r3]
f001d8ac:	e24bd000 	sub	sp, fp, #0
f001d8b0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f001d8b4:	e12fff1e 	bx	lr
f001d8b8:	f9002014 	.word	0xf9002014

f001d8bc <pl190_ack_irq>:
f001d8bc:	e92d4800 	push	{fp, lr}
f001d8c0:	e28db004 	add	fp, sp, #4
f001d8c4:	e24dd008 	sub	sp, sp, #8
f001d8c8:	e50b0008 	str	r0, [fp, #-8]
f001d8cc:	e51b0008 	ldr	r0, [fp, #-8]
f001d8d0:	ebffffec 	bl	f001d888 <pl190_mask_irq>
f001d8d4:	e24bd004 	sub	sp, fp, #4
f001d8d8:	e8bd8800 	pop	{fp, pc}

f001d8dc <pl190_unmask_irq>:
f001d8dc:	e92d4800 	push	{fp, lr}
f001d8e0:	e28db004 	add	fp, sp, #4
f001d8e4:	e24dd008 	sub	sp, sp, #8
f001d8e8:	e50b0008 	str	r0, [fp, #-8]
f001d8ec:	e51b3008 	ldr	r3, [fp, #-8]
f001d8f0:	e3a02001 	mov	r2, #1
f001d8f4:	e1a03312 	lsl	r3, r2, r3
f001d8f8:	e59f000c 	ldr	r0, [pc, #12]	; f001d90c <pl190_unmask_irq+0x30>
f001d8fc:	e1a01003 	mov	r1, r3
f001d900:	ebffffc2 	bl	f001d810 <setbit>
f001d904:	e24bd004 	sub	sp, fp, #4
f001d908:	e8bd8800 	pop	{fp, pc}
f001d90c:	f9002010 	.word	0xf9002010

f001d910 <pl190_sic_read_irq>:
f001d910:	e92d4800 	push	{fp, lr}
f001d914:	e28db004 	add	fp, sp, #4
f001d918:	e24dd010 	sub	sp, sp, #16
f001d91c:	e50b0010 	str	r0, [fp, #-16]
f001d920:	e59f3024 	ldr	r3, [pc, #36]	; f001d94c <pl190_sic_read_irq+0x3c>
f001d924:	e5933000 	ldr	r3, [r3]
f001d928:	e1a00003 	mov	r0, r3
f001d92c:	ebffe1fc 	bl	f0016124 <__clz>
f001d930:	e1a03000 	mov	r3, r0
f001d934:	e263301f 	rsb	r3, r3, #31
f001d938:	e50b3008 	str	r3, [fp, #-8]
f001d93c:	e51b3008 	ldr	r3, [fp, #-8]
f001d940:	e1a00003 	mov	r0, r3
f001d944:	e24bd004 	sub	sp, fp, #4
f001d948:	e8bd8800 	pop	{fp, pc}
f001d94c:	f9003000 	.word	0xf9003000

f001d950 <pl190_sic_mask_irq>:
f001d950:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f001d954:	e28db000 	add	fp, sp, #0
f001d958:	e24dd00c 	sub	sp, sp, #12
f001d95c:	e50b0008 	str	r0, [fp, #-8]
f001d960:	e59f3018 	ldr	r3, [pc, #24]	; f001d980 <pl190_sic_mask_irq+0x30>
f001d964:	e51b2008 	ldr	r2, [fp, #-8]
f001d968:	e3a01001 	mov	r1, #1
f001d96c:	e1a02211 	lsl	r2, r1, r2
f001d970:	e5832000 	str	r2, [r3]
f001d974:	e24bd000 	sub	sp, fp, #0
f001d978:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f001d97c:	e12fff1e 	bx	lr
f001d980:	f900300c 	.word	0xf900300c

f001d984 <pl190_sic_ack_irq>:
f001d984:	e92d4800 	push	{fp, lr}
f001d988:	e28db004 	add	fp, sp, #4
f001d98c:	e24dd008 	sub	sp, sp, #8
f001d990:	e50b0008 	str	r0, [fp, #-8]
f001d994:	e51b0008 	ldr	r0, [fp, #-8]
f001d998:	ebffffec 	bl	f001d950 <pl190_sic_mask_irq>
f001d99c:	e24bd004 	sub	sp, fp, #4
f001d9a0:	e8bd8800 	pop	{fp, pc}

f001d9a4 <pl190_sic_unmask_irq>:
f001d9a4:	e92d4800 	push	{fp, lr}
f001d9a8:	e28db004 	add	fp, sp, #4
f001d9ac:	e24dd008 	sub	sp, sp, #8
f001d9b0:	e50b0008 	str	r0, [fp, #-8]
f001d9b4:	e51b3008 	ldr	r3, [fp, #-8]
f001d9b8:	e3a02001 	mov	r2, #1
f001d9bc:	e1a03312 	lsl	r3, r2, r3
f001d9c0:	e59f000c 	ldr	r0, [pc, #12]	; f001d9d4 <pl190_sic_unmask_irq+0x30>
f001d9c4:	e1a01003 	mov	r1, r3
f001d9c8:	ebffff90 	bl	f001d810 <setbit>
f001d9cc:	e24bd004 	sub	sp, fp, #4
f001d9d0:	e8bd8800 	pop	{fp, pc}
f001d9d4:	f9003008 	.word	0xf9003008

f001d9d8 <pl190_vic_init>:
f001d9d8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f001d9dc:	e28db000 	add	fp, sp, #0
f001d9e0:	e59f3044 	ldr	r3, [pc, #68]	; f001da2c <pl190_vic_init+0x54>
f001d9e4:	e3a02000 	mov	r2, #0
f001d9e8:	e5832000 	str	r2, [r3]
f001d9ec:	e59f303c 	ldr	r3, [pc, #60]	; f001da30 <pl190_vic_init+0x58>
f001d9f0:	e3e02000 	mvn	r2, #0
f001d9f4:	e5832000 	str	r2, [r3]
f001d9f8:	e59f3034 	ldr	r3, [pc, #52]	; f001da34 <pl190_vic_init+0x5c>
f001d9fc:	e3a02000 	mov	r2, #0
f001da00:	e5832000 	str	r2, [r3]
f001da04:	e59f302c 	ldr	r3, [pc, #44]	; f001da38 <pl190_vic_init+0x60>
f001da08:	e3a02001 	mov	r2, #1
f001da0c:	e5832000 	str	r2, [r3]
f001da10:	e59f3024 	ldr	r3, [pc, #36]	; f001da3c <pl190_vic_init+0x64>
f001da14:	e3e02000 	mvn	r2, #0
f001da18:	e5832000 	str	r2, [r3]
f001da1c:	e1a00000 	nop			; (mov r0, r0)
f001da20:	e24bd000 	sub	sp, fp, #0
f001da24:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f001da28:	e12fff1e 	bx	lr
f001da2c:	f9002010 	.word	0xf9002010
f001da30:	f9002014 	.word	0xf9002014
f001da34:	f900200c 	.word	0xf900200c
f001da38:	f9002020 	.word	0xf9002020
f001da3c:	f900201c 	.word	0xf900201c

f001da40 <pl190_sic_init>:
f001da40:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f001da44:	e28db000 	add	fp, sp, #0
f001da48:	e59f3028 	ldr	r3, [pc, #40]	; f001da78 <pl190_sic_init+0x38>
f001da4c:	e3a02000 	mov	r2, #0
f001da50:	e5832000 	str	r2, [r3]
f001da54:	e59f3020 	ldr	r3, [pc, #32]	; f001da7c <pl190_sic_init+0x3c>
f001da58:	e3e02000 	mvn	r2, #0
f001da5c:	e5832000 	str	r2, [r3]
f001da60:	e59f3018 	ldr	r3, [pc, #24]	; f001da80 <pl190_sic_init+0x40>
f001da64:	e3e02000 	mvn	r2, #0
f001da68:	e5832000 	str	r2, [r3]
f001da6c:	e24bd000 	sub	sp, fp, #0
f001da70:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f001da74:	e12fff1e 	bx	lr
f001da78:	f9003008 	.word	0xf9003008
f001da7c:	f900300c 	.word	0xf900300c
f001da80:	f9003024 	.word	0xf9003024

f001da84 <print_early>:
f001da84:	e92d4800 	push	{fp, lr}
f001da88:	e28db004 	add	fp, sp, #4
f001da8c:	e24dd010 	sub	sp, sp, #16
f001da90:	e50b0010 	str	r0, [fp, #-16]
f001da94:	e3a03000 	mov	r3, #0
f001da98:	e50b300c 	str	r3, [fp, #-12]
f001da9c:	e51b300c 	ldr	r3, [fp, #-12]
f001daa0:	ee113f10 	mrc	15, 0, r3, cr1, cr0, {0}
f001daa4:	e50b300c 	str	r3, [fp, #-12]
f001daa8:	e51b300c 	ldr	r3, [fp, #-12]
f001daac:	e2033001 	and	r3, r3, #1
f001dab0:	e3530000 	cmp	r3, #0
f001dab4:	0a000002 	beq	f001dac4 <print_early+0x40>
f001dab8:	e59f3070 	ldr	r3, [pc, #112]	; f001db30 <print_early+0xac>
f001dabc:	e50b3008 	str	r3, [fp, #-8]
f001dac0:	ea000014 	b	f001db18 <print_early+0x94>
f001dac4:	e59f3068 	ldr	r3, [pc, #104]	; f001db34 <print_early+0xb0>
f001dac8:	e50b3008 	str	r3, [fp, #-8]
f001dacc:	e51b3010 	ldr	r3, [fp, #-16]
f001dad0:	e3c3320f 	bic	r3, r3, #-268435456	; 0xf0000000
f001dad4:	e50b3010 	str	r3, [fp, #-16]
f001dad8:	ea00000e 	b	f001db18 <print_early+0x94>
f001dadc:	e51b3010 	ldr	r3, [fp, #-16]
f001dae0:	e5d33000 	ldrb	r3, [r3]
f001dae4:	e51b0008 	ldr	r0, [fp, #-8]
f001dae8:	e1a01003 	mov	r1, r3
f001daec:	ebfffe53 	bl	f001d440 <uart_tx_char>
f001daf0:	e51b3010 	ldr	r3, [fp, #-16]
f001daf4:	e5d33000 	ldrb	r3, [r3]
f001daf8:	e353000a 	cmp	r3, #10
f001dafc:	1a000002 	bne	f001db0c <print_early+0x88>
f001db00:	e51b0008 	ldr	r0, [fp, #-8]
f001db04:	e3a0100d 	mov	r1, #13
f001db08:	ebfffe4c 	bl	f001d440 <uart_tx_char>
f001db0c:	e51b3010 	ldr	r3, [fp, #-16]
f001db10:	e2833001 	add	r3, r3, #1
f001db14:	e50b3010 	str	r3, [fp, #-16]
f001db18:	e51b3010 	ldr	r3, [fp, #-16]
f001db1c:	e5d33000 	ldrb	r3, [r3]
f001db20:	e3530000 	cmp	r3, #0
f001db24:	1affffec 	bne	f001dadc <print_early+0x58>
f001db28:	e24bd004 	sub	sp, fp, #4
f001db2c:	e8bd8800 	pop	{fp, pc}
f001db30:	f9001000 	.word	0xf9001000
f001db34:	101f1000 	.word	0x101f1000

f001db38 <printhex8>:
f001db38:	e92d4800 	push	{fp, lr}
f001db3c:	e28db004 	add	fp, sp, #4
f001db40:	e24dd020 	sub	sp, sp, #32
f001db44:	e50b0020 	str	r0, [fp, #-32]
f001db48:	e24b3018 	sub	r3, fp, #24
f001db4c:	e283300f 	add	r3, r3, #15
f001db50:	e50b3008 	str	r3, [fp, #-8]
f001db54:	e51b3008 	ldr	r3, [fp, #-8]
f001db58:	e2432001 	sub	r2, r3, #1
f001db5c:	e50b2008 	str	r2, [fp, #-8]
f001db60:	e3a02000 	mov	r2, #0
f001db64:	e5c32000 	strb	r2, [r3]
f001db68:	e51b3020 	ldr	r3, [fp, #-32]
f001db6c:	e3530000 	cmp	r3, #0
f001db70:	1a000003 	bne	f001db84 <printhex8+0x4c>
f001db74:	e51b3008 	ldr	r3, [fp, #-8]
f001db78:	e3a02030 	mov	r2, #48	; 0x30
f001db7c:	e5c32000 	strb	r2, [r3]
f001db80:	ea00001a 	b	f001dbf0 <printhex8+0xb8>
f001db84:	ea000016 	b	f001dbe4 <printhex8+0xac>
f001db88:	e51b3020 	ldr	r3, [fp, #-32]
f001db8c:	e203300f 	and	r3, r3, #15
f001db90:	e50b301c 	str	r3, [fp, #-28]
f001db94:	e51b3020 	ldr	r3, [fp, #-32]
f001db98:	e1a03223 	lsr	r3, r3, #4
f001db9c:	e50b3020 	str	r3, [fp, #-32]
f001dba0:	e51b3008 	ldr	r3, [fp, #-8]
f001dba4:	e2433001 	sub	r3, r3, #1
f001dba8:	e50b3008 	str	r3, [fp, #-8]
f001dbac:	e51b301c 	ldr	r3, [fp, #-28]
f001dbb0:	e3530009 	cmp	r3, #9
f001dbb4:	da000003 	ble	f001dbc8 <printhex8+0x90>
f001dbb8:	e51b301c 	ldr	r3, [fp, #-28]
f001dbbc:	e2833057 	add	r3, r3, #87	; 0x57
f001dbc0:	e50b301c 	str	r3, [fp, #-28]
f001dbc4:	ea000002 	b	f001dbd4 <printhex8+0x9c>
f001dbc8:	e51b301c 	ldr	r3, [fp, #-28]
f001dbcc:	e2833030 	add	r3, r3, #48	; 0x30
f001dbd0:	e50b301c 	str	r3, [fp, #-28]
f001dbd4:	e24b301c 	sub	r3, fp, #28
f001dbd8:	e5d32000 	ldrb	r2, [r3]
f001dbdc:	e51b3008 	ldr	r3, [fp, #-8]
f001dbe0:	e5c32000 	strb	r2, [r3]
f001dbe4:	e51b3020 	ldr	r3, [fp, #-32]
f001dbe8:	e3530000 	cmp	r3, #0
f001dbec:	1affffe5 	bne	f001db88 <printhex8+0x50>
f001dbf0:	e51b3008 	ldr	r3, [fp, #-8]
f001dbf4:	e2433001 	sub	r3, r3, #1
f001dbf8:	e50b3008 	str	r3, [fp, #-8]
f001dbfc:	e51b3008 	ldr	r3, [fp, #-8]
f001dc00:	e3a02078 	mov	r2, #120	; 0x78
f001dc04:	e5c32000 	strb	r2, [r3]
f001dc08:	e51b3008 	ldr	r3, [fp, #-8]
f001dc0c:	e2433001 	sub	r3, r3, #1
f001dc10:	e50b3008 	str	r3, [fp, #-8]
f001dc14:	e51b3008 	ldr	r3, [fp, #-8]
f001dc18:	e3a02030 	mov	r2, #48	; 0x30
f001dc1c:	e5c32000 	strb	r2, [r3]
f001dc20:	e51b0008 	ldr	r0, [fp, #-8]
f001dc24:	ebffff96 	bl	f001da84 <print_early>
f001dc28:	e24bd004 	sub	sp, fp, #4
f001dc2c:	e8bd8800 	pop	{fp, pc}

f001dc30 <irq_enable>:
f001dc30:	e92d4800 	push	{fp, lr}
f001dc34:	e28db004 	add	fp, sp, #4
f001dc38:	e24dd010 	sub	sp, sp, #16
f001dc3c:	e50b0010 	str	r0, [fp, #-16]
f001dc40:	e51b2010 	ldr	r2, [fp, #-16]
f001dc44:	e1a03002 	mov	r3, r2
f001dc48:	e1a03103 	lsl	r3, r3, #2
f001dc4c:	e0833002 	add	r3, r3, r2
f001dc50:	e1a03183 	lsl	r3, r3, #3
f001dc54:	e1a02003 	mov	r2, r3
f001dc58:	e59f3038 	ldr	r3, [pc, #56]	; f001dc98 <irq_enable+0x68>
f001dc5c:	e0823003 	add	r3, r2, r3
f001dc60:	e50b3008 	str	r3, [fp, #-8]
f001dc64:	e51b3008 	ldr	r3, [fp, #-8]
f001dc68:	e5933008 	ldr	r3, [r3, #8]
f001dc6c:	e50b300c 	str	r3, [fp, #-12]
f001dc70:	e51b300c 	ldr	r3, [fp, #-12]
f001dc74:	e5933040 	ldr	r3, [r3, #64]	; 0x40
f001dc78:	e51b200c 	ldr	r2, [fp, #-12]
f001dc7c:	e5922028 	ldr	r2, [r2, #40]	; 0x28
f001dc80:	e51b1010 	ldr	r1, [fp, #-16]
f001dc84:	e0622001 	rsb	r2, r2, r1
f001dc88:	e1a00002 	mov	r0, r2
f001dc8c:	e12fff33 	blx	r3
f001dc90:	e24bd004 	sub	sp, fp, #4
f001dc94:	e8bd8800 	pop	{fp, pc}
f001dc98:	f00200b8 	.word	0xf00200b8

f001dc9c <init_platform_console>:
f001dc9c:	e92d4800 	push	{fp, lr}
f001dca0:	e28db004 	add	fp, sp, #4
f001dca4:	e59f002c 	ldr	r0, [pc, #44]	; f001dcd8 <init_platform_console+0x3c>
f001dca8:	e59f102c 	ldr	r1, [pc, #44]	; f001dcdc <init_platform_console+0x40>
f001dcac:	e3a02a01 	mov	r2, #4096	; 0x1000
f001dcb0:	e3a03005 	mov	r3, #5
f001dcb4:	ebffd52a 	bl	f0013164 <add_boot_mapping>
f001dcb8:	e59f0018 	ldr	r0, [pc, #24]	; f001dcd8 <init_platform_console+0x3c>
f001dcbc:	e59f101c 	ldr	r1, [pc, #28]	; f001dce0 <init_platform_console+0x44>
f001dcc0:	e3a02a01 	mov	r2, #4096	; 0x1000
f001dcc4:	e3a03004 	mov	r3, #4
f001dcc8:	ebffd525 	bl	f0013164 <add_boot_mapping>
f001dccc:	e59f0008 	ldr	r0, [pc, #8]	; f001dcdc <init_platform_console+0x40>
f001dcd0:	ebfffe38 	bl	f001d5b8 <uart_init>
f001dcd4:	e8bd8800 	pop	{fp, pc}
f001dcd8:	101f1000 	.word	0x101f1000
f001dcdc:	f9001000 	.word	0xf9001000
f001dce0:	f9800000 	.word	0xf9800000

f001dce4 <init_platform_timer>:
f001dce4:	e92d4800 	push	{fp, lr}
f001dce8:	e28db004 	add	fp, sp, #4
f001dcec:	e59f001c 	ldr	r0, [pc, #28]	; f001dd10 <init_platform_timer+0x2c>
f001dcf0:	e3a014f9 	mov	r1, #-117440512	; 0xf9000000
f001dcf4:	e3a02a01 	mov	r2, #4096	; 0x1000
f001dcf8:	e3a03005 	mov	r3, #5
f001dcfc:	ebffd518 	bl	f0013164 <add_boot_mapping>
f001dd00:	e3a004f9 	mov	r0, #-117440512	; 0xf9000000
f001dd04:	e3a01ffa 	mov	r1, #1000	; 0x3e8
f001dd08:	ebfffeb6 	bl	f001d7e8 <timer_init>
f001dd0c:	e8bd8800 	pop	{fp, pc}
f001dd10:	101e2000 	.word	0x101e2000

f001dd14 <init_platform_irq_controller>:
f001dd14:	e92d4800 	push	{fp, lr}
f001dd18:	e28db004 	add	fp, sp, #4
f001dd1c:	e59f0028 	ldr	r0, [pc, #40]	; f001dd4c <init_platform_irq_controller+0x38>
f001dd20:	e59f1028 	ldr	r1, [pc, #40]	; f001dd50 <init_platform_irq_controller+0x3c>
f001dd24:	e3a02a01 	mov	r2, #4096	; 0x1000
f001dd28:	e3a03005 	mov	r3, #5
f001dd2c:	ebffd50c 	bl	f0013164 <add_boot_mapping>
f001dd30:	e59f001c 	ldr	r0, [pc, #28]	; f001dd54 <init_platform_irq_controller+0x40>
f001dd34:	e59f101c 	ldr	r1, [pc, #28]	; f001dd58 <init_platform_irq_controller+0x44>
f001dd38:	e3a02a01 	mov	r2, #4096	; 0x1000
f001dd3c:	e3a03005 	mov	r3, #5
f001dd40:	ebffd507 	bl	f0013164 <add_boot_mapping>
f001dd44:	ebffa968 	bl	f00082ec <irq_controllers_init>
f001dd48:	e8bd8800 	pop	{fp, pc}
f001dd4c:	10140000 	.word	0x10140000
f001dd50:	f9002000 	.word	0xf9002000
f001dd54:	10003000 	.word	0x10003000
f001dd58:	f9003000 	.word	0xf9003000

f001dd5c <init_platform_devices>:
f001dd5c:	e92d4800 	push	{fp, lr}
f001dd60:	e28db004 	add	fp, sp, #4
f001dd64:	e59f004c 	ldr	r0, [pc, #76]	; f001ddb8 <init_platform_devices+0x5c>
f001dd68:	e59f104c 	ldr	r1, [pc, #76]	; f001ddbc <init_platform_devices+0x60>
f001dd6c:	e3a02a01 	mov	r2, #4096	; 0x1000
f001dd70:	e3a03005 	mov	r3, #5
f001dd74:	ebffd4fa 	bl	f0013164 <add_boot_mapping>
f001dd78:	e59f0040 	ldr	r0, [pc, #64]	; f001ddc0 <init_platform_devices+0x64>
f001dd7c:	e59f1040 	ldr	r1, [pc, #64]	; f001ddc4 <init_platform_devices+0x68>
f001dd80:	e3a02a01 	mov	r2, #4096	; 0x1000
f001dd84:	e3a03005 	mov	r3, #5
f001dd88:	ebffd4f5 	bl	f0013164 <add_boot_mapping>
f001dd8c:	e59f0034 	ldr	r0, [pc, #52]	; f001ddc8 <init_platform_devices+0x6c>
f001dd90:	e59f1034 	ldr	r1, [pc, #52]	; f001ddcc <init_platform_devices+0x70>
f001dd94:	e3a02a01 	mov	r2, #4096	; 0x1000
f001dd98:	e3a03005 	mov	r3, #5
f001dd9c:	ebffd4f0 	bl	f0013164 <add_boot_mapping>
f001dda0:	e59f0028 	ldr	r0, [pc, #40]	; f001ddd0 <init_platform_devices+0x74>
f001dda4:	e59f1028 	ldr	r1, [pc, #40]	; f001ddd4 <init_platform_devices+0x78>
f001dda8:	e3a02a01 	mov	r2, #4096	; 0x1000
f001ddac:	e3a03005 	mov	r3, #5
f001ddb0:	ebffd4eb 	bl	f0013164 <add_boot_mapping>
f001ddb4:	e8bd8800 	pop	{fp, pc}
f001ddb8:	101e3000 	.word	0x101e3000
f001ddbc:	f9006000 	.word	0xf9006000
f001ddc0:	10006000 	.word	0x10006000
f001ddc4:	f9007000 	.word	0xf9007000
f001ddc8:	10007000 	.word	0x10007000
f001ddcc:	f9008000 	.word	0xf9008000
f001ddd0:	10120000 	.word	0x10120000
f001ddd4:	f9009000 	.word	0xf9009000

f001ddd8 <init_timer_osc>:
f001ddd8:	e92d4800 	push	{fp, lr}
f001dddc:	e28db004 	add	fp, sp, #4
f001dde0:	e24dd008 	sub	sp, sp, #8
f001dde4:	e59f0030 	ldr	r0, [pc, #48]	; f001de1c <init_timer_osc+0x44>
f001dde8:	e59f1030 	ldr	r1, [pc, #48]	; f001de20 <init_timer_osc+0x48>
f001ddec:	e3a02a01 	mov	r2, #4096	; 0x1000
f001ddf0:	e3a03005 	mov	r3, #5
f001ddf4:	ebffd4da 	bl	f0013164 <add_boot_mapping>
f001ddf8:	e59f3020 	ldr	r3, [pc, #32]	; f001de20 <init_timer_osc+0x48>
f001ddfc:	e5933000 	ldr	r3, [r3]
f001de00:	e50b3008 	str	r3, [fp, #-8]
f001de04:	e59f3014 	ldr	r3, [pc, #20]	; f001de20 <init_timer_osc+0x48>
f001de08:	e51b2008 	ldr	r2, [fp, #-8]
f001de0c:	e38229aa 	orr	r2, r2, #2785280	; 0x2a8000
f001de10:	e5832000 	str	r2, [r3]
f001de14:	e24bd004 	sub	sp, fp, #4
f001de18:	e8bd8800 	pop	{fp, pc}
f001de1c:	101e0000 	.word	0x101e0000
f001de20:	f9004000 	.word	0xf9004000

f001de24 <platform_timer_start>:
f001de24:	e92d4800 	push	{fp, lr}
f001de28:	e28db004 	add	fp, sp, #4
f001de2c:	e3a00004 	mov	r0, #4
f001de30:	ebffff7e 	bl	f001dc30 <irq_enable>
f001de34:	e3a004f9 	mov	r0, #-117440512	; 0xf9000000
f001de38:	ebfffe0e 	bl	f001d678 <timer_start>
f001de3c:	e8bd8800 	pop	{fp, pc}

f001de40 <platform_init>:
f001de40:	e92d4800 	push	{fp, lr}
f001de44:	e28db004 	add	fp, sp, #4
f001de48:	ebffffe2 	bl	f001ddd8 <init_timer_osc>
f001de4c:	ebffff92 	bl	f001dc9c <init_platform_console>
f001de50:	ebffffa3 	bl	f001dce4 <init_platform_timer>
f001de54:	ebffffae 	bl	f001dd14 <init_platform_irq_controller>
f001de58:	ebffffbf 	bl	f001dd5c <init_platform_devices>
f001de5c:	e8bd8800 	pop	{fp, pc}

f001de60 <clrbit>:
f001de60:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
f001de64:	e28db000 	add	fp, sp, #0
f001de68:	e24dd00c 	sub	sp, sp, #12
f001de6c:	e50b0008 	str	r0, [fp, #-8]
f001de70:	e50b100c 	str	r1, [fp, #-12]
f001de74:	e51b3008 	ldr	r3, [fp, #-8]
f001de78:	e5932000 	ldr	r2, [r3]
f001de7c:	e51b300c 	ldr	r3, [fp, #-12]
f001de80:	e1e03003 	mvn	r3, r3
f001de84:	e0022003 	and	r2, r2, r3
f001de88:	e51b3008 	ldr	r3, [fp, #-8]
f001de8c:	e5832000 	str	r2, [r3]
f001de90:	e24bd000 	sub	sp, fp, #0
f001de94:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
f001de98:	e12fff1e 	bx	lr

f001de9c <platform_timer_handler>:
f001de9c:	e92d4800 	push	{fp, lr}
f001dea0:	e28db004 	add	fp, sp, #4
f001dea4:	e24dd008 	sub	sp, sp, #8
f001dea8:	e50b0008 	str	r0, [fp, #-8]
f001deac:	e3a004f9 	mov	r0, #-117440512	; 0xf9000000
f001deb0:	ebfffde5 	bl	f001d64c <timer_irq_clear>
f001deb4:	ebffaeac 	bl	f000996c <do_timer_irq>
f001deb8:	e1a03000 	mov	r3, r0
f001debc:	e1a00003 	mov	r0, r3
f001dec0:	e24bd004 	sub	sp, fp, #4
f001dec4:	e8bd8800 	pop	{fp, pc}

f001dec8 <platform_timer_user_handler>:
f001dec8:	e92d4800 	push	{fp, lr}
f001decc:	e28db004 	add	fp, sp, #4
f001ded0:	e24dd008 	sub	sp, sp, #8
f001ded4:	e50b0008 	str	r0, [fp, #-8]
f001ded8:	e59f0018 	ldr	r0, [pc, #24]	; f001def8 <platform_timer_user_handler+0x30>
f001dedc:	ebfffdda 	bl	f001d64c <timer_irq_clear>
f001dee0:	e51b0008 	ldr	r0, [fp, #-8]
f001dee4:	ebfffb53 	bl	f001cc38 <irq_thread_notify>
f001dee8:	e3a03000 	mov	r3, #0
f001deec:	e1a00003 	mov	r0, r3
f001def0:	e24bd004 	sub	sp, fp, #4
f001def4:	e8bd8800 	pop	{fp, pc}
f001def8:	f9006000 	.word	0xf9006000

f001defc <platform_keyboard_user_handler>:
f001defc:	e92d4800 	push	{fp, lr}
f001df00:	e28db004 	add	fp, sp, #4
f001df04:	e24dd008 	sub	sp, sp, #8
f001df08:	e50b0008 	str	r0, [fp, #-8]
f001df0c:	e59f001c 	ldr	r0, [pc, #28]	; f001df30 <platform_keyboard_user_handler+0x34>
f001df10:	e3a01010 	mov	r1, #16
f001df14:	ebffffd1 	bl	f001de60 <clrbit>
f001df18:	e51b0008 	ldr	r0, [fp, #-8]
f001df1c:	ebfffb45 	bl	f001cc38 <irq_thread_notify>
f001df20:	e3a03000 	mov	r3, #0
f001df24:	e1a00003 	mov	r0, r3
f001df28:	e24bd004 	sub	sp, fp, #4
f001df2c:	e8bd8800 	pop	{fp, pc}
f001df30:	f9007000 	.word	0xf9007000

f001df34 <platform_mouse_user_handler>:
f001df34:	e92d4800 	push	{fp, lr}
f001df38:	e28db004 	add	fp, sp, #4
f001df3c:	e24dd008 	sub	sp, sp, #8
f001df40:	e50b0008 	str	r0, [fp, #-8]
f001df44:	e59f001c 	ldr	r0, [pc, #28]	; f001df68 <platform_mouse_user_handler+0x34>
f001df48:	e3a01010 	mov	r1, #16
f001df4c:	ebffffc3 	bl	f001de60 <clrbit>
f001df50:	e51b0008 	ldr	r0, [fp, #-8]
f001df54:	ebfffb37 	bl	f001cc38 <irq_thread_notify>
f001df58:	e3a03000 	mov	r3, #0
f001df5c:	e1a00003 	mov	r0, r3
f001df60:	e24bd004 	sub	sp, fp, #4
f001df64:	e8bd8800 	pop	{fp, pc}
f001df68:	f9008000 	.word	0xf9008000

f001df6c <__aeabi_uidiv>:
f001df6c:	e2512001 	subs	r2, r1, #1
f001df70:	012fff1e 	bxeq	lr
f001df74:	3a000036 	bcc	f001e054 <__aeabi_uidiv+0xe8>
f001df78:	e1500001 	cmp	r0, r1
f001df7c:	9a000022 	bls	f001e00c <__aeabi_uidiv+0xa0>
f001df80:	e1110002 	tst	r1, r2
f001df84:	0a000023 	beq	f001e018 <__aeabi_uidiv+0xac>
f001df88:	e311020e 	tst	r1, #-536870912	; 0xe0000000
f001df8c:	01a01181 	lsleq	r1, r1, #3
f001df90:	03a03008 	moveq	r3, #8
f001df94:	13a03001 	movne	r3, #1
f001df98:	e3510201 	cmp	r1, #268435456	; 0x10000000
f001df9c:	31510000 	cmpcc	r1, r0
f001dfa0:	31a01201 	lslcc	r1, r1, #4
f001dfa4:	31a03203 	lslcc	r3, r3, #4
f001dfa8:	3afffffa 	bcc	f001df98 <__aeabi_uidiv+0x2c>
f001dfac:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
f001dfb0:	31510000 	cmpcc	r1, r0
f001dfb4:	31a01081 	lslcc	r1, r1, #1
f001dfb8:	31a03083 	lslcc	r3, r3, #1
f001dfbc:	3afffffa 	bcc	f001dfac <__aeabi_uidiv+0x40>
f001dfc0:	e3a02000 	mov	r2, #0
f001dfc4:	e1500001 	cmp	r0, r1
f001dfc8:	20400001 	subcs	r0, r0, r1
f001dfcc:	21822003 	orrcs	r2, r2, r3
f001dfd0:	e15000a1 	cmp	r0, r1, lsr #1
f001dfd4:	204000a1 	subcs	r0, r0, r1, lsr #1
f001dfd8:	218220a3 	orrcs	r2, r2, r3, lsr #1
f001dfdc:	e1500121 	cmp	r0, r1, lsr #2
f001dfe0:	20400121 	subcs	r0, r0, r1, lsr #2
f001dfe4:	21822123 	orrcs	r2, r2, r3, lsr #2
f001dfe8:	e15001a1 	cmp	r0, r1, lsr #3
f001dfec:	204001a1 	subcs	r0, r0, r1, lsr #3
f001dff0:	218221a3 	orrcs	r2, r2, r3, lsr #3
f001dff4:	e3500000 	cmp	r0, #0
f001dff8:	11b03223 	lsrsne	r3, r3, #4
f001dffc:	11a01221 	lsrne	r1, r1, #4
f001e000:	1affffef 	bne	f001dfc4 <__aeabi_uidiv+0x58>
f001e004:	e1a00002 	mov	r0, r2
f001e008:	e12fff1e 	bx	lr
f001e00c:	03a00001 	moveq	r0, #1
f001e010:	13a00000 	movne	r0, #0
f001e014:	e12fff1e 	bx	lr
f001e018:	e3510801 	cmp	r1, #65536	; 0x10000
f001e01c:	21a01821 	lsrcs	r1, r1, #16
f001e020:	23a02010 	movcs	r2, #16
f001e024:	33a02000 	movcc	r2, #0
f001e028:	e3510c01 	cmp	r1, #256	; 0x100
f001e02c:	21a01421 	lsrcs	r1, r1, #8
f001e030:	22822008 	addcs	r2, r2, #8
f001e034:	e3510010 	cmp	r1, #16
f001e038:	21a01221 	lsrcs	r1, r1, #4
f001e03c:	22822004 	addcs	r2, r2, #4
f001e040:	e3510004 	cmp	r1, #4
f001e044:	82822003 	addhi	r2, r2, #3
f001e048:	908220a1 	addls	r2, r2, r1, lsr #1
f001e04c:	e1a00230 	lsr	r0, r0, r2
f001e050:	e12fff1e 	bx	lr
f001e054:	e3500000 	cmp	r0, #0
f001e058:	13e00000 	mvnne	r0, #0
f001e05c:	ea000059 	b	f001e1c8 <__aeabi_idiv0>

f001e060 <__aeabi_uidivmod>:
f001e060:	e3510000 	cmp	r1, #0
f001e064:	0afffffa 	beq	f001e054 <__aeabi_uidiv+0xe8>
f001e068:	e92d4003 	push	{r0, r1, lr}
f001e06c:	ebffffbe 	bl	f001df6c <__aeabi_uidiv>
f001e070:	e8bd4006 	pop	{r1, r2, lr}
f001e074:	e0030092 	mul	r3, r2, r0
f001e078:	e0411003 	sub	r1, r1, r3
f001e07c:	e12fff1e 	bx	lr

f001e080 <__aeabi_idiv>:
f001e080:	e3510000 	cmp	r1, #0
f001e084:	0a000043 	beq	f001e198 <.divsi3_skip_div0_test+0x110>

f001e088 <.divsi3_skip_div0_test>:
f001e088:	e020c001 	eor	ip, r0, r1
f001e08c:	42611000 	rsbmi	r1, r1, #0
f001e090:	e2512001 	subs	r2, r1, #1
f001e094:	0a000027 	beq	f001e138 <.divsi3_skip_div0_test+0xb0>
f001e098:	e1b03000 	movs	r3, r0
f001e09c:	42603000 	rsbmi	r3, r0, #0
f001e0a0:	e1530001 	cmp	r3, r1
f001e0a4:	9a000026 	bls	f001e144 <.divsi3_skip_div0_test+0xbc>
f001e0a8:	e1110002 	tst	r1, r2
f001e0ac:	0a000028 	beq	f001e154 <.divsi3_skip_div0_test+0xcc>
f001e0b0:	e311020e 	tst	r1, #-536870912	; 0xe0000000
f001e0b4:	01a01181 	lsleq	r1, r1, #3
f001e0b8:	03a02008 	moveq	r2, #8
f001e0bc:	13a02001 	movne	r2, #1
f001e0c0:	e3510201 	cmp	r1, #268435456	; 0x10000000
f001e0c4:	31510003 	cmpcc	r1, r3
f001e0c8:	31a01201 	lslcc	r1, r1, #4
f001e0cc:	31a02202 	lslcc	r2, r2, #4
f001e0d0:	3afffffa 	bcc	f001e0c0 <.divsi3_skip_div0_test+0x38>
f001e0d4:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
f001e0d8:	31510003 	cmpcc	r1, r3
f001e0dc:	31a01081 	lslcc	r1, r1, #1
f001e0e0:	31a02082 	lslcc	r2, r2, #1
f001e0e4:	3afffffa 	bcc	f001e0d4 <.divsi3_skip_div0_test+0x4c>
f001e0e8:	e3a00000 	mov	r0, #0
f001e0ec:	e1530001 	cmp	r3, r1
f001e0f0:	20433001 	subcs	r3, r3, r1
f001e0f4:	21800002 	orrcs	r0, r0, r2
f001e0f8:	e15300a1 	cmp	r3, r1, lsr #1
f001e0fc:	204330a1 	subcs	r3, r3, r1, lsr #1
f001e100:	218000a2 	orrcs	r0, r0, r2, lsr #1
f001e104:	e1530121 	cmp	r3, r1, lsr #2
f001e108:	20433121 	subcs	r3, r3, r1, lsr #2
f001e10c:	21800122 	orrcs	r0, r0, r2, lsr #2
f001e110:	e15301a1 	cmp	r3, r1, lsr #3
f001e114:	204331a1 	subcs	r3, r3, r1, lsr #3
f001e118:	218001a2 	orrcs	r0, r0, r2, lsr #3
f001e11c:	e3530000 	cmp	r3, #0
f001e120:	11b02222 	lsrsne	r2, r2, #4
f001e124:	11a01221 	lsrne	r1, r1, #4
f001e128:	1affffef 	bne	f001e0ec <.divsi3_skip_div0_test+0x64>
f001e12c:	e35c0000 	cmp	ip, #0
f001e130:	42600000 	rsbmi	r0, r0, #0
f001e134:	e12fff1e 	bx	lr
f001e138:	e13c0000 	teq	ip, r0
f001e13c:	42600000 	rsbmi	r0, r0, #0
f001e140:	e12fff1e 	bx	lr
f001e144:	33a00000 	movcc	r0, #0
f001e148:	01a00fcc 	asreq	r0, ip, #31
f001e14c:	03800001 	orreq	r0, r0, #1
f001e150:	e12fff1e 	bx	lr
f001e154:	e3510801 	cmp	r1, #65536	; 0x10000
f001e158:	21a01821 	lsrcs	r1, r1, #16
f001e15c:	23a02010 	movcs	r2, #16
f001e160:	33a02000 	movcc	r2, #0
f001e164:	e3510c01 	cmp	r1, #256	; 0x100
f001e168:	21a01421 	lsrcs	r1, r1, #8
f001e16c:	22822008 	addcs	r2, r2, #8
f001e170:	e3510010 	cmp	r1, #16
f001e174:	21a01221 	lsrcs	r1, r1, #4
f001e178:	22822004 	addcs	r2, r2, #4
f001e17c:	e3510004 	cmp	r1, #4
f001e180:	82822003 	addhi	r2, r2, #3
f001e184:	908220a1 	addls	r2, r2, r1, lsr #1
f001e188:	e35c0000 	cmp	ip, #0
f001e18c:	e1a00233 	lsr	r0, r3, r2
f001e190:	42600000 	rsbmi	r0, r0, #0
f001e194:	e12fff1e 	bx	lr
f001e198:	e3500000 	cmp	r0, #0
f001e19c:	c3e00102 	mvngt	r0, #-2147483648	; 0x80000000
f001e1a0:	b3a00102 	movlt	r0, #-2147483648	; 0x80000000
f001e1a4:	ea000007 	b	f001e1c8 <__aeabi_idiv0>

f001e1a8 <__aeabi_idivmod>:
f001e1a8:	e3510000 	cmp	r1, #0
f001e1ac:	0afffff9 	beq	f001e198 <.divsi3_skip_div0_test+0x110>
f001e1b0:	e92d4003 	push	{r0, r1, lr}
f001e1b4:	ebffffb3 	bl	f001e088 <.divsi3_skip_div0_test>
f001e1b8:	e8bd4006 	pop	{r1, r2, lr}
f001e1bc:	e0030092 	mul	r3, r2, r0
f001e1c0:	e0411003 	sub	r1, r1, r3
f001e1c4:	e12fff1e 	bx	lr

f001e1c8 <__aeabi_idiv0>:
f001e1c8:	e12fff1e 	bx	lr
