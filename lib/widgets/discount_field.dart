import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:casucal/models/cart.dart';
import 'package:casucal/common/constants.dart';

class DiscountField extends StatelessWidget {
  final int index;
  final int discountNo;
  final double width;
  DiscountField(
      {required this.index, required this.discountNo, required this.width});

  @override
  Widget build(BuildContext context) {
    CartModel cart = context.read<CartModel>();
    return Container(
      width: width,
      height: kItemRowHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        border: Border.all(
          color: Colors.grey.shade500,
          style: BorderStyle.solid,
          width: 1,
        ),
      ),
      child: DropdownButtonFormField<int>(
        value: discountNo == 1
            ? cart.items[index].discount
            : cart.items[index].discount2,
        icon: const Visibility(
          visible: false,
          child: Icon(Icons.arrow_drop_down),
        ),
        iconSize: 20,
        elevation: 4,
        isExpanded: true,
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
        ),
        onChanged: (discount) {
          discountNo == 1
              ? cart.setItemDiscount(cart.items[index], discount)
              : cart.setItemDiscount2(cart.items[index], discount);
        },
        items: kDiscountList,
      ),
    );
  }
}
