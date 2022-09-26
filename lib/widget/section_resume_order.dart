import 'package:flutter/material.dart';
import 'package:posbank_flutter/widget/widgets.dart';


class SectionResumeOrder extends StatelessWidget {
  const SectionResumeOrder({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
