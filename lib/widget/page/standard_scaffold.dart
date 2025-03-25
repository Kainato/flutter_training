import 'package:flutter/material.dart';

class StandardScaffold extends StatelessWidget {
  final Widget body;
  final FloatingActionButton? floatingActionButton;

  const StandardScaffold({
    super.key,
    required this.body,
    this.floatingActionButton,
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
          child: body,
        ),
      ),
      floatingActionButton: floatingActionButton,
    );
  }
}
