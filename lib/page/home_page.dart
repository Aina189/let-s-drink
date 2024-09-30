

import 'package:flutter/material.dart';
import 'package:water/controller/calcul.dart';
import 'package:water/model/user.dart';
import 'package:water/widget/countdown_timer.dart';
import 'package:water/widget/hero.dart';
import 'package:water/widget/indicator_per_day.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {



  @override
  void initState() async{
    super.initState();
    User.getUser();
    Clacule.calculVerre(User.userRegistred.verreNbr, User.userRegistred.perDayNbr);
  }


  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidht = MediaQuery.of(context).size.width;
    final user = User.userRegistred;
    bool isBoy = user.gender == 'boy'?true:false;

    return Scaffold(
      body:
       SizedBox(
        height: screenHeight,
        width: screenWidht,
        child: SingleChildScrollView(
          child: Column(
          children: [
            
            hero(height: screenHeight*50/100, width: screenWidht,isBoy: isBoy,nom: user.name,classAge: user.classAge,nbrDeVerre: user.verreNbr.toString()),
            const SizedBox(height: 8),
            countDown(width: screenWidht,time: "3h 50min", verre: Clacule.value*10),
            indicator(width: screenWidht),
             ElevatedButton(onPressed: (){
              setState(() {
                Clacule.boir();
              });
              
              
            },
             child: const Text("Boire", style: TextStyle(color: Colors.white),)),
            
            
            ],
            
        ),
        )
        
      ),
    );
  }
}


