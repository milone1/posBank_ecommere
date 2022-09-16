// ignore_for_file: depend_on_referenced_packages, avoid_print, use_key_in_widget_constructors
import 'package:flutter/material.dart';
//* widgets
import 'package:posbank_flutter/widget/widgets.dart';
//* providers
import 'package:provider/provider.dart';
import 'package:posbank_flutter/provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // DBHelper? dbHelper = DBHelper();
  @override
  Widget build(BuildContext context) {
    final canal = Provider.of<CanalProvider>(context);
    double width = MediaQuery.of(context).size.width;
    final cart = Provider.of<CartProvider>(context).cartList;
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Column(
        children: [
          // ignore: prefer_is_empty
          cart.length == 0
              ? const Expanded(child: EmptyCart())
              : const FullCart(),
          FooterOptions(width: width, canal: canal),
        ],
      ),
    );
  }
}
