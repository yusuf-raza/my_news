import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/utils/route_names.dart';
import 'package:news_app/views/category_screen_view.dart';
import 'package:news_app/views/home_screen_view.dart';
import 'package:news_app/views/news_description_screen_view.dart';
import 'package:news_app/views/splash_screen_view.dart';
import 'package:news_app/views/topical_news_screen_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _goRouter,
      title: 'My News App',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }

  //go router config
  final GoRouter _goRouter =
      GoRouter(initialLocation: "/splashScreen", routes: [
    GoRoute(
        name: RouteNames.homeScreen,
        path: '/homeScreen',
        builder: (BuildContext context, GoRouterState state) =>
            const HomeScreenView()),
    GoRoute(
        name: RouteNames.splashScreen,
        path: '/splashScreen',
        builder: (BuildContext context, GoRouterState state) =>
            const SplashScreenView()),
    GoRoute(
      name: RouteNames.categoryViewScreen,
      path: '/categoryViewScreen',
      builder: (BuildContext context, GoRouterState state) =>
          const CategoryScreenView(),
    ),
    GoRoute(
        name: RouteNames.topicalNewsScreen,
        path: '/topicalNewsScreen/:topicForNews',
        builder: (BuildContext context, GoRouterState state) =>
            TopicalNewsViewScreen(
                topicForNews: state.pathParameters["topicForNews"]!)),
    GoRoute(
        name: RouteNames.newsDescriptionScreen,
        path: '/newsDescriptionScreen/:source/:publishedAt/:author/:content/:imageUrl/:title',
        builder: (BuildContext context, GoRouterState state) =>
            NewsDescriptionScreenView(
                source: state.pathParameters['source']!,
                publishedAt: state.pathParameters['publishedAt']!,
                author: state.pathParameters['author']!,
                content: state.pathParameters['content']!,
                imageUrl: state.pathParameters['imageUrl']!,
              title: state.pathParameters['title']!,))
  ]);
}
