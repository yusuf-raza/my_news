import 'package:news_app/view%20model/headline_view_model.dart';

class AppUrls {
  //late String sources;

  static var queryParameters = {
    'sources': HeadlinesViewModelProvider().getSource,
    'apiKey': '67d99427b3944319834fc8c10e56f5df',
  };

  var baseUrl = Uri.parse('https://newsapi.org/v2/top-headlines&sources',
      queryParameters as int);
  String apiKey = '67d99427b3944319834fc8c10e56f5df';
}
