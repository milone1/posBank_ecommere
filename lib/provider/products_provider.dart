// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductsProvider with ChangeNotifier {
  ProductsProvider() {
    getData();
    getGroup();
  }

  String baseURL = 'http://192.168.3.228:81/api/';
  List<dynamic> products = [];
  List groups = [
    {"CodigoGrupo": "", "Descripcion": "Todos", "Activo": true},
  ];


  getData() async {
    var uri = Uri.parse('$baseURL/producto');
    final http.Response response = await http.get(uri);
    final decodeData = json.decode(response.body);
    products = decodeData;
    notifyListeners();
  }

  getGroup() async {
    var uri = Uri.parse('$baseURL/Grupo');
    final http.Response response = await http.get(uri);
    final List decodeDataCategory = json.decode(response.body);
    for (var element in decodeDataCategory) {
      groups.add(element);
    }
    notifyListeners();
  }

  methodPost(body) async {
    var url = Uri.parse('$baseURL/pedido');
    var response = await http.post(url,
      headers: {"Content-Type": "application/json"},
      body: json.encode(body),
    );
    print('Response Status of method POST:  ${response.statusCode}');
    print('Response Status of method POST:  ${response.body}');
  }
}
