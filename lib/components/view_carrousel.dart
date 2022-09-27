import 'package:flutter/material.dart';

class ViewCarrousel extends StatelessWidget {
  const ViewCarrousel({
    Key? key,
    required this.width,
    required this.path,
  }) : super(key: key);

  final double width;
  final String path;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(15)
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            offset: Offset(2.0,2.0),
            blurRadius: 3.0,
            spreadRadius: 2.0
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.asset(
          width: width * 0.90,
          path,
          fit: BoxFit.cover,
      
        ),
      ),
    );
  }
}
