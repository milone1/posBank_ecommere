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
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(
                  right: 10.0,
                ),
                child: BackButtonIos()
              ),
              Container(
                  width: 220.0,
                  height: 220.0,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
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
                  name,
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
