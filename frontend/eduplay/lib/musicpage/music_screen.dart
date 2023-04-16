import 'package:flutter/material.dart';
import 'package:zenith/games/custom_button.dart';
import 'package:zenith/globalvariables.dart';

import 'music.dart';

class MusicScreen extends StatefulWidget {
  @override
  State<MusicScreen> createState() => _MusicScreen();
}

class _MusicScreen extends State<MusicScreen> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalVariables.backgroundColor,
        title: Text(
          "Meditation",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(left: 30, right: 30, bottom: 20, top: 10),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              color: GlobalVariables.backgroundColor,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    const Center(
                      child: Text(
                        "Meditation",
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    AltButton(
                      imagePath: "assets/pic1.png",
                      destination: music(
                        a: 'm1.mp3',
                        b: 'assets/pic1.png',
                        c: 'Meditation music',
                        d: 'Mindful Meditation',
                      ),
                      title: "Nature",
                    ),
                    AltButton(
                      imagePath: "assets/pic2.png",
                      destination: music(
                        a: 'm2.mp3',
                        b: 'assets/pic2.png',
                        c: 'Meditation music',
                        d: 'Spiritual',
                      ),
                      title: "Chants",
                    ),
                    AltButton(
                      imagePath: "assets/pic3.jpg",
                      destination: music(
                        a: 'm3.mp3',
                        b: 'assets/pic3.jpg',
                        c: 'Meditation music',
                        d: 'Focused Meditation',
                      ),
                      title: "Pranayam",
                    ),
                    AltButton(
                      imagePath: "assets/pic4.jpg",
                      destination: music(
                        a: 'm4.mp3',
                        b: 'assets/pic4.jpg',
                        c: 'Meditation music',
                        d: 'Progressive Relaxation',
                      ),
                      title: "Instrumental",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ]),
            ),
          )),
    );
  }
}
