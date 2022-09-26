import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:posbank_flutter/provider/cart_provider.dart';
import 'package:posbank_flutter/widget/widgets.dart';
import 'package:provider/provider.dart';

class GridMoreProducts extends StatelessWidget {
  const GridMoreProducts({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final cartList = Provider.of<CartProvider>(context);

    List moreProducts = [
      {
        'id': 1,
        'title': 'Galletas de Chocolate',
        'price': 12,
        'images': 'images/galletasChocolate.png',
        'qty': 1,
      },
      {
        'id': 2,
        'title': 'Maotai',
        'price': 12,
        'images': 'images/maotai.png',
        'qty': 1,
      },
      {
        'id': 3,
        'title': 'Cecina',
        'price': 12,
        'images': 'images/cecina.png',
        'qty': 1,
      },
      {
        'id': 4,
        'title': 'Carne molida',
        'price': 12,
        'images': 'images/carneMolida.png',
        'qty': 1,
      },
      {
        'id': 5,
        'title': 'Parrilla de carne',
        'price': 12,
        'images': 'images/parrillaCarne.png',
        'qty': 1,
      },
      {
        'id': 6,
        'title': 'Cebolla',
        'price': 12,
        'images': 'images/onion.png',
        'qty': 1,
      },
      {
        'id': 7,
        'title': 'Croissant',
        'price': 12,
        'images': 'images/croissant.png',
        'qty': 1,
      },
      {
        'id': 8,
        'title': 'Kebab',
        'price': 12,
        'images': 'images/kebab.png',
        'qty': 1,
      },
      {
        'id': 9,
        'title': 'Rebanada de Queso',
        'price': 12,
        'images': 'images/cheese.png',
        'qty': 1,
      },
      {
        'id': 10,
        'title': 'Chocolate',
        'price': 12,
        'images': 'images/chocolate.png',
        'qty': 1,
      },
      {
        'id': 11,
        'title': 'Filete de Res',
        'price': 12,
        'images': 'images/fileteRes.png',
        'qty': 1,
      },
      {
        'id': 12,
        'title': 'Champiñones',
        'price': 12,
        'images': 'images/champiñones.png',
        'qty': 1,
      },
    ];

    return SizedBox(
      width: width,
      height: height * 0.15,
      child: GridView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: moreProducts.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
        ),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 10,
              right: 15,
            ),
            child: InkWell(
              onTap: () {
                if (cartList.cartList
                    .where((element) => element['id'] == id)
                    .isEmpty) {
                  Fluttertoast.showToast(
                    msg: "Primero agregue el producto!",
                    toastLength: Toast.LENGTH_SHORT,
                    webPosition: "bottom",
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 14.0,
                  );
                } else {
                  cartList.setAggregator(moreProducts[index], id);
                  Fluttertoast.showToast(
                    msg: "Agregado Correctamente",
                    toastLength: Toast.LENGTH_SHORT,
                    webPosition: "bottom",
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 14.0,
                  );
                }
              },
              child: Container(
                margin:
                    const EdgeInsets.only(right: 10.0, top: 7.0, bottom: 7.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 5,
                      blurRadius: 7,
                    ),
                  ],
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    ImageCardMoreProducts(
                      moreProducts: moreProducts,
                      index: index,
                    ),
                    TitleCardMoreProducts(
                      moreProducts: moreProducts,
                      index: index,
                    ),
                    PriceCardMoreProducts(
                      moreProducts: moreProducts,
                      index: index,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
