import 'package:flutter/material.dart';

class Memoire with ChangeNotifier{
  String name = "";
  int age = 0;
  String gender = "";
  int weight = 0;
  int nbr = 0;

 get getName => name;

 set setName(String name) => this.name = name;

  get getAge => age;

 set setAge( age) => this.age = age;

  get getGender => gender;

 set setGender( gender) => this.gender = gender;

  get getWeight => weight;

 set setWeight( weight) => this.weight = weight;

  get getNbr => nbr;

 set setNbr( nbr) => this.nbr = nbr;

void addName(String nameAdd){
  setName = nameAdd;
  notifyListeners();
}

void addAge(int ageAdd){
  setAge = ageAdd;
  notifyListeners();
}

void addGender(String genderAdd){
  setGender = genderAdd;
  notifyListeners();
}

void addWeight(int weightAdd){
  setWeight = weightAdd;
  notifyListeners();
}

void addNbr(int nbrAdd){
  setNbr = nbrAdd;
  notifyListeners();
}

}