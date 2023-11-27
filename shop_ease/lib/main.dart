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
          scaffoldBackgroundColor: Colors.purple[200],
          primarySwatch: Colors.purple,
          primaryColor: Colors.purple[400],
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.purple, secondary: Colors.purple[300]),
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
