
import 'package:flutter/material.dart';

class CardsCanal extends StatelessWidget {
  const CardsCanal({
    Key? key,
    required this.width, required this.img, required this.title,
  }) : super(key: key);

  final double width;
  final String img;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.4,
      padding: EdgeInsets.all(width * 0.02),
      decoration: BoxDecoration(
          color: Colors.purple.shade300,
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.4),
              offset: const Offset(3, 3),
              spreadRadius: 8,
              blurRadius: 8,
            )
          ]),
      child: Center(
        child: Column(
          children: [
            Image.asset(
              img,
              width: 100.0,
              height: 100.0,
            ),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: width * 0.05,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
