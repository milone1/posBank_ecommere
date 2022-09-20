import 'package:flutter/material.dart';

class GridMoreProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    List<dynamic> moreProducts = [
      {
        'id': 1,
        'title': 'Galletas de Chocolate',
        'price': 12,
        'images': 'images/galletasChocolate.png'
      },
      {'id': 2, 'title': 'Maotai', 'price': 12, 'images': 'images/maotai.png'},
      {'id': 3, 'title': 'Cecina', 'price': 12, 'images': 'images/cecina.png'},
      {
        'id': 4,
        'title': 'Carne molida',
        'price': 12,
        'images': 'images/carneMolida.png'
      },
      {
        'id': 5,
        'title': 'Parrilla de carne',
        'price': 12,
        'images': 'images/parrillaCarne.png'
      },
      {'id': 6, 'title': 'Cebolla', 'price': 12, 'images': 'images/onion.png'},
      {
        'id': 7,
        'title': 'Croissant',
        'price': 12,
        'images': 'images/croissant.png'
      },
      {'id': 8, 'title': 'Kebab', 'price': 12, 'images': 'images/kebab.png'},
      {
        'id': 9,
        'title': 'Rebanada de Queso',
        'price': 12,
        'images': 'images/cheese.png'
      },
      {
        'id': 10,
        'title': 'Chocolate',
        'price': 12,
        'images': 'images/chocolate.png'
      },
      {
        'id': 11,
        'title': 'Filete de Res',
        'price': 12,
        'images': 'images/fileteRes.png'
      },
      {
        'id': 12,
        'title': 'Champiñones',
        'price': 12,
        'images': 'images/champiñones.png'
      },
    ];

    return SizedBox(
      width: width,
      height: height * 0.15,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: moreProducts.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
        ),
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(1.0),
            child: InkWell(
              onTap: () {

              },
              child: Container(
                margin: EdgeInsets.only(
                  right: 10.0,
                  top: 7.0,
                  bottom: 7.0
                ),
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
                      tag: moreProducts[index]['id'].toString(),
                      child: Image.asset(
                        moreProducts[index]['images'],
                        width: 120,
                        height: 120,
                      ),
                    ),
                    Text(
                      moreProducts[index]['title'],
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
                          '\$ ' + moreProducts[index]['price'].toString(),
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
        },
      ),
    );
  }
}
