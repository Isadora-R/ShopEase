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
    String numeroDoCartao = usuarioLogado.length > 4 ? usuarioLogado[4] : '';
    String urlImagem = usuarioLogado.length > 2 ? usuarioLogado[2] : '';

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
          Text('Nome: ${usuarioLogado[0]} ${usuarioLogado[1]}'),
          const SizedBox(height: 10.0),
          Text(
              'Endereço de entrega: ${usuarioLogado.isNotEmpty ? usuarioLogado[3] : ''}'),
          const SizedBox(height: 10.0),
          Text(
              'Cartão de final: ${numeroDoCartao.substring(numeroDoCartao.length - 4)} com expiração em ${usuarioLogado.isNotEmpty ? usuarioLogado[5] : ''}'),
          const SizedBox(height: 40.0),
          ElevatedButton(
            onPressed: () {
              Provider.of<DataProvider>(context, listen: false).limparUsuario();
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/login', (route) => false);
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    ));
  }
}
