import 'package:flutter/material.dart';
import 'package:flutter_training/core/color_theme.dart';

class ThemeProvider extends ChangeNotifier {
  Color _primaryColor;

  ThemeProvider(this._primaryColor);

  Color get primaryColor => _primaryColor;

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
        surface: Colors.white,
        onSurface: Colors.black,
      ),
      // Você pode configurar outras propriedades do tema aqui
    );
  }
}
