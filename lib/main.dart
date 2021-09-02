import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:casucal/models/cart.dart';
import 'package:casucal/screens/cart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartModel()),
      ],
      child: MaterialApp(
        title: 'CasuCal',
        theme: ThemeData(
          fontFamily: "Lobster",
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => MyCart(),
        },
      ),
    );
  }
}
