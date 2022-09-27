
import 'package:flutter/material.dart';

class PriceProductCart extends StatelessWidget {
  const PriceProductCart({
    Key? key,
    required this.price,
  }) : super(key: key);

  final double price;
  @override
  Widget build(BuildContext context) {
    return Text(
      'S/ ${price.toStringAsFixed(2).toString()}',
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Color(0xFF575E67),
      ),
    );
  }
}

