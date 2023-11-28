import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_ease/src/components/pagamento_endereco.dart';
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
                        child: SizedBox(
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
                                            LengthLimitingTextInputFormatter(2),
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
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                            RegExp(r'[a-zA-Z\s]')),
                                      ],
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
                                                    Navigator.of(context).pop();
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
                      Flexible(
                        flex: 1,
                        child: Container(
                          color: const Color.fromARGB(255, 248, 240, 250),
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
