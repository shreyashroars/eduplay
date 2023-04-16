import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zenith/globalvariables.dart';
import 'package:zenith/utils/emotion_face.dart';

class LeaderBoardTile extends StatelessWidget {
  String? userId;
  String? name;
  int? zenCoins;
  int? index;
  LeaderBoardTile({this.userId, this.name, this.zenCoins, this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          index! <= 2
              ? index == 0
                  ? emotionface(emoji: "🥇")
                  : index == 1
                      ? emotionface(emoji: "🥈")
                      : emotionface(emoji: "🥉")
              : Icon(
                  Icons.person,
                  color: Colors.green,
                ),
          Text(
            name!,
            style:
                GoogleFonts.poppins(textStyle: GlobalVariables.textstylesmall),
          ),
          Row(
            children: [
              Icon(
                Icons.local_fire_department_rounded,
                color: Colors.red,
              ),
              Text(zenCoins.toString()),
            ],
          )
        ],
      ),
      height: MediaQuery.of(context).size.height * 0.10,
      decoration: BoxDecoration(
          border: Border.all(width: 2),
          borderRadius: BorderRadius.circular(35),
          color: GlobalVariables.lightsecondaryColor),
    );
  }
}
