import 'package:flutter/material.dart';
import 'package:posbank_flutter/buttons/button_add_remove.dart';
import 'package:posbank_flutter/buttons/button_delete_cart.dart';
import 'package:posbank_flutter/components/image_product_cart.dart';
import 'package:posbank_flutter/components/index_product_cart.dart';
import 'package:posbank_flutter/components/name_product_cart.dart';
import 'package:posbank_flutter/components/price_product_cart.dart';
import 'package:posbank_flutter/provider/provider.dart';
import 'package:posbank_flutter/buttons/button_edit_cart.dart';
import 'package:provider/provider.dart';

class FullCart extends StatelessWidget {
  const FullCart({super.key});
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Expanded(
      child: ListView.builder(
        itemCount: cart.cartList.length,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 6,
                          blurRadius: 8,
                        ),
                      ],
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IndexProductCart(index: index),
                        ImageProductCart(index: index,),
                        NameProductCart(
                          name: cart.cartList[index]['productName'],
                        ),
                        PriceProductCart(
                          price: cart.cartList[index]['productPrice'],
                        ),
                        ButtonAddOrRemove(
                          index: index,
                        ),
                        ButtonDeleteCart(index: index),
                        ButtonEditCart(
                          index: index,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
