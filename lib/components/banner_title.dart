import 'package:flutter/material.dart';

class BannerTitle extends StatelessWidget {
  const BannerTitle({
    Key? key,
    required this.width,
    required this.size,
    required this.text,
  }) : super(key: key);

  final double width;
  final double size;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: size,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
