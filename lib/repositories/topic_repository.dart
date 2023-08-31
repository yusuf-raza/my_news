import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/models/news_by_topic_model.dart';

class TopicRepository {
  Future<NewsByTopicModel> fetchNewsTopicApi(String topicName) async {
    String apiKey = '67d99427b3944319834fc8c10e56f5df';
    String apiKeyTwo = "8762c3f5ccad46df8a28aec005f44d3a";
    String url =
        'https://newsapi.org/v2/everything?q=$topicName&lng=en&apiKey=$apiKeyTwo';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      if (kDebugMode) {
        print("API HIT SUCCESSFULLY: $url");
      }
      return NewsByTopicModel.fromJson(body);
    } else {
      if (kDebugMode) {
        print(response.body);
      }
      throw "error";
    }
  }
}
