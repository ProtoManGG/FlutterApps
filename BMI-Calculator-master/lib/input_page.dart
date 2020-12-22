import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'child_card_widget.dart';
import 'card_builder.dart';

const bottomContainerHeight = 80.0;
final cardColor = Color(0xFF101427);
final bottomContainerColor = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: CardBuilder(
                      colour: cardColor,
                      cardChild: ChildCardWidget(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                    ),
                  ),
                  Expanded(
                    child: CardBuilder(
                      colour: cardColor,
                      cardChild: ChildCardWidget(
                        icon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: CardBuilder(colour: cardColor),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: CardBuilder(colour: cardColor),
                  ),
                  Expanded(
                    child: CardBuilder(colour: cardColor),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10.0),
              height: bottomContainerHeight,
              width: double.infinity,
              color: bottomContainerColor,
            ),
          ],
        ));
  }
}
