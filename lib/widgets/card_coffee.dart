import 'package:coffeeflutter/_routing/routes.dart';
import 'package:coffeeflutter/models/coffee.dart';
import 'package:coffeeflutter/utils/main_theme.dart';
import 'package:provider/provider.dart';

import '../utils/custom_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/widgets_build_card_coffee.dart';

class CardCoffee extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final modelCoffee = Provider.of<ModelCoffee>(context, listen: false);
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '$detailsScreenRoute',
            arguments: modelCoffee);
      },
      child: Container(
        width: ScreenUtil.screenWidth,
        height: ScreenUtil.screenHeight,
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.all(15.0),
        decoration: decorationBox,
        child: Column(
          children: <Widget>[
            contentcardImage(
              acidity: modelCoffee.acidity,
              bitterness: modelCoffee.bitterness,
              body: modelCoffee.body,
              imageUrl: modelCoffee.image,
              roasting: modelCoffee.roasting,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: CustomTitle(
                  title: modelCoffee.title,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                children: <Widget>[
                  drawIntensity(modelCoffee.intensity),
                  SizedBox(height: 7.h),
                  aromaticNotes(modelCoffee.aromaticNotes),
                  SizedBox(height: 7.h),
                  aromaticProfile(modelCoffee.aromaticProfile),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//  Widget _cupSize() {
//    return Center(
//      child: Row(
//        children: <Widget>[
//          CustomText(text: 'CUP SIZE', fontSize: ScreenUtil().setSp(11)),
//          Expanded(child: Text('')),
//          CustomText(
//              text: 'Ristretto', fontSize: ScreenUtil().setSp(11), color: Colors.grey.shade500),
//          SizedBox(width: 5.w),
//          CustomText(text: 'Espresso', fontSize: ScreenUtil().setSp(11), color: Colors.redAccent),
//          SizedBox(width: 5.w),
//          CustomText(text: 'Lungo', fontSize: ScreenUtil().setSp(11), color: Colors.grey.shade500),
//          SizedBox(width: 5.w),
//          CustomText(text: 'Milk', fontSize: ScreenUtil().setSp(11), color: Colors.redAccent),
//        ],
//      ),
//    );
//  }

//  Widget _box(String text) {
//    return Container(
//      deco
//      margin: Edgeration: BoxDecoration(
////        border: Border.all(width: 1),
////        borderRadius: BorderRadius.circular(50),
////      ),Insets.symmetric(vertical: 3),
//      alignment: Alignment.center,
//      width: 45.w,
//      height: 45.h,
//      child: CustomText(text: text, fontSize: 12),
//    );
//  }
