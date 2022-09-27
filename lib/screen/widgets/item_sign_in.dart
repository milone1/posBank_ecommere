import 'package:flutter/material.dart';
import 'package:posbank_flutter/screen/components/banner_title.dart';
import 'package:posbank_flutter/screen/components/canal_state.dart';
import 'package:posbank_flutter/screen/components/images.dart';
import 'package:posbank_flutter/screen/components/spacer.dart';

class ItemSignIn extends StatelessWidget {
  const ItemSignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width,
      height: height,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Images(
                width: width * 0.10,
                height: height * 0.10,
                path: 'images/infomatica.png',
              ),
            ],
          ),
          Images(
            width: width * 0.60,
            height: height * 0.30,
            path: 'images/logoRestaurante.png',
          ),

          const SpacerBox(),

          BannerTitle(
            width: width,
            size: 60,
            text: 'Realice aquí sus compras de manera rápida.',
          ),

          const SpacerBox(),

          CanalState(height: height, width: width),
          
          Padding(
            padding: const EdgeInsets.only(
              top: 200,
            ),
            child: BannerTitle(
              width: width,
              size: 10,
              text: "© Copyrigth 2022 by Infomatica",
            ),
          ),
        ],
      ),
    );
  }
}
