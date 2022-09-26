import 'package:flutter/material.dart';
import 'package:posbank_flutter/components/button_canal.dart';

class ListOfItems extends StatelessWidget {
  const ListOfItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              "images/infomatica.png",
              width: 100.0,
              height: 100.0,
            )
          ],
        ),
        Image.asset(
          "images/logoRestaurante.png",
          width: 350.0,
          height: 250.0,
        ),
        const SizedBox(
          height: 100.0,
        ),
        //* BANNERS

        //* BANNERS
        const SizedBox(
          height: 100.0,
        ),
        //*
        const ButtonCanal(),
        //*
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
