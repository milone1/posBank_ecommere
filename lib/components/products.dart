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
      { 'name': "Pasta Roja",     'price': 15, 'id': 54, 'idProduct': 54, 'category':"comida", 'imgPath': "images/tallarin.png"},
      { 'name': "Arroz Frito",    'price': 17, 'id': 68, 'idProduct': 68, 'category':"comida", 'imgPath': "images/arrozFrito.png"},
      { 'name': "Spagueti Chino", 'price': 15, 'id': 69, 'idProduct': 69, 'category':"comida", 'imgPath': "images/spaggetiChino.png"},
      { 'name': "Cangrejo Frito", 'price': 21, 'id': 70, 'idProduct': 70, 'category':"comida", 'imgPath': "images/cangrejoFrito.png"},
      { 'name': "Shirataki",      'price': 15, 'id': 71, 'idProduct': 71, 'category':"comida", 'imgPath': "images/shirataki.png"},
      { 'name': "Takikomi",       'price': 21, 'id': 72, 'idProduct': 72, 'category':"comida", 'imgPath': "images/takikomi.png"},

      { 'name': "Alitas pollo",   'price': 15, 'id': 26, 'idProduct': 26, 'category':"carne", 'imgPath': "images/alitas.png"},
      { 'name': "Filete de Res",  'price': 18, 'id': 2,  'idProduct': 2,  'category':"carne", 'imgPath': "images/fileteRes.png"},
      { 'name': "Chorizo",        'price': 21, 'id': 13, 'idProduct': 13, 'category':"carne", 'imgPath': "images/chorizo.png"},
      { 'name': "Tocino",         'price': 14, 'id': 3,  'idProduct': 3,  'category':"carne", 'imgPath': "images/tocino.png"},
      { 'name': "Salchicha",      'price': 21, 'id': 50, 'idProduct': 50, 'category':"carne", 'imgPath': "images/salchicha.png"},
      { 'name': "Carne Conejo",   'price': 21, 'id': 73, 'idProduct': 73, 'category':"carne", 'imgPath': "images/conejo.png"},
      { 'name': "Carne Molida",   'price': 25, 'id': 74, 'idProduct': 74, 'category':"carne", 'imgPath': "images/carneMolida.png"},
      { 'name': "Carne Parrilla", 'price': 23, 'id': 75, 'idProduct': 75, 'category':"carne", 'imgPath': "images/parrillaCarne.png"},
      { 'name': "Cecina",         'price': 27, 'id': 76, 'idProduct': 76, 'category':"carne", 'imgPath': "images/cecina.png"},
      { 'name': "Maotai",         'price': 31, 'id': 77, 'idProduct': 77, 'category':"carne", 'imgPath': "images/maotai.png"},

      { 'name': "Pizza",          'price': 22, 'id': 6,  'idProduct': 6,  'category':"pizza", 'imgPath': "images/pizza.png"},
      { 'name': "Taco",           'price': 12, 'id': 7,  'idProduct': 7,  'category':"pizza", 'imgPath': "images/taco.png"},
      { 'name': "Hamburguer",     'price': 14, 'id': 8,  'idProduct': 8,  'category':"pizza", 'imgPath': "images/hamburguer.png"},
      { 'name': "Italiana",       'price': 31, 'id': 51, 'idProduct': 51, 'category':"pizza", 'imgPath': "images/italian.png"},
      { 'name': "Siciliana",      'price': 24, 'id': 52, 'idProduct': 52, 'category':"pizza", 'imgPath': "images/siciliana.png"},
      { 'name': "Taco",           'price': 14, 'id': 78, 'idProduct': 78, 'category':"pizza", 'imgPath': "images/taco2.png"},
      { 'name': "Burrito",        'price': 24, 'id': 79, 'idProduct': 79, 'category':"pizza", 'imgPath': "images/burrito.png"},
      { 'name': "Quesadilla",     'price': 24, 'id': 80, 'idProduct': 80, 'category':"pizza", 'imgPath': "images/quesadilla.png"},
      { 'name': "Enchilada",      'price': 24, 'id': 81, 'idProduct': 81, 'category':"pizza", 'imgPath': "images/enchilada.png"},
      { 'name': "Sandwich",       'price': 24, 'id': 82, 'idProduct': 82, 'category':"pizza", 'imgPath': "images/sandwich.png"},

      { 'name': "Sopa Toscana",   'price': 15, 'id': 28, 'idProduct': 28, 'category':"sopa", 'imgPath': "images/sopaToscana.png"},
      { 'name': "Curry",          'price': 15, 'id': 20, 'idProduct': 20, 'category':"sopa", 'imgPath': "images/curry.png"},
      { 'name': "Sopa Ramen",     'price': 12, 'id': 4,  'idProduct': 4,  'category':"sopa", 'imgPath': "images/soup.png"},
      { 'name': "Sopa Todu",      'price': 11, 'id': 5,  'idProduct': 5,  'category':"sopa", 'imgPath': "images/Todu.png"},
      { 'name': "Sashimi",        'price': 13, 'id': 11, 'idProduct': 11, 'category':"sopa", 'imgPath': "images/sashimi.png"},
      { 'name': "Thuk Pa",        'price': 13, 'id': 83, 'idProduct': 83, 'category':"sopa", 'imgPath': "images/thukpaRamen.png"},
      { 'name': "Misua",          'price': 25, 'id': 84, 'idProduct': 84, 'category':"sopa", 'imgPath': "images/misua.png"},
      { 'name': "Albondiga",      'price': 15, 'id': 85, 'idProduct': 85, 'category':"sopa", 'imgPath': "images/albondiga.png"},
      { 'name': "Tom Yum",        'price': 36, 'id': 86, 'idProduct': 86, 'category':"sopa", 'imgPath': "images/tomYum.png"},
      { 'name': "Bun Bo",         'price': 21, 'id': 87, 'idProduct': 87, 'category':"sopa", 'imgPath': "images/bunBo.png"},
      
      { 'name': "Sidra",          'price': 14, 'id': 16, 'idProduct': 16, 'category':"bebida", 'imgPath': "images/Sidra.png"},
      { 'name': "Pepsi",          'price': 17, 'id': 17, 'idProduct': 17, 'category':"bebida", 'imgPath': "images/pepsi.png"},
      { 'name': "Te de Manzana",  'price': 17, 'id': 21, 'idProduct': 21, 'category':"bebida", 'imgPath': "images/manzana.png"},
      { 'name': "Fresa",          'price': 19, 'id': 19, 'idProduct': 19, 'category':"bebida", 'imgPath': "images/fresa.png"},
      { 'name': "Cafe",           'price': 10, 'id': 24, 'idProduct': 24, 'category':"bebida", 'imgPath': "images/cafe.png"},
      { 'name': "Coca Cola",      'price': 14, 'id': 88, 'idProduct': 88, 'category':"bebida", 'imgPath': "images/cocaCola.png"},
      { 'name': "Fanta Uva",      'price': 15, 'id': 89, 'idProduct': 89, 'category':"bebida", 'imgPath': "images/fanta.png"},
      { 'name': "Coca Cola Zero", 'price': 17, 'id': 90, 'idProduct': 90, 'category':"bebida", 'imgPath': "images/cocaColaZero.png"},
      { 'name': "Fanta Limon",    'price': 18, 'id': 91, 'idProduct': 91, 'category':"bebida", 'imgPath': "images/fantaLimon.png"},
      { 'name': "Te Chai",        'price': 14, 'id': 92, 'idProduct': 92, 'category':"bebida", 'imgPath': "images/teChai.png"},

      { 'name': "Vino de Mesa",   'price': 11, 'id': 9,  'idProduct': 9,  'category':"alcohol", 'imgPath': "images/vinoMesa.png"},
      { 'name': "Vodka",          'price': 10, 'id': 10, 'idProduct': 10, 'category':"alcohol", 'imgPath': "images/vodkaRojo.png"},
      { 'name': "Heineken",       'price': 17, 'id': 22, 'idProduct': 22, 'category':"alcohol", 'imgPath': "images/heineken.png"},
      { 'name': "Martini",        'price': 21, 'id': 18, 'idProduct': 18, 'category':"alcohol", 'imgPath': "images/martini.png"},
      { 'name': "Coca Ron",       'price': 25, 'id': 53, 'idProduct': 53, 'category':"alcohol", 'imgPath': "images/cocaRon.png"},
      { 'name': "Champan",        'price': 75, 'id': 93, 'idProduct': 93, 'category':"alcohol", 'imgPath': "images/champan.png"},
      { 'name': "Vino Espumoso",  'price': 65, 'id': 94, 'idProduct': 94, 'category':"alcohol", 'imgPath': "images/vino.png"},
      { 'name': "Whisky",         'price': 55, 'id': 95, 'idProduct': 95, 'category':"alcohol", 'imgPath': "images/whisky.png"},
      { 'name': "Coñac",          'price': 85, 'id': 96, 'idProduct': 96, 'category':"alcohol", 'imgPath': "images/coñac.png"},
      { 'name': "Margarita",      'price': 95, 'id': 97, 'idProduct': 97, 'category':"alcohol", 'imgPath': "images/margarita.png"},

      { 'name': "Chocolate",      'price': 18, 'id': 14, 'idProduct': 14, 'category':"postre", 'imgPath': "images/chocolate.png"},
      { 'name': "Helado",         'price': 13, 'id': 12, 'idProduct': 12, 'category':"postre", 'imgPath': "images/Helado.png"},
      { 'name': "Tarta",          'price': 21, 'id': 55, 'idProduct': 55, 'category':"postre", 'imgPath': "images/tarta.png"},
      { 'name': "Croissant",      'price': 52, 'id': 56, 'idProduct': 56, 'category':"postre", 'imgPath': "images/croissant.png"},
      { 'name': "Kebab",          'price': 41, 'id': 57, 'idProduct': 57, 'category':"postre", 'imgPath': "images/kebab.png"},
      { 'name': "Tarta de Huevo", 'price': 41, 'id': 98,  'idProduct': 98,  'category':"postre", 'imgPath': "images/tartaHuevo.png"},
      { 'name': "Tarta de Limon", 'price': 25, 'id': 99,  'idProduct': 99,  'category':"postre", 'imgPath': "images/tartaLimon.png"},
      { 'name': "Galletas",       'price': 34, 'id': 100, 'idProduct': 100, 'category':"postre", 'imgPath': "images/galletas.png"},
      { 'name': "Chocolates",     'price': 32, 'id': 101, 'idProduct': 101, 'category':"postre", 'imgPath': "images/galletasChocolate.png"},
      { 'name': "Tostadas",       'price': 14, 'id': 102, 'idProduct': 102, 'category':"postre", 'imgPath': "images/tostada.png"},

      { 'name': "Dish",           'price': 32, 'id': 58, 'idProduct': 58, 'category':"marisco", 'imgPath': "images/dish.png"},
      { 'name': "Crayfish",       'price': 32, 'id': 59, 'idProduct': 59, 'category':"marisco", 'imgPath': "images/crayfish.png"},
      { 'name': "Sushi Cantones", 'price': 41, 'id': 60, 'idProduct': 60, 'category':"marisco", 'imgPath': "images/sushiCantonese.png"},
      { 'name': "Camaron",        'price': 31, 'id': 61, 'idProduct': 61, 'category':"marisco", 'imgPath': "images/shrimp.png"},
      { 'name': "Cangrejo",       'price': 41, 'id': 62, 'idProduct': 62, 'category':"marisco", 'imgPath': "images/crab.png"},
      { 'name': "Tempura",        'price': 21, 'id': 63, 'idProduct': 63, 'category':"marisco", 'imgPath': "images/tempura.png"},
      { 'name': "Thai",           'price': 11, 'id': 64, 'idProduct': 64, 'category':"marisco", 'imgPath': "images/thai.png"},
      { 'name': "Arroz Anguila",  'price': 21, 'id': 65, 'idProduct': 65, 'category':"marisco", 'imgPath': "images/eelRice.png"},
      { 'name': "Domburi",        'price': 17, 'id': 66, 'idProduct': 66, 'category':"marisco", 'imgPath': "images/domburi.png"},
      { 'name': "Kebab",          'price': 25, 'id': 67, 'idProduct': 67, 'category':"marisco", 'imgPath': "images/kebab.png"},
    ];

    return Consumer<CartProvider>(
      builder: (context, prueba, _) => Padding(
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
                      itemCount: prueba.category == "" ? products.length : 10,
                      scrollDirection: Axis.horizontal,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                      ),
                      itemBuilder: (BuildContext context, index) {
                        if(prueba.category == "") {
                          return _buildCard(
                            products[index]['name'],
                            products[index]['price'],
                            products[index]['id'],
                            products[index]['idProduct'],
                            products[index]['category'],
                            products[index]['imgPath'],
                            context,
                          );
                        } else {
                          var listCategory = products.where((element) => element['category'] == prueba.category).toList();
                            return _buildCard(
                            products[index]['name'],
                            products[index]['price'],
                            products[index]['id'],
                            products[index]['idProduct'],
                            products[index]['category'],
                            products[index]['imgPath'],
                            context,
                          );
                        }
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
      ),
    );
  }

  Widget _buildCard(String name, int price, int id, int idProduct, String category,
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

  _mySheet(String name, int price, int id, int idProduct, String category,
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
