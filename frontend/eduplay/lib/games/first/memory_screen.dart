import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zenith/games/first/counter.dart';
import 'package:zenith/games/first/memory_game_new.dart';
import 'package:zenith/globalvariables.dart';

class GameHome extends StatelessWidget {
  const GameHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: GlobalVariables.backgroundColor,
          foregroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            "Test your memory",
            style: TextStyle(color: Colors.black, fontSize: 25),
          ),
        ),
        body: ChangeNotifierProvider<Counter>(
          create: (context) => Counter(),
          child: const MemoryGame1(),
        ));
  }
}
