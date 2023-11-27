import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_ease/src/components/pagamento_checkout.dart';

class PagamentoTransf extends StatelessWidget {
  const PagamentoTransf({super.key});

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
                        child: Container(
                          color: Colors.white,

                          //height: 200, //altura
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  const Text(
                                    'Transferencia',
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  const Text(
                                      style: TextStyle(fontSize: 16),
                                      'Nome do Titular'),
                                  const SizedBox(
                                    height: 50.0,
                                    width: 500,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        labelText:
                                            'Preencha idêntico ao cartão',
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10.0),
                                  const Text(
                                      style: TextStyle(fontSize: 16),
                                      'Número do Cartão'),
                                  const SizedBox(
                                    height: 50.0,
                                    width: 500,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        labelText:
                                            'Preencha idêntico ao cartão',
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10.0),
                                  const Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Text(
                                            style: TextStyle(fontSize: 16),
                                            'Validade'),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                        child: Text(
                                            style: TextStyle(fontSize: 16),
                                            'Cód. de Segurança'),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      const Expanded(
                                        child: TextField(
                                          inputFormatters: [
                                            //LengthLimitingTextInputFormatter(2),
                                          ],
                                          decoration: InputDecoration(
                                            labelText: 'Mês',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const Text(
                                          style: TextStyle(fontSize: 20), '/'),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const Expanded(
                                        child: TextField(
                                          inputFormatters: [
                                            //LengthLimitingTextInputFormatter(2),
                                          ],
                                          decoration: InputDecoration(
                                            labelText: 'Ano',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 282,
                                      ),
                                      Expanded(
                                        child: TextField(
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(3),
                                          ],
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 60,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const PagamentoCheckout()),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: const Size(150, 50),
                                    ),
                                    child: const Text('Continuar'),
                                  ),
                                ],
                              ),
                            ),
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
