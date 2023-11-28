import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget build(BuildContext context) {
  return Provider<CriarPerfilProvider>(
      create: (_) => CriarPerfilProvider(),
      builder: (context, child) {
        return Text(context.watch<CriarPerfilProvider>().toString());
      });
}

class CriarPerfil extends StatefulWidget {
  const CriarPerfil({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CriarPerfilState createState() => _CriarPerfilState();
}

class _CriarPerfilState extends State<CriarPerfil>
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

  List<String> usuarioLogou = [];

  Future<void> _fazerLogin() async {
    try {
      usuarioLogou.add(_criarUsernameController.text);
      usuarioLogou.add(_criarPasswordController.text);
      usuarioLogou.add(_criarEmailController.text);
      usuarioLogou.add(_criarNomeController.text);
      usuarioLogou.add(_criarSobrenomeController.text);
      usuarioLogou.add(_criarEnderecoController.text);
      usuarioLogou.add(_criarCartaoController.text);
      usuarioLogou.add(_criarCartaoValidadeController.text);
      usuarioLogou.add(_criarCidadeController.text);
      usuarioLogou.add(_criarEstadoController.text);
      usuarioLogou.add(_criarPostalController.text);
      Navigator.pushReplacementNamed(
        context,
        '/home',
      );
      return;
    } catch (error) {
      // ignore: avoid_print
      print('Erro ao fazer login: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Erro ao fazer login')),
      );
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
                  'Bem vindo, faça seu cadastro!',
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
                      labelText: 'Crie um nome de usuário',
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
                      labelText: 'Crie uma senha',
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
                      labelText: 'Digite seu email',
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
                      labelText: 'Digite seu primeiro nome',
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
                      labelText: 'Digite seu sobrenome',
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
                      labelText: 'Digite seu endereço (Número, Rua)',
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
                      labelText: 'Digite o número do seu cartão',
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
                      labelText: 'Digite a validade do seu cartão (MM/AA)',
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
                      labelText: 'Digite sua cidade',
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
                      labelText: 'Digite seu estado (XX)',
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
                      labelText: 'Digite seu código postal (00000)',
                      labelStyle: TextStyle(
                          color: Colors.black, decorationThickness: 2.0),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black))),
                ),
                const SizedBox(height: 5.0),
                ElevatedButton(
                  onPressed: () async {
                    _fazerLogin();
                    for (int i = 0; i < usuarioLogou.length; i++) {
                      context
                          .read<CriarPerfilProvider>()
                          .adicionarItem(usuarioLogou[i]);
                    }
                  },
                  child: const Text('Login'),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

class CriarPerfilProvider with ChangeNotifier {
  // ignore: prefer_final_fields
  List<String> _usuarioLogado = [];

  List<String> get usuarioLogado => _usuarioLogado;

  void adicionarItem(String item) {
    _usuarioLogado.add(item);
    notifyListeners();
  }

  void limparUsuario() {
    _usuarioLogado.clear();
    notifyListeners();
  }

  List<String> obterDadosUsuario() {
    return List.from(_usuarioLogado);
  }
}
