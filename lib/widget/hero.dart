import 'package:flutter/material.dart';

Widget hero(
    {required double height,
    required double width,
    required bool isBoy,
    required String nom,
    required String classAge,
    required String nbrDeVerre}) {
  AssetImage boyimg = const AssetImage("lib/assets/Man.png");
  AssetImage girlimg = const AssetImage("lib/assets/Girl.png");
  return Container(
    padding: const EdgeInsets.only(top: 30),
    height: height,
    width: width,
    decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
        gradient: LinearGradient(
            colors: [Colors.white70, Colors.blueAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight)),
    child: Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.person,
                  size: 40,
                  color: Colors.white,
                )),
            Text("Health App",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                    color: Colors.white)),
            IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.menu,
                  size: 40,
                  color: Colors.white,
                ))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: height - 100,
              child: Image(
                image: isBoy ? boyimg : girlimg,
                fit: BoxFit.contain,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("User Info:", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                Text("Nom: $nom" , style:const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),),
                Text("Classe Age: $classAge" , style:const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),),
                Text("Moyenne besoin en eau: $nbrDeVerre" , style:const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),),
                
              ],
            )
          ],
        )
      ],
    ),
  );
}
