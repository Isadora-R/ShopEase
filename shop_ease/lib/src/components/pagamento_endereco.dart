import 'package:flutter/material.dart';
import 'package:shop_ease/src/components/cupom.dart';
import 'package:shop_ease/src/components/pagamento_add_endereco.dart';
import 'package:shop_ease/src/components/pagamento_selecao.dart';
import 'package:provider/provider.dart';
import 'package:shop_ease/src/components/login.dart';

class PagamentoEndereco extends StatefulWidget {
  const PagamentoEndereco({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PagamentoEndereco createState() => _PagamentoEndereco();
}

class _PagamentoEndereco extends State<PagamentoEndereco> {
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
    List<String> usuarioLogado =
        Provider.of<DataProvider>(context).usuarioLogado;

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
                                    'Escolha endereço de envio',
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
                                    label: Row(
                                      children: [
                                        Text(
                                            'Endereço de entrega: ${usuarioLogado.isNotEmpty ? usuarioLogado[6] : ''}, ${usuarioLogado.isNotEmpty ? usuarioLogado[8] : ''}. ${usuarioLogado.isNotEmpty ? usuarioLogado[3] : ''}'),
                                      ],
                                    ),
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
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const PagamentoAddEndereco()),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(0),
                                      ),
                                      minimumSize: const Size(150, 100),
                                      alignment: Alignment.centerLeft,
                                    ),
                                    child: const Text('Adicionar endereço'),
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
                          color: Colors.white70,
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.all(20),
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
