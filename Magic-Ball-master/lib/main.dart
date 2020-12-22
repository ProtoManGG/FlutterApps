import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Color(0xff4CA2F5),
          appBar: AppBar(
            title: Center(
              child: Text(
                'Ask Me Anything',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
              ),
            ),
            backgroundColor: Color(0xff3158AB),
          ),
          body: magic_8_ball(),
        ),
      ),
    );

class magic_8_ball extends StatefulWidget {
  @override
  _magic_8_ballState createState() => _magic_8_ballState();
}

class _magic_8_ballState extends State<magic_8_ball> {
  int number = 1;

  @override
  Widget build(BuildContext context) {
    void numberGenerator() {
      setState(
        () {
          number = Random().nextInt(5) + 1;
        },
      );
    }

    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              onPressed: () {
                numberGenerator();
              },
              child: Image.asset('images/ball$number.png'),
            ),
          ),
        ],
      ),
    );
  }
}
