import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonForAggregator extends StatelessWidget {
  const ButtonForAggregator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            // print("menos");
          },
          child: Container(
            padding: const EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                )
              ],
            ),
            child: const Icon(
              CupertinoIcons.minus,
              size: 18,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: const Text(
            "0",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        GestureDetector(
          onTap: () {
            // print("mas");
          },
          child: Container(
            padding: const EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                )
              ],
            ),
            child: const Icon(
              CupertinoIcons.plus,
              size: 18,
            ),
          ),
        ),
      ],
    );
  }
}
