import 'package:flutter/material.dart';
//import 'package:shop_ease/src/components/cupom.dart';
import 'package:shop_ease/src/components/pagamento_resumo.dart';
import 'package:shop_ease/src/components/pagamento_cartao.dart';
import 'package:shop_ease/src/components/pagamento_checkout.dart';
import '../model/endereco.dart';

bool transfChecked = false;
bool pixChecked = false;

class PagamentoSelecao extends StatefulWidget {
  const PagamentoSelecao({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PagamentoSelecao createState() => _PagamentoSelecao();
}

class _PagamentoSelecao extends State<PagamentoSelecao> {
  bool cartaoSelecionado = false;
  bool metodoSelecionado = false; // variável para liberar botão continuar

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
              //width: 1220,
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
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const PagamentoCartao()),
                                    );
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                  minimumSize: const Size(150, 100),
                                  alignment: Alignment.centerLeft,
                                ),
                                child: const Text('Novo cartão de crédito'),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              CartaoBotoes(
                                onCartaoSelected: (bool selected) {
                                  setState(() {
                                    cartaoSelecionado = selected;
                                  });
                                },
                                onMetodoSelected: (bool selected) {
                                  metodoSelecionado = selected;
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              ElevatedButton(
                                onPressed: metodoSelecionado
                                    ? () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const PagamentoCheckout(),
                                          ),
                                        );
                                      }
                                    : () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: const Text(
                                                  'Nenhum método de pagamento selecionado'),
                                              content: const Text(
                                                  'Por favor, selecione um método para continuar.'),
                                              actions: <Widget>[
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
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
        ));
  }
}

class MetodosPagamento extends StatefulWidget {
  final ValueChanged<bool> onMetodoSelected;
  final ValueChanged<bool> onCartaoSelected;

  const MetodosPagamento({
    super.key,
    required this.onMetodoSelected,
    required this.onCartaoSelected,
  });

  @override
  // ignore: library_private_types_in_public_api
  _MetodosPagamento createState() => _MetodosPagamento();
}

class _MetodosPagamento extends State<MetodosPagamento> {
  void resetCheckStates() {
    setState(() {
      transfChecked = false;
      pixChecked = false;
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
            widget.onMetodoSelected(true);
            widget.onCartaoSelected(false);
            setState(() {
              transfChecked = true;
            });

            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Detalhes Bancários'),
                  content: const Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Banco do Brasil'),
                      SizedBox(
                        height: 5,
                      ),
                      Text('Agência: 3663-3'),
                      SizedBox(
                        height: 5,
                      ),
                      Text('Conta Corrente: 25206-4'),
                      SizedBox(
                        height: 5,
                      ),
                      Text('Titular: Enzo Bento Duarte'),
                      SizedBox(
                        height: 5,
                      ),
                      Text('CNPJ: 65.935.613/0001-66'),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                          'Após o depósito ou transferência, enviar o comprovante para o email'),
                      Text('contato.shopeasy@gmail.com'),
                    ],
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); //Fechar o diálogo
                      },
                      child: const Text('Continuar'),
                    ),
                  ],
                );
              },
            );
          },
          icon: transfChecked
              ? const Icon(Icons.check_circle_outline_outlined)
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
            resetCheckStates();
            widget.onMetodoSelected(true);
            widget.onCartaoSelected(false);
            setState(() {
              pixChecked = true;
            });
          },
          icon: pixChecked
              ? const Icon(Icons.check_circle_outline_outlined)
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
      ],
    );
  }
}

class CartaoBotoes extends StatefulWidget {
  // callback para notificar seleção de botão
  final ValueChanged<bool> onCartaoSelected;
  final ValueChanged<bool> onMetodoSelected;

  const CartaoBotoes({
    super.key,
    required this.onCartaoSelected,
    required this.onMetodoSelected,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CartaoBotoes createState() => _CartaoBotoes();
}

class _CartaoBotoes extends State<CartaoBotoes> {
  List<bool> buttonStates = [];

  @override
  void initState() {
    super.initState();
    initializeButtonStates();
  }

  void initializeButtonStates() {
    // Inicializa a lista de estados dos botões
    buttonStates = List.generate(
      Cartao.listaDeCartoes.length,
      (index) => false,
    );
  }

  void desmarca() {
    setState(() {
      buttonStates = List.generate(
        Cartao.listaDeCartoes.length,
        (index) => false,
      );
      transfChecked = false;
      pixChecked = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MetodosPagamento(
          onMetodoSelected: (bool selected) {
            widget.onMetodoSelected(selected);
            if (selected) {
              desmarca();
            }
          },
          onCartaoSelected: (bool selected) {
            widget.onCartaoSelected(selected);
            if (selected) {
              desmarca();
            }
          },
        ),
        SizedBox(
          height: 95,
          child: ListView.builder(
            itemCount: Cartao.listaDeCartoes.length,
            itemBuilder: (context, index) {
              List<String> cartao = Cartao.listaDeCartoes[index];

              return Column(
                children: [
                  const SizedBox(
                    height: 2,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        desmarca();
                        for (int i = 0; i < buttonStates.length; i++) {
                          // Desmarca todos os botões
                          buttonStates[i] = false;
                        }
                        // Marca apenas o botão atual
                        buttonStates[index] = true;
                      });
                      widget.onMetodoSelected(true);
                      widget.onCartaoSelected(true);

                      //altera para true quando botão selecionado
                    },
                    icon: buttonStates[index]
                        ? const Icon(Icons.check_circle_outline_outlined)
                        : const Icon(Icons.circle_outlined),
                    label: Text(
                      'Cartao ${index + 1} de final: ***** ${cartao[0].substring(cartao[0].length - 4)}',
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      minimumSize: Size(
                        MediaQuery.of(context).size.width,
                        100,
                      ),
                      alignment: Alignment.centerLeft,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
