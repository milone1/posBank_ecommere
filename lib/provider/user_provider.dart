import 'package:flutter/material.dart';
class UserProvider with ChangeNotifier {
  String user = "";
  String methodPay = "";
  setUser(String name) {
    user = name;
    notifyListeners();
  }
  setMethodPay(String number) {
    methodPay = number;
    notifyListeners();
  }
}
