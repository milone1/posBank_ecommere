import 'package:flutter/material.dart';
import 'package:posbank_flutter/provider/provider.dart';
import 'package:posbank_flutter/widget/widgets.dart';
import 'package:provider/provider.dart';

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
    final cart = Provider.of<CartProvider>(context);
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey, width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const BackButtonIos(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: width > 700 ? width * 0.70 : width * 0.70,
              height: 70.0,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(.8),
                        blurRadius: 10.0,
                        spreadRadius: 0.5,
                        offset: const Offset(5.0, 5.0))
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  ReusableWidget(
                    title: 'IR AL CARRITO: ',
                    value: '\$${cart.getPriceTotal()}',
                    // value: "0",
                  ),
                ],
              ),
            ),
          ),
          CanalImage(canal: canal, width: width),
        ],
      ),
    );
  }
}
