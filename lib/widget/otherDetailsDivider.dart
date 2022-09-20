import 'package:flutter/material.dart';
class OtherDetailsDivider extends StatefulWidget {
  const OtherDetailsDivider({Key? key}) : super(key: key);

  @override
  _OtherDetailsDividerState createState() => _OtherDetailsDividerState();
}
class _OtherDetailsDividerState extends State<OtherDetailsDivider> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Divider(
        color: Colors.grey.withOpacity(0.2),
        thickness: 0.5,
        indent: 16,
        endIndent: 16,
      ),
    );
  }
}