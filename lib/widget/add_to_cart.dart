
import 'package:flutter/material.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.35,
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 5,
            blurRadius: 7,
          ),
        ],
        color: Colors.blue,
      ),
      child: Center(
        child: InkWell(
          onTap: () {
            // Fluttertoast.showToast(
            //     msg: "Agregado Correctamente",
            //     toastLength: Toast.LENGTH_SHORT,
            //     webPosition: "bottom",
            //     gravity: ToastGravity.CENTER,
            //     timeInSecForIosWeb: 1,
            //     backgroundColor: Colors.green,
            //     textColor: Colors.white,
            //     fontSize: 14.0);
            // dbHelper!
            //     .insert(
            //   Cart(
            //       id: id,
            //       productId: idProduct.toString(),
            //       productName: name,
            //       initialPrice: price,
            //       productPrice: price,
            //       quantity: 1,
            //       unitTag: price.toString(),
            //       image: imgPath,
            //       category: category.toString()),
            // ).then(
            //   (value) {
            //     cart.addTotalPrice(
            //         double.parse(price.toString()));
            //     cart.addCounter();
            //   },
            // );
            Navigator.pop(context);
          },
          child: const Text(
            "+ AGREGAR AL CARRITO",
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
