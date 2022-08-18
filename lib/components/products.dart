import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:posbank_flutter/db/db_helper.dart';
import 'package:posbank_flutter/model/cart_model.dart';
import 'package:posbank_flutter/provider/cart_provider.dart';
import 'package:posbank_flutter/widget/ListCategory.dart';
import 'package:provider/provider.dart';

class Products extends StatelessWidget {
  List<String> productName = [
    '',
    'Sopa Todu',
    'Sopa Wonton',
    '',
    'Taco',
    'Hamburguer',
    'Vino de Mesa',
    'Vodka',
    'Botella de Vodka',
    'Caridea',
    'Ceviche',
    'Sashimi',
    'Helado',
    'Chocolate',
    'Helado II',
  ];
  List<String> productUnit = [
    "s/15.50",
    "s/28.50",
    "s/25.50",
    "s/22.50",
    "s/18.50",
    "s/11.50",
    "s/22.50",
    "s/18.50",
    "s/11.50",
    "s/22.50",
    "s/18.50",
    "s/11.50",
    "s/22.50",
    "s/18.50",
    "s/11.50",
    "s/22.50",
    "s/18.50",
    "s/11.50",
  ];
  List<int> productPrice = [
    12,
    25,
    24,
    20,
    25,
    24,
    20,
    21,
    14,
    20,
    21,
    14,
    20,
    21,
    14,
    20,
    21,
    14
  ];
  List<String> category = [
    '1',
    '1',
    '1',
    '2',
    '2',
    '2',
    '3',
    '3',
    '3',
    '4',
    '4',
    '4',
    '5',
    '5',
    '5',
    '6',
    '6',
    '6',
  ];

  List<String> productImage = [
    'images/soup.png',
    'images/Todu.png',
    'images/Wonton.png',
    'images/pizza.png',
    'images/taco.png',
    'images/hamburguer.png',
    'images/vinoMesa.png',
    'images/vodka.png',
    'images/vodkaRojo.png',
    'images/caridea.png',
    'images/ceviche.png',
    'images/sashimi.png',
    'images/Helado.png',
    'images/chocolate.png',
    'images/iceCream.png',
  ];

  DBHelper? dbHelper = DBHelper();
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Row(children: [
      LimitedBox(maxWidth: 250, child: ListCategory()),
      Expanded(
          child: Container(
        margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
        child: GridView.count(
          crossAxisCount: 2,
          primary: false,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 15.0,
          childAspectRatio: 0.8,
          children: <Widget>[
            _buildCard(
                "Arroz Chaufa", " s/ 21.50", "images/bacon.png", context),
            _buildCard(
                "Filete de Res", " s/ 18.50", "images/fileteRes.png", context),
            _buildCard("Tocino", " s/ 14.50", 'images/tocino.png', context),
            _buildCard("Sopa Ramen", " s/ 12.50", 'images/soup.png', context),
            _buildCard("Sopa Todu", " s/ 11.50", 'images/Todu.png', context),
            _buildCard("Pizza", " s/ 22.50", 'images/pizza.png', context),
            _buildCard("Taco", " s/ 12.50", 'images/taco.png', context),
            _buildCard(
                "Hamburguer", " s/ 14.50", 'images/hamburguer.png', context),
            _buildCard(
                "Vino de Mesa", " s/ 11.50", 'images/vinoMesa.png', context),
            _buildCard("Vodka", " s/ 10.50", 'images/vodkaRojo.png', context),
            _buildCard("Sashimi", " s/ 13.50", 'images/sashimi.png', context),
          ],
        ),
      )),
    ]);
  }

  Widget _buildCard(String name, String price, String imgPath, context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/credit');
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 3.0,
                  blurRadius: 5.0),
            ],
            color: Colors.white,
          ),
          child: Column(
            children: [
              Hero(
                  tag: imgPath,
                  child: Container(
                    height: 75.0,
                    width: 72.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(imgPath), fit: BoxFit.contain)),
                  )),
              SizedBox(
                height: 7.0,
              ),
              Text(
                name,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Color(
                    (0xFFCC8053),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color(0xFFEBEBEB),
                  ),
                  height: 20.0,
                  child: Text(
                    price,
                    style: TextStyle(color: Color(0xFF575E67), fontSize: 20.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
