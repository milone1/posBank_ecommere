import 'package:flutter/material.dart';
//* widgets
import 'package:posbank_flutter/widget/widgets.dart';
//* providers
import 'package:posbank_flutter/provider/provider.dart';
import 'package:provider/provider.dart';
class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);
  @override
  _CartScreenState createState() => _CartScreenState();
}
class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final canal = Provider.of<CanalProvider>(context);
    double width = MediaQuery.of(context).size.width;
    final cart = Provider.of<CartProvider?>(context);
    return Padding(
      padding: EdgeInsets.all(1.0),
      child: Column(
        children: [
          cart!.cartList.length == 0
              ? Expanded(child: EmptyCart())
              : FullCart(),
          FooterOptions(width: width, canal: canal),
        ],
      ),
    );
  }
}