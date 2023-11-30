import 'package:flutter/material.dart';
import '../service/products_service.dart';

class Pesquisa extends StatelessWidget {
  const Pesquisa({super.key});

  Future<void> _carregaProdutos() async {
    try {
      final produtos = await getProducts();
    } catch (error) {
      // ignore: avoid_print
      print('Erro ao carregar produtos: $error');
      /* ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Erro ao carregar produtos')),
      );*/
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          Padding(
              padding: EdgeInsets.all(2.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Bem vindo, faça login psdadasara continuar!',
                      style: TextStyle(
                          color: Colors.white,
                          decorationThickness: 2.0,
                          fontSize: 20.2),
                    ),
                    Text(
                      'Bem vindo, faça login para continuar!',
                      style: TextStyle(
                          color: Colors.white,
                          decorationThickness: 2.0,
                          fontSize: 20.2),
                    ),
                  ]))
        ],
      ),
    );
  }
}

