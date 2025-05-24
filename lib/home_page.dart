import 'package:flutter/material.dart';
import 'package:flutter_training/widgets/standard_scaffold.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return StandardScaffold(
      title: 'Home Page',
      body: Center(child: Text('Hello World!')),
    );
  }
}
