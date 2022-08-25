import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class ListDropDown extends StatelessWidget {
  var _bebida = ["Galonera de chicha x 2L", "Galonera de Naranja x 2L"];
  var _pan = ["Pan baguettino", "Pan Ciabatta", "Pan Ciabatta"];
  var _tamal = ["Tamal de Chancho", "Tamal de Pollo"];
  String _titleBebidas = "BEBIDAS";
  String _titlePan = "PAN";
  String _titleTamal = "TAMAL";
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        DropdownButton(
          items: _bebida.map((String a) {
            return DropdownMenuItem(
              value: a,
              child: Row(
                children: [
                  Radio(value: 1, groupValue: 1, onChanged: (_) {}),
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
                  Radio(value: 1, groupValue: 1, onChanged: (_) {}),
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
                  Radio(value: 1, groupValue: 1, onChanged: (_) {}),
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
