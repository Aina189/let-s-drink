

class Clacule{
  static double value = 0.0;
  static double purcentValue = 0.0;


  static void calculVerre(int nbrVerre, int ndrPerDay){
      value =nbrVerre / ndrPerDay/10;
  }

  static void boir(){
    if(purcentValue < 1.0){
      purcentValue += value;
    }
    if(purcentValue == 1.0){
      purcentValue = 0;
    }
  }

}