import 'package:flutter/cupertino.dart';
import 'package:posbank_flutter/model/cart_model.dart';
// ignore: depend_on_referenced_packages
class CartProvider extends ChangeNotifier {  
  int _counter = 0;
  int get counter => _counter;
  double _totalPrice = 0.0;
  double get totalPrice => _totalPrice;
  late Future<List<Cart>> _cart;
  Future<List<Cart>> get cart => _cart;

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
