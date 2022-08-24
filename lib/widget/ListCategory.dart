import 'package:flutter/material.dart';
import 'package:posbank_flutter/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class ListCategory extends StatelessWidget {
  List<Map> categories = [
    {'name': 'TODOS', 'iconPath': 'images/todo.png', 'category': 'all'},
    {'name': 'CARNES', 'iconPath': 'images/iconMeet.png', 'category': '1'},
    {'name': 'BEBIDAS', 'iconPath': 'images/iconDrink.png', 'category': '2'},
    {'name': 'SOPAS', 'iconPath': 'images/iconSoup.png', 'category': '4'},
    {'name': 'POSTRES', 'iconPath': 'images/iconSweet.png', 'category': '5'},
    {'name': 'TODOS', 'iconPath': 'images/todo.png', 'category': 'all'},
    {'name': 'CARNES', 'iconPath': 'images/iconMeet.png', 'category': '1'},
    {'name': 'BEBIDAS', 'iconPath': 'images/iconDrink.png', 'category': '2'},
    {'name': 'SOPAS', 'iconPath': 'images/iconSoup.png', 'category': '4'},
    {'name': 'POSTRES', 'iconPath': 'images/iconSweet.png', 'category': '5'},
    {'name': 'TODOS', 'iconPath': 'images/todo.png', 'category': 'all'},
    {'name': 'CARNES', 'iconPath': 'images/iconMeet.png', 'category': '1'},
    {'name': 'BEBIDAS', 'iconPath': 'images/iconDrink.png', 'category': '2'},
    {'name': 'SOPAS', 'iconPath': 'images/iconSoup.png', 'category': '4'},
    {'name': 'POSTRES', 'iconPath': 'images/iconSweet.png', 'category': '5'},
    {'name': 'TODOS', 'iconPath': 'images/todo.png', 'category': 'all'},
    {'name': 'CARNES', 'iconPath': 'images/iconMeet.png', 'category': '1'},
    {'name': 'BEBIDAS', 'iconPath': 'images/iconDrink.png', 'category': '2'},
    {'name': 'SOPAS', 'iconPath': 'images/iconSoup.png', 'category': '4'},
    {'name': 'POSTRES', 'iconPath': 'images/iconSweet.png', 'category': '5'},
    ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Provider.of<CartProvider>(context);
    return Container(
      width: 150,
      height: 720,
      child: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black
              ),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 3.0,
                    blurRadius: 7.0
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
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
                      height: 50,
                    ),
                  ),
                  Text(
                    categories[index]["name"],
                    style: TextStyle(
                        color: Color(0xFFCC8053),
                        fontSize: 15,
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
