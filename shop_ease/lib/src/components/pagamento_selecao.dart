import 'package:flutter/material.dart';
import 'package:shop_ease/src/components/cupom.dart';
import 'package:shop_ease/src/components/pagamento_cartao.dart';
import 'package:shop_ease/src/components/pagamento_checkout.dart';
import '../model/endereco.dart';

class PagamentoSelecao extends StatefulWidget {
  const PagamentoSelecao({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PagamentoSelecao createState() => _PagamentoSelecao();
}

class _PagamentoSelecao extends State<PagamentoSelecao> {
  bool cartaoSelecionado = false; // variável para liberar botão continuar
  void desmarca(String botaoSelecionado) {
    setState(() {
      if (botaoSelecionado == 'transf') {
        transfChecked = true;
        pixChecked = false;
      } else if (botaoSelecionado == 'pix') {
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
                                  ElevatedButton.icon(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: const Text(
                                                'Detalhes Bancários'),
                                            content: const Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
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
                                                Text(
                                                    'Titular: Enzo Bento Duarte'),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                    'CNPJ: 65.935.613/0001-66'),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                Text(
                                                    'Após o depósito ou transferência, enviar o comprovante para o email'),
                                                Text(
                                                    'contato.shopeasy@gmail.com'),
                                              ],
                                            ),
                                            actions: <Widget>[
                                              TextButton(
                                                onPressed: () {
                                                  setState(() {
                                                    cartaoSelecionado = true;
                                                    transfChecked =
                                                        !transfChecked;
                                                    desmarca('transf');
                                                  });
                                                  Navigator.of(context)
                                                      .pop(); //Fechar o diálogo
                                                },
                                                child: const Text('Continuar'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
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
                                        cartaoSelecionado = true;
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
                                  CartaoBotoes(
                                      onEnderecoSelected: (bool selected) {
                                    setState(() {
                                      cartaoSelecionado = selected;
                                    });
                                  }),
                                  const SizedBox(
                                    height: 60,
                                  ),
                                  ElevatedButton(
                                    onPressed: cartaoSelecionado
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
                                      filled: true,
                                      fillColor: Colors.white,
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

class CartaoBotoes extends StatefulWidget {
  final ValueChanged<bool> onEnderecoSelected;
  const CartaoBotoes({Key? key, required this.onEnderecoSelected})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _EnderecoBotoes createState() => _EnderecoBotoes();
}

class _EnderecoBotoes extends State<CartaoBotoes> {
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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
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
                    for (int i = 0; i < buttonStates.length; i++) {
                      // Desmarca todos os botões
                      buttonStates[i] = false;
                    }
                    // Marca apenas o botão atual
                    buttonStates[index] = true;
                  });
                  widget.onEnderecoSelected(
                      true); //altera enderecoSelecionado para true quando botão selecionado
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
                  minimumSize: const Size(1220, 100),
                  alignment: Alignment.centerLeft,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
