import 'package:flutter/material.dart';

class LoadingAppPage extends StatelessWidget {
  /// Página de carregamento do app.
  const LoadingAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carregando...'),
      ),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
