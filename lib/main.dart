import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_training/core/cache/cache_key.dart';
import 'package:flutter_training/core/theme/material_settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Função principal que inicializa o app
Future<void> main() async {
  // Carregando as variáveis de ambiente
  try {
    await dotenv.load(fileName: ".env");
  } catch (e, s) {
    log("Erro ao carregar o arquivo .env: $e -> $s");
  }

  // Carregando os widgets do Flutter
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializando o Gemini SDK
  Gemini.init(apiKey: dotenv.env['GEMINI_API_KEY'].toString());

  // Carregando as preferências do usuário
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  // Salvando as preferências do usuário em variáveis
  final int? color = prefs.getInt(Cachekey.themeColor.value);
  final bool isDarkMode = prefs.getBool(Cachekey.isDarkMode.value) ?? false;
  final bool isLogged = prefs.getBool(Cachekey.isLogged.value) ?? false;

  // Inicializando o app
  runApp(
    MaterialSettings(
      isDarkMode: isDarkMode,
      isLogged: isLogged,
      color: color,
    ),
  );
}
