import 'package:flutter/material.dart';
import 'package:posbank_flutter/provider/provider.dart';
import 'package:posbank_flutter/widget/widgets.dart';
import 'package:provider/provider.dart';

class FooterOptions extends StatefulWidget {
  const FooterOptions({
    Key? key,
    required this.width,
    required this.canal,
  }) : super(key: key);

  final double width;
  final CanalProvider canal;

  @override
  State<FooterOptions> createState() => _FooterOptionsState();
}

class _FooterOptionsState extends State<FooterOptions> {
  @override
  Widget build(BuildContext context) {
    final variable =
      Provider.of<CartProvider>(context);

    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey, width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BackButtonIos(),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              width: widget.width > 700
                  ? widget.width * 0.70
                  : widget.width * 0.70,
              height: 70.0,
              decoration: BoxDecoration(
                  color: Color(0xff0099DD),
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(.8),
                        blurRadius: 10.0,
                        spreadRadius: 0.5,
                        offset: Offset(5.0, 5.0))
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ReusableWidget(
                    title: 'IR AL CARRITO: ',
                    value: '\$ ${variable.getPriceTotal()}',
                    // value: '0',
                  ),
                ],
              ),
            ),
          ),
          CanalImage(canal: widget.canal, width: widget.width),
        ],
      ),
    );
  }
}
