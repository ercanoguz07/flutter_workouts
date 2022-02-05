import 'package:flutter/material.dart';
import 'package:flutter_workouts/constants.dart';
import 'package:flutter_workouts/screen/component/workoutswidget.dart';
import 'package:flutter_workouts/screen/provider/adduserscreen.dart';
import 'package:flutter_workouts/screen/provider/controller/userlistprovider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class UseListScreen extends StatefulWidget {
  const UseListScreen({Key? key}) : super(key: key);

  @override
  _UseListScreenState createState() => _UseListScreenState();
}

class _UseListScreenState extends State<UseListScreen> {
  @override
  Widget build(BuildContext context) {
    return WorkOutsWidget(
      isSeconPage: false,
      headTitle: AppLocalizations.of(context)!.userlist,
      headSubtitle: AppLocalizations.of(context)!.alluser,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: kDefaultSize * 5,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddUserScreen(),
                    ),
                  );
                },
                style: ButtonStyle(
                    elevation: MaterialStateProperty.all(4),
                    backgroundColor: MaterialStateProperty.all(kRedColor)),
                child: Row(
                  children: [
                    Icon(Icons.add),
                    Text(AppLocalizations.of(context)!.adduse),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: kDefaultSize),
          Container(
            decoration: boxShadowBoxDecor,
            child: Column(
              children: [
                Container(
                  height: kDefaultSize * 2,
                  margin: EdgeInsets.only(top: kDefaultSize / 4),
                  decoration: boxShadowBoxDecor.copyWith(boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.2),
                      blurRadius: 2,
                      offset: Offset(0, kDefaultSize / 4),
                    ),
                  ]),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Center(
                          child: Text(
                            AppLocalizations.of(context)!.name,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Center(
                            child: Text(AppLocalizations.of(context)!.fullname,
                                style: TextStyle(fontWeight: FontWeight.bold))),
                      ),
                      Expanded(
                        flex: 1,
                        child: Center(
                            child: Text(AppLocalizations.of(context)!.country,
                                style: TextStyle(fontWeight: FontWeight.bold))),
                      ),
                    ],
                  ),
                ),
                Container(
                  constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * .50),
                  child: Consumer<UserProvider>(
                    builder: (context, value, child) {
                      return ListView.builder(
                        itemCount: value.getUserList().length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            tileColor: Colors.transparent,
                            title: UserDataTableRow(
                              name: value.getUserList()[index].name!,
                              lastname: value.getUserList()[index].lastname!,
                              age: value.getUserList()[index].country!,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class UserDataTableRow extends StatelessWidget {
  const UserDataTableRow({
    Key? key,
    required this.name,
    required this.lastname,
    required this.age,
  }) : super(key: key);
  final String name;
  final String lastname;
  final String age;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: UserDataColum(
            title: name,
          ),
        ),
        Expanded(
          flex: 2,
          child: UserDataColum(
            title: lastname,
          ),
        ),
        Expanded(
          flex: 1,
          child: UserDataColum(
            title: age.toString(),
          ),
        ),
      ],
    );
  }
}

class UserDataColum extends StatelessWidget {
  const UserDataColum({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(kDefaultSize * .5),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey[200]!),
        ),
      ),
      child: Center(child: Text(title)),
    );
  }
}
