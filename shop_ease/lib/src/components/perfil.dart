//  Perfis de usuário: os usuários podem criar perfis, onde possam gerenciar informações pessoais, endereços de entrega, histórico de pedidos e preferências de comunicação.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_ease/src/components/login.dart';

class Perfil extends StatelessWidget {
  const Perfil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> usuarioLogado =
        Provider.of<DataProvider>(context).usuarioLogado;
    String numeroDoCartao = '';
    String urlImagem = '';

    if (usuarioLogado.length >= 5) {
      numeroDoCartao = usuarioLogado[4];
    }

    if (usuarioLogado.length >= 5) {
      urlImagem = usuarioLogado[2];
    }
    if (usuarioLogado.isNotEmpty) {
      return Scaffold(
          body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bem vindo(a), ${usuarioLogado.isNotEmpty ? usuarioLogado[0] : "Usuário Desconhecido"}',
              style: const TextStyle(
                fontSize: 20.2,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30.0),
            Image.network(
              urlImagem,
              width: 100,
              height: 100,
            ),
            const SizedBox(height: 10.0),
            Text(
                'Nome: ${usuarioLogado.isNotEmpty ? usuarioLogado[0] : "Usuário Desconhecido"} ${usuarioLogado.isNotEmpty ? usuarioLogado[1] : "Usuário Desconhecido"}'),
            const SizedBox(height: 10.0),
            Text(
                'Endereço de entrega: ${usuarioLogado.isNotEmpty ? usuarioLogado[3] : ''}'),
            const SizedBox(height: 10.0),
            Text(
                'Cartão de final: ${numeroDoCartao.substring(numeroDoCartao.length - 4)} com expiração em ${usuarioLogado.isNotEmpty ? usuarioLogado[5] : ''}'),
            const SizedBox(height: 40.0),
            const SizedBox(height: 40.0),
            ElevatedButton(
              onPressed: () {
                Provider.of<DataProvider>(context, listen: false)
                    .limparUsuario();
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/login', (route) => false);
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ));
    } else {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(
                backgroundColor: Colors.grey,
                // ignore: prefer_const_constructors
                valueColor: AlwaysStoppedAnimation<Color>(Colors.deepPurple),
              ),
              const SizedBox(height: 80.0),
              ElevatedButton(
                onPressed: () {
                  Provider.of<DataProvider>(context, listen: false)
                      .limparUsuario();
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('/login', (route) => false);
                },
                child: const Text('Logout'),
              ),
            ],
          ),
        ),
      );
    }
  }
}
