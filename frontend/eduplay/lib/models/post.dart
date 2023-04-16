// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

Post postFromJson(String str) => Post.fromJson(json.decode(str));

String postToJson(Post data) => json.encode(data.toJson());

class Post {
  Post({
    required this.users,
  });

  List<User> users;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        users: List<User>.from(json["users"].map((x) => User.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "users": List<dynamic>.from(users.map((x) => x.toJson())),
      };
}

class User {
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.zenCoins,
    required this.v,
  });

  String id;
  String name;
  String email;
  String password;
  int zenCoins;
  int v;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        zenCoins: json["zenCoins"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "password": password,
        "zenCoins": zenCoins,
        "__v": v,
      };
}
