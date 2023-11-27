import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_ease/src/components/pagamento_checkout.dart';
import 'package:shop_ease/src/service/api_service.dart';
import '../model/user_model.dart';

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
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _cardExpireController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  bool cardNumberChecked = false;
  bool cardexpireChecked = false;
  bool firstNameChecked = false;
  bool lastNameChecked = false;
  Future<void> verificarCartao() async {
    final userLogin = await getUserLogin();
    {
      for (User user in userLogin.users) {
        if (_cardNumberController.text == user.bank.cardNumber) {
          cardNumberChecked = true;
          break;
        }
      }

      for (User user in userLogin.users) {
        if (_cardExpireController.text == user.bank.cardExpire) {
          cardexpireChecked = true;
          break;
        }
      }

      for (User user in userLogin.users) {
        if (_firstNameController.text == user.firstName) {
          firstNameChecked = true;
          break;
        }
      }

      for (User user in userLogin.users) {
        if (_lastNameController.text == user.lastName) {
          lastNameChecked = true;
          break;
        }
      }
    }
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
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white70,
                            border: Border.all(
                              color: Colors.grey, // Cor da borda
                              width: 1.0, // Largura da borda
                            ),
                          ),

                          //height: 200, //altura
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
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: TextField(
                                          controller: _firstNameController,
                                          inputFormatters: const [
                                            //LengthLimitingTextInputFormatter(2),
                                          ],
                                          decoration: const InputDecoration(
                                            labelText: 'Nome',
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
                                        width: 5,
                                      ),
                                      Expanded(
                                        child: TextField(
                                          controller: _lastNameController,
                                          inputFormatters: const [
                                            //LengthLimitingTextInputFormatter(2),
                                          ],
                                          decoration: const InputDecoration(
                                            labelText: 'Sobrenome',
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
                                      controller: _cardNumberController,
                                      decoration: const InputDecoration(
                                        labelText: 'Número do Cartão',
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
                                          controller: _cardExpireController,
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
                                  const SizedBox(
                                    height: 60,
                                  ),
                                  ElevatedButton(
                                    onPressed: () async {
                                      await verificarCartao();
                                      if (cardNumberChecked &&
                                          cardexpireChecked &&
                                          firstNameChecked &&
                                          lastNameChecked) {
                                        // ignore: use_build_context_synchronously
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const PagamentoCheckout(),
                                          ),
                                        );
                                      } else {
                                        // Se os dados do cartão não forem verificados corretamente, exiba uma mensagem ou tome outra ação.
                                        // Por exemplo, mostrar um snackbar informando que os dados do cartão estão incorretos.
                                        // ignore: use_build_context_synchronously
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                              content: Text(
                                                  'Dados do cartão inválidos')),
                                        );
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: const Size(150, 50),
                                    ),
                                    child: const Text('Continuar'),
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
                          color: Colors.white70,
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
