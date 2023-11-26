//  Perfis de usuário: os usuários podem criar perfis, onde possam gerenciar informações pessoais, endereços de entrega, histórico de pedidos e preferências de comunicação.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_ease/src/components/login.dart';

class Perfil extends StatelessWidget {
  const Perfil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Acesse a variável compartilhada usando Provider
    List<String> usuarioLogado =
        Provider.of<DataProvider>(context).usuarioLogado;
    String numeroDoCartao = usuarioLogado[4];

    return Scaffold(
        appBar: AppBar(
          title: const Text('Perfil'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                usuarioLogado[2],
                width: 100,
                height: 100,
              ),
              const SizedBox(height: 10.0),
              Text(
                  'Bem vindo(a), ${usuarioLogado.isNotEmpty ? usuarioLogado[0] : "Usuário Desconhecido"}'),
              const SizedBox(height: 30.0),
              Text(
                'Nome:  ${usuarioLogado[0]} ${usuarioLogado[1]}',
              ),
              const SizedBox(height: 10.0),
              Text(
                'Endereço de entrega:  ${usuarioLogado[3]}',
              ),
              const SizedBox(height: 10.0),
              Text(
                  'Cartão de final: ${numeroDoCartao.substring(numeroDoCartao.length - 4)} com expiração em ${usuarioLogado[5]}'),
              const SizedBox(height: 40.0),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the second screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Login()),
                  );
                },
                child: const Text('Logout'),
              ),
            ],
          ),
        ));
  }
}
