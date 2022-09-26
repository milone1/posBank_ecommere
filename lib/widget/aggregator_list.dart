import 'package:flutter/material.dart';

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
    
    return SingleChildScrollView(
      child: Card(
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
                  children: [
                    const Text(
                      "Indice",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF575E67),
                      ),
                    ),
                    Hero(
                      tag: "1",
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          image: const DecorationImage(
                              image: NetworkImage(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSuKLsLlE16QOTHYPcEVFtTjwJUYGDXXv5yDhBKUfz8vw&s",
                              ),
                              fit: BoxFit.contain),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 200,
                      child: Text(
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        "ProductName",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFFCC8053),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Text(
                      "ProductPrice", 
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF575E67),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(5.0),
                      height: 35,
                      width: 100,
                      decoration: BoxDecoration(  
                        color: const Color(0xff0099DD),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: const Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                            ),
                            const Text(
                              // cart[index]['quantity'].toString(),
                              "qty",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            InkWell(
                              onTap: () {},
                              // ignore: prefer_const_constructors
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
                      // ignore: prefer_const_constructors
                      child: Icon(
                        Icons.delete,
                        color: Colors.red,
                        size: 35.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
