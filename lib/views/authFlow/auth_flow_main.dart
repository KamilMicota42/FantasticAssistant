import 'package:fantastic_assistant/cubits/AuthFlowNavigation/auth_flow_navigation.dart';
import 'package:fantastic_assistant/views/authFlow/forgot_password.dart';
import 'package:fantastic_assistant/views/authFlow/log_in.dart';
import 'package:fantastic_assistant/views/authFlow/register.dart';
import 'package:fantastic_assistant/views/authFlow/register_or_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthFlowMain extends StatelessWidget {
  const AuthFlowMain({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthFlowNavigationCubit, int>(
      builder: (context, authNavigationIndex) {
        return Scaffold(
          body: Navigator(
            pages: [
              if (authNavigationIndex == 0) const MaterialPage(child: RegisterOrLoginView()),
              if (authNavigationIndex == 1) const MaterialPage(child: RegisterView()),
              if (authNavigationIndex == 2) const MaterialPage(child: LogInView()),
              if (authNavigationIndex == 3) const MaterialPage(child: ForgotPasswordView()),
            ],
            onPopPage: (route, result) {
              return route.didPop(result);
            },
          ),
        );
      },
    );
  }
}
