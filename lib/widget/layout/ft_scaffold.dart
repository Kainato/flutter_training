import 'package:flutter/material.dart';
import 'package:flutter_training/core/extensions/build_context_extension.dart';

class FTScaffold extends StatelessWidget {
  final String title;
  final Widget? bottomAppBar;
  final Widget body;
  final Widget? fab;
  final List<BottomNavigationBarItem> bottomNavigationBar;

  const FTScaffold({
    super.key,
    required this.title,
    this.bottomAppBar,
    required this.body,
    this.fab,
    this.bottomNavigationBar = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: context.titleLarge,
        ),
        centerTitle: true,
        backgroundColor: context.primaryColor,
        automaticallyImplyLeading: false,
        bottom: bottomAppBar != null
            ? PreferredSize(
                preferredSize: const Size.fromHeight(56),
                child: bottomAppBar!,
              )
            : null,
      ),
      body: body,
      floatingActionButton: fab,
      bottomNavigationBar: bottomNavigationBar.isNotEmpty
          ? BottomNavigationBar(items: bottomNavigationBar)
          : null,
    );
  }
}
