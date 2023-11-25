// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import '../model/user_model.dart';
import '../service/api_service.dart';

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

  Future<void> _fazerLogin() async {
    try {
      final userLogin = await getUserLogin();

      {
        for (User user in userLogin.users) {
          if (_usernameController.text == user.username &&
              _passwordController.text == user.password) {
            // Usuário autenticado com sucesso
            Navigator.pushReplacementNamed(context, '/home');
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
              decoration: const InputDecoration(labelText: 'Nome de Usuário'),
            ),
            const SizedBox(height: 20.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Senha'),
            ),
            const SizedBox(height: 40.0),
            ElevatedButton(
              onPressed: _fazerLogin,
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
