import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/products_model.dart';

Future<Welcome> getProducts() async {
  const url = 'https://dummyjson.com/products';
  final resp = await http.get(Uri.parse(url));

  if (resp.statusCode == 200) {
    List<dynamic> productsList = json.decode(resp.body)["products"];

    Welcome produtos = Welcome(
      products: productsList.map((productJson) => Product.fromJson(productJson)).toList(),
      total: json.decode(resp.body)["total"],
      skip: json.decode(resp.body)["skip"],
      limit: json.decode(resp.body)["limit"],
    );

    return produtos;
  } else {
    throw Exception("Erro na requisao dos produtos");
  }
}
