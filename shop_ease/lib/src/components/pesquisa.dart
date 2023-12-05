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
  String _textoPesq = '';
  // List<Product> productsTudo;
  dynamic productsTudo; // contem todos os produtos, recebidos da api
  dynamic products; //é filtrado em relação à pesquisa
  bool pesquisando = false;

  @override
  void initState() {
    super.initState();
    produtosFuture = getProducts();
  }

  List<Product> filtaLista() {
    List<Product> temp = [];
    products.forEach((item) {
      if (item.title.toLowerCase().contains(_textoPesq.toLowerCase())) {
        temp.add(item);
      }
    });
    return temp;
  }

  void _pesquisa() {
    //altera o valor da lista products
    /*if (_textoPesq == '') {
      products = productsTudo;
      pesquisando = false;
      setState(() {
        products;
      });
    } else {
      setState(() {
        products = filtaLista(); //funcao que altere esta lista
      });
    }*/
    products = productsTudo;
    setState(() {
      products = filtaLista();
    });
    pesquisando = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: TextField(
              onChanged: (texto) {
                _textoPesq = texto;
                _pesquisa();
              },
              decoration: const InputDecoration(
                labelText: 'Pesquisar',
              ),
            ),
            actions: [
              IconButton(onPressed: _pesquisa, icon: const Icon(Icons.search))
            ]),
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
                if (!pesquisando) {
                  productsTudo = snapshot.data!.products;
                  products = productsTudo;
                }

                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
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
                          padding: const EdgeInsets.all(20),
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
                              const Divider(
                                color: Colors.purple,
                                height: 10,
                                thickness: 2,
                                indent: 0,
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: RatingBarIndicator(
                                  rating: produto.rating,
                                  itemBuilder: (context, index) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  itemCount: 5,
                                  itemSize: 15,
                                  direction: Axis.horizontal,
                                ),
                              ),

                              /// const SizedBox(height: 20.0),
                              Text(
                                produto.title,
                                style: const TextStyle(fontSize: 25),
                                textAlign: TextAlign.center,
                              ),

                              const SizedBox(height: 20.0),

                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '${produto.description.substring(0, 43)}...',
                                ),
                              ),

                              const SizedBox(height: 5.0),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text('R\$ ${produto.price},00',
                                    style: const TextStyle(fontSize: 20)),
                              ),

                              const SizedBox(height: 50.0),
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
                                  style: TextStyle(fontSize: 13),
                                ),
                              ),

                              const SizedBox(height: 5.0),
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
