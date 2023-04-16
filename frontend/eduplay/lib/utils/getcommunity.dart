import 'dart:convert';
import 'package:eduplay/onBoarding/model/communitymodel.dart';
import '../pages/form_page.dart';
import 'package:http/http.dart' as http;

class GetCommunity {
  List<CommunityPostModal> posts = [];
  Future<void> getData() async {
    try {
      var Url = Uri.parse('${url}api/v1/getAll/communityPost');
      var response = await http.get(Url);
      var jsonData = jsonDecode(response.body);
      print(jsonData);
      if (jsonData['status'] == 200) {
        jsonData['communityPosts'].forEach((element) {
          CommunityPostModal cm = CommunityPostModal(
              uuid: element['uuid'],
              title: element['title'],
              image: element['image'],
              likes: element['likes']);

          posts.add(cm);
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
