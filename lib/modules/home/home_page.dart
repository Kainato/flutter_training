import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_training/core/cache/cache_key.dart';
import 'package:flutter_training/core/enum/app_text_theme.dart';
import 'package:flutter_training/core/theme/theme_controller.dart';
import 'package:flutter_training/modules/auth/login_page.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widget/page/standard_scaffold.dart';

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
    final ThemeController themeController = Get.find();
    return StandardScaffold(
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
                TextButton(
                  child: Text(
                    'Mudar tema',
                    style: AppTextTheme.titleMedium.style.copyWith(
                      color: themeController.primaryColor,
                    ),
                  ),
                  onPressed: () {
                    Get.dialog(
                      AlertDialog(
                        content: BlockPicker(
                          pickerColor: themeController.primaryColor,
                          onColorChanged: (newcolor) {
                            themeController.primaryColor = newcolor;
                            prefs.setInt(
                              Cachekey.themeColor.value,
                              newcolor.toARGB32(),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.logout),
        onPressed: () {
          SharedPreferences.getInstance().then((value) {
            value.clear();
            Get.offAll(LoginPage());
          });
        },
      ),
    );
  }
}
