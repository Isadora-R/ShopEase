import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_ease/src/components/pagamento_checkout.dart';
import 'package:shop_ease/src/components/pagamento_selecao.dart';
import 'package:shop_ease/src/service/api_service.dart';
import '../model/endereco.dart';

// "cardExpire": "06/22"
// "cardNumber": "50380955204220685"
// "firstName": "Terry",
// "lastName": "Medhurst",

class PagamentoCartao extends StatefulWidget {
  const PagamentoCartao({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PagamentoCartao createState() => _PagamentoCartao();
}

class _PagamentoCartao extends State<PagamentoCartao> {
  TextEditingController numeroCartaoController = TextEditingController();
  TextEditingController nomeCartaoController = TextEditingController();
  TextEditingController validadeCartaoController = TextEditingController();
  TextEditingController codSegurancaController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  void adicionarCartao() {
    String numero = numeroCartaoController.text;
    String nome = nomeCartaoController.text;
    String validade = validadeCartaoController.text;
    String codigo = codSegurancaController.text;
    String cpf = cpfController.text;

    if (numero.isNotEmpty &&
        nome.isNotEmpty &&
        validade.isNotEmpty &&
        codigo.isNotEmpty &&
        cpf.isNotEmpty) {
      List<String> novoCartao = [
        numero,
        validade,
        nome,
        codigo,
        cpf,
      ];

      Cartao.listaDeCartoes.add(novoCartao);

      numeroCartaoController.clear();
      nomeCartaoController.clear();
      validadeCartaoController.clear();
      codSegurancaController.clear();
      cpfController.clear();

      setState(() {});
    }
  }

  @override
  void dispose() {
    numeroCartaoController.dispose();
    nomeCartaoController.dispose();
    validadeCartaoController.dispose();
    codSegurancaController.dispose();
    cpfController.dispose();
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
                                  'Adicione um novo cartão',
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                SizedBox(
                                  height: 50.0,
                                  width: 500,
                                  child: TextField(
                                    controller: numeroCartaoController,
                                    decoration: const InputDecoration(
                                      labelText: 'Número de Cartão',
                                      border: OutlineInputBorder(),
                                      filled: true,
                                      fillColor: Colors.white,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10.0),
                                SizedBox(
                                  height: 50.0,
                                  width: 500,
                                  child: TextField(
                                    controller: nomeCartaoController,
                                    decoration: const InputDecoration(
                                      labelText: 'Nome no Cartão',
                                      border: OutlineInputBorder(),
                                      filled: true,
                                      fillColor: Colors.white,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10.0),
                                const Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Text(
                                          style: TextStyle(fontSize: 16),
                                          'Validade'),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: TextField(
                                        controller: validadeCartaoController,
                                        inputFormatters: const [
                                          //LengthLimitingTextInputFormatter(2),
                                        ],
                                        decoration: const InputDecoration(
                                          labelText: 'MM/AA',
                                          border: OutlineInputBorder(),
                                          filled: true,
                                          fillColor: Colors.white,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    const SizedBox(
                                      width: 282,
                                    ),
                                    Expanded(
                                      child: TextField(
                                        controller: codSegurancaController,
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(3),
                                        ],
                                        decoration: const InputDecoration(
                                          labelText: 'Cód. de Segurança',
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
                                  height: 50.0,
                                  width: 500,
                                  child: TextField(
                                    controller: cpfController,
                                    decoration: const InputDecoration(
                                      labelText: 'CPF do titular do cartão',
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
                                    if (numeroCartaoController.text.isNotEmpty &&
                                        nomeCartaoController.text.isNotEmpty &&
                                        validadeCartaoController
                                            .text.isNotEmpty &&
                                        codSegurancaController
                                            .text.isNotEmpty &&
                                        cpfController.text.isNotEmpty) {
                                      adicionarCartao();

                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const PagamentoSelecao(),
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
                                                'Preencha todos os campos para adicionar o cartão.'),
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
                      const SizedBox(width: 30),
                      Flexible(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white70,
                            border: Border.all(
                              color: Colors.grey, // Cor da borda
                              width: 1.0, // Largura da borda
                            ),
                          ),
                          //color: Colors.white70,
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.all(20),
                          //height: 200, // altura
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
