import 'package:flutter/material.dart';
import 'package:shop_ease/src/components/pagamento_add_endereco.dart';
import 'package:shop_ease/src/components/pagamento_frete.dart';
import 'package:shop_ease/src/components/pagamento_resumo.dart';
import '../model/endereco.dart';

int passaIndexEndereco = 0;

class PagamentoEndereco extends StatefulWidget {
  const PagamentoEndereco({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PagamentoEndereco createState() => _PagamentoEndereco();
}

class _PagamentoEndereco extends State<PagamentoEndereco> {
  bool enderecoSelecionado = false; // variável para liberar botão continuar
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
                                    'Escolha endereço de envio',
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 10.0,
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
                                    child:
                                        const Text('Adicionar novo endereço'),
                                  ),
                                  EnderecoBotoes(
                                      onEnderecoSelected: (bool selected) {
                                    setState(() {
                                      enderecoSelecionado = selected;
                                    });
                                  }),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  ElevatedButton(
                                    onPressed: enderecoSelecionado
                                        ? () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const PagamentoFrete(),
                                              ),
                                            );
                                          }
                                        : () {
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  title: const Text(
                                                      'Nenhum endereço selecionado'),
                                                  content: const Text(
                                                      'Por favor, selecione um endereço para continuar.'),
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
                      // ignore: prefer_const_constructors
                      Resumo()
                    ],
                  ),
                ),
              )),
        ));
  }
}

class EnderecoBotoes extends StatefulWidget {
  final ValueChanged<bool> onEnderecoSelected;
  const EnderecoBotoes({super.key, required this.onEnderecoSelected});

  @override
  // ignore: library_private_types_in_public_api
  _EnderecoBotoes createState() => _EnderecoBotoes();
}

class _EnderecoBotoes extends State<EnderecoBotoes> {
  List<bool> buttonStates = [];

  @override
  void initState() {
    super.initState();
    initializeButtonStates();
  }

  void initializeButtonStates() {
    // Inicializa a lista de estados dos botões
    buttonStates = List.generate(
      Endereco.listaDeEnderecos.length,
      (index) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        itemCount: Endereco.listaDeEnderecos.length,
        itemBuilder: (context, index) {
          List<String> endereco = Endereco.listaDeEnderecos[index];

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
                    passaIndexEndereco = index;
                  });
                  widget.onEnderecoSelected(
                      true); //altera enderecoSelecionado para true quando botão selecionado
                },
                icon: buttonStates[index]
                    ? const Icon(Icons.check_circle_outline_outlined)
                    : const Icon(Icons.circle_outlined),
                label: Text(
                  'Endereço ${index + 1}: Rua ${endereco[4]} ${endereco[5]} - ${endereco[1]}',
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
