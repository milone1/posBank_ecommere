import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
//* components
import 'package:posbank_flutter/components/products.dart';
//* screens
import 'package:posbank_flutter/screen/screens.dart';
//* widgets
import 'package:posbank_flutter/widget/widgets.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2),
      body: SafeArea(
        child: Column(
          children: [
            const ListCarrousel(),
            const Products(),
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
