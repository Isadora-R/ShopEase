var cupom = '';
//função que verifica se o cupom é valido
bool verificaCupom(List<dynamic> lista, String cupom) {
  for (var item in lista) {
    if (item is String && item == cupom) {
      return true;
    }
  }
  return false;
}

//função que calcula e retorna valor total com desconto
double desconto(List<dynamic> lista, double valorTotal, String cupom) {
  double promo = 0;
  if (verificaCupom(lista, cupom)) {
    for (var i = 0; i < lista.length; i++) {
      if (lista[i] is double &&
          lista[i - 1] is String &&
          lista[i - 1] == cupom) {
        promo = lista[i];
      }
    }
    promo = promo * valorTotal;
    promo = valorTotal - promo;
    return promo;
  } else {
    return valorTotal;
  }
}

//Array com os cupons de desconto
List<dynamic> listaDeValores = [
  'promo5',
  0.05,
  'promo10',
  0.1,
  'promo15',
  0.15,
  'promo20',
  0.20,
  'promo25',
  0.25,
  'promo30',
  0.3,
  'promo35',
  0.35,
  'promo40',
  0.4,
  'promo45',
  0.45,
  'promo50',
  0.5,
  'promo55',
  0.55,
  'promo60',
  0.6,
  'promo65',
  0.65,
  'promo70',
  0.7,
  'promo75',
  0.75,
  'promo80',
  0.8
];
