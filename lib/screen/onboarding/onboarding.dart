import 'package:flutter/material.dart';
import 'package:flutter_workouts/screen/home/homescreen.dart';
import 'package:introduction_screen/introduction_screen.dart';
import '../../constants.dart';
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
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: kDefaultSize * 1.5),
          child: IntroductionScreen(
              curve: Curves.bounceInOut,
              color: kGreyColor,
              pages: pages,
              dotsDecorator: DotsDecorator(
                  size: Size(kDefaultSize / 3, kDefaultSize / 3),
                  color: kBlueColor,
                  activeSize: Size.square(kDefaultSize * .65),
                  activeColor: kRedColor),
              showDoneButton: true,
              done: Text("Start", style: TextStyle(fontSize: kDefaultSize)),
              showSkipButton: true,
              skip: Text("Skip", style: TextStyle(fontSize: kDefaultSize)),
              showNextButton: true,
              next: Icon(
                Icons.arrow_forward_ios,
                size: kDefaultSize,
              ),
              onDone: onClickNavigator,
              onSkip: onClickNavigator),
        ),
      ),
    );
  }

  onClickNavigator() {
    prefs.setBool("ONBOARD", false);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ),
    );
  }
}
