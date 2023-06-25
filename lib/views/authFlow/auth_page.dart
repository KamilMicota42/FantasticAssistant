import 'package:fantastic_assistant/views/authFlow/auth_flow_main.dart';
import 'package:fantastic_assistant/views/mainFlow/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          debugPrint(snapshot.data.toString());
          // user logged in
          if (snapshot.hasData) {
            debugPrint('logged in');
            return const HomePageView();
          }
          // user not logged in
          else {
            debugPrint('not logged in');
            return const AuthFlowMain();
          }
        },
      ),
    );
  }
}
