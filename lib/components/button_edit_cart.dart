
import 'package:flutter/material.dart';
import 'package:posbank_flutter/provider/cart_provider.dart';
import 'package:posbank_flutter/widget/my_sheet.dart';
import 'package:provider/provider.dart';

class ButtonEditCart extends StatelessWidget {
  const ButtonEditCart({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return InkWell(
      onTap: () {
        mySheet(
            cart.cartList[index]['productName'].toString(),
            cart.cartList[index]['price'].toString(),
            cart.cartList[index]['id'].toString(),
            cart.cartList[index]['idProduct'].toString(),
            cart.cartList[index]['category'].toString(),
            cart.cartList[index]['image'].toString(),
            cart.cartList[index]['properties'] ?? [],
            context);
      },
      child: const Icon(
        Icons.edit,
        color: Color(0xff0099DD),
        size: 35.0,
      ),
    );
  }
}