// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:posbank_flutter/widget/my_sheet.dart';
import 'package:posbank_flutter/widget/widgets.dart';

class BuildCard extends StatefulWidget {
  BuildCard(
      {Key? key,
      required this.name,
      required this.price,
      required this.id,
      required this.idProduct,
      required this.category,
      required this.imgPath,
      required this.properties})
      : super(key: key);

  final String name;
  final String price;
  final String id;
  final String idProduct;
  final String category;
  final String imgPath;
  List properties;

  @override
  State<BuildCard> createState() => _BuildCardState();
}

class _BuildCardState extends State<BuildCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: InkWell(
        onTap: () {
          mySheet(widget.name, widget.price, widget.id, widget.idProduct,
              widget.category, widget.imgPath, widget.properties, context);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                spreadRadius: 5,
                blurRadius: 7,
              ),
            ],
            color: Colors.white,
          ),
          child: Column(
            children: [
              Hero(
                tag: widget.id.toString(),
                child: Container(
                  margin: EdgeInsets.only(
                    top: 5,
                  ),
                  width: 120,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0),
                    ),
                    image: DecorationImage(
                        image: NetworkImage(widget.imgPath),
                        fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Text(
                widget.name.toUpperCase(),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFCC8053),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 6,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    '\$ ' + widget.price,
                    style: TextStyle(
                      color: Color(0xFF575E67),
                      fontSize: 15,
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

  // _mySheet(String name, String price, String id, String idProduct,
  //     String category, String imgPath, properties, context) {
  //   double width = MediaQuery.of(context).size.width;
  //   double height = MediaQuery.of(context).size.height;

  //   showModalBottomSheet(
  //     isScrollControlled: true,
  //     backgroundColor: Colors.white,
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.vertical(
  //         top: Radius.circular(32),
  //       ),
  //     ),
  //     context: context,
  //     builder: (context) {
  //       return SizedBox(
  //         height: height * 0.45,
  //         child: Center(
  //           child: Column(
  //             children: [
  //               Padding(
  //                 padding: EdgeInsets.all(10.0),
  //                 child: HeadmySheet(name: name, imgPath: imgPath),
  //               ),
  //               SizedBox(
  //                 width: width,
  //                 height: 70,
  //                 child: Center(
  //                   child: Properties(
  //                     properties: properties,
  //                   ),
  //                 ),
  //               ),
  //               GridMoreProducts(id: id),
  //               Container(
  //                 margin: EdgeInsets.only(
  //                   top: 15.0,
  //                 ),
  //                 child: AddToCart(
  //                   width: width,
  //                   name: name,
  //                   price: price,
  //                   id: id,
  //                   imgPath: imgPath,
  //                   idProduct: idProduct,
  //                   category: category,
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }
}
