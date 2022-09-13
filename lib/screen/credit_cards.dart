import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_usb_printer/flutter_usb_printer.dart';
import 'package:posbank_flutter/model/cart_model.dart';
import 'package:posbank_flutter/provider/provider.dart';
import 'package:posbank_flutter/widget/widgets.dart';
// ignore: depend_on_referenced_packages
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
  List<Cart> minimal = [];

  @override
  initState() {
    super.initState();
    flutterUsbPrinter.connect(1155, 41014);
  }

  // getData() async {
  //   List<Cart>? auxProd = await dbHelper?.getCartList();
  //   setState(() {
  //     minimal = auxProd!;
  //   });
  // }

  _printer(cardNumber, cardHolder, total, CartProvider cart) async {
    String nombre = cardHolder.toString();
    await flutterUsbPrinter
        .printText("                                          \r\n");
    await flutterUsbPrinter
        .printText("               Almeyda S.A.               \r\n");
    await flutterUsbPrinter
        .printText("           Restaurante La Infomatica      \r\n");
    await flutterUsbPrinter
        .printText("            R.U.C.: 11111111111           \r\n");
    await flutterUsbPrinter
        .printText("   Pan. Sur Km 18.5 Chorrillos-Lima       \r\n");
    await flutterUsbPrinter
        .printText("         2583150 - 971626721              \r\n");
    await flutterUsbPrinter
        .printText("                                          \r\n");
    await flutterUsbPrinter
        .printText("                                          \r\n");
    await flutterUsbPrinter
        .printText("       BOLETA DE VENTA ELECTRONICA        \r\n");
    await flutterUsbPrinter
        .printText("             B014-00000921                \r\n");
    await flutterUsbPrinter
        .printText("                                          \r\n");
    await flutterUsbPrinter
        .printText("                                          \r\n");
    await flutterUsbPrinter
        .printText("------------------------------------------\r\n");
    await flutterUsbPrinter
        .printText(" Cliente       : $nombre                  \r\n");
    await flutterUsbPrinter
        .printText(" DNI           : 54447887                 \r\n");
    await flutterUsbPrinter
        .printText(" Direccion     : Fransisco Zela SN Urb    \r\n");
    await flutterUsbPrinter
        .printText("------------------------------------------\r\n");
    await flutterUsbPrinter
        .printText("                                          \r\n");
    await flutterUsbPrinter
        .printText(" Pedido        : 2200000212               \r\n");
    await flutterUsbPrinter
        .printText(" Fecha Emision : 10/08/2022 11:57:00a.m   \r\n");
    await flutterUsbPrinter
        .printText(" Tipo          : Para Llevar              \r\n");
    await flutterUsbPrinter
        .printText(" Local         : SIN UNIDAD NEGOCIO       \r\n");
    await flutterUsbPrinter
        .printText(" Caja          : 001 - MASTER             \r\n");
    await flutterUsbPrinter
        .printText(" Mesero        : Gean Carlos              \r\n");
    await flutterUsbPrinter
        .printText(" Tipo moneda   : Soles                    \r\n");
    await flutterUsbPrinter
        .printText(" Mesa          : 1                        \r\n");
    await flutterUsbPrinter
        .printText("                                          \r\n");
    await flutterUsbPrinter
        .printText("------------------------------------------\r\n");
    await flutterUsbPrinter
        .printText(" PRODUCTO:   CANTIDAD:   P.UNI:    TOTAL  \r\n");
    await flutterUsbPrinter
        .printText("                                          \r\n");
    // for (int index = 0; index < minimal.length; index++) {
    //   String? productoName = minimal[index].productName;
    //   int? productoCantidad = minimal[index].quantity;
    //   await flutterUsbPrinter.printText(
    //       // ignore: prefer_interpolation_to_compose_strings
    //       (productoName + "                       ").substring(0, 15) +
    //           productoCantidad.toString() +
    //           "     " +
    //           "S/ " +
    //           minimal[index].initialPrice.toString() +
    //           ".00" +
    //           "     " +
    //           "S/" +
    //           minimal[index].productPrice.toString() +
    //           ".00" +
    //           '\r\n');
    // }
    await flutterUsbPrinter
        .printText("------------------------------------------\r\n");
    await flutterUsbPrinter
        .printText("         Op. Gravadas   S/. :       26.72 \r\n");
    await flutterUsbPrinter
        .printText("         Op. Inafecta   S/. :        0.00 \r\n");
    await flutterUsbPrinter
        .printText("        Op. Exonerado   S/. :        0.00 \r\n");
    await flutterUsbPrinter
        .printText("      Total Descuento   S/. :        0.00 \r\n");
    await flutterUsbPrinter
        .printText("           IGV 10.00%   S/. :        4.81 \r\n");
    await flutterUsbPrinter
        .printText("           RECA 9.26%   S/. :        2.47 \r\n");
    await flutterUsbPrinter
        .printText("               ICBPER   S/. :        0.00 \r\n");
    await flutterUsbPrinter
        .printText("        Importe Total   S/. :       34.00 \r\n");
    await flutterUsbPrinter
        .printText("                                          \r\n");
    await flutterUsbPrinter
        .printText("------------------------------------------\r\n");
    await flutterUsbPrinter
        .printText("                                          \r\n");
    await flutterUsbPrinter
        .printText(" Forma de Pago      : AL CONTADO          \r\n");
    await flutterUsbPrinter
        .printText(" Tipo de Pago                             \r\n");
    await flutterUsbPrinter
        .printText("                                          \r\n");
    await flutterUsbPrinter
        .printText("          GRACIAS POR SU VISITA           \r\n");
    await flutterUsbPrinter
        .printText("                                          \r\n");
    await flutterUsbPrinter
        .printText(" Autorizado mediante resolucion Nro. 018- \r\n");
    await flutterUsbPrinter
        .printText(" 005-0002243 representacion de boleta de  \r\n");
    await flutterUsbPrinter
        .printText(" venta electronica, consulte su documento \r\n");
    await flutterUsbPrinter
        .printText(" en www.fegrupoespinoza.com               \r\n");
    await flutterUsbPrinter
        .printText("                                          \r\n");
    await flutterUsbPrinter
        .printText("                                          \r\n");
    await flutterUsbPrinter
        .printText("                                          \r\n");
    await flutterUsbPrinter
        .printText("                                          \r\n");
    await flutterUsbPrinter
        .printText("                                          \r\n");
    await flutterUsbPrinter
        .printText("                                          \r\n");
    await flutterUsbPrinter
        .printText("                                          \r\n");
    await flutterUsbPrinter
        .printText("                                          \r\n");
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
              children: const <Widget>[
                ListCarrousel(),
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
                style: TextStyle(
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
                cardHolder: "Oscar Melero",
                cardNumber: "4754 6587 7412 5698"),
            const OtherDetailsDivider(),
            HeaderSection(width: width),
            const OtherDetailsDivider(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: width * 0.50,
                  height: height * 0.30,
                  child: Center(
                    child: Column(
                      children: [
                        minimal.isEmpty
                            ? const CircularCharger()
                            : Expanded(
                                child: ListView.builder(
                                  itemCount: minimal.length,
                                  itemBuilder: (
                                    (context, index) => 
                                      Card(
                                          elevation: 10,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: ExpansionTile(
                                            title: Row(
                                              children: [
                                                Image.asset(
                                                  minimal[index]
                                                      .image
                                                      .toString(),
                                                  width: 50,
                                                  height: 50,
                                                ),
                                                const SizedBox(
                                                  width: 20,
                                                ),
                                                Text(minimal[index]
                                                    .productName
                                                    .toString()),
                                              ],
                                            ),
                                            subtitle: Text(
                                              "S/${minimal[index].productPrice}.00",
                                              textAlign: TextAlign.end,
                                            ),
                                            children: [
                                              const OtherDetailsDivider(),
                                              const Text("ESPECIFICACIONES"),
                                              const OtherDetailsDivider(),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 5.0),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            const Text(
                                                                "Con Hielo "),
                                                            const SizedBox(
                                                              width: 5,
                                                            ),
                                                            Image.asset(
                                                              "images/hielo.png",
                                                              width: 40,
                                                              height: 40,
                                                            )
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          width: 20,
                                                        ),
                                                        Row(
                                                          children: [
                                                            const Text(
                                                                "En Copa"),
                                                            Image.asset(
                                                              "images/copa.png",
                                                              width: 40,
                                                              height: 40,
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //* boton pay
                _buttonPayToCard()
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buttonPayToCard() {
    final cart = Provider.of<CartProvider>(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width * 0.40,
      height: height * 0.10,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              _printer("4754 6587 7412 5698", "Oscar Melero",
                  cart.getTotalPrice(), cart);
              cart.setPriceTotal();
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
          _printer(cardNumber, cardHolder, cart.getTotalPrice(), cart);
          cart.setPriceTotal();
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