
test.o:     file format elf32-littleriscv


Disassembly of section .text:

00010094 <exit>:
   10094:	ff010113          	addi	sp,sp,-16
   10098:	00000593          	li	a1,0
   1009c:	00812423          	sw	s0,8(sp)
   100a0:	00112623          	sw	ra,12(sp)
   100a4:	00050413          	mv	s0,a0
   100a8:	2c8000ef          	jal	ra,10370 <__call_exitprocs>
   100ac:	c281a503          	lw	a0,-984(gp) # 11a08 <_global_impure_ptr>
   100b0:	03c52783          	lw	a5,60(a0)
   100b4:	00078463          	beqz	a5,100bc <exit+0x28>
   100b8:	000780e7          	jalr	a5
   100bc:	00040513          	mv	a0,s0
   100c0:	4d8000ef          	jal	ra,10598 <_exit>

000100c4 <register_fini>:
   100c4:	00000793          	li	a5,0
   100c8:	00078863          	beqz	a5,100d8 <register_fini+0x14>
   100cc:	00010537          	lui	a0,0x10
   100d0:	49050513          	addi	a0,a0,1168 # 10490 <__libc_fini_array>
   100d4:	4180006f          	j	104ec <atexit>
   100d8:	00008067          	ret

000100dc <_start>:
   100dc:	00002197          	auipc	gp,0x2
   100e0:	d0418193          	addi	gp,gp,-764 # 11de0 <__global_pointer$>
   100e4:	c3418513          	addi	a0,gp,-972 # 11a14 <completed.1>
   100e8:	c5018613          	addi	a2,gp,-944 # 11a30 <__BSS_END__>
   100ec:	40a60633          	sub	a2,a2,a0
   100f0:	00000593          	li	a1,0
   100f4:	1a0000ef          	jal	ra,10294 <memset>
   100f8:	00000517          	auipc	a0,0x0
   100fc:	3f450513          	addi	a0,a0,1012 # 104ec <atexit>
   10100:	00050863          	beqz	a0,10110 <_start+0x34>
   10104:	00000517          	auipc	a0,0x0
   10108:	38c50513          	addi	a0,a0,908 # 10490 <__libc_fini_array>
   1010c:	3e0000ef          	jal	ra,104ec <atexit>
   10110:	0e8000ef          	jal	ra,101f8 <__libc_init_array>
   10114:	00012503          	lw	a0,0(sp)
   10118:	00410593          	addi	a1,sp,4
   1011c:	00000613          	li	a2,0
   10120:	06c000ef          	jal	ra,1018c <main>
   10124:	f71ff06f          	j	10094 <exit>

00010128 <__do_global_dtors_aux>:
   10128:	ff010113          	addi	sp,sp,-16
   1012c:	00812423          	sw	s0,8(sp)
   10130:	c341c783          	lbu	a5,-972(gp) # 11a14 <completed.1>
   10134:	00112623          	sw	ra,12(sp)
   10138:	02079263          	bnez	a5,1015c <__do_global_dtors_aux+0x34>
   1013c:	00000793          	li	a5,0
   10140:	00078a63          	beqz	a5,10154 <__do_global_dtors_aux+0x2c>
   10144:	00011537          	lui	a0,0x11
   10148:	5d050513          	addi	a0,a0,1488 # 115d0 <__FRAME_END__>
   1014c:	00000097          	auipc	ra,0x0
   10150:	000000e7          	jalr	zero # 0 <exit-0x10094>
   10154:	00100793          	li	a5,1
   10158:	c2f18a23          	sb	a5,-972(gp) # 11a14 <completed.1>
   1015c:	00c12083          	lw	ra,12(sp)
   10160:	00812403          	lw	s0,8(sp)
   10164:	01010113          	addi	sp,sp,16
   10168:	00008067          	ret

0001016c <frame_dummy>:
   1016c:	00000793          	li	a5,0
   10170:	00078c63          	beqz	a5,10188 <frame_dummy+0x1c>
   10174:	00011537          	lui	a0,0x11
   10178:	c3818593          	addi	a1,gp,-968 # 11a18 <object.0>
   1017c:	5d050513          	addi	a0,a0,1488 # 115d0 <__FRAME_END__>
   10180:	00000317          	auipc	t1,0x0
   10184:	00000067          	jr	zero # 0 <exit-0x10094>
   10188:	00008067          	ret

0001018c <main>:
   1018c:	fe010113          	addi	sp,sp,-32
   10190:	00812e23          	sw	s0,28(sp)
   10194:	02010413          	addi	s0,sp,32
   10198:	fe042623          	sw	zero,-20(s0)
   1019c:	00100793          	li	a5,1
   101a0:	fef42423          	sw	a5,-24(s0)
   101a4:	fe042223          	sw	zero,-28(s0)
   101a8:	0300006f          	j	101d8 <main+0x4c>
   101ac:	fec42703          	lw	a4,-20(s0)
   101b0:	fe842783          	lw	a5,-24(s0)
   101b4:	00f707b3          	add	a5,a4,a5
   101b8:	fef42023          	sw	a5,-32(s0)
   101bc:	fe842783          	lw	a5,-24(s0)
   101c0:	fef42623          	sw	a5,-20(s0)
   101c4:	fe042783          	lw	a5,-32(s0)
   101c8:	fef42423          	sw	a5,-24(s0)
   101cc:	fe442783          	lw	a5,-28(s0)
   101d0:	00178793          	addi	a5,a5,1
   101d4:	fef42223          	sw	a5,-28(s0)
   101d8:	fe442703          	lw	a4,-28(s0)
   101dc:	00a00793          	li	a5,10
   101e0:	fce7d6e3          	bge	a5,a4,101ac <main+0x20>
   101e4:	00000013          	nop
   101e8:	00000013          	nop
   101ec:	01c12403          	lw	s0,28(sp)
   101f0:	02010113          	addi	sp,sp,32
   101f4:	00008067          	ret

000101f8 <__libc_init_array>:
   101f8:	ff010113          	addi	sp,sp,-16
   101fc:	00812423          	sw	s0,8(sp)
   10200:	000117b7          	lui	a5,0x11
   10204:	00011437          	lui	s0,0x11
   10208:	01212023          	sw	s2,0(sp)
   1020c:	5d478793          	addi	a5,a5,1492 # 115d4 <__init_array_start>
   10210:	5d440713          	addi	a4,s0,1492 # 115d4 <__init_array_start>
   10214:	00112623          	sw	ra,12(sp)
   10218:	00912223          	sw	s1,4(sp)
   1021c:	40e78933          	sub	s2,a5,a4
   10220:	02e78263          	beq	a5,a4,10244 <__libc_init_array+0x4c>
   10224:	40295913          	srai	s2,s2,0x2
   10228:	5d440413          	addi	s0,s0,1492
   1022c:	00000493          	li	s1,0
   10230:	00042783          	lw	a5,0(s0)
   10234:	00148493          	addi	s1,s1,1
   10238:	00440413          	addi	s0,s0,4
   1023c:	000780e7          	jalr	a5
   10240:	ff24e8e3          	bltu	s1,s2,10230 <__libc_init_array+0x38>
   10244:	00011437          	lui	s0,0x11
   10248:	000117b7          	lui	a5,0x11
   1024c:	5dc78793          	addi	a5,a5,1500 # 115dc <__do_global_dtors_aux_fini_array_entry>
   10250:	5d440713          	addi	a4,s0,1492 # 115d4 <__init_array_start>
   10254:	40e78933          	sub	s2,a5,a4
   10258:	40295913          	srai	s2,s2,0x2
   1025c:	02e78063          	beq	a5,a4,1027c <__libc_init_array+0x84>
   10260:	5d440413          	addi	s0,s0,1492
   10264:	00000493          	li	s1,0
   10268:	00042783          	lw	a5,0(s0)
   1026c:	00148493          	addi	s1,s1,1
   10270:	00440413          	addi	s0,s0,4
   10274:	000780e7          	jalr	a5
   10278:	ff24e8e3          	bltu	s1,s2,10268 <__libc_init_array+0x70>
   1027c:	00c12083          	lw	ra,12(sp)
   10280:	00812403          	lw	s0,8(sp)
   10284:	00412483          	lw	s1,4(sp)
   10288:	00012903          	lw	s2,0(sp)
   1028c:	01010113          	addi	sp,sp,16
   10290:	00008067          	ret

00010294 <memset>:
   10294:	00f00313          	li	t1,15
   10298:	00050713          	mv	a4,a0
   1029c:	02c37e63          	bgeu	t1,a2,102d8 <memset+0x44>
   102a0:	00f77793          	andi	a5,a4,15
   102a4:	0a079063          	bnez	a5,10344 <memset+0xb0>
   102a8:	08059263          	bnez	a1,1032c <memset+0x98>
   102ac:	ff067693          	andi	a3,a2,-16
   102b0:	00f67613          	andi	a2,a2,15
   102b4:	00e686b3          	add	a3,a3,a4
   102b8:	00b72023          	sw	a1,0(a4)
   102bc:	00b72223          	sw	a1,4(a4)
   102c0:	00b72423          	sw	a1,8(a4)
   102c4:	00b72623          	sw	a1,12(a4)
   102c8:	01070713          	addi	a4,a4,16
   102cc:	fed766e3          	bltu	a4,a3,102b8 <memset+0x24>
   102d0:	00061463          	bnez	a2,102d8 <memset+0x44>
   102d4:	00008067          	ret
   102d8:	40c306b3          	sub	a3,t1,a2
   102dc:	00269693          	slli	a3,a3,0x2
   102e0:	00000297          	auipc	t0,0x0
   102e4:	005686b3          	add	a3,a3,t0
   102e8:	00c68067          	jr	12(a3)
   102ec:	00b70723          	sb	a1,14(a4)
   102f0:	00b706a3          	sb	a1,13(a4)
   102f4:	00b70623          	sb	a1,12(a4)
   102f8:	00b705a3          	sb	a1,11(a4)
   102fc:	00b70523          	sb	a1,10(a4)
   10300:	00b704a3          	sb	a1,9(a4)
   10304:	00b70423          	sb	a1,8(a4)
   10308:	00b703a3          	sb	a1,7(a4)
   1030c:	00b70323          	sb	a1,6(a4)
   10310:	00b702a3          	sb	a1,5(a4)
   10314:	00b70223          	sb	a1,4(a4)
   10318:	00b701a3          	sb	a1,3(a4)
   1031c:	00b70123          	sb	a1,2(a4)
   10320:	00b700a3          	sb	a1,1(a4)
   10324:	00b70023          	sb	a1,0(a4)
   10328:	00008067          	ret
   1032c:	0ff5f593          	zext.b	a1,a1
   10330:	00859693          	slli	a3,a1,0x8
   10334:	00d5e5b3          	or	a1,a1,a3
   10338:	01059693          	slli	a3,a1,0x10
   1033c:	00d5e5b3          	or	a1,a1,a3
   10340:	f6dff06f          	j	102ac <memset+0x18>
   10344:	00279693          	slli	a3,a5,0x2
   10348:	00000297          	auipc	t0,0x0
   1034c:	005686b3          	add	a3,a3,t0
   10350:	00008293          	mv	t0,ra
   10354:	fa0680e7          	jalr	-96(a3)
   10358:	00028093          	mv	ra,t0
   1035c:	ff078793          	addi	a5,a5,-16
   10360:	40f70733          	sub	a4,a4,a5
   10364:	00f60633          	add	a2,a2,a5
   10368:	f6c378e3          	bgeu	t1,a2,102d8 <memset+0x44>
   1036c:	f3dff06f          	j	102a8 <memset+0x14>

00010370 <__call_exitprocs>:
   10370:	fd010113          	addi	sp,sp,-48
   10374:	01412c23          	sw	s4,24(sp)
   10378:	c281aa03          	lw	s4,-984(gp) # 11a08 <_global_impure_ptr>
   1037c:	03212023          	sw	s2,32(sp)
   10380:	02112623          	sw	ra,44(sp)
   10384:	148a2903          	lw	s2,328(s4)
   10388:	02812423          	sw	s0,40(sp)
   1038c:	02912223          	sw	s1,36(sp)
   10390:	01312e23          	sw	s3,28(sp)
   10394:	01512a23          	sw	s5,20(sp)
   10398:	01612823          	sw	s6,16(sp)
   1039c:	01712623          	sw	s7,12(sp)
   103a0:	01812423          	sw	s8,8(sp)
   103a4:	04090063          	beqz	s2,103e4 <__call_exitprocs+0x74>
   103a8:	00050b13          	mv	s6,a0
   103ac:	00058b93          	mv	s7,a1
   103b0:	00100a93          	li	s5,1
   103b4:	fff00993          	li	s3,-1
   103b8:	00492483          	lw	s1,4(s2)
   103bc:	fff48413          	addi	s0,s1,-1
   103c0:	02044263          	bltz	s0,103e4 <__call_exitprocs+0x74>
   103c4:	00249493          	slli	s1,s1,0x2
   103c8:	009904b3          	add	s1,s2,s1
   103cc:	040b8463          	beqz	s7,10414 <__call_exitprocs+0xa4>
   103d0:	1044a783          	lw	a5,260(s1)
   103d4:	05778063          	beq	a5,s7,10414 <__call_exitprocs+0xa4>
   103d8:	fff40413          	addi	s0,s0,-1
   103dc:	ffc48493          	addi	s1,s1,-4
   103e0:	ff3416e3          	bne	s0,s3,103cc <__call_exitprocs+0x5c>
   103e4:	02c12083          	lw	ra,44(sp)
   103e8:	02812403          	lw	s0,40(sp)
   103ec:	02412483          	lw	s1,36(sp)
   103f0:	02012903          	lw	s2,32(sp)
   103f4:	01c12983          	lw	s3,28(sp)
   103f8:	01812a03          	lw	s4,24(sp)
   103fc:	01412a83          	lw	s5,20(sp)
   10400:	01012b03          	lw	s6,16(sp)
   10404:	00c12b83          	lw	s7,12(sp)
   10408:	00812c03          	lw	s8,8(sp)
   1040c:	03010113          	addi	sp,sp,48
   10410:	00008067          	ret
   10414:	00492783          	lw	a5,4(s2)
   10418:	0044a683          	lw	a3,4(s1)
   1041c:	fff78793          	addi	a5,a5,-1
   10420:	04878e63          	beq	a5,s0,1047c <__call_exitprocs+0x10c>
   10424:	0004a223          	sw	zero,4(s1)
   10428:	fa0688e3          	beqz	a3,103d8 <__call_exitprocs+0x68>
   1042c:	18892783          	lw	a5,392(s2)
   10430:	008a9733          	sll	a4,s5,s0
   10434:	00492c03          	lw	s8,4(s2)
   10438:	00f777b3          	and	a5,a4,a5
   1043c:	02079263          	bnez	a5,10460 <__call_exitprocs+0xf0>
   10440:	000680e7          	jalr	a3
   10444:	00492703          	lw	a4,4(s2)
   10448:	148a2783          	lw	a5,328(s4)
   1044c:	01871463          	bne	a4,s8,10454 <__call_exitprocs+0xe4>
   10450:	f92784e3          	beq	a5,s2,103d8 <__call_exitprocs+0x68>
   10454:	f80788e3          	beqz	a5,103e4 <__call_exitprocs+0x74>
   10458:	00078913          	mv	s2,a5
   1045c:	f5dff06f          	j	103b8 <__call_exitprocs+0x48>
   10460:	18c92783          	lw	a5,396(s2)
   10464:	0844a583          	lw	a1,132(s1)
   10468:	00f77733          	and	a4,a4,a5
   1046c:	00071c63          	bnez	a4,10484 <__call_exitprocs+0x114>
   10470:	000b0513          	mv	a0,s6
   10474:	000680e7          	jalr	a3
   10478:	fcdff06f          	j	10444 <__call_exitprocs+0xd4>
   1047c:	00892223          	sw	s0,4(s2)
   10480:	fa9ff06f          	j	10428 <__call_exitprocs+0xb8>
   10484:	00058513          	mv	a0,a1
   10488:	000680e7          	jalr	a3
   1048c:	fb9ff06f          	j	10444 <__call_exitprocs+0xd4>

00010490 <__libc_fini_array>:
   10490:	ff010113          	addi	sp,sp,-16
   10494:	00812423          	sw	s0,8(sp)
   10498:	000117b7          	lui	a5,0x11
   1049c:	00011437          	lui	s0,0x11
   104a0:	5dc78793          	addi	a5,a5,1500 # 115dc <__do_global_dtors_aux_fini_array_entry>
   104a4:	5e040413          	addi	s0,s0,1504 # 115e0 <impure_data>
   104a8:	40f40433          	sub	s0,s0,a5
   104ac:	00912223          	sw	s1,4(sp)
   104b0:	00112623          	sw	ra,12(sp)
   104b4:	40245493          	srai	s1,s0,0x2
   104b8:	02048063          	beqz	s1,104d8 <__libc_fini_array+0x48>
   104bc:	ffc40413          	addi	s0,s0,-4
   104c0:	00f40433          	add	s0,s0,a5
   104c4:	00042783          	lw	a5,0(s0)
   104c8:	fff48493          	addi	s1,s1,-1
   104cc:	ffc40413          	addi	s0,s0,-4
   104d0:	000780e7          	jalr	a5
   104d4:	fe0498e3          	bnez	s1,104c4 <__libc_fini_array+0x34>
   104d8:	00c12083          	lw	ra,12(sp)
   104dc:	00812403          	lw	s0,8(sp)
   104e0:	00412483          	lw	s1,4(sp)
   104e4:	01010113          	addi	sp,sp,16
   104e8:	00008067          	ret

000104ec <atexit>:
   104ec:	00050593          	mv	a1,a0
   104f0:	00000693          	li	a3,0
   104f4:	00000613          	li	a2,0
   104f8:	00000513          	li	a0,0
   104fc:	0040006f          	j	10500 <__register_exitproc>

00010500 <__register_exitproc>:
   10500:	c281a703          	lw	a4,-984(gp) # 11a08 <_global_impure_ptr>
   10504:	14872783          	lw	a5,328(a4)
   10508:	04078c63          	beqz	a5,10560 <__register_exitproc+0x60>
   1050c:	0047a703          	lw	a4,4(a5)
   10510:	01f00813          	li	a6,31
   10514:	06e84e63          	blt	a6,a4,10590 <__register_exitproc+0x90>
   10518:	00271813          	slli	a6,a4,0x2
   1051c:	02050663          	beqz	a0,10548 <__register_exitproc+0x48>
   10520:	01078333          	add	t1,a5,a6
   10524:	08c32423          	sw	a2,136(t1) # 10208 <__libc_init_array+0x10>
   10528:	1887a883          	lw	a7,392(a5)
   1052c:	00100613          	li	a2,1
   10530:	00e61633          	sll	a2,a2,a4
   10534:	00c8e8b3          	or	a7,a7,a2
   10538:	1917a423          	sw	a7,392(a5)
   1053c:	10d32423          	sw	a3,264(t1)
   10540:	00200693          	li	a3,2
   10544:	02d50463          	beq	a0,a3,1056c <__register_exitproc+0x6c>
   10548:	00170713          	addi	a4,a4,1
   1054c:	00e7a223          	sw	a4,4(a5)
   10550:	010787b3          	add	a5,a5,a6
   10554:	00b7a423          	sw	a1,8(a5)
   10558:	00000513          	li	a0,0
   1055c:	00008067          	ret
   10560:	14c70793          	addi	a5,a4,332
   10564:	14f72423          	sw	a5,328(a4)
   10568:	fa5ff06f          	j	1050c <__register_exitproc+0xc>
   1056c:	18c7a683          	lw	a3,396(a5)
   10570:	00170713          	addi	a4,a4,1
   10574:	00e7a223          	sw	a4,4(a5)
   10578:	00c6e6b3          	or	a3,a3,a2
   1057c:	18d7a623          	sw	a3,396(a5)
   10580:	010787b3          	add	a5,a5,a6
   10584:	00b7a423          	sw	a1,8(a5)
   10588:	00000513          	li	a0,0
   1058c:	00008067          	ret
   10590:	fff00513          	li	a0,-1
   10594:	00008067          	ret

00010598 <_exit>:
   10598:	05d00893          	li	a7,93
   1059c:	00000073          	ecall
   105a0:	00054463          	bltz	a0,105a8 <_exit+0x10>
   105a4:	0000006f          	j	105a4 <_exit+0xc>
   105a8:	ff010113          	addi	sp,sp,-16
   105ac:	00812423          	sw	s0,8(sp)
   105b0:	00050413          	mv	s0,a0
   105b4:	00112623          	sw	ra,12(sp)
   105b8:	40800433          	neg	s0,s0
   105bc:	00c000ef          	jal	ra,105c8 <__errno>
   105c0:	00852023          	sw	s0,0(a0)
   105c4:	0000006f          	j	105c4 <_exit+0x2c>

000105c8 <__errno>:
   105c8:	c301a503          	lw	a0,-976(gp) # 11a10 <_impure_ptr>
   105cc:	00008067          	ret
