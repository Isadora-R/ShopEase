﻿import 'package:flutter/material.dart';
import 'package:shop_ease/src/components/carrinho.dart';
import 'package:shop_ease/src/model/products_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

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
                style: const TextStyle(
                    fontSize: 30.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 350,
                  viewportFraction: 0.5,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: false,
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
                              horizontal: 8.0, vertical: 8.0),
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

            Container(
              padding: const EdgeInsets.all(8.0),
              width: double.infinity,
              color: Colors.deepPurple[500],
              child: Text(
                'Preço: R\$ ${widget.product.price} - Oferta: ${widget.product.discountPercentage}% de desconto no pagamento com PIX',
                style: const TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20.0),

            ElevatedButton(
              onPressed: () {
                // Adicionar o produto ao carrinho

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Carrinho()),
                );
              },
              child: const Text('Adicionar ao Carrinho'),
            ),

            const SizedBox(height: 10.0),

            Container(
              padding: const EdgeInsets.all(8.0),
              width: double.infinity,
              color: Colors.deepPurple[500],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Descrição:',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    '${widget.product.description}, da marca: ${widget.product.brand}',
                    style: const TextStyle(fontSize: 15.0, color: Colors.white),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LinearProgressIndicator(
                  backgroundColor: Colors.grey,
                  // ignore: prefer_const_constructors
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.deepPurple),
                  value: (widget.product.stock.toDouble() / 200),
                ),
                const SizedBox(height: 5.0),
                Text(
                  'Quantidade em estoque: ${widget.product.stock}',
                  style: const TextStyle(
                      color: Colors.deepPurple, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            const Text(
              'Avaliação dos usuários:',
              style: TextStyle(
                  color: Colors.deepPurple, fontWeight: FontWeight.bold),
            ),
            RatingBarIndicator(
              rating: widget.product.rating,
              itemBuilder: (context, index) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              itemCount: 5,
              itemSize: 50.0,
              direction: Axis.horizontal,
            ),

            //Colocar o restante das descrições e um botão que adiciona ao carrinho!!!
          ],
        ),
      ),
    );
  }
}
