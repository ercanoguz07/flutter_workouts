import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_workouts/screen/profile/profilescreen.dart';
import 'package:flutter_workouts/screen/provider/userlistscreen.dart';
import 'package:flutter_workouts/screen/setting/settingscreen.dart';
import 'package:flutter_workouts/screen/sqflite/sqlitescreen.dart';
import '../../constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: linearBoxDecoration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: kDefaultSize * 2),
            HomeHeader(),
            HomeBody()
          ],
        ),
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: borderTopLRBoxDec,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(kDefaultSize),
              child: Column(
                children: [
                  Wrap(
                    children: [
                      HomeMenuButon(
                          title: "SqfLite",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SqfLiteScreen(),
                              ),
                            );
                          },
                          icon: Icons.image_outlined),
                      SizedBox(width: kDefaultSize * 1.2),
                      HomeMenuButon(
                          title: AppLocalizations.of(context)!.provider,
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UseListScreen(),
                              ),
                            );
                          },
                          icon: Icons.person_add_alt),
                      SizedBox(width: kDefaultSize * 1.2),
                      HomeMenuButon(
                          title: AppLocalizations.of(context)!.profile,
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProfileScreen(),
                              ),
                            );
                          },
                          icon: Icons.person),
                      SizedBox(width: kDefaultSize * 1.2),
                      HomeMenuButon(
                          title: AppLocalizations.of(context)!.setting,
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SettingScreen(),
                              ),
                            );
                          },
                          icon: Icons.settings),
                      SizedBox(height: kDefaultSize),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeMenuButon extends StatelessWidget {
  const HomeMenuButon({
    Key? key,
    required this.title,
    required this.press,
    required this.icon,
  }) : super(key: key);
  final String title;
  final VoidCallback press;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Bounce(
      duration: kBounceDuration,
      onPressed: press,
      child: Container(
        margin: EdgeInsets.only(bottom: kDefaultSize),
        height: kDefaultSize * 5,
        width: MediaQuery.of(context).size.width / 3,
        decoration: boxShadowBoxDecor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: kDefaultSize * 1.2, color: kBlueColor),
            SizedBox(
              width: kDefaultSize / 4,
            ),
            Text(
              title,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: kDefaultSize * 1.2),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeHeader extends StatelessWidget {
  const HomeHeader({
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
            AppLocalizations.of(context)!.home,
            style: TextStyle(color: Colors.white, fontSize: kDefaultSize * 2),
          ),
          SizedBox(height: kDefaultSize / 2),
          Text(
            "Jhon Doe",
            style: TextStyle(color: Colors.white, fontSize: kDefaultSize * .8),
          ),
        ],
      ),
    );
  }
}
