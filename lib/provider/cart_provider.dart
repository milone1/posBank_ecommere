import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  List cartList = [];
  final double _totalPrice = 0.0;
  double get totalPrice => _totalPrice;

  setCartList(Map<String, dynamic> producto) {
    cartList.add(producto);
    notifyListeners();
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

  setAggregator(Map<String, dynamic> aggregator, id) {
    cartList.forEach((element) {
      if (element['id'] == id) {
        element['aggregator'].add(aggregator);
        // notifyListeners();
      }
      // notifyListeners();
    });
    notifyListeners();
  }

  
  addOrRemoveAggregator(index, value) {
    if (value == 'add') {
      cartList[index]['quantity']++;

      notifyListeners();
    } else {
      cartList[index]['quantity']--;

      notifyListeners();
    }
  }
}
