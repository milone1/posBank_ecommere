import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:posbank_flutter/components/products.dart';
import 'package:posbank_flutter/provider/cart_provider.dart';
import 'package:posbank_flutter/screen/cart_screen.dart';
import 'package:posbank_flutter/widget/carrousel.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';
class ProductListScreen extends StatefulWidget {
  const ProductListScreen({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _ProductListScreenState createState() => _ProductListScreenState();
}
class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const ListCarrousel(),
            Consumer<CartProvider>(
              builder: (context, prueba,_) => Center(
                child: Text(
                  prueba.category,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Products(),
            Expanded(
              child: Container(
                width: width,
                height: height * 0.35,
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.grey, width: 1),
                  ),
                ),
                child: BounceInUp(
                  duration: const Duration(seconds: 2),
                  child: const CartScreen(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
