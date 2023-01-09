import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final Color cardBgColor;
  final Widget cardChild;
  CardWidget({
    required this.cardBgColor,
    this.cardChild = const Text(""),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsetsDirectional.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(15),
        color: cardBgColor,
      ),
    );
  }
}
