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
        children: const <Widget>[
          Image(
            fit: BoxFit.contain,
            width: 200,
            height: 70,
            image: AssetImage('images/empty_cart.png'),
          ),
          Text(
            'El carrito esta vacío',
          ),
        ],
      ),
    );
  }
}