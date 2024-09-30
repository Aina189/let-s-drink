import 'package:flutter/material.dart';

Widget infoCol({required double height, required double width,required String avant,required String milieu,required IconData icon}){
  TextStyle style =const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, );
  
  return Container(
    margin: const EdgeInsets.only(top: 10, left: 5.0, right: 5.0),
    height: height,
    width: width,
    padding: const EdgeInsets.all(8.0),
    decoration:  BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      gradient: const LinearGradient(colors: [Color.fromARGB(255, 132, 32, 199) , Color.fromARGB(255, 67, 2, 142)] , begin: Alignment.topCenter,end: Alignment.bottomCenter)
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(avant, style: style,),
        Text(milieu),
        Icon(icon)
      ],
    ),
  );
}