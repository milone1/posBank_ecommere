import 'package:flutter/material.dart';

class CategoryProvider with ChangeNotifier{
  String codigoGroup = '';
  String category = "Todos";

  setCategory(String categorySelected) {
    category = categorySelected;
    notifyListeners();
  }

  setCodigo(String codigoGrupo) {
    codigoGroup = codigoGrupo;
    notifyListeners();
  }
}
