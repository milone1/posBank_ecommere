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
                            blurRadius: 8),
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
                              borderRadius: BorderRadius.circular(100.0),
                              image: DecorationImage(
                                  image: NetworkImage(
                                    cart[index]['image'],
                                  ),
                                  fit: BoxFit.contain),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 200,
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            cart[index]['productName'].toString().toUpperCase(),
                            style: const TextStyle(
                                fontSize: 20,
                                color: Color(0xFFCC8053),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          '\$${cart[index]['productPrice']}.00',
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
                                    if (cart[index]['quantity'] >= 2) {
                                      counter.removeOneItem(index);
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
                                    counter.addOneItem(index);
                                    setState(() {});
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
                            cartFunctions
                                .deleteElement(cart[index]['id'].toString());
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
