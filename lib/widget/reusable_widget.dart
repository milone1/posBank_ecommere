import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:posbank_flutter/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class ReusableWidget extends StatelessWidget {
  const ReusableWidget({Key? key, required this.title, required this.value})
      : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return InkWell(
      onTap: () {
        cart.getPriceTotal() == 0
            ? Fluttertoast.showToast(
                msg: "Ingrese Productos!",
                toastLength: Toast.LENGTH_SHORT,
                webPosition: "bottom",
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 14.0,
              )
            : Navigator.pushNamed(context, 'pay');
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title.toString(),
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            Text(
              value.toString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 48,
                color: Color(0xff394C5D),
              ),
            )
          ],
        ),
      ),
    );
  }
}
