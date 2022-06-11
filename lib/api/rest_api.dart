import 'dart:convert';

import 'package:http/http.dart' as http;

import '../utils/utils.dart';

Future userLogin(String email, String password) async {
  final response = await http.post(Uri.parse('${Utils.baseUrl}/users/login'),
      headers: {"Accept": "Application/json"},
      body: {'email': email, 'password': password});

  var decodedData = jsonDecode(response.body);
  return decodedData;
}

Future userRegister(String username, String email, String password) async {
  final response = await http.post(Uri.parse('${Utils.baseUrl}/users/register'),
      headers: {"Accept": "Application/json"},
      body: {'name': username, 'email': email, 'password': password});

  var decodedData = jsonDecode(response.body);
  return decodedData;
}
