import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:posbank_flutter/widget/button_pay_card.dart';
import 'package:posbank_flutter/widget/resume_order.dart';
import 'package:posbank_flutter/widget/widgets.dart';

class CreditCardsPage extends StatefulWidget {
  const CreditCardsPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CreditCardsPageState createState() => _CreditCardsPageState();
}

class _CreditCardsPageState extends State<CreditCardsPage> {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                children: const <Widget>[
                  ListCarrousel(),
                ],
              ),
            ),
            BounceInLeft(
              duration: const Duration(
                seconds: 1,
              ),
              child: const Text(
                "¡INCREÍBLES OFERTAS!",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 50,
                  color: Color(0xFFCC8053),
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        width: width * 0.90,
                        height: height * 0.35,
                        child: Center(
                          child: Column(
                            children: const <Widget>[
                              ResumeOrder(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            HeaderSection(width: width),
            const FormPay(),
            ButtonPayCard(
              context: context,
            ),
          ],
        ),
      ),
    );
  }
}
