import 'package:flutter/material.dart';
import 'package:casucal/models/item.dart';
import 'package:casucal/screens/casu_cal_icons.dart';

class CartModel extends ChangeNotifier {
  List<Item> _items = <Item>[];
  List<Item> get items => _items;
  int get sumPrice => _calcSumPrice();
  int get sumDiscount => _calcSumDiscount();
  int get sumDiscountedPrice => _calcSumDisPrice();

  void add(Item item) {
    _items.add(item);
    notifyListeners();
  }

  void del(int index) {
    _items.removeAt(index);
    notifyListeners();
  }

  void changeItemCategory(BuildContext context, Item item) {
    final categorySelectionDialog = getCategorySelectionDialog(context, item);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return categorySelectionDialog;
      },
    );
  }

  void setItemPrice(Item item, String price) {
    if (price == "") {
      item.price = 0;
      notifyListeners();
      return;
    }
    item.price = int.parse(price.replaceAll(',', ''));
    notifyListeners();
  }

  void setItemDiscount(Item item, final discount) {
    item.discount = discount;
    notifyListeners();
  }

  void changePickUp(Item item) {
    item.isPicked = !item.isPicked;
    notifyListeners();
  }

  int _calcSumPrice() {
    int sumPrice = 0;
    for (int i = 0; i < this.items.length; i++) {
      if (_items[i].isPicked) {
        sumPrice += _items[i].price;
      }
    }
    return sumPrice;
  }

  int _calcSumDiscount() {
    int sumDiscount = 0;
    for (int i = 0; i < this.items.length; i++) {
      if (_items[i].isPicked) {
        sumDiscount += (_items[i].price * _items[i].discount / 100).round();
      }
    }
    return sumDiscount;
  }

  int _calcSumDisPrice() {
    return _calcSumPrice() - _calcSumDiscount();
  }

// helper functions
  SimpleDialog getCategorySelectionDialog(context, item) {
    return SimpleDialog(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Select category'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SimpleDialogOption(
                  child: Icon(CasuCal.tops),
                  onPressed: () {
                    item.category = 'tops';
                    notifyListeners();
                    Navigator.pop(context, item.category);
                  },
                ),
                SimpleDialogOption(
                  child: Icon(CasuCal.pants),
                  onPressed: () {
                    item.category = 'pants';
                    notifyListeners();
                    Navigator.pop(context, item.category);
                  },
                ),
                SimpleDialogOption(
                  child: Icon(CasuCal.skirt),
                  onPressed: () {
                    item.category = 'skirt';
                    notifyListeners();
                    Navigator.pop(context, item.category);
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SimpleDialogOption(
                  child: Icon(CasuCal.dress),
                  onPressed: () {
                    item.category = 'dress';
                    notifyListeners();
                    Navigator.pop(context, item.category);
                  },
                ),
                SimpleDialogOption(
                  child: Icon(CasuCal.outer),
                  onPressed: () {
                    item.category = 'outer';
                    notifyListeners();
                    Navigator.pop(context, item.category);
                  },
                ),
                SimpleDialogOption(
                  child: Icon(CasuCal.inner),
                  onPressed: () {
                    item.category = 'inner';
                    notifyListeners();
                    Navigator.pop(context, item.category);
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SimpleDialogOption(
                  child: Icon(CasuCal.suite),
                  onPressed: () {
                    item.category = 'suite';
                    notifyListeners();
                    Navigator.pop(context, item.category);
                  },
                ),
                SimpleDialogOption(
                  child: Icon(CasuCal.shoes),
                  onPressed: () {
                    item.category = 'shoes';
                    notifyListeners();
                    Navigator.pop(context, item.category);
                  },
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
