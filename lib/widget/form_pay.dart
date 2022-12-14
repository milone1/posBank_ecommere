import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:posbank_flutter/components/cards_pay.dart';
class FormPay extends StatelessWidget {
  const FormPay({super.key});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(top: 100.0, bottom: 50.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CardPage(
            width: width, 
            height: height, 
            imgPath: "images/id.png", 
            textPay: 'Ingrese N° de D.N.I:', 
            textTitle: 'Ingrese su Nombre', 
            title: 'Boleta',
          ),
          SizedBox(
            width: width * 0.10,
          ),
          CardPage(
            width: width, 
            height: height, 
            imgPath: "images/factura.png", 
            textPay: 'Ingrese N° de R.U.C:', 
            textTitle: 'Ingrese su Nombre', 
            title: 'Factura',
          ),
        ],
      ),
    );
  }
}
