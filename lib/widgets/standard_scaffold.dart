import 'package:flutter/material.dart';
import 'package:flutter_training/widgets/standard_drawer.dart';

class StandardScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final Widget? fab;
  final List<Widget> actions;

  const StandardScaffold({
    super.key,
    required this.title,
    required this.body,
    this.fab,
    this.actions = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title), actions: actions),
      drawer: StandardDrawer(),
      body: body,
      floatingActionButton: fab,
    );
  }
}
