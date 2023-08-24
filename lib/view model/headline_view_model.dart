import 'package:flutter/material.dart';
import 'package:news_app/models/HeadlinesModel.dart';
import 'package:news_app/repositories/headlines_repository.dart';
import 'package:news_app/utils/app_urls.dart';

class HeadlinesViewModelProvider with ChangeNotifier {
  final _repository = HeadlinesRepository();

  String _source = 'the-sport-bible';

  String get getSource => _source;

  set setSource(String value) {
    _source = value;
  }



  @override
  notifyListeners();


  Future<HeadlinesModel> fetchNewsHeadlineApi() async {
    final response = await _repository.fetchNewsHeadlineApi(AppUrls().baseUrl.toString());
    notifyListeners();

    print(AppUrls().baseUrl.toString());
    return response;
  }
}
