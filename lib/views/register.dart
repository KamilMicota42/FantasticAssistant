import 'package:fantastic_assistant/utils/colors.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            MyColors.roseRed,
            MyColors.black,
          ],
          stops: [0.2192, 0.6798],
        ),
      ),
    );
  }
}
