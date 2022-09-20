// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:posbank_flutter/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class ReusableWidget extends StatefulWidget {
  final String title, value;
  const ReusableWidget({required this.title, required this.value});

  @override
  State<ReusableWidget> createState() => _ReusableWidgetState();
}

class _ReusableWidgetState extends State<ReusableWidget> {
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
            : Navigator.pushNamed(context, '/credit');
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.title.toString(),
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            Text(
              widget.value.toString(),
              style: const TextStyle(
                fontSize: 48,
                color: Colors.black87,
              ),
            )
          ],
        ),
      ),
    );
  }
}
