import 'package:flutter/material.dart';

class CategoryProvider with ChangeNotifier{
  String category = "";
  
  void setCategory(String categorySelected) {
    category = categorySelected;
  notifyListeners();
  }
}