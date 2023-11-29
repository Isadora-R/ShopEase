import 'package:flutter/material.dart';
import 'package:shop_ease/src/components/pagamento_frete.dart';

class Resumo extends StatelessWidget {
  const Resumo({super.key});

  String freteSelecionado(bool pac, bool sedex, bool transportadora) {
    if (pac) {
      return 'R\$ $fretepac';
    } else if (sedex) {
      return 'R\$ $fretesedex';
    } else if (transportadora) {
      return 'R\$ $fretetransp';
    } else {
      return ' ';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Container(
        color: Colors.white70,
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Resumo da compra',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            const Divider(
              color: Colors.grey,
              height: 20,
              thickness: 2,
              indent: 0,
              endIndent: 20,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Produto',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Frete',
                  style:
                      TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
                ),
                Text(
                  '${freteSelecionado(pacChecked, sedexChecked, transpChecked)} ',
                  style: const TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.normal),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'Desconto',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 35.0,
              width: 200,
              child: Align(
                alignment: Alignment.center,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Cupom Shopeasy',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Divider(
              color: Colors.grey,
              height: 20,
              thickness: 2,
              indent: 0,
              endIndent: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Total',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }
}
