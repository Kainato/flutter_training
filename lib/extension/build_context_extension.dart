import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  // ? MEDIAQUERY EXTENSIONS
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
  // double get diagonal =>
  //     (width * width + height * height).sqrt(); // Pitagoras: a² + b² = c²
  double get statusBarHeight => MediaQuery.of(this).padding.top;
  double get bottomBarHeight => MediaQuery.of(this).padding.bottom;
  // double get textScaleFactor => MediaQuery.of(this).textScaler;
  double get scale => MediaQuery.of(this).devicePixelRatio;
  double get toolbarHeight => kToolbarHeight;
  double get topSafeArea => MediaQuery.of(this).padding.top;
  double get bottomSafeArea => MediaQuery.of(this).padding.bottom;
  double get safeAreaHeight => MediaQuery.of(this).padding.vertical;
  double get safeAreaWidth => MediaQuery.of(this).padding.horizontal;
  double get safeAreaHorizontal => MediaQuery.of(this).padding.horizontal;
  double get safeAreaVertical => MediaQuery.of(this).padding.vertical;
  double get safeAreaTop => MediaQuery.of(this).padding.top;
  double get safeAreaBottom => MediaQuery.of(this).padding.bottom;
  double get safeAreaLeft => MediaQuery.of(this).padding.left;
  double get safeAreaRight => MediaQuery.of(this).padding.right;
  double get safeAreaHorizontalPadding =>
      MediaQuery.of(this).padding.horizontal;
  double get safeAreaVerticalPadding => MediaQuery.of(this).padding.vertical;
  double get safeAreaTopPadding => MediaQuery.of(this).padding.top;
  double get safeAreaBottomPadding => MediaQuery.of(this).padding.bottom;
  double get safeAreaLeftPadding => MediaQuery.of(this).padding.left;
  double get safeAreaRightPadding => MediaQuery.of(this).padding.right;
  // double get textScale => MediaQuery.of(this).textScaler;
  double get devicePixelRatio => MediaQuery.of(this).devicePixelRatio;
  double get devicePixelRatioHorizontal => MediaQuery.of(this).devicePixelRatio;
  double get devicePixelRatioVertical => MediaQuery.of(this).devicePixelRatio;
  double get devicePixelRatioScale => MediaQuery.of(this).devicePixelRatio;
  double get devicePixelRatioTextScale => MediaQuery.of(this).devicePixelRatio;
  double get devicePixelRatioTextScaleHorizontal =>
      MediaQuery.of(this).devicePixelRatio;
  double get devicePixelRatioTextScaleVertical =>
      MediaQuery.of(this).devicePixelRatio;
  // double get devicePixelRatioTextScaleFactor => MediaQuery.of(this).devicePixel;

  // ! THEME EXTENSIONS
  Color get primaryColor => Theme.of(this).colorScheme.primary;
  Color get surfaceTintColor => Theme.of(this).colorScheme.surfaceTint;
  Color get onPrimaryColor => Theme.of(this).colorScheme.onPrimary;
  Color get primaryContainerColor =>
      Theme.of(this).colorScheme.primaryContainer;
  Color get onPrimaryContainerColor =>
      Theme.of(this).colorScheme.onPrimaryContainer;
  Color get secondaryColor => Theme.of(this).colorScheme.secondary;
  Color get onSecondaryColor => Theme.of(this).colorScheme.onSecondary;
  Color get secondaryContainerColor =>
      Theme.of(this).colorScheme.secondaryContainer;
  Color get onSecondaryContainerColor =>
      Theme.of(this).colorScheme.onSecondaryContainer;
  Color get tertiaryColor => Theme.of(this).colorScheme.tertiary;
  Color get onTertiaryColor => Theme.of(this).colorScheme.onTertiary;
  Color get tertiaryContainerColor =>
      Theme.of(this).colorScheme.tertiaryContainer;
  Color get onTertiaryContainerColor =>
      Theme.of(this).colorScheme.onTertiaryContainer;
  Color get errorColor => Theme.of(this).colorScheme.error;
  Color get onErrorColor => Theme.of(this).colorScheme.onError;
  Color get errorContainerColor => Theme.of(this).colorScheme.errorContainer;
  Color get onErrorContainerColor =>
      Theme.of(this).colorScheme.onErrorContainer;
  Color get surfaceColor => Theme.of(this).colorScheme.surface;
  Color get onSurfaceColor => Theme.of(this).colorScheme.onSurface;
  Color get onSurfaceVariantColor =>
      Theme.of(this).colorScheme.onSurfaceVariant;
  Color get onInverseSurfaceColor =>
      Theme.of(this).colorScheme.onInverseSurface;
  Color get outlineColor => Theme.of(this).colorScheme.outline;
  Color get outlineVariantColor => Theme.of(this).colorScheme.outlineVariant;
  Color get shadowColor => Theme.of(this).colorScheme.shadow;
  Color get scrimColor => Theme.of(this).colorScheme.scrim;
  Color get inverseSurfaceColor => Theme.of(this).colorScheme.inverseSurface;
  Color get inversePrimaryColor => Theme.of(this).colorScheme.inversePrimary;
  Color get primaryFixedColor => Theme.of(this).colorScheme.primaryFixed;
  Color get onPrimaryFixedColor => Theme.of(this).colorScheme.onPrimaryFixed;
  Color get primaryFixedDimColor => Theme.of(this).colorScheme.primaryFixedDim;
  Color get onPrimaryFixedVariantColor =>
      Theme.of(this).colorScheme.onPrimaryFixedVariant;
  Color get secondaryFixedColor => Theme.of(this).colorScheme.secondaryFixed;
  Color get onSecondaryFixedColor =>
      Theme.of(this).colorScheme.onSecondaryFixed;
  Color get secondaryFixedDimColor =>
      Theme.of(this).colorScheme.secondaryFixedDim;
  Color get onSecondaryFixedVariantColor =>
      Theme.of(this).colorScheme.onSecondaryFixedVariant;
  Color get tertiaryFixedColor => Theme.of(this).colorScheme.tertiaryFixed;
  Color get onTertiaryFixedColor => Theme.of(this).colorScheme.onTertiaryFixed;
  Color get tertiaryFixedDimColor =>
      Theme.of(this).colorScheme.tertiaryFixedDim;
  Color get onTertiaryFixedVariantColor =>
      Theme.of(this).colorScheme.onTertiaryFixedVariant;
  Color get surfaceDimColor => Theme.of(this).colorScheme.surfaceDim;
  Color get surfaceBrightColor => Theme.of(this).colorScheme.surfaceBright;
  Color get surfaceContainerLowestColor =>
      Theme.of(this).colorScheme.surfaceContainerLowest;
  Color get surfaceContainerLowColor =>
      Theme.of(this).colorScheme.surfaceContainerLow;
  Color get surfaceContainerColor =>
      Theme.of(this).colorScheme.surfaceContainer;
  Color get surfaceContainerHighColor =>
      Theme.of(this).colorScheme.surfaceContainerHigh;
  Color get surfaceContainerHighestColor =>
      Theme.of(this).colorScheme.surfaceContainerHighest;

  // * TEXT THEME EXTENSIONS
  TextStyle get titleLarge => Theme.of(this).textTheme.titleLarge!;
  TextStyle get titleMedium => Theme.of(this).textTheme.titleMedium!;
  TextStyle get titleSmall => Theme.of(this).textTheme.titleSmall!;
  TextStyle get bodyLarge => Theme.of(this).textTheme.bodyLarge!;
  TextStyle get bodyMedium => Theme.of(this).textTheme.bodyMedium!;
  TextStyle get bodySmall => Theme.of(this).textTheme.bodySmall!;
  TextStyle get labelLarge => Theme.of(this).textTheme.labelLarge!;
  TextStyle get labelMedium => Theme.of(this).textTheme.labelMedium!;
  TextStyle get labelSmall => Theme.of(this).textTheme.labelSmall!;
  TextStyle get displayLarge => Theme.of(this).textTheme.displayLarge!;
  TextStyle get displayMedium => Theme.of(this).textTheme.displayMedium!;
  TextStyle get displaySmall => Theme.of(this).textTheme.displaySmall!;
  TextStyle get headlineLarge => Theme.of(this).textTheme.headlineLarge!;
  TextStyle get headlineMedium => Theme.of(this).textTheme.headlineMedium!;
  TextStyle get headlineSmall => Theme.of(this).textTheme.headlineSmall!;

  // * SNACKBAR EXTENSIONS
  void showSnackBar(
    String message, {
    Duration duration = const Duration(seconds: 3),
    SnackBarAction? action,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(content: Text(message), duration: duration, action: action),
    );
  }
}
