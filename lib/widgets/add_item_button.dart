import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:casucal/models/cart.dart';
import 'package:casucal/models/item.dart';

class AddItemButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cart = context.read<CartModel>();

    return FloatingActionButton(
      backgroundColor: Colors.pink[500],
      onPressed: () {
        cart.add(
          Item(
            category: "other",
            price: 0,
            discount: 0,
            discount2: 0,
            isPicked: true,
            priceController: TextEditingController(),
          ),
        );
      },
      child: Icon(
        Icons.add_shopping_cart_rounded,
        size: 30,
      ),
    );
  }
}
