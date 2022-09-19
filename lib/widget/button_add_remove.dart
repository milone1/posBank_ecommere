import 'package:flutter/material.dart';
class ButtonAddRemove extends StatelessWidget {
  const ButtonAddRemove({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      height: 35,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius:
            BorderRadius.circular(7),
      ),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                
              },
              child: const Icon(
                Icons.remove,
                color: Colors.white,
              ),
            ),
            const Text(
              "Qty",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            InkWell(
              onTap: () {
                //   int quantity = snapshot.data![index].quantity!;
                //   int price = snapshot.data![index].initialPrice!;
                //   quantity++;
                //   int? newPrice = price * quantity;
                //   dbHelper!
                //       .updateQuantity(
                //     Cart(
                //       id: snapshot.data![index].id,
                //       productId: snapshot.data![index].id!.toString(),
                //       productName: snapshot.data![index].productName!,
                //       initialPrice: snapshot.data![index].initialPrice!,
                //       productPrice: newPrice,
                //       quantity: quantity,
                //       category: snapshot.data![index].category,
                //       unitTag: snapshot.data![index].unitTag.toString(),
                //       image: snapshot.data![index].image.toString(),
                //     ),
                //   )
                //       .then(
                //     (value) {
                //       newPrice = 0;
                //       quantity = 0;
                //       cart.addTotalPrice(
                //         double.parse(
                //             snapshot.data![index].initialPrice.toString()),
                //       );
                //     },
                //   ).onError(
                //     (error, stackTrace) {},
                //   );
              },
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
