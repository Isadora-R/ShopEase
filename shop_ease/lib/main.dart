import 'package:flutter/material.dart';
import 'src/components/tab_control.dart';
import 'src/components/login.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => DataProvider(),
      child: MaterialApp(
        title: 'ShopEase',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          primaryColor: Colors.purple[300],
        ),
        initialRoute: '/login',
        routes: {
          '/login': (context) => const Login(),
          '/home': (context) => const MyTabControl(),
        },
      ),
    ),
  );
}
