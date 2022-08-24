import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:posbank_flutter/db/db_helper.dart';
import 'package:posbank_flutter/model/cart_model.dart';
import 'package:posbank_flutter/provider/cart_provider.dart';
import 'package:posbank_flutter/widget/ListAdd.dart';
import 'package:posbank_flutter/widget/ListCategory.dart';
import 'package:provider/provider.dart';

class Products extends StatelessWidget {
  DBHelper? dbHelper = DBHelper();

  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.of(context).orientation;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(
        left: 10.0,
        top: 1.0,
      ),
      child: Row(
        children: [
          LimitedBox(
            maxWidth: 350,
            child: BounceInLeft(
              child: ListCategory(),
              duration: Duration(seconds: 2),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                top: 2,
                left: 10,
                bottom: 10,
              ),
              child: BounceInRight(
                child: Container(
                  width: width - 100,
                  height: height * 0.60,
                  child: GridView.count(
                    crossAxisCount: 6,
                    scrollDirection: Axis.horizontal,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 20,
                    children: <Widget>[
                      _buildCard("Arroz Chaufa", 21, 1, 1, 1,
                          "images/bacon.png", context),
                      _buildCard("Ensalada pollo", 12, 27, 27, 27,
                          'images/polloSano.png', context),
                      _buildCard("Pasta", 18, 15, 15, 15, 'images/tallarin.png',
                          context),
                      _buildCard("Ensalada Atun", 15, 25, 25, 25,
                          'images/atun.png', context),
                      _buildCard("Alitas pollo", 15, 26, 26, 26,
                          'images/alitas.png', context),
                      _buildCard("Filete de Res", 18, 2, 2, 2,
                          "images/fileteRes.png", context),
                      _buildCard("Chorizo", 21, 13, 13, 13,
                          'images/chorizo.png', context),
                      _buildCard(
                          "Tocino", 14, 3, 3, 3, 'images/tocino.png', context),
                      _buildCard(
                          "Pizza", 22, 6, 6, 6, 'images/pizza.png', context),
                      _buildCard(
                          "Taco", 12, 7, 7, 7, 'images/taco.png', context),
                      _buildCard("Hamburguer", 14, 8, 8, 8,
                          'images/hamburguer.png', context),
                      _buildCard("Sopa Toscana", 15, 28, 28, 28,
                          'images/sopaToscana.png', context),
                      _buildCard(
                          "Curry", 15, 20, 20, 20, 'images/curry.png', context),
                      _buildCard("Sopa Ramen", 12, 4, 4, 4, 'images/soup.png',
                          context),
                      _buildCard(
                          "Sopa Todu", 11, 5, 5, 5, 'images/Todu.png', context),
                      _buildCard("Sashimi", 13, 11, 11, 11,
                          'images/sashimi.png', context),
                      _buildCard("Sopa India", 21, 29, 29, 29,
                          'images/sopaIndia.png', context),
                      _buildCard(
                          "Sidra", 14, 16, 16, 16, 'images/Sidra.png', context),
                      _buildCard(
                          "Pepsi", 17, 17, 17, 17, 'images/pepsi.png', context),
                      _buildCard("Martini", 21, 18, 18, 18,
                          'images/martini.png', context),
                      _buildCard("Heineken", 17, 22, 22, 22,
                          'images/heineken.png', context),
                      _buildCard(
                          "Fresa", 19, 19, 19, 19, 'images/fresa.png', context),
                      _buildCard("Vodka", 10, 10, 10, 10,
                          'images/vodkaRojo.png', context),
                      _buildCard("Capuchino", 11, 23, 23, 23,
                          'images/capuchino.png', context),
                      _buildCard(
                          "Cafe", 10, 24, 24, 24, 'images/cafe.png', context),
                      _buildCard("Vino de Mesa", 11, 9, 9, 9,
                          'images/vinoMesa.png', context),
                      _buildCard("Helado", 13, 12, 12, 12, 'images/Helado.png',
                          context),
                      _buildCard("Chocolate", 18, 14, 14, 14,
                          'images/chocolate.png', context),
                      _buildCard("Te de Manzana", 17, 21, 21, 21,
                          'images/manzana.png', context),
                    ],
                  ),
                ),
                duration: Duration(
                  seconds: 2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(String name, int price, int id, int idProduct, int category,
      String imgPath, context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: InkWell(
        onTap: () {
          _mySheet(name, price, id, idProduct, category, imgPath, context);
          // dbHelper!.insert(
          //   Cart(
          //       id: id,
          //       productId: idProduct.toString(),
          //       productName: name,
          //       initialPrice: price,
          //       productPrice: price,
          //       quantity: 1,
          //       unitTag: price.toString(),
          //       image: imgPath,
          //       category: ''),
          // )
          //     .then((value) {
          //   cart.addTotalPrice(double.parse(price.toString()));
          //   cart.addCounter();

          //   final snackBar = SnackBar(
          //     backgroundColor: Colors.green,
          //     content: Text('Producto agregado correctamente'),
          //     duration: Duration(seconds: 1),
          //   );

          //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
          // }).onError((error, stackTrace) {
          //   print("error" + error.toString());
          //   final snackBar = SnackBar(
          //       backgroundColor: Colors.red,
          //       content: Text('El producto ya existe en el carrito'),
          //       duration: Duration(seconds: 1));
          //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
          // });
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  spreadRadius: 5,
                  blurRadius: 7),
            ],
            color: Colors.white,
          ),
          child: Column(
            children: [
              Hero(
                tag: 'dash',
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(imgPath), fit: BoxFit.contain),
                  ),
                ),
              ),
              Text(
                name,
                style: TextStyle(
                  fontSize: 15,
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
                    'S/' + price.toString() + '.00',
                    style: TextStyle(color: Color(0xFF575E67), fontSize: 15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _mySheet(String name, int price, int id, int idProduct, int category,
      String imgPath, context) {
    final cart = Provider.of<CartProvider>(context, listen: false);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        top: Radius.circular(32),
      )),
      context: context,
      builder: (context) {
        return SizedBox(
          height: height * 0.7,
          child: Center(
            child: Column(
              children: [
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        imgPath,
                        height: 250,
                        width: 250,
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            name,
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFCC8053),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Container(
                            width: 400,
                            height: 180,
                            child: Text(
                              "Tiene sabor, obviamente, y podemos añadir que tiene buen sabor, así que " +
                                  "probablemente resulta rico y apetitoso, agradable y grato al paladar. " +
                                  "Puede estar bien sazonado, ser picante, ácido, amargo, o podría ser dulce. ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black, 
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: width,
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "AGREGAR",
                      ),
                      Text(
                        "QUITAR",
                      ),
                      Text(
                        "ESPECIFICACIONES",
                      ),
                      Text(
                        "OTROS",
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Container(
                    width: width * 0.35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            spreadRadius: 5,
                            blurRadius: 7),
                      ],
                      color: Colors.blue,
                    ),
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
                        dbHelper!
                            .insert(
                          Cart(
                              id: id,
                              productId: idProduct.toString(),
                              productName: name,
                              initialPrice: price,
                              productPrice: price,
                              quantity: 1,
                              unitTag: price.toString(),
                              image: imgPath,
                              category: ''),
                        )
                            .then(
                          (value) {
                            cart.addTotalPrice(double.parse(price.toString()));
                            cart.addCounter();
                          },
                        );
                        Navigator.pop(context);
                      },
                      child: Text(
                        "+ AGREGAR AL CARRITO",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.08,
                ),
                Container(
                  width: width,
                  height: height * 0.30,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black
                    )
                  ),
                  child: ListAdd(),
                  // child: ListWheelScrollView(
                  //   itemExtent: 250, 
                  //   children: [
                  //     Container(
                  //       decoration: BoxDecoration(
                  //         border: Border.all(
                  //           color: Colors.black
                  //         )
                  //       ),
                  //       child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         crossAxisAlignment: CrossAxisAlignment.center,
                  //         children: [
                  //             Image.asset(
                  //             "images/cafe.png",
                  //             height: 90, 
                  //             width: 90,
                  //             ),
                  //             Text(
                  //               ""
                  //             )
                  //         ],
                  //       )
                  //     ),
                  //     Container(
                  //       decoration: BoxDecoration(
                  //         border: Border.all(
                  //           color: Colors.black
                  //         )
                  //       ),
                  //       child: Image.asset(
                  //         "images/cafe.png",
                  //         height: 90, 
                  //         width: 90,
                  //       ),
                  //     ),
                  //     Container(
                  //       decoration: BoxDecoration(
                  //         border: Border.all(
                  //           color: Colors.black
                  //         )
                  //       ),
                  //       child: Image.asset(
                  //         "images/cafe.png",
                  //         height: 90, 
                  //         width: 90,
                  //       ),
                  //     ),
                  //     Container(
                  //       decoration: BoxDecoration(
                  //         border: Border.all(
                  //           color: Colors.black
                  //         )
                  //       ),
                  //       child: Image.asset(
                  //         "images/cafe.png",
                  //         height: 90, 
                  //         width: 90,
                  //       ),
                  //     ),
                  //     Container(
                  //       decoration: BoxDecoration(
                  //         border: Border.all(
                  //           color: Colors.black
                  //         )
                  //       ),
                  //       child: Image.asset(
                  //         "images/cafe.png",
                  //         height: 90, 
                  //         width: 90,
                  //       ),
                  //     ),
                  //     Container(
                  //       decoration: BoxDecoration(
                  //         border: Border.all(
                  //           color: Colors.black
                  //         )
                  //       ),
                  //       child: Image.asset(
                  //         "images/cafe.png",
                  //         height: 90, 
                  //         width: 90,
                  //       ),
                  //     ),
                  //   ]
                  // ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
