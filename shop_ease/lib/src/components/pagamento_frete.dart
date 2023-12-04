import 'package:flutter/material.dart';
import 'package:shop_ease/src/components/pagamento_resumo.dart';
import 'package:shop_ease/src/components/pagamento_selecao.dart';

bool pacChecked = false;
bool sedexChecked = false;
bool transpChecked = false;
bool freteSelected = false;

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
  void updateFreteSelected(bool selected) {
    setState(() {
      freteSelected = selected;
    });
  }

  @override
  void initState() {
    super.initState();
    pacChecked = false;
    sedexChecked = false;
    transpChecked = false;
    freteSelected = false;
  }

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
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: const Image(
            image: AssetImage('lib/src/assets/logooo.png'),
            fit: BoxFit.contain,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0, // Remove a sombra da AppBar
        ),
        body: SingleChildScrollView(
          child: Center(
            child: SizedBox(
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
                                MetodosFrete(
                                  updateParent: (bool selected) {
                                    setState(() {
                                      freteSelected = selected;
                                    });
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                ElevatedButton(
                                  onPressed: freteSelected
                                      ? () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const PagamentoSelecao(),
                                            ),
                                          );
                                        }
                                      : () {
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: const Text(
                                                    'Nenhum método de envio selecionado'),
                                                content: const Text(
                                                    'Por favor, selecione um método para continuar.'),
                                                actions: <Widget>[
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: const Text('Ok'),
                                                  ),
                                                ],
                                              );
                                            },
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
                    // ignore: prefer_const_constructors
                    Resumo()
                  ],
                ),
              ),
            )),
          ),
        ));
  }
}

class MetodosFrete extends StatefulWidget {
  final Function(bool) updateParent;
  const MetodosFrete({
    super.key,
    required this.updateParent,
  });

  @override
  // ignore: library_private_types_in_public_api
  _MetodosFrete createState() => _MetodosFrete();
}

class _MetodosFrete extends State<MetodosFrete> {
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
              widget.updateParent(true);
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
              widget.updateParent(true);
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
              widget.updateParent(true);
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
