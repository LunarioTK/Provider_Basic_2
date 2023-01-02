import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_alone/models/cart_model.dart';
import 'package:provider_alone/models/catalog_model.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider basics 2'),
      ),
      body: const _MyCatalog(),
    );
  }
}

class _MyCatalog extends StatelessWidget {
  const _MyCatalog();

  @override
  Widget build(BuildContext context) {
    var catalog = context.watch<CatalogModel>().catalogList;
    var cart = context.watch<CartModel>();
    var isInCart = context.select<CartModel, bool>(
        (cart) => cart.catalog.catalogList.contains(cart));

    return ListView.builder(
      itemCount: catalog.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(catalog[index]),
          trailing: IconButton(
            icon: isInCart ? const Icon(Icons.check) : const Icon(Icons.add),
            onPressed: (() {
              if (!isInCart) {
                cart.add(catalog[index]);
              } else {
                null;
              }
            }),
          ),
        );
      },
    );
  }
}
