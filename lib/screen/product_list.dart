
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:posbank_flutter/components/products.dart';
import 'package:posbank_flutter/provider/cart_provider.dart';
import 'package:posbank_flutter/screen/cart_screen.dart';
import 'package:posbank_flutter/widget/carrousel.dart';
import 'package:provider/provider.dart';
class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}
class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ListCarrousel(),
            Consumer<CartProvider>(
              builder: (context, prueba,_) => Center(
                child: Text(
                  "Categorias",
                  textAlign: TextAlign.center,
                  style: TextStyle(
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
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.grey, width: 1),
                  ),
                ),
                child: BounceInUp(
                  child: CartScreen(),
                  duration: Duration(seconds: 2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
