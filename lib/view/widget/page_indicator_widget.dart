import 'package:flutter/material.dart';

/// A widget that displays page indicators for a PageView, highlighting the currently selected page.
class PageIndicatorWidget extends StatelessWidget {
  /// The index of the currently selected page.
  final int currentIndex;

  /// The total number of pages.
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
      children: List.generate(
        itemCount,
        (pageIndex) {
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
        },
      ),
    );
  }
}
