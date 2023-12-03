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
                      'Pedido ${pedido.nome}',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
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
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Detalhes do Pedido ${pedido.nome}'),
          content: Text(
              'Valor: R\$ ${pedido.preco}, o pedido foi feito em: $dataFormatada '),
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
