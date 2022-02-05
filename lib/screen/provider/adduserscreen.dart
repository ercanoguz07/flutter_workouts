import 'package:flutter/material.dart';
import 'package:flutter_workouts/screen/component/workoutswidget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_workouts/screen/provider/controller/userlistprovider.dart';
import 'package:flutter_workouts/screen/provider/model/userlistobject1.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';

class AddUserScreen extends StatefulWidget {
  const AddUserScreen({Key? key}) : super(key: key);

  @override
  _AddUserScreenState createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  TextEditingController? nameController;
  TextEditingController? lastnameController;
  TextEditingController? countryController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    lastnameController = TextEditingController();
    countryController = TextEditingController();
  }

  @override
  void dispose() {
    nameController!.dispose();
    lastnameController!.dispose();
    countryController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    return WorkOutsWidget(
      headTitle: AppLocalizations.of(context)!.adduse,
      headSubtitle: "",
      child: Container(
        decoration: borderTopLRBoxDec,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: boxShadowBoxDecor,
              child: Column(
                children: [
                  UserTextField(
                      controller: nameController!,
                      title: AppLocalizations.of(context)!.name),
                  UserTextField(
                      controller: lastnameController!,
                      title: AppLocalizations.of(context)!.fullname),
                  UserTextField(
                      controller: countryController!,
                      title: AppLocalizations.of(context)!.country),
                  SizedBox(height: kDefaultSize),
                  InkWell(
                    onTap: () {
                      UserlistObject1 user = UserlistObject1();
                      user
                        ..name = nameController!.text.toString()
                        ..lastname = lastnameController!.text.toString()
                        ..country = countryController!.text.toString();
                      userProvider.addUser(user);
                      Navigator.pop(context);
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: kDefaultSize),
                      height: kDefaultSize * 2.4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(kDefaultSize * 2),
                          color: kRedColor),
                      child: Center(
                        child: Text(
                          AppLocalizations.of(context)!.save,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: kDefaultSize,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: kDefaultSize),
                ],
              ),
            ),
          ],
        ),
      ),
      isSeconPage: true,
    );
  }
}

class UserTextField extends StatelessWidget {
  const UserTextField({
    Key? key,
    required this.title,
    required this.controller,
  }) : super(key: key);
  final String title;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(kDefaultSize * .4),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey[200]!),
        ),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: title,
          border: InputBorder.none,
          hintStyle: TextStyle(color: kGreyColor),
        ),
      ),
    );
  }
}
