import 'package:flutter/material.dart';
import 'package:shop_ease/src/components/pagamento_resumo.dart';
import 'package:shop_ease/src/components/pagamento_selecao.dart';
import '../model/endereco.dart';
import 'pagamento_endereco.dart';
import 'carrinho.dart';
import 'package:provider/provider.dart';

bool pagamentoAprovado = false;

class PagamentoCheckout extends StatefulWidget {
  const PagamentoCheckout({super.key});

  @override
  State<PagamentoCheckout> createState() => _PagamentoCheckoutState();
}

class _PagamentoCheckoutState extends State<PagamentoCheckout> {
  List<String> endereco = Endereco.listaDeEnderecos[passaIndexEndereco];
  String exibeCartao() {
    if (passaIndexCartao != -1) {
      List<String> cartao = Cartao.listaDeCartoes[passaIndexCartao];
      return 'Cartao de final: ***** ${cartao[0].substring(cartao[0].length - 4)}';
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    var carrinhoProvider = context.watch<CarrinhoProvider>();
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
                                'Revise e confirme sua compra',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'Detalhe do envio',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                padding: const EdgeInsets.all(20.0),
                                decoration: BoxDecoration(
                                  color: Colors.white70,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Rua ${endereco[4]} ${endereco[5]}'),
                                    Text(
                                      '${endereco[1]}, ${endereco[2]} - ${endereco[6]}',
                                    ),
                                    Text(endereco[0]),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white70,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: SizedBox(
                                  height: 200,
                                  child: ListView.builder(
                                    itemCount:
                                        carrinhoProvider.itensNoCarrinho.length,
                                    itemBuilder: (context, index) {
                                      var produto = carrinhoProvider
                                          .itensNoCarrinho[index];
                                      return Container(
                                        padding: const EdgeInsets.all(8.0),
                                        width: double.infinity,
                                        child: ListTile(
                                          title: Text(produto.nome,
                                              style: const TextStyle(
                                                  fontSize: 20)),
                                          subtitle: Text(
                                              'R\$ ${produto.preco.toString()}'),
                                          leading: Image(
                                              image:
                                                  NetworkImage(produto.imagem),
                                              width: 150,
                                              height: 300),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'Detalhes do pagamento',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                padding: const EdgeInsets.all(20.0),
                                decoration: BoxDecoration(
                                  color: Colors.white70,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Visibility(
                                      visible: passaIndexCartao != -1,
                                      child: Text(exibeCartao()),
                                    ),
                                    Visibility(
                                        visible: passaPixCheckout,
                                        child: const Text('Pix')),
                                    Visibility(
                                      visible: passaTransCheckout,
                                      child: const Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Transferência bancária',
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.normal),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text('Banco do Brasil'),
                                          Text('Agência: 3663-3'),
                                          Text('Conta Corrente: 25206-4'),
                                          Text('Titular: Enzo Bento Duarte'),
                                          Text('CNPJ: 65.935.613/0001-66'),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                              'Após o depósito ou transferência, enviar o comprovante para o email'),
                                          Text('contato.shopeasy@gmail.com'),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 30),
                    // ignore: prefer_const_constructors
                    Resumo(),
                  ],
                ),
              ),
            )),
          ),
        ));
  }
}
