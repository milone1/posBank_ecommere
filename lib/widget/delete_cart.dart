import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:posbank_flutter/provider/cart_provider.dart';
import 'package:posbank_flutter/widget/widgets.dart';
import 'package:provider/provider.dart';

class DeleteCart extends StatelessWidget {
  const DeleteCart({
    Key? key,
    required this.nameofproduct,
    required this.price,
    required this.imagen,
  }) : super(key: key);

  //* final String name;
  final String nameofproduct;
  final String imagen;
  final String price;

  @override
  Widget build(BuildContext context) {
    // _deleteProduct(id, price) async {
    //   await dbHelper!.delete(id);
    //   cart.removerCounter();
    //   cart.removeTotalPrice(
    //     double.parse(price),
    //   );
    // }
    final basket = Provider.of<CartProvider>(context).cart;
    return Container(
      decoration: const BoxDecoration(
        color: Colors.red,
      ),
      child: ListView.builder(
        itemCount: basket.length,
        itemBuilder: (BuildContext context, int index) => Card(
          child: Padding(
            padding: const EdgeInsets.all(1.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 6,
                          blurRadius: 8),
                    ],
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        width: 120,
                        height: 50,
                        basket[index].img.toString(),
                      ),
                      SizedBox(
                        width: 150,
                        child: Text(
                          ("$nameofproduct}             ")
                              .substring(0, 15)
                              .toString(),
                          style: const TextStyle(
                              fontSize: 20,
                              color: Color(0xFFCC8053),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        // ignore: prefer_interpolation_to_compose_strings
                        "S/ " + basket[index].price.toString() + ".00",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF575E67),
                        ),
                      ),
                      //* button add or remove
                      const ButtonAddRemove(),
                      InkWell(
                        onTap: () {
                          // _deleteProduct(
                          //   snapshot.data![index].id!,
                          //   snapshot.data![index].productPrice
                          //       .toString(),
                          // );
                          Fluttertoast.showToast(
                              msg: "Eliminado Correctamente",
                              toastLength: Toast.LENGTH_SHORT,
                              webPosition: "bottom",
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 14.0);
                        },
                        child: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
