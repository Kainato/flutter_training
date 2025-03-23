import 'package:flutter/material.dart';
import 'package:flutter_training/core/color_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Classe que define o tema do app.
class ThemeProvider extends ChangeNotifier {
  Color _primaryColor;
  ThemeMode _themeMode = ThemeMode.light;

  ThemeProvider(this._primaryColor) {
    _loadThemeMode();
  }

  ThemeMode get themeMode => _themeMode;
  Color get primaryColor => _primaryColor;

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
    prefs.setString('themeMode', mode.toString());
  }

  /// Define a cor primária do tema.
  set primaryColor(Color newColor) {
    _primaryColor = newColor;
    notifyListeners();
  }

  ThemeData get themeData {
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
        /* white based on primary color */
        surface: !(_primaryColor.computeLuminance() > 0.2)
            ? Color.alphaBlend(_primaryColor.withAlpha(25), Colors.white)
            : const Color.fromRGBO(18, 18, 18, 1),
        onSurface: !(_primaryColor.computeLuminance() > 0.2)
            ? Colors.black
            : Colors.white,
      ),
      // Você pode configurar outras propriedades do tema aqui
    );
  }
}
