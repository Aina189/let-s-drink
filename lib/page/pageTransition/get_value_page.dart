import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:water/model/data_base.dart';
import 'package:water/model/user.dart';
import 'package:water/page/home_page.dart';
import 'package:water/page/introduce_page.dart';
import 'package:provider/provider.dart';
import 'package:water/model/memory_data.dart';

class GetNbr extends StatefulWidget {
  const GetNbr({super.key});

  @override
  State<GetNbr> createState() => _GetNbrState();
}

class _GetNbrState extends State<GetNbr> {
  bool isSelected1 = false;
  bool isSelected2 = false;
  bool isSelected3 = false;

  @override
  Widget build(BuildContext context) {
    final memoir = Provider.of<Memoire>(context);
    return Center(
      child: Container(
        padding: const EdgeInsets.all(50),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 50 / 100,
              width: MediaQuery.of(context).size.width,
              child: const Image(image: AssetImage("lib/assets/chub.png")),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelected1 = true;
                      isSelected2 = false;
                      isSelected3 = false;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: isSelected1 ? 120 : 100,
                    width: isSelected1 ? 120 : 100,
                    decoration: BoxDecoration(
                        color: isSelected1
                            ? const Color.fromARGB(255, 108, 247, 112)
                            : const Color.fromARGB(255, 234, 255, 235),
                        border: Border.all(color: Colors.green, width: 5.0),
                        borderRadius: BorderRadius.circular(8.0)),
                    child: const Center(
                      child: Text("5 fois"),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelected2 = true;
                      isSelected1 = false;
                      isSelected3 = false;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: isSelected2 ? 120 : 100,
                    width: isSelected2 ? 120 : 100,
                    decoration: BoxDecoration(
                        color: isSelected2
                            ? const Color.fromARGB(255, 108, 247, 112)
                            : const Color.fromARGB(255, 234, 255, 235),
                        border: Border.all(color: Colors.green, width: 5.0),
                        borderRadius: BorderRadius.circular(8.0)),
                    child: const Center(
                      child: Text("5 fois"),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelected3 = true;
                      isSelected1 = false;
                      isSelected2 = false;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: isSelected3 ? 120 : 100,
                    width: isSelected3 ? 120 : 100,
                    decoration: BoxDecoration(
                        color: isSelected3
                            ? const Color.fromARGB(255, 108, 247, 112)
                            : const Color.fromARGB(255, 234, 255, 235),
                        border: Border.all(color: Colors.green, width: 5.0),
                        borderRadius: BorderRadius.circular(8.0)),
                    child: const Center(
                      child: Text("5 fois"),
                    ),
                  ),
                ),
              ],
            ),
            const Text("Choisissez ce qui vous convient"),
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
                    onPressed: () async {
                      isSelected1
                          ? [
                              memoir.addNbr(2),
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          const HomePage()))
                            ]
                          : isSelected2
                              ? [
                                  memoir.addNbr(4),
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              const HomePage()))
                                ]
                              : isSelected3
                                  ? [
                                      memoir.addNbr(8),
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  const HomePage()))
                                    ]
                                  : null;
                      log(memoir.nbr.toString());
                      String classAge = memoir.age == 1
                          ? "enfant"
                          : memoir.age == 2
                              ? "adolecent"
                              : memoir.age == 3
                                  ? "jeune"
                                  : "";
                      int verreNbr = memoir.age == 1
                          ? 4
                          : memoir.age == 2
                              ? 8
                              : 16;
                      User user = User(
                          id: 1,
                          name: memoir.name,
                          age: memoir.age,
                          gender: memoir.gender,
                          wheight: memoir.weight,
                          classAge: classAge,
                          verreNbr: verreNbr,
                          perDayNbr: memoir.nbr);
                      await DataBaseHelper.insertData(user);
                      User.getUser();
                      
                    },
                    child: const Text("Finish")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
