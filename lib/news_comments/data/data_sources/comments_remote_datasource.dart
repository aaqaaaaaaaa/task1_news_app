import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:task1_news_app/news_comments/data/models/comments_model.dart';

class CommentsRemote {
  List<CommentsModel> list = [];

  Future<dynamic> getCommentsData(int id) async {
    try {
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/comments?postId=$id'),
      );

      debugPrint(response.body);
      if (response.statusCode == 200) {
        return [
          for (final item in jsonDecode(response.body))
            CommentsModel.fromJson(item)
        ];
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }
}
