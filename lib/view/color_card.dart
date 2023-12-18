import 'package:flutter/material.dart';

class ColorThemeCard extends StatelessWidget {
  final int index;
  final bool isSelected;
  final VoidCallback onTap;

  ColorThemeCard({
    required this.index,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsets.all(8),
        shadowColor: Colors.grey.withOpacity(0.6),
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: isSelected
              ? const BorderSide(
            color: Colors.yellow,
            width: 7.0,
          )
              : BorderSide.none,
        ),
        child: Container(
          color:switchColor(index),
        ),
      ),
    );
  }

  Color switchColor(int index) {
    switch (index) {
      case 0:
        return Colors.red;
      case 1:
        return Colors.blue;
      case 2:
        return Colors.black;
      case 3:
        return Colors.white;
      case 4:
        return Colors.green;
      default:
        return Colors.white;
    }
  }
}
