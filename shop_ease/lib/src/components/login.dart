// ignore_for_file: use_build_context_synchronously

//  "username": "atuny0",
//  "password": "9uQFF1Lh"

// user_model e api_service para controlar a API --- site faz o modelo com base na api que vc mandar: https://app.quicktype.io/

import 'package:flutter/material.dart';
import '../model/user_model.dart';
import '../service/api_service.dart';
import 'package:provider/provider.dart';

Widget build(BuildContext context) {
  return Provider<DataProvider>(
      create: (_) => DataProvider(),
      builder: (context, child) {
        return Text(context.watch<DataProvider>().toString());
      });
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String jsonString = '{"users": [], "total": 0, "skip": 0, "limit": 0}';
  UserLogin? data;

  List<String> usuarioLogou = [];

  Future<void> _fazerLogin() async {
    try {
      final userLogin = await getUserLogin();

      {
        for (User user in userLogin.users) {
          if ((_usernameController.text == user.username ||
                  _usernameController.text == user.email) &&
              _passwordController.text == user.password) {
            usuarioLogou = [
              user.firstName,
              user.lastName,
              user.image,
              user.address.address,
              user.bank.cardNumber,
              user.bank.cardExpire,
            ];
            Navigator.pushReplacementNamed(
              context,
              '/home',
            );
            return;
          }
        }
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Credenciais inválidas')),
      );
    } catch (error) {
      // ignore: avoid_print
      print('Erro ao fazer login: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Erro ao fazer login')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration:
                  const InputDecoration(labelText: 'Nome de Usuário ou Email'),
            ),
            const SizedBox(height: 20.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Senha'),
            ),
            const SizedBox(height: 40.0),
            ElevatedButton(
              onPressed: () async {
                await _fazerLogin();
                for (int i = 0; i < usuarioLogou.length; i++) {
                  context.read<DataProvider>().adicionarItem(usuarioLogou[i]);
                }
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

class DataProvider with ChangeNotifier {
  // ignore: prefer_final_fields
  List<String> _usuarioLogado = [];

  List<String> get usuarioLogado => _usuarioLogado;

  void adicionarItem(String item) {
    _usuarioLogado.add(item);
    notifyListeners();
  }

  void limparUsuario() {
    _usuarioLogado = [];
    notifyListeners();
  }
}
