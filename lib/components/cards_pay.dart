import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:posbank_flutter/provider/provider.dart';
class CardPage extends StatelessWidget {
  const CardPage({
    Key? key,
    required this.width,
    required this.height,
    required this.title,
    required this.textTitle,
    required this.textPay,
    required this.imgPath,
  }) : super(key: key);
  final double width;
  final double height;
  final String title;
  final String textTitle;
  final String textPay;
  final String imgPath;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    final textControllerName = TextEditingController();
    final textControllerNumber = TextEditingController();
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            offset: const Offset(3, 3),
            spreadRadius: 8,
            blurRadius: 8,
          ),
        ],
        color: const Color(0xff0099DD),
        border: Border.all(
          color: Colors.black,
        ),
      ),
      width: width * 0.35,
      height: height * 0.10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              showCupertinoDialog( 
                context: context,
                builder: (_) {
                  return CupertinoAlertDialog(
                    title: Text(user.user),
                    content: Column(
                      children: <Widget>[
                        Text(textTitle),
                        CupertinoTextField(
                          controller: textControllerName,
                        ),
                        const SizedBox(
                          height: 50.0,
                        ),
                        Text(textPay),
                        CupertinoTextField(
                          controller: textControllerNumber,
			  keyboardType: TextInputType.number, 
                        ),
                      ],
                    ),
                    actions: <Widget>[
                      CupertinoDialogAction(
                        isDefaultAction: true,
                        child: const Text('Pagar'),
                        onPressed: () {
                          user.setUser(textControllerName.text);
                          user.setMethodPay(textControllerNumber.text);
                          Navigator.pop(context);
                        },
                      ),
                      CupertinoDialogAction(
                        isDestructiveAction: true,
                        child: const Text('Salir'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  );
                },
              );
            },
            child: Image.asset(
              imgPath,
              width: 300,
              height: 120,
            ),
          ),
        ],
      ),
    );
  }
}
