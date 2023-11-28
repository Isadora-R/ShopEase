//Rastreamento de pedidos: deve-se ter um acompanhamento e o status de seus pedidos, desde o processamento até a entrega, fornecendo informações sobre o envio e a previsão de chegada.

import 'dart:async';
import 'package:flutter/material.dart';
//import 'package:shop_ease/src/components/pagamento_aprovado.dart';

class Rastreamento extends StatefulWidget {
  const Rastreamento({super.key});

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
  bool pagamentoAprovado = true;
  // List<String> _pedidosFeitos = [];
  // List<String> get pedidosFeitos => _pedidosFeitos;

  bool _isMounted = false;

  @override
  void initState() {
    super.initState();
    _isMounted = true;
    _iniciarRastreamento();
  }

  @override
  void dispose() {
    _isMounted = false;
    super.dispose();
  }

  Future<void> _separandoPedido() async {
    await Future.delayed(const Duration(seconds: 5));
    setState(() {
      progresso = incremento + 0.2;
      mensagem =
          'O vendedor separou seu pedido! Previsão de chegada: em ${((2 / progresso).ceil())} dias';
      incremento = progresso;
    });
  }

  Future<void> _enviarPedido() async {
    await Future.delayed(const Duration(seconds: 10));
    setState(() {
      progresso = incremento + 0.2;
      incremento = progresso;
      mensagem =
          'O vendedor enviou seu pedido! Previsão de chegada: em ${((2.8 / progresso).ceil())} dias';
    });
  }

  Future<void> _pedidoCaminho() async {
    await Future.delayed(const Duration(seconds: 15));
    setState(() {
      progresso = incremento + 0.2;
      incremento = progresso;
      mensagem =
          'Seu pedido foi recolhido e está a caminho! Previsão de chegada: em ${((3 / progresso).ceil())} dias';
    });
  }

  Future<void> _saiuEntrega() async {
    await Future.delayed(const Duration(seconds: 20));
    setState(() {
      progresso = incremento + 0.3;
      incremento = progresso;
      mensagem =
          'Seu pedido saiu para entrega! Previsão de chegada: em até ${((1.8 / progresso).ceil())} dias';
    });
  }

  Future<void> _pedidoEntregue() async {
    await Future.delayed(const Duration(seconds: 25));
    setState(() {
      mensagem = 'Seu pedido foi entregue!';
      progresso = 1.0;
    });

    await Future.delayed(const Duration(seconds: 5));
    setState(() {
      pagamentoAprovado = false;
    });
  }

  Future<void> _iniciarRastreamento() async {
    if (_isMounted) {
      await _separandoPedido();
      await _enviarPedido();
      await _pedidoCaminho();
      await _saiuEntrega();
      await _pedidoEntregue();
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (pagamentoAprovado == true) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('ACOMPANHE SUA ENTREGA'),
          titleTextStyle: const TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
          centerTitle: true,
          forceMaterialTransparency: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LinearProgressIndicator(
                backgroundColor: Colors.grey,
                // ignore: prefer_const_constructors
                valueColor: AlwaysStoppedAnimation<Color>(Colors.deepPurple),
                value: progresso,
              ),
              const SizedBox(height: 16.0),
              Text(
                mensagem,
                style: TextStyle(
                    backgroundColor: Colors.purple[600], color: Colors.white),
              ),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title:
              const Text('Você não tem entregas pendente! Realize um pedido!'),
          titleTextStyle: const TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
          centerTitle: true,
          forceMaterialTransparency: true,
        ),
      );
    }
  }
}

void main() {
  runApp(const MaterialApp(
    home: Rastreamento(),
  ));
}
