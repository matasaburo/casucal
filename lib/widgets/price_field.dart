import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:casucal/models/cart.dart';
import 'package:casucal/common/constants.dart';
import 'package:pattern_formatter/pattern_formatter.dart';

class PriceField extends StatelessWidget {
  final int index;
  final double width;
  PriceField({required this.index, required this.width});

  @override
  Widget build(BuildContext context) {
    CartModel cart = context.read<CartModel>();

    return Container(
      width: width,
      height: kItemRowHeight,
      child: TextFormField(
        controller: cart.items[index].priceController,
        enabled: true,
        keyboardType: TextInputType.number,
        inputFormatters: [
          ThousandsFormatter(),
        ],
        style: TextStyle(
          color: Colors.black,
          fontSize: kPriceFieldFontSize,
        ),
        decoration: InputDecoration(
          prefixText: '¥',
          suffixText: '-',
          border: OutlineInputBorder(),
        ),
        onChanged: (price) {
          cart.setItemPrice(cart.items[index], price);
        },
      ),
    );
  }
}
