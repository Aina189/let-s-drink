import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:water/controller/calcul.dart';

Widget indicator({required double width}){
  return SizedBox(
    height: 200,
    width: width,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        
        const Text("Votre consommation d'aujourdhui ", style: TextStyle(color: Colors.lightBlue, fontSize: 20,fontWeight: FontWeight.bold),),
        const SizedBox(width: 10,),
        CircularPercentIndicator(
          animation: true,
          animationDuration: 500,
          animateFromLastPercent: true,
                  radius: 70.0,
                  lineWidth: 20.0,
                  percent: Clacule.purcentValue,
                  center: const SizedBox(height: 60,width: 60, child:Image(image: AssetImage("lib/assets/droplet.png")) ,) ,
                  progressColor: Colors.green,
        )
      ],
    ),
  );
}