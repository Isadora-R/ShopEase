import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shop_ease/src/components/criar_perfil.dart';
import 'package:shop_ease/src/components/login.dart';
import 'package:shop_ease/src/components/pagamento_endereco.dart';
import 'package:shop_ease/src/components/pagamento_resumo.dart';
import '../model/endereco.dart';

class PagamentoAddEndereco extends StatefulWidget {
  const PagamentoAddEndereco({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PagamentoAddEndereco createState() => _PagamentoAddEndereco();
}

class _PagamentoAddEndereco extends State<PagamentoAddEndereco> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController estadoController = TextEditingController();
  TextEditingController cidadeController = TextEditingController();
  TextEditingController bairroController = TextEditingController();
  TextEditingController ruaController = TextEditingController();
  TextEditingController numeroController = TextEditingController();
  TextEditingController complementoController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    var enderecoProvider = Provider.of<CriarPerfilProvider>(context);
    var enderecoProvider_ = Provider.of<DataProvider>(context);
    var endereco = enderecoProvider.usuarioLogado;
    var endereco_ = enderecoProvider_.usuarioLogado;
    String numeroCasa = '';
    String nomeCompleto = '';
    String ruaCasa = '';

    if (endereco.length >= 6) {
      numeroCasa = endereco[5].replaceAll(RegExp(r'[^0-9]'), '');
      nomeCompleto = '${endereco[3]} ${endereco[4]}';
      ruaCasa = endereco[5].replaceAll(RegExp(r'[^a-zA-Z ]'), '');
    } else if (endereco_.length >= 4) {
      nomeCompleto = '${endereco_[0]} ${endereco_[1]}';
      numeroCasa = endereco_[3].replaceAll(RegExp(r'[^0-9]'), '');
      ruaCasa = endereco_[3].replaceAll(RegExp(r'[^a-zA-Z ]'), '');
    }
    if (endereco.isNotEmpty && endereco.length == 11) {
      nomeController.text = nomeCompleto;
      ruaController.text = ruaCasa;
      cidadeController.text = endereco[8];
      estadoController.text = endereco[9];
      numeroController.text = numeroCasa;
    } else if (endereco_.isNotEmpty && endereco_.length == 12) {
      nomeController.text = nomeCompleto;
      ruaController.text = ruaCasa;
      cidadeController.text = endereco_[6];
      estadoController.text = endereco_[8];
      numeroController.text = numeroCasa;
    } else {
      print('Não há endereço para este perfil.');
    }
  }

  void adicionarEndereco() {
    String nome = nomeController.text;
    String estado = estadoController.text;
    String cidade = cidadeController.text;
    String bairro = bairroController.text;
    String rua = ruaController.text;
    String numero = numeroController.text;
    String complemento = complementoController.text;

    if (nome.isNotEmpty &&
        estado.isNotEmpty &&
        cidade.isNotEmpty &&
        bairro.isNotEmpty &&
        rua.isNotEmpty &&
        numero.isNotEmpty &&
        complemento.isNotEmpty) {
      List<String> novoEndereco = [
        nome,
        cidade,
        estado,
        bairro,
        rua,
        numero,
        complemento
      ];

      Endereco.listaDeEnderecos.add(novoEndereco);

      nomeController.clear();
      estadoController.clear();
      cidadeController.clear();
      bairroController.clear();
      ruaController.clear();
      numeroController.clear();
      complementoController.clear();

      setState(() {});
    }
  }

  @override
  void dispose() {
    nomeController.dispose();
    estadoController.dispose();
    cidadeController.dispose();
    bairroController.dispose();
    ruaController.dispose();
    numeroController.dispose();
    complementoController.dispose();
    super.dispose();
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
                width: 1220,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: SizedBox(
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
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
                                    SizedBox(
                                      child: TextField(
                                        keyboardType: TextInputType.text,
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp(r'[a-zA-Z\s]')),
                                        ],
                                        controller: nomeController,
                                        decoration: const InputDecoration(
                                          labelText: 'Nome completo',
                                          border: OutlineInputBorder(),
                                          filled: true,
                                          fillColor: Colors.white,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10.0),
                                    Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: TextField(
                                            keyboardType: TextInputType.text,
                                            inputFormatters: [
                                              LengthLimitingTextInputFormatter(
                                                  2),
                                              FilteringTextInputFormatter.allow(
                                                  RegExp(r'[a-zA-Z]')),
                                            ],
                                            controller: estadoController,
                                            decoration: const InputDecoration(
                                              labelText: 'Estado',
                                              border: OutlineInputBorder(),
                                              filled: true,
                                              fillColor: Colors.white,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 100,
                                        ),
                                        Expanded(
                                          child: TextField(
                                            keyboardType: TextInputType.text,
                                            inputFormatters: [
                                              FilteringTextInputFormatter.allow(
                                                  RegExp(r'[a-zA-Z\s]')),
                                            ],
                                            controller: cidadeController,
                                            decoration: const InputDecoration(
                                              labelText: 'Cidade',
                                              border: OutlineInputBorder(),
                                              filled: true,
                                              fillColor: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10.0),
                                    SizedBox(
                                      child: TextField(
                                        keyboardType: TextInputType.text,
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp(r'[a-zA-Z\s]')),
                                        ],
                                        controller: bairroController,
                                        decoration: const InputDecoration(
                                          labelText: 'Bairro',
                                          border: OutlineInputBorder(),
                                          filled: true,
                                          fillColor: Colors.white,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10.0),
                                    Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: TextField(
                                            keyboardType: TextInputType.text,
                                            inputFormatters: [
                                              FilteringTextInputFormatter.allow(
                                                  RegExp(r'[a-zA-Z\s]')),
                                            ],
                                            controller: ruaController,
                                            decoration: const InputDecoration(
                                              labelText: 'Rua/Avenida',
                                              border: OutlineInputBorder(),
                                              filled: true,
                                              fillColor: Colors.white,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 100,
                                        ),
                                        Expanded(
                                          child: TextField(
                                            keyboardType: TextInputType.number,
                                            inputFormatters: [
                                              FilteringTextInputFormatter
                                                  .digitsOnly,
                                            ],
                                            controller: numeroController,
                                            decoration: const InputDecoration(
                                              labelText: 'Número',
                                              border: OutlineInputBorder(),
                                              filled: true,
                                              fillColor: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10.0),
                                    SizedBox(
                                      child: TextField(
                                        keyboardType: TextInputType.text,
                                        controller: complementoController,
                                        decoration: const InputDecoration(
                                          labelText: 'Complemento',
                                          border: OutlineInputBorder(),
                                          filled: true,
                                          fillColor: Colors.white,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 60,
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        if (nomeController.text.isNotEmpty &&
                                            estadoController.text.isNotEmpty &&
                                            cidadeController.text.isNotEmpty &&
                                            bairroController.text.isNotEmpty &&
                                            ruaController.text.isNotEmpty &&
                                            numeroController.text.isNotEmpty &&
                                            complementoController
                                                .text.isNotEmpty) {
                                          adicionarEndereco();

                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const PagamentoEndereco(),
                                            ),
                                          );
                                        } else {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: const Text(
                                                    'Campos obrigatórios'),
                                                content: const Text(
                                                    'Preencha todos os campos para adicionar o endereço.'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: const Text('OK'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        minimumSize: const Size(150, 50),
                                      ),
                                      child: const Text('Adicionar'),
                                    ),
                                  ],
                                ),
                              ),
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
          ),
        ));
  }
}
