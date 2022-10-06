import 'dart:async';
import 'package:esc_pos_utils/esc_pos_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pos_printer_platform/flutter_pos_printer_platform.dart';
import 'package:posbank_flutter/model/printer.dart';
import 'package:posbank_flutter/provider/provider.dart';
import 'package:posbank_flutter/widget/widgets.dart';
import 'package:provider/provider.dart';

import 'dart:io';

import 'dart:developer';

class ButtonPayCard extends StatefulWidget {
  const ButtonPayCard({Key? key}) : super(key: key);

  @override
  State<ButtonPayCard> createState() => _ButtonPayCardState();
}

class _ButtonPayCardState extends State<ButtonPayCard> {
  var defaultPrinterType = PrinterType.usb;
  var _isBle = false;
  var _isConnected = false;
  var printerManager = PrinterManager.instance;
  var devices = <BluetoothPrinter>[];
  StreamSubscription<PrinterDevice>? _subscription;
  StreamSubscription<USBStatus>? _subscriptionUsbStatus;
  USBStatus _currentUsbStatus = USBStatus.none;
  List<int>? pendingTask;
  String _ipAddress = '';
  String _port = '9100';
  BluetoothPrinter? selectedPrinter;

  @override
  void initState() {
    defaultPrinterType = PrinterType.usb;
    super.initState();
    selectDevice(BluetoothPrinter(
      deviceName: 'A6 USB PRINTER',
      address: '',
      port: '',
      state: true,
      vendorId: '1155',
      productId: '41014',
      typePrinter: defaultPrinterType,
      isBle: true,
    ));
    // UsbPrinterInput(productId: '41014', vendorId: '1155');
    // _scan();
    _subscriptionUsbStatus = PrinterManager.instance.stateUSB.listen((status) {
      log(' ----------------- status usb $status ------------------ ');
      _currentUsbStatus = status;
      if (Platform.isAndroid) {
        if (status == USBStatus.connected && pendingTask != null) {
          Future.delayed(const Duration(milliseconds: 1000), () {
            PrinterManager.instance
                .send(type: PrinterType.usb, bytes: pendingTask!);
            pendingTask = null;
          });
        }
      }
    });
  }

  void selectDevice(BluetoothPrinter device) async {
    selectedPrinter = device;
    setState(() {});
  }

  Future printReceiveTest() async {
    final profile = await CapabilityProfile.load();
    final generator = Generator(PaperSize.mm58, profile);
    List<int> bytes = [];
    List<dynamic> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9];

    bytes += generator.text('Test Print',
        styles: const PosStyles(align: PosAlign.center), linesAfter: 2);
    bytes += generator.text('Product 1');
    bytes += generator.text('Product 2');
    bytes += generator.text('PRueba 2');
    bytes += generator.feed(10);
    _printEscPos(bytes, generator);
  }

  /// print ticket
  void _printEscPos(List<int> bytes, Generator generator) async {
    var bluetoothPrinter = selectedPrinter!;
    switch (bluetoothPrinter.typePrinter) {
      case PrinterType.usb:
        bytes += generator.feed(10);
        bytes += generator.cut();

        await printerManager.connect(
            type: bluetoothPrinter.typePrinter,
            model: UsbPrinterInput(productId: '41014', vendorId: '1155'));
        pendingTask = null;
        // if (Platform.isAndroid) pendingTask = bytes;
        break;
      default:
    }
    if (bluetoothPrinter.typePrinter == PrinterType.usb && Platform.isAndroid) {
      // _currentUsbStatus is only supports on Android
      if (_currentUsbStatus == USBStatus.connected) {
        printerManager.send(type: bluetoothPrinter.typePrinter, bytes: bytes);
        pendingTask = null;
      }
    } else {
      printerManager.send(type: bluetoothPrinter.typePrinter, bytes: bytes);
    }
  }

// Map postPrueba = {
  //   "Local": "1",
  //   "Tipopedido": "02",
  //   "Nombre": "Julio",
  //   "Apellido": "Berne",
  //   "Telefono": "985241574",
  //   "Direccion": "Calle Las Begonias Miraflores",
  //   "Referencia": "Detras del congreso de la replublica lima - lima - peru.",
  //   "Correo": "Prueba@gmail.com",
  //   "Tipodocumento": "01",
  //   "Ruc": "10121450254",
  //   "Razonsocial": "Berne Julio SAC",
  //   "DireccionClienteFacturado":
  //       "Calle Las Begonias Miraflores CHORRILLOS, CHORRILLOS",
  //   "Fechaenvia": "2016-02-03 18:45:00",
  //   "Observacion": "TOTEM INFOR- Prueba de Obsewrvacion",
  //   "CorreoElectronico": "prueba@hotmail.com",
  //   "EstadoPago": "0",
  //   "Ubigeo": "150101",
  //   "Urbanizacion": "Lima",
  //   "CodigoDescuento": "001",
  //   "DetallePedido": [],
  //   "Prepagos": [
  //     {
  //       "Tipopago": "02",
  //       "Monto": 102.23,
  //       "Vuelto": 20.5,
  //       "Tarjeta": "01",
  //       "Numero": "1234"
  //     },
  //     {
  //       "Tipopago": "01",
  //       "Monto": 20.23,
  //       "Vuelto": 0,
  //       "Tarjeta": "",
  //       "Numero": ""
  //     }
  //   ],
  //   "FechaEntrega": "2016-02-04 18:45:00",
  //   "CodigoOrigenVenta": "INF0001"
  // };

// Map postPrueba = {
  //   "Local": "1",
  //   "Tipopedido": "02",
  //   "Nombre": "Julio",
  //   "Apellido": "Berne",
  //   "Telefono": "985241574",
  //   "Direccion": "Calle Las Begonias Miraflores",
  //   "Referencia": "Detras del congreso de la replublica lima - lima - peru.",
  //   "Correo": "Prueba@gmail.com",
  //   "Tipodocumento": "01",
  //   "Ruc": "10121450254",
  //   "Razonsocial": "Berne Julio SAC",
  //   "DireccionClienteFacturado":
  //       "Calle Las Begonias Miraflores CHORRILLOS, CHORRILLOS",
  //   "Fechaenvia": "2016-02-03 18:45:00",
  //   "Observacion": "TOTEM INFOR- Prueba de Obsewrvacion",
  //   "CorreoElectronico": "prueba@hotmail.com",
  //   "EstadoPago": "0",
  //   "Ubigeo": "150101",
  //   "Urbanizacion": "Lima",
  //   "CodigoDescuento": "001",
  //   "DetallePedido": [],
  //   "Prepagos": [
  //     {
  //       "Tipopago": "02",
  //       "Monto": 102.23,
  //       "Vuelto": 20.5,
  //       "Tarjeta": "01",
  //       "Numero": "1234"
  //     },
  //     {
  //       "Tipopago": "01",
  //       "Monto": 20.23,
  //       "Vuelto": 0,
  //       "Tarjeta": "",
  //       "Numero": ""
  //     }
  //   ],
  //   "FechaEntrega": "2016-02-04 18:45:00",
  //   "CodigoOrigenVenta": "INF0001"
  // };

// Map postPrueba = {
  //   "Local": "1",
  //   "Tipopedido": "02",
  //   "Nombre": "Julio",
  //   "Apellido": "Berne",
  //   "Telefono": "985241574",
  //   "Direccion": "Calle Las Begonias Miraflores",
  //   "Referencia": "Detras del congreso de la replublica lima - lima - peru.",
  //   "Correo": "Prueba@gmail.com",
  //   "Tipodocumento": "01",
  //   "Ruc": "10121450254",
  //   "Razonsocial": "Berne Julio SAC",
  //   "DireccionClienteFacturado":
  //       "Calle Las Begonias Miraflores CHORRILLOS, CHORRILLOS",
  //   "Fechaenvia": "2016-02-03 18:45:00",
  //   "Observacion": "TOTEM INFOR- Prueba de Obsewrvacion",
  //   "CorreoElectronico": "prueba@hotmail.com",
  //   "EstadoPago": "0",
  //   "Ubigeo": "150101",
  //   "Urbanizacion": "Lima",
  //   "CodigoDescuento": "001",
  //   "DetallePedido": [],
  //   "Prepagos": [
  //     {
  //       "Tipopago": "02",
  //       "Monto": 102.23,
  //       "Vuelto": 20.5,
  //       "Tarjeta": "01",
  //       "Numero": "1234"
  //     },
  //     {
  //       "Tipopago": "01",
  //       "Monto": 20.23,
  //       "Vuelto": 0,
  //       "Tarjeta": "",
  //       "Numero": ""
  //     }
  //   ],
  //   "FechaEntrega": "2016-02-04 18:45:00",
  //   "CodigoOrigenVenta": "INF0001"
  // };

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final user = Provider.of<UserProvider>(context);
    // final post = Provider.of<ProductsProvider>(context);
    double width = MediaQuery.of(context).size.width;
    // if (cart.cartList.isNotEmpty) {
    //   for (int index = 0; index < cart.cartList.length; index++) {
    //     postPrueba['DetallePedido'].add({
    //       "Item": '00$index'.toString(),
    //       "Codigoproducto": cart.cartList[index]['id'],
    //       "Cantidad": cart.cartList[index]['quantity'],
    //       "Lcombo": "0",
    //       "Observacion": "Prueba de sistemas 1",
    //       "ProductoPropiedad": []
    //     });
    //   }
    // }
    return Container(
      margin: const EdgeInsets.only(top: 1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
      ),
      width: width * 0.40,
      height: 80,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              selectDevice(BluetoothPrinter(
                deviceName: 'A6 USB PRINTER',
                address: '',
                port: '',
                state: true,
                vendorId: '1155',
                productId: '41014',
                typePrinter: defaultPrinterType,
                isBle: true,
              ));

              print("Processsssssss");

              printReceiveTest();
            },
            child: const ButtonPay(),
          ),
        ],
      ),
    );
  }
}
