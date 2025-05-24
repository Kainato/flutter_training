import 'package:flutter/material.dart';
import 'package:flutter_training/widgets/standard_drawer.dart';

class StandardScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  const StandardScaffold({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      drawer: StandardDrawer(),
      body: body,
    );
  }
}
