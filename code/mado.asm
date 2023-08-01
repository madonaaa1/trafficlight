
_counter:

;mado.c,9 :: 		void counter(signed char count){
;mado.c,10 :: 		int left=count/10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       FARG_counter_count+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_S+0
	MOVF       R0+0, 0
	MOVWF      counter_left_L0+0
	MOVLW      0
	BTFSC      counter_left_L0+0, 7
	MOVLW      255
	MOVWF      counter_left_L0+1
;mado.c,11 :: 		int right=count%10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       FARG_counter_count+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      counter_right_L0+0
	MOVLW      0
	BTFSC      counter_right_L0+0, 7
	MOVLW      255
	MOVWF      counter_right_L0+1
;mado.c,12 :: 		LSD=0;//pnp transistor is on
	BCF        PORTE+0, 0
;mado.c,13 :: 		MSD=1; //pnp transistor is off
	BSF        PORTE+0, 1
;mado.c,14 :: 		display=right;
	MOVF       counter_right_L0+0, 0
	MOVWF      PORTC+0
;mado.c,15 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_counter0:
	DECFSZ     R13+0, 1
	GOTO       L_counter0
	DECFSZ     R12+0, 1
	GOTO       L_counter0
	NOP
;mado.c,16 :: 		LSD=1;//pnp transistor is off
	BSF        PORTE+0, 0
;mado.c,17 :: 		MSD=0; //pnp transistor is on
	BCF        PORTE+0, 1
;mado.c,18 :: 		display= Left;
	MOVF       counter_left_L0+0, 0
	MOVWF      PORTC+0
;mado.c,19 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_counter1:
	DECFSZ     R13+0, 1
	GOTO       L_counter1
	DECFSZ     R12+0, 1
	GOTO       L_counter1
	NOP
;mado.c,20 :: 		}
L_end_counter:
	RETURN
; end of _counter

_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;mado.c,22 :: 		void interrupt(){
;mado.c,23 :: 		if(intf_bit==1)
	BTFSS      INTF_bit+0, BitPos(INTF_bit+0)
	GOTO       L_interrupt2
;mado.c,24 :: 		intf_bit=0;
	BCF        INTF_bit+0, BitPos(INTF_bit+0)
L_interrupt2:
;mado.c,25 :: 		j++;
	INCF       _j+0, 1
	BTFSC      STATUS+0, 2
	INCF       _j+1, 1
;mado.c,27 :: 		if(j==1){
	MOVLW      0
	XORWF      _j+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt61
	MOVLW      1
	XORWF      _j+0, 0
L__interrupt61:
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt3
;mado.c,28 :: 		for(count=3;count>=0;count--){
	MOVLW      3
	MOVWF      _count+0
L_interrupt4:
	MOVLW      128
	XORWF      _count+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_interrupt5
;mado.c,33 :: 		portd=0b01010;
	MOVLW      10
	MOVWF      PORTD+0
;mado.c,34 :: 		for(i=0;i<40;i++){
	CLRF       _i+0
L_interrupt7:
	MOVLW      40
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_interrupt8
;mado.c,35 :: 		int left=count/10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _count+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_S+0
	MOVF       R0+0, 0
	MOVWF      interrupt_left_L3+0
	MOVLW      0
	BTFSC      interrupt_left_L3+0, 7
	MOVLW      255
	MOVWF      interrupt_left_L3+1
;mado.c,36 :: 		int right=count%10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _count+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      interrupt_right_L3+0
	MOVLW      0
	BTFSC      interrupt_right_L3+0, 7
	MOVLW      255
	MOVWF      interrupt_right_L3+1
;mado.c,37 :: 		LSD=0;//pnp transistor is on
	BCF        PORTE+0, 0
;mado.c,38 :: 		MSD=1; //pnp transistor is off
	BSF        PORTE+0, 1
;mado.c,39 :: 		display=right;
	MOVF       interrupt_right_L3+0, 0
	MOVWF      PORTC+0
;mado.c,40 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_interrupt10:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt10
	DECFSZ     R12+0, 1
	GOTO       L_interrupt10
	NOP
;mado.c,41 :: 		LSD=1;//pnp transistor is off
	BSF        PORTE+0, 0
;mado.c,42 :: 		MSD=0; //pnp transistor is on
	BCF        PORTE+0, 1
;mado.c,43 :: 		display= Left;
	MOVF       interrupt_left_L3+0, 0
	MOVWF      PORTC+0
;mado.c,44 :: 		delay_ms(10);}
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_interrupt11:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt11
	DECFSZ     R12+0, 1
	GOTO       L_interrupt11
	NOP
;mado.c,34 :: 		for(i=0;i<40;i++){
	INCF       _i+0, 1
;mado.c,44 :: 		delay_ms(10);}
	GOTO       L_interrupt7
L_interrupt8:
;mado.c,28 :: 		for(count=3;count>=0;count--){
	DECF       _count+0, 1
;mado.c,45 :: 		}
	GOTO       L_interrupt4
L_interrupt5:
;mado.c,46 :: 		portD.B1=0;
	BCF        PORTD+0, 1
;mado.c,48 :: 		}
	GOTO       L_interrupt12
L_interrupt3:
;mado.c,50 :: 		else if(j==2){
	MOVLW      0
	XORWF      _j+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt62
	MOVLW      2
	XORWF      _j+0, 0
L__interrupt62:
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt13
;mado.c,51 :: 		portd=0b100001;
	MOVLW      33
	MOVWF      PORTD+0
;mado.c,53 :: 		for(i=0;i<40;i++){
	CLRF       _i+0
L_interrupt14:
	MOVLW      40
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_interrupt15
;mado.c,54 :: 		int left=count/10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _count+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_S+0
	MOVF       R0+0, 0
	MOVWF      interrupt_left_L2+0
	MOVLW      0
	BTFSC      interrupt_left_L2+0, 7
	MOVLW      255
	MOVWF      interrupt_left_L2+1
;mado.c,55 :: 		int right=count%10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _count+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      interrupt_right_L2+0
	MOVLW      0
	BTFSC      interrupt_right_L2+0, 7
	MOVLW      255
	MOVWF      interrupt_right_L2+1
;mado.c,56 :: 		LSD=0;//pnp transistor is on
	BCF        PORTE+0, 0
;mado.c,57 :: 		MSD=1; //pnp transistor is off
	BSF        PORTE+0, 1
;mado.c,58 :: 		display=right;
	MOVF       interrupt_right_L2+0, 0
	MOVWF      PORTC+0
;mado.c,59 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_interrupt17:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt17
	DECFSZ     R12+0, 1
	GOTO       L_interrupt17
	NOP
;mado.c,60 :: 		LSD=1;//pnp transistor is off
	BSF        PORTE+0, 0
;mado.c,61 :: 		MSD=0; //pnp transistor is on
	BCF        PORTE+0, 1
;mado.c,62 :: 		display= Left;
	MOVF       interrupt_left_L2+0, 0
	MOVWF      PORTC+0
;mado.c,63 :: 		delay_ms(10);}
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_interrupt18:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt18
	DECFSZ     R12+0, 1
	GOTO       L_interrupt18
	NOP
;mado.c,53 :: 		for(i=0;i<40;i++){
	INCF       _i+0, 1
;mado.c,63 :: 		delay_ms(10);}
	GOTO       L_interrupt14
L_interrupt15:
;mado.c,64 :: 		portd=0;
	CLRF       PORTD+0
;mado.c,65 :: 		}
	GOTO       L_interrupt19
L_interrupt13:
;mado.c,68 :: 		else if(j==3){
	MOVLW      0
	XORWF      _j+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt63
	MOVLW      3
	XORWF      _j+0, 0
L__interrupt63:
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt20
;mado.c,69 :: 		for(count=3;count>=0;count--){
	MOVLW      3
	MOVWF      _count+0
L_interrupt21:
	MOVLW      128
	XORWF      _count+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_interrupt22
;mado.c,71 :: 		portd=0b010001;
	MOVLW      17
	MOVWF      PORTD+0
;mado.c,72 :: 		for(i=0;i<40;i++){
	CLRF       _i+0
L_interrupt24:
	MOVLW      40
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_interrupt25
;mado.c,73 :: 		int left=count/10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _count+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_S+0
	MOVF       R0+0, 0
	MOVWF      interrupt_left_L3_L3+0
	MOVLW      0
	BTFSC      interrupt_left_L3_L3+0, 7
	MOVLW      255
	MOVWF      interrupt_left_L3_L3+1
;mado.c,74 :: 		int right=count%10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _count+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      interrupt_right_L3_L3+0
	MOVLW      0
	BTFSC      interrupt_right_L3_L3+0, 7
	MOVLW      255
	MOVWF      interrupt_right_L3_L3+1
;mado.c,75 :: 		LSD=0;//pnp transistor is on
	BCF        PORTE+0, 0
;mado.c,76 :: 		MSD=1; //pnp transistor is off
	BSF        PORTE+0, 1
;mado.c,77 :: 		display=right;
	MOVF       interrupt_right_L3_L3+0, 0
	MOVWF      PORTC+0
;mado.c,78 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_interrupt27:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt27
	DECFSZ     R12+0, 1
	GOTO       L_interrupt27
	NOP
;mado.c,79 :: 		LSD=1;//pnp transistor is off
	BSF        PORTE+0, 0
;mado.c,80 :: 		MSD=0; //pnp transistor is on
	BCF        PORTE+0, 1
;mado.c,81 :: 		display= Left;
	MOVF       interrupt_left_L3_L3+0, 0
	MOVWF      PORTC+0
;mado.c,82 :: 		delay_ms(10);}
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_interrupt28:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt28
	DECFSZ     R12+0, 1
	GOTO       L_interrupt28
	NOP
;mado.c,72 :: 		for(i=0;i<40;i++){
	INCF       _i+0, 1
;mado.c,82 :: 		delay_ms(10);}
	GOTO       L_interrupt24
L_interrupt25:
;mado.c,69 :: 		for(count=3;count>=0;count--){
	DECF       _count+0, 1
;mado.c,83 :: 		}
	GOTO       L_interrupt21
L_interrupt22:
;mado.c,84 :: 		j=0;
	CLRF       _j+0
	CLRF       _j+1
;mado.c,85 :: 		}
L_interrupt20:
L_interrupt19:
L_interrupt12:
;mado.c,88 :: 		}
L_end_interrupt:
L__interrupt60:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;mado.c,91 :: 		void main(){
;mado.c,92 :: 		ADCON1=7;
	MOVLW      7
	MOVWF      ADCON1+0
;mado.c,93 :: 		trisb.b1=1;
	BSF        TRISB+0, 1
;mado.c,94 :: 		trisb.b0=1;
	BSF        TRISB+0, 0
;mado.c,95 :: 		gie_bit=1;
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;mado.c,96 :: 		inte_bit=1;
	BSF        INTE_bit+0, BitPos(INTE_bit+0)
;mado.c,97 :: 		intedg_bit=1;//raising edge
	BSF        INTEDG_bit+0, BitPos(INTEDG_bit+0)
;mado.c,98 :: 		portB.B1=1;
	BSF        PORTB+0, 1
;mado.c,99 :: 		trisc=0;portc=0;
	CLRF       TRISC+0
	CLRF       PORTC+0
;mado.c,100 :: 		trisd=0; portd=0;//Red1=D0 YELLOW1=D1 Green1=D2 Red2=D3 YELLOW2=D4 Green2=D5
	CLRF       TRISD+0
	CLRF       PORTD+0
;mado.c,101 :: 		trisE.b0=0;  LSD=1;  //pnp transistor off
	BCF        TRISE+0, 0
	BSF        PORTE+0, 0
;mado.c,102 :: 		trisE.b1=0;  MSD=1;   //pnp transistor off
	BCF        TRISE+0, 1
	BSF        PORTE+0, 1
;mado.c,103 :: 		for(;;){
L_main29:
;mado.c,104 :: 		while(portb.b1==0){
L_main32:
	BTFSC      PORTB+0, 1
	GOTO       L_main33
;mado.c,105 :: 		for(count=23;count>=0;count--){
	MOVLW      23
	MOVWF      _count+0
L_main34:
	MOVLW      128
	XORWF      _count+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_main35
;mado.c,106 :: 		if(SWITCH==1){
	BTFSS      PORTB+0, 1
	GOTO       L_main37
;mado.c,107 :: 		break; }
	GOTO       L_main35
L_main37:
;mado.c,108 :: 		portD.b0=0;
	BCF        PORTD+0, 0
;mado.c,109 :: 		portD.b4=0;
	BCF        PORTD+0, 4
;mado.c,110 :: 		portD.b3=1;
	BSF        PORTD+0, 3
;mado.c,111 :: 		portD.b2=1;
	BSF        PORTD+0, 2
;mado.c,112 :: 		if(count<=3){
	MOVLW      128
	XORLW      3
	MOVWF      R0+0
	MOVLW      128
	XORWF      _count+0, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_main38
;mado.c,114 :: 		portD.b2=0;
	BCF        PORTD+0, 2
;mado.c,115 :: 		portD.b1=1;
	BSF        PORTD+0, 1
;mado.c,116 :: 		for(i=0;i<40;i++)
	CLRF       _i+0
L_main39:
	MOVLW      40
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main40
;mado.c,117 :: 		counter(count) ;
	MOVF       _count+0, 0
	MOVWF      FARG_counter_count+0
	CALL       _counter+0
;mado.c,116 :: 		for(i=0;i<40;i++)
	INCF       _i+0, 1
;mado.c,117 :: 		counter(count) ;
	GOTO       L_main39
L_main40:
;mado.c,118 :: 		}
L_main38:
;mado.c,121 :: 		for(i=0;i<40;i++)
	CLRF       _i+0
L_main42:
	MOVLW      40
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main43
;mado.c,122 :: 		counter(count) ;
	MOVF       _count+0, 0
	MOVWF      FARG_counter_count+0
	CALL       _counter+0
;mado.c,121 :: 		for(i=0;i<40;i++)
	INCF       _i+0, 1
;mado.c,122 :: 		counter(count) ;
	GOTO       L_main42
L_main43:
;mado.c,105 :: 		for(count=23;count>=0;count--){
	DECF       _count+0, 1
;mado.c,123 :: 		}
	GOTO       L_main34
L_main35:
;mado.c,124 :: 		for(count=15;count>=0;count--){
	MOVLW      15
	MOVWF      _count+0
L_main45:
	MOVLW      128
	XORWF      _count+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_main46
;mado.c,125 :: 		if(SWITCH==1){
	BTFSS      PORTB+0, 1
	GOTO       L_main48
;mado.c,126 :: 		break; }
	GOTO       L_main46
L_main48:
;mado.c,127 :: 		portD.b3=0;
	BCF        PORTD+0, 3
;mado.c,128 :: 		portD.b1=0;
	BCF        PORTD+0, 1
;mado.c,129 :: 		portD.b0=1;
	BSF        PORTD+0, 0
;mado.c,130 :: 		portD.b5=1;
	BSF        PORTD+0, 5
;mado.c,131 :: 		if(count<=3){
	MOVLW      128
	XORLW      3
	MOVWF      R0+0
	MOVLW      128
	XORWF      _count+0, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_main49
;mado.c,132 :: 		portD.b5=0;
	BCF        PORTD+0, 5
;mado.c,133 :: 		portD.b4=1;
	BSF        PORTD+0, 4
;mado.c,134 :: 		for(i=0;i<40;i++)
	CLRF       _i+0
L_main50:
	MOVLW      40
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main51
;mado.c,135 :: 		counter(count) ;
	MOVF       _count+0, 0
	MOVWF      FARG_counter_count+0
	CALL       _counter+0
;mado.c,134 :: 		for(i=0;i<40;i++)
	INCF       _i+0, 1
;mado.c,135 :: 		counter(count) ;
	GOTO       L_main50
L_main51:
;mado.c,136 :: 		}
L_main49:
;mado.c,137 :: 		for(i=0;i<40;i++)
	CLRF       _i+0
L_main53:
	MOVLW      40
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main54
;mado.c,138 :: 		counter(count) ;
	MOVF       _count+0, 0
	MOVWF      FARG_counter_count+0
	CALL       _counter+0
;mado.c,137 :: 		for(i=0;i<40;i++)
	INCF       _i+0, 1
;mado.c,138 :: 		counter(count) ;
	GOTO       L_main53
L_main54:
;mado.c,124 :: 		for(count=15;count>=0;count--){
	DECF       _count+0, 1
;mado.c,139 :: 		}
	GOTO       L_main45
L_main46:
;mado.c,140 :: 		}
	GOTO       L_main32
L_main33:
;mado.c,141 :: 		while(portb.b1==1){
	BTFSS      PORTB+0, 1
	GOTO       L_main57
;mado.c,150 :: 		}
L_main57:
;mado.c,151 :: 		}
	GOTO       L_main29
;mado.c,153 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
