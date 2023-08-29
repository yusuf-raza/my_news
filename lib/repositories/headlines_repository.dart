import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/models/HeadlinesModel.dart';

class HeadlinesRepository {
  Future<HeadlinesModel> fetchNewsHeadlineApi(String channelName) async {

    String apiKey = '67d99427b3944319834fc8c10e56f5df';
    String url = 'https://newsapi.org/v2/top-headlines?sources=$channelName&apiKey=$apiKey' ;
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      if (kDebugMode) {
        print("API HIT SUCCESSFULLY: $url");
      }
      return HeadlinesModel.fromJson(body);
    } else {
      if (kDebugMode) {
        print(response.body);
      }
      throw "error";
    }
  }
}
