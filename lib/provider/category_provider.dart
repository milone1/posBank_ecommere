import 'package:flutter/material.dart';

class CategoryProvider with ChangeNotifier{
  String category = "CARTA";
  
  void setCategory(String categorySelected) {
    category = categorySelected;
  notifyListeners();
  }
}