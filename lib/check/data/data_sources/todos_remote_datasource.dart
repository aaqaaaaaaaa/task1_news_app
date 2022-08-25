import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:task1_news_app/check/data/models/todo_model.dart';

class TodosRemoteDatasource {
  List<ToDoModel> list = [];

  Future<dynamic> getToDosData() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
      if (response.statusCode == 200) {
        final parsed = jsonDecode(response.body);
        for (int i = 0; i < (parsed as List).length; i++) {
          list.add(ToDoModel.fromJson(parsed[i]));
        }
        return list;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
