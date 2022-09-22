import 'package:flutter/material.dart';

class TitleCardMoreProducts extends StatelessWidget {
  const TitleCardMoreProducts({
    Key? key,
    required this.moreProducts,
    required this.index,
  }) : super(key: key);

  final List moreProducts;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Text(
      moreProducts[index]['title'],
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.bold,
        color: Color(0xFFCC8053),
      ),
    );
  }
}
