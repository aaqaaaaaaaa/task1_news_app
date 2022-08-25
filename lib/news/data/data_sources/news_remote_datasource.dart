import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:task1_news_app/news/data/models/news_model.dart';

class NewsRemote {
  List<NewsModel> list = [];

  Future<dynamic> getNewsData() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      if (response.statusCode == 200) {
        final parsed = jsonDecode(response.body);
        for (int i = 0; i < (parsed as List).length; i++) {
          list.add(NewsModel.fromJson(parsed[i]));
        }
        return list;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }
}
