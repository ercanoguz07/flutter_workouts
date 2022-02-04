import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_workouts/screen/profile/profilescreen.dart';
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
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(kDefaultSize),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Bounce(
                          duration: kBounceDuration,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProfileScreen(),
                              ),
                            );
                          },
                          child: Container(
                            height: kDefaultSize * 5,
                            decoration: boxShadowBoxDecor,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.person,
                                    size: kDefaultSize * 1.2,
                                    color: kBlueColor),
                                SizedBox(
                                  width: kDefaultSize / 4,
                                ),
                                Text(
                                  AppLocalizations.of(context)!.profile,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: kDefaultSize * 1.2),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: kDefaultSize * 1.2),
                      Expanded(
                        child: Bounce(
                          duration: kBounceDuration,
                          onPressed: () {},
                          child: Container(
                            height: kDefaultSize * 5,
                            decoration: boxShadowBoxDecor,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.settings,
                                    size: kDefaultSize * 1.2,
                                    color: kBlueColor),
                                SizedBox(
                                  width: kDefaultSize / 4,
                                ),
                                Text(
                                  AppLocalizations.of(context)!.setting,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: kDefaultSize * 1.2),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
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
