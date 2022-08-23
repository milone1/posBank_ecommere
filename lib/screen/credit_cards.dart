import 'dart:convert';
import 'dart:ffi';
import 'dart:typed_data';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_usb_printer/flutter_usb_printer.dart';
import 'package:posbank_flutter/components/products.dart';
import 'package:posbank_flutter/db/db_helper.dart';
import 'package:posbank_flutter/model/cart_model.dart';
import 'package:posbank_flutter/provider/cart_provider.dart';
import 'package:posbank_flutter/widget/carrousel.dart';
import 'package:posbank_flutter/widget/otherDetailsDivider.dart';
import 'package:provider/provider.dart';
import 'package:animate_do/animate_do.dart';

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
    await flutterUsbPrinter.printText("                                      \r\n");
    await flutterUsbPrinter.printText("                                      \r\n");
    await flutterUsbPrinter.printText("                                      \r\n");
    await flutterUsbPrinter.printText("                                      \r\n");
    await flutterUsbPrinter.printText("                                      \r\n");
    await flutterUsbPrinter.printText("+----------------------------------------+\r\n");
    await flutterUsbPrinter.printText("|              ACURIO-RESTAURANTS        |\r\n");
    await flutterUsbPrinter.printText("+----------------------------------------+\r\n");
    await flutterUsbPrinter.printText("                                      \r\n");
    await flutterUsbPrinter.printText("                                      \r\n");
    await flutterUsbPrinter.printText("PRODUCTOS:  CANTIDAD:  PRECIO_uni:  TOTAL:\r\n");
    await flutterUsbPrinter.printText("                                      \r\n");
    await flutterUsbPrinter.printText("                                      \r\n");
    for (int index = 0; index < minimal.length; index++) {
      String? productoName = minimal[index].productName;
      int? productoCantidad = minimal[index].quantity;
      await flutterUsbPrinter.printText(
          (productoName!+"                       ").substring(0, 15) +
              productoCantidad.toString() +
              "     " +
              "s/ " +
              minimal[index].initialPrice.toString() +
              ".00" +
              "     " +
              "s/" +
              minimal[index].productPrice.toString() +
              ".00" +
              '\r\n');
    }
    await flutterUsbPrinter.printText("                                      \r\n");
    await flutterUsbPrinter.printText("                                      \r\n");
    await flutterUsbPrinter.printText("                                      \r\n");
    await flutterUsbPrinter.printText("                                      \r\n");
    await flutterUsbPrinter.printText("+----------------------------------------+");
    await flutterUsbPrinter.printText('|   TOTAL:                 s/$total 0    |\r\n');
    await flutterUsbPrinter.printText("+----------------------------------------+");
    await flutterUsbPrinter.printText("                                      \r\n");
    await flutterUsbPrinter.printText("                                      \r\n");
    await flutterUsbPrinter.printText("------------------------------------------");
    await flutterUsbPrinter.printText("Nombre del Cliente:   $nombre         \r\n");
    await flutterUsbPrinter.printText('Numero De la Tarjeta: $numero         \r\n');
    await flutterUsbPrinter.printText("                                      \r\n");
    await flutterUsbPrinter.printText("                                      \r\n");
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
        color: Color(0xFFEBEBEB),
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              child: Column(
                children: [
                  ListCarrousel(),
                ],
              ),
            ),
            SizedBox(
              width: 50.0,
            ),
            BounceInLeft(
              child: Text(
                "¡INCREÍBLES OFERTAS!",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 50,
                  color: Color(0xFFCC8053),
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              duration: Duration(
                seconds: 1,
              ),
            ),
            _buildCreditCard(
                height: height,
                color: Color(0xFF2DA1F4),
                cart: cart,
                cardExpiration: "06/05",
                cardHolder: "E. MILAN",
                cardNumber: "4754 6587 7412 5698"),
            OtherDetailsDivider(),
            BounceInRight(
              child: Center(
                child: Container(
                  child: Text(
                    "INGRESE SUS DATOS:",
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Color(0xFFCC8053),
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              duration: Duration(
                seconds: 1,
              ),
            ),
            OtherDetailsDivider(),
            BounceInLeft(
              child: Container(
                child: Column(
                  children: [
                    Text(
                      "Titular de la tarjeta:",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFFCC8053),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      width: width * 0.50,
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'E. Milan',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              duration: Duration(
                seconds: 1,
              ),
            ),
            OtherDetailsDivider(),
            BounceInRight(
              child: Container(
                child: Column(
                  children: [
                    Text(
                      "Número de la Tarjeta: ",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFFCC8053),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      width: width * 0.50,
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: '4754 6587 7412 5698',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              duration: Duration(
                seconds: 1
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
                            BounceInUp(
                              child: Text(
                                "Fecha de Vencimiento:",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xFFCC8053),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            BounceInLeft(
                              child: TextFormField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  border: UnderlineInputBorder(),
                                  labelText: '06/05',
                                ),
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
                            BounceInUp(
                              child: Text(
                                "CVV:",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xFFCC8053),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            BounceInRight(
                              child: TextFormField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  border: UnderlineInputBorder(),
                                  labelText: '562',
                                ),
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
            Swing(
              child: Container(
                width: 90,
                child: Padding(
                  padding: EdgeInsets.only(left: 250, right: 250, top: 50),
                  child: InkWell(
                    onTap: () {
                        _printer("4754 6587 7412 5698", "E. MILAN", cart.getTotalPrice());
                        Navigator.pushNamed(context, '/');
                    },
                    child: Container(
                      height: 35,
                      decoration: BoxDecoration(
                        color: Color(0xFF2DA1F4),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3), 
                            spreadRadius: 5,
                            blurRadius: 7,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "PAGAR:",
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
              ),
            ),
          ],
        ),
      ),
    );
  }

  Spin _buildCreditCard({
    required Color color,
    required double height,
    required String cardNumber,
    required String cardHolder,
    required CartProvider cart,
    required String cardExpiration,
  }) {
    return Spin(
      child: InkWell( 
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
            padding: const EdgeInsets.only(
                left: 16.0, right: 16.0, bottom: 22.0, top: 5),
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
          height: 30,
          width: 28,
        ),
        Text(
          "BANCO BBVA",
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        Image.asset(
          "images/mastercard.png",
          height: 70,
          width: 70,
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
              color: Color(0xFFCACACA), 
              fontSize: 15, 
              fontWeight: FontWeight.bold
          ),
        ),
        Text(
          '$value',
          style: TextStyle(
              color: Colors.white, 
              fontSize: 15, 
              fontWeight: FontWeight.bold
          ),
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
