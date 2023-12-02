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
            this); // Número total de abas. E sempre que acrescentar aba mudar aqui. Quebrar o programa e começar de novo!!!
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: const Image(
          image: AssetImage('lib/src/assets/logooo.png'),
          fit: BoxFit.contain,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0, // Remove a sombra da AppBar
      ),
      bottomNavigationBar: Container(
        color: Theme.of(context).primaryColor,
        child: TabBar(
          controller: _tabController,
          tabs: [
            Tab(
              icon: Icon(
                Icons.home,
                color: Colors.purple[900],
              ),
            ),
            Tab(
              icon: Icon(
                Icons.search,
                color: Colors.purple[900],
              ),
            ),
            Tab(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.purple[900],
              ),
            ),
            Tab(
              icon: Icon(
                Icons.local_shipping_sharp,
                color: Colors.purple[900],
              ),
            ),
            Tab(
              icon: Icon(
                Icons.person,
                color: Colors.purple[900],
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          const Inicio(),
          const Pesquisa(),
          const Carrinho(),
          Rastreamento(
            aprovado: false,
          ),
          const Perfil(),
        ],
      ),
    );
  }
}
