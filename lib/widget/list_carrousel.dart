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
      width: width * 0.95,
      height: height * 0.20,
      child: ListView(
        children: <Widget>[
           const Padding(
            padding: EdgeInsets.all(1) 
          ),
          CarouselSlider(
            items: [
              Container(
                decoration: const BoxDecoration(
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
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    width: width * 0.90,
                    'images/1.jpg',
                    fit: BoxFit.cover,
                
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
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
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    width: width * 0.90,
                    'images/2.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
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
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    width: width * 0.90,
                    'images/3.jpg',
                    fit: BoxFit.cover,
                
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
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
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    width: width * 0.90,
                    'images/4.jpg',
                    fit: BoxFit.cover,
                
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
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
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    width: width * 0.90,
                    'images/5.jpg',
                    fit: BoxFit.cover,
                
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15)
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black38,
                      offset: Offset(2.0,2.0),
                      blurRadius: 3.0,
                      spreadRadius: 2.0
                    )
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    width: width * 0.90,
                    'images/6.jpg',
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
              autoPlayInterval: const Duration(seconds: 3),
              scrollDirection: Axis.horizontal
            )
          )
        ],
      ),
    );
  }
}
