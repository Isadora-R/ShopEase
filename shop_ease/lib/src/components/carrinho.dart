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
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            // const Text(
            //   'Produtos no Carrinho:',
            //   style: TextStyle(
            //     fontSize: 20.0,
            //     fontWeight: FontWeight.bold,
            //     color: Colors.white,
            //   ),
            // ),
            Expanded(
              child: ListView.builder(
                itemCount: carrinhoProvider.itensNoCarrinho.length,
                itemBuilder: (context, index) {
                  var produto = carrinhoProvider.itensNoCarrinho[index];
                  return Container(
                    padding: const EdgeInsets.all(8.0),
                    width: double.infinity,
                    color: Colors.purple[500],
                    child: ListTile(
                      title: Text(produto.nome,
                          style: const TextStyle(fontSize: 20)),
                      subtitle: Text('R\$ ${produto.preco.toString()}'),
                      leading: Image(
                          image: NetworkImage(produto.imagem),
                          width: 150,
                          height: 300),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          // Chame a função de remoção aqui
                          carrinhoProvider.removerDoCarrinho(produto);
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 5.0),
            Text(
                'Total no carrinho: R\$ ${carrinhoProvider.calcularTotalCarrinho()}'),
            const SizedBox(height: 5.0),
            Text(
                'Total com desconto: R\$ ${carrinhoProvider.calculaDesconto()}'),
            const SizedBox(height: 5.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PagamentoEndereco(),
                    settings: RouteSettings(
                        arguments: carrinhoProvider.calcularTotalCarrinho()),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.purple[300],
              ),
              child: const Text('Fazer pedido'),
            ),
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
    return _itensNoCarrinho.fold(
        0.0,
        (total, produto) =>
            total + (produto.preco * (100.0 - produto.desconto) / 100));
  }
}
