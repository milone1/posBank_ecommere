// ignore_for_file: file_names
import 'package:flutter/material.dart';
class ReusableWidget extends StatelessWidget {
  final String title, value;
  // ignore: use_key_in_widget_constructors
  const ReusableWidget({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/credit');
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            Text(
              value.toString(),
              style: const TextStyle(
                fontSize: 48,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}