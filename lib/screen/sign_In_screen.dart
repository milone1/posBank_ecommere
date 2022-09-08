// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:posbank_flutter/provider/cart_provider.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';

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
          child: SingleChildScrollView(
            //* list of item on sign In
            child: _listOfItems(),
          ),
        ),
      ),
    );
  }

  Column _listOfItems() {
    double height = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Image.asset(
              "images/infomatica.png",
              width: 100.0,
              height: 100.0,
            )
          ],
        ),
        SizedBox(
          height: height * 0.1,
        ),
        const SizedBox(
          height: 200.0,
        ),
        Image.asset(
          "images/logoRestaurante.png",
          width: 350.0,
          height: 250.0,
        ),
        const SizedBox(
          height: 200.0,
        ),
        _buttonsOfSignIn(),
        const SizedBox(
          height: 150.0,
        ),
        //* line of copyrigth
        const Text(
          "© Copyrigth 2022 by Infomatica",
          style: TextStyle(
              color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buttonsOfSignIn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _gestureDetector("Para Salon", "ParaSalon", "images/tray.png", context),
        const SizedBox(
          width: 20.0,
        ),
        _gestureDetector("Para Llevar", "ParaLlevar", "images/bug.png", context),
      ],
    );
  }

  Widget _gestureDetector(String title, String value, String img, context) {
    final cart = Provider.of<CartProvider>(context);
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/products');
        setState(() => {cart.setState(value)});
      },
      child: Container(
        width: width * 0.4,
        padding: EdgeInsets.all(width * 0.02),
        decoration: BoxDecoration(
            color: Colors.purple.shade300,
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.4),
                offset: const Offset(3, 3),
                spreadRadius: 8,
                blurRadius: 8,
              )
            ]),
        child: Center(
          child: Column(
            children: [
              Image.asset(
                img,
                width: 100.0,
                height: 100.0,
              ),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: width * 0.05,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
