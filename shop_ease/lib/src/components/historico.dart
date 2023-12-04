// ignore_for_file: prefer_final_fields

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PedidoHistorico {
  final String nome;
  final double preco;
  PedidoHistorico({required this.nome, required this.preco});
}

class Historico extends StatelessWidget {
  const Historico({super.key});

  @override
  Widget build(BuildContext context) {
    var pedidoProvider = Provider.of<PedidoProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Histórico de Pedidos'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: pedidoProvider.historico.length,
        itemBuilder: (context, index) {
          PedidoHistorico pedido = pedidoProvider.historico[index];

          return Center(
            child: Container(
              width: 450,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListTile(
                    title: Text(
                      'Pedido #${index + 1} - ${pedido.nome}',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.deepPurple[900],
                      ),
                      onPressed: () {
                        pedidoProvider.apagaItem(pedido);
                      },
                    ),
                    subtitle: const Text(
                      'Clique para ver detalhes do pedido',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      _mostrarDetalhesPedido(context, pedido);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _mostrarDetalhesPedido(BuildContext context, PedidoHistorico pedido) {
    DateTime hoje = DateTime.now();
    String dataFormatada = "${hoje.day}/${hoje.month}/${hoje.year}";
    var protocolo = Random().nextInt(50000);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Detalhes do Pedido ${pedido.nome}'),
          content: Text(
              'Valor: R\$ ${pedido.preco} \nPedido foi feito em: $dataFormatada \nProtocolo do pedido: #$protocolo'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Fechar'),
            ),
          ],
        );
      },
    );
  }
}

class PedidoProvider extends ChangeNotifier {
  List<PedidoHistorico> _historico = [];

  List<PedidoHistorico> get historico => _historico;

  void adicionarPedido(PedidoHistorico pedido) {
    _historico.add(pedido);
    notifyListeners();
  }

  void removePedido() {
    _historico.removeLast();
    notifyListeners();
  }

  void limpaHistorico() {
    _historico.clear();
    notifyListeners();
  }

  void apagaItem(PedidoHistorico pedido) {
    _historico.remove(pedido);
    notifyListeners();
  }
}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => PedidoProvider(),
      child: const MaterialApp(
        home: Historico(),
      ),
    ),
  );
}
