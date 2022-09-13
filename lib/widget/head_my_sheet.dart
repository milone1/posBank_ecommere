import 'package:flutter/material.dart';
class HeadmySheet extends StatelessWidget {
  const HeadmySheet({
    Key? key,
    required this.name,
    required this.imgPath,
    required this.context,
  }) : super(key: key);

  final String name;
  final String imgPath;
  final context;

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
              //* BackButton(),
              Image.asset(
                imgPath,
                height: 270,
                width: 270,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                name,
                style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFCC8053),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                width: width * 0.30,
                child: const Text(
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
                  maxLines: 6,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}