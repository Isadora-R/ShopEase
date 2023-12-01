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
      body: FutureBuilder<Welcome>(
        future: produtosFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Algo deu errado: ${snapshot.error}'));
          } else {
            List<Product> products = snapshot.data!.products;
            return Center(
              child: CarouselSlider(
                options: CarouselOptions(
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 2),
                  autoPlayAnimationDuration: const Duration(milliseconds: 1000),
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
                            color: Colors.purple,
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
    );
  }
}
