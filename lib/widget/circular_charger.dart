import 'package:flutter/material.dart';

class CircularCharger extends StatelessWidget {
  const CircularCharger({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text(
            "Cargando...",
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.black,
            ),
          ),
          SizedBox(
            width: 25,
          ),
          CircularProgressIndicator(
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
