﻿import 'package:flutter/material.dart';
import '../model/products_model.dart';
import '../service/products_service.dart';
import 'produto_clicado.dart';

class Pesquisa extends StatefulWidget {
  // Aqui vem coisas nao alteraveis
  const Pesquisa({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _PesquisaCreate createState() => _PesquisaCreate();
}

class _PesquisaCreate extends State<Pesquisa> {
  //Aqui vem coisas alteraveis
  late Future<Welcome> produtosFuture;

  @override
  void initState() {
    super.initState();
    produtosFuture = getProducts();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Welcome>(
        future: produtosFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Algo deu errado: ${snapshot.error}'));
          } else {
            List<Product> products = snapshot.data!.products;
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                Product produto = products[index];
                return ListTile(
                  title: Text(produto.title),
                  subtitle: Text(produto.description),
                  leading: Image(image: NetworkImage(produto.thumbnail)),
                  onTap: () => print('tab'),
                  trailing: Text(produto.price.toString() + ',00'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
