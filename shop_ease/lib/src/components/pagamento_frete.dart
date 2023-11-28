import 'package:flutter/material.dart';
import 'package:shop_ease/src/components/pagamento_selecao.dart';

bool pacChecked = false;
bool sedexChecked = false;
bool transpChecked = false;

double fretepac = 18;
double fretesedex = 54;
double fretetransp = 31;

class PagamentoFrete extends StatefulWidget {
  const PagamentoFrete({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PagamentoFrete createState() => _PagamentoFrete();
}

class _PagamentoFrete extends State<PagamentoFrete> {
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
                                  const MetodosPagamento(),
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

class MetodosPagamento extends StatefulWidget {
  const MetodosPagamento({
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _MetodosPagamento createState() => _MetodosPagamento();
}

class _MetodosPagamento extends State<MetodosPagamento> {
  void resetCheckStates() {
    setState(() {
      pacChecked = false;
      sedexChecked = false;
      transpChecked = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton.icon(
          onPressed: () {
            resetCheckStates();

            setState(() {
              pacChecked = true;
            });
          },
          icon: pacChecked
              ? const Icon(Icons.check_circle_outline_outlined)
              : const Icon(Icons.circle_outlined),
          label: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('PAC R\$ $fretepac'),
              const Text('Chegará entre 10 à 12 dias'),
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
        ElevatedButton.icon(
          onPressed: () {
            resetCheckStates();

            setState(() {
              sedexChecked = true;
            });
          },
          icon: sedexChecked
              ? const Icon(Icons.check_circle_outline_outlined)
              : const Icon(Icons.circle_outlined),
          label: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Sedex R\$ $fretesedex'),
              const Text('Chegará entre 2 à 3 dias'),
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
        ElevatedButton.icon(
          onPressed: () {
            resetCheckStates();

            setState(() {
              transpChecked = true;
            });
          },
          icon: transpChecked
              ? const Icon(Icons.check_circle_outline_outlined)
              : const Icon(Icons.circle_outlined),
          label: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Transportadora Jadlog R\$ $fretetransp'),
              const Text('Chegará entre 5 à 7 dias'),
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
      ],
    );
  }
}
