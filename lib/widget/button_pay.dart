import 'package:flutter/material.dart';
import 'package:posbank_flutter/provider/provider.dart';

import 'package:provider/provider.dart';

class ButtonPay extends StatelessWidget {
  const ButtonPay({
    Key? key,
    required this.cart,
  }) : super(key: key);

  final CartProvider cart;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Container(
      alignment: Alignment.center,
      height: 50,
      decoration: BoxDecoration(
        color: const Color(0xff0099DD),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(.8),
              blurRadius: 10.0,
              spreadRadius: 0.5,
              offset: const Offset(5.0, 5.0)),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        'Total:      \$${cart.getPriceTotal().toStringAsFixed(2)}',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
