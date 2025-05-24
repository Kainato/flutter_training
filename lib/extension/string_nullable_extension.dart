import 'package:flutter/material.dart';

extension StringExtension on String? {
  /// Retorna uma cor RGB a partir de uma string no formato "rgb(r, g, b)".
  Color parseRGBColor() {
    if (toString() == "" || toString() == "null") {
      return Colors.transparent;
    } else {
      // Remove "rgb(" e ")" da string
      final String cleanedString = this!.replaceAll(RegExp(r'rgb|\(|\)|\s'), '');

      // Divide os valores separados por vírgula
      final rgbValues = cleanedString.split(',').map(int.parse).toList();

      // Retorna um objeto Color
      return Color.fromARGB(255, rgbValues[0], rgbValues[1], rgbValues[2]);
    }
  }
}
