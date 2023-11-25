import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/user_model.dart';

Future<UserLogin> getUserLogin() async {
  const url = 'https://dummyjson.com/users';
  final resp = await http.get(Uri.parse(url));

  if (resp.statusCode == 200) {
    List<dynamic> usersList = json.decode(resp.body)["users"];

    UserLogin userLogin = UserLogin(
      users: usersList.map((userJson) => User.fromJson(userJson)).toList(),
      total: json.decode(resp.body)["total"],
      skip: json.decode(resp.body)["skip"],
      limit: json.decode(resp.body)["limit"],
    );

    return userLogin;
  } else {
    throw Exception("Erro na API");
  }
}
