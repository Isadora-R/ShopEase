// tab_control.dart

import 'package:flutter/material.dart';
import 'rastreamento.dart';
import 'perfil.dart';
import 'carrinho.dart';
import 'inicio.dart';
import 'pesquisa.dart';
//import 'favoritos.dart';

class MyTabControl extends StatefulWidget {
  const MyTabControl({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyTabControlState createState() => _MyTabControlState();
}

class _MyTabControlState extends State<MyTabControl>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: 5,
        vsync:
            this); // Número total de abas deve mudar sempre que adicionar e reiniciar o app com flutter run
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ShopEase'),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(
              icon: Icon(Icons.home),
            ),
            Tab(
              icon: Icon(Icons.search),
            ),
            Tab(
              icon: Icon(Icons.shopping_cart),
            ),
            Tab(
              icon: Icon(Icons.local_shipping_sharp),
            ),
            Tab(
              icon: Icon(Icons.person),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          Inicio(),
          Pesquisa(),
          Carrinho(),
          Rastreamento(),
          Perfil(),
        ],
      ),
    );
  }
}
