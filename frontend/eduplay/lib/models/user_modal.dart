// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  final String name;
  final String email;
  // final String password;
  late final int zenCoins;
  final int sportActivity;
  final int studyActivity;
  final int otherActivity;

  User({
    required this.name,
    required this.email,
    // required this.password,
    this.zenCoins = 0,
    this.studyActivity = 0,
    this.sportActivity = 0,
    this.otherActivity = 0,
  });

  User copyWith({
    String? name,
    String? email,
    String? password,
    int? zenCoins,
    int? sportActivity,
    int? studyActivity,
    int? otherActivity,
  }) {
    return User(
      name: name ?? this.name,
      email: email ?? this.email,
      // password: password ?? this.password,
      zenCoins: zenCoins ?? this.zenCoins,
      sportActivity: sportActivity ?? this.sportActivity,
      studyActivity: studyActivity ?? this.studyActivity,
      otherActivity: otherActivity ?? this.otherActivity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      // 'password': password,
      'zenCoins': zenCoins,
      'sportActivity': sportActivity,
      'studyActivity': studyActivity,
      'otherActivity': otherActivity,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] as String,
      email: map['email'] as String,
      // password: map['password'] as String,
      zenCoins: map['zenCoins'] as int,
      sportActivity: map['sportActivity'] as int,
      studyActivity: map['studyActivity'] as int,
      otherActivity: map['otherActivity'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(name: $name, email: $email, zenCoins: $zenCoins, sportActivity: $sportActivity, studyActivity: $studyActivity, otherActivity: $otherActivity)';
  }
}
