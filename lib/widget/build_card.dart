// ignore_for_file: must_be_immutable
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:posbank_flutter/widget/my_sheet.dart';

class BuildCard extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        onTap: () {
          mySheet(name, price, id, idProduct, category, imgPath, properties,
              context);
        },
        child: Padding(
          padding: const EdgeInsets.only(
            right: 2,
            left: 5,
          ),
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

                Container(
                  margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                  width: 150,
                  height: 110,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                    bottomLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                  )),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: CachedNetworkImage(
                          width: 150,
                          height: 110,
                          fit: BoxFit.fill,
                          imageUrl:imgPath,
                          placeholder: (context, url) =>  
                          Image.asset('images/loader.gif'), 
                        ),
                        // child: FadeInImage.assetNetwork(
                        //   width: 150,
                        //   height: 110,
                        //   imageScale: 1,
                        //   image: imgPath,
                        //   placeholder: 'images/loader.gif',
                        //   fit: BoxFit.fill,
                        // ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(
                    right: 10,
                    left: 10,
                  ),
                  child: Text(
                    name.toUpperCase(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFCC8053),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(
                    top: 6,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text(
                      'S/ $price',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
