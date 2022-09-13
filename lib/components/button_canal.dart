import 'package:flutter/material.dart';
import 'package:posbank_flutter/provider/provider.dart';
import 'package:posbank_flutter/widget/widgets.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';
class ButtonCanal extends StatefulWidget {
  const ButtonCanal({super.key});
  @override
  State<ButtonCanal> createState() => _ButtonCanalState();
}
class _ButtonCanalState extends State<ButtonCanal> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _gestureDetector("Para Salon", "ParaSalon", "images/tray.png", context),
        const SizedBox(
          width: 20.0,
        ),
        _gestureDetector(
            "Para Llevar", "ParaLlevar", "images/bug.png", context),
      ],
    );
  }
  Widget _gestureDetector(String title, String value, String img, context) {
    final canal = Provider.of<CanalProvider>(context);
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/products');
        setState(
          () => {canal.setState(value)}
        );
      },
      child: CardsCanal(width: width, img: img, title: title),
    );
  }
}