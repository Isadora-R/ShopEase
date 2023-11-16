import 'dart:async';

import 'package:flutter/material.dart';

class Rastreamento extends StatefulWidget {
  const Rastreamento({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RastreamentoState createState() => _RastreamentoState();
}

class _RastreamentoState extends State<Rastreamento> {
  String mensagem = 'Aguarde... seu pedido será separado';
  double progresso = 0.0;
  double incremento = 0.0;

  @override
  void initState() {
    super.initState();
    _separandoPedido();
    _enviarPedido();
    _pedidoCaminho();
    _saiuEntrega();
    _pedidoEntregue();
  }

  Future<void> _separandoPedido() async {
    await Future.delayed(const Duration(seconds: 5));
    setState(() {
      mensagem = 'O vendedor separou seu pedido!';
      progresso = incremento + 0.2;
      incremento = progresso;
    });
  }

  Future<void> _enviarPedido() async {
    await Future.delayed(const Duration(seconds: 10));
    setState(() {
      mensagem = 'O vendedor enviou seu pedido!';
      progresso = incremento + 0.2;
      incremento = progresso;
    });
  }

  Future<void> _pedidoCaminho() async {
    await Future.delayed(const Duration(seconds: 15));
    setState(() {
      mensagem = 'Seu pedido foi recolhido e está a caminho!';
      progresso = incremento + 0.2;
      incremento = progresso;
    });
  }

  Future<void> _saiuEntrega() async {
    await Future.delayed(const Duration(seconds: 20));
    setState(() {
      mensagem = 'Seu pedido saiu para entrega!';
      progresso = incremento + 0.3;
      incremento = progresso;
    });
  }

  Future<void> _pedidoEntregue() async {
    await Future.delayed(const Duration(seconds: 25));
    setState(() {
      mensagem = 'Seu pedido foi entregue!';
      progresso = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rastreamento'),
        centerTitle: true,
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
            ), // Indicador de carregamento (opcional)
            const SizedBox(height: 16.0),
            Text(mensagem),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: Rastreamento(),
  ));
}
