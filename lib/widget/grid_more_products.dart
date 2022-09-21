import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:posbank_flutter/provider/cart_provider.dart';
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
        'images': 'images/galletasChocolate.png'
      },
      {'id': 2, 'title': 'Maotai', 'price': 12, 'images': 'images/maotai.png'},
      {'id': 3, 'title': 'Cecina', 'price': 12, 'images': 'images/cecina.png'},
      {
        'id': 4,
        'title': 'Carne molida',
        'price': 12,
        'images': 'images/carneMolida.png'
      },
      {
        'id': 5,
        'title': 'Parrilla de carne',
        'price': 12,
        'images': 'images/parrillaCarne.png'
      },
      {'id': 6, 'title': 'Cebolla', 'price': 12, 'images': 'images/onion.png'},
      {
        'id': 7,
        'title': 'Croissant',
        'price': 12,
        'images': 'images/croissant.png'
      },
      {'id': 8, 'title': 'Kebab', 'price': 12, 'images': 'images/kebab.png'},
      {
        'id': 9,
        'title': 'Rebanada de Queso',
        'price': 12,
        'images': 'images/cheese.png'
      },
      {
        'id': 10,
        'title': 'Chocolate',
        'price': 12,
        'images': 'images/chocolate.png'
      },
      {
        'id': 11,
        'title': 'Filete de Res',
        'price': 12,
        'images': 'images/fileteRes.png'
      },
      {
        'id': 12,
        'title': 'Champiñones',
        'price': 12,
        'images': 'images/champiñones.png'
      },
    ];

    return SizedBox(
      width: width,
      height: height * 0.15,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: moreProducts.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
        ),
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(1.0),
            child: InkWell(
              onTap: () {
                if (cartList.cartList.where((element) => element['id'] == id ).length == 0) {
                  Fluttertoast.showToast(
                    msg: "Agregue  productos al carrito",
                    toastLength: Toast.LENGTH_SHORT,
                    webPosition: "bottom",
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.yellow,
                    textColor: Color.fromARGB(255, 177, 114, 114),
                    fontSize: 14.0,
                  );
                } else {
                  cartList.setAggregator(moreProducts[index], id);
                  Fluttertoast.showToast(
                    msg: "Agregar Agregador Correctamente",
                    toastLength: Toast.LENGTH_SHORT,
                    webPosition: "bottom",
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.orange,
                    textColor: Colors.white,
                    fontSize: 14.0,
                  );
                }
              },
              child: Container(
                margin: EdgeInsets.only(right: 10.0, top: 7.0, bottom: 7.0),
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
                    Hero(
                      tag: moreProducts[index]['id'].toString(),
                      child: Image.asset(
                        moreProducts[index]['images'],
                        width: 120,
                        height: 120,
                      ),
                    ),
                    Text(
                      moreProducts[index]['title'],
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFCC8053),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 6,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Text(
                          '\$ ' + moreProducts[index]['price'].toString(),
                          style: TextStyle(
                            color: Color(0xFF575E67),
                            fontSize: 15,
                          ),
                        ),
                      ),
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
