import 'package:flutter/material.dart';
class ListProvider extends ChangeNotifier {
  final List<String> _products;
  final List<bool> _checkedItems;
  final List<String> _productsList = [];
  int _totalPrice = 0;

  ListProvider(this._products)
      : _checkedItems = List.generate(_products.length, (index) => false);

  List<bool> get checkedItems => _checkedItems;
  List<String> get productsList => _productsList;
  int get totalPrice => _totalPrice;

  void buttonChange(int index) {
    int addPrice = int.parse(_products[index].split("₹").last);
    if (_checkedItems[index]) {
      _checkedItems[index] = false;
      _productsList.remove(_products[index]);
      _totalPrice -= addPrice;
    } else {
      _checkedItems[index] = true;
      _productsList.add(_products[index]);
      _totalPrice += addPrice;
    }
    notifyListeners();
  }
}
