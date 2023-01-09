import 'package:bmi_calculator/card_widget.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class Results extends StatelessWidget {
  Results(
      {required this.resultText,
      required this.resultNumber,
      required this.resultDescription});

  final String resultText;
  final String resultNumber;
  final String resultDescription;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Results')),
      body: Column(
        children: [
          Text(
            'Your Result',
            style: kResultTitle,
          ),
          Expanded(
            child: CardWidget(
              cardBgColor: kCardBgColor,
              cardChild: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      flex: 1,
                      child: Center(
                        child: Text(
                          resultText.toLowerCase(),
                          style: kResultText,
                          textAlign: TextAlign.center,
                        ),
                      )),
                  Expanded(
                      flex: 3,
                      child: Center(
                        child: Text(
                          resultNumber,
                          style: kResultNumber,
                          textAlign: TextAlign.center,
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: Center(
                        child: Text(
                          resultDescription,
                          style: kResultDescription,
                          textAlign: TextAlign.center,
                        ),
                      ))
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 80,
              alignment: Alignment.center,
              color: kAccent,
              width: double.infinity,
              child: Text(
                'RECALCULATE',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
