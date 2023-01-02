import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_alone/models/cart_model.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    var cart = context.watch<CartModel>().Items;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
            itemCount: cart.length,
            itemBuilder: ((context, index) {
              return ListTile(
                title: Text(cart[index]),
                trailing: _Remove(item: cart[index]),
              );
            })),
      ),
    );
  }
}

class _Remove extends StatelessWidget {
  final String item;
  const _Remove({required this.item});

  @override
  Widget build(BuildContext context) {
    var remove = context.watch<CartModel>().remove;
    return IconButton(
      icon: const Icon(Icons.remove),
      onPressed: () {
        remove(item);
      },
    );
  }
}
