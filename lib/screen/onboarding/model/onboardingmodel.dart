import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

final List<PageViewModel> pages = [
  PageViewModel(
    title: "First Page",
    body: 'Description',
    footer: ElevatedButton(
      onPressed: () {},
      child: Text("Lets Go"),
    ),
    image: Image.asset("assets/onboarding/1onboard.jpg"),
    decoration: PageDecoration(
      titleTextStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    ),
  ),
  PageViewModel(
    title: "Second Page",
    body: 'Description',
    footer: ElevatedButton(
      onPressed: () {},
      child: Text("Lets Go"),
    ),
    image: Image.asset("assets/onboarding/2onboard.jpg"),
    decoration: PageDecoration(
      titleTextStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    ),
  ),
  PageViewModel(
    title: "Third Page",
    body: 'Description',
    footer: ElevatedButton(
      onPressed: () {},
      child: Text("Lets Go"),
    ),
    image: Image.asset("assets/onboarding/3onboard.jpg"),
    decoration: PageDecoration(
      titleTextStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    ),
  ),
];
