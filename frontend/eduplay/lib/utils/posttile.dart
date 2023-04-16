import 'package:flutter/material.dart';
import 'package:zenith/globalvariables.dart';

class PostTile extends StatelessWidget {
  String? img;
  String? title;
  String? uuid;
  PostTile({this.img, this.title, this.uuid, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Container(
                  //color: GlobalVariables.backgroundColor,
                  // padding: EdgeInsets.only(left: 10),
                  height: 200,
                  width: 270,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5.0),
                        topRight: Radius.circular(20.0),
                        bottomLeft: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0),
                      ),
                      color: GlobalVariables.secondaryColor
                      // gradient: const LinearGradient(
                      //   colors: [
                      //     GlobalVariables.backgroundColor,
                      //     GlobalVariables.secondaryColor
                      //   ],
                      //   begin: Alignment.bottomLeft,
                      //   end: Alignment.topRight,
                      //   stops: [0.4, 0.7],
                      //   tileMode: TileMode.repeated,
                      // ),
                      ),
                  child: Container(
                    padding: EdgeInsets.only(top: 5, left: 10),
                    child: Text(
                      title!,
                      style: TextStyle(fontSize: 28, color: Colors.grey[300]),
                    ),
                  )),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          //Container(child: ClipRRect(child: Image.network(img!))),
        ],
      ),
    );
  }
}
