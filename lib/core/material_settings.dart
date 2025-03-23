import 'package:flutter/material.dart';
import 'package:flutter_training/core/theme_provider.dart';
import 'package:flutter_training/page/home_page.dart';
import 'package:provider/provider.dart';

class MaterialSettings extends StatelessWidget {
  /// Classe que define as configurações do Material e inicia o app.
  const MaterialSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (BuildContext context, ThemeProvider value, Widget? child) {
        return MaterialApp(
          title: 'Flutter training',
          theme: value.themeData,
          themeMode: value.themeMode,
          home: HomePage(),
        );
      },
    );
  }
}
