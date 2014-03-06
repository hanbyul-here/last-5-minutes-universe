

class Clock {
//  //  
  PGraphics pg;
//
  float x;
  float y;
  float z;
  
  int min;
  int sec;
//
  int def;
//
//
  Clock() {
//
    pg = createGraphics(300, 200);
//
    this.x = 0;
    this.y = 0;
    this.z = 0;
//
    min = 4;
    sec = 60;
//

  }
//
  void set(float x, float y, float z) {
//  
    this.x = x;
    this.y = y;
    this.z = z;
    def = millis();
  }
//  // Starting the timer
  String getTime() {
//
//
    int gap = (millis() - def)/1000;
    int minGap = (gap-1)/60;
    
   int tempMin = min - minGap;
   int tempSec = sec - gap;
   if(tempSec <0) sec+=60; 
    
    String s0 = "0" ;
    String s1 = Integer.toString(tempMin);
    String s2 = " : ";
     String s3 = Integer.toString(tempSec);
    if(tempSec <10) {
      s3 = s0.concat(s3);
    }
     String temp0 = s0.concat(s1);
     String temp1 = temp0.concat(s2);
     
     String countdown;
    if(tempMin <0) countdown = "";
   else countdown  = temp1.concat(s3);
     
//
    //pg.text(countdown, 0,0);
    //println(countdown);

    return countdown;
  }
}

