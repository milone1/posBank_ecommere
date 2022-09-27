// ignore_for_file: depend_on_referenced_packages
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:posbank_flutter/components/view_carrousel.dart';

class ListCarrousel extends StatelessWidget {
  const ListCarrousel({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width * 0.95,
      height: height * 0.20,
      child: ListView(
        children: <Widget>[
           const Padding(
            padding: EdgeInsets.all(1) 
          ),
          CarouselSlider(
            items: [

              ViewCarrousel(width: width, path: 'images/1.jpg'),

              ViewCarrousel(width: width, path: 'images/2.jpg'),

              ViewCarrousel(width: width, path: 'images/3.jpg'),

              ViewCarrousel(width: width, path: 'images/4.jpg'),

              ViewCarrousel(width: width, path: 'images/5.jpg'),

              ViewCarrousel(width: width, path: 'images/6.jpg'),

            ], 
            options: CarouselOptions(
              height: 210.0,
              autoPlay: true,
              autoPlayCurve: Curves.easeInOut,
              enlargeCenterPage: true,
              autoPlayInterval: const Duration(seconds: 3),
              scrollDirection: Axis.horizontal
            )
          )
        ],
      ),
    );
  }
}
