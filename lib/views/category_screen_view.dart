import 'package:flutter/material.dart';

class CategoryScreenView extends StatelessWidget {
  const CategoryScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(
        title: const Text("Categories"),
        centerTitle: true,
      ),
    );
  }
}
