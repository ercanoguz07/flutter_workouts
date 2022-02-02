import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_workouts/screen/home/home_screen.dart';
import 'package:flutter_workouts/screen/onboarding/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart';

bool show = true;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GestureBinding.instance?.resamplingEnabled = true;
  prefs = await SharedPreferences.getInstance();
  show = prefs.getBool("ONBOARD") ?? true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Workouts',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: show ? OnboardingScreen() : HomeScreen(),
    );
  }
}
