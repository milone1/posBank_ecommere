import 'package:flutter/material.dart';
import 'package:posbank_flutter/components/title_pay_screen.dart';
import 'package:posbank_flutter/widget/button_pay_card.dart';
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

            const TitlePayScreen(),

            const FormPay(),

            HeaderSection(width: width),

            SectionResumeOrder(width: width, height: height),

            ButtonPayCard( context: context ),
          ],
        ),
      ),
    );
  }
}

