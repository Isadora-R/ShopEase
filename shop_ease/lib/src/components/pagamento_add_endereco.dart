import 'package:flutter/material.dart';
import 'package:shop_ease/src/components/pagamento_endereco.dart';
import '../model/endereco.dart';

class PagamentoAddEndereco extends StatefulWidget {
  const PagamentoAddEndereco({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PagamentoAddEndereco createState() => _PagamentoAddEndereco();
}

class _PagamentoAddEndereco extends State<PagamentoAddEndereco> {
  //List<List<String>> listaDeEnderecos = [];

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

    // Verifique se os campos não estão vazios
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
      // Adicione o novo endereço à lista em EnderecoData
      Endereco.listaDeEnderecos.add(novoEndereco);

      // Limpe os campos de texto após adicionar o endereço
      nomeController.clear();
      estadoController.clear();
      cidadeController.clear();
      bairroController.clear();
      ruaController.clear();
      numeroController.clear();
      complementoController.clear();

      setState(() {}); // Atualize o estado para refletir a mudança na lista
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
                                          inputFormatters: const [
                                            //LengthLimitingTextInputFormatter(2),
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
                                          inputFormatters: const [
                                            //LengthLimitingTextInputFormatter(2),
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
                                          inputFormatters: const [
                                            //LengthLimitingTextInputFormatter(2),
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
                                          inputFormatters: const [
                                            //LengthLimitingTextInputFormatter(2),
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
                                      adicionarEndereco();

                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const PagamentoEndereco()),
                                      );
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
