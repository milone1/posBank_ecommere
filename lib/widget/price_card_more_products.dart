
import 'package:flutter/material.dart';

class PriceCardMoreProducts extends StatelessWidget {
  const PriceCardMoreProducts({
    Key? key,
    required this.moreProducts,
    required this.index,
  }) : super(key: key);

  final List moreProducts;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 6,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(
          'S/ ${moreProducts[index]['price'].toStringAsFixed(2)}',
          style: const TextStyle(
            color: Color(0xFF575E67),
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
