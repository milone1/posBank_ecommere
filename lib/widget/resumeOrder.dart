import 'package:flutter/material.dart';
import 'package:posbank_flutter/provider/provider.dart';
import 'package:provider/provider.dart';

class ResumeOrder extends StatelessWidget {
  const ResumeOrder({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cartList;
    return Expanded(
      child: ListView.builder(
        itemCount: cart.length,
        itemBuilder: ((context, index) => Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ExpansionTile(
                title: Row(
                  children: [
                    Image.network(
                      cart[index]['image'],
                      width: 50,
                      height: 50,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      cart[index]['productName'],
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                subtitle: Text(
                  '\$${cart[index]['productPrice']}',

                  textAlign: TextAlign.end,
                ),
                children: [
                  Text("ESPECIFICACIONES"),
                ],
              ),
            )
          ),
      ),
    );
  }
}
