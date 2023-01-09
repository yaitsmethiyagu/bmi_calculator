import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';

class iconContent extends StatelessWidget {
  final IconData widgetIcon;
  final String widgetText;
  iconContent(
      {this.widgetIcon = FontAwesomeIcons.mars, this.widgetText = "male"});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          widgetIcon,
          size: 80,
        ),
        SizedBox(height: 15),
        Text(
          widgetText,
          style: kWidgetLabelStyle,
        )
      ],
    );
  }
}
