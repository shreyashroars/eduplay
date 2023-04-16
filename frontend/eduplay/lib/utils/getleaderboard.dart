import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/userModal.dart';
import 'package:http/http.dart' as http;

import '../pages/form_page.dart';

class GetLeaderBoard {
  List<UserModal> users = [];
  Future<void> getData() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');
      if (token == null) {
        prefs.setString('x-auth-token', '');
      }
      var res = await http.get(
        Uri.parse('${url}api/v1/get/friends'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "Bearer " + token!
        },
      );
      // var Url = Uri.parse('${url}api/v1/all/user');
      // var response = await http.get(Url);
      var jsonData = jsonDecode(res.body);
      // print(jsonData);
      if (jsonData['status'] == 200) {
        jsonData['friends'].forEach((element) {
          UserModal userModel = UserModal(
              userId: element['userId'],
              name: element['name'],
              zenCoins: element['zenCoins']);
          users.add(userModel);
          print(userModel);
        });
      }
      // }
      users.sort(mySortComparison);
    } catch (e) {
      print("Not fetched leaderboard");
    }
  }

  int mySortComparison(UserModal a, UserModal b) {
    int propertyA = a.zenCoins!;
    int propertyB = b.zenCoins!;
    if (propertyA > propertyB) {
      return -1;
    } else if (propertyA < propertyB) {
      return 1;
    } else {
      return 0;
    }
  }
}
