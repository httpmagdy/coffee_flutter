import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTitle extends StatelessWidget {
  final String title;
  final Color color;
  final FontWeight fontWeight;
  final double fontSize;
  final TextAlign textAlign;

  CustomTitle({
    @required this.title,
    this.color,
    this.fontWeight,
    this.fontSize,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign ?? TextAlign.start,
      style: GoogleFonts.ubuntu(
        color: color ?? Colors.black,
        fontWeight: fontWeight ,
        fontSize: fontSize ?? ScreenUtil().setSp(22),
      ),
    );
  }
}