// tab_control.dart

import 'package:flutter/material.dart';
import 'rastreamento.dart';
import 'perfil.dart';

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
    _tabController =
        TabController(length: 2, vsync: this); // Número total de abas
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minha Loja'),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
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
          Rastreamento(),
          Perfil(),
        ],
      ),
    );
  }
}
