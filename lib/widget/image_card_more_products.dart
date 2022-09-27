import 'package:flutter/material.dart';

class ImageCardMoreProducts extends StatelessWidget {
  const ImageCardMoreProducts({
    Key? key,
    required this.moreProducts,
    required this.index,
  }) : super(key: key);

  final List moreProducts;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: moreProducts[index]['id'].toString(),
      child: Image.asset(
        moreProducts[index]['images'],
        width: 130,
        height: 90,
      ),
    );
  }
}
