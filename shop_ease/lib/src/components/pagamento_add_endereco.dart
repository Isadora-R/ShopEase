import 'package:flutter/material.dart';

class PagamentoAddEndereco extends StatelessWidget {
  const PagamentoAddEndereco({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ShopEase'),
          centerTitle: true,
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

                          height: 600, // altura
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  const Text(
                                    'Adicione um endereço',
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  const Text(
                                      style: TextStyle(fontSize: 16),
                                      'Nome completo'),
                                  const SizedBox(
                                    height: 50.0,
                                    width: 500,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        labelText:
                                            'Preencha idêntico ao Rg ou CNH',
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
                                            'Estado'),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                        child: Text(
                                            style: TextStyle(fontSize: 16),
                                            'Cidade'),
                                      ),
                                    ],
                                  ),
                                  const Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: TextField(
                                          inputFormatters: [
                                            //LengthLimitingTextInputFormatter(2),
                                          ],
                                          decoration: InputDecoration(
                                            labelText: '',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 100,
                                      ),
                                      Expanded(
                                        child: TextField(
                                          inputFormatters: [
                                            //LengthLimitingTextInputFormatter(2),
                                          ],
                                          decoration: InputDecoration(
                                            labelText: '',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10.0),
                                  const Text(
                                      style: TextStyle(fontSize: 16), 'Bairro'),
                                  const SizedBox(
                                    height: 50.0,
                                    width: 500,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        labelText: ' ',
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
                                            'Rua/Avenida'),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                        child: Text(
                                            style: TextStyle(fontSize: 16),
                                            'Número'),
                                      ),
                                    ],
                                  ),
                                  const Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: TextField(
                                          inputFormatters: [
                                            //LengthLimitingTextInputFormatter(2),
                                          ],
                                          decoration: InputDecoration(
                                            labelText: '',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 100,
                                      ),
                                      Expanded(
                                        child: TextField(
                                          inputFormatters: [
                                            //LengthLimitingTextInputFormatter(2),
                                          ],
                                          decoration: InputDecoration(
                                            labelText: '',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10.0),
                                  const Text(
                                      style: TextStyle(fontSize: 16),
                                      'Complemento'),
                                  const SizedBox(
                                    height: 50.0,
                                    width: 500,
                                    child: TextField(
                                      //controller: _emailController,
                                      decoration: InputDecoration(
                                        labelText: '',
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 60,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {},
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
