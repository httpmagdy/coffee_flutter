import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;
  final double fontSize;
  final TextAlign textAlign;

  CustomText({
    @required this.text,
    this.color,
    this.fontWeight,
    this.fontSize,
    this.textAlign,
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.start,
      style: GoogleFonts.lato(
        color: color ?? Color(0xFF2A2A2A),
        fontSize: fontSize ?? ScreenUtil().setSp(15),
      ),
    );
  }
}