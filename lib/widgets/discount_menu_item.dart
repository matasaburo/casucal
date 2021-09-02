import 'package:flutter/material.dart';

class DiscountMenuItem extends StatelessWidget {
  final String text;
  final int? value;
  final double fontSize = 20.0;
  final String font = 'Lobster';

  DiscountMenuItem({required this.text, required this.value});

  @override
  Widget build(BuildContext context) {
    return DropdownMenuItem(
      child: Text(text, style: TextStyle(fontFamily: font, fontSize: fontSize)),
      value: value,
    );
  }
}
