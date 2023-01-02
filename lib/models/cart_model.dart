import 'package:flutter/cupertino.dart';
import 'package:provider_alone/models/catalog_model.dart';

class CartModel extends ChangeNotifier {
  CatalogModel catalog = CatalogModel();

  final List<String> _cart = [];

  List<String> get Items => _cart;

  void add(String item) {
    _cart.add(item);
    notifyListeners();
  }

  void remove(String item) {
    _cart.remove(item);
    notifyListeners();
  }
}
