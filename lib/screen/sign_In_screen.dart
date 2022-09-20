import 'package:flutter/material.dart';
import 'package:posbank_flutter/widget/widgets.dart';
class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
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
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/backgroundCal.gif"),
                fit: BoxFit.fill),
          ),
          child: SingleChildScrollView(
            child: ListOfItems(),
          ),
        ),
      ),
    );
  }
}