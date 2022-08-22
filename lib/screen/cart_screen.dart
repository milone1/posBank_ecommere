import 'dart:convert';
import 'dart:typed_data';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:posbank_flutter/db/db_helper.dart';
import 'package:posbank_flutter/model/cart_model.dart';
import 'package:posbank_flutter/provider/cart_provider.dart';
import 'package:posbank_flutter/widget/ListCategory.dart';
import 'package:posbank_flutter/widget/otherDetailsDivider.dart';
import 'package:provider/provider.dart';
import 'package:auto_size_text/auto_size_text.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  DBHelper? dbHelper = DBHelper();

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          FutureBuilder(
              future: cart.getData(),
              builder: (context, AsyncSnapshot<List<Cart>> snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.isEmpty) {
                    return Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Image(
                            width: 250,
                            height: 210,
                            image: AssetImage('images/empty_cart.png'),
                          ),
                          Text('El carrito esta vacío 😌',
                              style: Theme.of(context).textTheme.headline5),
                        ],
                      ),
                    );
                  } else {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Image.asset(
                                          width: width * 0.20,
                                          height: 100,
                                          snapshot.data![index].image
                                              .toString()),
                                      Text(
                                        snapshot.data![index].productName
                                            .toString(),
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        "s/ " +
                                            snapshot.data![index].productPrice
                                                .toString() +
                                            ".00",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Container(
                                        margin: EdgeInsets.all(5.0),
                                        height: 35,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius:
                                                BorderRadius.circular(7)),
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
                                                        .updateQuantity(Cart(
                                                            id: snapshot
                                                                .data![index]
                                                                .id!,
                                                            productId: snapshot
                                                                .data![index]
                                                                .id!
                                                                .toString(),
                                                            productName: snapshot
                                                                .data![index]
                                                                .productName!,
                                                            initialPrice: snapshot
                                                                .data![index]
                                                                .initialPrice!,
                                                            productPrice:
                                                                newPrice,
                                                            quantity: quantity,
                                                            category: snapshot
                                                                .data![index]
                                                                .category,
                                                            unitTag: snapshot
                                                                .data![index]
                                                                .unitTag
                                                                .toString(),
                                                            image: snapshot
                                                                .data![index]
                                                                .image
                                                                .toString()))
                                                        .then((value) {
                                                      newPrice = 0;
                                                      quantity = 0;
                                                      cart.removeTotalPrice(
                                                          double.parse(snapshot
                                                              .data![index]
                                                              .initialPrice!
                                                              .toString()));
                                                    }).onError((error,
                                                            stackTrace) {
                                                      print(error.toString());
                                                    });
                                                  }
                                                },
                                                child: Icon(
                                                  Icons.remove,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                snapshot.data![index].quantity
                                                    .toString(),
                                                style: TextStyle(
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
                                                      .then((value) {
                                                    newPrice = 0;
                                                    quantity = 0;
                                                    cart.addTotalPrice(
                                                        double.parse(snapshot
                                                            .data![index]
                                                            .initialPrice!
                                                            .toString()));
                                                  }).onError((error,
                                                          stackTrace) {});
                                                },
                                                child: Icon(
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
                                          dbHelper!.delete(
                                              snapshot.data![index].id!);
                                          cart.removerCounter();
                                          cart.removeTotalPrice(double.parse(
                                              snapshot.data![index].productPrice
                                                  .toString()));
                                        },
                                        child: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ],
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
                return CircularProgressIndicator(
                  color: Colors.black,
                );
              },
            ),
          OtherDetailsDivider(),
          Consumer<CartProvider>(
            builder: (context, value, child) {
              return Container(
                width: width * 0.8,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ReusableWidget(
                      title: 'Total a pagar: ',
                      value: r'$' + value.getTotalPrice().toStringAsFixed(2),
                    ),
                  ],
                ),
              );
            },
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
        Navigator.pushNamed(context, '/credit');
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 10,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            Text(
              value.toString(),
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}
