// @dart=2.9

import 'package:chatroom/src/auth/auth_provider_base.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

class _AndroidAuthProvider implements AuthProviderBase {
  @override
  Future<FirebaseApp> initialize() async {
    return Firebase.initializeApp(
      name: 'Chat Room',
      options: const FirebaseOptions(
        apiKey: "AIzaSyAZeSfiXcHR4b7MOiPmQirrD_3UndCfoww",
        authDomain: "chatroom-9cffe.firebaseapp.com",
        projectId: "chatroom-9cffe",
        storageBucket: "chatroom-9cffe.appspot.com",
        messagingSenderId: "596173814757",
        appId: "1:596173814757:android:865284aa7a234968eccd0c",
      ),
    );
  }

  @override
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(credential);
  }
}

class AuthProvider extends _AndroidAuthProvider {

}
