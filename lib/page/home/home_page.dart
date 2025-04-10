import 'package:flutter/material.dart';
import 'package:flutter_training/page/home/home_controller.dart';

import '../../widget/layout/ft_scaffold.dart';
import 'tabs/home_tab.dart';
import 'tabs/settings_tab.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = HomeController();
    return FTScaffold(
      title: 'Bem vindo ao Flutter Guide!',
      body: ValueListenableBuilder<int>(
        valueListenable: controller.currentIndex,
        builder: (context, index, child) {
          return PageView(
            controller: controller.pageController,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (index) => controller.currentIndex.value = index,
            children: const [
              HomeTab(),
              SettingsTab(),
            ],
          );
        },
      ),
      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: controller.currentIndex,
        builder: (context, index, child) {
          return BottomNavigationBar(
            currentIndex: index,
            onTap: controller.onPageChanged,
            items: const [
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
        },
      ),
    );
  }
}
