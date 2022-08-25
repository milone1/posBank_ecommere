import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:posbank_flutter/provider/cart_provider.dart';
import 'package:posbank_flutter/utils/category.dart';
import 'package:provider/provider.dart';

class ListCategory extends StatefulWidget {
  @override
  State<ListCategory> createState() => _ListCategoryState();
}

class _ListCategoryState extends State<ListCategory> {
  @override
  Widget build(BuildContext context) {
    var categorySelected = '';
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Provider.of<CartProvider>(context);
    return Container(
      width: 150,
      height: height * 0.50,
      child: Container(
          child: ListWheelScrollView(
        onSelectedItemChanged: (index) {
          setState(() {
            categorySelected = categoriesList[index].value;
          });
          print(categoriesList[index].value);
          print('seteado $categorySelected');
        },
        physics: FixedExtentScrollPhysics(),
        itemExtent: 100,
        useMagnifier: true,
        magnification: 1.5,
        children: [
          ...List.generate(
            categoriesList.length,
            (index) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  categoriesList[index].imagen,
                  width: 50,
                  height: 50,
                ),
                Text(
                  categoriesList[index].title,
                  style: TextStyle(
                    fontSize: 10,
                    color: Color(0xFFCC8053),
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
