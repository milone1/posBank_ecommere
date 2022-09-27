// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:posbank_flutter/components/image_background.dart';
import 'package:posbank_flutter/widget/item_sign_in.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ImagenBackground(width: width, height: height),
          const SingleChildScrollView(
            child: ItemSignIn(),
          ),
        ],
      ),
    );
  }
}