import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void logUserIn(String email, String password) async {
  try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    debugPrint(credential.toString());
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      debugPrint('!!! No user found for that email.');
    } else if (e.code == 'wrong-password') {
      debugPrint('!!! Wrong password provided for that user.');
    }
  }
}
