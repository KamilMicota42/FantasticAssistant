import 'package:fantastic_assistant/cubits/AuthFlowNavigation/auth_flow_navigation.dart';
import 'package:fantastic_assistant/logic/auth/sing_user_in.dart';
import 'package:fantastic_assistant/utils/colors.dart';
import 'package:fantastic_assistant/utils/styles.dart';
import 'package:fantastic_assistant/widgets/default_button.dart';
import 'package:fantastic_assistant/widgets/texture_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool _isObscure = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextureBackgroundContainer(
      child: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width - 50,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // TODO: add logo in future
              Column(
                children: [
                  const SizedBox(height: 100),
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'E-mail',
                      labelStyle: MyTextStyles.spaceGrotesk16regular400,
                    ),
                    style: MyTextStyles.spaceGrotesk16regular500,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: passwordController,
                    obscureText: _isObscure,
                    decoration: InputDecoration(
                      border: const UnderlineInputBorder(),
                      labelText: 'Password',
                      labelStyle: MyTextStyles.spaceGrotesk16regular400,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off,
                          color: MyColors.white,
                        ),
                        onPressed: () {
                          setState(
                            () {
                              _isObscure = !_isObscure;
                            },
                          );
                        },
                      ),
                    ),
                    style: MyTextStyles.spaceGrotesk16regular500,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: confirmPasswordController,
                    obscureText: _isObscure,
                    decoration: InputDecoration(
                      border: const UnderlineInputBorder(),
                      labelText: 'Confirm password',
                      labelStyle: MyTextStyles.spaceGrotesk16regular400,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off,
                          color: MyColors.white,
                        ),
                        onPressed: () {
                          setState(
                            () {
                              _isObscure = !_isObscure;
                            },
                          );
                        },
                      ),
                    ),
                    style: MyTextStyles.spaceGrotesk16regular500,
                  ),
                ],
              ),
              Column(
                children: [
                  DefaultButton(
                    text: "Register",
                    function: () {
                      signUserIn(emailController.text, passwordController.text, confirmPasswordController.text, context);
                    },
                    width: MediaQuery.of(context).size.width - 50,
                    height: 56,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Have an account?',
                        style: MyTextStyles.spaceGrotesk16regular400,
                      ),
                      TextButton(
                        onPressed: () {
                          BlocProvider.of<AuthFlowNavigationCubit>(context).setNavigationCubit(2);
                        },
                        child: const Text(
                          'Log in',
                          style: MyTextStyles.spaceGrotesk16regular500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
