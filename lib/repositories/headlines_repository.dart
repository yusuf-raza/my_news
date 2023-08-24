import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/HeadlinesModel.dart';

class HeadlinesRepository {
  Future<HeadlinesModel> fetchNewsHeadlineApi() async {
    var response = await http.get(Uri.parse('https://newsapi.org/v2/top-headlines?sources=talksport&apiKey=67d99427b3944319834fc8c10e56f5df'));
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      return HeadlinesModel.fromJson(body);
    } else {
      throw "error";
    }
  }
}
