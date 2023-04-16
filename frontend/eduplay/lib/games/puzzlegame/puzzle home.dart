import 'package:flutter/cupertino.dart';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:zenith/games/custom_button.dart';
import 'package:zenith/globalvariables.dart';

import '../../utils/emotion_face.dart';
import '../../utils/snackbar.dart';
import 'level_transition/level_end_transition.dart';
import 'data/board_config.dart';
import 'puzzle/puzzle_level.dart';
import 'tutorial/tutorial_dialog.dart';

int popo = 0;

class puz extends StatefulWidget {
  const puz({Key? key}) : super(key: key);

  @override
  State<puz> createState() => _puz();
}

class _puz extends State<puz> with TickerProviderStateMixin {
  @override
  void initState() {
    popo = 0;
  }

  @override
  void dispose() {
    Countdown;
    // TODO: implement dispose
    super.dispose();
  }
  //late final _backdropController = BackdropController();

  late final _levelBeginController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 500),
  );

  // Controls the level exit animation.
  late final _levelEndController = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 2),
  );

  int _currentLevel = 0;

  bool _hideTexts = false;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final unitSize = min(screenSize.width / 6, screenSize.height / 8);
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: GlobalVariables.backgroundColor,
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Puzzle game",
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GradientContainer(
            child: BoardConfig(
              unitSize: unitSize,
              hideTexts: _hideTexts,
              child: Stack(
                children: [
                  if (_currentLevel == 0)
                    TutorialDialog(
                      onDismiss: (bool hideTexts) {
                        setState(() => _hideTexts = hideTexts);
                        _advanceToNextLevel();
                      },
                    ),
                  if (_currentLevel > 0)
                    Center(
                      child: ScaleTransition(
                        scale: CurveTween(curve: Curves.easeOut)
                            .animate(_levelBeginController),
                        child: LevelEndTransition(
                          animation: _levelEndController,
                          child: PuzzleLevel(
                            // A single level of the puzzle.
                            key: ValueKey(_currentLevel),
                            level: _currentLevel,
                            onWin: _onLevelCompleted,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // emotionface(emoji: "⌛"),
              Container(
                height: 80,
                child: ClipRRect(
                    child: Lottie.asset(
                        fit: BoxFit.cover, 'assets/lottie/timer.json')),
              ),
              SizedBox(
                width: 10,
              ),
              Countdown(
                seconds: 120,
                build: (BuildContext context, double time) => Text(
                  time.toString() + " s",
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          color: Colors.red)),
                ),
                interval: Duration(milliseconds: 100),
                onFinished: () {
                  ShowSnakBar(
                      context: context,
                      content: "Play Time Over, Please Come Later");
                  Navigator.of(context).pop();
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  void _advanceToNextLevel() {
    _levelBeginController.forward(from: 0.0);
    setState(() {
      if (_currentLevel == 6 || _currentLevel == 5) {
        popo = popo + 25;
      } else if (_currentLevel == 4) {
        popo = popo + 20;
      } else if (_currentLevel == 3) {
        popo = popo + 15;
      } else if (_currentLevel == 2) {
        popo = popo + 10;
      } else {
        popo = popo + 5;
      }
      _currentLevel++;
    });
  }

  void _onLevelCompleted(int level, int steps) async {
    // Make the background colorful.
    //_backdropController.celebrate();
    // Play animation: game board falling down and 3D piece spinning.
    await _levelEndController.forward();
    // Take a short break at the empty screen.
    await Future.delayed(const Duration(milliseconds: 300));
    // Reset the animation controller for the next time.
    _levelEndController.reset();
    // Continue on to the next level.
    _advanceToNextLevel();
  }
}
