import 'package:flutter/cupertino.dart';
import 'package:provider_alone/models/catalog_model.dart';
import 'package:provider/provider.dart';

class CartModel extends ChangeNotifier {
  CatalogModel catalog = CatalogModel();

  final List<String> _cart = [];

  void add(String newItem) {
    _cart.add(newItem);
    notifyListeners();
  }
}
