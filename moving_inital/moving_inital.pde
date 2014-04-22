#include <MeggyJrSimple.h>
void setup()
{
  MeggyJrSimpleSetup();
}

int direction = 0;

int marker = 12;

//define a struct
struct Point
{
 int x;
 int y;
};

Point s1 = {2,1};
Point s2 = {2,2};
Point s3 = {2,3};
Point s4 = {2,4};
Point s5 = {2,5};
Point s6 = {2,6};
Point s7 = {3,4};
Point s8 = {4,5};
Point s9 = {5,6};
Point s10 = {3,3};
Point s11 = {4,2};
Point s12 = {5,1};


Point letterArray[64] = {s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12};

void loop()
{
  drawLetter();
  
  DisplaySlate();
  delay(400);
  ClearSlate();
  
  CheckButtonsPress();
    if(Button_Up)
    direction=0;
    
    if(Button_Right)
    direction=90;
  
    if(Button_Down)
    direction=180;
 
    if(Button_Left)
    direction=270;
 
   updateLetter();
}


void drawLetter()
{
  for(int i = 0; i < marker; i++)
  {
    DrawPx(letterArray[i].x, letterArray[i].y,Red);
  }
}


void updateLetter()
{
  for(int i = 0; i < 12; i++)
  {
    if(direction==0)
    {
      letterArray[i].y++;
      if(letterArray[i].y>7)
        letterArray[i].y=0;
    }
    
    if(direction==90)
    {
      letterArray[i].x++;
      if(letterArray[i].x>7)
        letterArray[i].x=0;
    }
    
    if(direction==180)
    {
      letterArray[i].y--;
      if(letterArray[i].y<0)
        letterArray[i].y=7;
    }

    if(direction==270)
    {
      letterArray[i].x--;
      if(letterArray[i].x<0)
        letterArray[i].x=7;
    }
   
  }
 
} 
