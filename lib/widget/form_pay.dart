import 'package:flutter/material.dart';
import 'package:posbank_flutter/provider/canal_provider.dart';
import 'package:provider/provider.dart';

class FormPay extends StatelessWidget {
  const FormPay({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    final user = Provider.of<CanalProvider>(context);


    final textControllerDNI = TextEditingController();
    final textControllerName = TextEditingController();
    final textControllerRUC = TextEditingController();

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
                  right: 20.0,
                  left: 20.0,
                  bottom: 20.0,
                ),
                child: Column(
                  children: [
                    Text(
                      "Ingrese numero de DNI:",
                      style: TextStyle(
                          color: user.user.length> 3 ? Colors.red: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    TextField(
                      onChanged: (value) => user.setUser(value),
                      controller: textControllerDNI,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 20.0,
                  left: 20.0,
                  bottom: 20.0,
                ),
                child: Column(
                  children: [
                    Text(
                      "Ingrese Nombre: ",
                      style: TextStyle(
                        color: user.user.length > 3 ? Colors.red: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    TextField(
                      onChanged: (value) => user.setUser(value),
                      controller: textControllerName,
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
                  children: [
                    Text(
                      "Ingrese N° de R.U.C",
                      style: TextStyle(
                        color: user.user.length > 3 ? Colors.red: Colors.black,
                          // color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    TextField(
                      onChanged: (value) => user.setUser(value),
                      controller: textControllerRUC,
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
