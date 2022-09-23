import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:posbank_flutter/components/button_canal.dart';

class ListOfItems extends StatelessWidget {
  const ListOfItems({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

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
        SizedBox(
          height: 100.0,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          width: width,
          height: height * 0.30,
          child: Image.asset(
            "images/bannerSignIn.png",
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          height: 100.0,
        ),
        //*
        ButtonCanal(),
        //*
        SizedBox(
          height: 150.0,
        ),
        //* line of copyrigth
        Text(
          "© Copyrigth 2022 by Infomatica",
          style: TextStyle(
              color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
