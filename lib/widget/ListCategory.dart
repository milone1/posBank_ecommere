import 'package:flutter/material.dart';
import 'package:posbank_flutter/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class ListCategory extends StatelessWidget {
  List<Map> categories = [
    {'name': 'Todos', 'iconPath': 'images/todo.png', 'category': 'all'},
    {'name': 'Carnes', 'iconPath': 'images/iconMeet.png', 'category': '1'},
    {'name': 'Bebidas', 'iconPath': 'images/iconDrink.png', 'category': '2'},
    {'name': 'Sopas', 'iconPath': 'images/iconSoup.png', 'category': '4'},
    {'name': 'Postres', 'iconPath': 'images/iconSweet.png', 'category': '5'},
    {'name': 'Todos', 'iconPath': 'images/todo.png', 'category': 'all'},
    {'name': 'Carnes', 'iconPath': 'images/iconMeet.png', 'category': '1'},
    {'name': 'Bebidas', 'iconPath': 'images/iconDrink.png', 'category': '2'},
    {'name': 'Sopas', 'iconPath': 'images/iconSoup.png', 'category': '4'},
    {'name': 'Postres', 'iconPath': 'images/iconSweet.png', 'category': '5'},
    {'name': 'Todos', 'iconPath': 'images/todo.png', 'category': 'all'},
    {'name': 'Carnes', 'iconPath': 'images/iconMeet.png', 'category': '1'},
    {'name': 'Bebidas', 'iconPath': 'images/iconDrink.png', 'category': '2'},
    {'name': 'Sopas', 'iconPath': 'images/iconSoup.png', 'category': '4'},
    {'name': 'Postres', 'iconPath': 'images/iconSweet.png', 'category': '5'},
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Provider.of<CartProvider>(context);
    return Container(
      width: 150,
      height: 650,
      child: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 3.0,
                    blurRadius: 5.0),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: Colors.black),
            ),
            child: InkWell(
              onTap: () {
                print(categories[index]['category']);
              },
              child: Column(
                children: [
                  Container(
                    child: Image.asset(
                      categories[index]['iconPath'],
                      width: 50,
                      height: 30,
                    ),
                  ),
                  Text(
                    categories[index]["name"],
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
