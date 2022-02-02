import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'model/onboardingmodel.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: pages,
        // dotsContainerDecorator: DotsDecorator(
        //   size: Size(10, 10),
        //   color: Colors.blue,
        //   activeSize: Size.square(15),
        //   activeColor: Colors.red
        // ),
        showDoneButton: true,
        done: Text("Done", style: TextStyle(fontSize: 20)),
        showNextButton: true,
        next: Text("Next", style: TextStyle(fontSize: 20)),
        showSkipButton: true,
        skip: Text("Skip", style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
