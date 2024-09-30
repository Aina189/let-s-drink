import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:water/page/introduce_page.dart';
import 'package:water/model/memory_data.dart';
import 'package:provider/provider.dart';

class GetWeightPage extends StatefulWidget {
  const GetWeightPage({super.key});

  @override
  State<GetWeightPage> createState() => _GetWeightPageState();
}

class _GetWeightPageState extends State<GetWeightPage> {
  bool isSelected1 = false;
  bool isSelected2 = false;
  bool isSelected3 = false;

  @override
  Widget build(BuildContext context) {
    final memoir = Provider.of<Memoire>(context);
    return Center(
      child: Container(
        padding: EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Image(image: AssetImage("lib/assets/Strong.png")),
            Container(
              height: 150,
              child: Row(
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
                      duration: Duration(milliseconds: 300),
                      height: isSelected1 ? 120 : 100,
                      width: isSelected1 ? 120 : 100,
                      decoration: BoxDecoration(
                          color: isSelected1
                              ? const Color.fromARGB(255, 108, 247, 112)
                              : const Color.fromARGB(255, 234, 255, 235),
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(color: Colors.green,width: 4.0)
                          ),
                      child:Center(child:Text("20 - 40 ") ,) ,
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
                      duration: Duration(milliseconds: 300),
                      height: isSelected2 ? 120 : 100,
                      width: isSelected2 ? 120 : 100,
                      decoration: BoxDecoration(
                          color: isSelected2
                              ? const Color.fromARGB(255, 108, 247, 112)
                              : const Color.fromARGB(255, 234, 255, 235),
                          borderRadius: BorderRadius.circular(8.0),border: Border.all(color: Colors.green,width: 4.0)),
                      child:Center(child:Text("41 - 60 ") ,) ,
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
                      duration: Duration(milliseconds: 300),
                      height: isSelected3 ? 120 : 100,
                      width: isSelected3 ? 120 : 100,
                      decoration: BoxDecoration(
                          color: isSelected3
                              ? const Color.fromARGB(255, 108, 247, 112)
                              : const Color.fromARGB(255, 234, 255, 235),
                          borderRadius: BorderRadius.circular(8.0),border: Border.all(color: Colors.green,width: 4.0)),
                      child:const Center(child:Text("61 - plus ") ,) ,
                    ),
                  ),
                ],
              ),
            ),
            const Text("Choisissez ou votre poid se trouve"),
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
                if(isSelected1 && !isSelected2 && !isSelected3){
                  memoir.addWeight(1);
                  log("${memoir.weight}");
                   controller.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn);
                }if(isSelected2 && !isSelected1 && !isSelected3){
                  memoir.addWeight(2);
                  log("${memoir.weight}");
                   controller.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn);
                }
                if(isSelected3 && !isSelected1 && !isSelected2){
                  memoir.addWeight(3);
                  log("${memoir.weight}");
                   controller.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn);
                }if(!isSelected1 && !isSelected2 && !isSelected3){
                  log("${memoir.weight}");
                  null;
                   
                }
               
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
