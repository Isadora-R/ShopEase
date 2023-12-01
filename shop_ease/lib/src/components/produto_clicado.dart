import 'package:flutter/material.dart';
import 'package:shop_ease/src/model/products_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
//import 'inicio.dart';

class ProdutoClicado extends StatefulWidget {
  final Product product;
  const ProdutoClicado({super.key, required this.product});

  @override
  // ignore: library_private_types_in_public_api
  _ProdutoClicadoState createState() => _ProdutoClicadoState();
}

class _ProdutoClicadoState extends State<ProdutoClicado> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Produto'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(0.5),
              child: Text(
                widget.product.title,
                style: const TextStyle(fontSize: 30.0),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: CarouselSlider(
                options: CarouselOptions(
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.4,
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
                items: widget.product.images
                    .map((item) => Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 4.0, vertical: 60.0),
                          decoration: const BoxDecoration(
                            color: Colors.purple,
                          ),
                          child: Image.network(
                            item,
                            fit: BoxFit.contain,
                          ),
                        ))
                    .toList(),
              ),
            ),
            Text(
              'Preço: R\$ ${widget.product.price}',
              style: const TextStyle(fontSize: 20.0),
            ),
            const Text(
              'Descrição',
              style: TextStyle(fontSize: 20.0),
            ),
            Text(
              widget.product.description,
              style: const TextStyle(fontSize: 15.0),
            ),
          ],
        ),
      ),
    );
  }
}
