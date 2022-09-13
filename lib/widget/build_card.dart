import 'package:flutter/material.dart';
import 'package:posbank_flutter/widget/widgets.dart';

class BuildCard extends StatelessWidget {
   const BuildCard({
    Key? key,
    required this.name, 
    required this.price, 
    required this.id, 
    required this.idProduct, 
    required this.category, 
    required this.imgPath,
  }) : super(key: key);

  //* final String name;
  final String name; 
  final int price;
  final int id; 
  final int idProduct;
  final String category; 
  final String imgPath; 

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        onTap: () {
          _mySheet(name, price, id, idProduct, category, imgPath, context);
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
                tag: id.toString(),
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(imgPath), fit: BoxFit.contain),
                  ),
                ),
              ),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFCC8053),
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
                  child: const Text(
                    'S/.00',
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
  _mySheet(String name, int price, int id, int idProduct, String category,
      String imgPath, context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    const carnes = [
      "Sellado",
      "Rojo Ingles",
      "Termino Medio",
      "Tres Cuartos",
      "Bien Cocido",
    ];

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
                DropdownButton(
                  items: carnes.map((String a) {
                    return DropdownMenuItem(
                      value: a,
                      child: Row(
                        children: [
                          Checkbox(value: false, onChanged: (_) {}),
                          Text(a),
                        ],
                      ),
                    );
                  }).toList(),
                  onChanged: (_) {},
                  hint: const Text("Especificaciones"),
                ),
                //* Boton Agregar
                AddToCart(width: width),
              ],
            ),
          ),
        );
      },
    );
  }
}
