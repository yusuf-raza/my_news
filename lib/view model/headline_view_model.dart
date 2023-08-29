import 'package:news_app/models/HeadlinesModel.dart';
import 'package:news_app/repositories/headlines_repository.dart';

class HeadlinesViewModel{
  final _repository = HeadlinesRepository();


  Future<HeadlinesModel> fetchNewsHeadlineApi(String channelName) async {
    final response = await _repository.fetchNewsHeadlineApi(channelName);
    print(response.totalResults);
    return response;
  }
}
