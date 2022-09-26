import 'package:flutter/cupertino.dart';

class CanalProvider with ChangeNotifier {
  String state = "";

  String user = "";

  void setStates(String newState) {
    state = newState;
    notifyListeners();
  }

  void setUser(String name) {
    user = name;
    notifyListeners();
  }
}
