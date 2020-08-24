import 'package:coffeeflutter/_routing/routes.dart';
import 'package:coffeeflutter/models/coffee.dart';
import 'package:coffeeflutter/providers/carts_prov.dart';
import 'package:coffeeflutter/utils/custom_text.dart';
import 'package:coffeeflutter/utils/custom_title.dart';
import 'package:coffeeflutter/utils/main_theme.dart';
import 'package:coffeeflutter/widgets/badge.dart';
import 'package:coffeeflutter/widgets/widgets_build_card_coffee.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatelessWidget {
  final ModelCoffee product;
  const DetailsScreen({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2A2A2A),
        actions: [
          Consumer<CartProv>(
            builder: (context, _cart, ch) => Badge(
              child: ch,
              value: _cart.itemCount.toString(),
            ),
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '$cartScreenRoute');
              },
            ),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 3, bottom: 10, top: 5),
            child: CustomTitle(title: product.title),
          ),
          _headerScreen(product),
          Padding(
            padding: const EdgeInsets.only(left: 3, bottom: 10, top: 20),
            child: CustomTitle(title: 'Price'),
          ),
          _priceAndQuantity(context),
          Padding(
            padding: const EdgeInsets.only(left: 3, bottom: 10, top: 20),
            child: CustomTitle(title: 'Description'),
          ),
          _description(product),
        ],
      ),
    );
  }

  Container _headerScreen(product) {
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
            h: 140.w,
            w: 140.w,
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

  Widget _priceAndQuantity(BuildContext context) {
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
                  text: '\$ ${product.price}',
                  fontSize: ScreenUtil().setSp(19)),
            ),
          ),
          Spacer(),
          Consumer<CartProv>(
            builder: (context, _cart, child) => FlatButton(
              color: Colors.redAccent,
              child: _cart.items.containsKey(product.id)
                  ? CustomText(text: 'Into Cart', color: Colors.red)
                  : CustomText(text: 'Add To Cart', color: Colors.white),
              onPressed: _cart.items.containsKey(product.id)
                  ? null
                  : () {
                      _cart.addItem(product.id, product.title, product.price,
                          product.image);
                    },
            ),
          )
        ],
      ),
    );
  }

  Container _description(product) {
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
