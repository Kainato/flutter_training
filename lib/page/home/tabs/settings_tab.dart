import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/cache/cache_key.dart';
import '../../../theme/theme_provider.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  /// Instância de `SharedPreferences` que armazena as preferências do usuário em cache.
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    _loadSharedPreferences();
  }

  /// Carrega as preferências em cache do dispositivo
  Future<void> _loadSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    /// Instância do `ThemeProvider` que gerencia o tema da aplicação.
    final ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        behavior: HitTestBehavior.opaque,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text('Hello World!'),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Digite algo',
                  border: OutlineInputBorder(),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: themeProvider.primaryColor,
                ),
                onPressed: () {
                  themeProvider.primaryColor =
                      themeProvider.primaryColor == Colors.blue
                          ? Colors.red
                          : Colors.blue;
                },
                child: Text(
                  'Clique aqui',
                  style: themeProvider.primaryColor.computeLuminance() > 0.5
                      ? TextStyle(color: Colors.black)
                      : TextStyle(color: Colors.white),
                ),
              ),
              BlockPicker(
                pickerColor: themeProvider.primaryColor,
                onColorChanged: (newcolor) {
                  themeProvider.primaryColor = newcolor;
                  prefs.setInt(Cachekey.themeColor.value, newcolor.toARGB32());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
