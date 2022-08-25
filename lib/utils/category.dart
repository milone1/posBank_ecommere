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
  Categories(2, "BEBIDAS", 'bebidas', 'images/aguaDeMesa.png'),
  Categories(3, "COMIDAS", 'comidas', 'images/atun.png'),
  Categories(4, "CAFES", 'cafes', 'images/cafe.png'),
  Categories(5, "MARISCOS", 'mariscos', 'images/iconMar.png'),
  Categories(6, "SOPAS", 'sopas', 'images/iconSoup.png'),
  Categories(7, "POSTRES", 'postres', 'images/iceCream.png'),
];
