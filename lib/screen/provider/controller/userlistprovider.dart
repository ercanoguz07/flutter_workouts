import 'package:flutter/cupertino.dart';
import 'package:flutter_workouts/screen/provider/model/userlistobject1.dart';

class UserProvider with ChangeNotifier {
  List<UserlistObject1>? _userlist;

  List<UserlistObject1> getUserList() => _userlist ?? [];

  addUser(UserlistObject1 user) {
    if (_userlist == null) _userlist = [];
    _userlist!.add(user);
    notifyListeners();
  }
}
