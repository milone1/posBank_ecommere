// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:posbank_flutter/widget/widgets.dart';
// ignore: depend_on_referenced_packages
import 'package:posbank_flutter/provider/provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: height,
          width: width,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/backgroundCal.gif"),
                fit: BoxFit.fill),
          ),
          child: const SingleChildScrollView(
            child: ListOfItems(),
          ),
        ),
      ),
    );
  }
}