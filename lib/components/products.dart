// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
//* animations
import 'package:animate_do/animate_do.dart';
import 'package:posbank_flutter/model/order_model.dart';
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
    final products = Provider.of<ProductsProvider>(context).products;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
                      // return Text("asd");
                      return BuildCard(
                        name: products[index]['Descripcion'].toString(),
                        price: products[index]['PrecioVenta'].toString(),
                        id: products[index]['Codigo'].toString(),
                        idProduct: products[index]['Codigo'].toString(),
                        category: products[index]['Grupo'].toString(),
                        imgPath: products[index]['Surlimagen'].toString(),
                      );
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
