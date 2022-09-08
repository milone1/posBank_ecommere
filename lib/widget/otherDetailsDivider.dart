// ignore_for_file: file_names
import 'package:flutter/material.dart';
class OtherDetailsDivider extends StatefulWidget {
  const OtherDetailsDivider({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _OtherDetailsDividerState createState() => _OtherDetailsDividerState();
}
class _OtherDetailsDividerState extends State<OtherDetailsDivider> {
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