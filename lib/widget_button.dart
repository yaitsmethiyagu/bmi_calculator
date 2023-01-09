import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';

class WidgetButton extends StatelessWidget {
  final IconData iconsymbol;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  WidgetButton(
      {required this.iconsymbol,
      required this.onTap,
      required this.onLongPress});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(iconsymbol, color: Colors.white),
      onPressed: onTap,
      onLongPress: onLongPress,
      fillColor: kWidgetButton,
      constraints: BoxConstraints.tightFor(width: 55, height: 55),
      shape: CircleBorder(),
    );
  }
}
