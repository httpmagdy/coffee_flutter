import 'package:coffeeflutter/models/coffee.dart';
import 'package:coffeeflutter/utils/custom_text.dart';
import 'package:coffeeflutter/utils/custom_title.dart';
import 'package:coffeeflutter/widgets/widgets_build_card_coffee.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsScreen extends StatelessWidget {
  final ModelCoffee product;
  const DetailsScreen({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey,
      ),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: [
          Container(
            padding: EdgeInsets.all(20),
            color: Colors.white,
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
          )
        ],
      ),
    );
  }
}
