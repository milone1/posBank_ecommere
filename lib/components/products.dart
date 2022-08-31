import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:posbank_flutter/db/db_helper.dart';
import 'package:posbank_flutter/model/cart_model.dart';
import 'package:posbank_flutter/provider/cart_provider.dart';
import 'package:posbank_flutter/utils/category.dart';
import 'package:posbank_flutter/widget/ListCategory.dart';
import 'package:posbank_flutter/widget/ListDropDown.dart';
import 'package:provider/provider.dart';

class Products extends StatelessWidget {
  DBHelper? dbHelper = DBHelper();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    List products = [
      { 'name': 'Arroz Chaufa',   'price': 21, 'id': 1,  'idProduct': 1,  'category':"comida", 'imgPath': "images/bacon.png"},
      { 'name': "Ensalada pollo", 'price': 12, 'id': 27, 'idProduct':27,  'category':"comida", 'imgPath': 'images/polloSano.png'},
      { 'name': "Pasta",          'price': 18, 'id': 15, 'idProduct': 15, 'category':"comida", 'imgPath': "images/tallarin.png"},
      { 'name': "Ensalada Atun",  'price': 15, 'id': 25, 'idProduct': 25, 'category':"comida", 'imgPath': "images/atun.png"},

      { 'name': "Alitas pollo",   'price': 15, 'id': 26, 'idProduct': 26, 'category':"carne", 'imgPath': "images/alitas.png"},
      { 'name': "Filete de Res",  'price': 18, 'id': 2,  'idProduct': 2,  'category':"carne", 'imgPath': "images/fileteRes.png"},
      { 'name': "Chorizo",        'price': 21, 'id': 13, 'idProduct': 13, 'category':"carne", 'imgPath': "images/chorizo.png"},
      { 'name': "Tocino",         'price': 14, 'id': 3,  'idProduct': 3,  'category':"carne", 'imgPath': "images/tocino.png"},

      { 'name': "Pizza",          'price': 22, 'id': 6,  'idProduct': 6,  'category':"pizza", 'imgPath': "images/pizza.png"},
      { 'name': "Taco",           'price': 12, 'id': 7,  'idProduct': 7,  'category':"pizza", 'imgPath': "images/taco.png"},
      { 'name': "Hamburguer",     'price': 14, 'id': 8,  'idProduct': 8,  'category':"pizza", 'imgPath': "images/hamburguer.png"},

      { 'name': "Sopa Toscana",   'price': 15, 'id': 28, 'idProduct': 28, 'category':"sopa", 'imgPath': "images/sopaToscana.png"},
      { 'name': "Curry",          'price': 15, 'id': 20, 'idProduct': 20, 'category':"sopa", 'imgPath': "images/curry.png"},
      { 'name': "Sopa Ramen",     'price': 12, 'id': 4,  'idProduct': 4,  'category':"sopa", 'imgPath': "images/soup.png"},
      { 'name': "Sopa Todu",      'price': 11, 'id': 5,  'idProduct': 5,  'category':"sopa", 'imgPath': "images/Todu.png"},
      { 'name': "Sashimi",        'price': 13, 'id': 11, 'idProduct': 11, 'category':"sopa", 'imgPath': "images/sashimi.png"},
      
      { 'name': "Sidra",          'price': 14, 'id': 16, 'idProduct': 16, 'category':"bebida", 'imgPath': "images/Sidra.png"},
      { 'name': "Pepsi",          'price': 17, 'id': 17, 'idProduct': 17, 'category':"bebida", 'imgPath': "images/pepsi.png"},
      { 'name': "Te de Manzana",  'price': 17, 'id': 21, 'idProduct': 21, 'category':"bebida", 'imgPath': "images/manzana.png"},
      { 'name': "Fresa",          'price': 19, 'id': 19, 'idProduct': 19, 'category':"bebida", 'imgPath': "images/fresa.png"},
      { 'name': "Cafe",           'price': 10, 'id': 24, 'idProduct': 24, 'category':"bebida", 'imgPath': "images/cafe.png"},

      { 'name': "Vino de Mesa",   'price': 11, 'id': 9,  'idProduct': 9,  'category':"alcohol", 'imgPath': "images/vinoMesa.png"},
      { 'name': "Vodka",          'price': 10, 'id': 10, 'idProduct': 10, 'category':"alcohol", 'imgPath': "images/vodkaRojo.png"},
      { 'name': "Heineken",       'price': 17, 'id': 22, 'idProduct': 22, 'category':"alcohol", 'imgPath': "images/heineken.png"},
      { 'name': "Martini",        'price': 21, 'id': 18, 'idProduct': 18, 'category':"bebida", 'imgPath': "images/martini.png"},

      { 'name': "Chocolate",      'price': 18, 'id': 14, 'idProduct': 14, 'category':" ", 'imgPath': "images/chocolate.png"},
      { 'name': "Helado",         'price': 13, 'id': 12, 'idProduct': 12, 'category':" ", 'imgPath': "images/Helado.png"},
    ];
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
                  height: height * 0.55,
                  child: GridView.builder(
                    itemCount: products.length,
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      // if(false){
                        return _buildCard(
                          products[index]['name'],
                          products[index]['price'],
                          products[index]['id'],
                          products[index]['idProduct'],
                          products[index]['category'],
                          products[index]['imgPath'],
                          context,
                        );
                      // );
                      // } else {
                      //   return Text("asd");
                      // }
                    },
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
        },
        child: Container(
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
                tag: 'dash',
                child: Container(
                  width: 80,
                  height: 80,
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
                _modalHead(name, imgPath, context),
                Padding(
                  padding: EdgeInsets.only(
                    top: 10.0,
                  ),
                  child: Container(
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
                      ],
                    ),
                  ),
                ),
                ListDropDown(),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 20.0,
                    ),
                    child: Container(
                      width: width * 0.35,
                      height: 50.0,
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
                      child: Center(
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
                                cart.addTotalPrice(
                                    double.parse(price.toString()));
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
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _modalHead(String name, String imgPath, context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BackButton(),
              Image.asset(
                imgPath,
                height: 300,
                width: 300,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
              SizedBox(
                width: width * 0.30,
                child: Text(
                  "Tiene sabor, obviamente, y podemos añadir que tiene buen sabor, así que " +
                      "probablemente resulta rico y apetitoso, agradable y grato al paladar. " +
                      "Puede estar bien sazonado, ser picante, ácido, amargo, o podría ser dulce. ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                  maxLines: 5,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
