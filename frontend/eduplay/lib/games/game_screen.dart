import 'package:flutter/material.dart';

import 'package:zenith/games/custom_button.dart';
import 'package:zenith/games/first/memory_screen.dart';
import 'package:zenith/games/puzzlegame/puzzle%20home.dart';
import 'package:zenith/globalvariables.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [
      Button(
        imgPath: "assets/game_images/Ani-Mate.jpg",
        destination: GameHome(),
        title: "Ani-Mate",
        subtitle: "Improves memory and association skills",
      ),
      Button(
        imgPath: "assets/CP.png",
        destination: puz(),
        title: "Relieve stress",
        subtitle: "Hand-eye coordination and logical thinking ability",
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalVariables.backgroundColor,
        title: Text('Games'),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(left: 30, right: 30, bottom: 20, top: 10),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            color: GlobalVariables.backgroundColor,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                // const Center(
                //   child: Text(
                //     "Games",
                //     style: TextStyle(
                //         fontSize: 35,
                //         fontWeight: FontWeight.bold,
                //         color: Colors.white),
                //   ),
                // ),
                // ListView.builder(
                //     physics: ClampingScrollPhysics(),
                //     shrinkWrap: true,
                //     itemCount: list.length,
                //     itemBuilder: (context, index) => list[index]),
                ...list
              ],
            ),
          ),
        ),
      ),
    );
  }
}
