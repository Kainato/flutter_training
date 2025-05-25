import 'package:flutter/material.dart';

import '../app/home_page.dart';
import '../app/increment_page.dart';

class StandardDrawer extends StatelessWidget {
  const StandardDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(),
            child: Text(
              'Drawer Header',
              style: Theme.of(context).textTheme.headlineLarge,
              maxLines: 2,
            ),
          ),
          ListTile(
            title: const Text('Página inicial'),
            leading: const Icon(Icons.home),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
          ListTile(
            title: const Text('Botões'),
            leading: const Icon(Icons.circle),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const IncrementPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
