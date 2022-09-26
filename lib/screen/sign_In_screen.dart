// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:posbank_flutter/widget/widgets.dart';
class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SignInScreenState createState() => _SignInScreenState();
}

@override
void initState() {
  initState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "images/background.gif",
                ),
                fit: BoxFit.fill,
              ),
          ),
          child: const SingleChildScrollView(
            child: ListOfItems(),
          ),
        ),
      ),
    );
  }
}