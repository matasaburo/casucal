import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:casucal/models/cart.dart';
import 'package:casucal/common/constants.dart';

class CategoryIcon extends StatelessWidget {
  final int index;
  final double width;
  CategoryIcon({required this.index, required this.width});

  @override
  Widget build(BuildContext context) {
    CartModel cart = context.read<CartModel>();

    return Container(
      width: width,
      height: kItemRowHeight,
      child: Center(
        child: IconButton(
          icon: Icon(kIcons[cart.items[index].category]),
          onPressed: () {
            cart.changeItemCategory(context, cart.items[index]);
          },
        ),
      ),
    );
  }
}
