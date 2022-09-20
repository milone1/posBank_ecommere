// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
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
          _mySheet(widget.name, widget.price, widget.id, widget.idProduct,
              widget.category, widget.imgPath, context);
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
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    image: DecorationImage(
                        image: NetworkImage(widget.imgPath),
                        fit: BoxFit.contain),
                  ),
                ),
              ),
              Text(
                widget.name.toUpperCase(),
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 13,
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

  _mySheet(String name, String price, String id, String idProduct,
      String category, String imgPath, context) {
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
                HeadmySheet(name: name, imgPath: imgPath),

                Properties(),

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
        );
      },
    );
  }
}
