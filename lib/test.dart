import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'card_widget.dart';
import 'icon_content.dart';
import 'constants.dart';

// class TestPage extends StatefulWidget {
//   @override
//   State<TestPage> createState() => _TestPageState();
// }

Color maleCardColor = kCardBgColor;
Color femaleCardColor = kCardBgColor;

class ScaffoldDrawer extends StatelessWidget {
  const ScaffoldDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BMI CALCULATOR")),
      body: Columnwidget(),
    );
  }
}

class Columnwidget extends StatefulWidget {
  const Columnwidget({Key? key}) : super(key: key);

  @override
  State<Columnwidget> createState() => _ColumnwidgetState();
}

class _ColumnwidgetState extends State<Columnwidget> {
  int heightValue = 180;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Row(
          children: [
            Expanded(
              child: CardWidget(
                cardBgColor: maleCardColor,
                cardChild: iconContent(
                    widgetIcon: FontAwesomeIcons.mars, widgetText: "MALE"),
              ),
            ),
            Expanded(
              child: CardWidget(
                cardBgColor: kCardBgColor,
                cardChild: iconContent(
                  widgetIcon: FontAwesomeIcons.venus,
                  widgetText: "FEMALE",
                ),
              ),
            )
          ],
        )),
        Expanded(
            child: CardWidget(
                cardBgColor: kCardBgColor,
                cardChild: (Column(
                  children: [
                    Text("HEIGHT", style: kWidgetLabelStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(heightValue.toString(), style: kWidgetInfoStyle),
                        Text("cm", style: TextStyle(fontSize: 20)),
                      ],
                    ),
                    Slider(
                      activeColor: kAccent,
                      inactiveColor: kGrey,
                      value: heightValue.toDouble(),
                      min: 120,
                      max: 250,
                      onChanged: (double newValue) {
                        setState(() {
                          heightValue = newValue.round();
                        });
                      },
                    )
                  ],
                )))),
      ],
    );
  }
}

// class _TestPageState extends State<TestPage> {
//   @override
//   int heightValue = 180;
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('BMI CALCULATOR'),
//         ),
//         body: Column(
//           children: [
//             Expanded(
//                 child: Row(
//               children: [
//                 Expanded(
//                   child: CardWidget(
//                     cardBgColor: maleCardColor,
//                     cardChild: iconContent(
//                         widgetIcon: FontAwesomeIcons.mars, widgetText: "MALE"),
//                   ),
//                 ),
//                 Expanded(
//                   child: CardWidget(
//                     cardBgColor: kCardBgColor,
//                     cardChild: iconContent(
//                       widgetIcon: FontAwesomeIcons.venus,
//                       widgetText: "FEMALE",
//                     ),
//                   ),
//                 )
//               ],
//             )),
//             Expanded(
//                 child: Expanded(
//                     child: CardWidget(
//                         cardBgColor: kCardBgColor,
//                         cardChild: (Column(
//                           children: [
//                             Text("HEIGHT", style: kWidgetLabelStyle),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               crossAxisAlignment: CrossAxisAlignment.baseline,
//                               textBaseline: TextBaseline.alphabetic,
//                               children: [
//                                 Text(heightValue.toString(),
//                                     style: kWidgetInfoStyle),
//                                 Text("cm", style: TextStyle(fontSize: 20)),
//                               ],
//                             ),
//                             Slider(
//                               activeColor: kAccent,
//                               inactiveColor: kGrey,
//                               value: heightValue.toDouble(),
//                               min: 120,
//                               max: 250,
//                               onChanged: (double newValue) {
//                                 setState(() {
//                                   heightValue = newValue.round();
//                                 });
//                               },
//                             )
//                           ],
//                         ))))),
//           ],
//         ));
//   }
// }
