import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:water/page/introduce_page.dart';

class PresentationPage extends StatefulWidget {
  const PresentationPage({super.key});

  @override
  State<PresentationPage> createState() => _PresentationPageState();
}

class _PresentationPageState extends State<PresentationPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image(image: AssetImage("lib/assets/Family.png")),
          Text("WATER",style:  GoogleFonts.sofadiOne(textStyle: TextStyle(color: Colors.lightBlue, fontSize: 50)),),
          Text("La santé est la richesse d'une famille heureuse",style:  GoogleFonts.sofadiOne(textStyle: TextStyle(color: Colors.black, fontSize: 20)),),
          Text("Cette application à pour but d'insiter l'utilisateur dans son besoin en eau quotidien.",style:  GoogleFonts.sofadiOne(textStyle: TextStyle(color: Colors.black, fontSize: 20,)),textAlign: TextAlign.center,),
          ElevatedButton(
                    onPressed: () {
                      controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn);
                    },
                    child: Text("Let's drink"))
        ],
      ),
    );
  }
}