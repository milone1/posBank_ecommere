import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:posbank_flutter/provider/provider.dart';
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
                            blurRadius: 8),
                      ],
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50.0),
                          child: Image.network(
                            cart[index]['image'].toString(),
                            width: 120, 
                            height: 50
                          ),
                        ),
                        SizedBox(
                          width: 150,
                          child: Text(
                            cart[index]['productName'].toString(),
                            style: const TextStyle(
                                fontSize: 20,
                                color: Color(0xFFCC8053),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          cart[index]['productPrice'].toString(),
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
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    counter.removeOneItem(index);
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
                                    counter.addOneItem(index);
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
                        // ignore: avoid_unnecessary_containers
                        InkWell(
                          onTap: () {
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
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
