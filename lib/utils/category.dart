import 'package:flutter/material.dart';

class Categories {
  late final int id;
  late final String title;
  late final String value;
  late final String imagen;

  Categories(this.id, this.title, this.value, this.imagen);
}

List<Categories> categoriesList = [
  Categories(1, "TODO", '', 'images/todo.png'),
  Categories(2, "BEBIDAS", 'BEBIDA', 'images/aguaDeMesa.png'),
  Categories(3, "COMIDAS", 'COMIDAS', 'images/atun.png'),
  Categories(4, "CAFES", 'CAFES', 'images/cafe.png'),
  Categories(5, "MARISCOS", 'MARISCOS', 'images/iconMar.png'),
  Categories(6, "SOPAS", 'SOPAS', 'images/iconSoup.png'),
  Categories(7, "POSTRES", 'POSTRES', 'images/iceCream.png'),
];
