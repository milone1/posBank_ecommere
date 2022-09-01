import 'package:flutter/material.dart';

class Categories {
  late final int id;
  late final String title;
  late final String value;
  late final String imagen;

  Categories(this.id, this.title, this.value, this.imagen);
}

List<Categories> categoriesList = [
  Categories(1, "TODO",      '', 'images/todo.png'),
  Categories(3, "COMIDAS",   'comida', 'images/atun.png'),
  Categories(4, "CARNES",    'carne', 'images/carne.png'),
  Categories(2, "BEBIDAS",   'bebida', 'images/aguaDeMesa.png'),
  Categories(5, "MARISCOS",  'marisco', 'images/iconMar.png'),
  Categories(6, "SOPAS",     'sopa', 'images/iconSoup.png'),
  Categories(7, "POSTRES",   'postre', 'images/iceCream.png'),
  Categories(8, "ALCOHOLES", 'alcohol', 'images/iconDrink.png'),
  Categories(9, "PIZZAS",    'pizza', 'images/italian.png'),
];
