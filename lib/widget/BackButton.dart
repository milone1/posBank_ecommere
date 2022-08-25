import 'package:flutter/material.dart';
class BackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        )
      ),
      width: 150,
      height: 150,
      child: InkWell(
        child: Image.asset(
          "images/back.png",
          height: 150,
          width: 150,
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
