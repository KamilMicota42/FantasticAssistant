import 'package:firebase_auth/firebase_auth.dart';

Future<void> sendVerifiMail() async {
  User? user = FirebaseAuth.instance.currentUser;
  if (user != null && !user.emailVerified) {
    await user.sendEmailVerification();
  }
}

bool? checkIfVerified() {
  User? user = FirebaseAuth.instance.currentUser;
  print(user?.emailVerified);
  return user?.emailVerified;
}
