import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zenith/globalvariables.dart';

import '../models/scheduleModel.dart';

class tile1 extends StatefulWidget {
  final String task;
  final String description;
  final String starttime;
  final String endtime;
  final int indi;
  Key? key;
  final double totaltask;
  tile1({
    this.key,
    required this.totaltask,
    required this.task,
    required this.description,
    required this.starttime,
    required this.endtime,
    required this.indi,
  });

  @override
  State<tile1> createState() => _tile1State();
}

class _tile1State extends State<tile1> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 26, right: 10, left: 10),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 5.0,
              ),
            ],
            color: widget.indi % 2 == 0
                ? GlobalVariables.backgroundColortile
                : GlobalVariables.secondaryColortile,
            borderRadius: BorderRadius.circular(25)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: widget.indi % 2 == 0
                          ? GlobalVariables.secondaryColor
                          : GlobalVariables.backgroundColor,
                      borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.all(16),
                  //
                  child: widget.task == 'assignment'
                      ? Icon(CupertinoIcons.pen)
                      : widget.task == 'study'
                          ? Icon(CupertinoIcons.book)
                          : widget.task == 'sports'
                              ? Icon(CupertinoIcons.sportscourt)
                              : widget.task == 'hobby'
                                  ? Icon(CupertinoIcons.hand_draw)
                                  : widget.task == 'sleep'
                                      ? Icon(CupertinoIcons.moon_zzz)
                                      : Icon(CupertinoIcons.clock),
                ),

                ///
                ////
                ///
                ///
                ///
                const SizedBox(
                  width: 20,
                ),
                SizedBox(
                  width: 90,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.task,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.description,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ],
                  ),
                ),
                // SizedBox(
                //   width: ,
                // ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Start Time',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          widget.starttime.length < 4
                              ? widget.starttime.length < 3
                                  ? "00" + ":" + widget.starttime
                                  : "0" +
                                      widget.starttime.substring(0, 1) +
                                      ":" +
                                      widget.starttime.substring(1)
                              : widget.starttime.substring(0, 2) +
                                  ":" +
                                  widget.starttime.substring(2, 4),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'End Time',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          widget.endtime.length < 4
                              ? widget.endtime.length < 3
                                  ? "00" + ":" + widget.endtime
                                  : "0" +
                                      widget.endtime.substring(0, 1) +
                                      ":" +
                                      widget.endtime.substring(1)
                              : widget.endtime.substring(0, 2) +
                                  ":" +
                                  widget.endtime.substring(2, 4),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
