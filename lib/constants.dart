import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const kPrimaryColor = Color(0xDEE1E6FF);
const kBlueColor = Color(0xFF2878AE);
const kGreyColor = Color(0xFF6FA2A0);
const kRedColor = Color(0xFFBD5664);
const kYellowColor = Color(0xFFDC9E39);

late SharedPreferences prefs;

double kDefaultSize = 20;
//bounce duration
var kBounceDuration = Duration(milliseconds: 150);
//decaration
var linearBoxDecoration = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    colors: [
      kRedColor,
      kRedColor.withOpacity(.8),
      kRedColor.withOpacity(.4),
    ],
  ),
);
var borderTopLRBoxDec = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(kDefaultSize * 3),
    topRight: Radius.circular(kDefaultSize * 3),
  ),
);
var boxShadowBoxDecor = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(kDefaultSize),
  boxShadow: [
    BoxShadow(
      color: Color.fromRGBO(255, 95, 27, .3),
      blurRadius: kDefaultSize,
      offset: Offset(0, kDefaultSize / 2),
    ),
  ],
);
