import 'package:chip_list/chip_list.dart';
import 'package:flutter/material.dart';

class Properties extends StatelessWidget {
  const Properties({Key? key, required this.properties}) : super(key: key);
  
  final List properties;


  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          
        },
        child: ChipList(
            listOfChipNames: properties
                .map((e) => e['Descripcion'] as String)
                .toList(),
            activeBgColorList: const [Color(0xff0099DD)],
            inactiveBgColorList: const [Colors.white],
            activeTextColorList: const [Colors.white],
            inactiveTextColorList: [Theme.of(context).primaryColor],
            listOfChipIndicesCurrentlySeclected: const [0]),
      ),
    );
  }
}