// ignore_for_file: depend_on_referenced_packages, avoid_print, use_key_in_widget_constructors

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:posbank_flutter/db/db_helper.dart';
import 'package:posbank_flutter/model/cart_model.dart';
import 'package:posbank_flutter/provider/cart_provider.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  DBHelper? dbHelper = DBHelper();

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    double width = MediaQuery.of(context).size.width;
    final prueba = Provider.of<CartProvider>(context);
    _deleteProduct(id, price) async {
      await dbHelper!.delete(id);
      cart.removerCounter();
      cart.removeTotalPrice(
        double.parse(price),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Column(
        children: [
          FutureBuilder(
            future: cart.getData(),
            builder: (context, AsyncSnapshot<List<Cart>> snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.isEmpty) {
                  if(width > 700) {
                    return Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        const Image(
                          fit: BoxFit.contain,
                          width: 200,
                          height: 160,
                          image: AssetImage('images/empty_cart.png'),
                        ),
                        Text('El carrito esta vacío',
                            style: Theme.of(context).textTheme.headlineSmall),
                      ],
                    ),
                  );
                  } else {
                    return Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        const Image(
                          fit: BoxFit.contain,
                          width: 200,
                          height: 70,
                          image: AssetImage('images/empty_cart.png'),
                        ),
                        Text('El carrito esta vacío',
                            style: Theme.of(context).textTheme.headlineSmall),
                      ],
                    ),
                  );
                  }
                } else {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Image.asset(
                                        width: 120,
                                        height: 50,
                                        snapshot.data![index].image.toString(),
                                      ),
                                      SizedBox(
                                        width: 150,
                                        child: Text(
                                          ("${snapshot.data![index].productName!}             ")
                                              .substring(0, 15)
                                              .toString(),
                                          style: const TextStyle(
                                              fontSize: 20,
                                              color: Color(0xFFCC8053),
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Text(
                                        // ignore: prefer_interpolation_to_compose_strings
                                        "S/ " +
                                            snapshot.data![index].productPrice
                                                .toString() +
                                            ".00",
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
                                          borderRadius:
                                              BorderRadius.circular(7),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(6.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  int quantity = snapshot
                                                      .data![index].quantity!;
                                                  int price = snapshot
                                                      .data![index]
                                                      .initialPrice!;
                                                  quantity--;
                                                  int? newPrice =
                                                      price * quantity;
                                                  if (quantity > 0) {
                                                    dbHelper!
                                                        .updateQuantity(
                                                      Cart(
                                                        id: snapshot
                                                            .data![index].id!,
                                                        productId: snapshot
                                                            .data![index].id!
                                                            .toString(),
                                                        productName: snapshot
                                                            .data![index]
                                                            .productName!,
                                                        initialPrice: snapshot
                                                            .data![index]
                                                            .initialPrice!,
                                                        productPrice: newPrice,
                                                        quantity: quantity,
                                                        category: snapshot
                                                            .data![index]
                                                            .category,
                                                        unitTag: snapshot
                                                            .data![index]
                                                            .unitTag
                                                            .toString(),
                                                        image: snapshot
                                                            .data![index].image
                                                            .toString(),
                                                      ),
                                                    )
                                                        .then(
                                                      (value) {
                                                        newPrice = 0;
                                                        quantity = 0;
                                                        cart.removeTotalPrice(
                                                          double.parse(
                                                            snapshot
                                                                .data![index]
                                                                .initialPrice!
                                                                .toString(),
                                                          ),
                                                        );
                                                      },
                                                    ).onError(
                                                      (error, stackTrace) {
                                                        print(error.toString());
                                                      },
                                                    );
                                                  }
                                                },
                                                child: const Icon(
                                                  Icons.remove,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                snapshot.data![index].quantity
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.white),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  int quantity = snapshot
                                                      .data![index].quantity!;
                                                  int price = snapshot
                                                      .data![index]
                                                      .initialPrice!;
                                                  quantity++;
                                                  int? newPrice =
                                                      price * quantity;
                                                  dbHelper!
                                                      .updateQuantity(
                                                    Cart(
                                                      id: snapshot
                                                          .data![index].id,
                                                      productId: snapshot
                                                          .data![index].id!
                                                          .toString(),
                                                      productName: snapshot
                                                          .data![index]
                                                          .productName!,
                                                      initialPrice: snapshot
                                                          .data![index]
                                                          .initialPrice!,
                                                      productPrice: newPrice,
                                                      quantity: quantity,
                                                      category: snapshot
                                                          .data![index]
                                                          .category,
                                                      unitTag: snapshot
                                                          .data![index].unitTag
                                                          .toString(),
                                                      image: snapshot
                                                          .data![index].image
                                                          .toString(),
                                                    ),
                                                  )
                                                      .then(
                                                    (value) {
                                                      newPrice = 0;
                                                      quantity = 0;
                                                      cart.addTotalPrice(
                                                        double.parse(snapshot
                                                            .data![index]
                                                            .initialPrice
                                                            .toString()),
                                                      );
                                                    },
                                                  ).onError(
                                                    (error, stackTrace) {},
                                                  );
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
                                          _deleteProduct(
                                            snapshot.data![index].id!,
                                            snapshot.data![index].productPrice
                                                .toString(),
                                          );
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
              return Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      "Cargando...",
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  ],
                ),
              );
            },
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const BackButton(),
              Consumer<CartProvider>(
                builder: (context, value, child) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: width > 700 ? width * 0.50: width * 0.60,
                      height: 70.0,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ReusableWidget(
                            title: 'IR AL CARRITO: ',
                            // ignore: prefer_interpolation_to_compose_strings
                            value: r's/' +cart.totalPrice.toString()+"0",
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              Image.asset( prueba.state=="ParaSalon"? 'images/tray.png': 'images/bug.png', width: width * 0.10,),
            ],
          ),
        ],
      ),
    );
  }
}

class ReusableWidget extends StatelessWidget {
  final String title, value;
  const ReusableWidget({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('value:$value');
        if (value == 's/0.00') {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Column(
                children: [
                  Image.asset(
                    width: 150,
                    height: 150,
                    "images/sad.png",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Agregue productos al carrito.",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        } else {
          Navigator.pushNamed(context, '/credit');
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              value.toString(),
              style: const TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
