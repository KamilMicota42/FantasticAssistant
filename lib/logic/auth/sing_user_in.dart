import 'package:fantastic_assistant/cubits/CircularLoading/circular_loading.dart';
import 'package:fantastic_assistant/logic/auth/send_verif_mail.dart';
import 'package:fantastic_assistant/logic/snackbar/show_snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void signUserIn(String email, String password, String confirmPassword, BuildContext context) async {
  BlocProvider.of<CircularLoadingCubit>(context).turnOnCircularLoading();

  try {
    if (password == confirmPassword) {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      debugPrint('register success');
      sendVerifiMail();
      debugPrint(credential.toString());
    } else {
      showSnackBar('Password don\'t match.', context);
    }

    if (context.mounted) {
      BlocProvider.of<CircularLoadingCubit>(context).turnOffCircularLoading();
    }
  } on FirebaseAuthException catch (e) {
    showSnackBar(e.message.toString(), context);
    BlocProvider.of<CircularLoadingCubit>(context).turnOffCircularLoading();
  }
}
