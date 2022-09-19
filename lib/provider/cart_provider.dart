import 'package:flutter/material.dart';
import 'package:posbank_flutter/model/order_model.dart';
// ignore: depend_on_referenced_packages

class CartProvider extends ChangeNotifier {
  List cartList = [];
  int _counter = 0;
  int get counter => _counter;
  final double _totalPrice = 0.0;
  double get totalPrice => _totalPrice;
  String state = 'Helada';

  void setValue(String newState) {
    state = newState;
    notifyListeners();
  }

  setCartList(Map<String, dynamic> producto) {
    cartList.add(producto);
    notifyListeners();
  }

  double getTotalPrice() {
    return _totalPrice;
  }

  void removerCounter() {
    _counter--;
    notifyListeners();
  }

  int getCounter() {
    return _counter;
  }

  addOrRemoveItem(index, value) {
    if (value == 'add') {
      cartList[index]['quantity']++;
      getPriceProduct(index);
      notifyListeners();
    } else {
      cartList[index]['quantity']--;
      getPriceProduct(index);
      notifyListeners();
    }
  }

  getPriceProduct(int index) {
    cartList[index]['productPrice'] =
        cartList[index]['quantity'] * cartList[index]['initialPrice'];
    notifyListeners();
    return cartList[index]['productPrice'];
  }

  getPriceTotal() {
    Map result = cartList.fold({"productPrice": 0}, (preMap, map) {
      return {"productPrice": (preMap["productPrice"]) + (map["productPrice"])};
    });
    notifyListeners();
    return result['productPrice'];
  }

  deleteElement(id) {
    cartList.removeWhere((product) {
      return product['id'] == id;
    });
    getPriceTotal();
    notifyListeners();
  }

  clearCart() {
    cartList = [];
    notifyListeners();
    return cartList;
  }
}
