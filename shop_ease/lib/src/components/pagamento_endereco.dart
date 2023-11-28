import 'package:flutter/material.dart';
import 'package:shop_ease/src/components/pagamento_add_endereco.dart';
import 'package:shop_ease/src/components/pagamento_selecao.dart';
import '../model/endereco.dart';

class PagamentoEndereco extends StatefulWidget {
  const PagamentoEndereco({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PagamentoEndereco createState() => _PagamentoEndereco();
}

class _PagamentoEndereco extends State<PagamentoEndereco> {
  bool enderecoSelecionado = false;
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
                                    height: 60,
                                  ),
                                  ElevatedButton(
                                    onPressed: enderecoSelecionado
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

class EnderecoBotoes extends StatefulWidget {
  final ValueChanged<bool> onEnderecoSelected;
  const EnderecoBotoes({Key? key, required this.onEnderecoSelected})
      : super(key: key);

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
    // Inicialize a lista de estados dos botões
    buttonStates = List.generate(
      Endereco.listaDeEnderecos.length,
      (index) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
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
                      // Desmarcar todos os botões
                      buttonStates[i] = false;
                    }
                    // Marcar apenas o botão atual
                    buttonStates[index] = true;
                  });
                  widget.onEnderecoSelected(true);
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
