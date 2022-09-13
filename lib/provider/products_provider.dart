import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductsProvider with ChangeNotifier {
  //* List<model> nombre = [];
  ProductsProvider() {
    getData();
  }

  getData() async {
    var uri = Uri.parse('https://pokeapi.co/api/v2/pokemon/');
    final http.Response response = await http.get(uri);
    final Map<String, dynamic> decodeData = json.decode(response.body);
    // ignore: avoid_print
    print("Results");
    // ignore: avoid_print
    print(decodeData['results']);
    //* nombre = decodeData.results;
    //* notifyListeners();
  }
}
