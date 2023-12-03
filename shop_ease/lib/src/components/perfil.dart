/* Perfis de usuário: os usuários podem criar perfis, onde possam gerenciar informações pessoais, endereços de entrega, histórico de pedidos e preferências de comunicação.*/

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_ease/src/components/criar_perfil.dart';
import 'package:shop_ease/src/components/editar_perfil.dart';
import 'package:shop_ease/src/components/historico.dart';
import 'package:shop_ease/src/components/login.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key});

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

    List<String> usuarioEditado =
        Provider.of<EditarPerfilProvider>(context).usuarioLogado;

    void editouPerfil() {
      setState(() {
        usuarioEditado;
      });
    }

    if (usuarioEditado.isNotEmpty && usuarioLogado.isNotEmpty) {
      print('Tem usuário editado: $usuarioEditado');
      editouPerfil();
      {
        usuarioLogado[0] = usuarioEditado[3];
        usuarioLogado[1] = usuarioEditado[4];
        usuarioLogado[3] = usuarioEditado[5];
        usuarioLogado[4] = usuarioEditado[6];
        usuarioLogado[5] = usuarioEditado[7];
        usuarioLogado[6] = usuarioEditado[8];
        usuarioLogado[7] = usuarioEditado[10];
        usuarioLogado[8] = usuarioEditado[9];
        usuarioLogado[9] = usuarioEditado[2];
        usuarioLogado[10] = usuarioEditado[0];
        usuarioLogado[11] = usuarioEditado[1];
      }
    } else if (usuarioEditado.isNotEmpty && usuarioLogado_2.isNotEmpty) {
      print('Tem usuário editado: $usuarioEditado');
      usuarioLogado_2 = usuarioEditado;
    } else {
      print('Usuário original');
    }

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
          child: Container(
            transformAlignment: Alignment.center,
            width: 450,
            height: 650,
            decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.circular(10),
            ),
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
                  'Nome: ${usuarioLogado.isNotEmpty ? usuarioLogado[0] : usuarioLogado_2[3]} ${usuarioLogado.isNotEmpty ? usuarioLogado[1] : usuarioLogado_2[4]}',
                  style: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10.0),
                Text(
                  'Endereço de entrega: ${usuarioLogado.isNotEmpty ? usuarioLogado[3] : usuarioLogado_2[5]}',
                  style: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10.0),
                Text(
                  'Cartão de final: ${numeroDoCartao.substring(numeroDoCartao.length - 4)} com expiração em ${usuarioLogado.isNotEmpty ? usuarioLogado[5] : usuarioLogado_2[7]}',
                  style: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EditarPerfil(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(175, 35),
                  ),
                  child: const Text('Editar perfil'),
                ),
                const SizedBox(height: 2.0),
                ElevatedButton(
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Historico()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(175, 35),
                  ),
                  child: const Text('Histórico de pedidos'),
                ),
                const SizedBox(height: 2.0),
                ElevatedButton(
                  onPressed: () {
                    Provider.of<DataProvider>(context, listen: false)
                        .limparUsuario();
                    Provider.of<CriarPerfilProvider>(context, listen: false)
                        .limparUsuario();
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil('/login', (route) => false);
                    usuarioEditado.clear();
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(175, 35),
                  ),
                  child: const Text('Logout'),
                ),
              ],
            ),
          ),
        ),
      );
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
                  usuarioEditado.clear();
                  // Provider.of<CarrinhoProvider>(context, listen: false)
                  //     .limpaCarrinho();
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(150, 35),
                ),
                child: const Text('Logout'),
              ),
            ],
          ),
        ),
      );
    }
  }
}
