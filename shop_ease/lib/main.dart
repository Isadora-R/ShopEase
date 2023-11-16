import 'package:flutter/material.dart';
import 'src/components/tab_control.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ShopEase',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        primaryColor: Colors.purple[300],
      ),
      home: const MyTabControl(), // Use o TabControl como a tela inicial
    );
  }
}
