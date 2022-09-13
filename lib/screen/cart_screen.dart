// ignore_for_file: depend_on_referenced_packages, avoid_print, use_key_in_widget_constructors
import 'package:flutter/material.dart';
//* model
import 'package:posbank_flutter/model/cart_model.dart';
import 'package:posbank_flutter/widget/delete_cart.dart';
//* widgets
import 'package:posbank_flutter/widget/widgets.dart';
//* providers
import 'package:posbank_flutter/provider/provider.dart';
import 'package:provider/provider.dart';

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
    final cart = Provider.of<CartProvider>(context).cart;
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Column(
        children: [
          FutureBuilder(
            // future: cart.getData(),
            builder: (context, AsyncSnapshot<List<Cart>> snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.isEmpty) {
                  return const EmptyCart();
                } else {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return DeleteCart(
                          nameofproduct: snapshot.data![index].productName,
                          imagen: snapshot.data![index].image,
                          price: snapshot.data![index].productPrice,
                        );
                      },
                    ),
                  );
                }
              }
              return const CircularCharger();
            },
          ),
          FooterOptions(width: width, canal: canal),
        ],
      ),
    );
  }
}
