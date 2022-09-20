import 'package:flutter/cupertino.dart';

class CanalProvider with ChangeNotifier {
  
  String state = "";
  String property = "";
  void setStates(String newState) {
    state = newState;
    notifyListeners();
  }

  void setProperty(String newValue) {
    property = newValue;
    notifyListeners();
  }
}
