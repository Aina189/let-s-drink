import 'package:flutter/material.dart';

Widget countDown({required double width,required String time , required double verre}){
  return Container(
    margin: const EdgeInsets.only(left: 10,right: 10),
    padding: const EdgeInsets.all(10),
    height: 50,
    width: width,
    decoration:const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30)),gradient : LinearGradient(colors: [Color.fromARGB(255, 255, 170, 42),Color.fromRGBO(246, 157, 23, 1)],begin: Alignment.topCenter,end: Alignment.bottomCenter)),
    child:Center(child: Text("Tu doit boire $verre de verre d'eau apres $time",style: const TextStyle(fontWeight: FontWeight.bold ,fontSize: 20,color: Colors.white),),)
    );
  

}