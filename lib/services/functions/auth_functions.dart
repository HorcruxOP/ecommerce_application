import 'dart:developer';

import 'package:ecommerce_application/services/functions/user_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthFunctions {
  static User? user = FirebaseAuth.instance.currentUser;
  static Future<void> createAccount(
    String email,
    String password,
    String fullName,
  ) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      UserFunctions.createUserDetails(
        email,
        password,
        fullName,
        credential.user!.uid,
      );
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> loginAccount(
    String email,
    String password,
  ) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      await GoogleSignIn().signOut();
    } catch (e) {
      log("Error signing out: $e");
    }
  }

  static Future<void> signInWithGoogle() async {
    try {
      await GoogleSignIn().signOut();
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
          idToken: googleAuth?.idToken, accessToken: googleAuth?.accessToken);
      var userdata =
          await FirebaseAuth.instance.signInWithCredential(credential);
      UserFunctions.createUserDetails(
        googleUser!.email,
        "",
        googleUser.displayName!,
        userdata.user!.uid,
      );
    } on FirebaseAuthException {
      rethrow;
    } catch (e) {
      log(e.toString());
    }
  }
}
