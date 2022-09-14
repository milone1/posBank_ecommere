import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:posbank_flutter/model/cart_model.dart';

import 'package:provider/provider.dart';
import 'package:posbank_flutter/provider/provider.dart';

class AddToCart extends StatelessWidget {
  AddToCart({
    Key? key,
    required this.width,
    required this.name,
    required this.price,
    required this.id,
    required this.idProduct,
    required this.category,
    required this.imgPath,
  }) : super(key: key);

  final double width;
  final String id;
  final String name;
  final String price;
  final String idProduct;
  final String category;
  final String imgPath;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cart;
    final providerCart = Provider.of<CartProvider>(context);
    return Container(
      width: width * 0.35,
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 5,
            blurRadius: 7,
          ),
        ],
        color: Colors.blue,
      ),
      child: Center(
        child: InkWell(
          onTap: () {
            Fluttertoast.showToast(
                msg: "Agregado Correctamente",
                toastLength: Toast.LENGTH_SHORT,
                webPosition: "bottom",
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 14.0);
            cart.add(
              Cart(
                id: int.parse(id), 
                productId: id, 
                productName: name, 
                initialPrice: double.parse(price), 
                productPrice: double.parse(price), 
                quantity: 1, 
                unitTag: id, 
                image: "", 
                category: ""
              )
            );
            providerCart.addTotalPrice(
              double.parse(price.toString()
              ),
            );
            providerCart.addCounter();
            Navigator.pop(context);
          },
          child: const Text(
            "+ AGREGAR AL CARRITO",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
