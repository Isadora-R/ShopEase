import 'package:flutter/material.dart';
import 'package:shop_ease/src/components/rastreamento.dart';

class PagamentoAprovado extends StatefulWidget {
  const PagamentoAprovado({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PagamentoAprovado createState() => _PagamentoAprovado();
}

class _PagamentoAprovado extends State<PagamentoAprovado> {
  String mensagem = 'Aguarde... processando pagamento';
  double progresso = 0.0;
  double incremento = 0.0;
  bool aprovado = false;

  @override
  void initState() {
    super.initState();
    _processandoPagamento();
    _pagamentoAprovado();
  }

  Future<void> _processandoPagamento() async {
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      mensagem = 'Processando pagamento...';
      progresso = incremento + 0.5;
      incremento = progresso;
    });
  }

  Future<void> _pagamentoAprovado() async {
    await Future.delayed(const Duration(seconds: 5));
    setState(() {
      mensagem = 'Pagamento aprovado!';
      progresso = 1.0;
    });
    await Future.delayed(const Duration(seconds: 2));
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) =>
              Rastreamento(aprovado: true)), // redireciona para rastreamento
    );
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              backgroundColor: Colors.grey,
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
              value: progresso,
            ),
            const SizedBox(height: 16.0),
            Text(mensagem),
          ],
        ),
      ),
    );
  }
}
