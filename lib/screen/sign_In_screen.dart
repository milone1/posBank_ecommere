// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:posbank_flutter/provider/cart_provider.dart';
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
    final categoriesInfo = Provider.of<CartProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/backgroundCal.gif"),
                fit: BoxFit.fill),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const SizedBox(
                      width: 200,
                      height: 200,
                    ),
                    Image.asset(
                      "images/infomatica.png",
                      width: 100,
                      height: 100,
                    )
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                const SizedBox(
                  height: 200,
                ),
                Image.asset(
                  "images/logoRestaurante.png",
                  width: 350,
                  height: 250,
                ),
                const SizedBox(
                  height: 200,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/products');
                        setState(
                            () => {categoriesInfo.setState("ParaSalon")}
                          );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        padding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.02,
                        ),
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
                                "images/tray.png",
                                width: 100,
                                height: 100,
                              ),
                              Text(
                                'Para Salon',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.05,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/products');
                        setState(
                            () => {categoriesInfo.setState("ParaLlevar")});
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        padding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.02,
                        ),
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
                                "images/bug.png",
                                width: 100,
                                height: 100,
                              ),
                              Text(
                                'Para LLevar',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.05,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 150,
                ),
                const Text(
                  "© Copyrigth 2022 by Infomatica",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
