import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.red[600],
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 80.0,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('images/success.png'),
              ),
              Text(
                'Pranav Taneja',
                style: TextStyle(
                  fontFamily: 'Srisakdi',
                  color: Colors.white,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'FLUTTER DEVELOPER',
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  color: Colors.redAccent.shade100,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 5.0,
                ),
              ),
              SizedBox(
                height: 20.0,
                width: 150.0,
                child: Divider(
                  color: Colors.redAccent.shade100,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(
                    horizontal: 25.0,
                  ),
                  child: ListTile(
                    title: Text(
                      '+44 123 456 789',
                      style: TextStyle(
                        color: Colors.red.shade900,
                        fontFamily: 'Pacifico',
                        fontSize: 20.0,
                      ),
                    ),
                    leading: Icon(
                      Icons.phone,
                      color: Colors.red.shade900,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(
                    horizontal: 25.0,
                  ),
                  child: ListTile(
                    title: Text(
                      'protoman@email.com',
                      style: TextStyle(
                        color: Colors.red.shade900,
                        fontFamily: 'Pacifico',
                        fontSize: 20.0,
                      ),
                    ),
                    leading: Icon(
                      Icons.email,
                      color: Colors.red.shade900,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
