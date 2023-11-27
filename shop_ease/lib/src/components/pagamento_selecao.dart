import 'package:flutter/material.dart';
import 'package:shop_ease/src/components/cupom.dart';
import 'package:shop_ease/src/components/pagamento_cartao.dart';
import 'package:shop_ease/src/components/pagamento_pix.dart';
import 'package:shop_ease/src/components/pagamento_transferencia.dart';

class PagamentoSelecao extends StatefulWidget {
  const PagamentoSelecao({super.key});

  @override
  _PagamentoSelecao createState() => _PagamentoSelecao();
}

class _PagamentoSelecao extends State<PagamentoSelecao> {
  void desmarca(String botaoSelecionado) {
    setState(() {
      if (botaoSelecionado == 'cartao') {
        cartaoChecked = true;
        transfChecked = false;
        pixChecked = false;
      } else if (botaoSelecionado == 'transf') {
        cartaoChecked = false;
        transfChecked = true;
        pixChecked = false;
      } else if (botaoSelecionado == 'pix') {
        cartaoChecked = false;
        transfChecked = false;
        pixChecked = true;
      }
    });
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
          child: SizedBox(
              //color: const Color.fromARGB(255, 248, 240, 250),
              width: 1220,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  const Text(
                                    'Escolha um método de pagamento',
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  ElevatedButton.icon(
                                    onPressed: () {
                                      setState(() {
                                        cartaoChecked = !cartaoChecked;
                                        desmarca('cartao');
                                      });
                                    },
                                    icon: cartaoChecked
                                        ? const Icon(
                                            Icons.check_circle_outline_outlined)
                                        : const Icon(Icons.circle_outlined),
                                    label: const Text('Novo cartão de crédito'),
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(0),
                                      ),
                                      minimumSize: const Size(150, 100),
                                      alignment: Alignment.centerLeft,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  ElevatedButton.icon(
                                    onPressed: () {
                                      setState(() {
                                        transfChecked = !transfChecked;
                                        desmarca('transf');
                                      });
                                    },
                                    icon: transfChecked
                                        ? const Icon(
                                            Icons.check_circle_outline_outlined)
                                        : const Icon(Icons.circle_outlined),
                                    label: const Text('Transferência bancária'),
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(0),
                                      ),
                                      minimumSize: const Size(150, 100),
                                      alignment: Alignment.centerLeft,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  ElevatedButton.icon(
                                    onPressed: () {
                                      setState(() {
                                        pixChecked = !pixChecked;
                                        desmarca('pix');
                                      });
                                    },
                                    icon: pixChecked
                                        ? const Icon(
                                            Icons.check_circle_outline_outlined)
                                        : const Icon(Icons.circle_outlined),
                                    label: const Text('PIX'),
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(0),
                                      ),
                                      minimumSize: const Size(150, 100),
                                      alignment: Alignment.centerLeft,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 60,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      if (cartaoChecked) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const PagamentoCartao()),
                                        );
                                      } else if (transfChecked) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const PagamentoTransf()),
                                        );
                                      } else if (pixChecked) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const PagamentoPix()),
                                        );
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: const Size(150, 50),
                                    ),
                                    child: const Text('Continuar'),
                                  ),
                                ]),
                          ),
                        ),
                      ),
                      const SizedBox(width: 30),
                      Flexible(
                        flex: 1,
                        child: Container(
                          color: const Color.fromARGB(255, 248, 240, 250),
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.all(20),
                          //height: 200, //altura
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Resumo da compra',
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Divider(
                                color: Colors.grey,
                                height: 20,
                                thickness: 2,
                                indent: 0,
                                endIndent: 20,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Produto',
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.normal),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Frete',
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.normal),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Desconto',
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.normal),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 35.0,
                                width: 200,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      labelText: 'Cupom Shopeasy',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Divider(
                                color: Colors.grey,
                                height: 20,
                                thickness: 2,
                                indent: 0,
                                endIndent: 20,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Total',
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        ));
  }
}
