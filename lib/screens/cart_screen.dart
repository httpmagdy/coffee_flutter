import 'package:coffeeflutter/utils/custom_text.dart';
import 'package:coffeeflutter/utils/main_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2A2A2A),
        title: const Text('Your Cart'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            // Expanded(
            //   child: ListView.builder(
            //     itemCount: cart.items.values.length,
            //     itemBuilder: (ctx, i) => CartItemable(
            //       cart.items.values.toList()[i].id,
            //       cart.items.keys.toList()[i],
            //       cart.items.values.toList()[i].price,
            //       cart.items.values.toList()[i].quantity,
            //       cart.items.values.toList()[i].title,
            //     ),
            //   ),
            // ),

            Container(
              padding: EdgeInsets.all(6),
              decoration: decorationBox,
              child: CustomText(
                  text: '1',
                  textAlign: TextAlign.center,
                  fontSize: ScreenUtil().setSp(18)),
            ),

            Container(
              padding: EdgeInsets.all(6),
              decoration: decorationBox,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    'Total',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Spacer(),
                  Chip(
                    label: Text('cart'),
                    backgroundColor: Theme.of(context).accentColor,
                  ),
                  MaterialButton(
                    padding: EdgeInsets.all(0),
                    height: 34,
                    child: CustomText(text: 'Order Now', color: Colors.black),
                    color: Colors.amber,
                    onPressed: () {},
                  ),

                  // FlatButton(
                  //   child: Text('ORDER NOW'),
                  //   textColor: Theme.of(context).primaryColor,
                  //   onPressed: () {
                  //     // Provider.of<Orders>(context, listen: false).addOrder(
                  //     //   cart.items.values.toList(),
                  //     //   cart.totalAmount,
                  //     // );
                  //     // cart.clear();
                  //   },
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
