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

// class MainApp extends StatelessWidget {
//   const MainApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'ShopEase',
//       theme: ThemeData(
//         primarySwatch: Colors.purple,
//         primaryColor: Colors.purple[300],
//       ),
//       initialRoute: '/login', // Defina a rota inicial como a tela de login
//       routes: {
//         '/login': (context) =>
//             const Login(), // Associe a rota '/login' à sua tela de login
//         '/home': (context) =>
//             const MyTabControl(), // Associe a rota '/home' ao seu controle de guias
//       },
//     );
//   }
// }
