import 'package:flutter/material.dart';
import 'package:posbank_flutter/provider/provider.dart';
import 'package:posbank_flutter/widget/reusable_widget.dart';

class FooterOptions extends StatelessWidget {
  const FooterOptions({
    Key? key,
    required this.width,
    required this.canal,
  }) : super(key: key);

  final double width;
  final CanalProvider canal;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const BackButton(),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: width > 700 ? width * 0.50 : width * 0.60,
            height: 70.0,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ReusableWidget(
                  title: 'IR AL CARRITO: ',
                  // ignore: prefer_interpolation_to_compose_strings
                  value: r's/' + 'cart.totalPrice.toString()' + "0",
                ),
              ],
            ),
          ),
        ),
        Image.asset(
          canal.state == "ParaSalon" ? 'images/tray.png' : 'images/bug.png',
          width: width * 0.10,
        ),
      ],
    );
  }
}
