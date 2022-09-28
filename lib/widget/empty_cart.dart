import 'package:flutter/material.dart';
class EmptyCart extends StatelessWidget {
  const EmptyCart({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          Image.asset(
            color: Colors.black87,
            "images/empty_cart.png",
            width: 500,
            height: 160,
          ),
          const Text(
            'El carrito esta vacío',
            style: TextStyle(
              color: Color(0xffFF9933),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
