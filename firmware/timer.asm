;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (MINGW64)
;--------------------------------------------------------
	.module timer
	.optsdcc -mhc08
	
	.area HOME    (CODE)
	.area GSINIT0 (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area CSEG    (CODE)
	.area XINIT   (CODE)
	.area CONST   (CODE)
	.area DSEG    (PAG)
	.area OSEG    (PAG, OVR)
	.area XSEG
	.area XISEG
	.area	CODEIVT (ABS)
	.org	0xfffe
	.dw	__sdcc_gs_init_startup

	.area GSINIT0
__sdcc_gs_init_startup:
	ldhx	#0x0100
	txs
	jsr	__sdcc_external_startup
	beq	__sdcc_init_data
	jmp	__sdcc_program_startup
__sdcc_init_data:
; _hc08_genXINIT() start
        ldhx #0
00001$:
        cphx #l_XINIT
        beq  00002$
        lda  s_XINIT,x
        sta  s_XISEG,x
        aix  #1
        bra  00001$
00002$:
; _hc08_genXINIT() end
	.area GSFINAL
	jmp	__sdcc_program_startup

	.area CSEG
__sdcc_program_startup:
	jsr	_main
	bra	.
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _task_led
	.globl _write_time
	.globl _read_time_dial
	.globl _read_ADC_filter
	.globl _read_ADC
	.globl _run_timer
	.globl _minute_clock
	.globl _disable_timer
	.globl _minute_pass
	.globl _x3
	.globl _x2
	.globl _x1
	.globl _set_time
	.globl _save_time
	.globl _PV
	.globl _min
	.globl _sec
	.globl _timer3
	.globl _timer2
	.globl _timer1
	.globl _n
	.globl _count
	.globl _COPCTL
	.globl _OSCTRIMVAL
	.globl _FLBPR
	.globl _LVISR
	.globl _BRKSCR
	.globl _BRK
	.globl _BRKL
	.globl _BRKH
	.globl _FLCR
	.globl _INT3
	.globl _INT2
	.globl _INT1
	.globl _BFCF
	.globl _BRKAR
	.globl _SRSR
	.globl _BSR
	.globl _ADICLK
	.globl _ADR
	.globl _ADSCR
	.globl _OSCTRIM
	.globl _OSCSTAT
	.globl _TCH1
	.globl _TCH1L
	.globl _TCH1H
	.globl _TSC1
	.globl _TCH0
	.globl _TCH0L
	.globl _TCH0H
	.globl _TSC0
	.globl _TMOD
	.globl _TMODL
	.globl _TMODH
	.globl _TCNT
	.globl _TCNTL
	.globl _TCNTH
	.globl _TSC
	.globl _CONFIG1
	.globl _CONFIG2
	.globl _INTSCR
	.globl _KBIER
	.globl _KBSCR
	.globl _PTBPUE
	.globl _PTAPUE
	.globl _DDRB
	.globl _DDRA
	.globl _PTB
	.globl _PTA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DSEG    (PAG)
_PTA	=	0x0000
_PTB	=	0x0001
_DDRA	=	0x0004
_DDRB	=	0x0005
_PTAPUE	=	0x000b
_PTBPUE	=	0x000c
_KBSCR	=	0x001a
_KBIER	=	0x001b
_INTSCR	=	0x001d
_CONFIG2	=	0x001e
_CONFIG1	=	0x001f
_TSC	=	0x0020
_TCNTH	=	0x0021
_TCNTL	=	0x0022
_TCNT	=	0x0021
_TMODH	=	0x0023
_TMODL	=	0x0024
_TMOD	=	0x0023
_TSC0	=	0x0025
_TCH0H	=	0x0026
_TCH0L	=	0x0027
_TCH0	=	0x0026
_TSC1	=	0x0028
_TCH1H	=	0x0029
_TCH1L	=	0x002a
_TCH1	=	0x0029
_OSCSTAT	=	0x0036
_OSCTRIM	=	0x0038
_ADSCR	=	0x003c
_ADR	=	0x003e
_ADICLK	=	0x003f
_read_ADC_filter_sloc0_1_0:
	.ds 2
_read_ADC_filter_sloc1_1_0:
	.ds 4
_read_time_dial_sloc0_1_0:
	.ds 4
_write_time_sloc0_1_0:
	.ds 2
_write_time_sloc1_1_0:
	.ds 2
;--------------------------------------------------------
; overlayable items in ram 
;--------------------------------------------------------
;--------------------------------------------------------
; absolute ram data
;--------------------------------------------------------
	.area IABS    (ABS)
	.area IABS    (ABS)
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS)
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	.area XISEG
;--------------------------------------------------------
; extended address mode data
;--------------------------------------------------------
	.area XSEG
_BSR	=	0xfe00
_SRSR	=	0xfe01
_BRKAR	=	0xfe02
_BFCF	=	0xfe03
_INT1	=	0xfe04
_INT2	=	0xfe05
_INT3	=	0xfe06
_FLCR	=	0xfe08
_BRKH	=	0xfe09
_BRKL	=	0xfe0a
_BRK	=	0xfe09
_BRKSCR	=	0xfe0b
_LVISR	=	0xfe0c
_FLBPR	=	0xffbe
_OSCTRIMVAL	=	0xffc0
_COPCTL	=	0xffff
_count::
	.ds 1
_n::
	.ds 1
_timer1::
	.ds 1
_timer2::
	.ds 2
_timer3::
	.ds 2
_sec::
	.ds 1
_min::
	.ds 2
_PV::
	.ds 2
_save_time::
	.ds 2
_set_time::
	.ds 2
_x1::
	.ds 1
_x2::
	.ds 1
_x3::
	.ds 1
_minute_pass::
	.ds 1
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'disable_timer'
;------------------------------------------------------------
;timer.c:37: void disable_timer()
;	-----------------------------------------
;	 function disable_timer
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_disable_timer:
;timer.c:39: if(set_time <5) PTA &= ~0x8; // off timer
	lda	(_set_time + 1)
	sub	#0x05
	lda	_set_time
	sbc	#0x00
	bcc	00103$
	bclr	#3,*_PTA
00103$:
;timer.c:40: }
	rts
;------------------------------------------------------------
;Allocation info for local variables in function 'minute_clock'
;------------------------------------------------------------
;timer.c:42: void minute_clock(){
;	-----------------------------------------
;	 function minute_clock
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_minute_clock:
;timer.c:43: timer2++;
	ldhx	#_timer2
	inc	1,x
	bne	00110$
	inc	,x
00110$:
;timer.c:44: if (timer2 > minute)
	lda	#0x20
	sub	(_timer2 + 1)
	lda	#0x1c
	sbc	_timer2
	bcc	00103$
;timer.c:45: {timer2 = 0;
	clra
	sta	_timer2
	sta	(_timer2 + 1)
;timer.c:46: minute_pass = 1;
	inca
	sta	_minute_pass
00103$:
;timer.c:48: }
	rts
;------------------------------------------------------------
;Allocation info for local variables in function 'run_timer'
;------------------------------------------------------------
;timer.c:50: void run_timer(){
;	-----------------------------------------
;	 function run_timer
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_run_timer:
;timer.c:52: if (timer3 > 10)
	lda	#0x0a
	sub	(_timer3 + 1)
	clra
	sbc	_timer3
	bcc	00104$
;timer.c:54: PTA |= 0x8; // output high relay
	lda	*_PTA
	ora	#0x08
	sta	*_PTA
;timer.c:55: if (minute_pass == 1)
	lda	_minute_pass
	cmp	#0x01
	bne	00106$
;timer.c:57: minute_pass = 0;
	clra
	sta	_minute_pass
;timer.c:58: timer3--;
	ldhx	#_timer3
	lda	1,x
	sub	#0x01
	sta	1,x
	lda	,x
	sbc	#0
	sta	,x
	rts
00104$:
;timer.c:64: PTA &= ~0x8; // off relay
	bclr	#3,*_PTA
00106$:
;timer.c:67: }
	rts
;------------------------------------------------------------
;Allocation info for local variables in function 'read_ADC'
;------------------------------------------------------------
;timer.c:70: char read_ADC()
;	-----------------------------------------
;	 function read_ADC
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_read_ADC:
;timer.c:72: ADSCR = 0; // read channel 0 one time
	mov	#0x00,*_ADSCR
;timer.c:73: while(!(ADSCR&0x80))
00101$:
	lda	*_ADSCR
	bpl     00101$
;timer.c:75: return ADR;
	lda	*_ADR
;timer.c:76: }
	rts
;------------------------------------------------------------
;Allocation info for local variables in function 'read_ADC_filter'
;------------------------------------------------------------
;sloc0                     Allocated with name '_read_ADC_filter_sloc0_1_0'
;sloc1                     Allocated with name '_read_ADC_filter_sloc1_1_0'
;------------------------------------------------------------
;timer.c:79: long read_ADC_filter(){
;	-----------------------------------------
;	 function read_ADC_filter
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_read_ADC_filter:
;timer.c:80: PV = read_ADC();
	jsr	_read_ADC
;timer.c:81: x3 = x2;
	ldx	_x2
	stx	_x3
;timer.c:82: x2 = x1;
	ldx	_x1
	stx	_x2
;timer.c:83: x1 = PV;
	sta	_x1
;timer.c:84: PV = (x1+x2+x3)/3;
	sta	*(_read_ADC_filter_sloc0_1_0 + 1)
	mov	#0x00,*_read_ADC_filter_sloc0_1_0
	lda	_x2
	clrx
	add	*(_read_ADC_filter_sloc0_1_0 + 1)
	sta	*(_read_ADC_filter_sloc0_1_0 + 1)
	txa
	adc	*_read_ADC_filter_sloc0_1_0
	sta	*_read_ADC_filter_sloc0_1_0
	lda	_x3
	add	*(_read_ADC_filter_sloc0_1_0 + 1)
	psha
	txa
	adc	*_read_ADC_filter_sloc0_1_0
	tax
	clra
	sta	__divsint_PARM_2
	lda	#0x03
	sta	(__divsint_PARM_2 + 1)
	pula
	jsr	__divsint
	sta	(_PV + 1)
	stx	_PV
;timer.c:85: return PV;
	lda	(_PV + 1)
	sta	*(_read_ADC_filter_sloc1_1_0 + 3)
	lda	_PV
	sta	*(_read_ADC_filter_sloc1_1_0 + 2)
	mov	#0x00,*(_read_ADC_filter_sloc1_1_0 + 1)
	mov	#0x00,*_read_ADC_filter_sloc1_1_0
	mov	*_read_ADC_filter_sloc1_1_0,*___SDCC_hc08_ret3
	mov	*(_read_ADC_filter_sloc1_1_0 + 1),*___SDCC_hc08_ret2
	ldx	*(_read_ADC_filter_sloc1_1_0 + 2)
	lda	*(_read_ADC_filter_sloc1_1_0 + 3)
;timer.c:86: }		 					 
	rts
;------------------------------------------------------------
;Allocation info for local variables in function 'read_time_dial'
;------------------------------------------------------------
;sloc0                     Allocated with name '_read_time_dial_sloc0_1_0'
;k                         Allocated with name '_read_time_dial_k_65536_10'
;------------------------------------------------------------
;timer.c:88: int read_time_dial(){ // from 0min to 300mins (0 to 5Hrs)
;	-----------------------------------------
;	 function read_time_dial
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_read_time_dial:
;timer.c:90: k = read_ADC_filter()*300/255;
	jsr	_read_ADC_filter
	sta	(__mullong_PARM_2 + 3)
	stx	(__mullong_PARM_2 + 2)
	lda	*___SDCC_hc08_ret2
	sta	(__mullong_PARM_2 + 1)
	lda	*___SDCC_hc08_ret3
	sta	__mullong_PARM_2
	ldhx	#__mullong_PARM_1
	clra
	sta	,x
	sta	1,x
	inca
	sta	2,x
	lda	#0x2c
	sta	3,x
	jsr	__mullong
	sta	(__divslong_PARM_1 + 3)
	stx	(__divslong_PARM_1 + 2)
	lda	*___SDCC_hc08_ret2
	sta	(__divslong_PARM_1 + 1)
	lda	*___SDCC_hc08_ret3
	sta	__divslong_PARM_1
	ldhx	#__divslong_PARM_2
	clra
	sta	,x
	sta	1,x
	sta	2,x
	deca
	sta	3,x
;timer.c:91: return k;
	jsr	__divslong
	sta	*(_read_time_dial_sloc0_1_0 + 3)
	stx	*(_read_time_dial_sloc0_1_0 + 2)
	mov	*___SDCC_hc08_ret2,*(_read_time_dial_sloc0_1_0 + 1)
	mov	*___SDCC_hc08_ret3,*_read_time_dial_sloc0_1_0
	lda	*(_read_time_dial_sloc0_1_0 + 3)
	ldx	*(_read_time_dial_sloc0_1_0 + 2)
;timer.c:93: }
	rts
;------------------------------------------------------------
;Allocation info for local variables in function 'write_time'
;------------------------------------------------------------
;sloc0                     Allocated with name '_write_time_sloc0_1_0'
;sloc1                     Allocated with name '_write_time_sloc1_1_0'
;------------------------------------------------------------
;timer.c:96: void write_time(){
;	-----------------------------------------
;	 function write_time
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_write_time:
;timer.c:97: set_time = read_time_dial();
	jsr	_read_time_dial
	sta	*(_write_time_sloc0_1_0 + 1)
	stx	*_write_time_sloc0_1_0
	lda	*_write_time_sloc0_1_0
	sta	_set_time
	lda	*(_write_time_sloc0_1_0 + 1)
	sta	(_set_time + 1)
;timer.c:98: if(save_time<(set_time-10)||save_time>(set_time+10))
	ldhx	*_write_time_sloc0_1_0
	aix	#-10
	sthx	*_write_time_sloc1_1_0
	lda	(_save_time + 1)
	sub	*(_write_time_sloc1_1_0 + 1)
	lda	_save_time
	sbc	*_write_time_sloc1_1_0
	bcs	00101$
	ldhx	*_write_time_sloc0_1_0
	aix	#10
	txa
	sub	(_save_time + 1)
	pshh
	pula
	sbc	_save_time
	bcc	00104$
00101$:
;timer.c:99: {save_time = set_time;
	ldx	*_write_time_sloc0_1_0
	lda	*(_write_time_sloc0_1_0 + 1)
	stx	_save_time
	sta	(_save_time + 1)
;timer.c:100: timer3 = save_time; // reload new set time to timer3
	stx	_timer3
	sta	(_timer3 + 1)
;timer.c:101: timer2 = 0; // reset minute clock
	clra
	sta	_timer2
	sta	(_timer2 + 1)
00104$:
;timer.c:103: }
	rts
;------------------------------------------------------------
;Allocation info for local variables in function 'task_led'
;------------------------------------------------------------
;timer.c:105: void task_led()
;	-----------------------------------------
;	 function task_led
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_task_led:
;timer.c:107: if(++timer1>50)
	ldhx	#_timer1
	inc	,x
	lda	_timer1
	cmp	#0x32
	bls	00103$
;timer.c:109: timer1 = 0;
	clra
	sta	_timer1
;timer.c:110: PTA ^= 0x2; // toggle PA1
	lda	*_PTA
	clrx
	eor	#0x02
	psha
	txa
	eor	#0x00
	tax
	pula
	sta	*_PTA
00103$:
;timer.c:112: }	 
	rts
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;timer.c:114: void main()
;	-----------------------------------------
;	 function main
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_main:
;timer.c:117: OSCTRIM = 0x81; // trim internal oscillator, SDCC 08, Motorola defined name
	mov	#0x81,*_OSCTRIM
;timer.c:119: count = n = 0;
	clra
	sta	_n
	sta	_count
;timer.c:120: TMODH = 0x01;
	mov	#0x01,*_TMODH
;timer.c:121: TMODL = 0xf4;
	mov	#0xf4,*_TMODL
;timer.c:122: TSC = 0x46; // run timer 
	mov	#0x46,*_TSC
;timer.c:125: DDRA = 0xfe; // PA0 is ADC input, avoid warning of overflow by SDCC
	mov	#0xfe,*_DDRA
;timer.c:127: DDRB = 0xff;
	mov	#0xff,*_DDRB
;timer.c:128: PTAPUE = ~0x81; // osc2 pin is PTA4 I/O 
	mov	#0x7e,*_PTAPUE
;timer.c:131: ADICLK = 0x40; // ADC Input Clock Register = fbus/4, SDCC 08, Motorola defined name
	mov	#0x40,*_ADICLK
;timer.c:135: while(!(TSC&0x80))
00101$:
	lda	*_TSC
	bpl     00101$
;timer.c:137: TSC &= ~0x80; // clear TOF
	bclr	#7,*_TSC
;timer.c:139: task_led();
	jsr	_task_led
;timer.c:140: write_time(); 
	jsr	_write_time
;timer.c:141: minute_clock();
	jsr	_minute_clock
;timer.c:142: disable_timer();
	jsr	_disable_timer
;timer.c:143: run_timer();
	jsr	_run_timer
;timer.c:144: COPCTL = 0; // clear COP 	 
	clra
	sta	_COPCTL
	bra	00101$
;timer.c:146: }	  
	rts
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
