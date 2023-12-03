import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_ease/src/components/pagamento_frete.dart';
import 'package:provider/provider.dart';
import 'package:shop_ease/src/components/pagamento_selecao.dart';
import 'carrinho.dart';
import 'package:shop_ease/src/components/pagamento_aprovado.dart';

//variável com frete adicionado
double produtoFrete = 0;

class Resumo extends StatefulWidget {
  const Resumo({super.key});

  @override
  State<Resumo> createState() => _ResumoState();
}

class _ResumoState extends State<Resumo> {
  TextEditingController cupomController = TextEditingController();

  bool aplicado = false;

  void aplicarOuRemover() {
    if (cupomController.text == '') {
    } else {
      setState(() {
        aplicado = !aplicado; //Alterna o estado ao ser chamado
      });
      if (aplicado) {
        verificaCupom(listaDeValores);
      } else {
        cupomController.text = '';
      }
    }
  }

  //função para retornar frete selecionado
  String freteSelecionado(
      bool pac, bool sedex, bool transportadora, double produto) {
    double resetaFrete = produto;
    if (pac) {
      produtoFrete = resetaFrete;
      produtoFrete = produtoFrete + fretepac;
      return 'R\$ $fretepac';
    } else if (sedex) {
      produtoFrete = resetaFrete;
      produtoFrete = produtoFrete + fretesedex;
      return 'R\$ $fretesedex';
    } else if (transportadora) {
      produtoFrete = resetaFrete;
      produtoFrete = produtoFrete + fretetransp;
      return 'R\$ $fretetransp';
    } else {
      return ' ';
    }
  }

  //função que retorna valor cupom registrado como string
  String desconto(
      List<dynamic> lista, String cupom, double produto, double produtoPix) {
    double promo = 0;
    if (passaPixCheckout) {
      if (verificaCupom(lista)) {
        for (var i = 0; i < lista.length; i++) {
          if (lista[i] is double &&
              lista[i - 1] is String &&
              lista[i - 1] == cupom) {
            promo = lista[i];
          }
        }
        promo = promo * produtoPix;
        promo = promo + (produto - produtoPix);
        return 'R\$ -$promo';
      } else {
        return 'R\$ -${produto - produtoPix} ';
      }
    } else {
      if (verificaCupom(lista)) {
        for (var i = 0; i < lista.length; i++) {
          if (lista[i] is double &&
              lista[i - 1] is String &&
              lista[i - 1] == cupom) {
            promo = lista[i];
          }
        }
        promo = promo * produto;
        return 'R\$ -$promo';
      } else {
        return ' ';
      }
    }
  }

  //função que verifica se o cupom é valido
  bool verificaCupom(List<dynamic> lista) {
    for (var item in lista) {
      if (item is String && item == cupomController.text) {
        return true;
      }
    }
    return false;
  }

  //função que calcula e retorna valor total com desconto
  double total(List<dynamic> lista, double produto, double produtoPix) {
    double promo = 0;
    if (passaPixCheckout) {
      if (verificaCupom(lista)) {
        for (var i = 0; i < lista.length; i++) {
          if (lista[i] is double &&
              lista[i - 1] is String &&
              lista[i - 1] == cupomController.text) {
            promo = lista[i];
          }
        }
        promo = promo * produtoPix;
        promo = produtoPix - promo;
        return promo;
      } else {
        return produtoPix;
      }
    } else {
      if (verificaCupom(lista)) {
        for (var i = 0; i < lista.length; i++) {
          if (lista[i] is double &&
              lista[i - 1] is String &&
              lista[i - 1] == cupomController.text) {
            promo = lista[i];
          }
        }
        promo = promo * produto;
        promo = produto - promo;
        return promo;
      } else {
        return produto;
      }
    }
  }

//Array com os cupons de desconto
  List<dynamic> listaDeValores = [
    'promo05',
    0.05,
    'promo10',
    0.1,
    'promo15',
    0.15,
    'promo20',
    0.20,
    'promo25',
    0.25,
    'promo30',
    0.3,
    'promo35',
    0.35,
    'promo40',
    0.4,
    'promo45',
    0.45,
    'promo50',
    0.5,
    'promo55',
    0.55,
    'promo60',
    0.6,
    'promo65',
    0.65,
    'promo70',
    0.7,
    'promo75',
    0.75,
    'promo80',
    0.8
  ];

  @override
  Widget build(BuildContext context) {
    var controle = context.watch<CarrinhoProvider>();
    double produto = controle.calcularTotalCarrinho();
    double produtoPix = controle.calculaDesconto();
    return Flexible(
      flex: 1,
      child: Container(
        height: 600,
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
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Produto',
                  style:
                      TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
                ),
                Text(
                  'R\$ $produto ',
                  style: const TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.normal),
                ),
              ],
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
                  '${freteSelecionado(pacChecked, sedexChecked, transpChecked, produto)} ',
                  style: const TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.normal),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Desconto',
                  style:
                      TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
                ),
                Text(
                  '${desconto(listaDeValores, cupomController.text, produto, produtoPix)} ',
                  style: const TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.normal),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            //opção para adicionar cupom só irá aparecer no checkout
            Visibility(
              visible: checkoutVerdadeiro,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      height: 35.0,
                      child: TextField(
                        controller: cupomController,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(7),
                        ],
                        decoration: const InputDecoration(
                          labelText: 'Cupom Shopeasy',
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 1,
                    child: ElevatedButton(
                        onPressed: aplicarOuRemover,
                        child: Text(aplicado ? 'Remover' : 'Aplicar')),
                  )
                ],
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
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total',
                  style:
                      TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
                ),
                Text(
                  '${total(listaDeValores, produtoFrete, produtoPix)} ',
                  style: const TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.normal),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            //opção para confirmar a compra só irá aparecer no checkout
            Center(
                child: Visibility(
              visible: checkoutVerdadeiro,
              child: ElevatedButton(
                onPressed: () {
                  checkoutVerdadeiro = false;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PagamentoAprovado(),
                    ),
                  );
                },
                child: const Text('Confirmar a compra'),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
