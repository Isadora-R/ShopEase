import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_ease/src/components/criar_perfil.dart';
import 'package:shop_ease/src/components/login.dart';

Widget build(BuildContext context) {
  return Provider<EditarPerfilProvider>(
      create: (_) => EditarPerfilProvider(),
      builder: (context, child) {
        return Text(context.watch<EditarPerfilProvider>().toString());
      });
}

class EditarPerfil extends StatefulWidget {
  const EditarPerfil({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _EditalPerfilState createState() => _EditalPerfilState();
}

class _EditalPerfilState extends State<EditarPerfil>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final TextEditingController _criarUsernameController =
      TextEditingController();
  final TextEditingController _criarPasswordController =
      TextEditingController();
  final TextEditingController _criarEmailController = TextEditingController();
  final TextEditingController _criarNomeController = TextEditingController();
  final TextEditingController _criarSobrenomeController =
      TextEditingController();
  final TextEditingController _criarEnderecoController =
      TextEditingController();
  final TextEditingController _criarCartaoController = TextEditingController();
  final TextEditingController _criarCartaoValidadeController =
      TextEditingController();
  final TextEditingController _criarCidadeController = TextEditingController();
  final TextEditingController _criarEstadoController = TextEditingController();
  final TextEditingController _criarPostalController = TextEditingController();

  @override
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    var editarPerfilProvider = Provider.of<CriarPerfilProvider>(context);
    var editarPerfilProvider_ = Provider.of<DataProvider>(context);
    var dadosUsuario = editarPerfilProvider.usuarioLogado;
    var dadosUsuario_ = editarPerfilProvider_.usuarioLogado;

    // Restante do código para inicializar os controladores

    // Inicializar controladores de texto com dados existentes
    if (dadosUsuario.isNotEmpty && dadosUsuario.length == 11) {
      _criarUsernameController.text = dadosUsuario[0];
      _criarPasswordController.text = dadosUsuario[1];
      _criarEmailController.text = dadosUsuario[2];
      _criarNomeController.text = dadosUsuario[3];
      _criarSobrenomeController.text = dadosUsuario[4];
      _criarEnderecoController.text = dadosUsuario[5];
      _criarCartaoController.text = dadosUsuario[6];
      _criarCartaoValidadeController.text = dadosUsuario[7];
      _criarCidadeController.text = dadosUsuario[8];
      _criarEstadoController.text = dadosUsuario[9];
      _criarPostalController.text = dadosUsuario[10];
    } else if (dadosUsuario_.isNotEmpty && dadosUsuario_.length == 12) {
      /* 
             0 user.firstName,
             1 user.lastName,
             2 user.image,
             3 user.address.address,
             4 user.bank.cardNumber,
             5 user.bank.cardExpire,
             6 user.address.city ?? '',
             7 user.address.postalCode,
             8 user.address.state,
             9 user.email,
             10 user.username
             11 user.password */
      _criarUsernameController.text = dadosUsuario_[10];
      _criarPasswordController.text = dadosUsuario_[11];
      _criarEmailController.text = dadosUsuario_[9];
      _criarNomeController.text = dadosUsuario_[0];
      _criarSobrenomeController.text = dadosUsuario_[1];
      _criarEnderecoController.text = dadosUsuario_[3];
      _criarCartaoController.text = dadosUsuario_[4];
      _criarCartaoValidadeController.text = dadosUsuario_[5];
      _criarCidadeController.text = dadosUsuario_[6];
      _criarEstadoController.text = dadosUsuario_[8];
      _criarPostalController.text = dadosUsuario_[7];
    } else {
      print('Não foi possível editar o perfil.');
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Edite seus dados',
                  style: TextStyle(
                    color: Colors.purple,
                    decorationThickness: 2.0,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20.0),
                TextField(
                  style: const TextStyle(
                      color: Colors.black, decorationThickness: 2.0),
                  controller: _criarUsernameController,
                  decoration: const InputDecoration(
                      labelText: 'Editar nome de usuário',
                      labelStyle: TextStyle(
                          color: Colors.black, decorationThickness: 2.0),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black))),
                ),
                const SizedBox(height: 5.0),
                TextField(
                  style: const TextStyle(
                      color: Colors.black, decorationThickness: 2.0),
                  controller: _criarPasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                      labelText: 'Editar senha',
                      labelStyle: TextStyle(
                          color: Colors.black, decorationThickness: 2.0),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black))),
                ),
                const SizedBox(height: 5.0),
                TextField(
                  style: const TextStyle(
                      color: Colors.black, decorationThickness: 2.0),
                  controller: _criarEmailController,
                  decoration: const InputDecoration(
                      labelText: 'Editar email',
                      labelStyle: TextStyle(
                          color: Colors.black, decorationThickness: 2.0),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black))),
                ),
                const SizedBox(height: 5.0),
                TextField(
                  style: const TextStyle(
                      color: Colors.black, decorationThickness: 2.0),
                  controller: _criarNomeController,
                  decoration: const InputDecoration(
                      labelText: 'Editar primeiro nome',
                      labelStyle: TextStyle(
                          color: Colors.black, decorationThickness: 2.0),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black))),
                ),
                const SizedBox(height: 5.0),
                TextField(
                  style: const TextStyle(
                      color: Colors.black, decorationThickness: 2.0),
                  controller: _criarSobrenomeController,
                  decoration: const InputDecoration(
                      labelText: 'Editar sobrenome',
                      labelStyle: TextStyle(
                          color: Colors.black, decorationThickness: 2.0),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black))),
                ),
                const SizedBox(height: 5.0),
                TextField(
                  style: const TextStyle(
                      color: Colors.black, decorationThickness: 2.0),
                  controller: _criarEnderecoController,
                  decoration: const InputDecoration(
                      labelText: 'Editar endereço (Número, Rua)',
                      labelStyle: TextStyle(
                          color: Colors.black, decorationThickness: 2.0),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black))),
                ),
                const SizedBox(height: 5.0),
                TextField(
                  style: const TextStyle(
                      color: Colors.black, decorationThickness: 2.0),
                  controller: _criarCartaoController,
                  decoration: const InputDecoration(
                      labelText: 'Editar número do cartão',
                      labelStyle: TextStyle(
                          color: Colors.black, decorationThickness: 2.0),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black))),
                ),
                const SizedBox(height: 5.0),
                TextField(
                  style: const TextStyle(
                      color: Colors.black, decorationThickness: 2.0),
                  controller: _criarCartaoValidadeController,
                  decoration: const InputDecoration(
                      labelText: 'Editar validade do cartão (MM/AA)',
                      labelStyle: TextStyle(
                          color: Colors.black, decorationThickness: 2.0),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black))),
                ),
                const SizedBox(height: 5.0),
                TextField(
                  style: const TextStyle(
                      color: Colors.black, decorationThickness: 2.0),
                  controller: _criarCidadeController,
                  decoration: const InputDecoration(
                      labelText: 'Editar cidade',
                      labelStyle: TextStyle(
                          color: Colors.black, decorationThickness: 2.0),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black))),
                ),
                const SizedBox(height: 5.0),
                TextField(
                  style: const TextStyle(
                      color: Colors.black, decorationThickness: 2.0),
                  controller: _criarEstadoController,
                  decoration: const InputDecoration(
                      labelText: 'Editar estado (XX)',
                      labelStyle: TextStyle(
                          color: Colors.black, decorationThickness: 2.0),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black))),
                ),
                const SizedBox(height: 5.0),
                TextField(
                  style: const TextStyle(
                      color: Colors.black, decorationThickness: 2.0),
                  controller: _criarPostalController,
                  decoration: const InputDecoration(
                      labelText: 'Editar código postal (00000)',
                      labelStyle: TextStyle(
                          color: Colors.black, decorationThickness: 2.0),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black))),
                ),
                const SizedBox(height: 10.0),
                ElevatedButton(
                  onPressed: () async {
                    List<String> novosDados = [
                      _criarUsernameController.text,
                      _criarPasswordController.text,
                      _criarEmailController.text,
                      _criarNomeController.text,
                      _criarSobrenomeController.text,
                      _criarEnderecoController.text,
                      _criarCartaoController.text,
                      _criarCartaoValidadeController.text,
                      _criarCidadeController.text,
                      _criarEstadoController.text,
                      _criarPostalController.text,
                    ];
                    print(
                        'Dados antes de salvar: ${context.read<EditarPerfilProvider>().usuarioLogado}');
                    context
                        .read<EditarPerfilProvider>()
                        .salvarDados(novosDados);
                    print(
                        'Dados após salvar: ${context.read<EditarPerfilProvider>().usuarioLogado}');
                  },
                  child: const Text('Salvar'),
                ),
                const SizedBox(height: 10.0),
                const SizedBox(height: 5.0),
                ElevatedButton(
                  onPressed: () async {
                    Navigator.pop(context);
                    print(
                        'Dados após salvar: ${context.read<EditarPerfilProvider>().usuarioLogado}');
                  },
                  child: const Text('Voltar'),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

class EditarPerfilProvider with ChangeNotifier {
  // ignore: prefer_final_fields
  List<String> _usuarioLogado = [];

  List<String> get usuarioLogado => _usuarioLogado;

  void salvarDados(List<String> novosDados) {
    _usuarioLogado = List.from(novosDados);
    notifyListeners();
  }

  List<String> obterDadosUsuario() {
    return List.from(_usuarioLogado);
  }
}
