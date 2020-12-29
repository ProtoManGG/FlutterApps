// @dart=2.9
// 🐦 Flutter imports:
// 🌎 Project imports:
import 'package:chatroom/src/auth/android_auth_provider.dart';
import 'package:chatroom/src/widgets/message_form.dart';
import 'package:chatroom/src/widgets/message_wall.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// 📦 Package imports:
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat Room',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({@required this.title});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _signedIn = false;
  Future<void> _signIn() async {
    try {
      final creds = await AuthProvider().signInWithGoogle();
      print(creds);

      setState(() {
        _signedIn = true;
      });
    } on Exception catch (e) {
      print("Login failed: $e");
    }
  }

  Future<void> _signOut() async {
    try {
      FirebaseAuth.instance.signOut();
      setState(() {
        _signedIn = false;
      });
    } on FirebaseException catch (e) {
      print("Logout failed: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        actions: [
          if (_signedIn)
            IconButton(
              icon: const Icon(Icons.logout, color: Colors.white),
              onPressed: _signOut,
            )
        ],
      ),
      backgroundColor: const Color(0xffdee2d6),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection('chatroom').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return MessageWall(messages: snapshot.data.docs);
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
          if (_signedIn)
            MessageForm(
              onSubmit: (value) {
                print(value);
              },
            )
          else
            Container(
              padding: const EdgeInsets.all(5),
              child: SignInButton(
                Buttons.Google,
                onPressed: _signIn,
                padding: const EdgeInsets.all(5),
              ),
            )
        ],
      ),
    );
  }
}
