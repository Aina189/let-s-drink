import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:water/model/memory_data.dart';
import 'package:water/page/introduce_page.dart';
import 'package:provider/provider.dart';

class GetAgePage extends StatefulWidget {
  const GetAgePage({super.key});

  @override
  State<GetAgePage> createState() => _GetAgePageState();
}

class _GetAgePageState extends State<GetAgePage> {
  TextEditingController ageController = TextEditingController();
  bool isSelected1 = false;
  bool isSelected2 = false;
  bool isSelected3 = false;

  void nextPage() {
    controller.nextPage(
        duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    final memoir = Provider.of<Memoire>(context);
    return Container(
      padding: const EdgeInsets.only(bottom: 50),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            const Text("Votre Age"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isSelected1 = true;
                        isSelected2 = isSelected3 = false;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.all(8),
                      height: 60,
                      width: 100,
                      decoration: BoxDecoration(
                        color: isSelected1 ? Colors.greenAccent : Colors.white,
                        border: Border.all(color: Colors.green, width: 4.0),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: Text("moins de 8"),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isSelected2 = true;
                        isSelected1 = isSelected3 = false;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.all(8),
                      height: 60,
                      width: 100,
                      decoration: BoxDecoration(
                        color: isSelected2 ? Colors.greenAccent : Colors.white,
                        border: Border.all(color: Colors.green, width: 5.0),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: Text("9-18"),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isSelected3 = true;
                        isSelected2 = isSelected1 = false;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.all(8),
                      height: 60,
                      width: 100,
                      decoration: BoxDecoration(
                        color: isSelected3 ? Colors.greenAccent : Colors.white,
                        border: Border.all(color: Colors.green, width: 5.0),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: Text("18 et plus"),
                      ),
                    ),
                  ),
                ]),
                Container(
                  height: MediaQuery.of(context).size.height * 70 / 100,
                  width: MediaQuery.of(context).size.width * 70 / 100,
                  child: const Image(
                    image: AssetImage("lib/assets/Man.png"),
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
            const Text(
              "Vous avez quelle age?. Ceci est modifiable a tous moment",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
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
                      isSelected1
                          ? [memoir.addAge(2), nextPage()]
                          : isSelected2
                              ? [memoir.addAge(2), nextPage()]
                              : isSelected3
                                  ? [memoir.addAge(3), nextPage()]
                                  : null;
                      log(memoir.age.toString());
                    },
                    child: Text("next")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
