import 'package:flutter/material.dart';
import 'package:posbank_flutter/screen/screens.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(.8),
                    blurRadius: 10.0,
                    spreadRadius: 0.5,
                    offset: const Offset(5.0, 5.0)),
              ],
            ),
            child: FloatingActionButton(
                backgroundColor: Colors.blue,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back_ios)),
          ),
        ),
        SizedBox(
          width: width > 700 ? width * 0.15 : width * 0.10,
        ),
        const Text(
          "RESUMEN DE TU ORDEN: ",
          style: TextStyle(
            color: Color(0xFFCC8053),
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
