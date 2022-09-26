import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:posbank_flutter/provider/provider.dart';
import 'package:posbank_flutter/widget/my_sheet.dart';
import 'package:provider/provider.dart';

class FullCart extends StatefulWidget {
  const FullCart({super.key});

  @override
  State<FullCart> createState() => _FullCartState();
}

class _FullCartState extends State<FullCart> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cartList;
    final counter = Provider.of<CartProvider>(context);
    final cartFunctions = Provider.of<CartProvider>(context);

    return Expanded(
      child: ListView.builder(
        itemCount: cart.length,
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
                        Text(
                          (index + 1).toString(),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF575E67),
                          ),
                        ),
                        Hero(
                          tag: index,
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              image: DecorationImage(
                                  image: NetworkImage(
                                    scale: 1,
                                    // "",
                                    cart[index]['image'].toString(),
                                  ),
                                  fit: BoxFit.contain),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 200,
                          child: Text(
                            cart[index]['productName'].toString().toUpperCase(),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: const TextStyle(
                              fontSize: 20,
                              color: Color(0xFFCC8053),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          '\$${cart[index]['productPrice'].toStringAsFixed(2).toString()}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF575E67),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(5.0),
                          height: 35,
                          width: 100,
                          decoration: BoxDecoration(
                            color: const Color(0xff0099DD),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    if (cart[index]['quantity'] >= 2) {
                                      counter.addOrRemoveItem(index, 'remove');
                                    }
                                  },
                                  child: const Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  cart[index]['quantity'].toString(),
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                                InkWell(
                                  onTap: () {
                                    counter.addOrRemoveItem(index, 'add');
                                  },
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            cartFunctions
                                .deleteElement(cart[index]['id'].toString());
                            Fluttertoast.showToast(
                                msg: "Eliminado Correctamente",
                                toastLength: Toast.LENGTH_SHORT,
                                webPosition: "bottom",
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 14.0);
                          },
                          child: const Icon(
                            Icons.delete,
                            color: Colors.red,
                            size: 35.0,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            mySheet(
                                cart[index]['productName'].toString(),
                                cart[index]['price'].toString(),
                                cart[index]['id'].toString(),
                                cart[index]['idProduct'].toString(),
                                cart[index]['category'].toString(),
                                cart[index]['image'].toString(),
                                cart[index]['properties'] ?? [],
                                context);
                          },
                          child: const Icon(
                            Icons.edit,
                            color: Color(0xff0099DD),
                            size: 35.0,
                          ),
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
