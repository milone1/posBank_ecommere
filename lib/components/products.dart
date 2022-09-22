import 'package:flutter/material.dart';
//* animations
import 'package:animate_do/animate_do.dart';
import 'package:posbank_flutter/provider/provider.dart';
import 'package:posbank_flutter/widget/widgets.dart';
import 'package:provider/provider.dart';

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);
  @override
  State<Products> createState() => _ProductsState();

  void initState() {
    initState();
  }
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    final products =
        Provider.of<ProductsProvider>(context).products;

    final functions =
        Provider.of<ProductsProvider>(context);

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
              duration: Duration(seconds: 2),
              // child: ListCategory(onReload: () => functions.getGroup() ),
              child: ListCategory(),
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
                duration: Duration(
                  seconds: 2,
                ),
                child: SizedBox(
                  width: width - 100,
                  height: height * 0.55,
                  child: GridView.builder(
                    itemCount: products.length,
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                    ),
                    itemBuilder: (context, index) {
                      return BuildCard(
                        name: products[index]['Descripcion'].toString(),
                        price: products[index]['PrecioVenta'].toStringAsFixed(2).toString(),
                        id: products[index]['Codigo'].toString(),
                        idProduct: products[index]['Codigo'].toString(),
                        category: products[index]['Grupo'].toString(),
                        imgPath: products[index]['Surlimagen'].toString(),
                        properties: products[index]['Propiedades'],
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
