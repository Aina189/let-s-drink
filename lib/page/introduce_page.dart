import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:water/page/pageTransition/get_age_page.dart';
import 'package:water/page/pageTransition/get_gender_page.dart';
import 'package:water/page/pageTransition/get_name_page.dart';
import 'package:water/page/pageTransition/get_value_page.dart';
import 'package:water/page/pageTransition/get_weight_page.dart';

import 'package:water/page/pageTransition/presentation_page.dart';

late PageController controller;

class IntroducPage extends StatefulWidget {
  const IntroducPage({super.key});

  @override
  State<IntroducPage> createState() => _IntroducPageState();
}

class _IntroducPageState extends State<IntroducPage> {
  int track = 0;

  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          onPageChanged: (index) {
            setState(() {
              track = index;
            });
          },
          controller: controller,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            const PresentationPage(),
            GetNameUser(),
            const GetAgePage(),
            const GetGenderPage(),
            const GetWeightPage(),
            const GetNbr()
          ],
        ),
        Container(
          alignment: const Alignment(0, 0.9),
          child: SmoothPageIndicator(controller: controller, count: 6),
        ),
      ],
    ));
  }
}
