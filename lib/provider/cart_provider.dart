import 'package:flutter/cupertino.dart';
import 'package:posbank_flutter/db/db_helper.dart';
import 'package:posbank_flutter/model/cart_model.dart';
// ignore: depend_on_referenced_packages

class CartProvider with ChangeNotifier {
  DBHelper db = DBHelper();
  int _counter = 0;
  int get counter => _counter;
  String category = "";
  double _totalPrice = 0.0;
  double get totalPrice => _totalPrice;
  String state = "";

  late Future<List<Cart>> _cart;
  Future<List<Cart>> get cart => _cart;

  Future<List<Cart>> getData() async {
    _cart = db.getCartList();
    return _cart;
  }

  void setCategory(String categorySelected) {
    category = categorySelected;
    notifyListeners();
  }

  void setState(String newState){
    state = newState;
    notifyListeners();
  }


  void addTotalPrice(double productPrice) {
    _totalPrice = _totalPrice + productPrice;
    notifyListeners();
  }

  void removeTotalPrice(double productPrice) {
    _totalPrice = _totalPrice - productPrice;
    notifyListeners();
  }

  double getTotalPrice() {
    notifyListeners();
    return _totalPrice;
  }

  double setPriceTotal() {
    notifyListeners();
    return _totalPrice = 0;
  }

  void addCounter() {
    _counter++;
    notifyListeners();
  }

  void removerCounter() {
    _counter--;
    notifyListeners();
  }

  int getCounter() {
    return _counter;
  }
}
