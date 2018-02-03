;************************************** Ensam_01_avr.asm ************************************
;
; Por los diodos LED conectados al Puerto PortB y PortD visualiza el valor de una constante, por ejemplo
; el número binario b'00010101'.
;
; PD6 --> digital pin 6 
; PD7 --> digital pin 7 
;
; PB0 --> digital pin 8 
; PB1 --> digital pin 9 
; PB2 --> digital pin 10 
; PB3 --> digital pin 11 
; PB4 --> digital pin 12 
; PB5 --> digital pin 13 
; PB6 --> crystal (no usar)
; PB7 --> crystal (no usar)
;  
; compilar: avra Ensam_01_avr.asm
; enviar fichero hex al arduino: avrdude -v -p atmega328p -c arduino -P /dev/ttyUSB0 -b 57600 -D -U flash:w:Ensam_01_avr.hex
;
; ZONA DE DATOS **********************************************************************

.NOLIST
.include "./m328Pdef.inc" 		; En este fichero se definen las etiquetas del micro.
.LIST

.EQU	 CONSTANTE1=0b00010101		; Por ejemplo, la constante tiene este valor.  (EQU define una constante que no se puede modificar)
.EQU	 CONSTANTE2=0b01000000		; 



; ZONA DE CÓDIGOS ********************************************************************

Principal:				; memoria de programa.

	ldi r16,CONSTANTE1		; Carga el registro de trabajo r16 con la constante.
	ldi r17,CONSTANTE2		; Carga el registro de trabajo r17 con la constante.
	out DDRB,r16 			; Las líneas del Puerto B configuradas como salida.
	out DDRD,r17 			; Las líneas del Puerto D configuradas como salida.
	out PortB,r16			; El contenido de r16 se deposita en el puerto de salida.
	out PortD,r17			; El contenido de r16 se deposita en el puerto de salida.

	rjmp	Principal		; Crea un bucle cerrado e infinito





