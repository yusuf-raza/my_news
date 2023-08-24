import 'package:flutter/material.dart';
import 'package:news_app/models/HeadlinesModel.dart';
import 'package:news_app/repositories/headlines_repository.dart';

class HeadlinesViewModelProvider{
  final _repository = HeadlinesRepository();


  Future<HeadlinesModel> fetchNewsHeadlineApi() async {
    final response = await _repository.fetchNewsHeadlineApi();
    return response;
  }
}
