import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/models/HeadlinesModel.dart';
import 'package:news_app/utils/app_urls.dart';

class HeadlinesRepository {
  Future<HeadlinesModel> fetchNewsHeadlineApi(String myUrl) async {
    String url =
        myUrl;
    var response = await http.get(Uri.parse(url));
    print("MY URL $myUrl");
    print(AppUrls().baseUrl.toString());

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      return HeadlinesModel.fromJson(body);
    } else {
      throw "error";
    }
  }
}
