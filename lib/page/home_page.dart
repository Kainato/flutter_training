import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
// import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:flutter_training/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/cache/cache_key.dart';
import '../widget/layout/ft_scaffold.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    _loadSharedPreferences();
  }

  Future<void> _loadSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return FTScaffold(
      title: 'Bem vindo ao Flutter Guide!',
      body: SafeArea(
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
                    prefs.setInt(
                        Cachekey.themeColor.value, newcolor.toARGB32());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Página inicial',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Configurações',
        ),
      ],
    );
  }
}
