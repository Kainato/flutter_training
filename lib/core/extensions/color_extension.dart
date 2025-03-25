import 'package:flutter/material.dart';

extension ColorExtension on Color {
  /// Gera a cor secundária a partir da cor primária.
  Color secondary([double amount = 0.1]) {
    final hsl = HSLColor.fromColor(this);
    final hslLight = hsl.withLightness(
      (hsl.lightness + amount).clamp(0.0, 1.0),
    );
    return hslLight.toColor();
  }

  /// Gera a cor terciária a partir da cor primária.
  Color tertiary([double amount = 0.1]) {
    final hsl = HSLColor.fromColor(this);
    final hslSaturation = hsl.withSaturation(
      (hsl.saturation + amount).clamp(0.0, 1.0),
    );
    return hslSaturation.toColor();
  }
}
