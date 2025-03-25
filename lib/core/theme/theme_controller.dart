import 'package:flutter/material.dart';
import 'package:flutter_training/core/extensions/color_extension.dart';
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

  void toggleTheme() {
    themeMode.value =
        themeMode.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;

    _primaryColor.value =
        _primaryColor.value == Colors.blue ? Colors.red : Colors.blue;
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

  void setThemeMode(ThemeMode mode) async {
    themeMode.value = mode;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('themeMode', mode.toString());
  }

  void setPrimaryColor(Color color) async {
    _primaryColor.value = color;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('primaryColor', color.value);
  }

  Color get primaryColor => _primaryColor.value;
  Color get onPrimaryColor => lightThemeData.colorScheme.onPrimary;
  Color get secondaryColor => _primaryColor.value.secondary();
  Color get tertiaryColor => _primaryColor.value.tertiary();
  Color get surfaceColor => lightThemeData.colorScheme.surface;
  Color get errorColor => lightThemeData.colorScheme.error;

  ThemeData get lightThemeData {
    Color onLightSurface = _primaryColor.value.computeLuminance() > 0.5
        ? Colors.black
        : Colors.white;
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      primaryColor: _primaryColor.value,
      appBarTheme: AppBarTheme(
        backgroundColor: _primaryColor.value,
        iconTheme: IconThemeData(color: onLightSurface),
      ),
      colorScheme: ColorScheme.light(
        primary: _primaryColor.value,
        secondary: _primaryColor.value.secondary(),
        tertiary: _primaryColor.value.tertiary(),
        onPrimary: onLightSurface,
        onSecondary: onLightSurface,
        onTertiary: onLightSurface,
        surface: Colors.white,
      ),
    );
  }

  ThemeData get darkThemeData {
    Color onDarkSurface = _primaryColor.value.computeLuminance() > 0.5
        ? Colors.white
        : Colors.black;
    return ThemeData(
      primaryColor: _primaryColor.value,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        backgroundColor: _primaryColor.value,
        iconTheme: IconThemeData(color: onDarkSurface),
      ),
      colorScheme: ColorScheme.light(
        primary: _primaryColor.value,
        secondary: _primaryColor.value.secondary(),
        tertiary: _primaryColor.value.tertiary(),
        onPrimary: onDarkSurface,
        onSecondary: onDarkSurface,
        onTertiary: onDarkSurface,
        surface: Colors.white,
      ),
    );
  }
}
