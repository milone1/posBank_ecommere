// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:flutter_usb_printer/flutter_usb_printer.dart';
import 'package:posbank_flutter/provider/provider.dart';
import 'package:posbank_flutter/widget/widgets.dart';
import 'package:provider/provider.dart';

class ButtonPayCard extends StatefulWidget {
  const ButtonPayCard({
    Key? key,
    required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  State<ButtonPayCard> createState() => _ButtonPayCardState();
}

class _ButtonPayCardState extends State<ButtonPayCard> {
  FlutterUsbPrinter flutterUsbPrinter = FlutterUsbPrinter();
  bool connected = false;

  @override
  initState() {
    super.initState();
    flutterUsbPrinter.connect(1155, 41014);
    // postPrueba['DetallePedido'].add()
  }

  _printer(cardNumber, cardHolder, total, list) async {
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
    for (int index = 0; index < list.length; index++) {
      await flutterUsbPrinter.printText(
          // ignore: prefer_interpolation_to_compose_strings
          (list[index]['productName'] + "                       ")
                  .substring(0, 15) +
              list[index]['quantity'].toString() +
              "     " +
              "S/ " +
              list[index]['initialPrice'].toString() +
              ".00" +
              "     " +
              "S/" +
              list[index]['productPrice'].toString() +
              '\r\n');
    }
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
    final post = Provider.of<ProductsProvider>(context);
    double width = MediaQuery.of(context).size.width;
    
    Map postPrueba = {
      "Local": "1",
      "Tipopedido": "02",
      "Nombre": "Julio",
      "Apellido": "Berne",
      "Telefono": "985241574",
      "Direccion": "Calle Las Begonias Miraflores",
      "Referencia": "Detras del congreso de la replublica lima - lima - peru.",
      "Correo": "Prueba@gmail.com",
      "Tipodocumento": "01",
      "Ruc": "10121450254",
      "Razonsocial": "Berne Julio SAC",
      "DireccionClienteFacturado":
      "Calle Las Begonias Miraflores CHORRILLOS, CHORRILLOS",
      "Fechaenvia": "2016-02-03 18:45:00",
      "Observacion": "TOTEM INFOR- Prueba de Obsewrvacion",
      "CorreoElectronico": "prueba@hotmail.com",
      "EstadoPago": "0",
      "Ubigeo": "150101",
      "Urbanizacion": "Lima",
      "CodigoDescuento": "001",
      "DetallePedido": [
      ],
      "Prepagos": [
        {
          "Tipopago": "02",
          "Monto": 102.23,
          "Vuelto": 20.5,
          "Tarjeta": "01",
          "Numero": "1234"
        },
        {
          "Tipopago": "01",
          "Monto": 20.23,
          "Vuelto": 0,
          "Tarjeta": "",
          "Numero": ""
        }
      ],
      "FechaEntrega": "2016-02-04 18:45:00",
      "CodigoOrigenVenta": "INF0001"
    };
    for(int index = 0; index < cart.cartList.length; index++) {
      postPrueba['DetallePedido'].add({
              "Item": '00$index'.toString(),
              "Codigoproducto": cart.cartList[index]['id'],
              "Cantidad": cart.cartList[index]['quantity'],
              "Lcombo": "0",
              "Observacion": "Prueba de sistemas 1",
              "ProductoPropiedad": []
            }
        );
    }
    return Container(
      margin: const EdgeInsets.only(top: 1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
      ),
      width: width * 0.20,
      height: 80,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              post.methodPost(postPrueba);
              // _printer("4754 6587 7412 5698", "Oscar Melero",
              //     cart.getPriceTotal(), cart.cartList);
              // cart.clearCart();
              // Navigator.pushNamed(context, 'home');
            },
            child: ButtonPay(cart: cart),
          ),
        ],
      ),
    );
  }
}
