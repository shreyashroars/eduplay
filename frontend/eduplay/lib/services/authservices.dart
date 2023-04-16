import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AuthService {
  final url = GlobalVariables.baseUrl;
  Future<void> signUp({
    required context,
    required name,
    required email,
  }) async {
    try {
      User user = User(
        name: name,
        email: email,
        // password: password,
      );
      print("hh");
      final res = await http.post(Uri.parse('${url}api/v1/create/user'),
          body: user.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });

      if (res.statusCode == 200) {
        //print(res.body);
        // print(res.body);
        print(jsonDecode(res.body)['user']);
        var data = jsonDecode(res.body)['user'];
        SharedPreferences prefs = await SharedPreferences.getInstance();
        User user = User(
          name: data['name'],
          email: data['email'],
          // password: data['password'],
          sportActivity: data['sportActivity'],
          studyActivity: data['studyActivity'],
          otherActivity: data['otherActivity'],
          zenCoins: data['zenCoins'],
        );
        Provider.of<UserProvider>(context, listen: false)
            .setUserFromModel(user);
        await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => body_page(),
          ),
          (route) => false,
        );
      } else {
        ShowSnakBar(
          context: context,
          content: res.body,
        );
      }
    } catch (e) {
      ShowSnakBar(context: context, content: e.toString());
    }
  }

  Future<void> signin({
    required context,
    required email,
  }) async {
    var body = jsonEncode({
      "email": email,
    });
    print(body);
    try {
      final res = await http.post(Uri.parse('${url}api/v1/signin/user'),
          body: body,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
      //print(res.body);
      if (res.statusCode == 200) {
        // print(jsonDecode(res.body)['user']);
        var data = jsonDecode(res.body)['user'];
        print(data);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        User user = User(
          name: data['name'],
          email: data['email'],
          // password: data['password'],
          sportActivity: data['sportActivity'],
          studyActivity: data['studyActivity'],
          otherActivity: data['otherActivity'],
          zenCoins: data['zenCoins'],
        );
        Provider.of<UserProvider>(context, listen: false)
            .setUserFromModel(user);
        await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => body_page(),
          ),
          (route) => false,
        );
      } else {
        ShowSnakBar(
          context: context,
          content: res.body,
        );
      }
    } catch (e) {
      ShowSnakBar(context: context, content: e.toString());
    }
  }

  void getUser(
    BuildContext context,
  ) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');
      if (token == null) {
        prefs.setString('x-auth-token', '');
      }
      var res = await http.get(
        Uri.parse('${url}api/v1/get/user'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "Bearer " + token!
        },
      );
      print(res.body);
      var userProvider = Provider.of<UserProvider>(context, listen: false);
      var data = jsonDecode(res.body)['user'];
      User user = User(
        name: data['name'],
        email: data['email'],
        // password: data['password'],
        zenCoins: data['zenCoins'],
        studyActivity: data['studyActivity'],
        sportActivity: data['sportActivity'],
        otherActivity: data['otherActivity'],
      );
      Provider.of<UserProvider>(context, listen: false).setUserFromModel(user);
    } catch (e) {
      // ShowSnakBar(context: context, content: e.toString());
      print(e.toString());
    }
  }
}
