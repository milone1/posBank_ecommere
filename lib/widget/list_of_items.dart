import 'package:flutter/material.dart';
import 'package:posbank_flutter/components/button_canal.dart';

class ListOfItems extends StatelessWidget {
  const ListOfItems({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Image.asset(
              "images/infomatica.png",
              width: 100.0,
              height: 100.0,
            )
          ],
        ),
        SizedBox(
          height: height * 0.1,
        ),
        const SizedBox(
          height: 200.0,
        ),
        Image.asset(
          "images/logoRestaurante.png",
          width: 350.0,
          height: 250.0,
        ),
        const SizedBox(
          height: 200.0,
        ),
        const ButtonCanal(),
        const SizedBox(
          height: 150.0,
        ),
        //* line of copyrigth
        const Text(
          "© Copyrigth 2022 by Infomatica",
          style: TextStyle(
              color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}