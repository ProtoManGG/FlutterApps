// @dart=2.9
// 🌎 Project imports:
import 'package:chatroom/src/auth/android_auth_provider.dart';
// 📦 Package imports:
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'src/main_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await AuthProvider().initialize();
  } on FirebaseException catch (e) {
    print(e.toString());
  }
  runApp(MyApp());
}
