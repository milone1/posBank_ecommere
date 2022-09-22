import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
//* components
import 'package:posbank_flutter/components/products.dart';
import 'package:posbank_flutter/provider/products_provider.dart';
//* screens
import 'package:posbank_flutter/screen/screens.dart';
//* widgets
import 'package:posbank_flutter/widget/widgets.dart';
import 'package:provider/provider.dart';
class ProductListScreen extends StatefulWidget {
  const ProductListScreen({Key? key}) : super(key: key);
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}
class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final category = Provider.of<ProductsProvider>(context).category;
    return Scaffold(
      backgroundColor:  Color(0xffF2F2F2),
      body: SafeArea(
        child: Column(
          children: [
            ListCarrousel(),
            Center(
              child: Text(
                category.toString().toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  color: Color(0xffFF9933),
                  fontWeight: FontWeight.bold,
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
                  duration: Duration(seconds: 2),
                  child: CartScreen(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
