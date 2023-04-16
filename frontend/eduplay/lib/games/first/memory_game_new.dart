import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:zenith/games/first/counter.dart';
import 'package:zenith/games/first/tile.dart';

import '../../utils/emotion_face.dart';
import '../../utils/snackbar.dart';

class MemoryGame1 extends StatefulWidget {
  const MemoryGame1({Key? key}) : super(key: key);

  @override
  State<MemoryGame1> createState() => _MemoryGame1State();
}

class _MemoryGame1State extends State<MemoryGame1> {
  @override
  List<Tile> grid = [];
  int _totalNumOfTiles = 9;
  List<int> _numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  var counter;

  List<Tile> generateTiles() {
    grid.clear();
    List<Tile> gridTiles = [];
    _numbers.shuffle();
    for (int i = 0; i < _totalNumOfTiles; i++) {
      gridTiles.add(Tile(id: _numbers[i], selected: false));
    }

    grid = gridTiles;
    return gridTiles;
  }

  @override
  void initState() {
    super.initState();
    grid = generateTiles();
  }

  @override
  void dispose() {
    Countdown;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    counter = Provider.of<Counter>(context);
    return Container(
      padding: EdgeInsets.all(30),
      child: Consumer<Counter>(
        builder: (_, counter, __) => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              "Tap the numbers in order (from 1 to 9)",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                  fontSize: 25),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Next number to press : ${counter.getCounter < 0 ? 1 : counter.getCounter + 1}",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey.shade700, fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                GridView(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  children: counter.getCounter < 0 ? generateTiles() : grid,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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

                // Text(
                //   "Time Left : ${_showSecs}",
                //   textAlign: TextAlign.center,
                //   style: TextStyle(color: Colors.grey.shade700, fontSize: 20),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
