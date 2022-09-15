import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages

class CartProvider extends ChangeNotifier {
  List<dynamic> cartList = [];
  int _counter = 0;
  int get counter => _counter;
  double _totalPrice = 0.0;
  double get totalPrice => _totalPrice;

  setCartList(Map<dynamic, dynamic> producto) {
    cartList.add(producto);
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
    return _totalPrice;
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

  addOneItem(int index) {
    cartList[index]['quantity']++;
    getPriceProduct(index);
    notifyListeners();
  }

  removeOneItem(int index) {
    cartList[index]['quantity']--;
    getPriceProduct(index);
    notifyListeners();
  }

  getPriceProduct(int index) {
    cartList[index]['productPrice'] =
        cartList[index]['quantity'] * cartList[index]['initialPrice'];
    notifyListeners();
    return cartList[index]['productPrice'];
  }

  getPriceTotal() {
    Map result =
        cartList.fold({"productPrice": 0}, (preMap, map) {
      return {"productPrice": (preMap["productPrice"]) + (map["productPrice"])};
    });
  return result['productPrice'];
  }
}
