import 'package:flutter/material.dart';
import 'package:flutter_workouts/constants.dart';
import 'package:introduction_screen/introduction_screen.dart';

final List<PageViewModel> pages = [
  PageViewModel(
    title: "Boarding",
    body:
        'Flutter on board package\Flutter is an open-source UI software development kit created by Google. It is used to develop cross platform applications for Android, iOS, Linux, Mac, Windows, Google',
    image: Image.asset(
      "assets/onboard/1onboard.jpg",
      fit: BoxFit.fill,
    ),
    decoration: PageDecoration(
      titleTextStyle:
          TextStyle(fontSize: kDefaultSize, fontWeight: FontWeight.bold),
    ),
  ),
  PageViewModel(
    title: "Route",
    reverse: true,
    body: 'Our Route is to Flutter Learn',
    image: Image.asset(
      "assets/onboard/2onboard.jpg",
      fit: BoxFit.fill,
    ),
    decoration: PageDecoration(
      titleTextStyle:
          TextStyle(fontSize: kDefaultSize, fontWeight: FontWeight.bold),
    ),
  ),
  PageViewModel(
    title: "FLUTTER",
    body: 'You will see flutter workouts very soon',
    image: Image.asset(
      "assets/onboard/3onboard.jpg",
      fit: BoxFit.fill,
    ),
    footer: ElevatedButton(
      onPressed: () {},
      child: Text("Lets Go"),
    ),
    decoration: PageDecoration(
      titleTextStyle:
          TextStyle(fontSize: kDefaultSize, fontWeight: FontWeight.bold),
    ),
  ),
];
