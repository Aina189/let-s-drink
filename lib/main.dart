import 'package:flutter/material.dart';
import 'package:water/model/memory_data.dart';
import 'package:water/page/home_page.dart';
import 'package:water/page/introduce_page.dart';

import 'package:water/model/data_base.dart';
import 'package:water/model/user.dart';
import 'dart:developer';
import 'package:provider/provider.dart';

void main() async {
  runApp(ChangeNotifierProvider(
      create: (context) => Memoire(),
      child: const MyApp(),
    ),);
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  

  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  late List<Map<String, dynamic>> userData ;

  Future<User?> fecthUser(int id) async {
    userData = await DataBaseHelper.getUserData(id);
    log(userData.length.toString());
    if(userData.isNotEmpty){
      User user = User.fromMap(userData.first);
      return user;
    }else {
    print('Aucun utilisateur trouvé avec cet ID.');
    return null;
  }
}
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage()
      //const IntroducPage(),
    );
  }
}


