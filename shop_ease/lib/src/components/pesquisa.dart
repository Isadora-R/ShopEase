//import 'dart:html';

import 'package:flutter/material.dart';
import '../model/products_model.dart';
import '../service/products_service.dart';
import 'produto_clicado.dart';
import 'package:provider/provider.dart';
import 'package:shop_ease/src/components/carrinho.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Pesquisa extends StatefulWidget {
  // Aqui vem coisas nao alteraveis
  const Pesquisa({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _PesquisaCreate createState() => _PesquisaCreate();
}

class _PesquisaCreate extends State<Pesquisa> {
  //Aqui vem coisas alteraveis
  final TextEditingController textoPesq = TextEditingController();
  late Future<Welcome> produtosFuture;

  @override
  void initState() {
    super.initState();
    produtosFuture = getProducts();
  }

/*
Future<List<Product>> searchProducts(String query) async {
  final products = await getProducts();
  return products.where((product) => product.name.contains(query)).toList();
}
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       /* appBar: AppBar(
          // title: const Text('Pesquisar'),
          actions: [
            TextField(
              controller: textoPesq,
              decoration: const InputDecoration(
                labelText: 'Pesquisar',
                icon: Icon(Icons.search)
              ),
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.search))
          ],
        ),*/
        body: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: FutureBuilder<Welcome>(
            future: produtosFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(
                    child: Text('Algo deu errado: ${snapshot.error}'));
              } else {
                List<Product> products = snapshot.data!.products;
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 30,
                    mainAxisSpacing: 20,
                    mainAxisExtent: 500,
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
                        // child: const InkWell(splashColor: Colors.red),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // const InkWell(splashColor: Colors.red,) ,
                              Image(
                                image: NetworkImage(produto.thumbnail),
                                width: 150,
                                height: 150,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(height: 7.0),
                              Text(
                                produto.title,
                                style: const TextStyle(fontSize: 25),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 2.0),
                              Text(
                                '${produto.description.substring(0, 43)}...',
                              ),
                              Text('R\$ ${produto.price},00',
                                  style: const TextStyle(fontSize: 20)),
                              const SizedBox(height: 5.0),
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
                                child: const Text(
                                  'Adicionar ao carrinho',
                                  style: TextStyle(fontSize: 10),
                                ),
                              ),
                              RatingBarIndicator(
                                rating: produto.rating,
                                itemBuilder: (context, index) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                itemCount: 5,
                                itemSize: 20,
                                direction: Axis.horizontal,
                              ),
                            ],
                          ),
                        ));
                  },
                  itemCount: products.length,
                );
              }
            },
          ),
        ));
  }
}
