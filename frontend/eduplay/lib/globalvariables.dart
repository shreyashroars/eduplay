import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class GlobalVariables {
  static const baseUrl = "http://192.168.243.169:3000/";
  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 29, 201, 192),
      Color.fromARGB(255, 125, 221, 216),
    ],
    stops: [0.5, 1.0],
  );
  static var taskdone = 0.0;
  static var total_task = 1.0;
  static const secondaryColor = Color.fromARGB(255, 95, 191, 161);
  static const backgroundColor = Color(0xFF02aab0);
  static const lightbackgroundColor = Color.fromARGB(255, 156, 219, 221);
  static const lightsecondaryColor = Color.fromARGB(255, 180, 230, 214);
  static const backgroundColortile = Color.fromARGB(255, 124, 216, 219);
  static const secondaryColortile = Color.fromARGB(255, 95, 191, 161);
  static const buttonColortile = Color.fromARGB(255, 164, 163, 226);
  static const textcolor = Colors.black;

  static var selectedNavBarColor = Colors.cyan[800]!;
  static const unselectedNavBarColor = Color.fromARGB(221, 20, 12, 12);

  static const Color progresColor = Color(0xFFddd6f3);
  static const TextStyle textstylehead =
      TextStyle(fontSize: 20, fontWeight: FontWeight.normal);
  static const TextStyle textstylesmall =
      TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500);
}
