import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:zenith/pages/bodypage.dart';

import 'maths_lesson.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> subjects = [
      'Maths',
      'Physics',
      'Chemistry',
      'Biology',
      'Competetive Exams',
      'Previous Year Papers'
    ];
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => body_page())),
              icon: Icon(Icons.flutter_dash_outlined))
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 158, 205, 243),
              ), //BoxDecoration
              child: UserAccountsDrawerHeader(
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 158, 205, 243)),
                accountName: Text(
                  "Yash Pandey",
                  style: TextStyle(fontSize: 18),
                ),
                accountEmail: Text("yash123@gmail.com"),
                currentAccountPictureSize: Size.square(50),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 167, 210, 245),
                  child: Text(
                    "Y",
                    style: TextStyle(fontSize: 30.0, color: Colors.blue),
                  ), //Text
                ), //circleAvatar
              ), //UserAccountDrawerHeader
            ), //DrawerHeader
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text(' My Profile '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.book),
              title: const Text(' My Course '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.workspace_premium),
              title: const Text(' Go Premium '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.video_label),
              title: const Text(' Saved Videos '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text(' Edit Profile '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('LogOut'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                'Subjects',
                style: GoogleFonts.poppins(
                    textStyle:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MathsLesson(),
                        )),
                        child: Container(
                          height: 130,
                          child: Column(
                            children: [
                              Container(
                                height: 80,
                                width: 80,
                                child: ClipRRect(
                                    child: Lottie.asset(
                                  'assets/lottie/maths.json',
                                )
                                    //   child: SvgPicture.asset(
                                    //       fit: BoxFit.cover,
                                    //       'assets/icons/maths-technology.svg'),
                                    ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text('Maths')
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 130,
                        child: Column(
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              child: ClipRRect(
                                child: Lottie.asset(
                                    fit: BoxFit.cover,
                                    'assets/lottie/physics.json'),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Physics')
                          ],
                        ),
                      ),
                      Container(
                        height: 130,
                        child: Column(
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              child: ClipRRect(
                                child: Lottie.asset(
                                    fit: BoxFit.cover,
                                    'assets/lottie/chemistry.json'),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Chemistry')
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 130,
                        child: Column(
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              child: ClipRRect(
                                child: Lottie.asset(
                                    fit: BoxFit.cover,
                                    'assets/lottie/biology.json'),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Biology')
                          ],
                        ),
                      ),
                      Container(
                        height: 130,
                        child: Column(
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              child: ClipRRect(
                                child: Lottie.asset(
                                    fit: BoxFit.cover,
                                    'assets/lottie/ex1.json'),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Competetive Exams')
                          ],
                        ),
                      ),
                      Container(
                        height: 130,
                        child: Column(
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              child: ClipRRect(
                                child: Lottie.asset(
                                    fit: BoxFit.cover,
                                    'assets/lottie/ex2.json'),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('PYQ')
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Nearest Centre',
                          style: GoogleFonts.poppins(
                              textStyle:
                                  TextStyle(fontWeight: FontWeight.bold)),
                        )),
                    Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 244, 223, 248),
                            borderRadius: BorderRadius.circular(12)),
                        margin: EdgeInsets.all(5),
                        child: Row(
                          children: [
                            Container(
                              height: 100,
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Center(
                                child: ClipRRect(
                                    child: Lottie.asset(
                                        fit: BoxFit.cover,
                                        'assets/lottie/store.json')),
                              ),
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Text(
                                    'Find Nearest Centre',
                                    style: GoogleFonts.poppins(),
                                  ),
                                  ElevatedButton(
                                      onPressed: () {},
                                      child: Text('Show me where'))
                                ],
                              ),
                            )
                          ],
                        )),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Talk to Counselor',
                          style: GoogleFonts.poppins(
                              textStyle:
                                  TextStyle(fontWeight: FontWeight.bold)),
                        )),
                    Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 244, 223, 248),
                            borderRadius: BorderRadius.circular(12)),
                        margin: EdgeInsets.all(5),
                        height: 90,
                        child: Row(
                          children: [
                            Container(
                              child: Center(
                                  child: ClipRRect(
                                child:
                                    Lottie.asset('assets/lottie/doubts.json'),
                              )),
                              height: 100,
                              width: MediaQuery.of(context).size.width * 0.4,
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 15),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Have Questions?',
                                      style: GoogleFonts.poppins(),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      //padding: EdgeInsets.only(left: 20),
                                      width: 150,
                                      child: Text(
                                        'To know about our scholarships and more',
                                        softWrap: true,
                                      ),
                                    ),
                                  ]),
                            )
                          ],
                        )),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Speak to Us',
                          style: GoogleFonts.poppins(
                              textStyle:
                                  TextStyle(fontWeight: FontWeight.bold)),
                        )),
                    Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 244, 223, 248),
                            borderRadius: BorderRadius.circular(12)),
                        padding: EdgeInsets.all(8),
                        margin: EdgeInsets.all(5),
                        height: 90,
                        child: Row(
                          children: [
                            Container(
                              height: 100,
                              child: Center(
                                  child: ClipRRect(
                                child: Lottie.asset('assets/lottie/speak.json'),
                              )),
                              width: MediaQuery.of(context).size.width * 0.4,
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 6),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Have Queries?',
                                      style: GoogleFonts.poppins(),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      // padding: EdgeInsets.only(left: 20),
                                      width: 150,
                                      child: Text(
                                        'To know about our scholarships and more',
                                        softWrap: true,
                                      ),
                                    ),
                                  ]),
                            )
                          ],
                        )),
                    Container(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Share the App',
                          style: GoogleFonts.poppins(
                              textStyle:
                                  TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        IconButton(onPressed: () {}, icon: Icon(Icons.share)),
                      ],
                    ))
                  ])
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
