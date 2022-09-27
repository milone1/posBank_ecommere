import 'package:flutter/material.dart';

class NameProductCart extends StatelessWidget {
  const NameProductCart({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Text(
        name.toString().toUpperCase(),
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        style: const TextStyle(
          fontSize: 20,
          color: Color(0xFFCC8053),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
