import 'dart:ui';

import 'package:flutter/material.dart';

extension ColorExtension on Color {
  /// Retorna uma cor com opacidade reduzida.
  /// O valor padrão de opacidade é 0.5 (50%).
  Color get withOpacity50 => withValues(alpha: 0.5);

  /// Retorna uma cor com opacidade reduzida.
  /// O valor padrão de opacidade é 0.3 (30%).
  Color get withOpacity30 => withValues(alpha: 0.3);

  /// Retorna uma cor com opacidade reduzida.
  /// O valor padrão de opacidade é 0.1 (10%).
  Color get withOpacity10 => withValues(alpha: 0.1);
}
