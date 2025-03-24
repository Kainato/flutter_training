import 'package:flutter/material.dart';
import 'package:flutter_training/core/theme_provider.dart';
import 'package:flutter_training/page/home_page.dart';
import 'package:flutter_training/page/login_page.dart';
import 'package:provider/provider.dart';

class MaterialSettings extends StatelessWidget {
  final bool isDarkMode;
  final bool isLogged;

  /// Classe que define as configurações do Material e inicia o app.
  const MaterialSettings({
    super.key,
    required this.isDarkMode,
    required this.isLogged,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (BuildContext context, ThemeProvider value, Widget? child) {
        return MaterialApp(
          title: 'Flutter training',
          theme: value.lightThemeData,
          darkTheme: value.darkThemeData,
          themeMode: value.themeMode,
          home: Builder(
            builder: (context) {
              if (isLogged) {
                return HomePage();
              } else {
                return LoginPage();
              }
            },
          ),
        );
      },
    );
  }
}
