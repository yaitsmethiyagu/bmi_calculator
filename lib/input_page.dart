import 'dart:ui';

import 'package:bmi_calculator/bmi_brain.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'card_widget.dart';
import 'icon_content.dart';
import 'constants.dart';
import 'widget_button.dart';
import 'result.dart';

enum Gender { Male, Female, none }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // Color maleCardColor = kCardBgColor;
  // Color femaleCardColor = kCardBgColor;
  Gender selectedGender = Gender.none;

  // void updateCardColor(Gender selectedGender) {
  //   if (selectedGender == Gender.Male) {
  //     if (maleCardColor == kCardBgColor) {
  //       maleCardColor = kCardBgColorActive;
  //       femaleCardColor = kCardBgColor;
  //     } else {
  //       maleCardColor = kCardBgColor;
  //     }
  //   } else if (selectedGender == Gender.Female) {
  //     if (femaleCardColor == kCardBgColor) {
  //       femaleCardColor = kCardBgColorActive;
  //       maleCardColor = kCardBgColor;
  //     } else {
  //       femaleCardColor = kCardBgColor;
  //     }
  //   }
  // }

  @override
  int heightValue = 180;
  int weightValue = 50;
  int ageValue = 18;
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.Male;
                      });
                    },
                    child: CardWidget(
                      cardBgColor: selectedGender == Gender.Male
                          ? kCardBgColorActive
                          : kCardBgColor,
                      cardChild: iconContent(
                          widgetIcon: FontAwesomeIcons.mars,
                          widgetText: "MALE"),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.Female;
                      });
                    },
                    child: CardWidget(
                      cardBgColor: selectedGender == Gender.Female
                          ? kCardBgColorActive
                          : kCardBgColor,
                      cardChild: iconContent(
                        widgetIcon: FontAwesomeIcons.venus,
                        widgetText: "FEMALE",
                      ),
                    ),
                  ),
                )
              ],
            )),
            Expanded(
                child: CardWidget(
                    cardBgColor: kCardBgColor,
                    cardChild: (Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("HEIGHT", style: kWidgetLabelStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(heightValue.toString(),
                                style: kWidgetInfoStyle),
                            Text("cm", style: TextStyle(fontSize: 20)),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: kGrey,
                            thumbColor: kAccent,
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 28),
                            overlayColor: kAccent.withAlpha(50),
                          ),
                          child: Slider(
                            value: heightValue.toDouble(),
                            min: 120,
                            max: 250,
                            onChanged: (double newValue) {
                              setState(() {
                                heightValue = newValue.round();
                              });
                            },
                          ),
                        )
                      ],
                    )))),
            Expanded(
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                  Expanded(
                    child: CardWidget(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('WEIGHT', style: kWidgetLabelStyle),
                          Text(weightValue.toString(), style: kWidgetInfoStyle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              WidgetButton(
                                iconsymbol: FontAwesomeIcons.plus,
                                onTap: () {
                                  setState(() {
                                    weightValue++;
                                  });
                                },
                                onLongPress: () {},
                              ),
                              SizedBox(width: 20),
                              WidgetButton(
                                iconsymbol: FontAwesomeIcons.minus,
                                onTap: () {
                                  setState(() {
                                    weightValue--;
                                  });
                                },
                                onLongPress: () {},
                              ),
                            ],
                          ),
                        ],
                      ),
                      cardBgColor: kCardBgColor,
                    ),
                  ),
                  Expanded(
                    child: CardWidget(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('AGE', style: kWidgetLabelStyle),
                          Text(ageValue.toString(), style: kWidgetInfoStyle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              WidgetButton(
                                iconsymbol: FontAwesomeIcons.plus,
                                onTap: () {
                                  setState(() {
                                    ageValue++;
                                  });
                                },
                                onLongPress: () {},
                              ),
                              SizedBox(width: 20),
                              WidgetButton(
                                iconsymbol: FontAwesomeIcons.minus,
                                onTap: () {
                                  setState(
                                    () {
                                      ageValue--;
                                    },
                                  );
                                },
                                onLongPress: () {},
                              ),
                            ],
                          ),
                        ],
                      ),
                      cardBgColor: kCardBgColor,
                    ),
                  ),
                ])),
            GestureDetector(
              onTap: () {
                BMIBrain bmibrain = BMIBrain(
                    height: heightValue.toDouble(),
                    weight: weightValue.toDouble(),
                    sex: selectedGender,
                    age: ageValue);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Results(
                            resultNumber: bmibrain.getBMIResults(),
                            resultText: bmibrain.getBMIAnswer(),
                            resultDescription: bmibrain.getBMIDescription())));
              },
              child: Container(
                height: 80,
                alignment: Alignment.center,
                color: kAccent,
                width: double.infinity,
                child: Text(
                  'CALCULATE',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ));
  }
}
