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
    return Row(children: [
      LimitedBox(
        maxWidth: 250,
        child: ListCategory(),
      ),
      Expanded(
          child: Container(
        margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
        child: GridView.count(
          crossAxisCount: height < 1000 ? 4 : 5,
          primary: false,
          crossAxisSpacing: 10.0,
          scrollDirection: Axis.horizontal,
          mainAxisSpacing: 15.0,
          childAspectRatio: 0.8,
          children: <Widget>[
            _buildCard(
                "Arroz Chaufa", 21, 1, 1, 1, "images/bacon.png", context),
            _buildCard(
                "Filete de Res", 18, 2, 2, 1, "images/fileteRes.png", context),
            _buildCard("Tocino", 14, 3, 3, 2, 'images/tocino.png', context),
            _buildCard("Sopa Ramen", 12, 4, 4, 2, 'images/soup.png', context),
            _buildCard("Sopa Todu", 11, 5, 5, 3, 'images/Todu.png', context),
            _buildCard("Pizza", 22, 6, 6, 4, 'images/pizza.png', context),
            _buildCard("Taco", 12, 7, 7, 5, 'images/taco.png', context),
            _buildCard(
                "Hamburguer", 14, 8, 8, 6, 'images/hamburguer.png', context),
            _buildCard(
                "Vino de Mesa", 11, 9, 9, 7, 'images/vinoMesa.png', context),
            _buildCard("Vodka", 10, 10, 10, 8, 'images/vodkaRojo.png', context),
            _buildCard("Sashimi", 13, 11, 11, 9, 'images/sashimi.png', context),
          ],
        ),
      )),
    ]);
  }

  Widget _buildCard(String name, int price, int id, int idProduct, int category,
      String imgPath, context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final cart = Provider.of<CartProvider>(context);
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
                initialPrice: 11,
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
          height: height * 0.5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
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
                  width: width * 0.9,
                  height: height * 0.11,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(imgPath), fit: BoxFit.contain)),
                ),
              ),
              SizedBox(
                height: 7.0,
              ),
              Text(
                name,
                style: TextStyle(
                  fontSize: 20,
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
                  height: height * 0.025,
                  width: width * 0.18,
                  child: Text(
                    's/' + price.toString() + '.00',
                    style: TextStyle(color: Color(0xFF575E67), fontSize: 20.0),
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
