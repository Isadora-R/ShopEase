import 'package:flutter/material.dart';
import 'package:shop_ease/src/components/pagamento_endereco.dart';
import 'package:provider/provider.dart';
import 'historico.dart';

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
    var pedidoProvider = Provider.of<PedidoProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerencie seus pedidos'),
        backgroundColor: Colors.transparent,
        titleTextStyle: const TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(
                            height: 400,
                            child: ListView.separated(
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const Divider(
                                  color: Colors.grey,
                                  thickness: 1.0,
                                  height: 1.0,
                                );
                              },
                              itemCount:
                                  carrinhoProvider.itensNoCarrinho.length,
                              itemBuilder: (context, index) {
                                var produto =
                                    carrinhoProvider.itensNoCarrinho[index];
                                return Container(
                                  padding: const EdgeInsets.all(8.0),
                                  color: Colors.white,
                                  child: ListTile(
                                    title: Text(produto.nome,
                                        style: const TextStyle(fontSize: 20)),
                                    subtitle:
                                        Text('R\$ ${produto.preco.toString()}'),
                                    leading: Image(
                                      image: NetworkImage(produto.imagem),
                                      width: 150,
                                      height: 300,
                                    ),
                                    trailing: IconButton(
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.deepPurple[900],
                                      ),
                                      onPressed: () {
                                        carrinhoProvider
                                            .removerDoCarrinho(produto);
                                      },
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 600,
                      color: Colors.white70,
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Resumo da compra',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Divider(
                            color: Colors.grey,
                            height: 20,
                            thickness: 2,
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
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Sub-total:',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    Text(
                                      'R\$ ${carrinhoProvider.calcularTotalCarrinho().toStringAsFixed(2)}',
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Divider(
                                  color: Colors.grey,
                                  height: 20,
                                  thickness: 2,
                                  indent: 0,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Desconto com PIX',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    Text(
                                      'R\$ -${(carrinhoProvider.calcularTotalCarrinho() - carrinhoProvider.calculaDesconto()).toStringAsFixed(2)} ',
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5.0),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Sub-total:',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    Text(
                                      'R\$ ${carrinhoProvider.calculaDesconto().toStringAsFixed(2)}',
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    if (carrinhoProvider
                                            .calcularTotalCarrinho()
                                            .sign >
                                        0) {
                                      // Criar um PedidoHistorico para cada produto no carrinho e adicionar ao histórico
                                      for (var produto
                                          in carrinhoProvider.itensNoCarrinho) {
                                        PedidoHistorico pedido =
                                            PedidoHistorico(
                                                nome: produto.nome,
                                                preco: produto.preco);

                                        // Adicionar o pedido ao histórico
                                        pedidoProvider.adicionarPedido(pedido);
                                      }

                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const PagamentoEndereco(),
                                          settings: RouteSettings(
                                              arguments: carrinhoProvider
                                                  .calcularTotalCarrinho()),
                                        ),
                                      );
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                'Seu carrinho está vazio!')),
                                      );
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(200, 50),
                                  ),
                                  child: const Text('Fazer pedido'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
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
    notifyListeners();
  }
}
