//  Perfis de usuário: os usuários podem criar perfis, onde possam gerenciar informações pessoais, endereços de entrega, histórico de pedidos e preferências de comunicação.

import 'package:flutter/material.dart';

class Perfil extends StatelessWidget {
  const Perfil({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Perfil',
        style: TextStyle(fontSize: 24.0),
      ),
    );
  }
}
