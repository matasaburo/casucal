import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:casucal/models/cart.dart';
import 'package:casucal/widgets/add_item_button.dart';
import 'package:casucal/widgets/category_icon.dart';
import 'package:casucal/widgets/price_field.dart';
import 'package:casucal/widgets/discount_field.dart';
import 'package:casucal/widgets/pick_up_icon.dart';
import 'package:casucal/common/constants.dart';

class MyCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CasuCal'),
      ),
      body: Container(
        // color: Colors.white,
        child: Column(
          children: [
            CartTotal(),
            Expanded(
              child: CartList(),
            ),
          ],
        ),
      ),
      floatingActionButton: AddItemButton(),
    );
  }
}

class CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CartModel cart = context.watch<CartModel>();
    final NumberFormat priceFormatter = NumberFormat('#,###');
    final String totalPrice =
        priceFormatter.format(cart.sumDiscountedPrice).toString();

    return Container(
      color: Colors.pinkAccent[100],
      child: Container(
        height: kCartTotalRowHeight,
        child: Center(
          child: Text(
            'Total: ¥$totalPrice-',
            style: kCartTotalTextStyle,
          ),
        ),
      ),
    );
  }
}

class CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cart = context.watch<CartModel>();

    return ListView.builder(
      itemCount: cart.items.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: ObjectKey(cart.items[index]),
          onDismissed: (direction) {
            cart.del(index);
          },
          background: Container(color: Colors.pink),
          child: ItemRow(index: index),
        );
      },
    );
  }
}

class ItemRow extends StatelessWidget {
  final int index;
  ItemRow({required this.index});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CategoryIcon(index: index, width: 0.1 * size.width),
          PriceField(index: index, width: 0.30 * size.width),
          SizedBox(width: 0.01 * size.width),
          DiscountField(index: index, width: 0.23 * size.width, discountNo: 1),
          SizedBox(width: 0.01 * size.width),
          DiscountField(index: index, width: 0.23 * size.width, discountNo: 2),
          PickUpIcon(index: index, width: 0.1 * size.width),
        ],
      ),
    );
  }
}
