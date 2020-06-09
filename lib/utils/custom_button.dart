import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {

  final String text;
  final double width;
  CustomButton({@required this.text, this.width});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {},
      elevation: 5.0,
      textColor: Colors.white,
      padding: const EdgeInsets.all(0.0),
      child: Container(
        width: width ?? 260.0,
        height: 40.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF667EEA),
                Color(0xFF64B6FF),
              ],
            )
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: GoogleFonts.ubuntu(fontSize: 16),
        ),
      ),
    );
  }
}
