import 'package:flutter/material.dart';
import 'package:posbank_flutter/db/db_helper.dart';
import 'package:posbank_flutter/model/cart_model.dart';
import 'package:posbank_flutter/provider/cart_provider.dart';
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
      ),
      child: Row(
        children: [
          LimitedBox(
            maxWidth: 350,
            child: ListCategory(),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: 10,
                bottom: 10,
              ),
              child: Container(
                width: width - 100,
                height: height * 0.65,
                child: GridView.count(
                  crossAxisCount: 4,
                  scrollDirection: Axis.horizontal,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 20,
                  children: <Widget>[
                    _buildCard("Arroz Chaufa", 21, 1, 1, 1, "images/bacon.png", context),
                    _buildCard("Filete de Res", 18, 2, 2, 1, "images/fileteRes.png", context),
                    _buildCard("Tocino", 14, 3, 3, 2, 'images/tocino.png', context),
                    _buildCard("Sopa Ramen", 12, 4, 4, 2, 'images/soup.png', context),
                    _buildCard("Sopa Todu", 11, 5, 5, 3, 'images/Todu.png', context),
                    _buildCard("Pizza", 22, 6, 6, 4, 'images/pizza.png', context),
                    _buildCard("Taco", 12, 7, 7, 5, 'images/taco.png', context),
                    _buildCard("Hamburguer", 14, 8, 8, 6, 'images/hamburguer.png', context),
                    _buildCard("Vino de Mesa", 11, 9, 9, 7, 'images/vinoMesa.png',context),
                    _buildCard("Vodka", 10, 10, 10, 8, 'images/vodkaRojo.png', context),
                    _buildCard("Sashimi", 13, 11, 11, 9, 'images/sashimi.png', context),
                    _buildCard("Helado", 13, 12, 12, 10, 'images/sashimi.png', context),
                  ],
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
    final cart = Provider.of<CartProvider>(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {
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
              .then((value) {
            cart.addTotalPrice(double.parse(price.toString()));
            cart.addCounter();

            final snackBar = SnackBar(
              backgroundColor: Colors.green,
              content: Text('Producto agregado correctamente'),
              duration: Duration(seconds: 1),
            );

            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }).onError((error, stackTrace) {
            print("error" + error.toString());
            final snackBar = SnackBar(
                backgroundColor: Colors.red,
                content: Text('El producto ya existe en el carrito'),
                duration: Duration(seconds: 1));

            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          });
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  spreadRadius: 3.0,
                  blurRadius: 5.0),
            ],
            color: Colors.white,
          ),
          child: Column(
            children: [
              Hero(
                tag: imgPath,
                child: Container(
                  width: 150,
                  height: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(imgPath), fit: BoxFit.contain),
                  ),
                ),
              ),
              Text(
                name,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(
                    (0xFFCC8053),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color(0xFFEBEBEB),
                  ),
                  child: Text(
                    's/' + price.toString() + '.00',
                    style: TextStyle(
                      color: Color(0xFF575E67), 
                      fontSize: 25.0
                      ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
