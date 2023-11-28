/* Perfis de usuário: os usuários podem criar perfis, onde possam gerenciar informações pessoais, endereços de entrega, histórico de pedidos e preferências de comunicação.*/

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_ease/src/components/criar_perfil.dart';
import 'package:shop_ease/src/components/editar_perfil.dart';
import 'package:shop_ease/src/components/login.dart';

class Perfil extends StatefulWidget {
  const Perfil({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  @override
  Widget build(BuildContext context) {
    List<String> usuarioLogado =
        Provider.of<DataProvider>(context).usuarioLogado;
    List<String> usuarioLogado_2 =
        Provider.of<CriarPerfilProvider>(context).usuarioLogado;
    String numeroDoCartao = '';
    String urlImagem = '';

    if (usuarioLogado.length >= 5) {
      numeroDoCartao = usuarioLogado[4];
    } else if (usuarioLogado_2.length >= 7) {
      numeroDoCartao = usuarioLogado_2[6];
    }

    if (usuarioLogado.length >= 5) {
      urlImagem = usuarioLogado[2];
    } else if (usuarioLogado_2.length >= 7) {
      urlImagem = 'https://robohash.org/RFH.png?set=set4';
    }

    if (usuarioLogado.isNotEmpty || usuarioLogado_2.isNotEmpty) {
      return Scaffold(
          body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bem vindo(a), ${usuarioLogado.isNotEmpty ? usuarioLogado[0] : usuarioLogado_2[3]}',
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
                'Nome: ${usuarioLogado.isNotEmpty ? usuarioLogado[0] : usuarioLogado_2[3]} ${usuarioLogado.isNotEmpty ? usuarioLogado[1] : usuarioLogado_2[4]}'),
            const SizedBox(height: 10.0),
            Text(
                'Endereço de entrega: ${usuarioLogado.isNotEmpty ? usuarioLogado[3] : usuarioLogado_2[5]}'),
            const SizedBox(height: 10.0),
            Text(
                'Cartão de final: ${numeroDoCartao.substring(numeroDoCartao.length - 4)} com expiração em ${usuarioLogado.isNotEmpty ? usuarioLogado[5] : usuarioLogado_2[7]}'),
            const SizedBox(height: 40.0),
            const SizedBox(height: 40.0),
            ElevatedButton(
              onPressed: () async {
                // Navegar para a tela de edição e aguardar o retorno
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EditarPerfil(),
                  ),
                );

                // Atualizar os dados na tela de perfil após a edição
                setState(() {});
              },
              child: const Text('Editar perfil'),
            ),
            const SizedBox(height: 40.0),
            ElevatedButton(
              onPressed: () {
                Provider.of<DataProvider>(context, listen: false)
                    .limparUsuario();
                Provider.of<CriarPerfilProvider>(context, listen: false)
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
