import 'package:flutter/cupertino.dart';

class CanalProvider with ChangeNotifier {
  String state = "";
  void setState(String newState) {
    state = newState;
    notifyListeners();
  }
}
