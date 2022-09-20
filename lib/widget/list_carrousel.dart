// ignore_for_file: depend_on_referenced_packages
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
//* providers
import 'package:posbank_flutter/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class ListCarrousel extends StatelessWidget {
  const ListCarrousel({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Provider.of<CartProvider>(context);
    return SizedBox(
      width: width * 0.75,
      height: height * 0.20,
      child: ListView(
        children: <Widget>[
           Padding(
            padding: EdgeInsets.all(1) 
          ),
          CarouselSlider(
            items: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15)
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38,
                      offset: Offset(2.0,2.0),
                      blurRadius: 3.0,
                      spreadRadius: 2.0
                    )
                  ],
                  image: DecorationImage(
                    image: AssetImage(
                      "images/1.jpg"
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15)
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38,
                      offset: Offset(2.0,2.0),
                      blurRadius: 3.0,
                      spreadRadius: 2.0
                    )
                  ],
                  image: DecorationImage(
                    image: AssetImage(
                      "images/2.jpg"
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15)
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38,
                      offset: Offset(2.0,2.0),
                      blurRadius: 3.0,
                      spreadRadius: 2.0
                    )
                  ],
                  image: DecorationImage(
                    image: AssetImage(
                      "images/3.jpg"
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15)
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38,
                      offset: Offset(2.0,2.0),
                      blurRadius: 3.0,
                      spreadRadius: 2.0
                    )
                  ],
                  image: DecorationImage(
                    image: AssetImage(
                      "images/4.jpg"
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ], 
            options: CarouselOptions(
              height: 210.0,
              autoPlay: true,
              autoPlayCurve: Curves.easeInOut,
              enlargeCenterPage: true,
              autoPlayInterval: Duration(seconds: 3),
              scrollDirection: Axis.horizontal
            )
          )
        ],
      ),
    );
  }
}
