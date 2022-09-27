
import 'package:flutter/material.dart';

class Images extends StatelessWidget {
  const Images({
    Key? key,
    required this.width,
    required this.height,
    required this.path,
  }) : super(key: key);

  final double width;
  final double height;
  final String path;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      width: width,
      height: height,
    );
  }
}
