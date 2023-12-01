import 'package:flutter/material.dart';
import 'src/components/tab_control.dart';
import 'src/components/login.dart';
import 'src/components/criar_perfil.dart';
import 'package:provider/provider.dart';
import 'src/components/editar_perfil.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DataProvider()),
        ChangeNotifierProvider(create: (context) => CriarPerfilProvider()),
        ChangeNotifierProvider(create: (context) => EditarPerfilProvider())

        // Adicione outros providers conforme necessário
        // ChangeNotifierProvider(create: (context) => OutroProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,//tira a 'faixinha vermelha'
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
