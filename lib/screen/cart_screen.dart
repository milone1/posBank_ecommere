import 'package:flutter/material.dart';
//* widgets
import 'package:posbank_flutter/widget/widgets.dart';
//* providers
import 'package:posbank_flutter/provider/provider.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final canal = Provider.of<CanalProvider>(context);
    double width = MediaQuery.of(context).size.width;
    final cart = Provider.of<CartProvider?>(context);
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Column(
        children: [
          cart!.cartList.isEmpty
              ? const Expanded(child: EmptyCart())
              : const FullCart(),
          FooterOptions(width: width, canal: canal),
        ],
      ),
    );
  }
}
