import 'package:chip_list/chip_list.dart';
import 'package:flutter/material.dart';

class Properties extends StatefulWidget {
  const Properties({Key? key, required this.properties}) : super(key: key);
  final List properties;

  @override
  State<Properties> createState() => _PropertiesState();
}
class _PropertiesState extends State<Properties> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          
        },
        child: ChipList(
            listOfChipNames: widget.properties
                .map((e) => e['Descripcion'] as String)
                .toList(),
            activeBgColorList: [Theme.of(context).primaryColor],
            inactiveBgColorList: [Colors.white],
            activeTextColorList: [Colors.white],
            inactiveTextColorList: [Theme.of(context).primaryColor],
            listOfChipIndicesCurrentlySeclected: [0]),
      ),
    );
  }
}
