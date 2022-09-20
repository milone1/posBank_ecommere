// ignore_for_file: file_names, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:posbank_flutter/provider/products_provider.dart';
import 'package:provider/provider.dart';

class ListCategory extends StatefulWidget {
  const ListCategory({Key? key}) : super(key: key);
  @override
  State<ListCategory> createState() => _ListCategoryState();
}

class _ListCategoryState extends State<ListCategory> {
  @override
  Widget build(BuildContext context) {
    final groups = Provider.of<ProductsProvider>(context).groups;
    double height = MediaQuery.of(context).size.height;
    final codigoProvider = Provider.of<ProductsProvider>(context);
    return SizedBox(
      width: 150,
      height: height * 0.50,
      child: ListWheelScrollView(
        physics: FixedExtentScrollPhysics(),
        onSelectedItemChanged: (index) => {
          codigoProvider.setCodigo(groups[index]['CodigoGrupo']),
          codigoProvider.setCategory(groups[index]['Descripcion']),
        },
        useMagnifier: true,
        magnification: 1.5,
        itemExtent: 100,
        children: <Widget>[
          ...groups.map(
            (group) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.only(bottom: 50, top: 30),
                  child: Text(
                    group['Descripcion'],
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 10,
                      color: Color(0xFFCC8053),
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
