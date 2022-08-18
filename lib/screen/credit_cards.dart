import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_usb_printer/flutter_usb_printer.dart';
import 'package:posbank_flutter/db/db_helper.dart';
import 'package:posbank_flutter/model/cart_model.dart';
import 'package:posbank_flutter/provider/cart_provider.dart';
import 'package:posbank_flutter/widget/otherDetailsDivider.dart';
import 'package:provider/provider.dart';

class CreditCardsPage extends StatefulWidget {
  @override
  _CreditCardsPageState createState() => _CreditCardsPageState();
}

class _CreditCardsPageState extends State<CreditCardsPage> {
  FlutterUsbPrinter flutterUsbPrinter = FlutterUsbPrinter();
  bool connected = false;
  DBHelper? dbHelper = DBHelper();

  @override
  initState() {
    flutterUsbPrinter.connect(1155, 41014);
  }

  _printer(cardNumber, cardHolder) async {
    String numero = cardNumber.toString();
    String nombre = cardHolder.toString();
    try {
      await flutterUsbPrinter
          .printText("                                    \r\n");
      await flutterUsbPrinter
          .printText("                                    \r\n");
      await flutterUsbPrinter
          .printText("                                    \r\n");
      await flutterUsbPrinter
          .printText("                                    \r\n");
      await flutterUsbPrinter
          .printText("                ACURIO              \r\n");
      await flutterUsbPrinter.printText("                              \r\n");
      await flutterUsbPrinter
          .printText("PRODUCTOS: CANTIDAD: PRECIO_uni: TOTAL:\r\n");
      await flutterUsbPrinter.printText("                              \r\n");
      await flutterUsbPrinter
          .printText("Arroza Chauda    1  s/14.50  s/14.50\r\n");
      await flutterUsbPrinter
          .printText("Pierna de Pollo  2  s/14.50  s/29.00\r\n");
      await flutterUsbPrinter
          .printText("Ceviche          1  s/14.50  s/14.50\r\n");
      await flutterUsbPrinter
          .printText("Vino de Mesa     1  s/14.50  s/14.50\r\n");
      await flutterUsbPrinter
          .printText("Agua de Mesa     1  s/12.00  s/12.00\r\n");
      await flutterUsbPrinter
          .printText("Chocolate        1  s/11.50  s/11.50\r\n");
      await flutterUsbPrinter
          .printText("Helado           1  s/10.50  s/10.50\r\n");
      await flutterUsbPrinter
          .printText("Pizza            1  s/15.00  s/15.00\r\n");
      await flutterUsbPrinter
          .printText("Sashimi          1  s/14.50  s/14.50\r\n");
      await flutterUsbPrinter
          .printText("Tocino           1  s/14.50  s/14.50\r\n");
      await flutterUsbPrinter
          .printText("Taco             1  s/13.50  s/13.50\r\n");
      await flutterUsbPrinter.printText("                              \r\n");
      await flutterUsbPrinter.printText("                              \r\n");
      await flutterUsbPrinter.printText("                              \r\n");
      await flutterUsbPrinter.printText("Nombre del Cliente    $nombre \r\n");
      await flutterUsbPrinter.printText('Numero De la Tarjeta: $numero \r\n');
      await flutterUsbPrinter.printText("                              \r\n");
      await flutterUsbPrinter.printText("                              \r\n");
      await flutterUsbPrinter.printText("TOTAL:              S/310.00  \r\n");
      await flutterUsbPrinter.printText("                              \r\n");
      await flutterUsbPrinter.printText("                              \r\n");
    } on PlatformException {
      //response = 'Failed to get platform version.';
    }
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            _buildCreditCard(
                height: height,
                color: Color(0xFF2DA1F4),
                cardExpiration: "15/2024",
                cardHolder: "JUAN JUANITO",
                cardNumber: "4444 4444 4444 4444"),
            OtherDetailsDivider(),
            Container(
              child: Text("Ingrese los datos de Pago"),
            ),
            OtherDetailsDivider(),
            Container(
              child: Column(
                children: [
                  Text("Titular de la tarjeta"),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Ej E. Milan',
                    ),
                  ),
                ],
              ),
            ),
            OtherDetailsDivider(),
            Container(
              child: Column(
                children: [
                  Text("Titular de la tarjeta"),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'xxxx xxxx xxxx xxxx',
                    ),
                  ),
                ],
              ),
            ),
            OtherDetailsDivider(),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(4),
                    child: Column(
                      children: [
                        Text("Fecha d Vencimiento"),
                        TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'MM/YY',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(4),
                    child: Column(
                      children: [
                        Text("CVV"),
                        TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'EJ. 123',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            OtherDetailsDivider(),
            Padding(
              padding: EdgeInsets.all(20),
              child: InkWell(
                onTap: () {
                  _printer("1234 1234 1234 1234", "Juan Perez");
                },
                child: Container(
                  width: 10,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Color(0xFF2DA1F4),
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(color: Colors.grey, spreadRadius: 3),
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "PAGAR",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  InkWell _buildCreditCard(
      {required Color color,
      required double height,
      required String cardNumber,
      required String cardHolder,
      required String cardExpiration}) {
    return InkWell(
      onTap: () {
        print(height >= 800 ? 200 : 300);
        _printer(cardNumber, cardHolder);
      },
      child: Card(
        elevation: 4.0,
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        child: Container(
          height: (height < 1000? 200 : 300),
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 22.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _buildLogosBlock(),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  '$cardNumber',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                      fontFamily: 'CourrierPrime'),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _buildDetailsBlock(
                    label: 'CARDHOLDER',
                    value: cardHolder,
                  ),
                  _buildDetailsBlock(
                      label: 'VALID THRU', value: cardExpiration),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Build the top row containing logos
  Row _buildLogosBlock() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Image.asset(
          "images/contact_less.png",
          height: 20,
          width: 18,
        ),
        Text(
          "BANCO BBVA",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        Image.asset(
          "images/mastercard.png",
          height: 50,
          width: 50,
        ),
      ],
    );
  }

// Build Column containing the cardholder and expiration information
  Column _buildDetailsBlock({required String label, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '$label',
          style: TextStyle(
              color: Colors.grey, fontSize: 9, fontWeight: FontWeight.bold),
        ),
        Text(
          '$value',
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  Text _title({required String title}) {
    return Text(
      '$title',
      style: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.w800,
        decoration: TextDecoration.underline,
      ),
      textAlign: TextAlign.center,
    );
  }
}
