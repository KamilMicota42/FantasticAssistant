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
          if (snapshot.hasData) {
            return const HomePageView();
          } else {
            return const AuthFlowMain();
          }
        },
      ),
    );
  }
}
