#define display portC
#define LSD   portE.b0
#define MSD  portE.b1
#define MANUAL portB.b0
#define SWITCH portB.b1
signed char count;
unsigned char i;

void counter(signed char count){
int left=count/10;
int right=count%10;
   LSD=0;//pnp transistor is on
   MSD=1; //pnp transistor is off
    display=right;
   delay_ms(10);
   LSD=1;//pnp transistor is off
   MSD=0; //pnp transistor is on
   display= Left;
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
   LSD=0;//pnp transistor is on
   MSD=1; //pnp transistor is off
   display=right;
  delay_ms(10);
  LSD=1;//pnp transistor is off
  MSD=0; //pnp transistor is on
   display= Left;
    delay_ms(10);}
    }
    portD.B1=0;
    //j=2;
     }
    //portD.B1=0;}
   else if(j==2){
   portd=0b100001;
  //delay_ms(1000);
  for(i=0;i<40;i++){
  int left=count/10;
  int right=count%10;
  LSD=0;//pnp transistor is on
  MSD=1; //pnp transistor is off
  display=right;
  delay_ms(10);
  LSD=1;//pnp transistor is off
  MSD=0; //pnp transistor is on
  display= Left;
  delay_ms(10);}
  portd=0;
    }
 // portd=0;

   else if(j==3){
   for(count=3;count>=0;count--){
  // portd=0b010001;
    portd=0b010001;
   for(i=0;i<40;i++){
  int left=count/10;
  int right=count%10;
  LSD=0;//pnp transistor is on
  MSD=1; //pnp transistor is off
  display=right;
  delay_ms(10);
  LSD=1;//pnp transistor is off
  MSD=0; //pnp transistor is on
   display= Left;
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
intedg_bit=1;//raising edge
 portB.B1=1;
trisc=0;portc=0;
trisd=0; portd=0;//Red1=D0 YELLOW1=D1 Green1=D2 Red2=D3 YELLOW2=D4 Green2=D5
 trisE.b0=0;  LSD=1;  //pnp transistor off
 trisE.b1=0;  MSD=1;   //pnp transistor off
 for(;;){
  while(portb.b1==0){
 for(count=23;count>=0;count--){
   if(SWITCH==1){
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
   if(SWITCH==1){
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