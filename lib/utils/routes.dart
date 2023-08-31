import 'package:flutter/material.dart';
import 'package:news_app/components/topic_screen_topical_news_card.dart';
import 'package:news_app/views/category_screen_view.dart';
import 'package:news_app/views/home_screen_view.dart';
import 'package:news_app/views/news_description_screen_view.dart';
import 'package:news_app/views/splash_screen_view.dart';
import 'package:news_app/views/topical_news_screen_view.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'splashScreen':
        return MaterialPageRoute(builder: (_) => const SplashScreenView());
      case 'homeScreen':
        return MaterialPageRoute(builder: (_) => const HomeScreenView());
      case 'newsDescriptionScreen':
        final args = settings.arguments as NewsDescriptionScreenArguments;
        return MaterialPageRoute(builder: (_) =>  NewsDescriptionScreenView(
          source: args.source,
          author: args.author,
          publishedAt: args.publishedAt,
          imageUrl: args.imageUrl,
          content: args.content,
        ));
      case 'categoryScreen':
        return MaterialPageRoute(builder: (_) => const CategoryScreenView());
      case 'topicalNewsScreen':
        final String topic = settings.arguments as String;
        return MaterialPageRoute(builder: (_)=>  TopicalNewsViewScreen(topicForNews: topic));
      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                  body: Center(
                    child: Text('404 - Page not found'),
                  ),
                ));
    }
  }
}
