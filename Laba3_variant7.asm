.include   "m16def.inc"          //присоеденение к текущему тексту программы описание всех регистров и параметров ATmega16                  
    .def    temp=r16             //присваеваем r16 имя temp          
	.def    temp1=r17            //присваеваем r17 имя temp1           
	.def	x1=r21			
	.def	x2=r22			
	.def	x4=r23		
	.def	x5=r24				 
	.def	C=r25				 
	.def	v=r26
	.def    n=r27
	.def    ch1=r28
	.def    ch2=r29

.org        0x0000              	   		// изменяем значение указателя текущего адресса             
rjmp reset                     		    	 //переход относительно reset
.org          0x0030           				 //заново изменяем значение указателя текущего адресса              
reset:                                       //начало раздела кнтроллера
ldi                   temp,low(RAMEND)    	 //ввод константы low в регистр temp    
out                   SPL,TEMP               //пересылаем регистр temp в SPL 
ldi                   temp,high(RAMEND)      //ввод константы high в регистр temp  
out                   SPH,TEMP                 


ldi x1,2     
ldi x2,3
ldi x4,2			// присваеваем переменным значения
ldi x5,4
ldi n,0
ldi ch1, 7
ldi ch2, 2

sub x1,x2			//  x1=x1-x2
sub x1,ch1			//	x1=x1-ch1
mov c,x1			//	c=x1

cp n,c				
brlo m1				

cp n,c
brsh m2
rjmp exit

m1:					// ветка m1
add ch2,c			// ch2=ch2+c
mul ch2,x1			// ch2*x1
mov v,R0			// v=R0
rjmp exit

m2:					// ветка m2
mul x4,x5			// x4*x5
add x2,R0			// x2+R0
mov v, x2			// v=x2
rjmp exit

exit:
nop
