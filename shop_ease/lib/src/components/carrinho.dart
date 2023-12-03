import 'package:flutter/material.dart';
import 'package:shop_ease/src/components/pagamento_endereco.dart';
import 'package:provider/provider.dart';

Widget build(BuildContext context) {
  return Provider<CarrinhoProvider>(
      create: (_) => CarrinhoProvider(),
      builder: (context, child) {
        return Text(context.watch<CarrinhoProvider>().toString());
      });
}

class Produto {
  final String nome;
  final double preco;
  final String imagem;
  final double desconto;

  Produto(
      {required this.nome,
      required this.preco,
      required this.imagem,
      required this.desconto});
}

class Carrinho extends StatelessWidget {
  const Carrinho({super.key});

  @override
  Widget build(BuildContext context) {
    var carrinhoProvider = context.watch<CarrinhoProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerencie seus pedidos'),
        backgroundColor: Colors.transparent,
        titleTextStyle: const TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                    color: Colors.grey,
                    thickness: 1.0,
                    height: 1.0,
                  );
                },
                itemCount: carrinhoProvider.itensNoCarrinho.length,
                itemBuilder: (context, index) {
                  var produto = carrinhoProvider.itensNoCarrinho[index];
                  return Container(
                    padding: const EdgeInsets.all(8.0),
                    width: double.infinity,
                    color: Colors.white,
                    child: ListTile(
                      title: Text(produto.nome,
                          style: const TextStyle(fontSize: 20)),
                      subtitle: Text('R\$ ${produto.preco.toString()}'),
                      leading: Image(
                          image: NetworkImage(produto.imagem),
                          width: 150,
                          height: 300),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.deepPurple[900],
                        ),
                        onPressed: () {
                          carrinhoProvider.removerDoCarrinho(produto);
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            const Divider(
              color: Colors.deepPurple,
              height: 10,
              thickness: 1,
              indent: 0,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 5.0),
                  Text(
                      'Sub-total: R\$ ${carrinhoProvider.calcularTotalCarrinho().toStringAsFixed(2)}',
                      style: const TextStyle(
                          fontSize: 13, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5.0),
                  Text(
                    'Sub-total com desconto (pagamento no pix): R\$ ${carrinhoProvider.calculaDesconto().toStringAsFixed(2)}',
                    style: const TextStyle(
                        fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5.0),
                ],
              ),
            ),
            const SizedBox(height: 5.0),
            ElevatedButton(
              onPressed: () {
                if (carrinhoProvider.calcularTotalCarrinho().sign > 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PagamentoEndereco(),
                      settings: RouteSettings(
                          arguments: carrinhoProvider.calcularTotalCarrinho()),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Seu carrinho está vazio!')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(150, 50),
              ),
              child: const Text('Fazer pedido'),
            ),
            const SizedBox(height: 5.0),
          ],
        ),
      ),
    );
  }
}

class CarrinhoProvider with ChangeNotifier {
  final List<Produto> _itensNoCarrinho = [];

  List<Produto> get itensNoCarrinho => _itensNoCarrinho;

  void adicionarAoCarrinho(Produto produto) {
    _itensNoCarrinho.add(produto);
    notifyListeners();
  }

  void removerDoCarrinho(Produto produto) {
    _itensNoCarrinho.remove(produto);
    notifyListeners();
  }

  double calcularTotalCarrinho() {
    return _itensNoCarrinho.fold(
        0.0, (total, produto) => total + produto.preco);
  }

  double calculaDesconto() {
    double resultado = _itensNoCarrinho.fold(
      0.0,
      (total, produto) =>
          total + (produto.preco * (100.0 - produto.desconto) / 100),
    );

    return double.parse(resultado.toStringAsFixed(2));
  }

  void limpaCarrinho() {
    itensNoCarrinho.clear();
  }
}
