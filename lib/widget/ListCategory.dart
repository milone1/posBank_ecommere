import 'package:flutter/material.dart';
import 'package:posbank_flutter/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class ListCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Provider.of<CartProvider>(context);
    return Container(
        width: 150,
        height: height * 0.50,
        child: ListWheelScrollView(
          physics: FixedExtentScrollPhysics(),
          itemExtent: 100,
          useMagnifier: true,
          magnification: 1.5,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "images/todo.png",
                  width: 50,
                  height: 50,
                ),
                Text(
                  "TODOS",
                  style: TextStyle(
                    fontSize: 10,
                    color: Color(0xFFCC8053),
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "images/iconDrink.png",
                  width: 50,
                  height: 50,
                ),
                Text(
                  "BEBIDAS",
                  style: TextStyle(
                    fontSize: 10,
                    color: Color(0xFFCC8053),
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "images/iconMeet.png",
                  width: 50,
                  height: 50,
                ),
                Text(
                  "Carnes",
                  style: TextStyle(
                    fontSize: 10,
                    color: Color(0xFFCC8053),
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "images/iceCream.png",
                  width: 50,
                  height: 50,
                ),
                Text(
                  "POSTRES",
                  style: TextStyle(
                    fontSize: 10,
                    color: Color(0xFFCC8053),
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "images/iconSoup.png",
                  width: 50,
                  height: 50,
                ),
                Text(
                  "SOPAS",
                  style: TextStyle(
                    fontSize: 10,
                    color: Color(0xFFCC8053),
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "images/iconMar.png",
                  width: 50,
                  height: 50,
                ),
                Text(
                  "MARISCOS",
                  style: TextStyle(
                    fontSize: 10,
                    color: Color(0xFFCC8053),
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      )
    );
  }
}
