import 'package:flutter/material.dart';
import 'package:flutter_training/core/theme/theme_controller.dart';
import 'package:get/get.dart';

import '../../modules/auth/login_page.dart';
import '../../modules/home/home_page.dart';

class MaterialSettings extends StatelessWidget {
  /// Identifica se o app está em modo escuro.
  final bool isDarkMode;

  /// Identifica se o usuário está logado.
  final bool isLogged;

  /// Código HEX da cor principal do app.
  final int? color;

  /// Classe que define as configurações do Material e inicia o app.
  const MaterialSettings({
    super.key,
    required this.color,
    required this.isDarkMode,
    required this.isLogged,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.put(ThemeController());

    return Obx(
      () => GetMaterialApp(
        title: 'Flutter training',
        theme: themeController.lightThemeData,
        darkTheme: themeController.darkThemeData,
        themeMode: themeController.themeMode.value,
        home: Builder(
          builder: (context) {
            if (isLogged) {
              return HomePage();
            } else {
              return LoginPage();
            }
          },
        ),
      ),
    );
  }
}
