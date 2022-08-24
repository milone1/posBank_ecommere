import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class ListAdd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return ListWheelScrollView(itemExtent: 250, children: [
      _buildCard(
          1, "Rodajas de Cebollas", "S/2.20", "images/cebollas.png", context),
      _buildCard(2, "Pieza de Chuleta", "S/15.00", "images/carne.png", context),
      _buildCard(3, "Queso", "S/17.00", "images/queso.png", context),
      _buildCard(
          4, "Champiñones", "S/21.50", "images/champiñones.png", context),
    ]);
  }

  Widget _buildCard(int id, String name, String price, String imagen, context) {
    int _value = 0;
    return Container(
      height: 500,
      padding: EdgeInsets.only(left: 32),
      child: Swiper(
        itemCount: 4,
        itemWidth: MediaQuery.of(context).size.width - 2 * 64,
        layout: SwiperLayout.STACK,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Card(
                    color: Colors.white,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 100,
                        ),
                        Text(
                          "asdasddas",
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 44,
                            color: const Color(0xff47455f),
                            fontWeight: FontWeight.w900,
                          ),
                          textAlign: TextAlign.left,
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
