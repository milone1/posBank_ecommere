
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
                offset: const Offset(5.0, 5.0))
          ]
      ),
      child: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SignInScreen()),
            );
          },
          child: const Icon(
            Icons.arrow_back_ios
            )
        ),
    );
  }
}