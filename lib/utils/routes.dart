import 'package:flutter/material.dart';
import 'package:news_app/views/category_screen_view.dart';
import 'package:news_app/views/home_screen_view.dart';
import 'package:news_app/views/splash_screen_view.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'splashScreen':
        return MaterialPageRoute(builder: (_) => const SplashScreenView());
      case 'homeScreen':
        return MaterialPageRoute(builder: (_) => const HomeScreenView());
      case 'categoryScreen':
        return MaterialPageRoute(builder: (_) => const CategoryScreenView());
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
