import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isObservationPass = true;
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
            ProfileHeader(),
            Expanded(
              child: Container(
                decoration: borderTopLRBoxDec,
                padding: EdgeInsets.symmetric(horizontal: kDefaultSize),
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    Center(
                      child: Stack(
                        children: [
                          Container(
                            height: kDefaultSize * 6,
                            width: kDefaultSize * 6,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage("assets/images/pp1.jpg"),
                                  fit: BoxFit.cover),
                              border: Border.all(
                                  width: kDefaultSize / 5, color: Colors.white),
                              boxShadow: [
                                BoxShadow(
                                  spreadRadius: 2,
                                  color: Colors.black.withOpacity(.1),
                                  blurRadius: kDefaultSize / 2,
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              height: kDefaultSize * 2,
                              width: kDefaultSize * 2,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: kBlueColor,
                                border:
                                    Border.all(width: 4, color: Colors.white),
                              ),
                              child: Icon(Icons.edit, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: kDefaultSize),
                    buildTextField(AppLocalizations.of(context)!.name,
                        AppLocalizations.of(context)!.fullname, false),
                    Divider(color: kGreyColor, height: 2),
                    buildTextField(AppLocalizations.of(context)!.email,
                        AppLocalizations.of(context)!.email, false),
                    Divider(color: kGreyColor, height: 2),
                    buildTextField(AppLocalizations.of(context)!.password,
                        AppLocalizations.of(context)!.profile, true),
                    Divider(color: kGreyColor, height: 2),
                    buildTextField("Location", "Location", false),
                    Divider(color: kGreyColor, height: 2),
                    SizedBox(height: kDefaultSize * 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ProfileButon(
                            color: kGreyColor.withOpacity(.7), title: "Cancel"),
                        SizedBox(width: kDefaultSize),
                        ProfileButon(
                            color: kRedColor.withOpacity(.9), title: "Save"),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  buildTextField(labelText, placeHolder, isPassword) {
    return Padding(
      padding: EdgeInsets.only(top: kDefaultSize),
      child: TextField(
        obscureText: isPassword ? _isObservationPass : false,
        obscuringCharacter: "*",
        decoration: InputDecoration(
          border: InputBorder.none,
          suffix: isPassword
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      _isObservationPass = !_isObservationPass;
                    });
                  },
                  icon: Icon(Icons.remove_red_eye, color: kGreyColor))
              : null,
          contentPadding: EdgeInsets.only(bottom: kDefaultSize / 4),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeHolder,
          hintStyle: TextStyle(
            fontSize: kDefaultSize * .75,
            fontWeight: FontWeight.bold,
            color: kGreyColor,
          ),
        ),
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(kDefaultSize),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios,
                    color: Colors.white, size: kDefaultSize * 1.7),
              ),
              Text(
                AppLocalizations.of(context)!.profile,
                style:
                    TextStyle(color: Colors.white, fontSize: kDefaultSize * 2),
              ),
            ],
          ),
          SizedBox(height: kDefaultSize / 2),
        ],
      ),
    );
  }
}

class ProfileButon extends StatelessWidget {
  const ProfileButon({
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
        height: kDefaultSize * 2.5,
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
