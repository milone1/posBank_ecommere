import 'package:flutter/material.dart';
//* animations
import 'package:animate_do/animate_do.dart';
import 'package:posbank_flutter/provider/provider.dart';
import 'package:posbank_flutter/widget/widgets.dart';
import 'package:provider/provider.dart';
class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductsProvider>(context).products;
    final category = Provider.of<CategoryProvider>(context);
    
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
                duration: const Duration(
                  seconds: 2,
                ),
                child: SizedBox(
                  width: width - 100,
                  height: height * 0.55,
                  child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: category.codigoGroup == ''
                        ? products.length
                        : products
                            .where((element) =>
                                element['Grupo'] == category.codigoGroup)
                            .length,
                    scrollDirection: Axis.horizontal,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                    ),
                    itemBuilder: (context, index) {
                      if (category.codigoGroup == '') {
                        return BuildCard(
                          name: products[index]['Descripcion'].toString(),
                          price: products[index]['PrecioVenta']
                              .toStringAsFixed(2)
                              .toString(),
                          id: products[index]['Codigo'].toString(),
                          idProduct: products[index]['Codigo'].toString(),
                          category: products[index]['Grupo'].toString(),
                          imgPath: products[index]['Surlimagen'].toString(),
                          properties: products[index]['Propiedades'],
                        );
                      } else {
                        var newList = products
                            .where((element) =>
                                element['Grupo'] == category.codigoGroup)
                            .toList();

                        return BuildCard(
                          name: newList[index]['Descripcion'].toString(),
                          price: newList[index]['PrecioVenta']
                              .toStringAsFixed(2)
                              .toString(),
                          id: newList[index]['Codigo'].toString(),
                          idProduct: newList[index]['Codigo'].toString(),
                          category: newList[index]['Grupo'].toString(),
                          imgPath: newList[index]['Surlimagen'].toString(),
                          properties: newList[index]['Propiedades'],
                        );
                      }
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
