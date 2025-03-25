import 'package:flutter/material.dart';
import 'package:flutter_training/core/cache/cache_key.dart';
import 'package:flutter_training/core/theme/material_settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final int? color = prefs.getInt(Cachekey.themeColor.value);
  final bool isDarkMode = prefs.getBool(Cachekey.isDarkMode.value) ?? false;
  final bool isLogged = prefs.getBool(Cachekey.isLogged.value) ?? false;

  runApp(
    MaterialSettings(
      isDarkMode: isDarkMode,
      isLogged: isLogged,
      color: color,
    ),
  );
}
