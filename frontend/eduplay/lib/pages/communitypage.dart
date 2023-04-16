import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:eduplay/globalvariables.dart';
import 'package:eduplay/onBoarding/model/communitymodel.dart';
import 'package:eduplay/pages/share_page.dart';
import 'package:eduplay/utils/getcommunity.dart';
import 'package:eduplay/utils/postTile.dart';

class Community extends StatefulWidget {
  const Community({super.key});

  @override
  State<Community> createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  List<CommunityPostModal> posts = [];
  bool _loading = true;
  @override
  void initState() {
    super.initState;
    getData();
  }

  Future<void> getData() async {
    GetCommunity sc = GetCommunity();
    await sc.getData();
    posts = sc.posts;
    setState(() {
      _loading = false;
    });
  }

  List<File> images = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: GlobalVariables.backgroundColor,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SharePage(
                      title: "share to community",
                    ),
                  ),
                );
              },
              icon: Icon(
                Icons.share,
              ),
            )
          ],
          title: Text(
            "Eduplay Community",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: _loading
            ? Container(
                child: Text("No data"),
              )
            : ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) => PostTile(
                    img: posts[index].image,
                    title: posts[index].title,
                    uuid: posts[index].uuid),
              ));
  }
}
