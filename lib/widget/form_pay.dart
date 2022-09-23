import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormPay extends StatelessWidget {
  const FormPay({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: width * 0.35,
          height: height * 0.25,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "images/id.png",
                width: 300,
                height: 120,
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: 40.0,
                  left: 40.0,
                  bottom: 40.0,
                ),
                child: Column(
                  children: [
                    Text(
                      "Ingrese numero de DNI:",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    CupertinoTextField(
                      placeholder: '748 75 487',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: 40.0,
                  left: 40.0,
                  bottom: 40.0,
                ),
                child: Column(
                  children: [
                    Text(
                      "Ingrese Nombre: ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    CupertinoTextField(
                      placeholder: 'Javivi Gamarra',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: width * 0.10,
        ),
        Container(
          width: width * 0.35,
          height: height * 0.25,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "images/factura.png",
                width: 300,
                height: 120,
              ),
              SizedBox(
                height: 100,
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: 40.0,
                  left: 40.0,
                  bottom: 40.0,
                ),
                child: Column(
                  children: [
                    Text(
                      "Ingrese N° de R.U.C",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    CupertinoTextField(
                      placeholder: '111111111111',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
