import 'package:firebase_auth/firebase_auth.dart';

void logUserOut() {
  FirebaseAuth.instance.signOut();
}
