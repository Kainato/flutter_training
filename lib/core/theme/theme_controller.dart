import 'package:flutter/material.dart';
import 'package:flutter_training/core/enum/app_text_theme.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  final Rx<Color> _primaryColor = Colors.blue.obs;
  Rx<ThemeMode> themeMode = ThemeMode.light.obs;

  @override
  void onInit() {
    super.onInit();
    _loadThemeMode();
    _loadPrimaryColor();
  }

  Color get primaryColor => _primaryColor.value;

  set primaryColor(Color value) {
    _primaryColor.value = value;
    _savePrimaryColorToPrefs(value);
  }

  void toggleTheme() {
    themeMode.value =
        themeMode.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;

    primaryColor = primaryColor == Colors.blue ? Colors.red : Colors.blue;
  }

  void _loadThemeMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? themeModeString = prefs.getString('themeMode');
    if (themeModeString != null) {
      themeMode.value = ThemeMode.values.firstWhere(
        (e) => e.toString() == themeModeString,
        orElse: () => ThemeMode.light,
      );
    }
  }

  void _loadPrimaryColor() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? colorValue = prefs.getInt('primaryColor');
    if (colorValue != null) {
      _primaryColor.value = Color(colorValue);
    }
  }

  void _savePrimaryColorToPrefs(Color color) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('primaryColor', color.value);
  }

  void setThemeMode(ThemeMode mode) async {
    themeMode.value = mode;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('themeMode', mode.toString());
  }

  Color getColor(Color lightColor, Color darkColor) {
    return themeMode.value == ThemeMode.light ? lightColor : darkColor;
  }

  Color get onPrimaryColor => getColor(
        lightThemeData.colorScheme.onPrimary,
        darkThemeData.colorScheme.onPrimary,
      );
  Color get secondaryColor => getColor(
        lightThemeData.colorScheme.secondary,
        darkThemeData.colorScheme.secondary,
      );
  Color get onSecondaryColor => getColor(
        lightThemeData.colorScheme.onSecondary,
        darkThemeData.colorScheme.onSecondary,
      );
  Color get tertiaryColor => getColor(
        lightThemeData.colorScheme.tertiary,
        darkThemeData.colorScheme.tertiary,
      );
  Color get onTertiaryColor => getColor(
        lightThemeData.colorScheme.onTertiary,
        darkThemeData.colorScheme.onTertiary,
      );
  Color get surfaceColor => getColor(
        lightThemeData.colorScheme.surface,
        darkThemeData.colorScheme.surface,
      );
  Color get onSurfaceColor => getColor(
        lightThemeData.colorScheme.onSurface,
        darkThemeData.colorScheme.onSurface,
      );
  Color get errorColor => getColor(
        lightThemeData.colorScheme.error,
        darkThemeData.colorScheme.error,
      );
  Color get onErrorColor => getColor(
        lightThemeData.colorScheme.onError,
        darkThemeData.colorScheme.onError,
      );

  ThemeData get lightThemeData {
    final scheme = ColorScheme.fromSeed(seedColor: _primaryColor.value);

    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: scheme.surface,
      primaryColor: scheme.primary,
      appBarTheme: AppBarTheme(
        backgroundColor: scheme.primary,
        titleTextStyle: AppTextTheme.headlineMedium.style,
        iconTheme: IconThemeData(color: scheme.onPrimary),
      ),
      colorScheme: scheme,
    );
  }

  ThemeData get darkThemeData {
    final scheme = ColorScheme.fromSeed(
        seedColor: _primaryColor.value, brightness: Brightness.dark);

    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: scheme.surface,
      primaryColor: scheme.primary,
      appBarTheme: AppBarTheme(
        backgroundColor: scheme.primary,
        iconTheme: IconThemeData(color: scheme.onPrimary),
      ),
      colorScheme: scheme,
    );
  }
}
