import 'package:flutter/material.dart';

extension IconExtension on Icon {
  Container circle({required Color color, double padding = 8}) {
    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color.withValues(alpha: 0.4),
      ),
      child: this,
    );
  }
}
