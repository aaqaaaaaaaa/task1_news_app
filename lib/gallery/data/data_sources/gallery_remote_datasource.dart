import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:task1_news_app/gallery/data/models/gallery_model.dart';
import 'package:task1_news_app/news/data/models/news_model.dart';

class GalleryRemoteDatasource {
  List<GalleryModel> list = [];

  Future<dynamic> getGalleryData() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
      if (response.statusCode == 200) {
        final parsed = jsonDecode(response.body);
        for (int i = 0; i < (parsed as List).length; i++) {
          list.add(GalleryModel.fromJson(parsed[i]));
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
