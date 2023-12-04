import 'package:flutter/material.dart';
import '../model/products_model.dart';
import '../service/products_service.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'produto_clicado.dart';

class Inicio extends StatefulWidget {
  const Inicio({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  late Future<Welcome> produtosFuture;
  @override
  void initState() {
    super.initState();
    produtosFuture = getProducts();
  }

  // https://api.flutter.dev/flutter/widgets/ConnectionState.html

  // https://pub.dev/packages/carousel_slider/example

  //se tirar os ifs a tela da erro enquanto a api carrega
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          const SizedBox(height: 15.0),
          const Text(
            'DESCOBERTAS DO DIA',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30.0),
          Container(
            transformAlignment: Alignment.center,
            width: 900,
            height: 450,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
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
                  return Center(
                    child: CarouselSlider(
                      options: CarouselOptions(
                        aspectRatio: 4 / 3,
                        viewportFraction: 0.8,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 2),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 1000),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                      ),
                      items: products.map((product) {
                        return Builder(
                          builder: (BuildContext context) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ProdutoClicado(product: product)),
                                );
                                print('Item clicado: ${product.title}');
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 8.0),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: Image.network(
                                  product.thumbnail,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                  );
                }
              },
            ),
          ),
          const SizedBox(height: 30.0),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.pix, color: Colors.white),
                // SizedBox(width: 8),
                Text(
                  'Todos os itens com desconto para pagamentos via pix',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
