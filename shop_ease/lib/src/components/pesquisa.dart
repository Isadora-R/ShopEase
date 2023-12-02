// import 'dart:html';

import 'package:flutter/material.dart';
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
              // itemExtent: 150,
              itemBuilder: (context, index) {
                Product produto = products[index];
                return ListTile(
                  title: Text(produto.title, style: const TextStyle(fontSize: 20)),
                  subtitle: Text(produto.description),
                  leading: Image(
                      image: NetworkImage(produto.thumbnail),
                      width: 150,
                      height: 300),
                  onTap: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ProdutoClicado(product: produto)),
                    )
                  },
                  trailing: Text('R\$ ${produto.price},00',
                      style: const TextStyle(fontSize: 15)),
                );
              },
            );
          }
        },
      ),
    );
  }
}
