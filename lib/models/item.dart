import 'package:flutter/material.dart';

class Item {
  String category = "other";
  int price = 0;
  int discount = 0;
  int discount2 = 0;
  bool isPicked = true;
  TextEditingController priceController = TextEditingController();
  // TextEditingController discountController = TextEditingController();

  Item({
    required String category,
    required int price,
    required int discount,
    required int discount2,
    required bool isPicked,
    required TextEditingController priceController,
    // required TextEditingController discountController,
  });
}
