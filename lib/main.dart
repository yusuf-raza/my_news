import 'package:flutter/material.dart';
import 'package:news_app/utils/routes.dart';
import 'package:news_app/views/splash_screen_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'splashScreen',
      onGenerateRoute: RouteGenerator.generateRoute,
      title: 'My News App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreenView(),
    );
  }
}
