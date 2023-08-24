import 'package:flutter/material.dart';
import 'package:news_app/view%20model/headline_view_model.dart';
import 'package:news_app/views/home_screen_view.dart';
import 'package:news_app/views/splash_screen_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My News',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreenView(),
    );
  }
}
