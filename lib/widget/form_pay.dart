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
        SizedBox(
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
                padding: const EdgeInsets.only(
                  right: 40.0,
                  left: 40.0,
                  bottom: 40.0,
                ),
                child: Column(
                  children: const [
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
                padding: const EdgeInsets.only(
                  right: 40.0,
                  left: 40.0,
                  bottom: 40.0,
                ),
                child: Column(
                  children: const [
                    Text(
                      "Ingrese Nombre: ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    CupertinoTextField(
                      placeholder: 'Juan Perez',
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
        SizedBox(
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
              const SizedBox(
                height: 70,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 40.0,
                  left: 40.0,
                  bottom: 40.0,
                ),
                child: Column(
                  children: const [
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
