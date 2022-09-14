// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
//* animations
import 'package:animate_do/animate_do.dart';
import 'package:posbank_flutter/provider/provider.dart';
import 'package:posbank_flutter/widget/widgets.dart';
import 'package:provider/provider.dart';



// ignore: must_be_immutable
class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);
  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final products = Provider.of<ProductsProvider>(context).products;

    // List products = [
    //   {
    //     'name': 'Combo Chaufa',
    //     'price': 21,
    //     'id': 1,
    //     'idProduct': 1,
    //     'category': "comidas",
    //     'imgPath': "images/bacon.png"
    //   },
    //   {
    //     'name': "Combo Pollo",
    //     'price': 12,
    //     'id': 27,
    //     'idProduct': 27,
    //     'category': "comidas",
    //     'imgPath': 'images/polloSano.png'
    //   },
    //   {
    //     'name': " Combo Pasta",
    //     'price': 18,
    //     'id': 15,
    //     'idProduct': 15,
    //     'category': "comidas",
    //     'imgPath': "images/tallarin.png"
    //   },
    //   {
    //     'name': "Combo Atun",
    //     'price': 15,
    //     'id': 25,
    //     'idProduct': 25,
    //     'category': "comidas",
    //     'imgPath': "images/atun.png"
    //   },
    //   {
    //     'name': "Pasta Roja",
    //     'price': 15,
    //     'id': 54,
    //     'idProduct': 54,
    //     'category': "comidas",
    //     'imgPath': "images/tallarin.png"
    //   },
    //   {
    //     'name': "Arroz Frito",
    //     'price': 17,
    //     'id': 68,
    //     'idProduct': 68,
    //     'category': "comidas",
    //     'imgPath': "images/arrozFrito.png"
    //   },
    //   {
    //     'name': "Spagueti Chino",
    //     'price': 15,
    //     'id': 69,
    //     'idProduct': 69,
    //     'category': "comidas",
    //     'imgPath': "images/spaggetiChino.png"
    //   },
    //   {
    //     'name': "Cangrejo Frito",
    //     'price': 21,
    //     'id': 70,
    //     'idProduct': 70,
    //     'category': "comidas",
    //     'imgPath': "images/cangrejoFrito.png"
    //   },
    //   {
    //     'name': "Shirataki",
    //     'price': 15,
    //     'id': 71,
    //     'idProduct': 71,
    //     'category': "comidas",
    //     'imgPath': "images/shirataki.png"
    //   },
    //   {
    //     'name': "Takikomi",
    //     'price': 21,
    //     'id': 72,
    //     'idProduct': 72,
    //     'category': "comidas",
    //     'imgPath': "images/takikomi.png"
    //   },
    //   {
    //     'name': "Alitas pollo",
    //     'price': 15,
    //     'id': 26,
    //     'idProduct': 26,
    //     'category': "carnes",
    //     'imgPath': "images/alitas.png"
    //   },
    //   {
    //     'name': "Filete de Res",
    //     'price': 18,
    //     'id': 2,
    //     'idProduct': 2,
    //     'category': "carnes",
    //     'imgPath': "images/fileteRes.png"
    //   },
    //   {
    //     'name': "Chorizo",
    //     'price': 21,
    //     'id': 13,
    //     'idProduct': 13,
    //     'category': "carnes",
    //     'imgPath': "images/chorizo.png"
    //   },
    //   {
    //     'name': "Tocino",
    //     'price': 14,
    //     'id': 3,
    //     'idProduct': 3,
    //     'category': "carnes",
    //     'imgPath': "images/tocino.png"
    //   },
    //   {
    //     'name': "Salchicha",
    //     'price': 21,
    //     'id': 50,
    //     'idProduct': 50,
    //     'category': "carnes",
    //     'imgPath': "images/salchicha.png"
    //   },
    //   {
    //     'name': "Carne Conejo",
    //     'price': 21,
    //     'id': 73,
    //     'idProduct': 73,
    //     'category': "carnes",
    //     'imgPath': "images/conejo.png"
    //   },
    //   {
    //     'name': "Carne Molida",
    //     'price': 25,
    //     'id': 74,
    //     'idProduct': 74,
    //     'category': "carnes",
    //     'imgPath': "images/carneMolida.png"
    //   },
    //   {
    //     'name': "Carne Parrilla",
    //     'price': 23,
    //     'id': 75,
    //     'idProduct': 75,
    //     'category': "carnes",
    //     'imgPath': "images/parrillaCarne.png"
    //   },
    //   {
    //     'name': "Cecina",
    //     'price': 27,
    //     'id': 76,
    //     'idProduct': 76,
    //     'category': "carnes",
    //     'imgPath': "images/cecina.png"
    //   },
    //   {
    //     'name': "Maotai",
    //     'price': 31,
    //     'id': 77,
    //     'idProduct': 77,
    //     'category': "carnes",
    //     'imgPath': "images/maotai.png"
    //   },
    //   {
    //     'name': "Pizza Roja",
    //     'price': 22,
    //     'id': 6,
    //     'idProduct': 6,
    //     'category': "pizzas",
    //     'imgPath': "images/pizza.png"
    //   },
    //   {
    //     'name': "Taco",
    //     'price': 12,
    //     'id': 7,
    //     'idProduct': 7,
    //     'category': "pizzas",
    //     'imgPath': "images/taco.png"
    //   },
    //   {
    //     'name': "Hamburguer",
    //     'price': 14,
    //     'id': 8,
    //     'idProduct': 8,
    //     'category': "pizzas",
    //     'imgPath': "images/hamburguer.png"
    //   },
    //   {
    //     'name': "Italiana",
    //     'price': 31,
    //     'id': 51,
    //     'idProduct': 51,
    //     'category': "pizzas",
    //     'imgPath': "images/italian.png"
    //   },
    //   {
    //     'name': "Siciliana",
    //     'price': 24,
    //     'id': 52,
    //     'idProduct': 52,
    //     'category': "pizzas",
    //     'imgPath': "images/siciliana.png"
    //   },
    //   {
    //     'name': "Taco",
    //     'price': 14,
    //     'id': 78,
    //     'idProduct': 78,
    //     'category': "pizzas",
    //     'imgPath': "images/taco2.png"
    //   },
    //   {
    //     'name': "Burrito",
    //     'price': 24,
    //     'id': 79,
    //     'idProduct': 79,
    //     'category': "pizzas",
    //     'imgPath': "images/burrito.png"
    //   },
    //   {
    //     'name': "Quesadilla",
    //     'price': 24,
    //     'id': 80,
    //     'idProduct': 80,
    //     'category': "pizzas",
    //     'imgPath': "images/quesadilla.png"
    //   },
    //   {
    //     'name': "Enchilada",
    //     'price': 24,
    //     'id': 81,
    //     'idProduct': 81,
    //     'category': "pizzas",
    //     'imgPath': "images/enchilada.png"
    //   },
    //   {
    //     'name': "Sandwich",
    //     'price': 24,
    //     'id': 82,
    //     'idProduct': 82,
    //     'category': "pizzas",
    //     'imgPath': "images/sandwich.png"
    //   },
    //   {
    //     'name': "Sopa Toscana",
    //     'price': 15,
    //     'id': 28,
    //     'idProduct': 28,
    //     'category': "sopas",
    //     'imgPath': "images/sopaToscana.png"
    //   },
    //   {
    //     'name': "Curry",
    //     'price': 15,
    //     'id': 20,
    //     'idProduct': 20,
    //     'category': "sopas",
    //     'imgPath': "images/curry.png"
    //   },
    //   {
    //     'name': "Sopa Ramen",
    //     'price': 12,
    //     'id': 4,
    //     'idProduct': 4,
    //     'category': "sopas",
    //     'imgPath': "images/soup.png"
    //   },
    //   {
    //     'name': "Sopa Todu",
    //     'price': 11,
    //     'id': 5,
    //     'idProduct': 5,
    //     'category': "sopas",
    //     'imgPath': "images/Todu.png"
    //   },
    //   {
    //     'name': "Sashimi",
    //     'price': 13,
    //     'id': 11,
    //     'idProduct': 11,
    //     'category': "sopas",
    //     'imgPath': "images/sashimi.png"
    //   },
    //   {
    //     'name': "Thuk Pa",
    //     'price': 13,
    //     'id': 83,
    //     'idProduct': 83,
    //     'category': "sopas",
    //     'imgPath': "images/thukpaRamen.png"
    //   },
    //   {
    //     'name': "Misua",
    //     'price': 25,
    //     'id': 84,
    //     'idProduct': 84,
    //     'category': "sopas",
    //     'imgPath': "images/misua.png"
    //   },
    //   {
    //     'name': "Albondiga",
    //     'price': 15,
    //     'id': 85,
    //     'idProduct': 85,
    //     'category': "sopas",
    //     'imgPath': "images/albondiga.png"
    //   },
    //   {
    //     'name': "Tom Yum",
    //     'price': 36,
    //     'id': 86,
    //     'idProduct': 86,
    //     'category': "sopas",
    //     'imgPath': "images/tomYum.png"
    //   },
    //   {
    //     'name': "Bun Bo",
    //     'price': 21,
    //     'id': 87,
    //     'idProduct': 87,
    //     'category': "sopas",
    //     'imgPath': "images/bunBo.png"
    //   },
    //   {
    //     'name': "Sidra",
    //     'price': 14,
    //     'id': 16,
    //     'idProduct': 16,
    //     'category': "bebidas",
    //     'imgPath': "images/Sidra.png"
    //   },
    //   {
    //     'name': "Pepsi",
    //     'price': 17,
    //     'id': 17,
    //     'idProduct': 17,
    //     'category': "bebidas",
    //     'imgPath': "images/pepsi.png"
    //   },
    //   {
    //     'name': "Te de Manzana",
    //     'price': 17,
    //     'id': 21,
    //     'idProduct': 21,
    //     'category': "bebidas",
    //     'imgPath': "images/manzana.png"
    //   },
    //   {
    //     'name': "Fresa",
    //     'price': 19,
    //     'id': 19,
    //     'idProduct': 19,
    //     'category': "bebidas",
    //     'imgPath': "images/fresa.png"
    //   },
    //   {
    //     'name': "Cafe",
    //     'price': 10,
    //     'id': 24,
    //     'idProduct': 24,
    //     'category': "bebidas",
    //     'imgPath': "images/cafe.png"
    //   },
    //   {
    //     'name': "Coca Cola",
    //     'price': 14,
    //     'id': 88,
    //     'idProduct': 88,
    //     'category': "bebidas",
    //     'imgPath': "images/cocaCola.png"
    //   },
    //   {
    //     'name': "Fanta Uva",
    //     'price': 15,
    //     'id': 89,
    //     'idProduct': 89,
    //     'category': "bebidas",
    //     'imgPath': "images/fanta.png"
    //   },
    //   {
    //     'name': "Coca Cola Zero",
    //     'price': 17,
    //     'id': 90,
    //     'idProduct': 90,
    //     'category': "bebidas",
    //     'imgPath': "images/cocaColaZero.png"
    //   },
    //   {
    //     'name': "Fanta Limon",
    //     'price': 18,
    //     'id': 91,
    //     'idProduct': 91,
    //     'category': "bebidas",
    //     'imgPath': "images/fantaLimon.png"
    //   },
    //   {
    //     'name': "Te Chai",
    //     'price': 14,
    //     'id': 92,
    //     'idProduct': 92,
    //     'category': "bebidas",
    //     'imgPath': "images/teChai.png"
    //   },
    //   {
    //     'name': "Vino de Mesa",
    //     'price': 11,
    //     'id': 9,
    //     'idProduct': 9,
    //     'category': "alcoholes",
    //     'imgPath': "images/vinoMesa.png"
    //   },
    //   {
    //     'name': "Vodka",
    //     'price': 10,
    //     'id': 10,
    //     'idProduct': 10,
    //     'category': "alcoholes",
    //     'imgPath': "images/vodkaRojo.png"
    //   },
    //   {
    //     'name': "Heineken",
    //     'price': 17,
    //     'id': 22,
    //     'idProduct': 22,
    //     'category': "alcoholes",
    //     'imgPath': "images/heineken.png"
    //   },
    //   {
    //     'name': "Martini",
    //     'price': 21,
    //     'id': 18,
    //     'idProduct': 18,
    //     'category': "alcoholes",
    //     'imgPath': "images/martini.png"
    //   },
    //   {
    //     'name': "Coca Ron",
    //     'price': 25,
    //     'id': 53,
    //     'idProduct': 53,
    //     'category': "alcoholes",
    //     'imgPath': "images/cocaRon.png"
    //   },
    //   {
    //     'name': "Champan",
    //     'price': 75,
    //     'id': 93,
    //     'idProduct': 93,
    //     'category': "alcoholes",
    //     'imgPath': "images/champan.png"
    //   },
    //   {
    //     'name': "Vino Espumoso",
    //     'price': 65,
    //     'id': 94,
    //     'idProduct': 94,
    //     'category': "alcoholes",
    //     'imgPath': "images/vino.png"
    //   },
    //   {
    //     'name': "Whisky",
    //     'price': 55,
    //     'id': 95,
    //     'idProduct': 95,
    //     'category': "alcoholes",
    //     'imgPath': "images/whisky.png"
    //   },
    //   {
    //     'name': "Conac",
    //     'price': 85,
    //     'id': 96,
    //     'idProduct': 96,
    //     'category': "alcoholes",
    //     'imgPath': "images/coñac.png"
    //   },
    //   {
    //     'name': "Margarita",
    //     'price': 95,
    //     'id': 97,
    //     'idProduct': 97,
    //     'category': "alcoholes",
    //     'imgPath': "images/margarita.png"
    //   },
    //   {
    //     'name': "Chocolate",
    //     'price': 18,
    //     'id': 14,
    //     'idProduct': 14,
    //     'category': "postres",
    //     'imgPath': "images/chocolate.png"
    //   },
    //   {
    //     'name': "Helado",
    //     'price': 13,
    //     'id': 12,
    //     'idProduct': 12,
    //     'category': "postres",
    //     'imgPath': "images/Helado.png"
    //   },
    //   {
    //     'name': "Tarta",
    //     'price': 21,
    //     'id': 55,
    //     'idProduct': 55,
    //     'category': "postres",
    //     'imgPath': "images/tarta.png"
    //   },
    //   {
    //     'name': "Croissant",
    //     'price': 52,
    //     'id': 56,
    //     'idProduct': 56,
    //     'category': "postres",
    //     'imgPath': "images/croissant.png"
    //   },
    //   {
    //     'name': "Kebab",
    //     'price': 41,
    //     'id': 57,
    //     'idProduct': 57,
    //     'category': "postres",
    //     'imgPath': "images/kebab.png"
    //   },
    //   {
    //     'name': "Tarta de Huevo",
    //     'price': 41,
    //     'id': 98,
    //     'idProduct': 98,
    //     'category': "postres",
    //     'imgPath': "images/tartaHuevo.png"
    //   },
    //   {
    //     'name': "Tarta de Limon",
    //     'price': 25,
    //     'id': 99,
    //     'idProduct': 99,
    //     'category': "postres",
    //     'imgPath': "images/tartaLimon.png"
    //   },
    //   {
    //     'name': "Galletas",
    //     'price': 34,
    //     'id': 100,
    //     'idProduct': 100,
    //     'category': "postres",
    //     'imgPath': "images/galletas.png"
    //   },
    //   {
    //     'name': "Chocolates",
    //     'price': 32,
    //     'id': 101,
    //     'idProduct': 101,
    //     'category': "postres",
    //     'imgPath': "images/galletasChocolate.png"
    //   },
    //   {
    //     'name': "Tostadas",
    //     'price': 14,
    //     'id': 102,
    //     'idProduct': 102,
    //     'category': "postres",
    //     'imgPath': "images/tostada.png"
    //   },
    //   {
    //     'name': "Dish",
    //     'price': 32,
    //     'id': 58,
    //     'idProduct': 58,
    //     'category': "mariscos",
    //     'imgPath': "images/dish.png"
    //   },
    //   {
    //     'name': "Crayfish",
    //     'price': 32,
    //     'id': 59,
    //     'idProduct': 59,
    //     'category': "mariscos",
    //     'imgPath': "images/crayfish.png"
    //   },
    //   {
    //     'name': "Sushi Cantones",
    //     'price': 41,
    //     'id': 60,
    //     'idProduct': 60,
    //     'category': "mariscos",
    //     'imgPath': "images/sushiCantonese.png"
    //   },
    //   {
    //     'name': "Camaron",
    //     'price': 31,
    //     'id': 61,
    //     'idProduct': 61,
    //     'category': "mariscos",
    //     'imgPath': "images/shrimp.png"
    //   },
    //   {
    //     'name': "Cangrejo",
    //     'price': 41,
    //     'id': 62,
    //     'idProduct': 62,
    //     'category': "mariscos",
    //     'imgPath': "images/crab.png"
    //   },
    //   {
    //     'name': "Tempura",
    //     'price': 21,
    //     'id': 63,
    //     'idProduct': 63,
    //     'category': "mariscos",
    //     'imgPath': "images/tempura.png"
    //   },
    //   {
    //     'name': "Thai",
    //     'price': 11,
    //     'id': 64,
    //     'idProduct': 64,
    //     'category': "mariscos",
    //     'imgPath': "images/thai.png"
    //   },
    //   {
    //     'name': "Arroz Anguila",
    //     'price': 21,
    //     'id': 65,
    //     'idProduct': 65,
    //     'category': "mariscos",
    //     'imgPath': "images/eelRice.png"
    //   },
    //   {
    //     'name': "Domburi",
    //     'price': 17,
    //     'id': 66,
    //     'idProduct': 66,
    //     'category': "mariscos",
    //     'imgPath': "images/domburi.png"
    //   },
    //   {
    //     'name': "Kebab",
    //     'price': 25,
    //     'id': 67,
    //     'idProduct': 67,
    //     'category': "mariscos",
    //     'imgPath': "images/kebab.png"
    //   },
    // ];

    return Padding(
      padding: const EdgeInsets.only(
        left: 10.0,
        top: 1.0,
      ),
      child: Row(
        children: [
          LimitedBox(
            maxWidth: 350,
            child: BounceInLeft(
              duration: const Duration(seconds: 2),
              child: const ListCategory(),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 2,
                left: 10,
                bottom: 10,
              ),
              child: BounceInRight(
                // ignore: prefer_const_constructors
                duration: Duration(
                  seconds: 2,
                ),
                child: SizedBox(
                  width: width - 100,
                  height: height * 0.55,
                  child: GridView.builder(
                    itemCount: products.length,
                    // itemCount: category.category != "" ? 10 : products.length,
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: width > 700 ? 5 : 4,
                    ),
                    itemBuilder: (context, index) {
                      // if (category.category == "") {
                      return BuildCard(
                        name: products[index]['Descripcion'].toString(),
                        price: products[index]['PrecioVenta'].toString(),
                        id: products[index]['PrecioVenta'].toString(),
                        idProduct: products[index]['PrecioVenta'].toString(),
                        category: products[index]['PrecioVenta'].toString(),
                        imgPath: products[index]['imgPath'].toString(),
                      );
                      //  _buildCard(
                      //   products[index]['name'],
                      //   products[index]['price'],
                      //   products[index]['id'],
                      //   products[index]['idProduct'],
                      //   products[index]['category'],
                      //   products[index]['imgPath'],
                      //   context,
                      // );
                      // } else {
                      // List listCategory = products
                      //     .where((element) =>
                      //         element['category'] == category.category)
                      //     .toList();
                      // return _buildCard(
                      //   listCategory[index]['name'],
                      //   listCategory[index]['price'],
                      //   listCategory[index]['id'],
                      //   listCategory[index]['idProduct'],
                      //   listCategory[index]['category'],
                      //   listCategory[index]['imgPath'],
                      //   context,
                      // );
                      // }
                    },
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
