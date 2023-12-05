//Rastreamento de pedidos: deve-se ter um acompanhamento e o status de seus pedidos, desde o processamento até a entrega, fornecendo informações sobre o envio e a previsão de chegada.

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_ease/src/components/carrinho.dart';

// ignore: must_be_immutable
class Rastreamento extends StatefulWidget {
  bool aprovado;
  Rastreamento({super.key, required this.aprovado});

  @override
  // ignore: library_private_types_in_public_api
  _RastreamentoState createState() => _RastreamentoState();
}

class _RastreamentoState extends State<Rastreamento>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  String mensagem = 'Aguarde... seu pedido será separado';
  double progresso = 0.0;
  double incremento = 0.0;

  bool _isMounted = false;

  @override
  void initState() {
    super.initState();
    _isMounted = widget.aprovado;
    _iniciarRastreamento();
  }

  @override
  void dispose() {
    _isMounted = false;
    super.dispose();
  }

  Future<void> _separandoPedido() async {
    if (!_isMounted) return;
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      progresso = incremento + 0.2;
      mensagem =
          'O vendedor separou seu pedido! Previsão de chegada: em ${((2 / progresso).ceil())} dias';
      incremento = progresso;
    });
  }

  Future<void> _enviarPedido() async {
    if (!_isMounted) return;
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      progresso = incremento + 0.2;
      incremento = progresso;
      mensagem =
          'O vendedor enviou seu pedido! Previsão de chegada: em ${((2.8 / progresso).ceil())} dias';
    });
  }

  Future<void> _pedidoCaminho() async {
    if (!_isMounted) return;
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      progresso = incremento + 0.2;
      incremento = progresso;
      mensagem =
          'Seu pedido foi recolhido e está a caminho! Previsão de chegada: em ${((3 / progresso).ceil())} dias';
    });
  }

  Future<void> _saiuEntrega() async {
    if (!_isMounted) return;
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      progresso = incremento + 0.3;
      incremento = progresso;
      mensagem =
          'Seu pedido saiu para entrega! Previsão de chegada: em até ${((1.8 / progresso).ceil())} dias';
    });
  }

  Future<void> _pedidoEntregue() async {
    if (!_isMounted) return;
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      mensagem = 'Seu pedido foi entregue!';
      progresso = 1.0;
    });
    await Future.delayed(const Duration(seconds: 3));
    // ignore: unused_local_variable
    var carrinhoProvider =
        // ignore: use_build_context_synchronously
        Provider.of<CarrinhoProvider>(context, listen: false);

    carrinhoProvider.limpaCarrinho();
    print('Limpou carrinho');
  }

  Future<void> _iniciarRastreamento() async {
    if (!_isMounted) return;

    try {
      await _separandoPedido();
      await _enviarPedido();
      await _pedidoCaminho();
      await _saiuEntrega();
      await _pedidoEntregue();
      await _acabouEntrega();
      await _cancelCompleter.future;
    } catch (error) {
      if (error.toString() == 'disposed') {
        _isMounted = false;
        print('Não acompanhando rastreamento!');
      }
    }
  }

  Future<void> _acabouEntrega() async {
    if (!_isMounted) return;

    await Future.delayed(const Duration(seconds: 3));
    // Ignore: use_build_context_synchronously
    // ignore: unused_local_variable
    print('acabou entrega');

    await Future.delayed(const Duration(seconds: 3));

    if (_isMounted) {
      widget.aprovado = false;
    }
  }

  // ignore: prefer_final_fields
  Completer<void> _cancelCompleter = Completer<void>();

  @override
  Widget build(BuildContext context) {
    super.build(context);

    var pedidoProvider = Provider.of<CarrinhoProvider>(context);
    if (widget.aprovado &&
        _isMounted &&
        pedidoProvider.itensNoCarrinho.isNotEmpty) {
      DateTime hoje = DateTime.now();
      String dataFormatada = "${hoje.day}/${hoje.month}/${hoje.year}";
      return Scaffold(
        body: Center(
          child: Container(
            transformAlignment: Alignment.center,
            width: 900,
            height: 450,
            decoration: BoxDecoration(
              color: Colors.white60,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Acompanhe suas entregas',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16.0),
                Expanded(
                  child: ListView.builder(
                    itemCount: pedidoProvider.itensNoCarrinho.length,
                    itemBuilder: (context, index) {
                      Produto pedido = pedidoProvider.itensNoCarrinho[index];

                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 2),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Item #${index + 1} - ${pedido.nome}',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              'Pedido realizado em: $dataFormatada',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16.0),
                LinearProgressIndicator(
                  backgroundColor: Colors.grey,
                  valueColor:
                      const AlwaysStoppedAnimation<Color>(Colors.deepPurple),
                  value: progresso,
                ),
                const SizedBox(height: 16.0),
                Text(
                  mensagem,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10.0),
                ElevatedButton(
                  onPressed: () {
                    _cancelCompleter.completeError('disposed');
                    Provider.of<CarrinhoProvider>(context, listen: false)
                        .limpaCarrinho();
                    Navigator.pushNamed(context, '/home');
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(150, 35),
                  ),
                  child: const Text('Início'),
                ),
                const SizedBox(height: 10.0),
              ],
            ),
          ),
        ),
      );
    } else {
      return Scaffold(
        body: Center(
          child: Container(
            transformAlignment: Alignment.center,
            width: 900,
            height: 450,
            decoration: BoxDecoration(
              color: Colors.white60,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(children: [
              const SizedBox(height: 50.0),
              const Text(
                'Você não tem entregas pendente. Realize um pedido!',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 100.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(150, 35),
                ),
                child: const Text('CATÁLOGO'),
              ),
            ]),
          ),
        ),
      );
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: Rastreamento(
      aprovado: false,
    ),
  ));
}
