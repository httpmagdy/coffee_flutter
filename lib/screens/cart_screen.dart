import 'package:coffeeflutter/providers/carts_prov.dart';
import 'package:coffeeflutter/utils/custom_text.dart';
import 'package:coffeeflutter/utils/custom_title.dart';
import 'package:coffeeflutter/utils/main_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProv>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2A2A2A),
        title: const Text('Your Cart'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: cart.items.values.length,
                itemBuilder: (ctx, i) => CartWidget(
                  cart.items.values.toList()[i].id,
                  cart.items.keys.toList()[i],
                  cart.items.values.toList()[i].price,
                  cart.items.values.toList()[i].quantity,
                  cart.items.values.toList()[i].title,
                  cart.items.values.toList()[i].image,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: decorationBox,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: [
                      CustomText(
                        text: 'Total Price : ',
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.bold,
                        fontSize: ScreenUtil().setSp(19),
                      ),
                      Container(
                        padding: EdgeInsets.all(6),
                        decoration: decorationBox,
                        child: CustomText(
                          text: '\$ ${cart.totalAmount}',
                          textAlign: TextAlign.center,
                          fontSize: ScreenUtil().setSp(18),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  MaterialButton(
                    padding: EdgeInsets.all(0),
                    height: 34,
                    child: CustomText(text: 'Order Now', color: Colors.black),
                    color: Colors.amber,
                    onPressed: () {
                      // Provider.of<Orders>(context, listen: false).addOrder(
                      //   cart.items.values.toList(),
                      //   cart.totalAmount,
                      // );
                      cart.clear();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CartWidget extends StatelessWidget {
  final String id;
  final String productId;
  final double price;
  final int quantity;
  final String title;
  final String image;

  CartWidget(
    this.id,
    this.productId,
    this.price,
    this.quantity,
    this.title,
    this.image,
  );

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).errorColor,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20.0),
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: const Icon(
          Icons.delete,
          size: 30.0,
          color: Colors.white,
        ),
      ),
      onDismissed: (direction) {
        Provider.of<CartProv>(context, listen: false).removeItem(productId);
      },
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('Are you sure'),
            content: Text('Do you want to remoe this item from the cart'),
            actions: <Widget>[
              FlatButton(
                child: Text('Yes'),
                onPressed: () => Navigator.pop(ctx, true),
              ),
              FlatButton(
                child: Text('No'),
                onPressed: () => Navigator.pop(ctx, false),
              ),
            ],
          ),
        );
      },
      child: _priceAndQuantity(),
    );
  }

  Container _priceAndQuantity() {
    return Container(
        margin: EdgeInsets.only(bottom: 15),
        decoration: decorationBox,
        padding: EdgeInsets.all(15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(right: 15),
              width: 70,
              height: 70,
              child: Image.asset(image),
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTitle(title: '$title'),
                  SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FittedBox(
                        child: CustomText(
                          text: '\$ $price',
                          color: Colors.red,
                        ),
                      ),
                      Container(
                        child: Consumer<CartProv>(
                          builder: (context, _cart, child) => Row(
                            children: [
                              _mButton(
                                CupertinoIcons.minus_circled,
                                () {
                                  _cart.decreaseQuan(productId);
                                },
                              ),
                              // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Container()
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: CustomText(
                                  text: _cart.getQuan(id).quantity.toString(),
                                  textAlign: TextAlign.center,
                                  fontSize: ScreenUtil().setSp(15),
                                ),
                              ),
                              _mButton(
                                CupertinoIcons.plus_circled,
                                () {
                                  _cart.increaseQuan(productId);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ));
  }

  MaterialButton _mButton(IconData icon, Function onPressed) {
    return MaterialButton(
      elevation: 0,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      minWidth: 26,
      height: 26,
      padding: EdgeInsets.all(0),
      color: Colors.white,
      child: Icon(
        icon,
        color: Colors.black,
        size: ScreenUtil().setSp(22),
      ),
      onPressed: onPressed,
    );
  }
}
