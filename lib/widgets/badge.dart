import 'package:coffeeflutter/utils/custom_text.dart';
import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  final Widget child;
  final String value;

  Badge({@required this.child, @required this.value});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        child,
        Positioned(
          right: 8,
          top: 6.5,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.redAccent,
            ),
            constraints: BoxConstraints(
              minWidth: 16,
              minHeight: 16,
            ),
            child: CustomText(
              text: value,
              textAlign: TextAlign.center,
              fontSize: 10.3,
              color: Colors.black,
            ),
          ),
        )
      ],
    );
  }
}
