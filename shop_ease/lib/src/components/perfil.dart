//  Perfis de usuário: os usuários podem criar perfis, onde possam gerenciar informações pessoais, endereços de entrega, histórico de pedidos e preferências de comunicação.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_ease/src/components/login.dart';

class Perfil extends StatelessWidget {
  const Perfil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Acesse a variável compartilhada usando Provider
    String variavelCompartilhada =
        Provider.of<DataProvider>(context).variavelCompartilhada;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Bem vindo, $variavelCompartilhada'),
      ),
    );
  }
}
