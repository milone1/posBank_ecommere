
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReusableWidget extends StatelessWidget {
  final String title, value;
  const ReusableWidget({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/credit');
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            Text(
              value.toString(),
              style: TextStyle(
                fontSize: 50,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}