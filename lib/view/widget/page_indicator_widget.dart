import 'package:flutter/material.dart';

class PageIndicatorWidget extends StatelessWidget {
  final int currentIndex;
  final int itemCount;

  const PageIndicatorWidget({
    required this.currentIndex,
    required this.itemCount,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(itemCount, (pageIndex) {
        return AnimatedContainer(
          constraints: const BoxConstraints(
            minHeight: 10,
          ),
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: pageIndex == currentIndex ? 10 : 5,
          height: pageIndex == currentIndex ? 10 : 5,
          foregroundDecoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                Color(0xFFB63AB4),
                Color(0xFF1F2D4F),
              ],
            ),
          ),
        );
      }),
    );
  }
}
