import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:casucal/models/cart.dart';
import 'package:casucal/models/item.dart';
import 'package:casucal/screens/casu_cal_icons.dart';
//import 'package:intl/intl.dart';

class MyCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('CasuCal'), //, style: Theme.of(context).textTheme.headline1),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            CartTotal(),
//            const Divider(height: 4, color: Colors.black),
            Expanded(
              child: CartList(),
            ),
          ],
        ),
      ),
      floatingActionButton: _AddItemButton(),
    );
  }
}

class CartTotal extends StatefulWidget {
  @override
  _CartTotal createState() => _CartTotal();
}

class _CartTotal extends State<CartTotal> {
  @override
  Widget build(BuildContext context) {
    var cart = context.watch<CartModel>();
    final double rowHeight = 60.0;

    String hexString = "45a3df";//color code
    Color(int.parse("0xff$hexString"));

//    String priceText = NumberFormat('#,##0').format(cart.sumDiscountedPrice.toString());

    return Container(
      color: Color(int.parse("0xff$hexString")),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: rowHeight,
            padding: EdgeInsets.only(top: 19),
            child: Text(
              "Total: ",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          Container(
            height: rowHeight,
            padding: EdgeInsets.only(top: 10),
            child: Text(
              '¥${cart.sumDiscountedPrice.toString()}',
//              '¥'+priceText,
              textAlign: TextAlign.start,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CartList extends StatefulWidget {
  @override
  _CartList createState() => _CartList();
}

class _CartList extends State<CartList> {
  @override
  Widget build(BuildContext context) {
    // CartModelの現在の状態を取得し、CartModelの状態が変化したら
    // このWidgetをリビルドするようFlutterに伝える。
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
          child: _ItemRowStatefullWidget(context: context, index: index),
        );
      },
    );
  }
}

class _AddItemButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cart = context.read<CartModel>();

    return FloatingActionButton(
      onPressed: () {
        cart.add(Item(
          category: "other",
          price: 0,
          discount: 0,
          pickup: true,
          priceController: TextEditingController(),
          discountController: TextEditingController(),
        ));
      },
      child: Icon(
        Icons.add_shopping_cart_rounded,
        size: 30,
      ),
    );
  }
}

class _ItemRowStatefullWidget extends StatefulWidget {
  final BuildContext context;
  final int index;

  _ItemRowStatefullWidget({
    required this.context,
    required this.index,
  });

  @override
  _ItemRow createState() => _ItemRow(
        context: context,
        index: index,
      );
}

class _ItemRow extends State<_ItemRowStatefullWidget> {
  final int index;
  final BuildContext context;
  List<DropdownMenuItem<int>> _discountList = [];

  _ItemRow({
    required this.context,
    required this.index,
  });

  @override
  void initState() {
    super.initState();
    setDiscountList();
  }

  @override
  Widget build(BuildContext context) {
    var cart = context.read<CartModel>();
    final Size size = MediaQuery.of(context).size;
    final double rowHeight = 50.0;
    double fontsize = 15.0;

    return Container(
      margin: EdgeInsets.only(top: 10),

      child: Row(

        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: 0.1 * size.width,
            height: rowHeight,
            child: IconButton(
              icon: Icon(iconMap[cart.items[index].category]),
              onPressed: () {
                cart.changeItemCategory(context, cart.items[index]);
              },
            ),
          ),
          Container(
            width: 0.5 * size.width,
            height: rowHeight,

            child: TextFormField(
              controller: cart.items[index].priceController, // _controller,
              enabled: true,
              keyboardType: TextInputType.number,
              style: TextStyle(color: Colors.black,fontSize: fontsize),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.pink,
                  ),
                ),
                prefixIcon: Text('￥'),
              ),
              onChanged: (price) {
                cart.setItemPrice(cart.items[index], price);
              },
            ),
          ),
          Container(
            width: 0.25 * size.width,
            height: rowHeight,
            child: DropdownButtonFormField<int>(
              value: cart.items[index].discount,
//            icon: const Icon(Icons.arrow_drop_down),
//            iconSize: 24,
//            elevation: 8,　▼消したいけど消えない？
              isExpanded: true,
              style: const TextStyle(
                  color: Colors.red,
                  decoration: TextDecoration.none //アンダーラインが消えない？
              ),
              decoration: InputDecoration( //これを入れるとテキストの下半分が消える？
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.pink,
                  ),
                ),
              ),
              onChanged: (discount) {
                cart.setItemDiscount(cart.items[index], discount);
              },
              items: _discountList,
            ),
          ),
          Container(
            width: 0.1 * size.width,
            height: rowHeight,
            child: IconButton(
              icon: Icon(
                cart.items[index].pickup ? Icons.favorite : Icons.favorite_border,
                color: cart.items[index].pickup ? Colors.red : null,
              ),
              onPressed: () {
                cart.changePickUp(cart.items[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  void setDiscountList() {
    double fontsize = 15.0;
    _discountList
      ..add(DropdownMenuItem(
        child: Text('Discount', style: TextStyle(fontSize: fontsize)),
        value: 0,
      ))
      ..add(DropdownMenuItem(
        child: Text('10% OFF', style: TextStyle(fontSize: fontsize)),
        value: 10,
      ))
      ..add(DropdownMenuItem(
        child: Text('15% OFF', style: TextStyle(fontSize: fontsize)),
        value: 15,
      ))
      ..add(DropdownMenuItem(
        child: Text('20% OFF', style: TextStyle(fontSize: fontsize)),
        value: 20,
      ))
      ..add(DropdownMenuItem(
        child: Text('25% OFF', style: TextStyle(fontSize: fontsize)),
        value: 25,
      ))
      ..add(DropdownMenuItem(
        child: Text('30% OFF', style: TextStyle(fontSize: fontsize)),
        value: 30,
      ))
      ..add(DropdownMenuItem(
        child: Text('35% OFF', style: TextStyle(fontSize: fontsize)),
        value: 35,
      ))
      ..add(DropdownMenuItem(
        child: Text('40% OFF', style: TextStyle(fontSize: fontsize)),
        value: 40,
      ))
      ..add(DropdownMenuItem(
        child: Text('45% OFF', style: TextStyle(fontSize: fontsize)),
        value: 45,
      ))
      ..add(DropdownMenuItem(
        child: Text('50% OFF', style: TextStyle(fontSize: fontsize)),
        value: 50,
      ));
  }

  static const iconMap = {
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
}
