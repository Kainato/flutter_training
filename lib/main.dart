import 'package:flutter/material.dart';
import 'package:flutter_training/core/cache/cache_key.dart';
import 'package:flutter_training/core/material_settings.dart';
import 'package:flutter_training/core/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final int? color = prefs.getInt(Cachekey.themeColor.value);
  final bool isDarkMode = prefs.getBool(Cachekey.isDarkMode.value) ?? false;
  final bool isLogged = prefs.getBool(Cachekey.isLogged.value) ?? false;

  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(
        color != null ? Color(color) : Colors.blue,
      ),
      child: MaterialSettings(
        isDarkMode: isDarkMode,
        isLogged: isLogged,
      ),
    ),
  );
}
