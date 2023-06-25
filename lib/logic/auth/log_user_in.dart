import 'package:fantastic_assistant/cubits/CircularLoading/circular_loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void logUserIn(String email, String password, BuildContext context) async {
  BlocProvider.of<CircularLoadingCubit>(context).turnOnCircularLoading();

  try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    debugPrint(credential.toString());

    if (context.mounted) {
      BlocProvider.of<CircularLoadingCubit>(context).turnOffCircularLoading();
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      debugPrint('!!! No user found for that email.');
    } else if (e.code == 'wrong-password') {
      debugPrint('!!! Wrong password provided for that user.');
    }
    BlocProvider.of<CircularLoadingCubit>(context).turnOffCircularLoading();
  }
}
