import 'package:flutter/material.dart';
import 'package:chips_choice_null_safety/chips_choice_null_safety.dart';

class FlutterChipsTag extends StatefulWidget {
  const FlutterChipsTag({super.key});

  @override
  State<FlutterChipsTag> createState() => _FlutterChipsTagState();
}

class _FlutterChipsTagState extends State<FlutterChipsTag> {
  int tag = 1;
  List<String> tags = [];
  List<String> options = ['flexible', 'morning', 'afternoon', 'evening'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ChipsChoice.single(
          value: tag,
          onChanged: (val) => setState(() => tag = val),
          choiceItems: C2Choice.listFrom(
              source: options, value: (i, v) => i, label: (i, v) => v),
          choiceActiveStyle: C2ChoiceStyle(
            color: Colors.red,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          choiceStyle: C2ChoiceStyle(color: Colors.black),
          wrapped: true,
          textDirection: TextDirection.ltr),
    );
  }
}
