// ignore_for_file: file_names
import 'package:flutter/material.dart';

class OtherDetailsDivider extends StatelessWidget {
  const OtherDetailsDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Divider(
        color: Colors.grey.withOpacity(0.2),
        thickness: 0.5,
        indent: 16,
        endIndent: 16,
      ),
    );
  }
}