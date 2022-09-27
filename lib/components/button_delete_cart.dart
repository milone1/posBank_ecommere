
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:posbank_flutter/provider/cart_provider.dart';

class ButtonDeleteCart extends StatelessWidget {
  const ButtonDeleteCart({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return InkWell(
      onTap: () {
        cart.deleteElement(cart.cartList[index]['id'].toString());
        Fluttertoast.showToast(
            msg: "Eliminado Correctamente",
            toastLength: Toast.LENGTH_SHORT,
            webPosition: "bottom",
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 14.0);
      },
      child: const Icon(
        Icons.delete,
        color: Colors.red,
        size: 35.0,
      ),
    );
  }
}