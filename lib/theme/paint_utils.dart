import 'package:flutter/material.dart';

/// A utility class for creating [Paint] objects with linear gradient backgrounds.
class PaintUtils {
  static Paint getLinearGradientPaint({
    required Alignment begin,
    required Alignment end,
    required List<Color> colors,
  }) {
    return Paint()
      ..shader = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.topRight,
        colors: colors,
      ).createShader(
        const Rect.fromLTWH(0.0, 0.0, 200.0, 100.0),
      );
  }
}
