import 'package:flutter/material.dart';
class CanalProvider with ChangeNotifier {
  String state = "";
  void setStates(String newState) {
    state = newState;
    notifyListeners();
  }
}
