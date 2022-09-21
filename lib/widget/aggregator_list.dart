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
    final aggregators = Provider.of<CartProvider>(context).cartList;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: 100.0,
      decoration: BoxDecoration(
          border: Border.all(
        color: Colors.yellow,
      )),
      width: width * 0.90,
      child: ListView.builder(
        itemCount: aggregators[indexProduct]['aggregator'].length,
        itemBuilder: (context, index) {
          return Row(
            children: [
              Image.asset(
                aggregators[indexProduct]['aggregator'][index]['images'],
                width: 50,
                height: 50,
              ),
              Text(aggregators[indexProduct]['aggregator'][index]['title']),
              Text(aggregators[indexProduct]['aggregator'][index]['qty']
                  .toString()),
              Container(
                margin: EdgeInsets.all(5.0),
                height: 35,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Padding(
                  padding: EdgeInsets.all(6.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        aggregators[indexProduct]['aggregator'][index]['qty']
                            .toString(),
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Icon(
                  Icons.delete,
                  color: Colors.black,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
