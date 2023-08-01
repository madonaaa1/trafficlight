#line 1 "C:/Users/MADONA/OneDrive/Desktop/mado/code/mado.c"





signed char count;
unsigned char i;

void counter(signed char count){
int left=count/10;
int right=count%10;
  portE.b0 =0;
  portE.b1 =1;
  portC =right;
 delay_ms(10);
  portE.b0 =1;
  portE.b1 =0;
  portC = Left;
 delay_ms(10);
 }
 int j=0;
 void interrupt(){
 if(intf_bit==1)
 intf_bit=0;
 j++;

 if(j==1){
 for(count=3;count>=0;count--){




 portd=0b01010;
 for(i=0;i<40;i++){
 int left=count/10;
 int right=count%10;
  portE.b0 =0;
  portE.b1 =1;
  portC =right;
 delay_ms(10);
  portE.b0 =1;
  portE.b1 =0;
  portC = Left;
 delay_ms(10);}
 }
 portD.B1=0;

 }

 else if(j==2){
 portd=0b100001;

 for(i=0;i<40;i++){
 int left=count/10;
 int right=count%10;
  portE.b0 =0;
  portE.b1 =1;
  portC =right;
 delay_ms(10);
  portE.b0 =1;
  portE.b1 =0;
  portC = Left;
 delay_ms(10);}
 portd=0;
 }


 else if(j==3){
 for(count=3;count>=0;count--){

 portd=0b010001;
 for(i=0;i<40;i++){
 int left=count/10;
 int right=count%10;
  portE.b0 =0;
  portE.b1 =1;
  portC =right;
 delay_ms(10);
  portE.b0 =1;
  portE.b1 =0;
  portC = Left;
 delay_ms(10);}
 }
 j=0;
 }


 }


void main(){
ADCON1=7;
trisb.b1=1;
trisb.b0=1;
gie_bit=1;
inte_bit=1;
intedg_bit=1;
 portB.B1=1;
trisc=0;portc=0;
trisd=0; portd=0;
 trisE.b0=0;  portE.b0 =1;
 trisE.b1=0;  portE.b1 =1;
 for(;;){
 while(portb.b1==0){
 for(count=23;count>=0;count--){
 if( portB.b1 ==1){
 break; }
 portD.b0=0;
 portD.b4=0;
 portD.b3=1;
 portD.b2=1;
 if(count<=3){

 portD.b2=0;
 portD.b1=1;
 for(i=0;i<40;i++)
 counter(count) ;
 }


 for(i=0;i<40;i++)
 counter(count) ;
 }
 for(count=15;count>=0;count--){
 if( portB.b1 ==1){
 break; }
 portD.b3=0;
 portD.b1=0;
 portD.b0=1;
 portD.b5=1;
 if(count<=3){
 portD.b5=0;
 portD.b4=1;
 for(i=0;i<40;i++)
 counter(count) ;
 }
 for(i=0;i<40;i++)
 counter(count) ;
 }
 }
 while(portb.b1==1){







 break;
 }
}

 }
