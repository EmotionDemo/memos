import 'package:flutter/material.dart';


class MyListItem extends StatelessWidget {
  final String title;
  final VoidCallback onDismissed;
  final VoidCallback onSwipe;

  const MyListItem({
    required this.title,
    required this.onDismissed,
    required this.onSwipe,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (_) => onDismissed(),
      direction: DismissDirection.startToEnd,
      child: GestureDetector(
        onHorizontalDragUpdate: (details) {
          // calculate swipe percentage
          final swipePercentage = details.delta.dx / context.size!.width;
          if (swipePercentage < -0.3) {
            onSwipe();
          }
        },
        child: AnimatedPositioned(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          left: 0,
          right: 0,
          top: 0,
          bottom: 0,
          child: Container(
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: Text(title),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
