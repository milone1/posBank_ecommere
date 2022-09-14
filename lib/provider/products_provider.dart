import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductsProvider with ChangeNotifier {
  String baseURL = 'http://192.168.3.228:81/api/';
  List products = [];
  List groups = [];
  ProductsProvider() {
    getData();
    getGroup();
  }

  getData() async {
    var uri = Uri.parse('$baseURL/producto');
    final http.Response response = await http.get(uri);
    final List decodeData = json.decode(response.body);
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
}
