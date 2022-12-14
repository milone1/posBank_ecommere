import 'package:flutter/material.dart';

class ImagenBackground extends StatelessWidget {
  const ImagenBackground({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Image.asset(
        'images/restaurant.jpg',
        fit: BoxFit.fill,
      ),
    );
  }
}
