import '../utils/custom_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/widgets_build_card_coffee.dart';

class CardCoffee extends StatelessWidget {
  final String title, image, profile, notes;
  final int intensity, acidity, bitterness, body, roasting;

  CardCoffee({
    @required this.title,
    @required this.image,
    @required this.profile,
    @required this.notes,
    @required this.intensity,
    @required this.acidity,
    @required this.bitterness,
    @required this.body,
    @required this.roasting,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil.screenWidth,
      height: ScreenUtil.screenHeight,
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 1, color: Colors.grey.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: <Widget>[
          contentcardImage(
            acidity: acidity,
            bitterness: bitterness,
            body: body,
            imageUrl: image,
            roasting: roasting,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: CustomTitle(
                title: title,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              children: <Widget>[
                drawIntensity(intensity),
                SizedBox(height: 7.h),
                aromaticNotes(notes),
                SizedBox(height: 7.h),
                aromaticProfile(profile),
              ],
            ),
          ),
        ],
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
