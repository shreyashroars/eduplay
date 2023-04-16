import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../globalvariables.dart';

void ShowSnakBar({required BuildContext context, required String content}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: GlobalVariables.selectedNavBarColor,
      behavior: SnackBarBehavior.floating,
      content: Text(content),
    ),
  );
}
