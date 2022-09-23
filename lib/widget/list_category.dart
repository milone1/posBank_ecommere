// ignore_for_file: file_names, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:posbank_flutter/provider/provider.dart';
import 'package:provider/provider.dart';

class ListCategory extends StatefulWidget {
  const ListCategory({Key? key, 
  }) : super(key: key);
  @override
  State<ListCategory> createState() => _ListCategoryState();
}

List images = [
  {
    'id': 0,
    'img': "images/0.png",
  },
  {
    'id': 1,
    'img': "images/1.png",
  },
  {
    'id': 2,
    'img': "images/2.png",
  },
  {
    'id': 3,
    'img': "images/3.png",
  },
  {
    'id': 4,
    'img': "images/4.png",
  },
  {
    'id': 5,
    'img': "images/5.png",
  },
  {
    'id': 6,
    'img': "images/6.png",
  },
  {
    'id': 7,
    'img': "images/7.png",
  },
  {
    'id': 8,
    'img': "images/8.png",
  },
  {
    'id': 9,
    'img': "images/9.png",
  },
  {
    'id': 10,
    'img': "images/10.png",
  },
  {
    'id': 11,
    'img': "images/11.png",
  },
  {
    'id': 12,
    'img': "images/12.png",
  },
  {
    'id': 13,
    'img': "images/13.png",
  },
];

extension IndexedIterable<E> on Iterable<E> {
  Iterable<T> indexedMap<T>(T Function(E element, int index) f) {
    var index = 0;
    return map((e) => f(e, index++));
  }
}

class _ListCategoryState extends State<ListCategory> {

  @override
  Widget build(BuildContext context) {
    final groups = Provider.of<ProductsProvider>(context).groups;
    double height = MediaQuery.of(context).size.height;
    final codecs = Provider.of<CategoryProvider>(context);
    final category = Provider.of<CategoryProvider>(context).category;

    return Container(
      width: 170,
      height: height * 0.55,
      child: ListWheelScrollView.useDelegate(
        physics: FixedExtentScrollPhysics(),
        onSelectedItemChanged: (index) => {
          codecs.setCodigo(groups[index]['CodigoGrupo']),
          codecs.setCategory(groups[index]['Descripcion']),
        },
        itemExtent: 70,
        perspective: 0.001,
        magnification: 1.1,
        useMagnifier: true,
        childDelegate: ListWheelChildBuilderDelegate(
          childCount: groups.length,
          builder: (context, index) {
            return Container(
              margin: EdgeInsets.only(
                top: 0,
                bottom: 10,
                right: 5,
                left: 5,
              ),
              padding: EdgeInsets.only(
                top: 0,
                bottom: 10,
                right: 5,
                left: 5,
              ),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: category == groups[index]['Descripcion']
                        ? Color(0xffA1C7E0)
                        : Color(0xffF2F2F2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        spreadRadius: 5,
                        blurRadius: 7,
                      ),
                    ]),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        images[index]['img'],
                        width: 50,
                        height: 50,
                        fit: BoxFit.contain,
                      ),
                      Text(
                        groups[index]['Descripcion'],
                        style: TextStyle(
                          color: Color(0xFFCC8053),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
