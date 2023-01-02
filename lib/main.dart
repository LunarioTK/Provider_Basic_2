import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_alone/models/cart_model.dart';
import 'package:provider_alone/models/catalog_model.dart';
import 'package:provider_alone/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => CartModel())),
        Provider(create: ((context) => CatalogModel()))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const Home(),
          '/cart': (context) => const Card()
        },
      ),
    );
  }
}
