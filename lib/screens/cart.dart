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
              );
            })),
      ),
    );
  }
}
