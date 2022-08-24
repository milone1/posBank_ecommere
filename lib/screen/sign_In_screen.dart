import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/backgroundCal.gif"), 
                fit: BoxFit.fill
            ),
          ),
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  Text(
                    'ACURIO',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.width * 0.2,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        BoxShadow(
                          offset: Offset(5, 10),
                          blurRadius: 10,
                          color: Colors.blue.withOpacity(0.6),  
                          spreadRadius: 8,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 250,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.2),
                          blurRadius: 2,
                          spreadRadius: 3,
                        ),
                      ],
                    ),
                    child: Image.asset(
                        "images/favicon.ico",
                      width: 150,
                      height: 150,
                    ),
                  ),
                  SizedBox(
                    height: 250,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/products');
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            padding: EdgeInsets.all(
                              MediaQuery.of(context).size.width * 0.02,
                            ),
                            decoration: BoxDecoration(
                                color: Colors.purple.shade300,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white.withOpacity(0.4),
                                    offset: Offset(3, 3),
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
                                    'Para Pedir',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: MediaQuery.of(context).size.width*0.05,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/products');
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            padding: EdgeInsets.all(
                              MediaQuery.of(context).size.width * 0.02,
                            ),
                            decoration: BoxDecoration(
                                color: Colors.purple.shade300,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white.withOpacity(0.4),
                                    offset: Offset(3, 3),
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
                                      fontSize: MediaQuery.of(context).size.width * 0.05,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),  
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
