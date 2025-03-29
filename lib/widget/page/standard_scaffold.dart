import 'package:flutter/material.dart';

class StandardScaffold extends StatelessWidget {
  final Widget body;
  final FloatingActionButton? floatingActionButton;
  final Widget? bottomNavigationBar;

  const StandardScaffold({
    super.key,
    required this.body,
    this.floatingActionButton,
    this.bottomNavigationBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Standard Scaffold'),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          behavior: HitTestBehavior.opaque,
          child: Padding(padding: const EdgeInsets.all(16), child: body),
        ),
      ),
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
