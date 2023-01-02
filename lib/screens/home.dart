import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_alone/models/cart_model.dart';
import 'package:provider_alone/models/catalog_model.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var catalog = context.watch<CatalogModel>().catalogList;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider basics 2'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
            icon: const Icon(Icons.wallet_giftcard),
          )
        ],
      ),
      body: ListView.builder(
          itemCount: catalog.length,
          itemBuilder: (context, index) {
            return _MyCatalog(item: catalog[index]);
          }),
    );
  }
}

class _MyCatalog extends StatelessWidget {
  final String item;
  const _MyCatalog({required this.item});

  @override
  Widget build(BuildContext context) {
    var cart = context.watch<CartModel>();
    var isInCart =
        context.select<CartModel, bool>((cart) => cart.Items.contains(item));

    return ListTile(
      title: Text(item),
      trailing: IconButton(
        icon: isInCart ? const Icon(Icons.check) : const Icon(Icons.add),
        onPressed: (() {
          if (!isInCart) {
            cart.add(item);
          } else {
            null;
          }
        }),
      ),
    );
  }
}
