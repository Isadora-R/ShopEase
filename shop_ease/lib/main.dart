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
          scaffoldBackgroundColor: Colors.deepPurple[200],
          primarySwatch: Colors.deepPurple,
          primaryColor: Colors.deepPurple[400],
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.deepPurple, secondary: Colors.deepPurple[300]),
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
