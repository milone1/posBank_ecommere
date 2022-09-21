import 'package:flutter/material.dart';
import 'package:posbank_flutter/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class AggregatorList extends StatelessWidget {
  const AggregatorList({
    Key? key,
    required this.id,
    required this.index,
  }) : super(key: key);

  final double id;
  final int index;

  @override
  Widget build(BuildContext context) {
    final aggregators = Provider.of<CartProvider>(context).cartList;
    return Container(
      child: ListView.builder(
          itemCount: aggregators[index]['aggregator'].length,
          itemBuilder: (context, index) {
            return Text("asd");
        },
      ),
    );
  }
}
