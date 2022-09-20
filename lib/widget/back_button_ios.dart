
import 'package:flutter/material.dart';
import 'package:posbank_flutter/screen/screens.dart';

class BackButtonIos extends StatelessWidget {
  const BackButtonIos({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
         boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(.8),
                blurRadius: 10.0,
                spreadRadius: 0.5,
                offset: Offset(5.0, 5.0))
          ]
      ),
      child: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: () {
            
          },
          child: Icon(
            Icons.arrow_back_ios
            )
        ),
    );
  }
}