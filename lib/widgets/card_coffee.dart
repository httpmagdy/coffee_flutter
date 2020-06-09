import '../utils/custom_text.dart';
import '../utils/custom_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        border: Border.all(width: 1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: <Widget>[
          Container(
            height: 100,
            child: Stack(
              children: <Widget>[
                Positioned(
                  left: 0,
                  top: 23,
                  child: _rate(
                    CrossAxisAlignment.start,
                    _tL('BITTERNESS', _valRate(bitterness, 5)),
                    _tL('BODY', _valRate(body, 5)),
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 23,
                  child: _rate(
                    CrossAxisAlignment.end,
                    _tR('ACIDITY', _valRate(acidity, 5)),
                    _tR('ROASTING', _valRate(roasting, 5)),
                  ),
                ),
                Positioned(
                  left: 1,
                  right: 1,
                  child: _cardImage(),
                ),
              ],
            ),
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
                _intensity(),
                SizedBox(height: 7.h),
                _aromaticNotes(),
                SizedBox(height: 7.h),
                _aromaticProfile(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _rate(
      CrossAxisAlignment axisAlignment, Widget childTop, Widget childBottom) {
    return Column(
      crossAxisAlignment: axisAlignment,
      children: <Widget>[
        childTop,
        SizedBox(height: 20.h),
        childBottom,
      ],
    );
  }

  Widget _tR(String text, List<Widget> value) {
    return Row(
      children: <Widget>[
        _line(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            CustomText(text: text, fontSize: ScreenUtil().setSp(11)),
            Row(children: value)
          ],
        ),
      ],
    );
  }

  Widget _tL(String text, List<Widget> value) {
    return Row(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CustomText(text: text, fontSize: ScreenUtil().setSp(11)),
            Row(children: value)
          ],
        ),
        _line(),
      ],
    );
  }

  Widget _line() {
    return Container(
      height: 1.h,
      width: 150,
      color: Colors.grey,
      margin: EdgeInsets.symmetric(horizontal: 10),
    );
  }

  List<Widget> _valRate(int count, int last, [Widget pNum]) {
    var i = 0;

    List<Widget> value = [];

    for (i; i < count; i++) {
      value.add(Icon(Icons.stop,
          size: last == 5 ? ScreenUtil().setSp(8) : ScreenUtil().setSp(11),
          color: Colors.black));
    }
    value.add(pNum ?? Text(''));
    for (i; i < last; i++) {
      value.add(Icon(Icons.stop,
          size: last == 5 ? ScreenUtil().setSp(8) : ScreenUtil().setSp(11),
          color: Colors.grey.shade400));
    }

    return value;
  }

  Widget _cardImage() {
    return Container(
      width: 100.w,
      height: 100.h,
      child: Image.network(image),
    );
  }

  Widget _intensity() {
    return Center(
      child: Row(
        children: <Widget>[
          CustomText(text: 'INTENSITY', fontSize: ScreenUtil().setSp(11)),
          Expanded(child: Text('')),
          Row(
            children: _valRate(
              intensity,
              13,
              CustomText(
                text: intensity.toString(),
                fontSize: ScreenUtil().setSp(11),
                color: Colors.redAccent,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _aromaticNotes() {
    return Center(
      child: Row(
        children: <Widget>[
          CustomText(text: 'AROMATIC NOTES', fontSize: ScreenUtil().setSp(11)),
          Expanded(child: Text('')),
          CustomText(
              text: notes,
              fontSize: ScreenUtil().setSp(11),
              color: Colors.redAccent),
        ],
      ),
    );
  }

  Widget _aromaticProfile() {
    return Center(
      child: Row(
        children: <Widget>[
          CustomText(
              text: 'AROMATIC PROFILE', fontSize: ScreenUtil().setSp(11)),
          Expanded(child: Text('')),
          CustomText(
              text: profile.toString(),
              fontSize: ScreenUtil().setSp(11),
              color: Colors.redAccent),
        ],
      ),
    );
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

}
