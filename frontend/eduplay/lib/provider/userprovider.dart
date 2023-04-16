import 'package:flutter/material.dart';
import 'package:zenith/models/user_modal.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
    name: '',
    email: '',
    // password: '',
    zenCoins: 0,
    sportActivity: 0,
    studyActivity: 0,
    otherActivity: 0,
  );

  User get user => _user;

  void setUser(String user) {
    print(user);
    _user = User.fromJson(user);
    notifyListeners();
  }

  void setUserFromModel(User user) {
    // print(user.name);
    _user = user;
    notifyListeners();
  }
}
