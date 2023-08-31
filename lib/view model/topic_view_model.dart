import 'package:news_app/models/news_by_topic_model.dart';
import 'package:news_app/repositories/topic_repository.dart';

class TopicsViewModel {
  final _repository = TopicRepository();

  Future<NewsByTopicModel> fetchNewsTopicApi(String topicName) async {
    final response = await _repository.fetchNewsTopicApi(topicName.toLowerCase());
    return response;
  }
}
