import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class TitlePayScreen extends StatelessWidget {
  const TitlePayScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BounceInLeft(
      duration: const Duration(
        seconds: 1,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          Text(
            "BOLETA: ",
            style: TextStyle(
              decoration: TextDecoration.underline,
              fontSize: 50,
              color: Color(0xFFCC8053),
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            "FACTURA: ",
            style: TextStyle(
              decoration: TextDecoration.underline,
              fontSize: 50,
              color: Color(0xFFCC8053),
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
