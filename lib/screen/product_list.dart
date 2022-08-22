import 'dart:convert';
import 'dart:typed_data';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:posbank_flutter/components/products.dart';
import 'package:posbank_flutter/db/db_helper.dart';
import 'package:posbank_flutter/model/cart_model.dart';
import 'package:posbank_flutter/provider/cart_provider.dart';
import 'package:posbank_flutter/screen/cart_screen.dart';
import 'package:posbank_flutter/widget/carrousel.dart';
import 'package:provider/provider.dart';

class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  DBHelper? dbHelper = DBHelper();

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
            Products(),
            Expanded(
              child: Container(
                width: width,
                height: height * 0.30,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Colors.grey, 
                      width: 1
                    ),
                  ),
                ),
                child: CartScreen(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
