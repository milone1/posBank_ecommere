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
    double height = MediaQuery.of(context).size.height;
    final cart = Provider.of<CartProvider>(context).cart;
    print('cart');
    print(cart.length > 0 ? 'si': 'no');
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.length,
              itemBuilder: (_, index) => 
                cart.length > 0 ? Text(cart[index]['id']) : const EmptyCart()  
            ),
          ),
          // child: ListView.builder(
          //   itemBuilder: (BuildContext context, int index) =>
          //   DeleteCart(
          //     nameofproduct: cart[index].productName,
          //     imagen: cart[index].image,
          //     price: cart[index].productPrice,
          //   ),

          //   // future: cart.getData(),
          //   // builder: (context, AsyncSnapshot<List<dynamic>> cart) {
          //   //   if (cart.hasData) {
          //   //       // return const EmptyCart();
          //   //       return Expanded(
          //   //         child: ListView.builder(
          //   //           itemCount: cart.data?.length
          //   //           itemBuilder: (context, index) {
          //   //             return DeleteCart(
          //   //               nameofproduct: cart[index].productName,
          //   //               imagen: cart[index].image,
          //   //               price: cart[index].productPrice,
          //   //             );
          //   //           },
          //   //         ),
          //   //       );

          //   //   }
          //   //   return const CircularCharger();
          //   // },
          // ),
          FooterOptions(width: width, canal: canal),
        ],
      ),
    );
  }
}
