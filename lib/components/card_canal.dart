import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:posbank_flutter/provider/canal_provider.dart';

class CardsCanal extends StatelessWidget {
  const CardsCanal({
    Key? key,
    required this.width,
    required this.img,
    required this.title,
    required this.value,
  }) : super(key: key);

  final double width;
  final String img;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    final canal = Provider.of<CanalProvider>(context);
    return GestureDetector(
      onTap: () {
        canal.setStates(value);
        Navigator.pushNamed(context, 'products');
      },
      child: Container(
        width: width * 0.4,
        padding: EdgeInsets.all(width * 0.02),
        decoration: BoxDecoration(
            color: const Color(0xff0099DD),
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.4),
                offset: const Offset(3, 3),
                spreadRadius: 8,
                blurRadius: 8,
              )
            ]),
        child: Center(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.4),
                        offset: const Offset(3, 3),
                        spreadRadius: 8,
                        blurRadius: 8,
                      )
                    ]),
                child: Image.asset(
                  img,
                  width: 100.0,
                  height: 100.0,
                ),
              ),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: width * 0.05,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
