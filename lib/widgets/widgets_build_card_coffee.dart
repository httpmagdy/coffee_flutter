import 'package:coffeeflutter/utils/custom_text.dart';
import 'package:coffeeflutter/utils/custom_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget contentcardImage({
  @required int bitterness,
  @required int body,
  @required int acidity,
  @required int roasting,
  @required String imageUrl,
  double w,
  double h,
  double top,
  double lineHeight,
}) {
  return Container(
    height: h ?? 100.h,
    child: Stack(
      children: <Widget>[
        Positioned(
          left: 0,
          top: top ?? 18,
          child: rate(
              CrossAxisAlignment.start,
              tL('Bitterness', valRate(bitterness, 5)),
              tL('Body', valRate(body, 5)),
              lineHeight),
        ),
        Positioned(
          right: 0,
          top: top ?? 18,
          child: rate(
              CrossAxisAlignment.end,
              tR('Acidity', valRate(acidity, 5)),
              tR('Roasting', valRate(roasting, 5)),
              lineHeight),
        ),
        Positioned(
          left: 1,
          right: 1,
          child: cardImage(imageUrl, w, h),
        ),
      ],
    ),
  );
}

Widget rate(CrossAxisAlignment axisAlignment, Widget childTop,
    Widget childBottom, double lineHeight) {
  return Column(
    crossAxisAlignment: axisAlignment,
    children: <Widget>[
      childTop,
      SizedBox(height: lineHeight ?? 20.h),
      childBottom,
    ],
  );
}

Widget tR(String text, List<Widget> value) {
  return Row(
    children: <Widget>[
      line(),
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          CustomTitle(title: text, fontSize: ScreenUtil().setSp(13)),
          Row(children: value)
        ],
      ),
    ],
  );
}

Widget tL(String text, List<Widget> value) {
  return Row(
    children: <Widget>[
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CustomTitle(title: text, fontSize: ScreenUtil().setSp(13)),
          Row(children: value)
        ],
      ),
      line(),
    ],
  );
}

Widget line() {
  return Container(
    height: 1.h,
    width: 3000.w,
    color: Colors.grey.shade300,
    margin: EdgeInsets.only(left: 10, right: 10, top: 1.5),
  );
}

List<Widget> valRate(int count, int last, [Widget pNum]) {
  var i = 0;

  List<Widget> value = [];

  for (i; i < count; i++) {
    value.add(Icon(Icons.stop,
        size: last == 5 ? ScreenUtil().setSp(9) : ScreenUtil().setSp(12),
        color: Colors.black));
  }
  value.add(pNum ?? Text(''));
  for (i; i < last; i++) {
    value.add(Icon(Icons.stop,
        size: last == 5 ? ScreenUtil().setSp(9) : ScreenUtil().setSp(12),
        color: Colors.grey.shade400));
  }

  return value;
}

Widget cardImage(String image, double w, double h) {
  return Container(
    width: w ?? 100.w,
    height: h ?? 100.h,
    child: Image.asset(image),
  );
}

Widget drawIntensity(int intensity, {double sizeText}) {
  return Center(
    child: Row(
      children: <Widget>[
        CustomTitle(
            title: 'Intensity', fontSize: sizeText ?? ScreenUtil().setSp(13)),
        Spacer(),
        Row(
          children: valRate(
            intensity,
            13,
            CustomText(
              text: intensity.toString(),
              fontSize: ScreenUtil().setSp(12),
              color: Colors.redAccent,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget aromaticNotes(String notes, {double sizeText}) {
  return Center(
    child: Row(
      children: <Widget>[
        CustomTitle(
            title: 'Aromatic Notes',
            fontSize: sizeText ?? ScreenUtil().setSp(13)),
        Spacer(),
        CustomText(
            text: notes,
            fontSize: ScreenUtil().setSp(12),
            color: Colors.redAccent),
      ],
    ),
  );
}

Widget aromaticProfile(String profile, {double sizeText}) {
  return Center(
    child: Row(
      children: <Widget>[
        CustomTitle(
            title: 'Aromatic Profile',
            fontSize: sizeText ?? ScreenUtil().setSp(13)),
        Spacer(),
        CustomText(
            text: profile.toString(),
            fontSize: ScreenUtil().setSp(12),
            color: Colors.redAccent),
      ],
    ),
  );
}
