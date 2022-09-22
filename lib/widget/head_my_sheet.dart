import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:posbank_flutter/widget/back_button_ios.dart';

class HeadmySheet extends StatelessWidget {
  const HeadmySheet(
    {Key? key, 
    required this.name, 
    required this.imgPath})
      : super(key: key);

  final String name;
  final String imgPath;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    print(imgPath);
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  width: 250.0,
                  height: 220.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      15.0
                    ),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: CachedNetworkImageProvider(
                            imgPath,
                    ),
                  ),
                ),
              ),
            ],
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: width * 0.50,
                child: Text(
                  name.toUpperCase(),
                  maxLines: 3,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFCC8053),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                width: width * 0.30,
                child: Text(
                  "Tiene sabor, obviamente, y podemos añadir "
                  "que tiene buen sabor, así que "
                  "probablemente resulta rico y apetitoso, "
                  "agradable y grato al paladar. "
                  "Puede estar bien sazonado, ser picante, "
                  "ácido, amargo, o podría ser dulce. ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                  maxLines: 10,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
