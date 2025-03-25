import 'package:flutter/material.dart';

/// Enumeração de temas de texto do aplicativo.
enum AppTextTheme {
  bodyLarge,
  bodyMedium,
  bodySmall,
  displayLarge,
  displayMedium,
  displaySmall,
  labelLarge,
  labelMedium,
  labelSmall,
  headlineLarge,
  headlineMedium,
  headlineSmall,
  titleLarge,
  titleMedium,
  titleSmall,
  subtitleLarge,
  subtitleMedium,
  subtitleSmall,
  hint,
}

extension AppTextThemeExtension on AppTextTheme {
  TextStyle get style {
    switch (this) {
      case AppTextTheme.bodyLarge:
        return TextStyle(
          fontSize: 16.0,
        );
      case AppTextTheme.bodyMedium:
        return TextStyle(
          fontSize: 14.0,
        );
      case AppTextTheme.bodySmall:
        return TextStyle(
          fontSize: 12.0,
        );
      case AppTextTheme.displayLarge:
        return TextStyle(
          fontSize: 32.0,
        );
      case AppTextTheme.displayMedium:
        return TextStyle(
          fontSize: 24.0,
        );
      case AppTextTheme.displaySmall:
        return TextStyle(
          fontSize: 20.0,
        );
      case AppTextTheme.labelLarge:
        return TextStyle(
          fontSize: 16.0,
        );
      case AppTextTheme.labelMedium:
        return TextStyle(
          fontSize: 14.0,
        );
      case AppTextTheme.labelSmall:
        return TextStyle(
          fontSize: 12.0,
        );
      case AppTextTheme.headlineLarge:
        return TextStyle(
          fontSize: 24.0,
        );
      case AppTextTheme.headlineMedium:
        return TextStyle(
          fontSize: 20.0,
        );
      case AppTextTheme.headlineSmall:
        return TextStyle(
          fontSize: 16.0,
        );
      case AppTextTheme.titleLarge:
        return TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        );
      case AppTextTheme.titleMedium:
        return TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        );
      case AppTextTheme.titleSmall:
        return TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.bold,
        );
      case AppTextTheme.subtitleLarge:
        return TextStyle(
          fontSize: 18.0,
          color: Colors.grey,
          fontStyle: FontStyle.italic,
        );
      case AppTextTheme.subtitleMedium:
        return TextStyle(
          fontSize: 14.0,
          color: Colors.grey,
          fontStyle: FontStyle.italic,
        );
      case AppTextTheme.subtitleSmall:
        return TextStyle(
          fontSize: 12.0,
          color: Colors.grey,
          fontStyle: FontStyle.italic,
        );
      case AppTextTheme.hint:
        return TextStyle(
          fontSize: 14.0,
          color: Colors.grey,
          fontStyle: FontStyle.italic,
        );
    }
  }
}
