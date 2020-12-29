// @dart=2.9
// 📦 Package imports:
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

abstract class AuthProviderBase {
  Future<FirebaseApp> initialize();
  Future<UserCredential> signInWithGoogle();
}
