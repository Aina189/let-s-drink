import 'package:flutter/material.dart';

import 'package:water/model/user.dart';
import 'package:water/widget/info_col.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  @override
  Widget build(BuildContext context) {
    final user = User.userRegistred;
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidht = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text("info User"),
            infoCol(
                height: (screenHeight * 5) / 100,
                width: screenWidht,
                avant: 'Votre nom',
                milieu: user.name,
                icon: Icons.person),
            infoCol(
                height: (screenHeight * 5) / 100,
                width: screenWidht,
                avant: "Votre class d'age",
                milieu: user.classAge,
                icon: Icons.height),
            infoCol(
                height: (screenHeight * 5) / 100,
                width: screenWidht,
                avant: 'Votre class poids',
                milieu: user.wheight.toString(),
                icon: Icons.hail),
            infoCol(
                height: (screenHeight * 5) / 100,
                width: screenWidht,
                avant: 'Nombre de fois pour boire',
                milieu: user.perDayNbr.toString(),
                icon: Icons.watch),
          ],
        ),
      ),
    );
  }
}
