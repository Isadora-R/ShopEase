//import 'dart:html';

import 'package:flutter/material.dart';
import '../model/products_model.dart';
import '../service/products_service.dart';
import 'produto_clicado.dart';
import 'package:provider/provider.dart';
import 'package:shop_ease/src/components/carrinho.dart';

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
        body: Padding(
      padding: const EdgeInsets.all(15),
      child: FutureBuilder<Welcome>(
        future: produtosFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Algo deu errado: ${snapshot.error}'));
          } else {
            List<Product> products = snapshot.data!.products;
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 30,
                mainAxisSpacing: 20,
                // childAspectRatio: 0.5,
                mainAxisExtent: 400,
              ),
              itemBuilder: (context, index) {
                Product produto = products[index];
                return GestureDetector(
                    //animação ao toque, tornar menos estático
                    onTap: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ProdutoClicado(product: produto)),
                          )
                        },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: NetworkImage(produto.thumbnail),
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover, //mudar para cover
                          ),
                          Text(
                            produto.title,
                            style: const TextStyle(fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                          Text(produto.description),
                          Text('R\$ ${produto.price},00',
                              style: const TextStyle(fontSize: 15)),
                          ElevatedButton(
                            onPressed: () {
                              Provider.of<CarrinhoProvider>(context,
                                      listen: false)
                                  .adicionarAoCarrinho(Produto(
                                      nome: produto.title,
                                      preco: produto.price.toDouble(),
                                      imagem: produto.thumbnail,
                                      desconto:
                                          produto.discountPercentage));
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Carrinho()),
                              );
                            },
                            child: const Text('Adicionar ao carrinho',
                                         style: TextStyle(fontSize: 10),
                            ),
                          ),
                        ],
                      ),
                    ));
              },
              itemCount: products.length,
            );
            /*return ListView.builder(
              itemCount: products.length,
              // itemExtent: 150,
              itemBuilder: (context, index) {
                Product produto = products[index];
                return ListTile(
                  title: Text(produto.title, style: TextStyle(fontSize: 20)),
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
                      style: TextStyle(fontSize: 15)),
                );
              },
            );*/
          }
        },
      ),
    ));
  }
}
