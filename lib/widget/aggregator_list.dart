import 'package:flutter/material.dart';
import 'package:posbank_flutter/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class AggregatorList extends StatelessWidget {
  const AggregatorList({
    Key? key,
    required this.id,
    required this.indexProduct,
  }) : super(key: key);

  final int id;
  final int indexProduct;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return SingleChildScrollView(
      child: ListView.builder(
        itemCount: cart.cartList[indexProduct].length,
        itemBuilder: (BuildContext context, int index) => 
        Card(
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
                        blurRadius: 8,
                      ),
                    ],
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        "1"
                      ),
                      SizedBox(
                        width: 100,
                        child: Text(
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          "Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem",
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFFCC8053),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        // cart.getPriceAggregatorStaff(indexProduct).toStringAsFixed(2).toString(), 
                        "S/ 12.50",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF575E67),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
