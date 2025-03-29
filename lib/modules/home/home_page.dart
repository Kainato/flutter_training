import 'package:flutter/material.dart';
import 'package:flutter_training/modules/home/home_getx_controller.dart';
import 'package:flutter_training/modules/home/tabs/settings/settings_page.dart';
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
    final HomeGetxController homeGetxController = Get.put(HomeGetxController());
    return Obx(() {
      return StandardScaffold(
        body: PageView(
          controller: homeGetxController.pageController,
          onPageChanged: (index) =>
              homeGetxController.currentIndex.value = index,
          children: const [
            Center(child: Text('Página inicial')),
            SettingsPage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: homeGetxController.currentIndex.value,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home_rounded),
              label: 'Página inicial',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              activeIcon: Icon(Icons.settings_rounded),
              label: 'Configurações',
            ),
          ],
          onTap: (index) => homeGetxController.changeIndex(index),
        ),
      );
    });
  }
}
