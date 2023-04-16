import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zenith/globalvariables.dart';
import 'package:percent_indicator/percent_indicator.dart';

class progress extends StatelessWidget {
  progress();

  @override
  Widget build(BuildContext context) {
 //   return CircularPercentIndicator(
 //     radius: 30.0,
   //   animation: true,
     // animationDuration: 1200,
    //  lineWidth: 10.0,
     // percent: GlobalVariables.taskdone / GlobalVariables.total_task,
   //   circularStrokeCap: CircularStrokeCap.butt,
   //   backgroundColor: GlobalVariables.backgroundColor,
     // progressColor: GlobalVariables.lightsecondaryColor,
    return TweenAnimationBuilder(
      tween: Tween(begin: 0.0, end: 0.37),
      duration: Duration(seconds: 2),
      builder: (context, value, child) => SizedBox(
        height: MediaQuery.of(context).size.height * 0.05,
        width: MediaQuery.of(context).size.width * 0.1,
        child: CircularProgressIndicator(
          value: value,
          color: GlobalVariables.progresColor,
          backgroundColor: GlobalVariables.backgroundColor,
          strokeWidth: 10,
        ),
      ),
    );
  }
}
