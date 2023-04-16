import 'package:flutter/material.dart';
import 'package:zenith/games/game_screen.dart';
import 'package:zenith/globalvariables.dart';
import 'package:zenith/musicpage/music.dart';
import 'package:zenith/musicpage/music_screen.dart';
import 'package:zenith/pages/community_page.dart';
import 'package:zenith/pages/form_page.dart';
import 'package:zenith/pages/homepage.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:zenith/pages/leaderboard.dart';
import 'package:zenith/pages/profilePage.dart';
import 'package:zenith/pages/retentionpage.dart';
import 'package:zenith/yoga/yoga_home.dart';

class body_page extends StatefulWidget {
  const body_page({super.key});

  @override
  State<body_page> createState() => _body_pageState();
}

class _body_pageState extends State<body_page> {
  int _selectedPage = 0;

  final _pageOptions = [
    leaderboard(),
    const Community(),
    HomePage(),
    AddForm(),
    retention(),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: _pageOptions[_selectedPage],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: GlobalVariables.backgroundColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            //color: Colors.blue[800],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: GNav(
                // type: BottomNavigationBarType.fixed,
                backgroundColor: GlobalVariables.backgroundColor,
                color: Colors.white,
                activeColor: GlobalVariables.progresColor,
                tabBackgroundColor: GlobalVariables.secondaryColor,
                selectedIndex: _selectedPage,
                padding: EdgeInsets.all(18),
                iconSize: 20,
                //textSize: 3,
                gap: 5,
                tabs: [
                  GButton(
                    icon: Icons.leaderboard,
                    text: "Leader",
                  ),
                  GButton(
                    icon: Icons.chat,
                    text: "Community",
                  ),
                  GButton(
                    icon: Icons.home,
                    text: "Home",
                  ),
                  GButton(
                    icon: Icons.add,
                    text: "Add Task",
                  ),
                  GButton(
                    icon: Icons.pages,
                    text: "Retention",
                  ),
                ],
                onTabChange: (int index) {
                  setState(() {
                    _selectedPage = index;
                  });
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
