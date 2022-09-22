
import 'package:flutter/material.dart';
import 'package:posbank_flutter/provider/canal_provider.dart';

class CanalImage extends StatelessWidget {
  const CanalImage({
    Key? key,
    required this.canal,
    required this.width,
  }) : super(key: key);

  final CanalProvider canal;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          boxShadow: [  
            BoxShadow(
                color: Colors.grey.withOpacity(.8),
                blurRadius: 10.0,
                spreadRadius: 0.5,
                offset: Offset(5.0, 5.0))
          ]),
      child: Image.asset(
        canal.state == "ParaSalon" ? 'images/tray.png' : 'images/bug.png',
        width: width * 0.10,
      ),
    );
  }
}
