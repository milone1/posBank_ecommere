import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductsProvider with ChangeNotifier {
  ProductsProvider() {
    getDataByCategori();
    getGroup();
  }

  String baseURL = 'http://192.168.3.228:81/api/';
  List<dynamic> products = [];
  List groups = [];
  String codigoGroup = "01";
  String category = "Cocina";

  setCategory(String categorySelected) {
    category = categorySelected;
    notifyListeners();
  }

  setCodigo(String codigoGrupo) {
    codigoGroup = codigoGrupo;
    getDataByCategori();
    notifyListeners();
  }

  getDataByCategori() async {
    var uri = Uri.parse('$baseURL/producto/$codigoGroup');
    final http.Response response = await http.get(uri);
    final decodeData = json.decode(response.body);
    products = decodeData;
    notifyListeners();
  }

  getGroup() async {
    var uri = Uri.parse('$baseURL/Grupo');
    final http.Response response = await http.get(uri);
    final List decodeDataCategory = json.decode(response.body);
    groups = decodeDataCategory;
    notifyListeners();
  }

  methodPost(body) async {
    var url = Uri.parse('$baseURL/pedido');
    var response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: json.encode(body),
    );
    print('Response Status of method POST:  ${response.statusCode}');
    print('Response Status of method POST:  ${response.body}');
  }
}
