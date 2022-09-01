// ignore_for_file: depend_on_referenced_packages

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_usb_printer/flutter_usb_printer.dart';
import 'package:posbank_flutter/db/db_helper.dart';
import 'package:posbank_flutter/model/cart_model.dart';
import 'package:posbank_flutter/provider/cart_provider.dart';
import 'package:posbank_flutter/widget/carrousel.dart';
import 'package:posbank_flutter/widget/otherDetailsDivider.dart';
import 'package:provider/provider.dart';

class CreditCardsPage extends StatefulWidget {
  const CreditCardsPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CreditCardsPageState createState() => _CreditCardsPageState();
}

class _CreditCardsPageState extends State<CreditCardsPage> {
  FlutterUsbPrinter flutterUsbPrinter = FlutterUsbPrinter();
  bool connected = false;
  DBHelper? dbHelper = DBHelper();
  List<Cart> minimal = [];

  @override
  initState() {
    super.initState();
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
    await flutterUsbPrinter
        .printText("                                      \r\n");
    await flutterUsbPrinter
        .printText("                                      \r\n");
    await flutterUsbPrinter
        .printText("                                      \r\n");
    await flutterUsbPrinter
        .printText("                                      \r\n");
    await flutterUsbPrinter
        .printText("                                      \r\n");
    await flutterUsbPrinter
        .printText("+----------------------------------------+\r\n");
    await flutterUsbPrinter
        .printText("|              ACURIO-RESTAURANTS        |\r\n");
    await flutterUsbPrinter
        .printText("+----------------------------------------+\r\n");
    await flutterUsbPrinter
        .printText("                                          \r\n");
    await flutterUsbPrinter
        .printText("                                          \r\n");
    await flutterUsbPrinter
        .printText("PRODUCTOS:   CANTIDAD:   PRECIO:    TOTAL:\r\n");
    await flutterUsbPrinter
        .printText("                                          \r\n");
    await flutterUsbPrinter
        .printText("                                          \r\n");
    for (int index = 0; index < minimal.length; index++) {
      String? productoName = minimal[index].productName;
      int? productoCantidad = minimal[index].quantity;
      await flutterUsbPrinter.printText(
          // ignore: prefer_interpolation_to_compose_strings
          (productoName! + "                       ").substring(0, 15) +
              productoCantidad.toString() +
              "     " +
              "S/ " +
              minimal[index].initialPrice.toString() +
              ".00" +
              "     " +
              "S/" +
              minimal[index].productPrice.toString() +
              ".00" +
              '\r\n');
    }
    await flutterUsbPrinter
        .printText("                                      \r\n");
    await flutterUsbPrinter
        .printText("                                      \r\n");
    await flutterUsbPrinter
        .printText("                                      \r\n");
    await flutterUsbPrinter
        .printText("                                      \r\n");
    await flutterUsbPrinter
        .printText("+----------------------------------------+");
    await flutterUsbPrinter
        .printText('|   TOTAL:                 S/$total      |\r\n');
    await flutterUsbPrinter
        .printText("+----------------------------------------+");
    await flutterUsbPrinter
        .printText("                                      \r\n");
    await flutterUsbPrinter
        .printText("                                      \r\n");
    await flutterUsbPrinter
        .printText("------------------------------------------");
    await flutterUsbPrinter
        .printText("Nombre del Cliente:   $nombre         \r\n");
    await flutterUsbPrinter
        .printText('Numero De la Tarjeta: $numero         \r\n');
    await flutterUsbPrinter
        .printText("                                      \r\n");
    await flutterUsbPrinter
        .printText("                                      \r\n");
    await flutterUsbPrinter
        .printText("                                      \r\n");
    await flutterUsbPrinter
        .printText("                                      \r\n");
    await flutterUsbPrinter
        .printText("                                      \r\n");
    await flutterUsbPrinter
        .printText("                                      \r\n");
    await flutterUsbPrinter
        .printText("                                      \r\n");
    await flutterUsbPrinter
        .printText("                                      \r\n");
    await flutterUsbPrinter
        .printText("                                      \r\n");
    await flutterUsbPrinter
        .printText("                                      \r\n");
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        color: const Color(0xFFEBEBEB),
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const ListCarrousel(),
              ],
            ),
            const SizedBox(
              width: 50.0,
            ),
            BounceInLeft(
              duration: const Duration(
                seconds: 1,
              ),
              child: const Text(
                "¡INCREÍBLES OFERTAS!",
                // ignore: unnecessary_const
                style: const TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 50,
                  color: Color(0xFFCC8053),
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            _buildCreditCard(
                height: height,
                color: const Color(0xFF2DA1F4),
                cart: cart,
                cardExpiration: "06/05",
                cardHolder: "E. MILAN",
                cardNumber: "4754 6587 7412 5698"),
            const OtherDetailsDivider(),
            const Text(
              "RESUMEN DE TU ORDEN:    ",
              // ignore: unnecessary_const
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const OtherDetailsDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: width * 0.40,
                    height: height * 0.45,
                    child: Center(
                      child: Column(
                        children: [
                          minimal.isEmpty
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    const Text(
                                      "Cargando...",
                                      style: TextStyle(
                                        fontSize: 25.0,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 25,
                                    ),
                                    const CircularProgressIndicator(
                                      color: Colors.black,
                                    ),
                                  ],
                                )
                              : Expanded(
                                  child: ListView.builder(
                                    itemCount: minimal.length,
                                    itemBuilder: ((context, index) {
                                      return Card(
                                        elevation: 10,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: ExpansionTile(
                                          title: Row(
                                            children: [
                                              Image.asset(
                                                minimal[index].image.toString(),
                                                width: 50,
                                                height: 50,
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              Text(
                                                minimal[index]
                                                    .productName
                                                    .toString(),
                                              ),
                                            ],
                                          ),
                                          subtitle: Text(
                                            "S/${minimal[index]
                                                    .productPrice}.00",
                                            textAlign: TextAlign.end,
                                          ),
                                          children: [
                                            const OtherDetailsDivider(),
                                            const Text("ESPECIFICACIONES"),
                                            const OtherDetailsDivider(),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(left: 5.0),
                                              child: Row(
                                                children: [
                                                  Row(
                                                    children: [
                                                      const Text(
                                                          "Con Extra de queso"),
                                                      Image.asset(
                                                        "images/cheese.png",
                                                        width: 40,
                                                        height: 40,
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      const Text("Sin cebolla"),
                                                      Image.asset(
                                                        "images/onion.png",
                                                        width: 40,
                                                        height: 40,
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
                                  ),
                                )
                        ],
                      ),
                    )),
                SizedBox(
                  width: width * 0.40,
                  height: height * 0.45,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          _printer("4754 6587 7412 5698", "E. MILAN", cart.getTotalPrice());
                          Navigator.pushNamed(context, '/');
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 55,
                          decoration: BoxDecoration(
                            color: const Color(0xFF2DA1F4),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 9,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            "PAGAR S/  ${cart.totalPrice}0",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
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
                    cardNumber,
                    style: const TextStyle(
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
        const Text(
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
          label,
          style: const TextStyle(
              color: Color(0xFFCACACA),
              fontSize: 15,
              fontWeight: FontWeight.bold),
        ),
        Text(
          value,
          style: const TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
