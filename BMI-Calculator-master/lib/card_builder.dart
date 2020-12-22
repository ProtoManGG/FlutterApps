import 'package:flutter/material.dart';

class CardBuilder extends StatelessWidget {
  final Color colour;
  final Widget cardChild;

  CardBuilder({@required this.colour, this.cardChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadiusDirectional.circular(10.0),
      ),
      margin: EdgeInsets.all(10.0),
    );
  }
}
