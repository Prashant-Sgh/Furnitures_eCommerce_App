// category_item.dart
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String label;
  final String iconPath;

  const CategoryItem({
    required this.label,
    required this.iconPath,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(iconPath),
        ),
        Positioned(
          top: 20,
          left: 20,
          child: Text(
            label,
            style: TextStyle(fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
