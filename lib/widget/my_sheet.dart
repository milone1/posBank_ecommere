import 'package:flutter/material.dart';
import 'package:posbank_flutter/buttons/add_to_cart.dart';
import 'package:posbank_flutter/buttons/back_button_ios.dart';
import 'package:posbank_flutter/widget/grid_more_products.dart';
import 'package:posbank_flutter/widget/head_my_sheet.dart';
import 'package:posbank_flutter/widget/properties.dart';

mySheet(String name, String price, String id, String idProduct, String category,
    String imgPath, properties, context) {
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;

  showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
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
                padding: const EdgeInsets.all(10.0),
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
                margin: const EdgeInsets.only(
                  top: 15.0,
                ),
                child: Center(

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          margin: const EdgeInsets.only(
                            right: 10.0,
                          ),
                          child: const BackButtonIos()),
                      AddToCart(
                        width: width,
                        name: name,
                        price: price,
                        id: id,
                        imgPath: imgPath,
                        idProduct: idProduct,
                        category: category,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
