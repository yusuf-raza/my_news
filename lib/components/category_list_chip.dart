import 'package:flutter/material.dart';

class CategoryListChip extends StatelessWidget {
  const CategoryListChip({super.key, required this.categoryName});

  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.blueGrey, width: 1)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            categoryName,
            style: const TextStyle(color: Colors.white),
          ),
        ));
  }
}
