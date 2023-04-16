import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Button extends StatelessWidget {
  Widget destination;
  String imgPath;
  String title;
  String? subtitle;
  Widget? trailing;
  Button(
      {required this.imgPath,
      required this.destination,
      required this.title,
      this.subtitle,
      this.trailing});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Theme(
          data: ThemeData(dividerColor: Colors.transparent),
          child: ExpansionTile(
            initiallyExpanded: true,
            collapsedBackgroundColor: Colors.white,
            backgroundColor: Colors.white,
            textColor: Colors.black,
            collapsedTextColor: Colors.black,
            title: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.0), //or 15.0
                  child: Container(
                    height: 100.0,
                    width: 300.0,
                    color: Colors.white,
                    child: Image.asset(imgPath),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Center(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            children: [
              ListTile(
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    subtitle ?? "",
                    style: TextStyle(
                      fontSize: 17,
                      //fontWeight: FontWeight.w500,
                      //color: darkData.dark ? Colors.white : Colors.black,
                    ),
                  ),
                ),
                trailing: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Color(0xff6053BC), width: 2.3),
                    shape: StadiumBorder(),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => destination));
                  },
                  child: const Text(
                    "Play",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xff6053BC),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class GradientContainer extends StatelessWidget {
  Widget child;
  GradientContainer({required this.child});

  var darkData;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      color: Colors.black54,
      child: child,
    );
  }
}

class RegularButton extends StatelessWidget {
  Function() onPressed;
  Widget? leading;
  String title;
  Widget? trailing;
  RegularButton(
      {this.leading,
      required this.onPressed,
      required this.title,
      this.trailing});
  var darkData;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 60),
      child: ListTile(
        tileColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Center(
          child: Text(
            title,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        onTap: onPressed,
        trailing: trailing,
      ),
    );
  }
}

class AltButton extends StatelessWidget {
  final destination;
  String? imagePath;
  final title;
  Widget? trailing;
  AltButton(
      {this.imagePath,
      required this.destination,
      required this.title,
      this.trailing});
  //var darkData;
  @override
  Widget build(BuildContext context) {
    // darkData = Provider.of<DarkMode>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        tileColor: Colors.white,
        onTap: () {
          // if (destination is String) {
          //   Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //           builder: (context) => NewsSection(destination)));
          // } else {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => destination));
          //
        },
        title: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 6,
              ),
              imagePath != null
                  ? Image.asset(
                      imagePath!,
                      height: 100,
                      width: 400,
                      fit: BoxFit.cover,
                    )
                  : Container(),
              const SizedBox(
                height: 6,
              ),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
