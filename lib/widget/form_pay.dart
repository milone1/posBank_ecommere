import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:posbank_flutter/provider/canal_provider.dart';
import 'package:provider/provider.dart';

class FormPay extends StatelessWidget {
  const FormPay({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    final textControllerDNI = TextEditingController();
    final textControllerName = TextEditingController();
    final textControllerRUC = TextEditingController();

    return Padding(
      padding: const EdgeInsets.only(
        top: 100.0,
        bottom: 50.0
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    offset: const Offset(3, 3),
                    spreadRadius: 8,
                    blurRadius: 8,
                  ),
                ],
                color: const Color(0xff0099DD),
                border: Border.all(
                  color: Colors.black,
                ),
              ),
            width: width * 0.35,
            height: height * 0.10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    showCupertinoDialog(
                      context: context,
                      builder: (_) {
                        return CupertinoAlertDialog(
                          title: const Text('Boleta'),
                          content: Column(
                            children: const <Widget>[
                              Text('Ingrese su nombre: '),
                              CupertinoTextField(
                                placeholder: 'Juan Perez',
                              ),
                              SizedBox(
                                height: 50.0,
                              ),
                              Text('Ingrese su número de D.N.I: '),
                              CupertinoTextField(
                                placeholder: '96857454',
                              ),
                            ],
                          ),
                          actions: <Widget>[
                            CupertinoDialogAction(
                              isDefaultAction: true,
                              child: const Text('Pagar'),
                              onPressed: () {
                                print("Save");
                              },
                            ),
                            CupertinoDialogAction(
                              isDestructiveAction: true,
                              child: const Text('Salir'),
                              onPressed: () {
                                Navigator.pop(context);
                                print("Out");
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Image.asset(
                    "images/id.png",
                    width: 300,
                    height: 120,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: width * 0.10,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    offset: const Offset(3, 3),
                    spreadRadius: 8,
                    blurRadius: 8,
                  ),
                ],
                color: const Color(0xff0099DD),
                border: Border.all(
                  color: Colors.black,
                ),
              ),
            width: width * 0.35,
            height: height * 0.10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    showCupertinoDialog(
                      context: context,
                      builder: (_) {
                        return CupertinoAlertDialog(
                          title: const Text('Boleta'),
                          content: Column(
                            children: const <Widget>[
                              Text('Ingrese su nombre: '),
                              CupertinoTextField(
                                placeholder: 'Juan Perez',
                              ),
                              SizedBox(
                                height: 50.0,
                              ),
                              Text('Ingrese su número de R.U.C: '),
                              CupertinoTextField(
                                placeholder: '1111111111',
                              ),
                            ],
                          ),
                          actions: <Widget>[
                            CupertinoDialogAction(
                              isDefaultAction: true,
                              child: const Text('Pagar'),
                              onPressed: () {
                                print("Save");
                              },
                            ),
                            CupertinoDialogAction(
                              isDestructiveAction: true,
                              child: const Text('Salir'),
                              onPressed: () {
                                Navigator.pop(context);
                                print("Out");
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Image.asset(
                    "images/factura.png",
                    width: 300,
                    height: 120,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
