// ignore_for_file: file_names
import 'package:flutter/material.dart';
class BackButton extends StatelessWidget {
  const BackButton({Key? key}) : super(key: key);
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
