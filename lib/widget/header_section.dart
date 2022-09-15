
import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const BackButton(),
        SizedBox(
          width: width > 700 ? width * 0.15 : width * 0.10,
        ),
        const Text(
          "RESUMEN DE TU ORDEN: ",
          style: TextStyle(
            color: Color(0xFFCC8053),
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
