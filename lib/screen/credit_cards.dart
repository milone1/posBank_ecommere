import 'dart:convert';
import 'dart:ffi';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_usb_printer/flutter_usb_printer.dart';
import 'package:posbank_flutter/components/products.dart';
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
  List<Cart> minimal = [];

  @override
  initState() {
    getData();
    flutterUsbPrinter.connect(1155, 41014);
  }

  getData() async {
    List<Cart>? auxProd = await dbHelper?.getCartList();
    setState(() {
      minimal = auxProd!;
    });
  }

  _printer(cardNumber, cardHolder, total) async {
    String numero = cardNumber.toString();
    String nombre = cardHolder.toString();
    var data = Uint8List.fromList(utf8.encode("Productos Intereses Intereses Intereses Productos Intereses Intereses Intereses"));
    var productos = Uint8List.fromList(utf8.encode(cardHolder +"     :     " +cardNumber));
    await flutterUsbPrinter.printText("                                      \r\n");
    await flutterUsbPrinter.printText("                                      \r\n");
    await flutterUsbPrinter.printText("                                      \r\n");
    await flutterUsbPrinter.printText("                                      \r\n");
    await flutterUsbPrinter.printText("                                      \r\n");
    await flutterUsbPrinter.printText("+----------------------------------------+");
    await flutterUsbPrinter.printText("|              ACURIO-RESTAURANTS        |");
    await flutterUsbPrinter.printText("+----------------------------------------+");
    await flutterUsbPrinter.printText("                                      \r\n");
    await flutterUsbPrinter.printText("                                      \r\n");
    await flutterUsbPrinter.printText("PRODUCTOS:  CANTIDAD:  PRECIO_uni:  TOTAL:");
    await flutterUsbPrinter.printText("                                      \r\n");
    await flutterUsbPrinter.printText("                                      \r\n");
    for (int index = 0; index < minimal.length; index++) {
        await flutterUsbPrinter.printText(minimal[index].productName.toString()+":"+ "   "+minimal[index].quantity.toString()+"   "+"s/ "+minimal[index].initialPrice.toString()+".00"+"   "+"s/"+minimal[index].productPrice.toString()+".00"+'\r\n');
      }
    await flutterUsbPrinter.printText("                                      \r\n");
    await flutterUsbPrinter.printText("                                      \r\n");
    await flutterUsbPrinter.printText("+----------------------------------------+");
    await flutterUsbPrinter.printText("Nombre del Cliente:   $nombre         \r\n");
    await flutterUsbPrinter.printText('Numero De la Tarjeta: $numero         \r\n');
    await flutterUsbPrinter.printText("                                      \r\n");
    await flutterUsbPrinter.printText("                                      \r\n");
    await flutterUsbPrinter.printText('TOTAL:               s/ $total${0} \r\n');
    await flutterUsbPrinter.printText("                                      \r\n");
    await flutterUsbPrinter.printText("                                      \r\n");
    await flutterUsbPrinter.printText("                                      \r\n");
    await flutterUsbPrinter.printText("                                      \r\n");
    await flutterUsbPrinter.printText("                                      \r\n");
    await flutterUsbPrinter.printText("                                      \r\n");
    await flutterUsbPrinter.printText("                                      \r\n");
    await flutterUsbPrinter.printText("                                      \r\n");
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
          children: [
            SizedBox(
              height: 20,
            ),
            _buildCreditCard(
                height: height,
                color: Color(0xFF2DA1F4),
                cart: cart,
                cardExpiration: "15/2024",
                cardHolder: "JUAN JUANITO",
                cardNumber: "9584 6587 7412 5698"),
            OtherDetailsDivider(),
            Center(
              child: Container(
                child: Text(
                  "INGRESE SUS DATOS",
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
            
              ),
            ),
            OtherDetailsDivider(),
            Container(
              child: Column(
                children: [
                  Text("Titular de la tarjeta:"),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'E. Milan',
                    ),
                  ),
                ],
              ),
            ),
            OtherDetailsDivider(),
            Container(
              child: Column(
                children: [
                  Text("Número de la Tarjeta: "),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '9632 8524 4521 3625',
                    ),
                  ),
                ],
              ),
            ),
            OtherDetailsDivider(),
            Container(
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(4),
                      child: Column(
                        children: [
                          Text("Fecha de Vencimiento"),
                          TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '06/05',
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
                              labelText: '562',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            OtherDetailsDivider(),
            Container(
              width: 90,
              child: Padding(
                padding: EdgeInsets.all(250),
                child: InkWell(
                  onTap: () {
                    // _printer();
                    _printer("1234 1234 1234 1234", "Juan Perez",
                        cart.getTotalPrice());
                    Navigator.pushNamed(context, '/');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF2DA1F4),
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
              ),
            )
          ],
        ),
      ),
    );
  }

  InkWell _buildCreditCard({
    required Color color,
    required double height,
    required String cardNumber,
    required String cardHolder,
    required CartProvider cart,
    required String cardExpiration,
  }) {
    return InkWell(
      onTap: () {
        // print(height >= 800 ? 200 : 300);
        // _printer();
        _printer(cardNumber, cardHolder, cart.getTotalPrice());
        Navigator.pushNamed(context, '/');
      },
      child: Card(
        elevation: 4.0,
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        child: Container(
          height: (height < 1000 ? 200 : 300),
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
