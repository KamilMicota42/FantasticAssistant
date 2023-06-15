import 'package:fantastic_assistant/cubits/MainNavigation/main_navigation.dart';
import 'package:fantastic_assistant/utils/colors.dart';
import 'package:fantastic_assistant/utils/styles.dart';
import 'package:fantastic_assistant/widgets/default_button.dart';
import 'package:fantastic_assistant/widgets/texture_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return TextureBackgroundContainer(
      child: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width - 50,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // TODO: add logo in future
              Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'E-mail',
                      labelStyle: MyTextStyles.spaceGrotesk16regular400,
                    ),
                    style: MyTextStyles.spaceGrotesk16regular500,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
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
                    obscureText: _isObscure,
                    decoration: InputDecoration(
                      border: const UnderlineInputBorder(),
                      labelText: 'Repeat password',
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
                    text: "Sign in",
                    function: () {
                      BlocProvider.of<MainNavigationCubit>(context).setMainNavigationIndex(1);
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
                        onPressed: () {},
                        child: const Text(
                          'Log in',
                          style: MyTextStyles.spaceGrotesk16regular500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
