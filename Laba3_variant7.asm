.include   "m16def.inc"          //������������� � �������� ������ ��������� �������� ���� ��������� � ���������� ATmega16                  
    .def    temp=r16             //����������� r16 ��� temp          
	.def    temp1=r17            //����������� r17 ��� temp1           
	.def	x1=r21			
	.def	x2=r22			
	.def	x4=r23		
	.def	x5=r24				 
	.def	C=r25				 
	.def	v=r26
	.def    n=r27
	.def    ch1=r28
	.def    ch2=r29

.org        0x0000              	   		// �������� �������� ��������� �������� �������             
rjmp reset                     		    	 //������� ������������ reset
.org          0x0030           				 //������ �������� �������� ��������� �������� �������              
reset:                                       //������ ������� ����������
ldi                   temp,low(RAMEND)    	 //���� ��������� low � ������� temp    
out                   SPL,TEMP               //���������� ������� temp � SPL 
ldi                   temp,high(RAMEND)      //���� ��������� high � ������� temp  
out                   SPH,TEMP                 


ldi x1,2     
ldi x2,3
ldi x4,2			// ����������� ���������� ��������
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

m1:					// ����� m1
add ch2,c			// ch2=ch2+c
mul ch2,x1			// ch2*x1
mov v,R0			// v=R0
rjmp exit

m2:					// ����� m2
mul x4,x5			// x4*x5
add x2,R0			// x2+R0
mov v, x2			// v=x2
rjmp exit

exit:
nop
