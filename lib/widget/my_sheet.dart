import 'package:flutter/material.dart';
import 'package:posbank_flutter/widget/widgets.dart';


  mySheet(String name, String price, String id, String idProduct,
      String category, String imgPath, properties, context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(32),
        ),
      ),
      context: context,
      builder: (context) {
        return SizedBox(
          height: height * 0.45,
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: HeadmySheet(name: name, imgPath: imgPath),
                ),
                SizedBox(
                  width: width,
                  height: 70,
                  child: Center(
                    child: Properties(
                      properties: properties,
                    ),
                  ),
                ),
                GridMoreProducts(id: id),
                Container(
                  margin: EdgeInsets.only(
                    top: 15.0,
                  ),
                  child: AddToCart(
                    width: width,
                    name: name,
                    price: price,
                    id: id,
                    imgPath: imgPath,
                    idProduct: idProduct,
                    category: category,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }