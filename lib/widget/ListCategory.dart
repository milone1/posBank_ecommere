// ignore_for_file: file_names, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:posbank_flutter/provider/cart_provider.dart';
import 'package:posbank_flutter/utils/category.dart';
import 'package:provider/provider.dart';

class ListCategory extends StatefulWidget {
  const ListCategory({Key? key}) : super(key: key);
  @override
  State<ListCategory> createState() => _ListCategoryState();
}

class _ListCategoryState extends State<ListCategory> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    final categoriesInfo = Provider.of<CartProvider>(context);
    return SizedBox(
      width: 150,
      height: height * 0.50,
      child: ListWheelScrollView(
        
        physics: const FixedExtentScrollPhysics(),
        onSelectedItemChanged: (index) => {
          //* funcion set  category in provider on change in list view
          setState(
              () => {categoriesInfo.setCategory(categoriesList[index].value)})
        },
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
                  style: const TextStyle(
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
      ),
    );
  }
}
