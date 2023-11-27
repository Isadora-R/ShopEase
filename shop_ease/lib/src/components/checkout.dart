import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'pagamento_selecao.dart';

//import 'carrinho.dart';
int selecao = 0;
Color? cor1 = Colors.purple[300];
Color? cor2 = Colors.purple[300];
Color? cor3 = Colors.purple[300];

void botaoSelecionado(int selecao, Color? cor1, Color? cor2, Color? cor3) {
  selecao = 1;
  switch (selecao) {
    case 1:
      cor1 = Colors.purple[300];
      cor2 = Colors.grey;
      cor3 = Colors.grey;
      break;
    case 2:
      cor1 = Colors.grey;
      cor2 = Colors.purple[300];
      cor3 = Colors.grey;
      break;
    case 3:
      cor1 = Colors.grey;
      cor2 = Colors.grey;
      cor3 = Colors.purple[300];
      break;
    case 0:
      cor1 = Colors.purple[300];
      cor2 = Colors.purple[300];
      cor3 = Colors.purple[300];
      break;
  }
}

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(style: TextStyle(fontSize: 18), 'Cupom Shopeasy'),
            SizedBox(
              height: 50.0,
              width: 100,
              child: TextField(
                //controller: _emailController,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(7),
                ],
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                const Text(
                    style: TextStyle(fontSize: 18), 'Método de pagamento'),
                ElevatedButton(
                  onPressed: () {
                    selecao = 1;
                    botaoSelecionado(selecao, cor1, cor2, cor3);
                    //Navigator.push(context, MaterialPageRoute(builder: (context) => const Rastreamento()),);
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: cor1,
                  ),
                  child: const Text('Cartão de Crédito'),
                ),
                ElevatedButton(
                  onPressed: () {
                    selecao = 2;
                    botaoSelecionado(selecao, cor1, cor2, cor3);
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: cor2,
                  ),
                  child: const Text('Transferência Bancária'),
                ),
                ElevatedButton(
                  onPressed: () {
                    selecao = 3;
                    botaoSelecionado(selecao, cor1, cor2, cor3);
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: cor3,
                  ),
                  child: const Text('PIX'),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PagamentoSelecao()),
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.purple[300],
              ),
              child: const Text('Fazer pedido'),
            ),
          ],
        ),
      ),
    );
  }
}
