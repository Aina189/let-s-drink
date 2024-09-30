import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:water/page/introduce_page.dart';
import 'package:water/model/memory_data.dart';
import 'package:provider/provider.dart';

class GetGenderPage extends StatefulWidget {
  const GetGenderPage({super.key});

  @override
  State<GetGenderPage> createState() => _GetGenderPageState();
}

class _GetGenderPageState extends State<GetGenderPage> {
  bool isGirl = false;
  bool isBoy = false;

  @override
  Widget build(BuildContext context) {
    final memoir = Provider.of<Memoire>(context);
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidht = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.only(top: 50, bottom: 50),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: screenHeight * 50 / 100,
                    width: screenWidht * 50 / 100,
                    child: Image(
                      image: AssetImage(
                        "lib/assets/Man.png",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text("Homme"),
                  Checkbox(
                      value: isBoy,
                      onChanged: (a) {
                        setState(() {
                          isBoy = true;
                          isGirl = false;
                          log("boy" + isBoy.toString());
                        });
                      })
                ],
              ),
              Column(
                children: [
                  Container(
                    height: screenHeight * 50 / 100,
                    width: screenWidht * 50 / 100,
                    child: Image(
                      image: AssetImage(
                        "lib/assets/Girl.png",
                      ),
                      fit: BoxFit.contain,
                    ),
                  ),
                  Text("Femme"),
                  Checkbox(
                      value: isGirl,
                      onChanged: (a) {
                        setState(() {
                          isGirl = true;
                          isBoy = false;
                          log("girl" + isGirl.toString());
                        });
                      })
                ],
              ),
            ],
          ),
          const Text(
            "Vous etes quelle genre?",
            style: TextStyle(fontSize: 40),
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
                  child: Text("previous")),
              ElevatedButton(
                  onPressed: () {
                    if (isBoy && !isGirl) {
                      memoir.addGender("Boy");
                      log(memoir.gender);
                      controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn);
                    }if (isGirl && !isBoy) {
                      memoir.addGender("Girl");
                      log(memoir.gender);
                      controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn);
                    }if(!isBoy && !isGirl){
                      null;
                    }
                  },
                  child: Text("next")),
            ],
          ),
        ],
      ),
    );
  }
}
