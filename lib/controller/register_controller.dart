


import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:water/model/data_base.dart';
import 'package:water/model/user.dart';
import 'package:provider/provider.dart';
import 'package:water/model/memory_data.dart';

class SyncToDB{
  static void addUser(BuildContext context) async{
    final memoir = Provider.of<Memoire>(context);
    String classAge = memoir.age == 1?"enfant":memoir.age == 2?"adolecent":memoir.age == 3?"jeune":"";
    int verreNbr = memoir.age == 1? 4 :memoir.age==2?8:12;
    User user = User(id: 1, name: memoir.name, age: memoir.age, gender: memoir.gender, wheight: memoir.weight, classAge: classAge, verreNbr: verreNbr, perDayNbr: memoir.nbr);
    await DataBaseHelper.insertData(user);
    User? userRegistred = await getUserById(1);
    if(userRegistred != null){
      log(userRegistred.name);
    }
  }

  static Future<User?> getUserById(int id) async{
      List<Map<String, dynamic>> user = await DataBaseHelper.getUserData(id);
      if(user.isNotEmpty){
        return User.fromMap(user.first);
      }else{
        null;
      }
      return null;
  }
}