import 'package:flutter/material.dart';

class RadioButtonsProperties extends StatefulWidget {
  RadioButtonsProperties({
    Key? key,
    required this.width,
    required this.properties,
  }) : super(key: key);

  final double width;
  final List properties;

  @override
  State<RadioButtonsProperties> createState() => _RadioButtonsPropertiesState();
}

class _RadioButtonsPropertiesState extends State<RadioButtonsProperties> {
  @override
  Widget build(BuildContext context) {
    int _value = 1;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.red)),
              width: widget.width * 0.40,
              height: 50.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Radio(
                      value: 1,
                      groupValue: widget.properties,
                      onChanged: (value) {}),
                  Text(widget.properties[0]['Descripcion'])
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
