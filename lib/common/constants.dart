import 'package:flutter/material.dart';
import 'package:casucal/screens/casu_cal_icons.dart';

const double kItemRowHeight = 50.0;

const double kCartTotalRowHeight = 60.0;

const double kPriceFieldFontSize = 20.0;

const Map kIcons = {
  'tops': CasuCal.tops,
  'pants': CasuCal.pants,
  'skirt': CasuCal.skirt,
  'dress': CasuCal.dress,
  'outer': CasuCal.outer,
  'inner': CasuCal.inner,
  'suite': CasuCal.suite,
  'shoes': CasuCal.shoes,
  'other': Icons.card_giftcard_rounded,
};

const List<DropdownMenuItem<int>> kDiscountList = [
  DropdownMenuItem(
    child: Padding(
      padding: EdgeInsets.only(left: 5.0),
      child: Text('0%OFF', style: kDiscountTextStyle),
    ),
    value: 0,
  ),
  DropdownMenuItem(
    child: Padding(
      padding: EdgeInsets.only(left: 5.0),
      child: Text('10%OFF', style: kDiscountTextStyle),
    ),
    value: 10,
  ),
  DropdownMenuItem(
    child: Padding(
      padding: EdgeInsets.only(left: 5.0),
      child: Text('15%OFF', style: kDiscountTextStyle),
    ),
    value: 15,
  ),
  DropdownMenuItem(
    child: Padding(
      padding: EdgeInsets.only(left: 5.0),
      child: Text('20%OFF', style: kDiscountTextStyle),
    ),
    value: 20,
  ),
  DropdownMenuItem(
    child: Padding(
      padding: EdgeInsets.only(left: 5.0),
      child: Text('30%OFF', style: kDiscountTextStyle),
    ),
    value: 30,
  ),
  DropdownMenuItem(
    child: Padding(
      padding: EdgeInsets.only(left: 5.0),
      child: Text('40%OFF', style: kDiscountTextStyle),
    ),
    value: 40,
  ),
  DropdownMenuItem(
    child: Padding(
      padding: EdgeInsets.only(left: 5.0),
      child: Text('50%OFF', style: kDiscountTextStyle),
    ),
    value: 50,
  ),
  DropdownMenuItem(
    child: Padding(
      padding: EdgeInsets.only(left: 5.0),
      child: Text('60%OFF', style: kDiscountTextStyle),
    ),
    value: 60,
  ),
  DropdownMenuItem(
    child: Padding(
      padding: EdgeInsets.only(left: 5.0),
      child: Text('70%OFF', style: kDiscountTextStyle),
    ),
    value: 70,
  ),
  DropdownMenuItem(
    child: Padding(
      padding: EdgeInsets.only(left: 5.0),
      child: Text('80%OFF', style: kDiscountTextStyle),
    ),
    value: 80,
  ),
];

const TextStyle kDiscountTextStyle = TextStyle(
  fontFamily: 'Lobster',
  fontSize: 20.0,
  color: Colors.red,
);

const TextStyle kCartTotalTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 35,
);
