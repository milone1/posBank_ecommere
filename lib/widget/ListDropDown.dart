// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ListDropDown extends StatelessWidget {
  final _bebida = ["Galonera de chicha x 2L", "Galonera de Naranja x 2L"];
  final _pan = ["Pan baguettino", "Pan Ciabatta", "Pan Ciabatta"];
  final _tamal = ["Tamal de Chancho", "Tamal de Pollo"];
  final String _titleBebidas = "BEBIDAS";
  final String _titlePan = "PAN";
  final String _titleTamal = "TAMAL";

  ListDropDown(String category, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        DropdownButton(
          items: _bebida.map((String a) {
            return DropdownMenuItem(
              value: a,
              child: Row(
                children: [
                  Checkbox(value: true, onChanged: (_){}),
                  Text(a),
                ],
              ),
            );
          }).toList(),
          onChanged: (_) {},
          hint: Text(_titleBebidas),
        ),
        DropdownButton(
          items: _pan.map((String a) {
            return DropdownMenuItem(
              value: a,
              child: Row(
                children: [
                  Checkbox(value: true, onChanged: (_){}),
                  Text(a),
                ],
              ),
            );
          }).toList(),
          onChanged: (_) {},
          hint: Text(_titlePan),
        ),
        DropdownButton(
          items: _tamal.map((String a) {
            return DropdownMenuItem(
              value: a,
              child: Row(
                children: [
                  Checkbox(value: false, onChanged: (_){}),
                  Text(a),
                ],
              ),
            );
          }).toList(),
          onChanged: (_) {},
          hint: Text(_titleTamal),
        ),
      ],
    );
  }
}
