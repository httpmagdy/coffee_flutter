import 'package:coffeeflutter/_routing/routes.dart';
import 'package:coffeeflutter/models/coffee.dart';
import 'package:coffeeflutter/providers/cart_prov.dart';
import 'package:coffeeflutter/utils/custom_text.dart';
import 'package:coffeeflutter/utils/custom_title.dart';
import 'package:coffeeflutter/utils/main_theme.dart';
import 'package:coffeeflutter/widgets/badge.dart';
import 'package:coffeeflutter/widgets/widgets_build_card_coffee.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'cart_screen.dart';

class DetailsScreen extends StatelessWidget {
  final ModelCoffee product;
  const DetailsScreen({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final cart = Provider.of<CartProv>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2A2A2A),
        actions: [
          Badge(
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '$cartScreenRoute');
              },
            ),
            value: '3',
          )

          // Consumer<CartProv>(
          //   builder: (_, cart, ch) => Badge(
          //     child: ch,
          //     value: '3',
          //   ),
          //   child: IconButton(
          //     icon: Icon(
          //       Icons.shopping_cart,
          //     ),
          //     onPressed: () {
          //       Navigator.pushNamed(context, '$cartScreenRoute');
          //     },
          //   ),
          // ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 3, bottom: 10, top: 5),
            child: CustomTitle(title: product.title),
          ),
          _headerScreen(),
          Padding(
            padding: const EdgeInsets.only(left: 3, bottom: 10, top: 20),
            child: CustomTitle(title: 'Price & Cuantity'),
          ),
          _priceAndQuantity(),
          Padding(
            padding: const EdgeInsets.only(left: 3, bottom: 10, top: 20),
            child: CustomTitle(title: 'Description'),
          ),
          _description(),
        ],
      ),
    );
  }

  Container _headerScreen() {
    return Container(
      decoration: decorationBox,
      padding: EdgeInsets.all(15),
      child: Column(
        children: <Widget>[
          contentcardImage(
            acidity: product.acidity,
            bitterness: product.bitterness,
            body: product.body,
            imageUrl: product.image,
            roasting: product.roasting,
            h: 150.w,
            w: 150.w,
            top: 30,
            lineHeight: 29.h,
          ),
          SizedBox(height: 30.h),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              children: <Widget>[
                drawIntensity(product.intensity, sizeText: 13),
                SizedBox(height: 7.h),
                aromaticNotes(product.aromaticNotes, sizeText: 13),
                SizedBox(height: 7.h),
                aromaticProfile(product.aromaticProfile, sizeText: 13),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _priceAndQuantity() {
    return Container(
      decoration: decorationBox,
      padding: EdgeInsets.all(15),
      child: Row(
        children: [
          FittedBox(
            child: Container(
              padding: EdgeInsets.all(6),
              decoration: decorationBox,
              child: CustomText(
                  text: '199.0 \$', fontSize: ScreenUtil().setSp(19)),
            ),
          ),
          Spacer(),
          MaterialButton(
            minWidth: 34,
            height: 34,
            padding: EdgeInsets.all(0),
            color: Colors.black,
            child: Icon(
              CupertinoIcons.minus_circled,
              color: Colors.white,
              size: 23,
            ),
            onPressed: () {},
          ),
          Container(
            padding: EdgeInsets.all(6),
            decoration: decorationBox,
            child: CustomText(
                text: '1',
                textAlign: TextAlign.center,
                fontSize: ScreenUtil().setSp(18)),
          ),
          MaterialButton(
            minWidth: 34,
            height: 34,
            padding: EdgeInsets.all(0),
            color: Colors.black,
            child: Icon(
              CupertinoIcons.plus_circled,
              color: Colors.white,
              size: ScreenUtil().setSp(23),
            ),
            onPressed: () {},
          ),
          SizedBox(width: 10),
          MaterialButton(
            padding: EdgeInsets.all(0),
            height: 34,
            child: CustomText(text: 'Order Now', color: Colors.black),
            color: Colors.amber,
            onPressed: () {},
          )
        ],
      ),
    );
  }

  Container _description() {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: decorationBox,
      child: CustomText(
        fontSize: ScreenUtil().setSp(16.5),
        color: Color(0XFF505050),
        text: product.description,
      ),
    );
  }
}
