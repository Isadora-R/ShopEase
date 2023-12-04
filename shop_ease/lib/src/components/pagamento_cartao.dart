import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shop_ease/src/components/criar_perfil.dart';
import 'package:shop_ease/src/components/login.dart';
import 'package:shop_ease/src/components/pagamento_resumo.dart';
import 'package:shop_ease/src/components/pagamento_selecao.dart';
import '../model/endereco.dart';

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

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    var cartaoProvider = Provider.of<CriarPerfilProvider>(context);
    var cartaoProvicer_ = Provider.of<DataProvider>(context);
    var cartaoUser = cartaoProvider.usuarioLogado;
    var cartaiUser_ = cartaoProvicer_.usuarioLogado;

    String nomeCompleto = '';

    // _criarCartaoController.text = dadosUsuario[6];
    // _criarCartaoValidadeController.text = dadosUsuario[7];
    if (cartaoUser.length >= 5) {
      nomeCompleto = '${cartaoUser[3]} ${cartaoUser[4]}';
    } else if (cartaiUser_.length >= 3) {
      nomeCompleto = '${cartaiUser_[0]} ${cartaiUser_[1]}';
    }
    if (cartaoUser.isNotEmpty && cartaoUser.length == 11) {
      nomeCartaoController.text = nomeCompleto;
      numeroCartaoController.text = cartaoUser[6];
      validadeCartaoController.text = cartaoUser[7];
    } else if (cartaiUser_.isNotEmpty && cartaiUser_.length == 12) {
      //  _criarCartaoController.text = dadosUsuario_[4];
      //  _criarCartaoValidadeController.text = dadosUsuario_[5];
      nomeCartaoController.text = nomeCompleto;
      numeroCartaoController.text = cartaiUser_[4];
      validadeCartaoController.text = cartaiUser_[5];
    } else {
      print('Não há cartão para este perfil.');
    }
  }

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
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(16),
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
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
                                  keyboardType: TextInputType.text,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'[a-zA-Z\s]')),
                                  ],
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
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: TextField(
                                      controller: validadeCartaoController,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(5),
                                        FilteringTextInputFormatter.allow(
                                            RegExp(r'[0-9/]')),
                                      ],
                                      decoration: const InputDecoration(
                                        labelText: 'Validade (MM/AA)',
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
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(3),
                                        FilteringTextInputFormatter.digitsOnly,
                                      ],
                                      controller: codSegurancaController,
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
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(11),
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
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
                                      codSegurancaController.text.isNotEmpty &&
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
                                          title:
                                              const Text('Campos obrigatórios'),
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
