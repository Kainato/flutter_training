import 'package:flutter/material.dart';
import 'package:flutter_training/core/theme_provider.dart';
import 'package:flutter_training/page/home_page.dart';
import 'package:provider/provider.dart';

class MaterialSettings extends StatelessWidget {
  const MaterialSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (BuildContext context, ThemeProvider value, Widget? child) => MaterialApp(
        title: 'Meu Flutter App',
        theme: value.themeData,
        themeMode: ThemeMode.light,
        home: HomePage(),
      ),
    );
  }
}
