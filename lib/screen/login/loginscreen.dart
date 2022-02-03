import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_workouts/constants.dart';
import 'package:flutter_workouts/screen/home/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              kRedColor,
              kRedColor.withOpacity(.8),
              kRedColor.withOpacity(.7),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: kDefaultSize * 2),
            LoginHeader(),
            LoginBody(),
          ],
        ),
      ),
    );
  }
}

class LoginBody extends StatelessWidget {
  const LoginBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(kDefaultSize * 3),
            topRight: Radius.circular(kDefaultSize * 3),
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(kDefaultSize),
            child: Column(
              children: [
                SizedBox(height: kDefaultSize),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(kDefaultSize),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(255, 95, 27, .3),
                        blurRadius: kDefaultSize,
                        offset: Offset(0, kDefaultSize / 2),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      LoginTextField(title: "Login"),
                      LoginTextField(title: "Password"),
                    ],
                  ),
                ),
                SizedBox(height: kDefaultSize * 2),
                Text("Forget Password?", style: TextStyle(color: kGreyColor)),
                SizedBox(height: kDefaultSize),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    );
                  },
                  child: Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: kDefaultSize * 2.5),
                    height: kDefaultSize * 2.7,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(kDefaultSize * 2),
                        color: kRedColor),
                    child: Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: kDefaultSize,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: kDefaultSize * 2.5),
                Text("Continue with Social Media",
                    style: TextStyle(color: kGreyColor)),
                SizedBox(height: kDefaultSize),
                Row(
                  children: [
                    LoginSocialButon(title: "Facebook", color: kBlueColor),
                    SizedBox(width: kDefaultSize),
                    LoginSocialButon(title: "Githhub", color: Colors.black),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginSocialButon extends StatelessWidget {
  const LoginSocialButon({
    Key? key,
    required this.title,
    required this.color,
  }) : super(key: key);
  final String title;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: kDefaultSize * 2.2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kDefaultSize * 3),
            color: color),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                color: Colors.white,
                fontSize: kDefaultSize * .7,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class LoginTextField extends StatelessWidget {
  const LoginTextField({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(kDefaultSize * .8),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey[200]!),
        ),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: title,
          border: InputBorder.none,
          hintStyle: TextStyle(color: kGreyColor),
        ),
      ),
    );
  }
}

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(kDefaultSize),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Login",
            style: TextStyle(color: Colors.white, fontSize: kDefaultSize * 2),
          ),
          SizedBox(height: kDefaultSize / 2),
          Text(
            "Welcome Back",
            style: TextStyle(color: Colors.white, fontSize: kDefaultSize * .8),
          )
        ],
      ),
    );
  }
}
