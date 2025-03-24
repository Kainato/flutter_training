import 'package:flutter/material.dart';
import 'package:flutter_training/core/cache/cache_key.dart';
import 'package:flutter_training/core/extensions/color_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Classe que define o tema do app.
class ThemeProvider extends ChangeNotifier {
  // Cor primária do aplicativo que define todas as outras cores.
  Color _primaryColor;
  Color get primaryColor => _primaryColor;

  // Modo do tema do aplicativo.
  ThemeMode _themeMode = ThemeMode.light;
  ThemeMode get themeMode => _themeMode;

  ThemeProvider(this._primaryColor) {
    _loadThemeMode();
  }

  /// Carrega o tema do app.
  void _loadThemeMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? themeModeString = prefs.getString('themeMode');
    if (themeModeString != null) {
      _themeMode = ThemeMode.values.firstWhere(
        (e) => e.toString() == themeModeString,
        orElse: () => ThemeMode.light,
      );
      notifyListeners();
    }
  }

  /// Define o modo do tema.
  void setThemeMode(ThemeMode mode) async {
    _themeMode = mode;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(Cachekey.isDarkMode.value, mode.toString());
  }

  /// Define a cor primária do tema. Também salva a cor no SharedPreferences.
  set primaryColor(Color newColor) {
    _primaryColor = newColor;
    _savePrimaryColorToPrefs(newColor);
    notifyListeners();
  }

  /// Salva a cor primária do tema no SharedPreferences.
  Future<void> _savePrimaryColorToPrefs(Color newColor) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(Cachekey.themeColor.value, newColor.toString());
  }

  /// Retorna o tema do app.
  ThemeData get lightThemeData {
    return ThemeData(
      useMaterial3: true,
      primaryColor: _primaryColor,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(_primaryColor),
          textStyle: WidgetStateProperty.all<TextStyle>(
            TextStyle(
              color: primaryColor.computeLuminance() > 0.5
                  ? Colors.black
                  : Colors.white,
            ),
          ),
        ),
      ),
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: _primaryColor,
        onPrimary: _primaryColor.computeLuminance() > 0.5
            ? Colors.black
            : Colors.white,
        secondary: _primaryColor.secondary(),
        onSecondary: _primaryColor.computeLuminance() > 0.5
            ? Colors.black
            : Colors.white,
        error: Colors.red,
        onError: Colors.white,
        surface: Colors.white,
        onSurface: Colors.black,
      ),
    );
  }

  ThemeData get darkThemeData {
    return ThemeData(
      useMaterial3: true,
      primaryColor: _primaryColor,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(_primaryColor),
          textStyle: WidgetStateProperty.all<TextStyle>(
            TextStyle(
              color: primaryColor.computeLuminance() > 0.5
                  ? Colors.black
                  : Colors.white,
            ),
          ),
        ),
      ),
      colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: _primaryColor,
        onPrimary: _primaryColor.computeLuminance() > 0.5
            ? Colors.black
            : Colors.white,
        secondary: _primaryColor.secondary(),
        onSecondary: _primaryColor.computeLuminance() > 0.5
            ? Colors.black
            : Colors.white,
        error: Colors.red,
        onError: Colors.white,
        surface: Color.fromRGBO(18, 18, 18, 1),
        onSurface: Colors.white,
      ),
    );
  }
}
