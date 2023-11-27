import 'package:flutter/material.dart';
import 'package:shop_ease/src/components/cupom.dart';
import 'package:shop_ease/src/components/pagamento_selecao.dart';

class PagamentoEnvio extends StatefulWidget {
  const PagamentoEnvio({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PagamentoEnvio createState() => _PagamentoEnvio();
}

class _PagamentoEnvio extends State<PagamentoEnvio> {
  void desmarca(String botaoSelecionado) {
    setState(() {
      if (botaoSelecionado == 'cartao') {
        pacChecked = true;
        sedexChecked = false;
        transpChecked = false;
      } else if (botaoSelecionado == 'transf') {
        pacChecked = false;
        sedexChecked = true;
        transpChecked = false;
      } else if (botaoSelecionado == 'pix') {
        pacChecked = false;
        sedexChecked = false;
        transpChecked = true;
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
                                    'Escolha um método de envio',
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
                                        pacChecked = !pacChecked;
                                        desmarca('cartao');
                                      });
                                    },
                                    icon: pacChecked
                                        ? const Icon(
                                            Icons.check_circle_outline_outlined)
                                        : const Icon(Icons.circle_outlined),
                                    label: const Text('PAC'),
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(0),
                                      ),
                                      minimumSize: const Size(150, 100),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  ElevatedButton.icon(
                                    onPressed: () {
                                      setState(() {
                                        sedexChecked = !sedexChecked;
                                        desmarca('transf');
                                      });
                                    },
                                    icon: sedexChecked
                                        ? const Icon(
                                            Icons.check_circle_outline_outlined)
                                        : const Icon(Icons.circle_outlined),
                                    label: const Text('Sedex'),
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(0),
                                      ),
                                      minimumSize: const Size(150, 100),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  ElevatedButton.icon(
                                    onPressed: () {
                                      setState(() {
                                        transpChecked = !transpChecked;
                                        desmarca('pix');
                                      });
                                    },
                                    icon: transpChecked
                                        ? const Icon(
                                            Icons.check_circle_outline_outlined)
                                        : const Icon(Icons.circle_outlined),
                                    label: const Text('Transportadora'),
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(0),
                                      ),
                                      minimumSize: const Size(150, 100),
                                    ),
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
                                                const PagamentoSelecao()),
                                      );
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
                                style: TextStyle(color: Colors.black),
                              ),
                              Text(
                                'Produto',
                                style: TextStyle(color: Colors.black),
                              ),
                              Text(
                                'Você pagará',
                                style: TextStyle(color: Colors.black),
                              ),
                              Text(
                                'Cupom Shopeasy',
                                style: TextStyle(color: Colors.black),
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
