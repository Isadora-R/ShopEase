import 'package:flutter/material.dart';
import 'package:shop_ease/src/components/pagamento_add_endereco.dart';

class Carrinho extends StatelessWidget {
  const Carrinho({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const PagamentoAddEndereco()),
            );
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.purple[300],
          ),
          child: const Text('Fazer pedido'),
        ),
      ),
    );
  }
}
