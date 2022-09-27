import 'package:flutter/material.dart';
import 'package:posbank_flutter/components/card_canal.dart';

class CanalState extends StatelessWidget {
  const CanalState({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 0.15,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CardsCanal(
            img: 'images/tray.png', 
            title: 'Para Salon',
            value: 'ParaSalon', 
            width: width,
          ),
          SizedBox(
            width: width * 0.10,
          ),
          CardsCanal(
            img: 'images/bug.png', 
            title: 'Para Llevar', 
            value: 'ParaLlevar', 
            width: width,
          ),
        ],
      ),
    );
  }
}
