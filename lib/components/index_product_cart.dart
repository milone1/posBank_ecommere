import 'package:flutter/material.dart';

class IndexProductCart extends StatelessWidget {
  const IndexProductCart({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Text(
      (index + 1).toString(),
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Color(0xFF575E67),
      ),
    );
  }
}