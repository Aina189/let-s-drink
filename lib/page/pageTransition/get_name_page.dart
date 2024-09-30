import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:water/model/memory_data.dart';
import 'package:water/page/introduce_page.dart';

class GetNameUser extends StatelessWidget {
  GetNameUser({super.key});
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final memoir = Provider.of<Memoire>(context);

    return Container(
      padding:const EdgeInsets.only(bottom: 50),
      child: Column(
        children: [
          const Image(image: AssetImage("lib/assets/Mr.png")),
          const Text(
            "Comment on peut vous appellez.",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const Text(
            "Ceci est modifiable à tout moment",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const Text("Votre nom"),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 5.0,
                    right: 5.0,
                  ),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      labelText: "Nom de l'utilisateur",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Expanded(child: SizedBox()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             ElevatedButton(
              onPressed: () {
                controller.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn);
              },
              child: const Text("previous")),
               ElevatedButton(
              onPressed: () {
                if(nameController.text != ""){
                  memoir.addName(nameController.text);
                  log(memoir.name);
                  controller.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn);
                } else {
                  null;
                }
                
              },
              child: const Text("next")),

            ],
          ),
          
        ],
      ),
    );
  }
}
