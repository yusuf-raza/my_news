import 'package:news_app/models/headlines_model.dart';
import 'package:news_app/repositories/headlines_repository.dart';

class HeadlinesViewModel {
  final _repository = HeadlinesRepository();

  Future<HeadlinesModel> fetchNewsHeadlineApi(String channelName) async {
    final response = await _repository.fetchNewsHeadlineApi(channelName);
    return response;
  }
}
