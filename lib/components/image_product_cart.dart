
import 'package:flutter/material.dart';
import 'package:posbank_flutter/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class ImageProductCart extends StatelessWidget {
  const ImageProductCart({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Hero(
      tag: index,
      child: Container(
        width: 90,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          image: DecorationImage(
              image: NetworkImage(
                scale: 1,
                cart.cartList[index]['image'].toString(),
              ),
              fit: BoxFit.fill),
        ),
      ),
    );
  }
}