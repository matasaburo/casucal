import 'package:flutter/material.dart';

class Item {
  String category = "other";
  int price = 0;
  int discount = 0;
  bool pickup = true;
  TextEditingController priceController = TextEditingController();
  TextEditingController discountController = TextEditingController();

  Item({
    required String category,
    required int price,
    required int discount,
    required bool pickup,
    required TextEditingController priceController,
    required TextEditingController discountController,
  });
}
