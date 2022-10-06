import 'package:flutter/material.dart';
import 'package:posbank_flutter/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class ButtonAddOrRemove extends StatelessWidget {
  const ButtonAddOrRemove({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Container(
      margin: const EdgeInsets.all(5.0),
      height: 35,
      width: 100,
      decoration: BoxDecoration(
        color: const Color(0xff0099DD),
        borderRadius: BorderRadius.circular(7),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.4),
            offset: const Offset(3, 3),
            spreadRadius: 8,
            blurRadius: 8,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                if (cart.cartList[index]['quantity'] >= 2) {
                  cart.addOrRemoveItem(index, 'remove');
                }
              },
              child: const Icon(
                Icons.remove,
                color: Colors.white,
              ),
            ),
            Text(
              cart.cartList[index]['quantity'].toString(),
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            InkWell(
              onTap: () {
                cart.addOrRemoveItem(index, 'add');
              },
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
