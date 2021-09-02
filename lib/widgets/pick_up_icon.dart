import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:casucal/models/cart.dart';
import 'package:casucal/common/constants.dart';

class PickUpIcon extends StatelessWidget {
  final int index;
  final double width;
  PickUpIcon({required this.index, required this.width});

  @override
  Widget build(BuildContext context) {
    CartModel cart = context.read<CartModel>();

    return Container(
      width: width,
      height: kItemRowHeight,
      child: Center(
        child: IconButton(
          icon: Icon(
            cart.items[index].isPicked ? Icons.favorite : Icons.favorite_border,
            color: cart.items[index].isPicked ? Colors.pinkAccent[100] : null,
          ),
          onPressed: () {
            cart.changePickUp(cart.items[index]);
          },
        ),
      ),
    );
  }
}
