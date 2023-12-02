import 'package:flutter/material.dart';
import 'package:shop_ease/src/components/pagamento_resumo.dart';

bool pagamentoAprovado = false;

class PagamentoCheckout extends StatelessWidget {
  const PagamentoCheckout({super.key});

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
                        child: Container(
                          color: Colors.white,
                          child: const Center(
                            child: Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [],
                              ),
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
        ));
  }
}
